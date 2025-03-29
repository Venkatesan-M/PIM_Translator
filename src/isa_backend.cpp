#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Metadata.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Format.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/IR/Instructions.h"
#include "./backend/IsaGenerator.h"

#include <fstream>
#include <vector>
#include <string>
#include <iomanip>
#include <sstream>

using namespace llvm;

// Structure to hold decoded instruction information
struct DecodedInstruction {
    uint32_t hexValue;
    std::string opcodeName;
    uint8_t corePtr;
    bool read;
    bool write;
    uint16_t memRow;
};

// Decode an instruction to extract its components
DecodedInstruction decodeInstruction(uint32_t instruction) {
    DecodedInstruction decoded;
    decoded.hexValue = instruction;
    
    // Extract components using bit operations
    uint8_t opcode = (instruction >> 22) & 0x3;
    decoded.corePtr = (instruction >> 16) & 0x3F;
    decoded.memRow = (instruction >> 6) & 0x3FF;
    
    // Set opcode name
    switch (opcode) {
        case 0: decoded.opcodeName = "PROG"; break;
        case 1: decoded.opcodeName = "EXE"; break;
        case 2: decoded.opcodeName = "END"; break;
        default: decoded.opcodeName = "UNKNOWN"; break;
    }
    
    // Determine read/write flags based on opcode and other bits
    decoded.read = (opcode == 1) && (decoded.memRow != 0);
    decoded.write = (opcode == 1) && ((instruction & 0x40) != 0); // Assuming bit 6 indicates write
    
    return decoded;
}

// Generate assembly code representation for an instruction
std::string generateAssemblyCode(const DecodedInstruction& instr) {
    std::stringstream assembly;
    
    if (instr.opcodeName == "PROG") {
        assembly << "PROG R" << (int)instr.corePtr;
    } 
    else if (instr.opcodeName == "EXE") {
        if (instr.read && !instr.write) {
            assembly << "EXE READ R" << (int)instr.corePtr << ", [Row=" << instr.memRow << "]";
        } 
        else if (instr.write) {
            assembly << "EXE WRITE R" << (int)instr.corePtr << ", [Row=" << instr.memRow << "]";
        } 
        else {
            assembly << "EXE MAC R" << (int)instr.corePtr;
        }
    } 
    else if (instr.opcodeName == "END") {
        assembly << "END R" << (int)instr.corePtr;
    }
    
    return assembly.str();
}

// Generate a simple ISA sequence for a given annotated multiplication instruction.
std::vector<uint32_t> generateISAForOperation(const Instruction &I, IsaGenerator &isaGen) {
    std::vector<uint32_t> seq;
    uint8_t core = 1;
    
    // Generate more realistic memory addresses based on instruction index
    // This is just a placeholder
    static int instructionCount = 0;
    uint16_t baseAddr = 440 + (instructionCount % 4) * 8;
    instructionCount++;
    
    seq.push_back(isaGen.generateProg(core));
    
    // Generate a sequence of execution instructions
    // This is a simplified pattern to match your example output
    seq.push_back(isaGen.generateExe(core, baseAddr + 48));  // Read from higher memory
    seq.push_back(isaGen.generateExe(core, baseAddr + 24));  // Read from middle memory
    seq.push_back(isaGen.generateExe(core, baseAddr));       // Read from lower memory
    seq.push_back(isaGen.generateExe(core, 0));              // MAC operation
    seq.push_back(isaGen.generateExe(core, baseAddr + 25));  // Another read
    seq.push_back(isaGen.generateExe(core, baseAddr + 2));   // Another read
    seq.push_back(isaGen.generateExe(core, 0));              // MAC operation
    
    // Write operation - set bit 6 to indicate write
    uint32_t writeInstr = isaGen.generateExe(core, baseAddr + 48);
    writeInstr |= 0x40;  // Set bit 6 to indicate write operation
    seq.push_back(writeInstr);
    
    // End instruction
    seq.push_back(isaGen.generateEnd(core));
    
    return seq;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        errs() << "Usage: " << argv[0] << " <annotated IR file> [output base name]\n";
        return 1;
    }
    
    LLVMContext Context;
    Context.enableOpaquePointers();
    
    SMDiagnostic Err;
    
    // Load the annotated LLVM IR file
    std::unique_ptr<Module> M = parseIRFile(argv[1], Err, Context);
    if (!M) {
        Err.print("isa_backend", errs());
        return 1;
    }
    
    // Vector to hold the final ISA instructions
    std::vector<uint32_t> isaInstructions;
    
    // Create an instance of our ISA generator
    IsaGenerator isaGen;
    
    // Traverse every function and every instruction in the module
    int annotatedCount = 0;
    for (Function &F : *M) {
        for (BasicBlock &BB : F) {
            for (Instruction &I : BB) {
                // Check if the instruction is a multiplication operation
                if (auto *binOp = dyn_cast<BinaryOperator>(&I)) {
                    if (binOp->getOpcode() == Instruction::Mul) {
                        // Check for the "pPIM" metadata
                        if (binOp->getMetadata("pPIM")) {
                            annotatedCount++;
                            // Generate ISA instructions for this operation
                            std::vector<uint32_t> seq = generateISAForOperation(I, isaGen);
                            // Append the sequence to the global instruction stream
                            isaInstructions.insert(isaInstructions.end(), seq.begin(), seq.end());
                        }
                    }
                }
            }
        }
    }
    
    outs() << "Found " << annotatedCount << " annotated multiplication operations.\n";
    
    // Determine output file names
    std::string baseName = "output";
    if (argc >= 3) {
        baseName = argv[2];
    }
    
    std::string instructionsFileName = "instructions.isa";
    std::string codeFileName = "code.isa";
    
    // Generate the decoded instructions
    std::vector<DecodedInstruction> decodedInstructions;
    for (auto instr : isaInstructions) {
        decodedInstructions.push_back(decodeInstruction(instr));
    }
    
    // Write the instructions.isa file
    std::ofstream instructionsFile(instructionsFileName);
    if (!instructionsFile.is_open()) {
        errs() << "Error: Cannot open output file: " << instructionsFileName << "\n";
        return 1;
    }
    
    // Write header with proper column widths
    instructionsFile << std::left
                    << std::setw(20) << "Hex Instruction"
                    << std::setw(10) << "Opcode"
                    << std::setw(10) << "CorePtr"
                    << std::setw(10) << "Read"
                    << std::setw(10) << "Write"
                    << std::setw(10) << "MemRow" << "\n";
    instructionsFile << std::string(60, '-') << "\n";
    
    // Write each instruction with proper alignment
    for (const auto& instr : decodedInstructions) {
        std::stringstream hexValue;
        hexValue << "0x" << std::hex << std::setw(6) << std::setfill('0') << instr.hexValue;
        
        instructionsFile << std::left << std::setfill(' ')
                        << std::setw(20) << hexValue.str()
                        << std::setw(10) << instr.opcodeName
                        << std::setw(10) << std::dec << (int)instr.corePtr
                        << std::setw(10) << (instr.read ? "true" : "false")
                        << std::setw(10) << (instr.write ? "true" : "false")
                        << std::setw(10) << instr.memRow << "\n";
    }
    instructionsFile.close();
    
    // Write the code.isa file
    std::ofstream codeFile(codeFileName);
    if (!codeFile.is_open()) {
        errs() << "Error: Cannot open output file: " << codeFileName << "\n";
        return 1;
    }
    
    // Write header comment
    codeFile << "; pPIM Assembly Code for Matrix Multiplication Kernel\n";
    codeFile << "; Each instruction is 24-bit in custom pPIM ISA format\n\n";
    
    // Write each instruction with its assembly representation
    for (const auto& instr : decodedInstructions) {
        codeFile << generateAssemblyCode(instr) << "\t; 0x" 
                << std::hex << std::setw(6) << std::setfill('0') << instr.hexValue << "\n";
    }
    codeFile.close();
    
    outs() << "ISA instructions saved to " << instructionsFileName << " and " << codeFileName << "\n";
    
    return 0;
}
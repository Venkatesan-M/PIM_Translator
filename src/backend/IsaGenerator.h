#ifndef ISA_GENERATOR_H
#define ISA_GENERATOR_H

#include <cstdint>
#include <vector>

// Define opcodes for instructions
enum Opcode {
    OP_PROG = 0, // LUT Programming
    OP_EXE  = 1, // Compute operation (e.g., MAC)
    OP_END  = 2  // Termination of an operation block
};

// Pack fields into a 24-bit instruction word.
// Layout (from MSB to LSB):
//   - opcode: 2 bits
//   - core pointer: 6 bits
//   - memory address: 10 bits
//   - reserved/extra: 6 bits
static inline uint32_t formatInstruction(uint8_t opcode, uint8_t corePtr, uint16_t memAddress, uint8_t extra = 0) {
    return ((opcode & 0x3) << 22) | ((corePtr & 0x3F) << 16) | ((memAddress & 0x3FF) << 6) | (extra & 0x3F);
}

class IsaGenerator {
public:
    IsaGenerator();
    ~IsaGenerator();

    // Generate instructions for a matrix multiplication kernel.
    // N: dimension of the matrix (assumed square)
    // base_A, base_B, base_C: base DRAM row addresses for matrices A, B, and C.
    std::vector<uint32_t> generateMatMulInstructions(int N, uint16_t base_A, uint16_t base_B, uint16_t base_C);
    
    // Make these methods public so they can be called from generateISAForOperation
    uint32_t generateProg(uint8_t coreId);
    uint32_t generateExe(uint8_t coreId, uint16_t memAddress);
    uint32_t generateEnd(uint8_t coreId);
};

#endif // ISA_GENERATOR_H
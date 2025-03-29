// File: src/backend/IsaGenerator.cpp
#include "IsaGenerator.h"

IsaGenerator::IsaGenerator() {
    // Any necessary initialization.
}

IsaGenerator::~IsaGenerator() {
    // Cleanup if required.
}

uint32_t IsaGenerator::generateProg(uint8_t coreId) {
    // For programming instructions, we don’t need a memory address.
    return formatInstruction(OP_PROG, coreId, 0);
}

uint32_t IsaGenerator::generateExe(uint8_t coreId, uint16_t memAddress) {
    return formatInstruction(OP_EXE, coreId, memAddress);
}

uint32_t IsaGenerator::generateEnd(uint8_t coreId) {
    return formatInstruction(OP_END, coreId, 0);
}

std::vector<uint32_t> IsaGenerator::generateMatMulInstructions(int N, uint16_t base_A, uint16_t base_B, uint16_t base_C) {
    std::vector<uint32_t> instructions;

    // -------------------------------
    // Programming Phase: Program all cores in the cluster.
    // For a MAC operation, assume a fixed configuration:
    // (e.g., cores 0-3 for multiplication, cores 4-8 for addition/accumulation)
    // -------------------------------
    for (uint8_t core = 0; core < 9; ++core) {
        instructions.push_back(generateProg(core));
    }

    // -------------------------------
    // Execution Phase: For each output element in C,
    // generate a sequence of instructions that (a) initialize an accumulator,
    // (b) load operands from matrices A and B,
    // (c) perform multiplication (MAC sequence), and (d) write back the result.
    // -------------------------------
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            // Example: Initialize accumulator for C[i][j] using a designated core (say, core 4).
            instructions.push_back(generateExe(4, base_C + i));

            for (int k = 0; k < N; ++k) {
                // Generate instructions to load operands:
                // Load A[i][k] (assume core 0)
                instructions.push_back(generateExe(0, base_A + (i * N + k)));
                // Load B[k][j] (assume core 1)
                instructions.push_back(generateExe(1, base_B + (k * N + j)));
                // Perform multiplication (this is a placeholder for the MAC sequence)
                instructions.push_back(generateExe(0, base_A + (i * N + k)));
                // Accumulate result into C[i][j] (using core 4)
                instructions.push_back(generateExe(4, base_C + i));
            }
            // Terminate the instruction sequence for this output element.
            instructions.push_back(generateEnd(4));
        }
    }
    return instructions;
}

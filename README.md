# PIM Translator

## Overview

The PIM Translator is a custom compiler for a DRAM-based Processing-in-Memory (PIM) architecture that translates high-level C++ code (matrix multiplication) into a stream of custom 24-bit ISA instructions. The compiler leverages LLVM/Clang to generate and annotate LLVM IR, then applies custom backend passes to map and schedule instructions for a PIM architecture with near-subarray computing. This enables efficient execution of AI/ML kernels directly within DRAM.

## Features

- Converts C++ matrix multiplication programs into LLVM IR.
- Custom LLVM pass to annotate multiplication operations for PIM.
- Generates a 24-bit fixed-length instruction stream for a PIM ISA.
- Integrates DRAM physical memory mapping and scheduling.
- Outputs two assembly files: a detailed instruction table and an assembly-like listing.

## Tech Stack

![C++](https://img.shields.io/badge/C++-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)
![LLVM](https://img.shields.io/badge/LLVM-FF6600?style=for-the-badge&logo=llvm&logoColor=white)
![Clang](https://img.shields.io/badge/Clang-00599C?style=for-the-badge&logo=clang&logoColor=white)
![CMake](https://img.shields.io/badge/CMake-064F8C?style=for-the-badge&logo=cmake&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)

## Prerequisites

### System Requirements

- C++ Compiler (e.g., Clang or GCC)
- LLVM/Clang (tested with Clang 19.1.7 / LLVM 14.0.0)
- CMake (version 3.10 or higher)
- Git

### Quick Setup (Linux / macOS / Windows)

#### Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install cmake gcc libboost-all-dev libssl-dev git


# Generalised
```sh
clang++ -S -emit-llvm src/frontend/matrix_mult.cpp -o matrix_mult.ll
```
# Optimised
```sh
clang++ -S -emit-llvm -O2 src/frontend/matrix_mult.cpp -o matrix_mult.ll
```

clang++-14 -S -emit-llvm src/frontend/matrix_mult.cpp -o matrix_mult.ll

./compiler_frontend ../matrix_mult.ll > annotated_matrix_mult.ll

./isa_backend ./annotated_matrix_mult.ll

rm -rf build/
mkdir build && cd build
cmake ..
make -j$(nproc)

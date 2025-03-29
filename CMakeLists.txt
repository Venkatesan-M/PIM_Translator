cmake_minimum_required(VERSION 3.10)
project(PIM_Translator)

find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

# 🔹 Compiler Frontend
add_executable(compiler_frontend 
    src/frontend/clang_frontend.cpp 
    src/passes/MatrixMulPass.cpp)
target_link_libraries(compiler_frontend LLVM)

# 🔹 ISA Backend
add_executable(isa_backend 
    src/isa_backend.cpp 
    src/backend/IsaGenerator.cpp 
    src/passes/MatrixMulPass.cpp)
target_link_libraries(isa_backend LLVM)

cmake_minimum_required(VERSION 3.10)
project(PIM_Compiler)

find_package(LLVM REQUIRED CONFIG)
include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_executable(compiler_main src/compiler_main.cpp 
    src/frontend/clang_frontend.cpp 
    src/passes/MatrixMulPass.cpp 
    src/backend/isa_generator.cpp)

target_link_libraries(compiler_main LLVM)

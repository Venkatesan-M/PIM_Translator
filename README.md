# PIM_Translator
Translator for a custom Processor-in-Memory architecture geared towards AI/ML applications


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

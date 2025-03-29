mkdir build && cd build
cmake ..
make -j$(nproc)  # Parallel build
./pim_compiler   # Run the compiler

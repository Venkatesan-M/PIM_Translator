#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/IR/PassManager.h"
#include "../passes/MatrixMulPass.h"

using namespace llvm;

int main(int argc, char **argv) {
    if (argc < 2) {
        errs() << "Usage: " << argv[0] << " <input IR file>\n";
        return 1;
    }

    // Create a context with opaque pointers enabled
    LLVMContext Context;
    Context.enableOpaquePointers();  // Add this line

    SMDiagnostic Err;
    std::unique_ptr<Module> M = parseIRFile(argv[1], Err, Context);
    if (!M) {
        Err.print("clang_frontend", errs());
        return 1;
    }

    FunctionPassManager FPM;
    FPM.addPass(MatrixMulPass());

    FunctionAnalysisManager FAM;
    PassBuilder PB;
    PB.registerFunctionAnalyses(FAM);

    for (Function &F : *M) {
        FPM.run(F, FAM);
    }

    M->print(outs(), nullptr);
    return 0;
}

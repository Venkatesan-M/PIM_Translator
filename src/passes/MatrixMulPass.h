#ifndef MATRIX_MUL_PASS_H
#define MATRIX_MUL_PASS_H

#include "llvm/IR/PassManager.h"

namespace llvm {
  struct MatrixMulPass : public PassInfoMixin<MatrixMulPass> {
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
  };
}

#endif // MATRIX_MUL_PASS_H

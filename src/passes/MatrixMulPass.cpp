#include "MatrixMulPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Metadata.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

PreservedAnalyses MatrixMulPass::run(Function &F, FunctionAnalysisManager &FAM) {
    bool modified = false;
    
    for (auto &BB : F) {
        for (auto &I : BB) {
            if (auto *binOp = dyn_cast<BinaryOperator>(&I)) {
                if (binOp->getOpcode() == Instruction::Mul) {
                    LLVMContext &Ctx = F.getContext();
                    MDNode *mdNode = MDNode::get(Ctx, MDString::get(Ctx, "pPIM_matmul"));
                    binOp->setMetadata("pPIM", mdNode);
                    modified = true;
                    errs() << "Annotated multiplication: " << *binOp << "\n";
                }
            }
        }
    }

    return modified ? PreservedAnalyses::none() : PreservedAnalyses::all();
}

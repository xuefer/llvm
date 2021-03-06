LOCAL_PATH:= $(call my-dir)

transforms_utils_SRC_FILES := \
  ASanStackFrameLayout.cpp \
  AddDiscriminators.cpp \
  BasicBlockUtils.cpp \
  BreakCriticalEdges.cpp \
  BuildLibCalls.cpp \
  BypassSlowDivision.cpp \
  CloneFunction.cpp \
  CloneModule.cpp \
  CmpInstAnalysis.cpp \
  CodeExtractor.cpp \
  CtorUtils.cpp \
  DemoteRegToStack.cpp \
  EscapeEnumerator.cpp \
  Evaluator.cpp \
  FlattenCFG.cpp \
  FunctionComparator.cpp \
  FunctionImportUtils.cpp \
  GlobalStatus.cpp \
  InlineFunction.cpp \
  ImportedFunctionsInliningStatistics.cpp \
  InstructionNamer.cpp \
  IntegerDivision.cpp \
  LCSSA.cpp \
  LibCallsShrinkWrap.cpp \
  Local.cpp \
  LoopSimplify.cpp \
  LoopUnroll.cpp \
  LoopUnrollPeel.cpp \
  LoopUnrollRuntime.cpp \
  LoopUtils.cpp \
  LoopVersioning.cpp \
  LowerInvoke.cpp \
  LowerMemIntrinsics.cpp \
  LowerSwitch.cpp \
  Mem2Reg.cpp \
  MetaRenamer.cpp \
  ModuleUtils.cpp \
  NameAnonGlobals.cpp \
  OrderedInstructions.cpp \
  PredicateInfo.cpp \
  PromoteMemoryToRegister.cpp \
  StripGCRelocates.cpp \
  SSAUpdater.cpp \
  SanitizerStats.cpp \
  SimplifyCFG.cpp \
  SimplifyIndVar.cpp \
  SimplifyInstructions.cpp \
  SimplifyLibCalls.cpp \
  SplitModule.cpp \
  StripNonLineTableDebugInfo.cpp \
  SymbolRewriter.cpp \
  UnifyFunctionExitNodes.cpp \
  Utils.cpp \
  ValueMapper.cpp \
  VNCoercion.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= libLLVM50TransformUtils

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(transforms_utils_SRC_FILES)
LOCAL_MODULE:= libLLVM50TransformUtils

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

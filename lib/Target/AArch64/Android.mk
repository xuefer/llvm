LOCAL_PATH := $(call my-dir)

aarch64_codegen_TBLGEN_TABLES50 := \
  AArch64GenRegisterInfo.inc \
  AArch64GenInstrInfo.inc \
  AArch64GenAsmWriter.inc \
  AArch64GenAsmWriter1.inc \
  AArch64GenDAGISel.inc \
  AArch64GenCallingConv.inc \
  AArch64GenAsmMatcher.inc \
  AArch64GenSubtargetInfo.inc \
  AArch64GenMCCodeEmitter.inc \
  AArch64GenFastISel.inc \
  AArch64GenDisassemblerTables.inc \
  AArch64GenMCPseudoLowering.inc \
  AArch64GenSystemOperands.inc

aarch64_codegen_SRC_FILES := \
  AArch64A57FPLoadBalancing.cpp \
  AArch64AdvSIMDScalarPass.cpp \
  AArch64AsmPrinter.cpp \
  AArch64CleanupLocalDynamicTLSPass.cpp \
  AArch64CollectLOH.cpp \
  AArch64CondBrTuning.cpp \
  AArch64ConditionalCompares.cpp \
  AArch64DeadRegisterDefinitionsPass.cpp \
  AArch64ExpandPseudoInsts.cpp \
  AArch64FalkorHWPFFix.cpp \
  AArch64FastISel.cpp \
  AArch64A53Fix835769.cpp \
  AArch64FrameLowering.cpp \
  AArch64ConditionOptimizer.cpp \
  AArch64RedundantCopyElimination.cpp \
  AArch64ISelDAGToDAG.cpp \
  AArch64ISelLowering.cpp \
  AArch64InstrInfo.cpp \
  AArch64LoadStoreOptimizer.cpp \
  AArch64MacroFusion.cpp \
  AArch64MCInstLower.cpp \
  AArch64PromoteConstant.cpp \
  AArch64PBQPRegAlloc.cpp \
  AArch64RegisterInfo.cpp \
  AArch64SelectionDAGInfo.cpp \
  AArch64StorePairSuppress.cpp \
  AArch64Subtarget.cpp \
  AArch64TargetMachine.cpp \
  AArch64TargetObjectFile.cpp \
  AArch64TargetTransformInfo.cpp \
  AArch64VectorByElementOpt.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
aarch64_codegen_TBLGEN_TABLES50 += \
  AArch64GenRegisterBank.inc \
  AArch64GenGlobalISel.inc

aarch64_codegen_SRC_FILES += \
  AArch64CallLowering.cpp \
  AArch64InstructionSelector.cpp \
  AArch64LegalizerInfo.cpp \
  AArch64RegisterBankInfo.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50AArch64CodeGen
LOCAL_MODULE_HOST_OS := darwin linux windows

LOCAL_SRC_FILES := $(aarch64_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES50 := $(aarch64_codegen_TBLGEN_TABLES50)

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device only
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50AArch64CodeGen

LOCAL_SRC_FILES := $(aarch64_codegen_SRC_FILES)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/MCTargetDesc
TBLGEN_TABLES50 := $(aarch64_codegen_TBLGEN_TABLES50)

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

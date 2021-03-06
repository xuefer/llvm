LOCAL_PATH := $(call my-dir)

x86_codegen_TBLGEN_TABLES50 := \
  X86GenAsmMatcher.inc \
  X86GenAsmWriter.inc \
  X86GenAsmWriter1.inc \
  X86GenDisassemblerTables.inc \
  X86GenRegisterInfo.inc \
  X86GenInstrInfo.inc \
  X86GenDAGISel.inc \
  X86GenFastISel.inc \
  X86GenSubtargetInfo.inc \
  X86GenCallingConv.inc \
  X86GenEVEX2VEXTables.inc

x86_codegen_SRC_FILES := \
  X86AsmPrinter.cpp \
  X86CallFrameOptimization.cpp \
  X86CmovConversion.cpp \
  X86ExpandPseudo.cpp \
  X86FastISel.cpp \
  X86FixupBWInsts.cpp \
  X86FixupLEAs.cpp \
  X86FixupSetCC.cpp \
  X86FloatingPoint.cpp \
  X86FrameLowering.cpp \
  X86ISelDAGToDAG.cpp \
  X86ISelLowering.cpp \
  X86InterleavedAccess.cpp \
  X86InstrFMA3Info.cpp \
  X86InstrInfo.cpp \
  X86EvexToVex.cpp \
  X86MCInstLower.cpp \
  X86MachineFunctionInfo.cpp \
  X86MacroFusion.cpp \
  X86OptimizeLEAs.cpp \
  X86PadShortFunction.cpp \
  X86RegisterInfo.cpp \
  X86SelectionDAGInfo.cpp \
  X86ShuffleDecodeConstantPool.cpp \
  X86Subtarget.cpp \
  X86TargetMachine.cpp \
  X86TargetObjectFile.cpp \
  X86TargetTransformInfo.cpp \
  X86VZeroUpper.cpp \
  X86WinAllocaExpander.cpp \
  X86WinEHState.cpp \
  X86CallingConv.cpp

ifeq ($(FORCE_BUILD_LLVM_GLOBAL_ISEL),true)
x86_codegen_TBLGEN_TABLES50 += \
  X86GenRegisterBank.inc \
  X86GenGlobalISel.inc

x86_codegen_SRC_FILES += \
  X86CallLowering.cpp \
  X86LegalizerInfo.cpp \
  X86RegisterBankInfo.cpp \
  X86InstructionSelector.cpp
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(x86_codegen_TBLGEN_TABLES50)

LOCAL_SRC_FILES := $(x86_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVM50X86CodeGen

LOCAL_MODULE_HOST_OS := darwin linux windows

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

TBLGEN_TABLES50 := $(x86_codegen_TBLGEN_TABLES50)

LOCAL_SRC_FILES := $(x86_codegen_SRC_FILES)

LOCAL_MODULE:= libLLVM50X86CodeGen

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

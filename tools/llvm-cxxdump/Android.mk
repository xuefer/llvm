LOCAL_PATH := $(call my-dir)

LLVM50_ROOT_PATH := $(LOCAL_PATH)/../..
include $(LLVM50_ROOT_PATH)/llvm.mk

llvm_cxxdump_SRC_FILES := \
  Error.cpp \
  llvm-cxxdump.cpp

llvm_cxxdump_STATIC_LIBRARIES := \
  libLLVM50ARMAsmParser \
  libLLVM50ARMInfo \
  libLLVM50ARMDesc \
  libLLVM50ARMAsmPrinter \
  libLLVM50ARMDisassembler \
  libLLVM50AArch64Info \
  libLLVM50AArch64AsmParser \
  libLLVM50AArch64Desc \
  libLLVM50AArch64AsmPrinter \
  libLLVM50AArch64Utils \
  libLLVM50AArch64Disassembler \
  libLLVM50MipsInfo \
  libLLVM50MipsAsmParser \
  libLLVM50MipsDesc \
  libLLVM50MipsAsmPrinter \
  libLLVM50MipsDisassembler \
  libLLVM50X86Info \
  libLLVM50X86Desc \
  libLLVM50X86AsmParser \
  libLLVM50X86CodeGen \
  libLLVM50X86AsmPrinter \
  libLLVM50X86Utils \
  libLLVM50X86Disassembler \
  libLLVM50AsmPrinter \
  libLLVM50CodeGen \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50Object \
  libLLVM50MCParser \
  libLLVM50MC \
  libLLVM50MCDisassembler \
  libLLVM50BitReader \
  libLLVM50Core \
  libLLVM50AsmParser \
  libLLVM50Support \


include $(CLEAR_VARS)

LOCAL_MODULE := llvm-cxxdump
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(llvm_cxxdump_SRC_FILES)
LOCAL_LDLIBS += -lpthread -lm -ldl

LOCAL_STATIC_LIBRARIES := $(llvm_cxxdump_STATIC_LIBRARIES)

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_GEN_INTRINSICS_MK)
include $(BUILD_HOST_EXECUTABLE)

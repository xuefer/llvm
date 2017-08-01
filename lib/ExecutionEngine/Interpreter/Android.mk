LOCAL_PATH:= $(call my-dir)

interpreter_SRC_FILES := \
  Execution.cpp         \
  ExternalFunctions.cpp \
  Interpreter.cpp       \

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(interpreter_SRC_FILES)
LOCAL_MODULE := libLLVM50Interpreter

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(interpreter_SRC_FILES)
LOCAL_MODULE := libLLVM50Interpreter

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

LOCAL_PATH := $(call my-dir)

x86_target_info_TBLGEN_TABLES50 := \
  X86GenRegisterInfo.inc \
  X86GenSubtargetInfo.inc \
  X86GenInstrInfo.inc

x86_target_info_SRC_FILES := \
  X86TargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(x86_target_info_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=	\
	$(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM50X86Info

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(x86_target_info_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(x86_target_info_SRC_FILES)

LOCAL_C_INCLUDES +=     \
        $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM50X86Info

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

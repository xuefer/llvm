LOCAL_PATH := $(call my-dir)

mips_target_info_TBLGEN_TABLES50 := \
  MipsGenInstrInfo.inc \
  MipsGenRegisterInfo.inc \
  MipsGenSubtargetInfo.inc

mips_target_info_SRC_FILES := \
  MipsTargetInfo.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50MipsInfo
LOCAL_MODULE_HOST_OS := darwin linux windows

TBLGEN_TABLES50 := $(mips_target_info_TBLGEN_TABLES50)
TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_target_info_SRC_FILES)
LOCAL_C_INCLUDES +=	$(LOCAL_PATH)/..

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

LOCAL_MODULE:= libLLVM50MipsInfo

TBLGEN_TABLES50 := $(mips_target_info_TBLGEN_TABLES50)
TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(mips_target_info_SRC_FILES)
LOCAL_C_INCLUDES +=	$(LOCAL_PATH)/..

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

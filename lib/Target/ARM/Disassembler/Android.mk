LOCAL_PATH := $(call my-dir)

arm_disassembler_TBLGEN_TABLES50 := \
  ARMGenDisassemblerTables.inc \
  ARMGenInstrInfo.inc \
  ARMGenSubtargetInfo.inc \
  ARMGenRegisterInfo.inc

arm_disassembler_SRC_FILES := \
  ARMDisassembler.cpp

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(arm_disassembler_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM50ARMDisassembler

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_STATIC_LIBRARY)
endif

# For the host
# =====================================================
include $(CLEAR_VARS)
include $(CLEAR_TBLGEN_VARS50)

TBLGEN_TABLES50 := $(arm_disassembler_TBLGEN_TABLES50)

TBLGEN_TD_DIR50 := $(LOCAL_PATH)/..

LOCAL_SRC_FILES := $(arm_disassembler_SRC_FILES)

LOCAL_C_INCLUDES += $(LOCAL_PATH)/..

LOCAL_MODULE:= libLLVM50ARMDisassembler

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_TBLGEN_RULES_MK)
include $(BUILD_HOST_STATIC_LIBRARY)


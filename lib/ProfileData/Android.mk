LOCAL_PATH:= $(call my-dir)

profiledata_SRC_FILES := \
  InstrProf.cpp \
  InstrProfReader.cpp \
  InstrProfWriter.cpp \
  ProfileSummaryBuilder.cpp \
  SampleProf.cpp \
  SampleProfReader.cpp \
  SampleProfWriter.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM50ProfileData
LOCAL_MODULE_HOST_OS := darwin linux windows
LOCAL_SRC_FILES := $(profiledata_SRC_FILES)

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE:= libLLVM50ProfileData
LOCAL_SRC_FILES := $(profiledata_SRC_FILES)

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif

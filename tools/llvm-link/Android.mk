LOCAL_PATH:= $(call my-dir)

llvm_link_SRC_FILES := \
  llvm-link.cpp

llvm_link_STATIC_LIBRARIES := \
  libLLVM50Linker \
  libLLVM50IRReader \
  libLLVM50Object \
  libLLVM50MC \
  libLLVM50MCParser \
  libLLVM50BitReader \
  libLLVM50BitWriter \
  libLLVM50AsmParser \
  libLLVM50TransformUtils \
  libLLVM50Analysis \
  libLLVM50Target \
  libLLVM50Core \
  libLLVM50Support

#===---------------------------------------------------------------===
# llvm-link command line tool (host)
#===---------------------------------------------------------------===

include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)
LOCAL_LDLIBS += -lpthread

include $(LLVM50_HOST_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_HOST_EXECUTABLE)

#===---------------------------------------------------------------===
# llvm-link command line tool (target)
#===---------------------------------------------------------------===

ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))
include $(CLEAR_VARS)

LOCAL_MODULE := llvm-link
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(llvm_link_SRC_FILES)
LOCAL_STATIC_LIBRARIES := $(llvm_link_STATIC_LIBRARIES)

include $(LLVM50_DEVICE_BUILD_MK)
include $(LLVM50_GEN_ATTRIBUTES_MK)
include $(BUILD_EXECUTABLE)
endif

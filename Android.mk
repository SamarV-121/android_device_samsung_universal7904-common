LOCAL_PATH := $(call my-dir)

ifneq ($(filter m20lte m30lte a40 a30 a30s, $(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif

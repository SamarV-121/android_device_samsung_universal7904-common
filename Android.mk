LOCAL_PATH := $(call my-dir)

ifneq ($(filter m20lte m30lte a40 a30, $(TARGET_DEVICE)),)

  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

endif

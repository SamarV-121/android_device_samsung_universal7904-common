LOCAL_PATH := $(call my-dir)

ifneq ($(filter m20lte m30lte a40 a30, $(TARGET_DEVICE)),)

  subdir_makefiles=$(call first-makefiles-under,$(LOCAL_PATH))
  $(foreach mk,$(subdir_makefiles),$(info including $(mk) ...)$(eval include $(mk)))

include $(CLEAR_VARS)

EGL_LIBS := libGLES_mali.so libOpenCL.so libOpenCL.so.1 libOpenCL.so.1.1 hw/vulkan.$(TARGET_BOARD_PLATFORM).so

EGL_32_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(EGL_LIBS))
$(EGL_32_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 32 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib/egl/libGLES_mali.so $@

EGL_64_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(EGL_LIBS))
$(EGL_64_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "EGL 64 lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/egl/libGLES_mali.so $@

LIBUTILS32_SERVICES := android.hardware.graphics.composer@2.1-service
LIBUTILS32_FILES := $(addprefix $(TARGET_OUT_VENDOR)/bin/hw/,$(LIBUTILS32_SERVICES))
LIBUTILS32_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libuti32.so
$(LIBUTILS32_SYMLINK): $(LOCAL_INSTALLED_MODULE) $(LIBUTILS32_FILES)
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/libutils-v32.so $@
	$(hide) sed -i 's/libutils\.so/libuti32.so/g' $(LIBUTILS32_FILES)

ALL_DEFAULT_INSTALLED_MODULES += $(EGL_32_SYMLINKS) $(EGL_64_SYMLINKS) $(LIBUTILS32_SYMLINK)
endif

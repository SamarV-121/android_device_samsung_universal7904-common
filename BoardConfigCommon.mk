COMMON_PATH := device/samsung/universal7904-common

BOARD_VENDOR := samsung

# Platform
TARGET_BOARD_PLATFORM := universal7904
TARGET_SOC := exynos7904
TARGET_BOOTLOADER_BOARD_NAME := exynos7904
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
include hardware/samsung_slsi-linaro/config/BoardConfig7904.mk

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

# Bluetooth
BOARD_HAVE_BLUETOOTH_SLSI := true

# Camera
ifeq ($(TARGET_DEVICE),a40)
SOONG_CONFIG_NAMESPACES += samsungCameraVars
SOONG_CONFIG_samsungCameraVars += extra_ids
SOONG_CONFIG_samsungCameraVars_extra_ids := 50
endif
$(call soong_config_set,samsungCameraVars,usage_64bit,true)

# Display
BOARD_MINIMUM_DISPLAY_BRIGHTNESS := 1
TARGET_SCREEN_DENSITY := 420

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# FM Radio
BOARD_HAVE_SLSI_FM := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/samsung/universal7904
TARGET_KERNEL_ADDITIONAL_FLAGS := HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

ifeq ($(filter teegris, $(BOARD_SEPOLICY_TEE_FLAVOR)),)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_mobicore.xml
endif

ODM_MANIFEST_SKUS += NFC
ODM_MANIFEST_NFC_FILES := $(COMMON_PATH)/manifest_nfc.xml

# Lineage Health
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_PATH := /sys/class/power_supply/battery/batt_slate_mode
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_ENABLED := 0
TARGET_HEALTH_CHARGING_CONTROL_CHARGING_DISABLED := 1
TARGET_HEALTH_CHARGING_CONTROL_SUPPORTS_BYPASS := false

# Metadata
BOARD_USES_METADATA_PARTITION := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)/releasetools

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Sepolicy
ifneq ($(LINEAGE_BUILD),)
include device/lineage/sepolicy/exynos/sepolicy.mk
endif
include device/samsung_slsi/sepolicy/sepolicy.mk
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/private
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
ifeq ($(filter teegris, $(BOARD_SEPOLICY_TEE_FLAVOR)),)
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/mobicore
endif

# Vendor
TARGET_COPY_OUT_VENDOR := vendor

# Vibrator
$(call soong_config_set,samsungVibratorVars,duration_amplitude,true)

# VNDK
BOARD_VNDK_VERSION := current

# Wifi
BOARD_WLAN_DEVICE                := slsi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

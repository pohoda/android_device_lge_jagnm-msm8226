#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
LOCAL_PATH := device/lge/jagnm

TARGET_SPECIFIC_HEADER_PATH += $(LOCAL_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := jagnm
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_BOARD_PLATFORM := msm8226
# TARGET_BOARD_PLATFORM := msm8x26

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
# TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_VARIANT := krait
MALLOC_SVELTE := true
# USE_CLANG_PLATFORM_BUILD := true
BOARD_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
BOARD_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Kernel image
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

# Kernel image
# TARGET_KERNEL_APPEND_DTB := true 				# zastarane pre omni-9.0
BOARD_KERNEL_SEPARATED_DT := true
# TARGET_KERNEL_SOURCE := kernel/lge/msm8226
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 user_debug=31 msm_rtb.filter=0x37 androidboot.hardware=qcom androidboot.selinux=enforcing
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --dt $(LOCAL_PATH)/dt.img --ramdisk_offset 0x01000000 --tags_offset 0x00000100
# TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-cortex_a7-linux-gnueabi-
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
TARGET_KERNEL_CONFIG := jagnm_lineageos_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage

# Offmode Charging
BOARD_GLOBAL_CFLAGS += \
    -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' \
    -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'

# Global flags
BOARD_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE -DCAMERA_VENDOR_L_COMPAT

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true
TARGET_RIL_VARIANT := caf
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_10
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/lge_touch/dt2w_enable"
TARGET_POWERHAL_VARIANT = qcom

# Wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WLAN_DEVICE := bcmdhd
# BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"

BOARD_HAS_QCOM_WLAN := true
TARGET_USES_WCNSS_CTRL := true
TARGET_USES_QCOM_WCNSS_QMI := true
WLAN_PATH = wlan-caf

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lge/jagnm/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_CUSTOM_BT_CONFIG := device/lge/jagnm/bluetooth/vnd_g3s.txt
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# FM Radio
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# FM
BOARD_HAVE_BCM_FM := true
AUDIO_FEATURE_DISABLED_FM_VIRTUAL_RECORD := true

# Nfc
ifeq ($(BOARD_HAS_NFC),true)
BOARD_NFC_CHIPSET := pn547
BOARD_NFC_DEVICE := "/dev/pn547"
endif

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
USE_CUSTOM_AUDIO_POLICY := 1

# Graphics
HAVE_ADRENO_SOURCE := false
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 0000000

# Hardware tunables framework
# BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# GPS
TARGET_NO_RPC := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00D00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1181116006
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2457845248
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/fstab.qcom

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Use HW crypto for ODE
TARGET_HW_DISK_ENCRYPTION := false

# SELinux policies
# qcom sepolicy
# -include device/qcom/sepolicy/sepolicy.mk
include vendor/omni/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(LOCAL_PATH)/sepolicy

# TWRP recovery
RECOVERY_VARIANT                          := twrp
TW_DEFAULT_LANGUAGE						  := sk
PRODUCT_COPY_FILES += $(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab
# HAVE_LIBSELINUX                           := true
TW_INCLUDE_CRYPTO                         := true
TW_NO_USB_STORAGE                         := false
RECOVERY_GRAPHICS_USE_LINELENGTHn         := true
# TW_USE_TOOLBOX                            := false
RECOVERY_SDCARD_ON_DATA                   := true
TW_THEME                                  := portrait_hdpi
TW_DEFAULT_EXTERNAL_STORAGE               := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_SECONDARY_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
# TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun0/file"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"

# View button bootloader, downloadmode - true only samsung
TW_NO_REBOOT_BOOTLOADER := false
TW_HAS_DOWNLOAD_MODE := true

# Default Brightness (TW_DEFAULT_BRIGHTNESS=255-->100%; TW_DEFAULT_BRIGHTNESS=218-->85%)
TW_DEFAULT_BRIGHTNESS := 225
TW_MAX_BRIGHTNESS := 255

# Internal storage, External storage, MTP
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH 				  := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT 		  := "external_sd"
TW_MTP_DEVICE							  := "/dev/mtp_usb"

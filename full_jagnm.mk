LOCAL_PATH := device/lge/jagnm

# Inherit some common CM stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/lge/jagnm/device_jagnm.mk)

PRODUCT_LOCALES :=sk_SK

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := LG G3s
PRODUCT_NAME := full_jagnm
PRODUCT_MODEL := LG-D722
PRODUCT_DEVICE := jagnm
PRODUCT_MANUFACTURER := LGE
PRODUCT_BRAND := lge

# PRODUCT_COPY_FILES += bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata
PRODUCT_COPY_FILES += system/timezone/output_data/iana/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata


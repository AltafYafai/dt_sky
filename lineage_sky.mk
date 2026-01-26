#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/sky

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Configure full_base_telephony.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

DEVICE_PACKAGE_OVERLAYS += \
	$(DEVICE_PATH)/overlay-lineage

LOS_BUILD := true
USE_RESERVED_SIZE := true
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_BOOT_ANIMATION_RES := 1080

ifeq ($(AXION),true)
USE_RESERVED_SIZE := true
AXION_CAMERA_REAR_INFO := 50,2
AXION_CAMERA_FRONT_INFO := 8
AXION_MAINTAINER := 𝚂αяιм_𝚁αѕσσℓ
AXION_PROCESSOR := Snapdragon™_4_Gen_2
endif

ifeq ($(LUNARIS),true)
USE_RESERVED_SIZE := true
WITH_GMS := true
DEVICE_PACKAGE_OVERLAYS += \                                                        $(DEVICE_PATH)/overlay-luna
PRODUCT_SYSTEM_PROPERTIES += \
    ro.paranoid.maintainer="𝚂αяιм 𝚁αѕσσℓ"
endif

ifeq ($(AVIUM),true)
USE_RESERVED_SIZE := true
AVIUM_BUILDTYPE := Unoffical
AVIUM_VERSION_APPEND_TIME_OF_DAY := false
# WITH_GMS := true
# # Google IMS
# TARGET_INCLUDE_GOOGLEIME := true
# TARGET_GOOGLEIME_OVERRIDE_IME := true
AVIUM_MAINTAINER := 𝚂αяιм_𝚁αѕσσℓ
endif

ifeq ($(SAKURA),true)
USE_RESERVED_SIZE := true
SAKURA_OFFICIAL := true
SAKURA_MAINTAINER := 𝚂αяιм_𝚁αѕσσℓ
SAKURA_BUILD_TYPE := gapps
endif

ifeq ($(EVO),true)
EVO_BUILD_TYPE := Unofficial
WITH_GMS := true
USE_RESERVED_SIZE := true
TARGET_BUILD_APERTURE_CAMERA := false
DEVICE_PACKAGE_OVERLAYS += \
	$(DEVICE_PATH)/overlay-evo
endif

ifeq ($(RISING),true)
USE_RESERVED_SIZE := true
PRODUCT_BUILD_PROP_OVERRIDES += \
    RisingChipset="Snapdragon™ 4 Gen 2" \
    RisingMaintainer="𝚂αяιм 𝚁αѕσσℓ"
RISING_MAINTAINER := 𝚂αяιм_𝚁αѕσσℓ
TARGET_ENABLE_BLUR := true
TARGET_PREBUILT_LAWNCHAIR_LAUNCHER := true
WITH_GMS := true
endif


# ===========================================
ifeq ($(USE_RESERVED_SIZE),true)
$(call inherit-product, vendor/lineage/config/BoardConfigReservedSize.mk)
endif

# Inherit device configurations
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit from the proprietary version
$(call inherit-product, vendor/xiaomi/sky/sky-vendor.mk)


## Device identifier
PRODUCT_DEVICE := sky
PRODUCT_NAME := lineage_sky
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 23076RN4BI
PRODUCT_MANUFACTURER := Xiaomi

# GMS
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

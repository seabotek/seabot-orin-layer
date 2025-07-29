SUMMARY = "Custom linux image for Jetson ORIN" 
LICENSE = "MIT"
MACHINE = "jetson-orin-nano-devkit"
export IMAGE_BASENAME = "seabot-orin"

IMAGE_FSTYPES = "tegraflash tar.gz"
inherit core-image

CORE_IMAGE_BASE_INSTALL += "packagegroup-demo-base "
CORE_IMAGE_BASE_INSTALL += "${@'packagegroup-demo-systemd' if d.getVar('VIRTUAL-RUNTIME_init_manager') == 'systemd' else ''}"
#TOOLCHAIN_HOST_TASK += "nativesdk-packagegroup-cuda-sdk-host"

inherit nopackages





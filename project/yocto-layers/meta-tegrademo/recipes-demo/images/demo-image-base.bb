DESCRIPTION = "Tegra demo base image"

require demo-image-common.inc
REQUIRED_DISTRO_FEATURES = "systemd" 
INIT_MANAGER = "systemd" 
KERNEL_DEVICETREE ?= "tegra234-p3768-0000+p3767-0004-nv-super.dtb"

# INITRAMFS_IMAGE_NAME = "tegra-initrd-flash-initramfs"
# INITRAMFS_IMAGE_BUNDLE = "1"
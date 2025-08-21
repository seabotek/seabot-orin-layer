SUMMARY = "Custom linux image for Jetson ORIN" 
LICENSE = "CLOSED"
inherit core-image
# set image type 
IMAGE_CLASSES += "image_types_tegra"
IMAGE_FSTYPES += "tegraflash tar.gz"

IMAGE_FEATURES:remove = " debug-tweaks"

IMAGE_INSTALL += "\
        user-seabot \
        "

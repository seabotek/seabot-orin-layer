SUMMARY = "Custom linux image for Jetson ORIN" 
LICENSE = "CLOSED"
inherit core-image
# set image type 
IMAGE_CLASSES += "image_types_tegra"
IMAGE_FSTYPES += "tegraflash tar.gz"

IMAGE_FEATURES:remove = " debug-tweaks"

IMAGE_INSTALL += "\
        user-seabot \
        seabot-splash \
        busybox \
        dash \
        "

ALTERNATIVE:busybox += "dash" 
# remove bash as its license is GPL3 
IMAGE_INSTALL:remove = " bash bash-completion alsa alsa-utils coreutils"
BAD_RECOMMENDATIONS += "bash"
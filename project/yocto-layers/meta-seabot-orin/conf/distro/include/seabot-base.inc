# this distro is inspired from the tegra-demo distro 
DISTRO = "seabot"
DISTRO_NAME = "Mare Cutos Refrence distro for the seabot robot"
DISTRO_VERSION = "1.0"
# sets a codename to the distro  
DISTRO_CODENAME = "alpha"
# add a vendor suffix to the sdk name 

MAINTAINER = "Moktar SELLAMI <smokthar925@gmail.com>"
#set a target vendor 
TARGET_VENDOR = "-sb"

# setup distro features 
SB_DEFAULT_DISTRO_FEATURES = "multiarch usrmerg systemd pam virtualization "
DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${SB_DEFAULT_DISTRO_FEATURES}"

# setup machine features 
MACHINE_FEATURES += "usbgadget"
#adding support to systemd 
INIT_MANAGER = "systemd"

# add cve checks for recipes 
# INHERIT += "cve-check" : TODO understand it better and its effects 

# set preferred kernel
PREFERRED_PROVIDER_virtual/kernel = "linux-jammy-nvidia-tegra"

TCLIBCAPPEND = ""

# set package management
PACKAGE_CLASSES = "package_deb"

# inlude other configs, taken from the tegra-demo distro 
require conf/distro/include/no-static-libs.inc
require conf/distro/include/yocto-uninative.inc
require conf/distro/include/security_flags.inc
# isolates he build system from the host system 
INHERIT += "uninative"


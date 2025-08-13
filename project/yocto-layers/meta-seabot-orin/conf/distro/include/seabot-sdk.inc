SDK_VENDOR = "-sbsdk"
# sets the sdk version and removes the meta data from it "1.0+snapshot"
# makes the sdk version shorter 
SDK_VERSION = "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}', 'snapshot')}"
# ensures 
SDK_VERSION[vardepvalue] = "${SDK_VERSION}"
# set sdk name 
SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
SDKPATHINSTALL = "/opt/${DISTRO}/${SDK_VERSION}"
SUMMARY = "recipe for creating a splash screen on tty"
LICENSE = "CLOSED"


SRC_URI ="file://seabot-fetch.sh \
          file://seabot-splash.service"
MY_TARGET_PLATFORM := "${@d.getVar('MACHINEOVERRIDES').split(':')[6]}"
MY_SCRIPT_PATH = "${WORKDIR}/seabot-fetch.sh"

inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SERVICE_DEST_DIR="${systemd_unitdir}/system"
SYSTEMD_SERVICE:${PN} = "seabot-splash.service"

do_compile(){
   bbplain "distro name " ${DISTRO}
   bbplain "distro version" ${DISTRO_VERSION}
   bbplain "machine" ${MY_TARGET_PLATFORM}
   bbplain "STORAGE" ${TNSPEC_BOOTDEV}
   bbplain "Linux" ${PREFERRED_PROVIDER_virtual/kernel} 
   bbplain "version " ${PREFERRED_VERSION_linux-jammy-nvidia-tegra}
   bbplain "Package manager" ${IMAGE_PKGTYPE}
   sed -i  "s/\$DISTRO_NAME/${DISTRO}/g" ${MY_SCRIPT_PATH}    
   sed -i  "s/\$VERSION/${DISTRO_VERSION}/g" ${MY_SCRIPT_PATH}    
   sed -i  "s/\$PLATFORM/${MY_TARGET_PLATFORM}/g" ${MY_SCRIPT_PATH}    
   sed -i  "s/\$LINUX_VERSION/${PREFERRED_PROVIDER_virtual/kernel}/g" ${MY_SCRIPT_PATH}    
   sed -i  "s/\$STORAGE_TYPE/${TNSPEC_BOOTDEV}/g" ${MY_SCRIPT_PATH}    
   sed -i  "s/\$PKG_MANAGER/${IMAGE_PKGTYPE}/g" ${MY_SCRIPT_PATH}    
}


do_install(){
    install -d ${D}${bindir}
    install -m 0755 ${MY_SCRIPT_PATH} ${D}${bindir}

    install -d ${D}${SERVICE_DEST_DIR}
    install -m 0644 ${WORKDIR}/seabot-splash.service  ${D}${SERVICE_DEST_DIR}
    
}

FILES:${PN} = "${bindir}/seabot-fetch.sh \
               ${SERVICE_DEST_DIR}/seabot-splash.service"
SUMMARY = "set up ethernet"
LICENSE = "CLOSED"

SRC_URI += "file://81-eth-dev.rules \
            file://01-netcfg.yaml"

RULES_DEST_DIR = "${sysconfdir}/udev/rules.d"
NETPLAN_DEST_DIR = "${sysconfdir}/netplan"
do_install(){
    install -d ${D}${RULES_DEST_DIR}
    install -m 0644 "${WORKDIR}/81-eth-dev.rules" ${D}${RULES_DEST_DIR}  
    
    install -d ${D}${NETPLAN_DEST_DIR}
    install -m 0644 "${WORKDIR}/01-netcfg.yaml" ${D}${NETPLAN_DEST_DIR}  

}
FILES:${PN} += "${RULES_DEST_DIR}/81-eth-dev.rules \
                ${NETPLAN_DEST_DIR}/01-netcfg.yaml "
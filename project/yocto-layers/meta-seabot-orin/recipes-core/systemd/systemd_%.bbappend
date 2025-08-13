PACKAGECONFIG:append = " networkd resolved"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
ETH_CONF_FILE = "10-eth0.network"
ETH_DEST_PATH = "${sysconfdir}/systemd/network"
SRC_URI += "file://${ETH_CONF_FILE}"
RDEPENDS:${PN} += " net-tools"

FILES:${PN} += "${ETH_DEST_PATH}/${ETH_CONF_FILE}"
do_install:append(){
    install -d ${D}${ETH_DEST_PATH}
    install -m 0644 ${WORKDIR}/${ETH_CONF_FILE} ${D}${ETH_DEST_PATH}
}

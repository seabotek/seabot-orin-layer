SUMMARY = "systemd test"
LICENSE = "CLOSED"
MYTEST_SERVICE_FILE="seabot-test-service.service"
SRC_URI += "file://${MYTEST_SERVICE_FILE}"
inherit systemd
SYSTEMD_AUTO_ENABLE = "enable"
SERVICE_DEST_DIR="${systemd_unitdir}/system"
SYSTEMD_SERVICE:${PN} = "${MYTEST_SERVICE_FILE}"

FILES:${PN} += "${SERVICE_DEST_DIR}/${MYTEST_SERVICE_FILE}"
do_install(){
    install -d ${D}${SERVICE_DEST_DIR}
    install -m 0644 ${WORKDIR}/${MYTEST_SERVICE_FILE}  ${D}${SERVICE_DEST_DIR}
}

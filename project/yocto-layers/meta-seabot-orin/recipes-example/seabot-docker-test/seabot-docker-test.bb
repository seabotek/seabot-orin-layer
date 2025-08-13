SUMMARY  = "Simple docker test example"
LICENSE = "CLOSED"

SRC_URI += "file://Dockerfile"
FILES:${PN} += "${SEABOT_USER_HOMEDIR}/tests/Dockerfile"
do_install(){
    install -d ${D}${SEABOT_USER_HOMEDIR}/tests
    install -m 0744 ${WORKDIR}/Dockerfile ${D}${SEABOT_USER_HOMEDIR}/tests
}
SUMMARY  = "Simple docker test example"
LICENSE = "CLOSED"

SRC_URI += "file://Dockerfile \
            file://docker-compose.yaml"
FILES:${PN} += "${SEABOT_USER_HOMEDIR}/tests/Dockerfile \
                ${SEABOT_USER_HOMEDIR}/tests/docker-compose.yaml" 
do_install(){
    install -d ${D}${SEABOT_USER_HOMEDIR}/tests
    install -m 0744 ${WORKDIR}/Dockerfile ${D}${SEABOT_USER_HOMEDIR}/tests
    install -m 0744 ${WORKDIR}/docker-compose.yaml ${D}${SEABOT_USER_HOMEDIR}/tests
}
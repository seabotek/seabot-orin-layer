SUMMARY="recipe that sets shell environment variables"
LICENSE="CLOSED"

SRC_URI += "file://.bashrc"
FILES:${PN} = "${SEABOT_USER_HOMEDIR}/.bashrc"
do_install(){
    install -d ${D}${SEABOT_USER_HOMEDIR}
    install -m 0755 ${WORKDIR}/.bashrc  ${D}${SEABOT_USER_HOMEDIR}
}
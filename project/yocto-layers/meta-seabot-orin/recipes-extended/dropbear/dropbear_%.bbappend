FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://seabot-ssh-portal.sh"
FILES:${PN} += "${bindir}/seabot-ssh-portal.sh"
do_install:append(){

    bbwarn "the dropbear config file is being changed to launch the seabot fetch script ..."
    install -d ${D}${bindir}
    install -m 0755 ${WORKDIR}/seabot-ssh-portal.sh ${D}${bindir}
    echo "DROPBEAR_EXTRA_ARGS=\"-w -c /usr/bin/seabot-ssh-portal.sh\" " >| ${D}${sysconfdir}/default/dropbear
}
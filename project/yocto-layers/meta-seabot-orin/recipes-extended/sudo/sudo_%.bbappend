do_install:append(){
    echo "${SEABOT_USER_NAME} ALL=(ALL) ALL" > ${D}${sysconfdir}/sudoers.d/001_first
}
FILES:${PN} += "${sysconfdir}/sudoers.d/001_first"
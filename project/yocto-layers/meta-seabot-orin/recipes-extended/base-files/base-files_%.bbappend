FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

do_install:prepend() {
     echo "/dev/nvme0n1p16 none swap sw 0 0" >> ${WORKDIR}/fstab
}

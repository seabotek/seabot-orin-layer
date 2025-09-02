DESCRIPTION = "Package group to add samples application or testing recipes"
LICENSE="CLOSED"
inherit packagegroup
RDEPENDS:${PN} = " \
            cuda-samples \ 
            seabot-docker-test \
            seabot-systemd-test \
"


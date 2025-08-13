
DESCRIPTION = "this recipe adds a new user an sets a new password to it "


SUMMARY = "Seabot Image User"
LICENSE = "CLOSED"

inherit useradd

RDEPENDS:${PN} += "sudo"
# Apply only for main package
USERADD_PACKAGES = "${PN}"

# User configuration
USERADD_PARAM:${PN} = " \
    -u ${SEABOT_USER_UID} \
    -d ${SEABOT_USER_HOMEDIR} \
    -s ${SEABOT_USER_SHELL} \
    -g ${SEABOT_USER_PGROUP} \
    -G ${SEABOT_USER_SGROUPS} \
    -p '${SEABOT_USER_PASS}' \
    ${SEABOT_USER_NAME}"

# Group configuration
GROUPADD_PARAM:${PN} = "-g ${SEABOT_USER_GID} ${SEABOT_USER_PGROUP}"

# This package will be empty, so allow it
ALLOW_EMPTY:${PN} = "1"

# disable splitting debugging info during packaging
INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
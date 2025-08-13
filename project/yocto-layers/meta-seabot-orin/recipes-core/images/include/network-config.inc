REQUIRED_DISTRO_FEATURES = "systemd"
EXTRA_IMAGE_FEATURES += " ssh-server-dropbear "
IMAGE_INSTALL += "\
        seabot-systemd-test \
        netplan \
        "


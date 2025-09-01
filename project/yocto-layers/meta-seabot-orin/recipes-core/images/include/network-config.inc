REQUIRED_DISTRO_FEATURES = "systemd"
EXTRA_IMAGE_FEATURES += " ssh-server-dropbear "
IMAGE_INSTALL += "\
        netplan \
        net-tools \
        seabot-eth-config \
        dropbear \
        "
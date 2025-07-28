# ntu-22.04-base
# Copyright (C) 2020-2021 Intel Corporation
# Copyright (C) 2022 Konsulko Group
#
# SPDX-License-Identifier: GPL-2.0-only

FROM ubuntu:22.04

ARG TARGETPLATFORM
ARG USERNAME=ORIN  
ARG USER_UID=1000 
ARG USER_GID=1000 

# System setup and user creation
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo git \
    && echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Install Yocto dependencies

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        gawk wget git-core subversion diffstat unzip \
        sysstat texinfo build-essential chrpath socat \
        python3 python3-pip python3-pexpect python3-virtualenv \
        xz-utils locales cpio screen tmux sudo iputils-ping \
        python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
        pylint xterm iproute2 fluxbox tightvncserver lz4 zstd file \
        gawk wget git-core diffstat unzip texinfo gcc-multilib \
        build-essential chrpath socat cpio python3 python3-pip python3-pexpect \
        xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa \
        libsdl1.2-dev pylint xterm zstd lz4 libxml2-dev libxslt-dev \
        && case ${TARGETPLATFORM} in \
            "linux/amd64") \
                DEBIAN_FRONTEND=noninteractive apt-get install -y \
                    gcc-multilib g++-multilib \
                ;; \
        esac

# VNC setup
RUN  /usr/sbin/locale-gen en_US.UTF-8 \
    && echo 'dash dash/sh boolean false' | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

#Lightweight process supervisor for Docker containers 
COPY build-install-dumb-init.sh /
RUN  bash /build-install-dumb-init.sh && \
     rm /build-install-dumb-init.sh 

# Cleanup
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch to yoctouser
USER $USERNAME
WORKDIR /home/$USERNAME

# Clone Poky
RUN git clone git://git.yoctoproject.org/poky -b scarthgap

# Setup Yocto environment (fixed)
WORKDIR /home/$USERNAME/poky

# clone meta-OE 
RUN git clone https://github.com/openembedded/meta-openembedded.git -b scarthgap 
# Clone meta-tegra layer 
RUN git clone https://github.com/OE4T/meta-tegra.git -b scarthgap 
# clone meta tegra community 
RUN git clone https://github.com/OE4T/meta-tegra-community.git -b scarthgap 
# clone tegra-demo-distro
# RUN git clone https://github.com/OE4T/tegra-demo-distro.git -b scarthgap
# Meta virtualization 
RUN git clone git://git.yoctoproject.org/meta-virtualization -b scarthgap



RUN echo "source oe-init-build-env" >> ~/.bashrc  # Fixed: Adds to bashrc instead of failing

# Default command
CMD ["/bin/bash"]

#!/bin/sh
set -e
TEST_DIR="/etc/seabot-firstboot"
if [[ ! -e $TEST_DIR ]]; then
    echo " this is first boot" 
    echo "running growfs" 
    echo "moktar is the best" >> $TEST_DIR
    /lib/systemd/systemd-growfs /
fi 

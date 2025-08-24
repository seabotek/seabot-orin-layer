
# contains the user names and password"

# openssl -5 
# PASS : orin 
SYSTEM_PASSWD  = "\$5\$qPXWPBHBD44Ky/n9\$dV92u8Wmk2vy5WOI017CA/zXSGfKorptWpAkySfuGsA"
SEABOT_USER_UID = "1000"
SEABOT_USER_GID = "1000"
SEABOT_USER_SHELL = "/bin/sh"
SEABOT_USER_NAME = "seabot"
SEABOT_USER_HOMEDIR = "/home/seabot"
SEABOT_USER_PASS = "\$5\$qPXWPBHBD44Ky/n9\$dV92u8Wmk2vy5WOI017CA/zXSGfKorptWpAkySfuGsA"
# Primary group
SEABOT_USER_PGROUP = "seabot"
# Supplementary groups
SEABOT_USER_SGROUPS = "shutdown,users,sudo"
# set up hostname 
hostname:pn-base-files = "seabot-orin-nvme"

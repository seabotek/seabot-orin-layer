# root password configuration 
inherit extrausers 

EXTRA_USERS_PARAMS += "\
    usermod -p '${SYSTEM_PASSWD}' root; \
    "
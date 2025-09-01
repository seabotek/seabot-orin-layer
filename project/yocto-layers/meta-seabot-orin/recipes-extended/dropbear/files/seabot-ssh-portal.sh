#!/bin/sh 

if [[ -e /usr/bin/seabot-fetch.sh ]]; then 
    /usr/bin/seabot-fetch.sh
else
    echo "No seabot-fetch.sh found" 
fi
/bin/bash  
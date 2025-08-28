#!/bin/bash

echo " Starting server ..."

pushd ${HOME}/yocto/project/yocto-buildir/tmp/deploy/deb/

echo "$(pwd)"

/usr/bin/python3 -m http.server 8080



#!/bin/bash
PROT="8080"
echo " Starting server at PORT: ${PORT}..."

pushd ${BUILD_DIR}/tmp/deploy/deb/

echo "$(pwd)"

/usr/bin/python3 -m http.server ${PORT}



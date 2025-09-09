#!/bin/bash
setup_vcstool(){
    curl -s https://packagecloud.io/install/repositories/dirk-thomas/vcstool/script.deb.sh | sudo bash
    sudo apt-get update
    sudo apt-get install python3-vcstool
}

setup_vcstool
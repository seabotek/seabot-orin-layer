#!/bin/bash 
export ROOT_DIR="$(realpath "$(dirname "$(realpath "${BASH_SOURCE[0]}")")/..")"
export SCRIPTS_DIR="${ROOT_DIR}/scripts"
export BASE_DIR="${ROOT_DIR}/project"
export LAYERS_DIR="${BASE_DIR}/yocto-layers"
export BUILD_DIR="${BASE_DIR}/yocto-buildir"
export META_SEABOT_LAYER_DIR="${LAYERS_DIR}/meta-seabot-orin" 
export DOCKER_DIR="${ROOT_DIR}/docker"
export REPO_FILE="${ROOT_DIR}/repositories.repo"
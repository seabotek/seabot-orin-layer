#!/usr/bin/env bash

# Define colors and reset code
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
EXIT_SUCCESS=0 
EXIT_ERROR=1
# Unified Logging Function
log() {
    local level="$1"
    local message="$2"

    case "$level" in
        "INFO")
            echo -e "${GREEN}[INFO]${NC} ${message}"
            ;;
        "WARN")
            echo -e "${YELLOW}[WARN]${NC} ${message}" >&2
            ;;
        "ERROR")
            echo -e "${RED}[ERROR] ${message}${NC} " >&2
            ;;
        *)
            echo -e "${RED}[ERROR] Unknown log level: $level. Message: $message${NC}" >&2
            ;;
    esac
}
if [[ ! -n ${ROOT_DIR} ]]; then 
    log "ERROR" "Please source setup-helper.sh"
    log "INFO"  "RUN: source ./scripts/setup-helper.sh"
    exit ${EXIT_ERROR}
fi 


ORIN_LAYER_MACHINE_CONFIG_FILE="${META_SEABOT_LAYER_DIR}/conf/distro/include/host-build-machine-conf.inc"


# check for docker and docker compose 
# check for vsctool 
# check for udev rules need for the recovery mode 
check_dependencie(){
    log "INFO" "Checking for $1"
    local dep=$1
    local state=$(which curl)
    if [[ -z state ]]; then 
        log "ERROR" "dependencie ${dep} is not met, please install it :)"
        exit ${EXIT_SUCCESS};
    fi 
}

check_dependencies(){ 
    check_dependencie "apt" 
    check_dependencie "docker" 
    check_dependencie "docker compose" 
    check_dependencie "vcs" 
    read -p "Are you flashing the NVDIA JETSON ORIN on this HOST machine [Y/n] " input 
    input=$(echo "${input,,}")
    if [[ $input == "y" ]]; then 
        log "INFO" "setting up udev rules for the host machine"
        sudo ${SCRIPTS_DIR}/setup-udev-rules
    else 
        log "WARN" "Please run this ${SCRIPTS_DIR}/setup-udev in the machine responsible for flashing the image"
    fi

}
# installing vscmodules using vsctool 
install_vcs_modules(){ 
    log "INFO"  "Installing VCS submodules"
    vcs import < ${REPO_FILE} 
}

run_container(){ 
   log "INFO" "Running container"  
   docker compose run --rm yocto-builder
}
configure_layer(){
    log "INFO" "Configuring meta_seabot_layer" 
    echo "===================================="
    log "INFO" "Setting up IP and PORT For HTTP DEB server" 
    read -p "Enter IP [default will be empty]: " ip_var
    read -p "Enter PORT [default will be empty]: " port_var
    

    # Create the configuration file with proper formatting

    echo "===================================="
    log "INFO" "Configuration saved to: ${ORIN_LAYER_MACHINE_CONFIG_FILE}"
    cat > "${ORIN_LAYER_MACHINE_CONFIG_FILE}" << EOF
MY_SERVER_IP="${ip_var:-}"
MY_SERVER_PORT="${port_var:-}"
EOF
        
    echo "===================================="
    log "WARN" "You can also reconfigure these settings in local.conf:"
    cat << 'EOF'
        BB_NUMBER_THREADS = "4"
        BB_NUMBER_PARSE_THREADS = "8"
        PARALLEL_MAKE = "-j 4"
EOF
    log "INFO" "You can also set TMP_DIR , DL_DIR and SSTATE_DIR"
    echo "===================================="
}

#===============================================================================
#  SEABOT-DISTRO Yocto Setup Script
#===============================================================================
info(){
    log "INFO" "scripts/launchServer.sh: this launch the DEB package http server" 
    log "INFO" "scripts/vsc_tool.sh: this scripts sets up vsctool" 
    log "INFO" "scripts/setup-udev-rules: this setup udev rules for jetsons machines on your host machine" 
}

hello(){ 
    cat << "EOF"
             _____ _____  ___  ______  _____ _____     ______ _____ _____ _____ _____ 
            /  ___|  ___|/ _ \ | ___ \|  _  |_   _|    |  _  \_   _/  ___|_   _|  _  |
            \ `--.| |__ / /_\ \| |_/ /| | | | | |______| | | | | | \ `--.  | | | | | |
             `--. \  __||  _  || ___ \| | | | | |______| | | | | |  `--. \ | | | | | |
            /\__/ / |___| | | || |_/ /\ \_/ / | |      | |/ / _| |_/\__/ / | | \ \_/ /
            \____/\____/\_| |_/\____/  \___/  \_/      |___/  \___/\____/  \_/  \___/ 
                                               @Mare-Custos
EOF

    echo " "
    info
    echo "================================================================================="
}
#===============================================================================
# Yocto Environment Setup
#===============================================================================


# Source Yocto init script
main(){ 
    hello 
    check_dependencies 
    install_vcs_modules
    configure_layer
    log "INFO" "Config Complete, You can launch your docker container"
}

main 
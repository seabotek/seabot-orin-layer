#!/bin/sh

#
# @project  image-seabot
#
# @author Moktar SELLAMI <smokthar925@gmail.com>
#
# @description  a script that desplays ASCII art and system info
#
# @license      CLOSED
#
# Copyright (c) 2025  mare-custos.
#

# exit on eny error 
set -e 
# Function to display ART 
display_art(){ 

cat <<'ART'

     ######                ##        ##                                               #####                                                 
############# ###          ###      ####                                           ##########                      ###                      
############# ####        #####     ####                                         ####                              ###                      
#  ####  ### #####        ######   #####     #########   ######   ######         ###           ###   ###   #####  ######   ######     ##### 
 ######    ######         ### ##  ### ###   ###   ####   ####   ###    ###       ###           ###   ###  ###      ###   ####   ###  ###    
 ###### #########        ###  ######  ###  ###     ###   ###    ##########       ###           ###   ###   #####   ###   ###    ###   ##### 
  ###### ######          ###   ####   ###   ###    ###   ###    ###               ####     ##  ###   ###      ###  ###   ###    ###      ###
    ######               ###    ##     ###   #########   ###     ########           #########   #######   ######   ###    ########   ###### 
      #####                                                                                                                                 
                                     
ART
}
get_disk_size(){
  local _var1=$(df -h | awk 'NR==3 {print $2}')
  echo ${_var1}
}
get_disk_usage(){
 local _var2=$(df -h | awk 'NR==3 {print $3}')
 echo ${_var2}
}
display_info(){
local _disk_size=$(get_disk_size)
local _disk_usage=$(get_disk_usage)
cat << INF
Welcome to $DISTRO_NAME $VERSION

Platform:   $PLATFORM
Storage:    $STORAGE_TYPE  ${_disk_usage} / ${_disk_size}
Linux:      $LINUX_VERSION
PKG:        $PKG_MANAGER
INF
} 


main(){ 

  echo "" 
  echo "#########################################################################################################################################" 
  echo ""  
  display_art 
  echo "" 
  display_info 
  echo "" 
  echo "#########################################################################################################################################" 
  echo ""  
}


main
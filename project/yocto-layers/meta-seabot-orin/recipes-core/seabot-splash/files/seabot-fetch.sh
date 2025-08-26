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

display_info(){
cat << 'INF'
Welcome to $DISTRO_NAME $VERSION

Platform:   $PLATFORM
Storage:    $STORAGE_TYPE
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
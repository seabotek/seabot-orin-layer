# seabot-orin-layer 
Custom linux image for NVIDIA Jetson ORIN SBC using Yocto


# Usage 
- first install docker and docker compose [LINK](https://idroot.us/install-docker-compose-ubuntu-22-04/) <br> 
- in a seperate terminal run `docker compose watch` to sync any changes made on the Dockerfile or docker-compose.yml
- in an other terminal run `docker run -- rm yocto-builder`


# Boot mode 
> to put the jetson into boot mode conect the pin 9 & 10 to eqch otherer  


the hostanme rover and username seabot 

Hardware specs and pinouts [Link](https://developer.nvidia.com/embedded/learn/jetson-orin-nano-devkit-user-guide/hardware_spec.html)
Developper Guide [LINK](https://docs.nvidia.com/jetson/archives/r36.4/DeveloperGuide/)
NVIDIA Yocto Project Guide [Link](https://developer.nvidia.com/docs/drive/drive-os/6.0.6/public/drive-os-linux-sdk/common/topics/sys_programming/BuildingtheYoctoProjectComponentsforDRIV8.html)

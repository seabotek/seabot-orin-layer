# seabot-orin-layer 
      _____ _____  ___  ______  _____ _____      ___________ _____ _   _        _       _____   _____________ 
     /  ___|  ___|/ _ \ | ___ \|  _  |_   _|    |  _  | ___ \_   _| \ | |      | |     / _ \ \ / /  ___| ___ \
     \ `--.| |__ / /_\ \| |_/ /| | | | | |______| | | | |_/ / | | |  \| |______| |    / /_\ \ V /| |__ | |_/ /
      `--. \  __||  _  || ___ \| | | | | |______| | | |    /  | | | . ` |______| |    |  _  |\ / |  __||    / 
     /\__/ / |___| | | || |_/ /\ \_/ / | |      \ \_/ / |\ \ _| |_| |\  |      | |____| | | || | | |___| |\ \ 
     \____/\____/\_| |_/\____/  \___/  \_/       \___/\_| \_|\___/\_| \_/      \_____/\_| |_/\_/ \____/\_| \_|
                                                                                                         
                                                                                                         
Custom yocto layer for NVIDIA Jetson ORIN SBC using Yocto<br>
yocto: scarthgap

# Usage 
- clone the repo 
- install dependencies `git curl tar and vcstool` for vsctool you can use the `scripts/setup_vcstool.sh` 
- source the `scripts/setup-helper.sh`
- run the `scripts/setup-project.sh`
- first install docker and docker compose [LINK](https://idroot.us/install-docker-compose-ubuntu-22-04/) <br> 
- in a seperate terminal run `docker compose watch` to sync any changes made on the Dockerfile or docker-compose.yml
- in an other terminal run `cd docker && docker compose run -- rm yocto-builder`
## Flashing 

- if you are flashing the jetson orin on your host please run before this script 

```bash
./scripts/setup-udev-rules
``` 
- in the `project/yocto-buildir/tmp/deploy/images/seabot-orin-nvme/image-seabot-seabot-orin-nvme.rootfs.tegraflash.tar.gz` extract to a dir `tmp` 
```
tar xvf  image-seabot-seabot-orin-nvme.rootfs.tegraflash.tar.gz tmp -C tmp
```
- go to `tmp dir` 
- make sure that the nvidia is in recovery mode, attach the usb cable to your host machine
- to test that you can run `lusb` and you should see it apperea like this 

```bash
Bus 001 Device 021: ID 0955:7623 NVIDIA Corp. APX
```
- now you are ready for flashing 
```bash
cd tmp 
./initrd-flash
```
- if this is not your first time and want to win some time you can run 
```bash
./initrd-flash --skip-bootloader
```
- after flashing, the nvidia should boot hopefully ;)

## SSH connection 
- on your system setup static ip address `shared to other computers`: ip : `192.168.100.3` 
- we have `seabot` user and `root` userm, passowrd is `orin` 
- the nvidia orin ip `192.168.100.2` and the hostname is `seabot-orin-nvme`

# Boot mode 
> to put the jetson into boot mode conect the pin 9 & 10 to eqch otherer  

- Hardware specs and pinouts [Link](https://developer.nvidia.com/embedded/learn/jetson-orin-nano-devkit-user-guide/hardware_spec.html)
- Developper Guide [LINK](https://docs.nvidia.com/jetson/archives/r36.4/DeveloperGuide/)
- NVIDIA Yocto Project Guide [Link](https://developer.nvidia.com/docs/drive/drive-os/6.0.6/public/drive-os-linux-sdk/common/topics/sys_programming/BuildingtheYoctoProjectComponentsforDRIV8.html)

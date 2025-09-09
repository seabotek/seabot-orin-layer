TOOLCHAIN_HOST_TASK:append = " nativesdk-packagegroup-cuda-sdk-host"
# Core CUDA
IMAGE_INSTALL += " \
    cuda-toolkit \
    cuda-driver \
    cuda-libraries \
    cuda-nvcc \
    cudnn \
    tensorrt-core \
"


# Tegra integration
IMAGE_INSTALL += " \
    tegra-libraries-cuda \
    tegra-cuda-utils \
"
# virtualizaion 
IMAGE_INSTALL += " \
            nvidia-docker \
            "
            
# tergra libraries 
IMAGE_INSTALL += "\
    tegra-libraries-camera \
    gstreamer1.0 \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-tegra \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-bad \
    tegra-libraries-multimedia-v4l \
    tegra-container-passthrough \
"
IMAGE_INSTALL += "\
        libuvc \
        "
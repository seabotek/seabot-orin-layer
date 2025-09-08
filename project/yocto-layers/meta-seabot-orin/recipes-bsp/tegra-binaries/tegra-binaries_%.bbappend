FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://flash_l4t_t234_nvme-custom.xml"

PARTITION_LAYOUT_EXTERNAL = "flash_l4t_t234_nvme-custom.xml"
PARTITION_DIR = "${S}/tools/kernel_flash/"
SRC_MDIR :=  "${THISDIR}"
do_preconfigure:prepend(){ 
   mkdir -p  ${PARTITION_DIR}
   bbplain "running copy now ..."
   install -m 0644 "${SRC_MDIR}/files/${PARTITION_LAYOUT_EXTERNAL}" ${PARTITION_DIR}
}
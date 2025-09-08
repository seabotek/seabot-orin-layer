tegraflash_custom_pre:append () {
    bbplain "==========================================="
    dd if=/dev/zero of=swap.img bs=1M count=4096
    /sbin/mkswap swap.img 
    bbplain "==========================================="
}

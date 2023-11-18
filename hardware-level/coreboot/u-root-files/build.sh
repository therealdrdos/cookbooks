#!/bin/sh

### compile u-root initramfs ###

CONFIG_LINUXBOOT_UROOT_UINITCMD="echo LinuxBoot"
CONFIG_LINUXBOOT_UROOT_INITCMD="init"
CONFIG_LINUXBOOT_UROOT_SHELL="elvish"
CONFIG_LINUXBOOT_UROOT_FORMAT="bb"

GOARCH=arm64 ./u-root \
        -uroot-source . \
        -defaultsh elvish \
        -o initramfs.cpio boot coreboot-app \
        ./cmds/core/init \
        ./cmds/core/echo \
    	./cmds/core/mkdir \
        ./cmds/core/strace \
        ./cmds/core/elvish \
        ./cmds/core/mount \
        ./cmds/boot/boot \
        ./cmds/boot/fbnetboot \
        ./cmds/boot/fitboot \
	./cmds/boot/localboot \
        ./cmds/boot/pxeboot \
        ./cmds/boot/systemboot \
        ./cmds/core/kexec \
    	./cmds/core/mktemp \
    	./cmds/core/blkid \

### put utilities inside of the initramfs ###

# decompress
mkdir initramfs
cd initramfs
cp ../initramfs.cpio .
sudo cpio -idm < ./initramfs.cpio
rm initramfs.cpio

# insert utilities for linuxboot
cp -r ../utils/ .

# compress
find . -print0 | cpio --null -ov --format=newc > ../initramfs.cpio

# cleanup
cd ../
sudo rm -rf initramfs/


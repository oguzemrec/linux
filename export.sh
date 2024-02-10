#!/bin/bash

# Linux Build variables export.sh

# Prevent running if any errors occur
set -e

# Checking if the script is being sourced or not
if ! (return 0 2>/dev/null); then
    echo "This script should be sourced, not executed directly."
    exit 1
fi

# Setting up environment variables
export CC=${PWD}/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
export ARCH=arm
export CROSS_COMPILE=${CC}
export KERNEL_SRC=${PWD}/linux/
export KERNEL_OUT=${PWD}/output/linux
export UBOOT_SRC=${PWD}/u-boot/
export UBOOT_OUT=${PWD}/output/u-boot
export BUSYBOX_SRC=${PWD}/busybox/
export BUSYBOX_OUT=${PWD}/output/busybox
export ROOT_FS=${PWD}/output/rootfs
export SYSROOT=`${CROSS_COMPILE}gcc --print-sysroot`
export MODULES_DIR=${PWD}/output/modules
export IMAGES_DIR=${PWD}/output/images

echo "Environment variables for Linux Building have been set."
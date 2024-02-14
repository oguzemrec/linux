#!/bin/bash

# Linux Build variables export.sh

# Prevent running if any errors occur
set -e

# Checking if the script is being sourced or not
if ! (return 0 2>/dev/null); then
    echo "This script should be sourced, not executed directly."
    exit 1
fi

# Scriptin bulunduğu dizini bul
SCRIPT_DIR=$(dirname "$BASH_SOURCE")

# Bulunan dizini mutlak yola çevir (gerekirse)
SCRIPT_DIR_ABS=$(realpath "$SCRIPT_DIR")

# Setting up environment variables
export CROSS_COMPILE=${SCRIPT_DIR_ABS}/toolchain/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export AR=${CROSS_COMPILE}ar
export SYSROOT=`${CROSS_COMPILE}gcc --print-sysroot`

export ARCH=arm
export KERNEL_SRC=${SCRIPT_DIR_ABS}/linux/
export KERNEL_OUT=${SCRIPT_DIR_ABS}/output/linux
export UBOOT_SRC=${SCRIPT_DIR_ABS}/u-boot/
export UBOOT_OUT=${SCRIPT_DIR_ABS}/output/u-boot
export BUSYBOX_SRC=${SCRIPT_DIR_ABS}/busybox/
export BUSYBOX_OUT=${SCRIPT_DIR_ABS}/output/busybox
export ROOT_FS=${SCRIPT_DIR_ABS}/output/rootfs
export MODULES_DIR=${SCRIPT_DIR_ABS}/output/modules
export PACKAGES_DIR=${SCRIPT_DIR_ABS}/packages
export PACKAGES_OUT=${SCRIPT_DIR_ABS}/output/packages
export IMAGES_DIR=${SCRIPT_DIR_ABS}/output/images

echo "Environment variables for Linux Building have been set."

# ${CROSS_COMPILE}readelf -a /home/oemre/workspace/beaglebone/output/rootfs/bin/bash | grep "Shared"
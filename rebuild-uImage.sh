#!/bin/bash

source export.sh

#Create Config file
#make -C $KERNEL_SRC O=$KERNEL_OUT bb.org_defconfig


rm -f $KERNEL_OUT/usr/initramfs_data.cpio.gz
# make -C $KERNEL_SRC O=$KERNEL_OUT menuconfig
make -C $KERNEL_SRC O=$KERNEL_OUT zImage LOADADDR=0x80008000 -j16
make -C $KERNEL_SRC O=$KERNEL_OUT modules -j16
make -C $KERNEL_SRC O=$KERNEL_OUT dtbs

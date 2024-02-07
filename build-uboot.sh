#!/bin/bash

source export.sh

make -C $UBOOT_SRC O=$UBOOT_OUT distclean
make -C $UBOOT_SRC O=$UBOOT_OUT am335x_evm_defconfig
make -C $UBOOT_SRC O=$UBOOT_OUT menuconfig
make -C $UBOOT_SRC O=$UBOOT_OUT -j16
sudo cp $UBOOT_OUT/tools/mkimage /usr/local/bin
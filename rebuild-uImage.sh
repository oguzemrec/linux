#!/bin/bash

source export.sh

rm -f $KERNEL_OUT/usr/initramfs_data.cpio

# Check if the argument provided is "menuconfig"
if [ "$1" == "menuconfig" ]; then
    # Execute menuconfig command
    make -C $KERNEL_SRC O=$KERNEL_OUT menuconfig
fi

make -C $KERNEL_SRC O=$KERNEL_OUT zImage LOADADDR=0x80008000 -j16
make -C $KERNEL_SRC O=$KERNEL_OUT modules -j16
make -C $KERNEL_SRC O=$KERNEL_OUT dtbs -j16

rm $IMAGES_DIR/uImage $IMAGES_DIR/am335x-boneblack.dtb $IMAGES_DIR/zImage || true

cp -a $KERNEL_OUT/arch/arm/boot/uImage $IMAGES_DIR/
cp -a $KERNEL_OUT/arch/arm/boot/zImage $IMAGES_DIR/
cp -a $KERNEL_OUT/arch/arm/boot/dts/am335x-boneblack.dtb $IMAGES_DIR/ 

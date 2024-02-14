#!/bin/bash

# Source the environment variables
source export.sh

# Initialize flags
clean_flag=0
menuconfig_flag=0

# Iterate over all passed arguments
for arg in "$@"
do
    if [[ "$arg" == "clean" ]]; then
        clean_flag=1
    elif [[ "$arg" == "menuconfig" ]]; then
        menuconfig_flag=1
    fi
done

# Perform actions based on flags
if [[ $clean_flag -eq 1 ]]; then
    make -C $BUSYBOX_SRC O=$BUSYBOX_OUT clean
fi

if [[ $menuconfig_flag -eq 1 ]]; then
    make -C $BUSYBOX_SRC O=$BUSYBOX_OUT menuconfig
fi

make -C $BUSYBOX_SRC O=$BUSYBOX_OUT -j16
rm -fr $BUSYBOX_OUT/_install
make -C $BUSYBOX_SRC O=$BUSYBOX_OUT install
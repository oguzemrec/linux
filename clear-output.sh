#!/bin/bash

source export.sh
rm -rf output/modules/*
make -C $KERNEL_SRC O=$KERNEL_OUT modules_install INSTALL_MOD_PATH=${PWD}/output/modules/
#make -C $KERNEL_SRC O=$KERNEL_OUT firmware_install
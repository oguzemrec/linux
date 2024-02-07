#!/bin/bash

source export.sh

make -C $BUSYBOX_SRC O=$BUSYBOX_OUT clean
make -C $BUSYBOX_SRC O=$BUSYBOX_OUT menuconfig
make -C $BUSYBOX_SRC O=$BUSYBOX_OUT -j8
rm -fr $BUSYBOX_OUT/_install
make -C $BUSYBOX_SRC O=$BUSYBOX_OUT install
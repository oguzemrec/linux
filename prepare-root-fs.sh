#!/bin/bash

source export.sh

# Copy Busybox applets
cp -a $BUSYBOX_OUT/_install/* $ROOT_FS/

# Copy Modules
cp -a $MODULES_DIR/lib/* $ROOT_FS/lib

# Copy Dynamic Libraries to RootFs lib
cp -a $SYSROOT/lib/ld-linux-armhf.so.3 $ROOT_FS/lib
cp -a $SYSROOT/lib/ld-linux-armhf.so.3 $ROOT_FS/lib/
cp -a $SYSROOT/lib/libc.so.6 $ROOT_FS/lib/
cp -a $SYSROOT/lib/libm.so.6 $ROOT_FS/lib/

# Remove the trivial file
rm -f $ROOT_FS/linuxrc

# Check the size of Root Filesystem
ls -l $ROOT_FS
du -ks $ROOT_FS

echo "RootFS has been established!"
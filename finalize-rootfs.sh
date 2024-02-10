#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


source export.sh

#Drop the root 
chown -R root:root $ROOT_FS


#prepare cpio file for rootfs
rm $IMAGES_DIR/rootfs.cpio || true
cd $ROOT_FS
find . | cpio -H newc -o > $IMAGES_DIR/rootfs.cpio

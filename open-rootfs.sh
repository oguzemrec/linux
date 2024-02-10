#!/bin/bash

# Check if the script is running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi


source export.sh

uid=$(id -u "$SUDO_USER")
gid=$(id -g "$SUDO_USER")

#Drop the root 
chown -R "$uid":"$gid" $ROOT_FS

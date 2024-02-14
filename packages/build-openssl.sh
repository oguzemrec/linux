#!/bin/bash

# Source the environment variables
source ../export.sh

package=openssl

archive=$(echo ${package}*.tar.gz)

# Extract the tar.gz file
tar zxvf "$archive" -C "$PACKAGES_DIR"
 
# Attempt to change into the directory extracted from the tar.gz
# Assuming the directory has the same base name as the tar.gz file
directory=$(tar tzf "$archive" | head -1 | cut -f1 -d"/")
cd "$directory" || exit

out=${PACKAGES_OUT}/${package}
mkdir -p $out

#openssh icin kurulum yeri farkli bir yer olmali 
./Configure linux-generic32 --prefix=/usr
make -j16 AR=${AR} ARFLAGS="r" CC=${CC} RANLIB=${CROSS_COMPILE}ranlib 
make -j16 AR=${AR} ARFLAGS="r" CC=${CC} RANLIB=${CROSS_COMPILE}ranlib INSTALL_PREFIX=$ROOT_FS install
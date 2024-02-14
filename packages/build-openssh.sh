#!/bin/bash

# Source the environment variables
source ../export.sh

package=openssh

archive=$(echo ${package}*.tar.gz)

# Extract the tar.gz file
tar zxvf "$archive" -C "$PACKAGES_DIR"
 
# Attempt to change into the directory extracted from the tar.gz
# Assuming the directory has the same base name as the tar.gz file
directory=$(tar tzf "$archive" | head -1 | cut -f1 -d"/")
cd "$directory" || exit

# Check for the existence of zlib and openssl
if [ ! -d "${PACKAGES_OUT}/zlib" ]; then
    echo "Error: zlib directory does not exist at ${PACKAGES_OUT}/zlib."
    exit 1
fi

if [ ! -d "${PACKAGES_OUT}/openssl" ]; then
    echo "Error: openssl directory does not exist at ${PACKAGES_OUT}/openssl."
    exit 1
fi

out=${PACKAGES_OUT}/${package}
mkdir -p $out

autoreconf
./configure --host=arm-linux --sysconfdir=/etc/ssh --disable-strip --disable-etc-default-login --with-libs --with-zlib=${PACKAGES_OUT}/zlib --with-ssl-dir=${PACKAGES_OUT}/openssl AR=${AR} CC=${CC} LDFLAGS="-L${SYSROOT}/lib -lcrypt"

make O=$out -j16

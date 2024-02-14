#!/bin/bash

# Source the environment variables
source export.sh


# Subdirectories to copy
ROOT_DIRS=("etc")
# Subdirectories to copy
USR_DIRS=("lib" "libexec" "bin" "sbin")

# Automatically populate SOURCE_DIRS with directories found in PACKAGES_OUT
readarray -t SOURCE_DIRS < <(find "$PACKAGES_OUT" -mindepth 1 -maxdepth 1 -type d)

# Iterate over each source directory
for SOURCE_DIR in "${SOURCE_DIRS[@]}"; do
    echo "Processing $SOURCE_DIR..."
    
    # Check and copy each specified subdirectory to USR_Dir
    for SUBDIR in "${USR_DIRS[@]}"; do
        if [ -d "$SOURCE_DIR/$SUBDIR" ]; then
            # Construct the destination path
            DEST_DIR="$ROOT_FS/usr/$SUBDIR"
            
            # Copy the subdirectory
            echo "Copying $SUBDIR from $SOURCE_DIR to $DEST_DIR"
            cp -a "$SOURCE_DIR/$SUBDIR/." "$DEST_DIR/"
        else
            echo "Directory $SUBDIR does not exist in $SOURCE_DIR"
        fi
    done

    # Check and copy each specified subdirectory to Root_Dir
    for SUBDIR in "${ROOT_DIRS[@]}"; do
        if [ -d "$SOURCE_DIR/$SUBDIR" ]; then
            # Construct the destination path
            DEST_DIR="$ROOT_FS/$SUBDIR"
            
            # Copy the subdirectory
            echo "Copying $SUBDIR from $SOURCE_DIR to $DEST_DIR"
            cp -a "$SOURCE_DIR/$SUBDIR/." "$DEST_DIR/"
        else
            echo "Directory $SUBDIR does not exist in $SOURCE_DIR"
        fi
    done

done

echo "All specified subdirectories have been copied."

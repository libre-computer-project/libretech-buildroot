#!/bin/bash
set -ex

BOARD=$2
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
. $SCRIPT_DIR/../bootloader.sh

IMAGE_SIZE=$(stat -c %s $BINARIES_DIR/Image)
IMAGE_SIZE=$((((IMAGE_SIZE + (17 << 20) - 1) >> 23 << 3) - 1))
GENIMG_CFG=$BINARIES_DIR/genimage.cfg

BOOTLOADER_get $BOARD $BINARIES_DIR/$BOARD

#wget -nc https://boot.libre.computer/ci/$BOARD -O $BINARIES_DIR/$BOARD

cp -f $SCRIPT_DIR/genimage.cfg "$BINARIES_DIR/"

sed -i "s/__SIZE__/$IMAGE_SIZE/" "$GENIMG_CFG"
sed -i "s/__BL_OFFSET__/$(BOOTLOADER_getOffset $BOARD)/" "$GENIMG_CFG"
sed -i "s/__BOARD__/$BOARD/" "$GENIMG_CFG"

support/scripts/genimage.sh -c "$GENIMG_CFG"

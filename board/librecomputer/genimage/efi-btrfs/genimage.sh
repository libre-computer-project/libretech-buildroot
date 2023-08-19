#!/bin/bash
set -ex

BOARD=$2

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
. $SCRIPT_DIR/../bootloader.sh

GENIMG_CFG=$BINARIES_DIR/genimage.cfg

BOOTLOADER_get $BOARD $BINARIES_DIR/$BOARD

#wget -nc https://boot.libre.computer/ci/$BOARD -O $BINARIES_DIR/$BOARD

cp -f $SCRIPT_DIR/genimage.cfg "$BINARIES_DIR/"
cp -f $SCRIPT_DIR/boot.ini "$BINARIES_DIR/"

sed -i "s/__BL_OFFSET__/$(BOOTLOADER_getOffset $BOARD)/" "$GENIMG_CFG"
sed -i "s/__BOARD__/$BOARD/" "$GENIMG_CFG"

support/scripts/genimage.sh -c "$GENIMG_CFG"

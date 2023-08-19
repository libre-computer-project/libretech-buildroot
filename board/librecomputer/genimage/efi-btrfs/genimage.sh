#!/bin/bash
set -x

BOARD=$2
GENIMG_CFG=$BINARIES_DIR/genimage.cfg

wget -nc https://boot.libre.computer/ci/$BOARD -O $BINARIES_DIR/$BOARD

cp -f $(dirname "${BASH_SOURCE[0]}")/genimage.cfg "$BINARIES_DIR/"
cp -f $(dirname "${BASH_SOURCE[0]}")/boot.ini "$BINARIES_DIR/"

sed -i "s/__BOARD__/$BOARD/" "$GENIMG_CFG"

support/scripts/genimage.sh -c "$GENIMG_CFG"

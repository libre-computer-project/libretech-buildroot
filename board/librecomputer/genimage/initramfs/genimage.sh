#!/bin/bash
set -x

BOARD=$2
IMAGE_SIZE=$(stat -c %s $BINARIES_DIR/Image)
IMAGE_SIZE=$((((IMAGE_SIZE + (17 << 20) - 1) >> 23 << 3) - 1))
GENIMG_CFG=$BINARIES_DIR/genimage.cfg

wget https://boot.libre.computer/ci/$BOARD -O $BINARIES_DIR/$BOARD

cp -f $(dirname "${BASH_SOURCE[0]}")/genimage.cfg "$GENIMG_CFG"

sed -i "s/__SIZE__/$IMAGE_SIZE/" "$GENIMG_CFG"
sed -i "s/__BOARD__/$BOARD/" "$GENIMG_CFG"

support/scripts/genimage.sh -c "$GENIMG_CFG"

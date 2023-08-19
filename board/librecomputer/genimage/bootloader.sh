#!/bin/bash

declare -A BOOTLOADER_OFFSET=(
	[all-h3-cc-h3]=16
	[all-h3-cc-h5]=16
	[aml-a311d-cc]=1
	[aml-s805x-ac]=1
	[aml-s905x-cc]=1
	[aml-s905x-cc-v2]=1
	[aml-s905d-pc]=1
	[aml-s905d3-cc]=1
	[roc-rk3328-cc]=64
	[roc-rk3399-pc]=64
	)

BOOTLOADER_URL="https://boot.libre.computer/ci/"
BOOTLOADER_BLK_SIZE=512

BOOTLOADER_getOffset(){
	local board=$1
	echo -n $((${BOOTLOADER_OFFSET[$board]} * BOOTLOADER_BLK_SIZE))
}

BOOTLOADER_getURL(){
	echo -n "${BOOTLOADER_URL}${1}"
}

BOOTLOADER_getHeaders(){
	WGET_getHeaders "$BOOTLOADER_URL/$1"
}

BOOTLOADER_get(){
	local board=$1
	local bl=$2
	echo "$FUNCNAME: downloading $board bootloader to $bl."
	echo
	wget -nc -O $bl "$BOOTLOADER_URL/$board" 2>&1 && echo "$FUNCNAME: downloaded $board bootloader to $bl." || echo "$FUNCNAME: noop $board bootloader exists at $bl."
}

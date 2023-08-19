# libretech-buildroot

buildroot designed for Libre Computer boards with optimized components and design practices.

This branch is designed to be rebase-able on buildroot master so it is not considered a fork.

All components are organized into composible profiles by arch, board, image layout, and overlay.

defconfigs can be considered the functional end of a composition of profiles.

Also see the [original buildroot README](README).

## configs

defconfigs are organized into a tree structure based on board under configs.

* configs
  * librecomputer
    * aml-s905x-cc
      * efi-btrfs_defconfig

```
make librecomputer/aml-s905x-cc/efi-btrfs_defconfig
make
```

## board

board files are organized into a tree structure based on architecture, board, image generation, composible overlays

* board
  * librecomputer
    * aml
      * gxl
        * overlay
        * s905x
          * overlay
    * aml-s905x-cc
      * overlay
      * genimage
    * genimage
      * initramfs
        * genimage.cfg
        * genimage.sh
      * efi-btrfs
        * boot.cmd
        * boot.ini
        * genimage.cfg
        * genimage.sh
    * overlay
      * debugfs
      * stress-ng-cpu
    * project

### genimage

the genimage directories under board/librecomputer holds image layout profiles to support functions

* initramfs - basic initramfs system in efi-vfat booted via efi
* efi-btrfs - basic system with kernel in efi-vfat and rootfs in btrfs booted via efi

### overlay

the overlay directories under board/librecomputer holds overlays profiles to support functions

* debugfs - adds debugfs automount to the image via init script
* stress-ng-cpu - adds stress-ng cpu stressor to the image via init script

### project

the project directory is recommended for storing external submodules or repos for referencing

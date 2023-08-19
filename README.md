# libretech-buildroot

buildroot designed for Libre Computer boards with optimized components and design practices.

This branch is designed to be rebase-able on buildroot master so it is not considered a fork.

Also see [buildroot original README](README).

## libretech customizations

### configs

defconfigs are organized into a tree structure based on board under configs.

* configs
  * librecomputer
    * aml-s905x-cc
      * efi-btrfs_defconfig

### board

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
      * efi-btrfs
      * stress-ng-cpu
    * project

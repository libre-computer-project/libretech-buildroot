part uuid $devtype $devnum:2 rootfs_uuid
setenv bootargs "root=PARTUUID=$rootfs_uuid rootwait"
bootmeth order efi
boot

### AnyKernel3 Ramdisk Mod Script
## Munch (Xiaomi POCO F4 / Redmi K40S)

properties() { '
kernel.string=KernelSU Munch (4.19.157)
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=munch
'; }

BLOCK=boot;
IS_SLOT_DEVICE=1;
RAMDISK_COMPRESSION=auto;
PATCH_VBMETA_FLAG=0;

. tools/ak3-core.sh;

dump_boot;
write_boot;

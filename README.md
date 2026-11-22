# KernelSU build for Munch

The GitHub Actions workflow builds Xiaomi's `munch-s-oss` Linux 4.19.157
source with legacy KernelSU `v0.9.5` and the matching Android Clang 10 toolchain.
It packages the kernel as an AnyKernel3 ZIP for the `munch` device.

The ZIP targets the active `boot` slot and repacks the existing boot ramdisk.
It does not include or modify the workspace's stock `boot.img`, `dtbo.img`, or
`vendor_boot.img`, and it does not patch `vbmeta`.

Run the workflow with **Actions → Build KernelSU for Munch → Run workflow**.
The ZIP and build metadata are uploaded as workflow artifacts.

This is an experimental build from Xiaomi's published source snapshot. Keep the
stock boot image and vendor modules available for recovery; this kernel has not
been boot-tested on the device.

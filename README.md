# KernelSU build for Munch

The workflow uses Xiaomi's `munch-s-oss` Linux 4.19.157 source, legacy
KernelSU `v0.9.5`, and an AnyKernel3 package that preserves the installed boot
ramdisk. It is manual-only.

## Display source bridge under evaluation

The public Munch 4.19.157 tree has `techpack/stub`, but no `techpack/display`.
Its DRM code references Xiaomi display symbols. The workflow adds only
`techpack/display` from Xiaomi's Alioth R source at commit
`2fdca387269615872d4ff798e8da7d33345c1338` (kernel 4.19.113). That source
defines the missing symbols with matching function signatures:

- `dsi_display_set_thermal_hbm_disabled`
- `dsi_display_get_hw_vsync_info`
- `smart_fps_value_show`

This is a source compatibility experiment, not a verified stock display
backport. A successful link does not establish runtime compatibility with the
ROM or its vendor modules. No image has been flashed.

The first build with this bridge compiled the display subtree and resolved
those DRM references. Clang 10 and Ubuntu LLD reject the R_AARCH64_ABS32
relocation for the version CRC of gsi_write_channel_scratch. Ubuntu's GCC 11
fails earlier on this 4.19 source. The next attempt uses the pinned Android
GCC 4.9 cross-toolchain and its matching linker, fixes two WALT debug format/type mismatches, disables only DYNAMIC_DEBUG, and explicitly
retains CONFIG_MODVERSIONS=y.

The stock `boot.img`, `dtbo.img`, and `vendor_boot.img` remain outside this repo.

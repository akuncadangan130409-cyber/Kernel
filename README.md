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
relocation for the version CRC of gsi_write_channel_scratch. Ubuntu's GCC 11 and Android GCC 4.9 expose unrelated source/compiler
failures. The current attempt returns compilation to the pinned Android Clang
10 toolchain, uses GCC 11 preprocessing only for genksyms, and links with the
pinned Android GCC 4.9 linker. It keeps CONFIG_MODVERSIONS=y and disables only
DYNAMIC_DEBUG for the GNU linker.

The stock `boot.img`, `dtbo.img`, and `vendor_boot.img` remain outside this repo.

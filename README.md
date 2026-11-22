# KernelSU build for Munch

The workflow is prepared for Xiaomi's `munch-s-oss` Linux 4.19.157 source,
legacy KernelSU `v0.9.5`, and an AnyKernel3 package that would preserve the
installed boot ramdisk. It is manual-only while the required source is missing.

## Current blocker

The public `munch-s-oss` source tree has `techpack/stub`, but no matching
`techpack/display`. Its DRM code references Xiaomi display symbols that cannot
be linked without that implementation. The GitHub build reached final linking
and failed on these unresolved symbols:

- `dsi_display_set_thermal_hbm_disabled`
- `dsi_display_get_hw_vsync_info`
- `smart_fps_value_show`

The implementations found in public Munch-related trees are based on newer
4.19.246/4.19.325 kernels. They are not being substituted into the stock
4.19.157 build because compatibility with the ROM's vendor modules is unverified.

A source tree containing the matching `techpack/display` is needed to finish
this build. Until then, no flashable ZIP or kernel artifact has been produced.

The stock `boot.img`, `dtbo.img`, and `vendor_boot.img` remain outside this repo.

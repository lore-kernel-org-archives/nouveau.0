From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 00/20] Convert all remaining drivers to GEM object functions
Date: Thu, 13 Aug 2020 10:36:24 +0200
Message-ID: <20200813083644.31711-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olek
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Id: nouveau.vger.kernel.org

The GEM and PRIME related callbacks in struct drm_driver are deprecated in
favor of GEM object functions in struct drm_gem_object_funcs. This patchset
converts the remaining drivers to object functions and removes most of the
obsolete interfaces.

Patches #1 to #18 convert DRM drivers to GEM object functions, one by one.
Each patch moves existing callbacks from struct drm_driver to an instance
of struct drm_gem_object_funcs, and sets these funcs when the GEM object is
initialized. The expection is .gem_prime_mmap. There are different ways of
how drivers implement the callback, and moving it to GEM object functions
requires a closer review for each.

Patch #19 converts xlnx to CMA helper macros. There's no apparent reason
why the driver does the GEM setup on it's own. Using CMA helper macros
adds GEM object functions implicitly.

With most of the GEM and PRIME moved to GEM object functions, related code
in struct drm_driver and in the DRM core/helpers is being removed by patch
#20.

Further testing is welcome. I tested the drivers for which I have HW
available, which are gma500, i915, nouveau, radeon and vc4. The console,
Weston and Xorg apparently work with the patches applied.

Thomas Zimmermann (20):
  drm/amdgpu: Introduce GEM object functions
  drm/armada: Introduce GEM object functions
  drm/etnaviv: Introduce GEM object functions
  drm/exynos: Introduce GEM object functions
  drm/gma500: Introduce GEM object functions
  drm/i915: Introduce GEM object functions
  drm/mediatek: Introduce GEM object functions
  drm/msm: Introduce GEM object funcs
  drm/nouveau: Introduce GEM object functions
  drm/omapdrm: Introduce GEM object functions
  drm/pl111: Introduce GEM object functions
  drm/radeon: Introduce GEM object functions
  drm/rockchip: Convert to drm_gem_object_funcs
  drm/tegra: Introduce GEM object functions
  drm/vc4: Introduce GEM object functions
  drm/vgem: Introduce GEM object functions
  drm/vkms: Introduce GEM object functions
  drm/xen: Introduce GEM object functions
  drm/xlnx: Initialize DRM driver instance with CMA helper macro
  drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 12 +++
 drivers/gpu/drm/armada/armada_drv.c           |  3 -
 drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
 drivers/gpu/drm/armada/armada_gem.h           |  2 -
 drivers/gpu/drm/drm_gem.c                     | 35 ++------
 drivers/gpu/drm/drm_gem_cma_helper.c          |  6 +-
 drivers/gpu/drm/drm_prime.c                   | 17 ++--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +
 drivers/gpu/drm/gma500/gem.c                  | 18 +++-
 drivers/gpu/drm/gma500/gem.h                  |  3 +
 drivers/gpu/drm/gma500/psb_drv.c              |  9 --
 drivers/gpu/drm/gma500/psb_drv.h              |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  9 +-
 drivers/gpu/drm/i915/i915_drv.c               | 10 ++-
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
 drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
 drivers/gpu/drm/msm/msm_drv.h                 |  1 -
 drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
 drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
 drivers/gpu/drm/omapdrm/omap_gem.c            | 16 +++-
 drivers/gpu/drm/omapdrm/omap_gem.h            |  1 -
 drivers/gpu/drm/pl111/pl111_drv.c             | 28 +++++-
 drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
 drivers/gpu/drm/radeon/radeon_object.c        | 26 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 10 +++
 drivers/gpu/drm/tegra/drm.c                   |  4 -
 drivers/gpu/drm/tegra/gem.c                   |  8 ++
 drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
 drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
 drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
 drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
 drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
 drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
 drivers/gpu/drm/xen/xen_drm_front.c           | 12 +--
 drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
 include/drm/drm_drv.h                         | 85 +------------------
 52 files changed, 311 insertions(+), 306 deletions(-)

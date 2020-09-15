From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2 00/21] Convert all remaining drivers to
 GEM object functions
Date: Tue, 15 Sep 2020 17:25:28 +0200
Message-ID: <b527fde4-b456-6683-4a9e-0f7dcf1525be@amd.com>
References: <20200915145958.19993-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.co
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
List-Id: nouveau.vger.kernel.org

Added my rb to the amdgpu and radeon patches.

Should we pick those up through the amd branches or do you want to push 
everything to drm-misc-next?

I think the later since this should result in much merge clash.

Christian.

Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
> The GEM and PRIME related callbacks in struct drm_driver are deprecated in
> favor of GEM object functions in struct drm_gem_object_funcs. This patchset
> converts the remaining drivers to object functions and removes most of the
> obsolete interfaces.
>
> Patches #1 to #16 and #18 to #19 convert DRM drivers to GEM object functions,
> one by one. Each patch moves existing callbacks from struct drm_driver to an
> instance of struct drm_gem_object_funcs, and sets these funcs when the GEM
> object is initialized. The expection is .gem_prime_mmap. There are different
> ways of how drivers implement the callback, and moving it to GEM object
> functions requires a closer review for each.
>
> Patch #17 fixes virtgpu to use GEM object functions where possible. The
> driver recently introduced a function for one of the deprecated callbacks.
>
> Patch #20 converts xlnx to CMA helper macros. There's no apparent reason
> why the driver does the GEM setup on it's own. Using CMA helper macros
> adds GEM object functions implicitly.
>
> With most of the GEM and PRIME moved to GEM object functions, related code
> in struct drm_driver and in the DRM core/helpers is being removed by patch
> #21.
>
> Further testing is welcome. I tested the drivers for which I have HW
> available. These are gma500, i915, nouveau, radeon and vc4. The console,
> Weston and Xorg apparently work with the patches applied.
>
> v2:
> 	* moved code in amdgpu and radeon
> 	* made several functions static in various drivers
> 	* updated TODO-list item
> 	* fix virtgpu
>
> Thomas Zimmermann (21):
>    drm/amdgpu: Introduce GEM object functions
>    drm/armada: Introduce GEM object functions
>    drm/etnaviv: Introduce GEM object functions
>    drm/exynos: Introduce GEM object functions
>    drm/gma500: Introduce GEM object functions
>    drm/i915: Introduce GEM object functions
>    drm/mediatek: Introduce GEM object functions
>    drm/msm: Introduce GEM object funcs
>    drm/nouveau: Introduce GEM object functions
>    drm/omapdrm: Introduce GEM object functions
>    drm/pl111: Introduce GEM object functions
>    drm/radeon: Introduce GEM object functions
>    drm/rockchip: Convert to drm_gem_object_funcs
>    drm/tegra: Introduce GEM object functions
>    drm/vc4: Introduce GEM object functions
>    drm/vgem: Introduce GEM object functions
>    drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
>    drm/vkms: Introduce GEM object functions
>    drm/xen: Introduce GEM object functions
>    drm/xlnx: Initialize DRM driver instance with CMA helper macro
>    drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver
>
>   Documentation/gpu/todo.rst                    |  7 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 23 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h       |  5 --
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  1 +
>   drivers/gpu/drm/armada/armada_drv.c           |  3 -
>   drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
>   drivers/gpu/drm/armada/armada_gem.h           |  2 -
>   drivers/gpu/drm/drm_gem.c                     | 35 ++------
>   drivers/gpu/drm/drm_gem_cma_helper.c          |  6 +-
>   drivers/gpu/drm/drm_prime.c                   | 17 ++--
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
>   drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
>   drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
>   drivers/gpu/drm/gma500/framebuffer.c          |  2 +
>   drivers/gpu/drm/gma500/gem.c                  | 18 +++-
>   drivers/gpu/drm/gma500/gem.h                  |  3 +
>   drivers/gpu/drm/gma500/psb_drv.c              |  9 --
>   drivers/gpu/drm/gma500/psb_drv.h              |  2 -
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 -
>   drivers/gpu/drm/i915/i915_drv.c               |  4 -
>   .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
>   drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
>   drivers/gpu/drm/msm/msm_drv.h                 |  1 -
>   drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
>   drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
>   drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
>   drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
>   drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
>   drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
>   drivers/gpu/drm/omapdrm/omap_gem.c            | 18 +++-
>   drivers/gpu/drm/omapdrm/omap_gem.h            |  2 -
>   drivers/gpu/drm/pl111/pl111_drv.c             |  5 +-
>   drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
>   drivers/gpu/drm/radeon/radeon_gem.c           | 31 ++++++-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
>   drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 10 +++
>   drivers/gpu/drm/tegra/drm.c                   |  4 -
>   drivers/gpu/drm/tegra/gem.c                   |  8 ++
>   drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
>   drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
>   drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
>   drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
>   drivers/gpu/drm/virtio/virtgpu_drv.c          |  1 -
>   drivers/gpu/drm/virtio/virtgpu_object.c       |  1 +
>   drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
>   drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
>   drivers/gpu/drm/xen/xen_drm_front.c           | 44 ++++------
>   drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
>   drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
>   include/drm/drm_drv.h                         | 85 +------------------
>   57 files changed, 319 insertions(+), 349 deletions(-)
>
> --
> 2.28.0
>

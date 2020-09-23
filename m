From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/22] drm/mediatek: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:45 +0200
Message-ID: <20200923102159.24084-9-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, olek
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org, Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in mediatek. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  5 -----
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 2d982740b1a4..5899859438e0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -303,18 +303,13 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
 static struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
-	.gem_free_object_unlocked = mtk_drm_gem_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
 	.dumb_create = mtk_drm_gem_dumb_create,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = mtk_drm_gem_prime_import,
-	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
-	.gem_prime_vmap = mtk_drm_gem_prime_vmap,
-	.gem_prime_vunmap = mtk_drm_gem_prime_vunmap,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 0583e557ad37..cdd1a6e61564 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -8,11 +8,20 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_prime.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_drm_gem.h"
 
+static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
+	.free = mtk_drm_gem_free_object,
+	.get_sg_table = mtk_gem_prime_get_sg_table,
+	.vmap = mtk_drm_gem_prime_vmap,
+	.vunmap = mtk_drm_gem_prime_vunmap,
+	.vm_ops = &drm_gem_cma_vm_ops,
+};
+
 static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 						unsigned long size)
 {
@@ -25,6 +34,8 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);
 
+	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
 	if (ret < 0) {
 		DRM_ERROR("failed to initialize gem object\n");
-- 
2.28.0

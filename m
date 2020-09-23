From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 01/22] drm/amdgpu: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:38 +0200
Message-ID: <20200923102159.24084-2-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200923102159.24084-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olek
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Id: nouveau.vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in amdgpu. The only exception is gem_prime_mmap,
which is non-trivial to convert.

v3:
	* remove amdgpu_object.c from patch (Christian)
v2:
	* move object-function instance to amdgpu_gem.c (Christian)
	* set callbacks in amdgpu_gem_object_create() (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Reviewed-by: Christian König <christian.koenig-5C7GfCeVMHo@public.gmane.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  6 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 23 ++++++++++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h |  5 -----
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6edde2b9e402..840ca8f9c1e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver = {
 	.lastclose = amdgpu_driver_lastclose_kms,
 	.irq_handler = amdgpu_irq_handler,
 	.ioctls = amdgpu_ioctls_kms,
-	.gem_free_object_unlocked = amdgpu_gem_object_free,
-	.gem_open_object = amdgpu_gem_object_open,
-	.gem_close_object = amdgpu_gem_object_close,
 	.dumb_create = amdgpu_mode_dumb_create,
 	.dumb_map_offset = amdgpu_mode_dumb_mmap,
 	.fops = &amdgpu_driver_kms_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = amdgpu_gem_prime_export,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_vmap = amdgpu_gem_prime_vmap,
-	.gem_prime_vunmap = amdgpu_gem_prime_vunmap,
 	.gem_prime_mmap = amdgpu_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index aa7f230c71bf..aeecd5dc3ce4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -36,9 +36,12 @@
 
 #include "amdgpu.h"
 #include "amdgpu_display.h"
+#include "amdgpu_dma_buf.h"
 #include "amdgpu_xgmi.h"
 
-void amdgpu_gem_object_free(struct drm_gem_object *gobj)
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
+
+static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
 
@@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
 		return r;
 	}
 	*obj = &bo->tbo.base;
+	(*obj)->funcs = &amdgpu_gem_object_funcs;
 
 	return 0;
 }
@@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device *adev)
  * Call from drm_gem_handle_create which appear in both new and open ioctl
  * case.
  */
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-			   struct drm_file *file_priv)
+static int amdgpu_gem_object_open(struct drm_gem_object *obj,
+				  struct drm_file *file_priv)
 {
 	struct amdgpu_bo *abo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(abo->tbo.bdev);
@@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object *obj,
 	return 0;
 }
 
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-			     struct drm_file *file_priv)
+static void amdgpu_gem_object_close(struct drm_gem_object *obj,
+				    struct drm_file *file_priv)
 {
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
@@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	ttm_eu_backoff_reservation(&ticket, &list);
 }
 
+static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
+	.free = amdgpu_gem_object_free,
+	.open = amdgpu_gem_object_open,
+	.close = amdgpu_gem_object_close,
+	.export = amdgpu_gem_prime_export,
+	.vmap = amdgpu_gem_prime_vmap,
+	.vunmap = amdgpu_gem_prime_vunmap,
+};
+
 /*
  * GEM ioctls.
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
index e0f025dd1b14..637bf51dbf06 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
@@ -33,11 +33,6 @@
 #define AMDGPU_GEM_DOMAIN_MAX		0x3
 #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct amdgpu_bo, tbo.base)
 
-void amdgpu_gem_object_free(struct drm_gem_object *obj);
-int amdgpu_gem_object_open(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-void amdgpu_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
 unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
 
 /*
-- 
2.28.0

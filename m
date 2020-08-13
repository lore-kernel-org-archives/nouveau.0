From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 15/20] drm/vc4: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:39 +0200
Message-ID: <20200813083644.31711-16-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200813083644.31711-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olek
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Id: nouveau.vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in vc4. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 21 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_drv.c | 12 ------------
 drivers/gpu/drm/vc4/vc4_drv.h |  1 -
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 74ceebd62fbc..f432278173cd 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -21,6 +21,8 @@
 #include "vc4_drv.h"
 #include "uapi/drm/vc4_drm.h"
 
+static vm_fault_t vc4_fault(struct vm_fault *vmf);
+
 static const char * const bo_type_names[] = {
 	"kernel",
 	"V3D",
@@ -374,6 +376,21 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
 	return bo;
 }
 
+static const struct vm_operations_struct vc4_vm_ops = {
+	.fault = vc4_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
+	.free = vc4_free_object,
+	.export = vc4_prime_export,
+	.get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.vmap = vc4_prime_vmap,
+	.vunmap = drm_gem_cma_prime_vunmap,
+	.vm_ops = &vc4_vm_ops,
+};
+
 /**
  * vc4_gem_create_object - Implementation of driver->gem_create_object.
  * @dev: DRM device
@@ -400,6 +417,8 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 	vc4->bo_labels[VC4_BO_TYPE_KERNEL].size_allocated += size;
 	mutex_unlock(&vc4->bo_lock);
 
+	bo->base.base.funcs = &vc4_gem_object_funcs;
+
 	return &bo->base.base;
 }
 
@@ -684,7 +703,7 @@ struct dma_buf * vc4_prime_export(struct drm_gem_object *obj, int flags)
 	return dmabuf;
 }
 
-vm_fault_t vc4_fault(struct vm_fault *vmf)
+static vm_fault_t vc4_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 38343d2fb4fb..56c702033d79 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -140,12 +140,6 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
 	kfree(vc4file);
 }
 
-static const struct vm_operations_struct vc4_vm_ops = {
-	.fault = vc4_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations vc4_drm_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -195,16 +189,10 @@ static struct drm_driver vc4_drm_driver = {
 #endif
 
 	.gem_create_object = vc4_create_object,
-	.gem_free_object_unlocked = vc4_free_object,
-	.gem_vm_ops = &vc4_vm_ops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = vc4_prime_export,
-	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = vc4_prime_import_sg_table,
-	.gem_prime_vmap = vc4_prime_vmap,
-	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = vc4_prime_mmap,
 
 	.dumb_create = vc4_dumb_create,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index fa19160c801f..8eac046f3457 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -778,7 +778,6 @@ int vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv);
 int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
-vm_fault_t vc4_fault(struct vm_fault *vmf);
 int vc4_mmap(struct file *filp, struct vm_area_struct *vma);
 int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
-- 
2.28.0

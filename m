From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 05/20] drm/gma500: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:29 +0200
Message-ID: <20200813083644.31711-6-tzimmermann@suse.de>
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
per-instance callbacks in gma500.

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
---
 drivers/gpu/drm/gma500/framebuffer.c |  2 ++
 drivers/gpu/drm/gma500/gem.c         | 18 ++++++++++++++++--
 drivers/gpu/drm/gma500/gem.h         |  3 +++
 drivers/gpu/drm/gma500/psb_drv.c     |  9 ---------
 drivers/gpu/drm/gma500/psb_drv.h     |  2 --
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index da02d7e8a8f5..12c19f5fbb5d 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 
 #include "framebuffer.h"
+#include "gem.h"
 #include "gtt.h"
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
@@ -285,6 +286,7 @@ static struct gtt_range *psbfb_alloc(struct drm_device *dev, int aligned_size)
 	/* Begin by trying to use stolen memory backing */
 	backing = psb_gtt_alloc_range(dev, aligned_size, "fb", 1, PAGE_SIZE);
 	if (backing) {
+		backing->gem.funcs = &psb_gem_object_funcs;
 		drm_gem_private_object_init(dev, &backing->gem, aligned_size);
 		return backing;
 	}
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index f9c4b1d76f56..8f07de83b6fb 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -18,7 +18,9 @@
 
 #include "psb_drv.h"
 
-void psb_gem_free_object(struct drm_gem_object *obj)
+static vm_fault_t psb_gem_fault(struct vm_fault *vmf);
+
+static void psb_gem_free_object(struct drm_gem_object *obj)
 {
 	struct gtt_range *gtt = container_of(obj, struct gtt_range, gem);
 
@@ -36,6 +38,17 @@ int psb_gem_get_aperture(struct drm_device *dev, void *data,
 	return -EINVAL;
 }
 
+static const struct vm_operations_struct psb_gem_vm_ops = {
+	.fault = psb_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+const struct drm_gem_object_funcs psb_gem_object_funcs = {
+	.free = psb_gem_free_object,
+	.vm_ops = &psb_gem_vm_ops,
+};
+
 /**
  *	psb_gem_create		-	create a mappable object
  *	@file: the DRM file of the client
@@ -63,6 +76,7 @@ int psb_gem_create(struct drm_file *file, struct drm_device *dev, u64 size,
 		dev_err(dev->dev, "no memory for %lld byte GEM object\n", size);
 		return -ENOSPC;
 	}
+	r->gem.funcs = &psb_gem_object_funcs;
 	/* Initialize the extra goodies GEM needs to do all the hard work */
 	if (drm_gem_object_init(dev, &r->gem, size) != 0) {
 		psb_gtt_free_range(dev, r);
@@ -123,7 +137,7 @@ int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
  *	vma->vm_private_data points to the GEM object that is backing this
  *	mapping.
  */
-vm_fault_t psb_gem_fault(struct vm_fault *vmf)
+static vm_fault_t psb_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj;
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 4a74dc623b6b..3741a711b9fd 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -8,6 +8,9 @@
 #ifndef _GEM_H
 #define _GEM_H
 
+extern const struct drm_gem_object_funcs psb_gem_object_funcs;
+
 extern int psb_gem_create(struct drm_file *file, struct drm_device *dev,
 			  u64 size, u32 *handlep, int stolen, u32 align);
+
 #endif
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 34b4aae9a15e..b13376a6fb91 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -480,12 +480,6 @@ static const struct dev_pm_ops psb_pm_ops = {
 	.runtime_idle = psb_runtime_idle,
 };
 
-static const struct vm_operations_struct psb_gem_vm_ops = {
-	.fault = psb_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations psb_gem_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -507,9 +501,6 @@ static struct drm_driver driver = {
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
 
-	.gem_free_object_unlocked = psb_gem_free_object,
-	.gem_vm_ops = &psb_gem_vm_ops,
-
 	.dumb_create = psb_gem_dumb_create,
 	.ioctls = psb_ioctls,
 	.fops = &psb_gem_fops,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 956926341316..c71a5a4e912c 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -735,12 +735,10 @@ extern const struct drm_connector_helper_funcs
 extern const struct drm_connector_funcs psb_intel_lvds_connector_funcs;
 
 /* gem.c */
-extern void psb_gem_free_object(struct drm_gem_object *obj);
 extern int psb_gem_get_aperture(struct drm_device *dev, void *data,
 			struct drm_file *file);
 extern int psb_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
 			struct drm_mode_create_dumb *args);
-extern vm_fault_t psb_gem_fault(struct vm_fault *vmf);
 
 /* psb_device.c */
 extern const struct psb_ops psb_chip_ops;
-- 
2.28.0

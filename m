From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v3 20/22] drm/xen: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:57 +0200
Message-ID: <20200923102159.24084-21-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200923102159.24084-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, olek
Cc: amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Id: nouveau.vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in xen. The only exception is gem_prime_mmap,
which is non-trivial to convert.

v2:
	* convert xen_drm_drv_free_object_unlocked() to static
	  callback (Oleksandr)

Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 44 ++++++++++---------------
 drivers/gpu/drm/xen/xen_drm_front.h     |  2 ++
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 15 +++++++++
 3 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index cc93a8c9547b..98b6d2ba088a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -381,6 +381,23 @@ void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 					fb_cookie);
 }
 
+void xen_drm_front_gem_object_free(struct drm_gem_object *obj)
+{
+	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
+	int idx;
+
+	if (drm_dev_enter(obj->dev, &idx)) {
+		xen_drm_front_dbuf_destroy(drm_info->front_info,
+					   xen_drm_front_dbuf_to_cookie(obj));
+		drm_dev_exit(idx);
+	} else {
+		dbuf_free(&drm_info->front_info->dbuf_list,
+			  xen_drm_front_dbuf_to_cookie(obj));
+	}
+
+	xen_drm_front_gem_free_object_unlocked(obj);
+}
+
 static int xen_drm_drv_dumb_create(struct drm_file *filp,
 				   struct drm_device *dev,
 				   struct drm_mode_create_dumb *args)
@@ -435,23 +452,6 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	return ret;
 }
 
-static void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
-{
-	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
-	int idx;
-
-	if (drm_dev_enter(obj->dev, &idx)) {
-		xen_drm_front_dbuf_destroy(drm_info->front_info,
-					   xen_drm_front_dbuf_to_cookie(obj));
-		drm_dev_exit(idx);
-	} else {
-		dbuf_free(&drm_info->front_info->dbuf_list,
-			  xen_drm_front_dbuf_to_cookie(obj));
-	}
-
-	xen_drm_front_gem_free_object_unlocked(obj);
-}
-
 static void xen_drm_drv_release(struct drm_device *dev)
 {
 	struct xen_drm_front_drm_info *drm_info = dev->dev_private;
@@ -483,22 +483,12 @@ static const struct file_operations xen_drm_dev_fops = {
 	.mmap           = xen_drm_front_gem_mmap,
 };
 
-static const struct vm_operations_struct xen_drm_drv_vm_ops = {
-	.open           = drm_gem_vm_open,
-	.close          = drm_gem_vm_close,
-};
-
 static struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.release                   = xen_drm_drv_release,
-	.gem_vm_ops                = &xen_drm_drv_vm_ops,
-	.gem_free_object_unlocked  = xen_drm_drv_free_object_unlocked,
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_get_sg_table    = xen_drm_front_gem_get_sg_table,
-	.gem_prime_vmap            = xen_drm_front_gem_prime_vmap,
-	.gem_prime_vunmap          = xen_drm_front_gem_prime_vunmap,
 	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index 54486d89650e..cefafe859aba 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -160,4 +160,6 @@ int xen_drm_front_page_flip(struct xen_drm_front_info *front_info,
 void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 				 int conn_idx, u64 fb_cookie);
 
+void xen_drm_front_gem_object_free(struct drm_gem_object *obj);
+
 #endif /* __XEN_DRM_FRONT_H_ */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 2f464ef2d53e..4f34ef34ba60 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -57,6 +57,19 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
 	xen_obj->pages = NULL;
 }
 
+static const struct vm_operations_struct xen_drm_drv_vm_ops = {
+	.open           = drm_gem_vm_open,
+	.close          = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
+	.free = xen_drm_front_gem_object_free,
+	.get_sg_table = xen_drm_front_gem_get_sg_table,
+	.vmap = xen_drm_front_gem_prime_vmap,
+	.vunmap = xen_drm_front_gem_prime_vunmap,
+	.vm_ops = &xen_drm_drv_vm_ops,
+};
+
 static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 					     size_t size)
 {
@@ -67,6 +80,8 @@ static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 	if (!xen_obj)
 		return ERR_PTR(-ENOMEM);
 
+	xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &xen_obj->base, size);
 	if (ret < 0) {
 		kfree(xen_obj);
-- 
2.28.0

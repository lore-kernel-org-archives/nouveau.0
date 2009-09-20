From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: unify logging format with DRM
	core
Date: Sun, 20 Sep 2009 12:28:27 +0300
Message-ID: <1253438908-8123-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Change NV_PRINTK() to use DRM_NAME and DRIVER_NAME, making it
essentially generic. Print DRM_NAME in brackets, just like core DRM
logging macros do.

Convert two printk()'s into NV_* logging macro calls.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c  |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    8 ++++++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c |    6 ++++--
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index f71789a..7fb7a9f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -95,7 +95,7 @@ int nouveau_hybrid_setup(struct drm_device *dev)
 		       &result))
 		return -ENODEV;
 
-	printk(KERN_INFO "nouveau: _DSM hardware status gave 0x%x\n", result);
+	NV_INFO(dev, "_DSM hardware status gave 0x%x\n", result);
 
 	if (result & 0x1) {	/* Stamina mode - disable the external GPU */
 		nvidia_dsm(pdev, NOUVEAU_DSM_LED, NOUVEAU_DSM_LED_STAMINA,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 29cf085..a856099 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1151,9 +1151,13 @@ static inline void nv_wo32(struct drm_device *dev, struct nouveau_gpuobj *obj,
 	nv_wi32(dev, obj->im_pramin->start + index * 4, val);
 }
 
-/* logging */
+/*
+ * Logging
+ * Argument d is (struct drm_device *).
+ */
 #define NV_PRINTK(level, d, fmt, arg...) \
-	printk(level "nouveau %s: " fmt, pci_name(d->pdev), ##arg)
+	printk(level "[" DRM_NAME "] " DRIVER_NAME " %s: " fmt, \
+					pci_name(d->pdev), ##arg)
 #ifndef NV_DEBUG_NOTRACE
 #define NV_DEBUG(d, fmt, arg...) do {                                          \
 	if (drm_debug) {                                                       \
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 3397a88..d6ac9b4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -309,8 +309,10 @@ nouveau_fbcon_create(struct drm_device *dev, uint32_t fb_width,
 	info->fbops->fb_fillrect(info, &rect);
 
 	/* To allow resizeing without swapping buffers */
-	printk("allocated %dx%d fb: 0x%lx, bo %p\n", nouveau_fb->base.width,
-	       nouveau_fb->base.height, nvbo->bo.offset, nvbo);
+	NV_INFO(dev, "allocated %dx%d fb: 0x%lx, bo %p\n",
+						nouveau_fb->base.width,
+						nouveau_fb->base.height,
+						nvbo->bo.offset, nvbo);
 
 	mutex_unlock(&dev->struct_mutex);
 	return 0;
-- 
1.6.3.3

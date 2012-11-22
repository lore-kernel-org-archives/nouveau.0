From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [resend PATCH] drm/nouveau: unpin buffers before
 releasing to prevent lockdep warnings
Date: Thu, 22 Nov 2012 01:12:47 +0100
Message-ID: <50AD6DFF.9050600@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This will otherwise cause a lockdep splat if reservations were a real lock
type, so warn when nouveau forgets to unpin a buffer, and fix up the ones I've hit.
    
Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index cc79c79..acc6b08 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -123,6 +123,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 
 	if (chan->ntfy) {
 		nouveau_bo_vma_del(chan->ntfy, &chan->ntfy_vma);
+		nouveau_bo_unpin(chan->ntfy);
 		drm_gem_object_unreference_unlocked(chan->ntfy->gem);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 67a1a06..f337976 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -429,6 +429,7 @@ nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 	if (nouveau_fb->nvbo) {
 		nouveau_bo_unmap(nouveau_fb->nvbo);
 		nouveau_bo_vma_del(nouveau_fb->nvbo, &nouveau_fb->vma);
+		nouveau_bo_unpin(nouveau_fb->nvbo);
 		drm_gem_object_unreference_unlocked(nouveau_fb->nvbo->gem);
 		nouveau_fb->nvbo = NULL;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5972ecd..6d8391d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -52,7 +52,8 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
 		return;
 	nvbo->gem = NULL;
 
-	if (unlikely(nvbo->pin_refcnt)) {
+	/* Lockdep hates you for doing reserve with gem object lock held */
+	if (WARN_ON_ONCE(nvbo->pin_refcnt)) {
 		nvbo->pin_refcnt = 1;
 		nouveau_bo_unpin(nvbo);
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 366462c..bd785dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -57,10 +57,11 @@ static void nouveau_gem_dmabuf_release(struct dma_buf *dma_buf)
 {
 	struct nouveau_bo *nvbo = dma_buf->priv;
 
-	if (nvbo->gem->export_dma_buf == dma_buf) {
+	if (nvbo->gem->export_dma_buf == dma_buf)
 		nvbo->gem->export_dma_buf = NULL;
-		drm_gem_object_unreference_unlocked(nvbo->gem);
-	}
+
+	nouveau_bo_unpin(nvbo);
+	drm_gem_object_unreference_unlocked(nvbo->gem);
 }
 
 static void *nouveau_gem_kmap_atomic(struct dma_buf *dma_buf, unsigned long page_num)
@@ -175,13 +176,17 @@ struct dma_buf *nouveau_gem_prime_export(struct drm_device *dev,
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 	int ret = 0;
+	struct dma_buf *buf;
 
 	/* pin buffer into GTT */
 	ret = nouveau_bo_pin(nvbo, TTM_PL_FLAG_TT);
 	if (ret)
 		return ERR_PTR(-EINVAL);
 
-	return dma_buf_export(nvbo, &nouveau_dmabuf_ops, obj->size, flags);
+	buf = dma_buf_export(nvbo, &nouveau_dmabuf_ops, obj->size, flags);
+	if (IS_ERR(buf))
+		nouveau_bo_unpin(nvbo);
+	return buf;
 }
 
 struct drm_gem_object *nouveau_gem_prime_import(struct drm_device *dev,

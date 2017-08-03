From: Cihangir Akturk <cakturk@gmail.com>
Subject: [PATCH 17/29] drm/nouveau: switch to drm_*{get,put} helpers
Date: Thu,  3 Aug 2017 14:58:32 +0300
Message-ID: <1501761585-11757-18-git-send-email-cakturk@gmail.com>
References: <1501761585-11757-1-git-send-email-cakturk@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501761585-11757-1-git-send-email-cakturk@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Cihangir Akturk <cakturk@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

drm_*_reference() and drm_*_unreference() functions are just
compatibility alias for drm_*_get() and drm_*_put() adn should not be
used by new code. So convert all users of compatibility functions to use
the new APIs.

Signed-off-by: Cihangir Akturk <cakturk@gmail.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c |  8 ++++----
 drivers/gpu/drm/nouveau/nouveau_fbcon.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c     | 14 +++++++-------
 drivers/gpu/drm/nouveau/nv50_display.c    |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 4b4b0b4..18b4be1 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1019,7 +1019,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	nv_crtc->cursor.set_offset(nv_crtc, nv_crtc->cursor.offset);
 	nv_crtc->cursor.show(nv_crtc, true);
 out:
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f98f800..3e9db5a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -136,7 +136,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 	if (chan->ntfy) {
 		nouveau_bo_vma_del(chan->ntfy, &chan->ntfy_vma);
 		nouveau_bo_unpin(chan->ntfy);
-		drm_gem_object_unreference_unlocked(&chan->ntfy->gem);
+		drm_gem_object_put_unlocked(&chan->ntfy->gem);
 	}
 
 	if (chan->heap.block_size)
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 8d1df56..a68fe1a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -206,7 +206,7 @@ nouveau_user_framebuffer_destroy(struct drm_framebuffer *drm_fb)
 	struct nouveau_framebuffer *fb = nouveau_framebuffer(drm_fb);
 
 	if (fb->nvbo)
-		drm_gem_object_unreference_unlocked(&fb->nvbo->gem);
+		drm_gem_object_put_unlocked(&fb->nvbo->gem);
 
 	drm_framebuffer_cleanup(drm_fb);
 	kfree(fb);
@@ -267,7 +267,7 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 	if (ret == 0)
 		return &fb->base;
 
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 	return ERR_PTR(ret);
 }
 
@@ -947,7 +947,7 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 		return ret;
 
 	ret = drm_gem_handle_create(file_priv, &bo->gem, &args->handle);
-	drm_gem_object_unreference_unlocked(&bo->gem);
+	drm_gem_object_put_unlocked(&bo->gem);
 	return ret;
 }
 
@@ -962,7 +962,7 @@ nouveau_display_dumb_map_offset(struct drm_file *file_priv,
 	if (gem) {
 		struct nouveau_bo *bo = nouveau_gem_object(gem);
 		*poffset = drm_vma_node_offset_addr(&bo->bo.vma_node);
-		drm_gem_object_unreference_unlocked(gem);
+		drm_gem_object_put_unlocked(gem);
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 2665a07..6c9e1ec 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -451,7 +451,7 @@ nouveau_fbcon_destroy(struct drm_device *dev, struct nouveau_fbdev *fbcon)
 		nouveau_bo_vma_del(nouveau_fb->nvbo, &nouveau_fb->vma);
 		nouveau_bo_unmap(nouveau_fb->nvbo);
 		nouveau_bo_unpin(nouveau_fb->nvbo);
-		drm_framebuffer_unreference(&nouveau_fb->base);
+		drm_framebuffer_put(&nouveau_fb->base);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 2170534..653425c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -281,7 +281,7 @@ nouveau_gem_ioctl_new(struct drm_device *dev, void *data,
 	}
 
 	/* drop reference from allocate - handle holds it now */
-	drm_gem_object_unreference_unlocked(&nvbo->gem);
+	drm_gem_object_put_unlocked(&nvbo->gem);
 	return ret;
 }
 
@@ -350,7 +350,7 @@ validate_fini_no_ticket(struct validate_op *op, struct nouveau_fence *fence,
 		list_del(&nvbo->entry);
 		nvbo->reserved_by = NULL;
 		ttm_bo_unreserve_ticket(&nvbo->bo, &op->ticket);
-		drm_gem_object_unreference_unlocked(&nvbo->gem);
+		drm_gem_object_put_unlocked(&nvbo->gem);
 	}
 }
 
@@ -396,14 +396,14 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 		nvbo = nouveau_gem_object(gem);
 		if (nvbo == res_bo) {
 			res_bo = NULL;
-			drm_gem_object_unreference_unlocked(gem);
+			drm_gem_object_put_unlocked(gem);
 			continue;
 		}
 
 		if (nvbo->reserved_by && nvbo->reserved_by == file_priv) {
 			NV_PRINTK(err, cli, "multiple instances of buffer %d on "
 				      "validation list\n", b->handle);
-			drm_gem_object_unreference_unlocked(gem);
+			drm_gem_object_put_unlocked(gem);
 			ret = -EINVAL;
 			break;
 		}
@@ -877,7 +877,7 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
 		ret = lret;
 
 	nouveau_bo_sync_for_cpu(nvbo);
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 
 	return ret;
 }
@@ -896,7 +896,7 @@ nouveau_gem_ioctl_cpu_fini(struct drm_device *dev, void *data,
 	nvbo = nouveau_gem_object(gem);
 
 	nouveau_bo_sync_for_device(nvbo);
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 	return 0;
 }
 
@@ -913,7 +913,7 @@ nouveau_gem_ioctl_info(struct drm_device *dev, void *data,
 		return -ENOENT;
 
 	ret = nouveau_gem_info(file_priv, gem, req);
-	drm_gem_object_unreference_unlocked(gem);
+	drm_gem_object_put_unlocked(gem);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index e3132a2..e57b2e8 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -3237,7 +3237,7 @@ nv50_mstm_destroy_connector(struct drm_dp_mst_topology_mgr *mgr,
 	mstc->port = NULL;
 	drm_modeset_unlock_all(drm->dev);
 
-	drm_connector_unreference(&mstc->connector);
+	drm_connector_put(&mstc->connector);
 }
 
 static void
-- 
2.7.4

From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 14/37] drm: only take the crtc lock for ->cursor_set
Date: Wed, 12 Dec 2012 14:06:54 +0100
Message-ID: <1355317637-16742-15-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.x.org/mailman/options/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.x.org/archives/xorg-driver-ati>
List-Post: <mailto:xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Help: <mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=help>
List-Subscribe: <http://lists.x.org/mailman/listinfo/xorg-driver-ati>,
	<mailto:xorg-driver-ati-request-go0+a7rfsptAfugRpC6u6w@public.gmane.org?subject=subscribe>
Sender: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Errors-To: xorg-driver-ati-bounces+gcfxda-xorg-driver-ati=m.gmane.org-go0+a7rfsptAfugRpC6u6w@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

First convert ->cursor_set to only take the crtc lock, since that
seems to be the function with the least amount of state - the core
ioctl function doesn't check anything which can change at runtime, so
we don't have any object lifetime issues to contend.

The only thing which is important is that the driver's implementation
doesn't touch any state outside of that single crtc which is not yet
properly protected by other locking:

- ast: access the global ast->cache_kmap. Luckily we only have on crtc
  on this driver, so this is fine. Add a comment.

- gma500: calls gma_power_begin|and and psb_gtt_pin|unpin, both which
  have their own locking to protect their state. Everything else is
  crtc-local.

- i915: touches a bit of global gem state, all protected by the One
  Lock to Rule Them All (dev->struct_mutex).

- nouveau: Pre-nv50 is all nice, nv50+ uses the evo channels to queue
  up all display changes. And some of these channels are device
  global. But this is fine now since the previous patch introduced an
  evo channel mutex.

- radeon: Uses some indirect register access for cursor updates, but
  with the previous patches to protect these indirect 2-register
  access patterns with a spinlock, this should be fine now, too.

- vmwgfx: I have no idea how that works - update_cursor_position
  doesn't take any per-crtc argument and I haven't figured out any
  other place where this could be set in some form of a side-channel.
  But vmwgfx definitely has more than one crtc (or at least can
  register more than one), so I have no idea how this is supposed to
  not fail with the current code already. Hence take the easy way out
  and simply acquire all locks (which requires dropping the crtc lock
  the core acquired for us). That way it's not worse off for
  consistency than the old code.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/ast/ast_drv.h       |    2 ++
 drivers/gpu/drm/drm_crtc.c          |    6 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c |   32 ++++++++++++++++++++++++++------
 3 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 5ccf984..5284292 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -98,6 +98,8 @@ struct ast_private {
 
 	struct drm_gem_object *cursor_cache;
 	uint64_t cursor_cache_gpu_addr;
+	/* Acces to this cache is protected by the crtc->mutex of the only crtc
+	 * we have. */
 	struct ttm_bo_kmap_obj cache_kmap;
 	int next_cursor;
 };
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 91e8068..62b5002 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2023,7 +2023,6 @@ int drm_mode_cursor_ioctl(struct drm_device *dev,
 	if (!req->flags || (~DRM_MODE_CURSOR_FLAGS & req->flags))
 		return -EINVAL;
 
-	drm_modeset_lock_all(dev);
 	obj = drm_mode_object_find(dev, req->crtc_id, DRM_MODE_OBJECT_CRTC);
 	if (!obj) {
 		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", req->crtc_id);
@@ -2038,20 +2037,23 @@ int drm_mode_cursor_ioctl(struct drm_device *dev,
 			goto out;
 		}
 		/* Turns off the cursor if handle is 0 */
+		mutex_lock(&crtc->mutex);
 		ret = crtc->funcs->cursor_set(crtc, file_priv, req->handle,
 					      req->width, req->height);
+		mutex_unlock(&crtc->mutex);
 	}
 
 	if (req->flags & DRM_MODE_CURSOR_MOVE) {
 		if (crtc->funcs->cursor_move) {
+			drm_modeset_lock_all(dev);
 			ret = crtc->funcs->cursor_move(crtc, req->x, req->y);
+			drm_modeset_unlock_all(dev);
 		} else {
 			ret = -EFAULT;
 			goto out;
 		}
 	}
 out:
-	drm_modeset_unlock_all(dev);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 5474394..74b6734 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -180,16 +180,29 @@ int vmw_du_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct vmw_dma_buffer *dmabuf = NULL;
 	int ret;
 
+	/*
+	 * FIXME: Unclear whether there's any global state touched by the
+	 * cursor_set function, especially vmw_cursor_update_position looks
+	 * suspicious. For now take the easy route and reacquire all locks. We
+	 * can do this since the caller in the drm core doesn't check anything
+	 * which is protected by any looks.
+	 */
+	mutex_unlock(&crtc->mutex);
+	drm_modeset_lock_all(dev_priv->dev);
+
 	/* A lot of the code assumes this */
-	if (handle && (width != 64 || height != 64))
-		return -EINVAL;
+	if (handle && (width != 64 || height != 64)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (handle) {
 		ret = vmw_user_lookup_handle(dev_priv, tfile,
 					     handle, &surface, &dmabuf);
 		if (ret) {
 			DRM_ERROR("failed to find surface or dmabuf: %i\n", ret);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 	}
 
@@ -197,7 +210,8 @@ int vmw_du_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	if (surface && !surface->snooper.image) {
 		DRM_ERROR("surface not suitable for cursor\n");
 		vmw_surface_unreference(&surface);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	/* takedown old cursor */
@@ -225,14 +239,20 @@ int vmw_du_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 					       du->hotspot_x, du->hotspot_y);
 	} else {
 		vmw_cursor_update_position(dev_priv, false, 0, 0);
-		return 0;
+		ret = 0;
+		goto out;
 	}
 
 	vmw_cursor_update_position(dev_priv, true,
 				   du->cursor_x + du->hotspot_x,
 				   du->cursor_y + du->hotspot_y);
 
-	return 0;
+	ret = 0;
+out:
+	drm_modeset_unlock_all(dev_priv->dev);
+	mutex_lock(&crtc->mutex);
+
+	return ret;
 }
 
 int vmw_du_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
-- 
1.7.10.4

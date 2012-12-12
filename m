From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: [PATCH 15/37] drm: only take the crtc lock for
	->cursor_move
Date: Wed, 12 Dec 2012 14:06:55 +0100
Message-ID: <1355317637-16742-16-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter-/w4YWyX8dFk@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Nouveau Dev <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Radeon Dev <xorg-driver-ati-go0+a7rfsptAfugRpC6u6w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

->cursor_move uses mostly the same facilities in drivers as
->cursor_set, so pretty much nothing to fix up:

- ast/gma500/i915: They all use per-crtc registers to update the
  cursor position. ast again touches the global cursor cache, but
  that's ok since there's only one crtc.

- nouveau: nv50+ is again special, updates happen through the per-crtc
  channel (without pushbufs), so it's not protected by the new evo
  lock introduced earlier. But since this channel is per-crtc, we
  should be fine anyway.

- radeon: A bit a mess: avivo asics need a workaround when both output
  pipes are enabled, which means it'll access the crtc list. Just
  reading that flag is ok though as long as radeon _always_ grabs all
  locks when changing the crtc configuration. Which means with the
  current scheme it cannot do an optimized modeset which only locks
  the relevant crtcs. This can be fixed though by introducing a bit of
  global state with separate locks and ensure in the modeset code that
  the cursor will be updated appropriately when enabling the 2nd pipe
  (on affected asics).

- vmwgfx: I still don't understand what it's doing exactly, so apply
  the same trick for now.

Signed-off-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 drivers/gpu/drm/drm_crtc.c             |    6 ++----
 drivers/gpu/drm/radeon/radeon_cursor.c |    8 +++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    |   13 +++++++++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 62b5002..3b2f25d 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -2031,28 +2031,26 @@ int drm_mode_cursor_ioctl(struct drm_device *dev,
 	}
 	crtc = obj_to_crtc(obj);
 
+	mutex_lock(&crtc->mutex);
 	if (req->flags & DRM_MODE_CURSOR_BO) {
 		if (!crtc->funcs->cursor_set) {
 			ret = -ENXIO;
 			goto out;
 		}
 		/* Turns off the cursor if handle is 0 */
-		mutex_lock(&crtc->mutex);
 		ret = crtc->funcs->cursor_set(crtc, file_priv, req->handle,
 					      req->width, req->height);
-		mutex_unlock(&crtc->mutex);
 	}
 
 	if (req->flags & DRM_MODE_CURSOR_MOVE) {
 		if (crtc->funcs->cursor_move) {
-			drm_modeset_lock_all(dev);
 			ret = crtc->funcs->cursor_move(crtc, req->x, req->y);
-			drm_modeset_unlock_all(dev);
 		} else {
 			ret = -EFAULT;
 			goto out;
 		}
 	}
+	mutex_unlock(&crtc->mutex);
 out:
 	return ret;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
index ad6df62..c1680e6 100644
--- a/drivers/gpu/drm/radeon/radeon_cursor.c
+++ b/drivers/gpu/drm/radeon/radeon_cursor.c
@@ -245,8 +245,14 @@ int radeon_crtc_cursor_move(struct drm_crtc *crtc,
 		int i = 0;
 		struct drm_crtc *crtc_p;
 
-		/* avivo cursor image can't end on 128 pixel boundary or
+		/*
+		 * avivo cursor image can't end on 128 pixel boundary or
 		 * go past the end of the frame if both crtcs are enabled
+		 *
+		 * NOTE: It is safe to access crtc->enabled of other crtcs
+		 * without holding either the mode_config lock or the other
+		 * crtc's lock as long as write access to this flag _always_
+		 * grabs all locks.
 		 */
 		list_for_each_entry(crtc_p, &crtc->dev->mode_config.crtc_list, head) {
 			if (crtc_p->enabled)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 74b6734..385b8849 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -264,10 +264,23 @@ int vmw_du_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 	du->cursor_x = x + crtc->x;
 	du->cursor_y = y + crtc->y;
 
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
 	vmw_cursor_update_position(dev_priv, shown,
 				   du->cursor_x + du->hotspot_x,
 				   du->cursor_y + du->hotspot_y);
 
+	drm_modeset_unlock_all(dev_priv->dev);
+	mutex_lock(&crtc->mutex);
+
 	return 0;
 }
 
-- 
1.7.10.4

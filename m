From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 01/10] drm/nouveau: replace legacy vblank helpers
Date: Tue,  7 Jun 2016 11:07:53 -0300
Message-ID: <1465308482-15104-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR NVIDIA
	GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Replace the legacy drm_send_vblank_event(), drm_arm_vblank_event() and
drm_vblank_{get,put}() with the new helper functions.

v2: add crtc to nouveau_page_flip_state (comment from Mario Kleiner)

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 22 +++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_display.h |  3 ++-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 7c77f96..6072fe2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -760,12 +760,11 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 
 	/* Initialize a page flip struct */
 	*s = (struct nouveau_page_flip_state)
-		{ { }, event, nouveau_crtc(crtc)->index,
-		  fb->bits_per_pixel, fb->pitches[0], crtc->x, crtc->y,
+		{ { }, event, crtc, fb->bits_per_pixel, fb->pitches[0],
 		  new_bo->bo.offset };
 
 	/* Keep vblanks on during flip, for the target crtc of this flip */
-	drm_vblank_get(dev, nouveau_crtc(crtc)->index);
+	drm_crtc_vblank_get(crtc);
 
 	/* Emit a page flip */
 	if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
@@ -810,7 +809,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	return 0;
 
 fail_unreserve:
-	drm_vblank_put(dev, nouveau_crtc(crtc)->index);
+	drm_crtc_vblank_put(crtc);
 	ttm_bo_unreserve(&old_bo->bo);
 fail_unpin:
 	mutex_unlock(&cli->mutex);
@@ -842,17 +841,17 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 	s = list_first_entry(&fctx->flip, struct nouveau_page_flip_state, head);
 	if (s->event) {
 		if (drm->device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-			drm_arm_vblank_event(dev, s->crtc, s->event);
+			drm_crtc_arm_vblank_event(s->crtc, s->event);
 		} else {
-			drm_send_vblank_event(dev, s->crtc, s->event);
+			drm_crtc_send_vblank_event(s->crtc, s->event);
 
 			/* Give up ownership of vblank for page-flipped crtc */
-			drm_vblank_put(dev, s->crtc);
+			drm_crtc_vblank_put(s->crtc);
 		}
 	}
 	else {
 		/* Give up ownership of vblank for page-flipped crtc */
-		drm_vblank_put(dev, s->crtc);
+		drm_crtc_vblank_put(s->crtc);
 	}
 
 	list_del(&s->head);
@@ -873,9 +872,10 @@ nouveau_flip_complete(struct nvif_notify *notify)
 
 	if (!nouveau_finish_page_flip(chan, &state)) {
 		if (drm->device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-			nv_set_crtc_base(drm->dev, state.crtc, state.offset +
-					 state.y * state.pitch +
-					 state.x * state.bpp / 8);
+			nv_set_crtc_base(drm->dev, drm_crtc_index(state.crtc),
+					 state.offset + state.crtc->y *
+					 state.pitch + state.crtc->x *
+					 state.bpp / 8);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 24273ba..0420ee8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -28,7 +28,8 @@ int nouveau_framebuffer_init(struct drm_device *, struct nouveau_framebuffer *,
 struct nouveau_page_flip_state {
 	struct list_head head;
 	struct drm_pending_vblank_event *event;
-	int crtc, bpp, pitch, x, y;
+	struct drm_crtc *crtc;
+	int bpp, pitch;
 	u64 offset;
 };
 
-- 
2.5.5

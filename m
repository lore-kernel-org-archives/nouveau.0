From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 11/14] drm/nouveau: use drm_crtc_vblank_{get,put}()
Date: Mon,  6 Jun 2016 11:41:42 -0300
Message-ID: <1465224105-21485-11-git-send-email-gustavo@padovan.org>
References: <1465224105-21485-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465224105-21485-1-git-send-email-gustavo@padovan.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR NVIDIA
	GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Replace the legacy drm_vblank_{get,put}() with the new helper functions.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 9d72467..7898459f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -764,7 +764,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 		  new_bo->bo.offset };
 
 	/* Keep vblanks on during flip, for the target crtc of this flip */
-	drm_vblank_get(dev, nouveau_crtc(crtc)->index);
+	drm_crtc_vblank_get(crtc);
 
 	/* Emit a page flip */
 	if (drm->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
@@ -809,7 +809,7 @@ nouveau_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	return 0;
 
 fail_unreserve:
-	drm_vblank_put(dev, nouveau_crtc(crtc)->index);
+	drm_crtc_vblank_put(crtc);
 	ttm_bo_unreserve(&old_bo->bo);
 fail_unpin:
 	mutex_unlock(&cli->mutex);
@@ -847,12 +847,12 @@ nouveau_finish_page_flip(struct nouveau_channel *chan,
 			drm_crtc_send_vblank_event(s->crtc, s->event);
 
 			/* Give up ownership of vblank for page-flipped crtc */
-			drm_vblank_put(dev, drm_crtc_index(s->crtc));
+			drm_crtc_vblank_put(s->crtc);
 		}
 	}
 	else {
 		/* Give up ownership of vblank for page-flipped crtc */
-		drm_vblank_put(dev, drm_crtc_index(state->crtc));
+		drm_crtc_vblank_put(state->crtc);
 	}
 
 	list_del(&s->head);
-- 
2.5.5

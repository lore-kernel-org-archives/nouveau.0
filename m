From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] nv50: fix doublescan modes
Date: Tue, 11 Oct 2011 01:13:21 +0200
Message-ID: <1318288402-6853-2-git-send-email-maximlevitsky@gmail.com>
References: <1318288402-6853-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318288402-6853-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

Scaling code didn't took into account that doublescan modes
actually are physically 2x verical resolution, thus scaler needs
to scale logical resolution 2x
Also remove stray OUT_RING that just by a chance didn't cause problems

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_crtc.c |   16 ++++++++++++----
 1 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index e426a9b..36232d9 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -242,6 +242,9 @@ nv50_crtc_set_scale(struct nouveau_crtc *nv_crtc, int scaling_mode, bool update)
 		oY = mode->vdisplay;
 	}
 
+	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
+		oY *= 2;
+
 	/* add overscan compensation if necessary, will keep the aspect
 	 * ratio the same as the backend mode unless overridden by the
 	 * user setting both hborder and vborder properties.
@@ -621,6 +624,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	struct nouveau_connector *nv_connector = NULL;
 	uint32_t hsync_dur,  vsync_dur, hsync_start_to_end, vsync_start_to_end;
 	uint32_t hunk1, vunk1, vunk2a, vunk2b;
+	uint32_t vtotal, htotal;
 	int ret;
 
 	/* Find the connector attached to this CRTC */
@@ -644,6 +648,8 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 		 adjusted_mode->vsync_start + adjusted_mode->vdisplay;
 	vunk2b = adjusted_mode->vtotal -
 		 adjusted_mode->vsync_start + adjusted_mode->vtotal;
+	vtotal = adjusted_mode->vtotal;
+	htotal = adjusted_mode->htotal;
 
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		vsync_dur /= 2;
@@ -658,6 +664,11 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 			vunk2a -= 1;
 			vunk2b -= 1;
 		}
+	} else if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN) {
+		vtotal *= 2;
+		vsync_dur *= 2;
+		vsync_start_to_end  *= 2;
+		vunk1 *= 2;
 	}
 
 	ret = RING_SPACE(evo, 17);
@@ -670,7 +681,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, DISPLAY_START), 5);
 	OUT_RING(evo, 0);
-	OUT_RING(evo, (adjusted_mode->vtotal << 16) | adjusted_mode->htotal);
+	OUT_RING(evo, (vtotal << 16) | htotal);
 	OUT_RING(evo, (vsync_dur - 1) << 16 | (hsync_dur - 1));
 	OUT_RING(evo, (vsync_start_to_end - 1) << 16 |
 			(hsync_start_to_end - 1));
@@ -679,9 +690,6 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, UNK0824), 1);
 		OUT_RING(evo, (vunk2b - 1) << 16 | (vunk2a - 1));
-	} else {
-		OUT_RING(evo, 0);
-		OUT_RING(evo, 0);
 	}
 
 	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, UNK082C), 1);
-- 
1.7.4.1

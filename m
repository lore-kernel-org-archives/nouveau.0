From: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/10] nv50: cosmetic cleanup in modesetting code.
Date: Sun,  9 Oct 2011 22:58:37 +0200
Message-ID: <1318193920-27461-8-git-send-email-maximlevitsky@gmail.com>
References: <1318193920-27461-1-git-send-email-maximlevitsky@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1318193920-27461-1-git-send-email-maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

Since I figured out the logic behind hardware mode values,
this renames variables adds comments to reflect this, etc

Signed-off-by: Maxim Levitsky <maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_crtc.c |   78 ++++++++++++++++++++---------------
 drivers/gpu/drm/nouveau/nv50_evo.h  |    2 +-
 2 files changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index d1315ce..cb8943f 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -603,9 +603,11 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	struct nouveau_channel *evo = nv50_display(dev)->master;
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_connector *nv_connector = NULL;
-	uint32_t hsync_dur,  vsync_dur, hsync_start_to_end, vsync_start_to_end;
-	uint32_t hunk1, vunk1, vunk2a, vunk2b;
+	uint32_t hsync_dur,  vsync_dur;
+	uint32_t hsync_to_hdisp_start, vsync_to_vdisp_start;
+	uint32_t hsync_to_hdisp_end, vsync_to_vdisp_end;
 	uint32_t vtotal, htotal;
+	uint32_t vsync_to_vdisp_next_field_end = 0, vsync_to_vdisp_next_field_start = 0;
 	int ret;
 
 	/* Find the connector attached to this CRTC */
@@ -615,43 +617,54 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	NV_DEBUG_KMS(dev, "index %d\n", nv_crtc->index);
 
+	/* from start of sync to end of sync (start of back porch)*/
 	hsync_dur = adjusted_mode->hsync_end - adjusted_mode->hsync_start;
 	vsync_dur = adjusted_mode->vsync_end - adjusted_mode->vsync_start;
-	hsync_start_to_end = adjusted_mode->htotal - adjusted_mode->hsync_start;
-	vsync_start_to_end = adjusted_mode->vtotal - adjusted_mode->vsync_start;
-	/* I can't give this a proper name, anyone else can? */
-	hunk1 = adjusted_mode->htotal -
-		adjusted_mode->hsync_start + adjusted_mode->hdisplay;
-	vunk1 = adjusted_mode->vtotal -
-		adjusted_mode->vsync_start + adjusted_mode->vdisplay;
-	/* Another strange value, this time only for interlaced adjusted_modes. */
-	vunk2a = 2 * adjusted_mode->vtotal -
-		 adjusted_mode->vsync_start + adjusted_mode->vdisplay;
-	vunk2b = adjusted_mode->vtotal -
-		 adjusted_mode->vsync_start + adjusted_mode->vtotal;
+
+	/* from start of sync to start of visible portion (end of back porch) */
+	hsync_to_hdisp_start = adjusted_mode->htotal - adjusted_mode->hsync_start;
+	vsync_to_vdisp_start = adjusted_mode->vtotal - adjusted_mode->vsync_start;
+
+	/* from start of sync to end of visible portion (start of front porch) */
+	hsync_to_hdisp_end = hsync_to_hdisp_start + adjusted_mode->hdisplay;
+	vsync_to_vdisp_end = vsync_to_vdisp_start + adjusted_mode->vdisplay;
+
+	/* from start of sync to start of another sync (end of front porch)*/
 	vtotal = adjusted_mode->vtotal;
 	htotal = adjusted_mode->htotal;
 
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
+
+		/* from vsync to start of visible portion of _next_ field */
+		vsync_to_vdisp_next_field_start =
+				vsync_to_vdisp_start + adjusted_mode->vtotal;
+
+		/* from vsync to end of visible portion of _next_ field */
+		vsync_to_vdisp_next_field_end =
+			vsync_to_vdisp_next_field_start + adjusted_mode->vdisplay;
+
 		vsync_dur /= 2;
-		vsync_start_to_end  /= 2;
-		vunk1 /= 2;
-		vunk2a /= 2;
-		vunk2b /= 2;
-		/* magic */
+		vsync_to_vdisp_start  /= 2;
+		vsync_to_vdisp_end /= 2;
+		vsync_to_vdisp_next_field_end /= 2;
+		vsync_to_vdisp_next_field_start /= 2;
+
+		/* magic ??? */
 		if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN) {
-			vsync_start_to_end -= 1;
-			vunk1 -= 1;
-			vunk2a -= 1;
-			vunk2b -= 1;
+			vsync_to_vdisp_start -= 1;
+			vsync_to_vdisp_end -= 1;
+			vsync_to_vdisp_next_field_end -= 1;
+			vsync_to_vdisp_next_field_start -= 1;
 		}
+
 	} else if (adjusted_mode->flags & DRM_MODE_FLAG_DBLSCAN) {
 		vtotal *= 2;
 		vsync_dur *= 2;
-		vsync_start_to_end  *= 2;
-		vunk1 *= 2;
+		vsync_to_vdisp_start  *= 2;
+		vsync_to_vdisp_end *= 2;
 	}
 
+
 	ret = RING_SPACE(evo, 17);
 	if (ret)
 		return ret;
@@ -660,18 +673,17 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 	OUT_RING(evo, adjusted_mode->clock | 0x800000);
 	OUT_RING(evo, (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) ? 2 : 0);
 
-	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, DISPLAY_START), 5);
+	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, DISPLAY_START),
+		(adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) ? 6 : 5);
 	OUT_RING(evo, 0);
 	OUT_RING(evo, (vtotal << 16) | htotal);
 	OUT_RING(evo, (vsync_dur - 1) << 16 | (hsync_dur - 1));
-	OUT_RING(evo, (vsync_start_to_end - 1) << 16 |
-			(hsync_start_to_end - 1));
-	OUT_RING(evo, (vunk1 - 1) << 16 | (hunk1 - 1));
+	OUT_RING(evo, (vsync_to_vdisp_start - 1) << 16 | (hsync_to_hdisp_start - 1));
+	OUT_RING(evo, (vsync_to_vdisp_end - 1) << 16 | (hsync_to_hdisp_end - 1));
 
-	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
-		BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, UNK0824), 1);
-		OUT_RING(evo, (vunk2b - 1) << 16 | (vunk2a - 1));
-	}
+	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE)
+		OUT_RING(evo, (vsync_to_vdisp_next_field_start - 1) << 16 |
+			(vsync_to_vdisp_next_field_end - 1));
 
 	BEGIN_RING(evo, 0, NV50_EVO_CRTC(nv_crtc->index, UNK082C), 1);
 	OUT_RING(evo, 0);
diff --git a/drivers/gpu/drm/nouveau/nv50_evo.h b/drivers/gpu/drm/nouveau/nv50_evo.h
index 3860ca6..3131553 100644
--- a/drivers/gpu/drm/nouveau/nv50_evo.h
+++ b/drivers/gpu/drm/nouveau/nv50_evo.h
@@ -63,7 +63,7 @@
 #define NV50_EVO_CRTC_DISPLAY_TOTAL                                  0x00000814
 #define NV50_EVO_CRTC_SYNC_DURATION                                  0x00000818
 #define NV50_EVO_CRTC_SYNC_START_TO_BLANK_END                        0x0000081c
-#define NV50_EVO_CRTC_UNK0820                                        0x00000820
+#define NV50_EVO_CRTC_SYNC_START_TO_DISP_END                         0x00000820
 #define NV50_EVO_CRTC_UNK0824                                        0x00000824
 #define NV50_EVO_CRTC_UNK082C                                        0x0000082c
 #define NV50_EVO_CRTC_CLUT_MODE                                      0x00000840
-- 
1.7.4.1

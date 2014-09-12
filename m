From: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Subject: [PATCH 2/6] nv50/display: Set VBLANK time in modeset
	script
Date: Fri, 12 Sep 2014 18:00:13 +0200
Message-ID: <1410537617-8269-3-git-send-email-rspliet@eclipso.eu>
References: <1410537617-8269-1-git-send-email-rspliet@eclipso.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1410537617-8269-1-git-send-email-rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Solves blinking on reclocking memory. The value set is an underestimate, but
with non-reduced vblanking this should give us plenty of time

Signed-off-by: Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nv50_display.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index 03949ea..c15060e 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1066,7 +1066,7 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *umode,
 	u32 vscan = (mode->flags & DRM_MODE_FLAG_DBLSCAN) ? 2 : 1;
 	u32 hactive, hsynce, hbackp, hfrontp, hblanke, hblanks;
 	u32 vactive, vsynce, vbackp, vfrontp, vblanke, vblanks;
-	u32 vblan2e = 0, vblan2s = 1;
+	u32 vblan2e = 0, vblan2s = 1, vblankus = 0;
 	u32 *push;
 	int ret;
 
@@ -1083,6 +1083,11 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *umode,
 	vblanke = vsynce + vbackp;
 	vfrontp = (mode->vsync_start - mode->vdisplay) * vscan / ilace;
 	vblanks = vactive - vfrontp - 1;
+	/* XXX: Safe underestimate, even "0" works */
+	vblankus = (vactive - mode->vdisplay - 2) * hactive;
+	vblankus *= 1000;
+	vblankus /= mode->clock;
+
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		vblan2e = vactive + vsynce + vbackp;
 		vblan2s = vblan2e + (mode->vdisplay * vscan / ilace);
@@ -1099,14 +1104,14 @@ nv50_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *umode,
 			evo_mthd(push, 0x0804 + (nv_crtc->index * 0x400), 2);
 			evo_data(push, 0x00800000 | mode->clock);
 			evo_data(push, (ilace == 2) ? 2 : 0);
-			evo_mthd(push, 0x0810 + (nv_crtc->index * 0x400), 6);
+			evo_mthd(push, 0x0810 + (nv_crtc->index * 0x400), 8);
 			evo_data(push, 0x00000000);
 			evo_data(push, (vactive << 16) | hactive);
 			evo_data(push, ( vsynce << 16) | hsynce);
 			evo_data(push, (vblanke << 16) | hblanke);
 			evo_data(push, (vblanks << 16) | hblanks);
 			evo_data(push, (vblan2e << 16) | vblan2s);
-			evo_mthd(push, 0x082c + (nv_crtc->index * 0x400), 1);
+			evo_data(push, vblankus);
 			evo_data(push, 0x00000000);
 			evo_mthd(push, 0x0900 + (nv_crtc->index * 0x400), 2);
 			evo_data(push, 0x00000311);
-- 
1.9.3

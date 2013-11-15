From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 1/5] drm/nv10/plane: fix format computation
Date: Fri, 15 Nov 2013 11:26:41 -0500
Message-ID: <1384532805-4474-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Otherwise none of the format checks pass, since the width was still in
16.16 encoding.

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

This must have been some sort of last-second cleanup I made and forgot to
test, because with this code, there's no way it could ever have worked...

 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 3618ac6..514a305 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -99,10 +99,17 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cur = nv_plane->cur;
 	bool flip = nv_plane->flip;
-	int format = ALIGN(src_w * 4, 0x100);
 	int soff = NV_PCRTC0_SIZE * nv_crtc->index;
 	int soff2 = NV_PCRTC0_SIZE * !nv_crtc->index;
-	int ret;
+	int format, ret;
+
+	/* Source parameters given in 16.16 fixed point, ignore fractional. */
+	src_x >>= 16;
+	src_y >>= 16;
+	src_w >>= 16;
+	src_h >>= 16;
+
+	format = ALIGN(src_w * 4, 0x100);
 
 	if (format > 0xffff)
 		return -EINVAL;
@@ -113,12 +120,6 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 
 	nv_plane->cur = nv_fb->nvbo;
 
-	/* Source parameters given in 16.16 fixed point, ignore fractional. */
-	src_x = src_x >> 16;
-	src_y = src_y >> 16;
-	src_w = src_w >> 16;
-	src_h = src_h >> 16;
-
 	nv_mask(dev, NV_PCRTC_ENGINE_CTRL + soff, NV_CRTC_FSEL_OVERLAY, NV_CRTC_FSEL_OVERLAY);
 	nv_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
 
-- 
1.8.3.2

From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 2/5] drm/nv10/plane: add downscaling restrictions
Date: Fri, 15 Nov 2013 11:26:42 -0500
Message-ID: <1384532805-4474-2-git-send-email-imirkin@alum.mit.edu>
References: <1384532805-4474-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384532805-4474-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
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

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---

Copied from the (disabled) overlay code in xf86-video-nouveau. I verified that
my nv34 indeed doesn't scale down by more than 2, didn't test the factor of 8.

 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 514a305..c14afb7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -112,7 +112,15 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	format = ALIGN(src_w * 4, 0x100);
 
 	if (format > 0xffff)
-		return -EINVAL;
+		return -ERANGE;
+
+	if (dev->chipset >= 0x30) {
+		if (crtc_w < (src_w >> 1) || crtc_h < (src_h >> 1))
+			return -ERANGE;
+	} else {
+		if (crtc_w < (src_w >> 3) || crtc_h < (src_h >> 3))
+			return -ERANGE;
+	}
 
 	ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM);
 	if (ret)
-- 
1.8.3.2

From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 4/5] drm/nv10/plane: add YUYV support
Date: Fri, 15 Nov 2013 11:26:44 -0500
Message-ID: <1384532805-4474-4-git-send-email-imirkin@alum.mit.edu>
References: <1384532805-4474-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1384532805-4474-1-git-send-email-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
---
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 32e7064..ba40c7b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -58,6 +58,7 @@ struct nouveau_plane {
 };
 
 static uint32_t formats[] = {
+	DRM_FORMAT_YUYV,
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_NV12,
 };
@@ -140,10 +141,10 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	nv_wr32(dev, NV_PVIDEO_POINT_OUT(flip), crtc_y << 16 | crtc_x);
 	nv_wr32(dev, NV_PVIDEO_SIZE_OUT(flip), crtc_h << 16 | crtc_w);
 
-	if (fb->pixel_format == DRM_FORMAT_NV12) {
+	if (fb->pixel_format != DRM_FORMAT_UYVY)
 		format |= NV_PVIDEO_FORMAT_COLOR_LE_CR8YB8CB8YA8;
+	if (fb->pixel_format == DRM_FORMAT_NV12)
 		format |= NV_PVIDEO_FORMAT_PLANAR;
-	}
 	if (nv_plane->iturbt_709)
 		format |= NV_PVIDEO_FORMAT_MATRIX_ITURBT709;
 	if (nv_plane->colorkey & (1 << 24))
@@ -266,7 +267,7 @@ nv10_overlay_init(struct drm_device *device)
 	case 0x15:
 	case 0x1a:
 	case 0x20:
-		num_formats = 1;
+		num_formats = 2;
 		break;
 	}
 
-- 
1.8.3.2

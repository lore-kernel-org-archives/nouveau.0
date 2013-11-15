From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 3/5] drm/nv10/plane: some chipsets don't support
	NV12
Date: Fri, 15 Nov 2013 11:26:43 -0500
Message-ID: <1384532805-4474-3-git-send-email-imirkin@alum.mit.edu>
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

Copied from xf86-video-nouveau, I don't have the requisite cards to test it
out myself.

 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index c14afb7..32e7064 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -58,8 +58,8 @@ struct nouveau_plane {
 };
 
 static uint32_t formats[] = {
-	DRM_FORMAT_NV12,
 	DRM_FORMAT_UYVY,
+	DRM_FORMAT_NV12,
 };
 
 /* Sine can be approximated with
@@ -254,14 +254,25 @@ nv10_overlay_init(struct drm_device *device)
 {
 	struct nouveau_device *dev = nouveau_dev(device);
 	struct nouveau_plane *plane = kzalloc(sizeof(struct nouveau_plane), GFP_KERNEL);
+	int num_formats = ARRAY_SIZE(formats);
 	int ret;
 
 	if (!plane)
 		return;
 
+	switch (dev->chipset) {
+	case 0x10:
+	case 0x11:
+	case 0x15:
+	case 0x1a:
+	case 0x20:
+		num_formats = 1;
+		break;
+	}
+
 	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
 			     &nv10_plane_funcs,
-			     formats, ARRAY_SIZE(formats), false);
+			     formats, num_formats, false);
 	if (ret)
 		goto err;
 
-- 
1.8.3.2

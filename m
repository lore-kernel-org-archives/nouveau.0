From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: [PATCH 5/5] drm/nv04/plane: add support for nv04/nv05
	video overlay
Date: Fri, 15 Nov 2013 11:26:45 -0500
Message-ID: <1384532805-4474-5-git-send-email-imirkin@alum.mit.edu>
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

Tested on a NV05, seems to work. I attempted to avoid duplication, so I ended
up with the function pointer. Doesn't seem too dirty, IMO.

 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 176 +++++++++++++++++++++++++++--
 1 file changed, 166 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index ba40c7b..3ab6e08 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -55,6 +55,8 @@ struct nouveau_plane {
 	int hue;
 	int saturation;
 	int iturbt_709;
+
+	void (*set_params)(struct nouveau_plane *);
 };
 
 static uint32_t formats[] = {
@@ -183,9 +185,9 @@ nv10_disable_plane(struct drm_plane *plane)
 }
 
 static void
-nv10_destroy_plane(struct drm_plane *plane)
+nv_destroy_plane(struct drm_plane *plane)
 {
-	nv10_disable_plane(plane);
+	plane->funcs->disable_plane(plane);
 	drm_plane_cleanup(plane);
 	kfree(plane);
 }
@@ -218,9 +220,9 @@ nv10_set_params(struct nouveau_plane *plane)
 }
 
 static int
-nv10_set_property(struct drm_plane *plane,
-		  struct drm_property *property,
-		  uint64_t value)
+nv_set_property(struct drm_plane *plane,
+		struct drm_property *property,
+		uint64_t value)
 {
 	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
 
@@ -239,15 +241,16 @@ nv10_set_property(struct drm_plane *plane,
 	else
 		return -EINVAL;
 
-	nv10_set_params(nv_plane);
+	if (nv_plane->set_params)
+		nv_plane->set_params(nv_plane);
 	return 0;
 }
 
 static const struct drm_plane_funcs nv10_plane_funcs = {
 	.update_plane = nv10_update_plane,
 	.disable_plane = nv10_disable_plane,
-	.set_property = nv10_set_property,
-	.destroy = nv10_destroy_plane,
+	.set_property = nv_set_property,
+	.destroy = nv_destroy_plane,
 };
 
 static void
@@ -322,8 +325,159 @@ nv10_overlay_init(struct drm_device *device)
 	drm_object_attach_property(&plane->base.base,
 				   plane->props.iturbt_709, plane->iturbt_709);
 
+	plane->set_params = nv10_set_params;
 	nv10_set_params(plane);
-	nv_wr32(dev, NV_PVIDEO_STOP, 1);
+	nv10_disable_plane(&plane->base);
+	return;
+cleanup:
+	drm_plane_cleanup(&plane->base);
+err:
+	kfree(plane);
+	nv_error(dev, "Failed to create plane\n");
+}
+
+static int
+nv04_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
+		  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
+		  unsigned int crtc_w, unsigned int crtc_h,
+		  uint32_t src_x, uint32_t src_y,
+		  uint32_t src_w, uint32_t src_h)
+{
+	struct nouveau_device *dev = nouveau_dev(plane->dev);
+	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
+	struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
+	struct nouveau_bo *cur = nv_plane->cur;
+	uint32_t overlay = 1;
+	int brightness = (nv_plane->brightness - 512) * 62 / 512;
+	int pitch, ret, i;
+
+	/* Source parameters given in 16.16 fixed point, ignore fractional. */
+	src_x >>= 16;
+	src_y >>= 16;
+	src_w >>= 16;
+	src_h >>= 16;
+
+	pitch = ALIGN(src_w * 4, 0x100);
+
+	if (pitch > 0xffff)
+		return -ERANGE;
+
+	/* TODO: Compute an offset? Not sure how to do this for YUYV. */
+	if (src_x != 0 || src_y != 0)
+		return -ERANGE;
+
+	if (crtc_w < src_w || crtc_h < src_h)
+		return -ERANGE;
+
+	ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM);
+	if (ret)
+		return ret;
+
+	nv_plane->cur = nv_fb->nvbo;
+
+	nv_wr32(dev, NV_PVIDEO_OE_STATE, 0);
+	nv_wr32(dev, NV_PVIDEO_SU_STATE, 0);
+	nv_wr32(dev, NV_PVIDEO_RM_STATE, 0);
+
+	for (i = 0; i < 2; i++) {
+		nv_wr32(dev, NV_PVIDEO_BUFF0_START_ADDRESS + 4 * i,
+			nv_fb->nvbo->bo.offset);
+		nv_wr32(dev, NV_PVIDEO_BUFF0_PITCH_LENGTH + 4 * i, pitch);
+		nv_wr32(dev, NV_PVIDEO_BUFF0_OFFSET + 4 * i, 0);
+	}
+	nv_wr32(dev, NV_PVIDEO_WINDOW_START, crtc_y << 16 | crtc_x);
+	nv_wr32(dev, NV_PVIDEO_WINDOW_SIZE, crtc_h << 16 | crtc_w);
+	nv_wr32(dev, NV_PVIDEO_STEP_SIZE,
+		(uint32_t)(((src_h - 1) << 11) / (crtc_h - 1)) << 16 | (uint32_t)(((src_w - 1) << 11) / (crtc_w - 1)));
+
+	/* It should be possible to convert hue/contrast to this */
+	nv_wr32(dev, NV_PVIDEO_RED_CSC_OFFSET, 0x69 - brightness);
+	nv_wr32(dev, NV_PVIDEO_GREEN_CSC_OFFSET, 0x3e + brightness);
+	nv_wr32(dev, NV_PVIDEO_BLUE_CSC_OFFSET, 0x89 - brightness);
+	nv_wr32(dev, NV_PVIDEO_CSC_ADJUST, 0);
+
+	nv_wr32(dev, NV_PVIDEO_CONTROL_Y, 0x001); /* (BLUR_ON, LINE_HALF) */
+	nv_wr32(dev, NV_PVIDEO_CONTROL_X, 0x111); /* (WEIGHT_HEAVY, SHARPENING_ON, SMOOTHING_ON) */
+
+	nv_wr32(dev, NV_PVIDEO_FIFO_BURST_LENGTH, 0x03);
+	nv_wr32(dev, NV_PVIDEO_FIFO_THRES_SIZE, 0x38);
+
+	nv_wr32(dev, NV_PVIDEO_KEY, nv_plane->colorkey);
+
+	if (nv_plane->colorkey & (1 << 24))
+		overlay |= 0x10;
+	if (fb->pixel_format == DRM_FORMAT_YUYV)
+		overlay |= 0x100;
+
+	nv_wr32(dev, NV_PVIDEO_OVERLAY, overlay);
+
+	nv_wr32(dev, NV_PVIDEO_SU_STATE, nv_rd32(dev, NV_PVIDEO_SU_STATE) ^ (1 << 16));
+
+	if (cur)
+		nouveau_bo_unpin(cur);
+
+	return 0;
+}
+
+static int
+nv04_disable_plane(struct drm_plane *plane)
+{
+	struct nouveau_device *dev = nouveau_dev(plane->dev);
+	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
+
+	nv_mask(dev, NV_PVIDEO_OVERLAY, 1, 0);
+	nv_wr32(dev, NV_PVIDEO_OE_STATE, 0);
+	nv_wr32(dev, NV_PVIDEO_SU_STATE, 0);
+	nv_wr32(dev, NV_PVIDEO_RM_STATE, 0);
+	if (nv_plane->cur) {
+		nouveau_bo_unpin(nv_plane->cur);
+		nv_plane->cur = NULL;
+	}
+
+	return 0;
+}
+
+static const struct drm_plane_funcs nv04_plane_funcs = {
+	.update_plane = nv04_update_plane,
+	.disable_plane = nv04_disable_plane,
+	.set_property = nv_set_property,
+	.destroy = nv_destroy_plane,
+};
+
+static void
+nv04_overlay_init(struct drm_device *device)
+{
+	struct nouveau_device *dev = nouveau_dev(device);
+	struct nouveau_plane *plane = kzalloc(sizeof(struct nouveau_plane), GFP_KERNEL);
+	int ret;
+
+	if (!plane)
+		return;
+
+	ret = drm_plane_init(device, &plane->base, 1 /* single crtc */,
+			     &nv04_plane_funcs,
+			     formats, 2, false);
+	if (ret)
+		goto err;
+
+	/* Set up the plane properties */
+	plane->props.colorkey = drm_property_create_range(
+			device, 0, "colorkey", 0, 0x01ffffff);
+	plane->props.brightness = drm_property_create_range(
+			device, 0, "brightness", 0, 1024);
+	if (!plane->props.colorkey ||
+	    !plane->props.brightness)
+		goto cleanup;
+
+	plane->colorkey = 0;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.colorkey, plane->colorkey);
+
+	plane->brightness = 512;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.brightness, plane->brightness);
+
+	nv04_disable_plane(&plane->base);
 	return;
 cleanup:
 	drm_plane_cleanup(&plane->base);
@@ -336,6 +490,8 @@ void
 nouveau_overlay_init(struct drm_device *device)
 {
 	struct nouveau_device *dev = nouveau_dev(device);
-	if (dev->chipset >= 0x10 && dev->chipset <= 0x40)
+	if (dev->chipset < 0x10)
+		nv04_overlay_init(device);
+	else if (dev->chipset <= 0x40)
 		nv10_overlay_init(device);
 }
-- 
1.8.3.2

From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: [PATCH] drm/nv10/plane: add plane support for nv10-nv40
Date: Sat,  7 Sep 2013 20:33:43 -0400
Message-ID: <1378600423-10875-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
---

This has received light testing on NV18 and NV34 cards, using the modetest
tool. Userspace support to use this for xv is not yet ready.

I decided against creating a new "pvideo" engine -- that just seems way too
heavy-handed compared to the ~10 lines of code in disp/nv04.c to deal with the
PVIDEO interrupts.

Even though there are two possible planes, they are sufficiently linked
together that I decided to just expose them as one, and do a
double-buffering-style thing, similar to what xf86-video-nouveau did pre-KMS.

 drivers/gpu/drm/nouveau/core/engine/disp/nv04.c |   9 +
 drivers/gpu/drm/nouveau/core/subdev/mc/nv04.c   |   1 +
 drivers/gpu/drm/nouveau/dispnv04/Makefile       |   1 +
 drivers/gpu/drm/nouveau/dispnv04/disp.c         |   2 +
 drivers/gpu/drm/nouveau/dispnv04/disp.h         |   3 +
 drivers/gpu/drm/nouveau/dispnv04/hw.c           |  10 +-
 drivers/gpu/drm/nouveau/dispnv04/overlay.c      | 320 ++++++++++++++++++++++++
 7 files changed, 342 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv04/overlay.c

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv04.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv04.c
index 05e903f..a0bc8a8 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv04.c
@@ -59,6 +59,7 @@ nv04_disp_intr(struct nouveau_subdev *subdev)
 	struct nv04_disp_priv *priv = (void *)subdev;
 	u32 crtc0 = nv_rd32(priv, 0x600100);
 	u32 crtc1 = nv_rd32(priv, 0x602100);
+	u32 pvideo;
 
 	if (crtc0 & 0x00000001) {
 		nouveau_event_trigger(priv->base.vblank, 0);
@@ -69,6 +70,14 @@ nv04_disp_intr(struct nouveau_subdev *subdev)
 		nouveau_event_trigger(priv->base.vblank, 1);
 		nv_wr32(priv, 0x602100, 0x00000001);
 	}
+
+	if (nv_device(priv)->chipset >= 0x10 &&
+	    nv_device(priv)->chipset <= 0x40) {
+		pvideo = nv_rd32(priv, 0x8100);
+		if (pvideo & ~0x11)
+			nv_info(priv, "PVIDEO intr: %08x\n", pvideo);
+		nv_wr32(priv, 0x8100, pvideo);
+	}
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv04.c b/drivers/gpu/drm/nouveau/core/subdev/mc/nv04.c
index 64aa4ed..062c048 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/mc/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/mc/nv04.c
@@ -33,6 +33,7 @@ nv04_mc_intr[] = {
 	{ 0x00000001, NVDEV_ENGINE_MPEG },	/* NV17- MPEG/ME */
 	{ 0x00000100, NVDEV_ENGINE_FIFO },
 	{ 0x00001000, NVDEV_ENGINE_GR },
+	{ 0x00010000, NVDEV_ENGINE_DISP },
 	{ 0x00020000, NVDEV_ENGINE_VP },	/* NV40- */
 	{ 0x00100000, NVDEV_SUBDEV_TIMER },
 	{ 0x01000000, NVDEV_ENGINE_DISP },	/* NV04- PCRTC0 */
diff --git a/drivers/gpu/drm/nouveau/dispnv04/Makefile b/drivers/gpu/drm/nouveau/dispnv04/Makefile
index ea3f5b8..424a489 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/Makefile
+++ b/drivers/gpu/drm/nouveau/dispnv04/Makefile
@@ -5,6 +5,7 @@ nouveau-y += dispnv04/dac.o
 nouveau-y += dispnv04/dfp.o
 nouveau-y += dispnv04/disp.o
 nouveau-y += dispnv04/hw.o
+nouveau-y += dispnv04/overlay.o
 nouveau-y += dispnv04/tvmodesnv17.o
 nouveau-y += dispnv04/tvnv04.o
 nouveau-y += dispnv04/tvnv17.o
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 4908d3f..b13ff0f 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -140,6 +140,8 @@ nv04_display_create(struct drm_device *dev)
 		func->save(encoder);
 	}
 
+	nouveau_overlay_init(dev);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 9928187..bb5c1bd 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -123,6 +123,9 @@ int nv04_tv_create(struct drm_connector *, struct dcb_output *);
 /* nv17_tv.c */
 int nv17_tv_create(struct drm_connector *, struct dcb_output *);
 
+/* overlay.c */
+void nouveau_overlay_init(struct drm_device *dev);
+
 static inline bool
 nv_two_heads(struct drm_device *dev)
 {
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index ffd2641..b1c5cd6 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -27,6 +27,7 @@
 #include "hw.h"
 
 #include <subdev/bios/pll.h>
+#include <subdev/fb.h>
 #include <subdev/clock.h>
 #include <subdev/timer.h>
 
@@ -664,6 +665,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_device *device = nv_device(drm->device);
 	struct nouveau_timer *ptimer = nouveau_timer(device);
+	struct nouveau_fb *pfb = nouveau_fb(device);
 	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
 	uint32_t reg900;
 	int i;
@@ -680,10 +682,10 @@ nv_load_state_ext(struct drm_device *dev, int head,
 		nv_wr32(device, NV_PVIDEO_INTR_EN, 0);
 		nv_wr32(device, NV_PVIDEO_OFFSET_BUFF(0), 0);
 		nv_wr32(device, NV_PVIDEO_OFFSET_BUFF(1), 0);
-		nv_wr32(device, NV_PVIDEO_LIMIT(0), 0); //drm->fb_available_size - 1);
-		nv_wr32(device, NV_PVIDEO_LIMIT(1), 0); //drm->fb_available_size - 1);
-		nv_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(0), 0); //drm->fb_available_size - 1);
-		nv_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(1), 0); //drm->fb_available_size - 1);
+		nv_wr32(device, NV_PVIDEO_LIMIT(0), pfb->ram->size - 1);
+		nv_wr32(device, NV_PVIDEO_LIMIT(1), pfb->ram->size - 1);
+		nv_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(0), pfb->ram->size - 1);
+		nv_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(1), pfb->ram->size - 1);
 		nv_wr32(device, NV_PBUS_POWERCTRL_2, 0);
 
 		NVWriteCRTC(dev, head, NV_PCRTC_CURSOR_CONFIG, regp->cursor_cfg);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
new file mode 100644
index 0000000..7caf26f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -0,0 +1,320 @@
+/*
+ * Copyright 2013 Ilia Mirkin
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
+ * OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ * Implementation based on the pre-KMS implementation in xf86-video-nouveau,
+ * written by Arthur Huillet.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_fourcc.h>
+
+#include "nouveau_drm.h"
+
+#include "nouveau_bo.h"
+#include "nouveau_connector.h"
+#include "nouveau_display.h"
+#include "nvreg.h"
+
+
+struct nouveau_plane {
+	struct drm_plane base;
+	bool flip;
+	struct nouveau_bo *cur;
+
+	struct {
+		struct drm_property *colorkey;
+		struct drm_property *contrast;
+		struct drm_property *brightness;
+		struct drm_property *hue;
+		struct drm_property *saturation;
+		struct drm_property *iturbt_709;
+	} props;
+
+	int colorkey;
+	int contrast;
+	int brightness;
+	int hue;
+	int saturation;
+	int iturbt_709;
+};
+
+static uint32_t formats[] = {
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_UYVY,
+};
+
+/* Sine can be approximated with
+ * http://en.wikipedia.org/wiki/Bhaskara_I's_sine_approximation_formula
+ * sin(x degrees) ~= 4 x (180 - x) / (40500 - x (180 - x) )
+ * Note that this only works for the range [0, 180].
+ * Also note that sin(x) == -sin(x - 180)
+ */
+static inline int
+sin_mul(int degrees, int factor)
+{
+	if (degrees > 180) {
+		degrees -= 180;
+		factor *= -1;
+	}
+	return factor * 4 * degrees * (180 - degrees) /
+		(40500 - degrees * (180 - degrees));
+}
+
+/* cos(x) = sin(x + 90) */
+static inline int
+cos_mul(int degrees, int factor)
+{
+	return sin_mul((degrees + 90) % 360, factor);
+}
+
+static int
+nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
+		  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
+		  unsigned int crtc_w, unsigned int crtc_h,
+		  uint32_t src_x, uint32_t src_y,
+		  uint32_t src_w, uint32_t src_h)
+{
+	struct nouveau_device *dev = nouveau_dev(plane->dev);
+	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
+	struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
+	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
+	struct nouveau_bo *cur = nv_plane->cur;
+	bool flip = nv_plane->flip;
+	int format = ALIGN(src_w * 4, 0x100);
+	int soff = NV_PCRTC0_SIZE * nv_crtc->index;
+	int soff2 = NV_PCRTC0_SIZE * !nv_crtc->index;
+	int ret;
+
+	if (format > 0xffff)
+		return -EINVAL;
+
+	ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM);
+	if (ret)
+		return ret;
+
+	nv_plane->cur = nv_fb->nvbo;
+
+	/* Source parameters given in 16.16 fixed point, ignore fractional. */
+	src_x = src_x >> 16;
+	src_y = src_y >> 16;
+	src_w = src_w >> 16;
+	src_h = src_h >> 16;
+
+	nv_mask(dev, NV_PCRTC_ENGINE_CTRL + soff, NV_CRTC_FSEL_OVERLAY, NV_CRTC_FSEL_OVERLAY);
+	nv_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
+
+	nv_wr32(dev, NV_PVIDEO_BASE(flip), 0);
+	nv_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
+	nv_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
+	nv_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
+	nv_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
+	nv_wr32(dev, NV_PVIDEO_DT_DY(flip), (src_h << 20) / crtc_h);
+	nv_wr32(dev, NV_PVIDEO_POINT_OUT(flip), crtc_y << 16 | crtc_x);
+	nv_wr32(dev, NV_PVIDEO_SIZE_OUT(flip), crtc_h << 16 | crtc_w);
+
+	if (fb->pixel_format == DRM_FORMAT_NV12) {
+		format |= NV_PVIDEO_FORMAT_COLOR_LE_CR8YB8CB8YA8;
+		format |= NV_PVIDEO_FORMAT_PLANAR;
+	}
+	if (nv_plane->iturbt_709)
+		format |= NV_PVIDEO_FORMAT_MATRIX_ITURBT709;
+	if (nv_plane->colorkey & (1 << 24))
+		format |= NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY;
+
+	if (fb->pixel_format == DRM_FORMAT_NV12) {
+		nv_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
+		nv_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
+			nv_fb->nvbo->bo.offset + fb->offsets[1]);
+	}
+	nv_wr32(dev, NV_PVIDEO_FORMAT(flip), format);
+	nv_wr32(dev, NV_PVIDEO_STOP, 0);
+	/* TODO: wait for vblank? */
+	nv_wr32(dev, NV_PVIDEO_BUFFER, flip ? 0x10 : 0x1);
+	nv_plane->flip = !flip;
+
+	if (cur)
+		nouveau_bo_unpin(cur);
+
+	return 0;
+}
+
+static int
+nv10_disable_plane(struct drm_plane *plane)
+{
+	struct nouveau_device *dev = nouveau_dev(plane->dev);
+	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
+
+	nv_wr32(dev, NV_PVIDEO_STOP, 1);
+	if (nv_plane->cur) {
+		nouveau_bo_unpin(nv_plane->cur);
+		nv_plane->cur = NULL;
+	}
+
+	return 0;
+}
+
+static void
+nv10_destroy_plane(struct drm_plane *plane)
+{
+	nv10_disable_plane(plane);
+	drm_plane_cleanup(plane);
+	kfree(plane);
+}
+
+static void
+nv10_set_params(struct nouveau_plane *plane)
+{
+	struct nouveau_device *dev = nouveau_dev(plane->base.dev);
+	u32 luma = (plane->brightness - 512) << 16 | plane->contrast;
+	u32 chroma = ((sin_mul(plane->hue, plane->saturation) & 0xffff) << 16) |
+		(cos_mul(plane->hue, plane->saturation) & 0xffff);
+	u32 format = 0;
+
+	nv_wr32(dev, NV_PVIDEO_LUMINANCE(0), luma);
+	nv_wr32(dev, NV_PVIDEO_LUMINANCE(1), luma);
+	nv_wr32(dev, NV_PVIDEO_CHROMINANCE(0), chroma);
+	nv_wr32(dev, NV_PVIDEO_CHROMINANCE(1), chroma);
+	nv_wr32(dev, NV_PVIDEO_COLOR_KEY, plane->colorkey & 0xffffff);
+
+	if (plane->cur) {
+		if (plane->iturbt_709)
+			format |= NV_PVIDEO_FORMAT_MATRIX_ITURBT709;
+		if (plane->colorkey & (1 << 24))
+			format |= NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY;
+		nv_mask(dev, NV_PVIDEO_FORMAT(plane->flip),
+			NV_PVIDEO_FORMAT_MATRIX_ITURBT709 |
+			NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY,
+			format);
+	}
+}
+
+static int
+nv10_set_property(struct drm_plane *plane,
+		  struct drm_property *property,
+		  uint64_t value)
+{
+	struct nouveau_plane *nv_plane = (struct nouveau_plane *)plane;
+
+	if (property == nv_plane->props.colorkey)
+		nv_plane->colorkey = value;
+	else if (property == nv_plane->props.contrast)
+		nv_plane->colorkey = value;
+	else if (property == nv_plane->props.brightness)
+		nv_plane->brightness = value;
+	else if (property == nv_plane->props.hue)
+		nv_plane->hue = value;
+	else if (property == nv_plane->props.saturation)
+		nv_plane->saturation = value;
+	else if (property == nv_plane->props.iturbt_709)
+		nv_plane->iturbt_709 = value;
+	else
+		return -EINVAL;
+
+	nv10_set_params(nv_plane);
+	return 0;
+}
+
+static const struct drm_plane_funcs nv10_plane_funcs = {
+	.update_plane = nv10_update_plane,
+	.disable_plane = nv10_disable_plane,
+	.set_property = nv10_set_property,
+	.destroy = nv10_destroy_plane,
+};
+
+static void
+nv10_overlay_init(struct drm_device *device)
+{
+	struct nouveau_device *dev = nouveau_dev(device);
+	struct nouveau_plane *plane = kzalloc(sizeof(struct nouveau_plane), GFP_KERNEL);
+	int ret;
+
+	if (!plane)
+		return;
+
+	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
+			     &nv10_plane_funcs,
+			     formats, ARRAY_SIZE(formats), false);
+	if (ret)
+		goto err;
+
+	/* Set up the plane properties */
+	plane->props.colorkey = drm_property_create_range(
+			device, 0, "colorkey", 0, 0x01ffffff);
+	plane->props.contrast = drm_property_create_range(
+			device, 0, "contrast", 0, 8192 - 1);
+	plane->props.brightness = drm_property_create_range(
+			device, 0, "brightness", 0, 1024);
+	plane->props.hue = drm_property_create_range(
+			device, 0, "hue", 0, 359);
+	plane->props.saturation = drm_property_create_range(
+			device, 0, "saturation", 0, 8192 - 1);
+	plane->props.iturbt_709 = drm_property_create_range(
+			device, 0, "iturbt_709", 0, 1);
+	if (!plane->props.colorkey ||
+	    !plane->props.contrast ||
+	    !plane->props.brightness ||
+	    !plane->props.hue ||
+	    !plane->props.saturation ||
+	    !plane->props.iturbt_709)
+		goto cleanup;
+
+	plane->colorkey = 0;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.colorkey, plane->colorkey);
+
+	plane->contrast = 0x1000;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.contrast, plane->contrast);
+
+	plane->brightness = 512;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.brightness, plane->brightness);
+
+	plane->hue = 0;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.hue, plane->hue);
+
+	plane->saturation = 0x1000;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.saturation, plane->saturation);
+
+	plane->iturbt_709 = 0;
+	drm_object_attach_property(&plane->base.base,
+				   plane->props.iturbt_709, plane->iturbt_709);
+
+	nv10_set_params(plane);
+	nv_wr32(dev, NV_PVIDEO_STOP, 1);
+	return;
+cleanup:
+	drm_plane_cleanup(&plane->base);
+err:
+	kfree(plane);
+	nv_error(dev, "Failed to create plane\n");
+}
+
+void
+nouveau_overlay_init(struct drm_device *device)
+{
+	struct nouveau_device *dev = nouveau_dev(device);
+	if (dev->chipset >= 0x10 && dev->chipset <= 0x40)
+		nv10_overlay_init(device);
+}
-- 
1.8.1.5

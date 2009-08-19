From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv3 2/2] drm/nouveau: Implement <nv11 hardware
	cursor.
Date: Wed, 19 Aug 2009 20:33:50 +0200
Message-ID: <1250706830-11092-2-git-send-email-currojerez@riseup.net>
References: <1250701360-5619-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250701360-5619-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
The last rebase unwittingly reverted some BO accessor changes...

 drivers/gpu/drm/nouveau/nouveau_hw.h |   10 ++++
 drivers/gpu/drm/nouveau/nv04_crtc.c  |   95 +++++++++++++++++++++++-----------
 2 files changed, 75 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hw.h b/drivers/gpu/drm/nouveau/nouveau_hw.h
index 9d86461..129345e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hw.h
+++ b/drivers/gpu/drm/nouveau/nouveau_hw.h
@@ -379,6 +379,16 @@ NVLockVgaCrtcs(struct drm_device *dev, bool lock)
 	return waslocked;
 }
 
+/* nv04 cursor max dimensions of 32x32 (A1R5G5B5) */
+#define NV04_CURSOR_SIZE 32
+/* limit nv10 cursors to 64x64 (ARGB8) (we could go to 64x255) */
+#define NV10_CURSOR_SIZE 64
+
+static inline int nv_cursor_width(struct drm_device *dev)
+{
+	return nv_arch(dev) >= NV_10 ? NV10_CURSOR_SIZE : NV04_CURSOR_SIZE;
+}
+
 static inline void
 nv_fix_nv40_hw_cursor(struct drm_device *dev, int head)
 {
diff --git a/drivers/gpu/drm/nouveau/nv04_crtc.c b/drivers/gpu/drm/nouveau/nv04_crtc.c
index 4e56c25..5a28d1a 100644
--- a/drivers/gpu/drm/nouveau/nv04_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv04_crtc.c
@@ -839,6 +839,66 @@ nv04_crtc_mode_set_base(struct drm_crtc *crtc, int x, int y,
 	return 0;
 }
 
+static void nv04_cursor_upload(struct drm_device *dev, struct nouveau_bo *src,
+			       struct nouveau_bo *dst)
+{
+	int width = nv_cursor_width(dev);
+	uint32_t pixel;
+	int i, j;
+
+	for (i = 0; i < width; i++) {
+		for (j = 0; j < width; j++) {
+			pixel = nouveau_bo_rd32(src, i*64 + j);
+
+			nouveau_bo_wr16(dst, i*width + j, (pixel & 0x80000000) >> 16
+				     | (pixel & 0xf80000) >> 9
+				     | (pixel & 0xf800) >> 6
+				     | (pixel & 0xf8) >> 3);
+		}
+	}
+}
+
+static void nv11_cursor_upload(struct drm_device *dev, struct nouveau_bo *src,
+			       struct nouveau_bo *dst)
+{
+	uint32_t pixel;
+	int alpha, i;
+
+	/* nv11+ supports premultiplied (PM), or non-premultiplied (NPM) alpha
+	 * cursors (though NPM in combination with fp dithering may not work on
+	 * nv11, from "nv" driver history)
+	 * NPM mode needs NV_PCRTC_CURSOR_CONFIG_ALPHA_BLEND set and is what the
+	 * blob uses, however we get given PM cursors so we use PM mode
+	 */
+	for (i = 0; i < 64 * 64; i++) {
+		pixel = nouveau_bo_rd32(src, i);
+
+		/* hw gets unhappy if alpha <= rgb values.  for a PM image "less
+		 * than" shouldn't happen; fix "equal to" case by adding one to
+		 * alpha channel (slightly inaccurate, but so is attempting to
+		 * get back to NPM images, due to limits of integer precision)
+		 */
+		alpha = pixel >> 24;
+		if (alpha > 0 && alpha < 255)
+			pixel = (pixel & 0x00ffffff) | ((alpha + 1) << 24);
+
+#ifdef __BIG_ENDIAN
+		{
+			struct drm_nouveau_private *dev_priv = dev->dev_private;
+
+			if (dev_priv->chipset == 0x11) {
+				pixel = ((pixel & 0x000000ff) << 24) |
+					((pixel & 0x0000ff00) << 8) |
+					((pixel & 0x00ff0000) >> 8) |
+					((pixel & 0xff000000) >> 24);
+			}
+		}
+#endif
+
+		nouveau_bo_wr32(dst, i, pixel);
+	}
+}
+
 static int
 nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		     uint32_t buffer_handle, uint32_t width, uint32_t height)
@@ -848,7 +908,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nouveau_bo *cursor = NULL;
 	struct drm_gem_object *gem;
-	int ret = 0, alpha, i;
+	int ret = 0;
 
 	if (width != 64 || height != 64)
 		return -EINVAL;
@@ -867,35 +927,10 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	if (ret)
 		goto out;
 
-	/* nv11+ supports premultiplied (PM), or non-premultiplied (NPM) alpha
-	 * cursors (though NPM in combination with fp dithering may not work on
-	 * nv11, from "nv" driver history)
-	 * NPM mode needs NV_PCRTC_CURSOR_CONFIG_ALPHA_BLEND set and is what the
-	 * blob uses, however we get given PM cursors so we use PM mode
-	 */
-	for (i = 0; i < 64 * 64; i++) {
-		uint32_t pixel = nouveau_bo_rd32(cursor, i);
-
-		/* hw gets unhappy if alpha <= rgb values.  for a PM image "less
-		 * than" shouldn't happen; fix "equal to" case by adding one to
-		 * alpha channel (slightly inaccurate, but so is attempting to
-		 * get back to NPM images, due to limits of integer precision)
-		 */
-		alpha = pixel >> 24;
-		if (alpha > 0 && alpha < 255)
-			pixel = (pixel & 0x00ffffff) | ((alpha + 1) << 24);
-
-#ifdef __BIG_ENDIAN
-		if (dev_priv->chipset == 0x11) {
-			pixel = ((pixel & 0x000000ff) << 24) |
-				((pixel & 0x0000ff00) << 8) |
-				((pixel & 0x00ff0000) >> 8) |
-				((pixel & 0xff000000) >> 24);
-		}
-#endif
-
-		nouveau_bo_wr32(nv_crtc->cursor.nvbo, i, pixel);
-	}
+	if (dev_priv->chipset >= 0x11)
+		nv11_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
+	else
+		nv04_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
 
 	nouveau_bo_unmap(cursor);
 	nv_crtc->cursor.offset = nv_crtc->cursor.nvbo->bo.offset;
-- 
1.6.3.3

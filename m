From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH] kms: Fix <nv11 hardware cursor.
Date: Mon, 17 Aug 2009 20:08:27 +0200
Message-ID: <1250532507-11732-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

---
 src/drmmode_display.c |   29 +++++++++++++++++--
 src/nouveau_hw.h      |   17 +++++++++++
 src/nv_cursor.c       |   74 ++++++++++++++++++++++++------------------------
 src/nv_proto.h        |    2 +
 4 files changed, 82 insertions(+), 40 deletions(-)

diff --git a/src/drmmode_display.c b/src/drmmode_display.c
index f2fe0e8..7acddf1 100644
--- a/src/drmmode_display.c
+++ b/src/drmmode_display.c
@@ -333,7 +333,14 @@ done:
 static void
 drmmode_set_cursor_colors (xf86CrtcPtr crtc, int bg, int fg)
 {
+	NVPtr pNv = NVPTR(crtc->scrn);
+	drmmode_crtc_private_ptr drmmode_crtc = crtc->driver_private;
+	struct nouveau_bo *bo = drmmode_crtc->cursor;
 
+	nouveau_bo_map(bo, NOUVEAU_BO_WR);
+	nv_cursor_convert_cursor(pNv->curImage, bo->map, nv_cursor_width(pNv),
+				 64, 32, fg | (0xff << 24), bg | (0xff << 24));
+	nouveau_bo_unmap(bo);
 }
 
 static void
@@ -346,6 +353,24 @@ drmmode_set_cursor_position (xf86CrtcPtr crtc, int x, int y)
 }
 
 static void
+drmmode_load_cursor_image (xf86CrtcPtr crtc, CARD8 *image)
+{
+	NVPtr pNv = NVPTR(crtc->scrn);
+	xf86CrtcConfigPtr config = XF86_CRTC_CONFIG_PTR(crtc->scrn);
+	drmmode_crtc_private_ptr drmmode_crtc = crtc->driver_private;
+	struct nouveau_bo *bo = drmmode_crtc->cursor;
+
+	/* save copy of image for colour changes */
+	memcpy(pNv->curImage, image, nv_cursor_pixels(pNv)/4);
+
+	nouveau_bo_map(bo, NOUVEAU_BO_WR);
+	nv_cursor_convert_cursor(pNv->curImage, bo->map, nv_cursor_width(pNv),
+				 64, 32, config->cursor_fg | (0xff << 24),
+				 config->cursor_bg | (0xff << 24));
+	nouveau_bo_unmap(bo);
+}
+
+static void
 drmmode_load_cursor_argb (xf86CrtcPtr crtc, CARD32 *image)
 {
 	drmmode_crtc_private_ptr drmmode_crtc = crtc->driver_private;
@@ -505,14 +530,12 @@ static const xf86CrtcFuncsRec drmmode_crtc_funcs = {
 	.set_cursor_position = drmmode_set_cursor_position,
 	.show_cursor = drmmode_show_cursor,
 	.hide_cursor = drmmode_hide_cursor,
+	.load_cursor_image = drmmode_load_cursor_image,
 	.load_cursor_argb = drmmode_load_cursor_argb,
 	.shadow_create = drmmode_crtc_shadow_create,
 	.shadow_allocate = drmmode_crtc_shadow_allocate,
 	.shadow_destroy = drmmode_crtc_shadow_destroy,
 	.gamma_set = drmmode_gamma_set,
-#if 0
-	.set_cursor_colors = drmmode_crtc_set_cursor_colors,
-#endif
 	.destroy = NULL, /* XXX */
 };
 
diff --git a/src/nouveau_hw.h b/src/nouveau_hw.h
index a548a4c..aa2a3b4 100644
--- a/src/nouveau_hw.h
+++ b/src/nouveau_hw.h
@@ -287,6 +287,23 @@ static inline bool NVLockVgaCrtcs(NVPtr pNv, bool lock)
 	return waslocked;
 }
 
+/* nv04 cursor max dimensions of 32x32 (A1R5G5B5) */
+#define NV04_CURSOR_SIZE 32
+/* limit nv10 cursors to 64x64 (ARGB8) (we could go to 64x255) */
+#define NV10_CURSOR_SIZE 64
+
+static inline int nv_cursor_width(NVPtr pNv)
+{
+	return pNv->NVArch >= 0x10 ? NV10_CURSOR_SIZE : NV04_CURSOR_SIZE;
+}
+
+static inline int nv_cursor_pixels(NVPtr pNv)
+{
+	int width = nv_cursor_width(pNv);
+
+	return width * width;
+}
+
 static inline void nv_fix_nv40_hw_cursor(NVPtr pNv, int head)
 {
 	/* on some nv40 (such as the "true" (in the NV_PFB_BOOT_0 sense) nv40,
diff --git a/src/nv_cursor.c b/src/nv_cursor.c
index 22db9e6..b9320c5 100644
--- a/src/nv_cursor.c
+++ b/src/nv_cursor.c
@@ -30,44 +30,43 @@
 			((c & 0xf8) >> 3 ))		/* Blue     */
 #define TO_ARGB8888(c) (0xff000000 | c)
 
-/* nv04 cursor max dimensions of 32x32 (A1R5G5B5) */
-#define NV04_CURSOR_SIZE 32
-#define NV04_CURSOR_PIXELS (NV04_CURSOR_SIZE * NV04_CURSOR_SIZE)
-
-/* limit nv10 cursors to 64x64 (ARGB8) (we could go to 64x255) */
-#define NV10_CURSOR_SIZE 64
-#define NV10_CURSOR_PIXELS (NV10_CURSOR_SIZE * NV10_CURSOR_SIZE)
-
 #define SOURCE_MASK_INTERLEAVE 32
 #define TRANSPARENT_PIXEL   0
 
-static void
-nv_cursor_convert_cursor(int px, uint32_t *src, uint16_t *dst, int bpp, uint32_t fg, uint32_t bg)
+void
+nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride, int dst_stride,
+			 int bpp, uint32_t fg, uint32_t bg)
 {
+	int width = min(src_stride, dst_stride);
 	uint32_t b, m, pxval;
-	int i, j;
+	int i, j, k;
+
+	for (i = 0; i < width; i++) {
+		for (j = 0; j < width / SOURCE_MASK_INTERLEAVE; j++) {
+			int src_off = i*src_stride/SOURCE_MASK_INTERLEAVE + j;
+			int dst_off = i*dst_stride + j*SOURCE_MASK_INTERLEAVE;
+
+			b = src[2*src_off];
+			m = src[2*src_off + 1];
 
-	for (i = 0; i < px / SOURCE_MASK_INTERLEAVE; i++) {
-		b = *src++;
-		m = *src++;
-		for (j = 0; j < SOURCE_MASK_INTERLEAVE; j++) {
-			pxval = TRANSPARENT_PIXEL;
+			for (k = 0; k < SOURCE_MASK_INTERLEAVE; k++) {
+				pxval = TRANSPARENT_PIXEL;
 #if X_BYTE_ORDER == X_BIG_ENDIAN
-			if (m & 0x80000000)
-				pxval = (b & 0x80000000) ? fg : bg;
-			b <<= 1;
-			m <<= 1;
+				if (m & 0x80000000)
+					pxval = (b & 0x80000000) ? fg : bg;
+				b <<= 1;
+				m <<= 1;
 #else
-			if (m & 1)
-				pxval = (b & 1) ? fg : bg;
-			b >>= 1;
-			m >>= 1;
+				if (m & 1)
+					pxval = (b & 1) ? fg : bg;
+				b >>= 1;
+				m >>= 1;
 #endif
-			if (bpp == 32) {
-				*(uint32_t *)dst = pxval;
-				dst += 2;
-			} else
-				*dst++ = pxval;
+				if (bpp == 32)
+					((uint32_t *)dst)[dst_off + k] = pxval;
+				else
+					((uint16_t *)dst)[dst_off + k] = pxval;
+			}
 		}
 	}
 }
@@ -76,14 +75,16 @@ static void nv_cursor_transform_cursor(NVPtr pNv, struct nouveau_crtc *nv_crtc)
 {
 	uint16_t *tmp;
 	struct nouveau_bo *cursor = NULL;
-	int px = pNv->NVArch >= 0x10 ? NV10_CURSOR_PIXELS : NV04_CURSOR_PIXELS;
+	int px = nv_cursor_pixels(pNv);
+	int width = nv_cursor_width(pNv);
 
 	if (!(tmp = xcalloc(px, 4)))
 		return;
 
 	/* convert to colour cursor */
-	nv_cursor_convert_cursor(px, pNv->curImage, tmp, pNv->alphaCursor ? 32 : 16,
-				 nv_crtc->cursor_fg, nv_crtc->cursor_bg);
+	nv_cursor_convert_cursor(pNv->curImage, tmp, width, width,
+				 pNv->alphaCursor ? 32 : 16, nv_crtc->cursor_fg,
+				 nv_crtc->cursor_bg);
 
 	nouveau_bo_ref(nv_crtc->head ? pNv->Cursor2 : pNv->Cursor, &cursor);
 	nouveau_bo_map(cursor, NOUVEAU_BO_WR);
@@ -126,10 +127,9 @@ void nv_crtc_set_cursor_colors(xf86CrtcPtr crtc, int bg, int fg)
 void nv_crtc_load_cursor_image(xf86CrtcPtr crtc, CARD8 *image)
 {
 	NVPtr pNv = NVPTR(crtc->scrn);
-	int sz = (pNv->NVArch >= 0x10 ? NV10_CURSOR_PIXELS : NV04_CURSOR_PIXELS) / 4;
 
 	/* save copy of image for colour changes */
-	memcpy(pNv->curImage, image, sz);
+	memcpy(pNv->curImage, image, nv_cursor_pixels(pNv) / 4);
 
 	nv_cursor_transform_cursor(pNv, to_nouveau_crtc(crtc));
 }
@@ -151,7 +151,7 @@ void nv_crtc_load_cursor_argb(xf86CrtcPtr crtc, CARD32 *image)
 	 * NPM mode needs NV_PCRTC_CURSOR_CONFIG_ALPHA_BLEND set and is what the
 	 * blob uses, however we get given PM cursors so we use PM mode
 	 */
-	for (i = 0; i < NV10_CURSOR_PIXELS; i++) {
+	for (i = 0; i < nv_cursor_pixels(pNv); i++) {
 		/* hw gets unhappy if alpha <= rgb values.  for a PM image "less
 		 * than" shouldn't happen; fix "equal to" case by adding one to
 		 * alpha channel (slightly inaccurate, but so is attempting to
@@ -202,10 +202,10 @@ void nv_crtc_set_cursor_position(xf86CrtcPtr crtc, int x, int y)
 Bool NVCursorInitRandr12(ScreenPtr pScreen)
 {
 	NVPtr pNv = NVPTR(xf86Screens[pScreen->myNum]);
-	int size = pNv->NVArch >= 0x10 ? NV10_CURSOR_SIZE : NV04_CURSOR_SIZE;
+	int width = nv_cursor_width(pNv);
 	int flags = HARDWARE_CURSOR_TRUECOLOR_AT_8BPP |
 		    HARDWARE_CURSOR_SOURCE_MASK_INTERLEAVE_32 |
 		    (pNv->alphaCursor ? HARDWARE_CURSOR_ARGB : 0);
 
-	return xf86_cursors_init(pScreen, size, size, flags);
+	return xf86_cursors_init(pScreen, width, width, flags);
 }
diff --git a/src/nv_proto.h b/src/nv_proto.h
index 7c917cc..4a0cbf4 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -48,6 +48,8 @@ void nv_crtc_set_cursor_position(xf86CrtcPtr crtc, int x, int y);
 void nv_crtc_set_cursor_colors(xf86CrtcPtr crtc, int bg, int fg);
 void nv_crtc_load_cursor_image(xf86CrtcPtr crtc, CARD8 *image);
 void nv_crtc_load_cursor_argb(xf86CrtcPtr crtc, CARD32 *image);
+void nv_cursor_convert_cursor(uint32_t *src, void *dst, int src_stride,
+			      int dst_stride, int bpp, uint32_t fg, uint32_t bg);
 
 /* in nv_dma.c */
 void  NVSync(ScrnInfoPtr pScrn);
-- 
1.6.3.3

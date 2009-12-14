From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCHv2 1/2] exa: Pre-G80 tiling support.
Date: Mon, 14 Dec 2009 03:48:18 +0100
Message-ID: <1260758898-12194-1-git-send-email-currojerez@riseup.net>
References: <1260556542-13431-1-git-send-email-currojerez@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260556542-13431-1-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
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

For now, pixmaps will only be tiled if driver pixmaps is being used
and we're told to with the NOUVEAU_CREATE_PIXMAP_TILED usage hint.

Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
---
v2: Fix the pitch align requirements for nv4x.

 src/nouveau_exa.c |   31 ++++++++++++++++++++-----------
 src/nv50_exa.c    |    6 +++---
 src/nv50_xv.c     |    2 +-
 src/nv_proto.h    |    2 +-
 src/nv_type.h     |    1 +
 5 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 68d1030..157b543 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -57,7 +57,7 @@ NVAccelDownloadM2MF(PixmapPtr pspix, int x, int y, int w, int h,
 	unsigned line_len = w * cpp;
 	unsigned src_pitch = 0, linear = 0;
 
-	if (!nouveau_exa_pixmap_is_tiled(pspix)) {
+	if (!nv50_style_tiled_pixmap(pspix)) {
 		linear     = 1;
 		src_pitch  = exaGetPixmapPitch(pspix);
 		src_offset += (y * src_pitch) + (x * cpp);
@@ -175,7 +175,7 @@ NVAccelUploadM2MF(PixmapPtr pdpix, int x, int y, int w, int h,
 	unsigned line_len = w * cpp;
 	unsigned dst_pitch = 0, linear = 0;
 
-	if (!nouveau_exa_pixmap_is_tiled(pdpix)) {
+	if (!nv50_style_tiled_pixmap(pdpix)) {
 		linear     = 1;
 		dst_pitch  = exaGetPixmapPitch(pdpix);
 		dst_offset += (y * dst_pitch) + (x * cpp);
@@ -390,6 +390,7 @@ nouveau_exa_create_pixmap(ScreenPtr pScreen, int width, int height, int depth,
 
 	if (cpp) {
 		flags |= NOUVEAU_BO_VRAM;
+		*new_pitch = width * cpp;
 
 		if (pNv->Architecture >= NV_ARCH_50) {
 			if      (height > 32) tile_mode = 4;
@@ -398,15 +399,22 @@ nouveau_exa_create_pixmap(ScreenPtr pScreen, int width, int height, int depth,
 			else if (height >  4) tile_mode = 1;
 			else                  tile_mode = 0;
 
-			if (usage_hint == NOUVEAU_CREATE_PIXMAP_ZETA)
+			if (usage_hint & NOUVEAU_CREATE_PIXMAP_ZETA)
 				tile_flags = 0x2800;
 			else
 				tile_flags = 0x7000;
 
 			height = NOUVEAU_ALIGN(height, 1 << (tile_mode + 2));
-		}
+		} else {
+			if (usage_hint & NOUVEAU_CREATE_PIXMAP_TILED) {
+				int pitch_align =
+					pNv->NVArch >= 0x40 ? 1024 : 256;
 
-		*new_pitch = width * cpp;
+				*new_pitch = NOUVEAU_ALIGN(*new_pitch,
+							   pitch_align);
+				tile_mode = *new_pitch;
+			}
+		}
 	} else {
 		*new_pitch = (width * bitsPerPixel + 7) / 8;
 	}
@@ -446,12 +454,13 @@ nouveau_exa_destroy_pixmap(ScreenPtr pScreen, void *priv)
 }
 
 bool
-nouveau_exa_pixmap_is_tiled(PixmapPtr ppix)
+nv50_style_tiled_pixmap(PixmapPtr ppix)
 {
-	if (!nouveau_pixmap_bo(ppix)->tile_flags)
-		return false;
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
 
-	return true;
+	return pNv->Architecture == NV_ARCH_50 &&
+		nouveau_pixmap_bo(ppix)->tile_flags;
 }
 
 static void *
@@ -462,7 +471,7 @@ nouveau_exa_pixmap_map(PixmapPtr ppix)
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
 	unsigned delta = nouveau_pixmap_offset(ppix);
 
-	if (bo->tile_flags && !pNv->wfb_enabled) {
+	if (nv50_style_tiled_pixmap(ppix) && !pNv->wfb_enabled) {
 		struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
 
 		nvpix->map_refcount++;
@@ -490,7 +499,7 @@ nouveau_exa_pixmap_unmap(PixmapPtr ppix)
 	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
 
-	if (bo->tile_flags && !pNv->wfb_enabled) {
+	if (nv50_style_tiled_pixmap(ppix) && !pNv->wfb_enabled) {
 		struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
 
 		if (--nvpix->map_refcount)
diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 7081d72..c7609b3 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -119,7 +119,7 @@ NV50EXAAcquireSurface2D(PixmapPtr ppix, int is_src)
 	bo_flags  = NOUVEAU_BO_VRAM;
 	bo_flags |= is_src ? NOUVEAU_BO_RD : NOUVEAU_BO_WR;
 
-	if (!nouveau_exa_pixmap_is_tiled(ppix)) {
+	if (!nv50_style_tiled_pixmap(ppix)) {
 		BEGIN_RING(chan, eng2d, mthd, 2);
 		OUT_RING  (chan, fmt);
 		OUT_RING  (chan, 1);
@@ -465,7 +465,7 @@ NV50EXARenderTarget(PixmapPtr ppix, PicturePtr ppict)
 	unsigned format;
 
 	/*XXX: Scanout buffer not tiled, someone needs to figure it out */
-	if (!nouveau_exa_pixmap_is_tiled(ppix))
+	if (!nv50_style_tiled_pixmap(ppix))
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	switch (ppict->format) {
@@ -553,7 +553,7 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 	const unsigned tcb_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 
 	/*XXX: Scanout buffer not tiled, someone needs to figure it out */
-	if (!nouveau_exa_pixmap_is_tiled(ppix))
+	if (!nv50_style_tiled_pixmap(ppix))
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	BEGIN_RING(chan, tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index 712626c..daf1a41 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -50,7 +50,7 @@ nv50_xv_check_image_put(PixmapPtr ppix)
 		return FALSE;
 	}
 
-	if (!nouveau_exa_pixmap_is_tiled(ppix))
+	if (!nv50_style_tiled_pixmap(ppix))
 		return FALSE;
 
 	return TRUE;
diff --git a/src/nv_proto.h b/src/nv_proto.h
index ceddbee..ee1c8f2 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -61,7 +61,7 @@ void  NVTakedownDma(ScrnInfoPtr pScrn);
 /* in nouveau_exa.c */
 Bool nouveau_exa_init(ScreenPtr pScreen);
 Bool nouveau_exa_pixmap_is_onscreen(PixmapPtr pPixmap);
-bool nouveau_exa_pixmap_is_tiled(PixmapPtr ppix);
+bool nv50_style_tiled_pixmap(PixmapPtr ppix);
 
 /* in nouveau_wfb.c */
 void nouveau_wfb_setup_wrap(ReadMemoryProcPtr *, WriteMemoryProcPtr *,
diff --git a/src/nv_type.h b/src/nv_type.h
index 0c13dac..6face1f 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -279,6 +279,7 @@ typedef struct _NVPortPrivRec {
 
 /* EXA driver-controlled pixmaps */
 #define NOUVEAU_CREATE_PIXMAP_ZETA 0x10000000
+#define NOUVEAU_CREATE_PIXMAP_TILED 0x20000000
 
 struct nouveau_pixmap {
 	struct nouveau_bo *bo;
-- 
1.6.4.4

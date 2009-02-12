From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] exa: add nouveau_exa_pixmap_is_tiled
Date: Thu, 12 Feb 2009 23:56:30 +0100
Message-ID: <1234479392-1984-1-git-send-email-madman2003@gmail.com>
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
 src/nouveau_exa.c |   19 +++++++++++++++----
 src/nv50_exa.c    |    6 +++---
 src/nv50_xv.c     |    5 +----
 src/nv_proto.h    |    1 +
 4 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index a947a31..3babfd7 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -52,8 +52,7 @@ NVAccelDownloadM2MF(PixmapPtr pspix, int x, int y, int w, int h,
 	unsigned line_len = w * cpp;
 	unsigned src_pitch = 0, src_offset = 0, linear = 0;
 
-	if (pNv->Architecture < NV_ARCH_50 ||
-	    exaGetPixmapOffset(pspix) < pNv->EXADriverPtr->offScreenBase) {
+	if (!nouveau_exa_pixmap_is_tiled(pspix)) {
 		linear     = 1;
 		src_pitch  = exaGetPixmapPitch(pspix);
 		src_offset = (y * src_pitch) + (x * cpp);
@@ -162,8 +161,7 @@ NVAccelUploadM2MF(PixmapPtr pdpix, int x, int y, int w, int h,
 	unsigned line_len = w * cpp;
 	unsigned dst_pitch = 0, dst_offset = 0, linear = 0;
 
-	if (pNv->Architecture < NV_ARCH_50 ||
-	    exaGetPixmapOffset(pdpix) < pNv->EXADriverPtr->offScreenBase) {
+	if (!nouveau_exa_pixmap_is_tiled(pdpix)) {
 		linear     = 1;
 		dst_pitch  = exaGetPixmapPitch(pdpix);
 		dst_offset = (y * dst_pitch) + (x * cpp);
@@ -275,6 +273,19 @@ nouveau_exa_wait_marker(ScreenPtr pScreen, int marker)
 	NVSync(xf86Screens[pScreen->myNum]);
 }
 
+bool
+nouveau_exa_pixmap_is_tiled(PixmapPtr ppix)
+{
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+
+	if (pNv->Architecture < NV_ARCH_50 ||
+		exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
+		return false;
+
+	return true;
+}
+
 static void *
 nouveau_exa_pixmap_map(PixmapPtr ppix)
 {
diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 9030d22..96c0aa3 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -117,7 +117,7 @@ NV50EXAAcquireSurface2D(PixmapPtr ppix, int is_src)
 	bo_flags  = NOUVEAU_BO_VRAM;
 	bo_flags |= is_src ? NOUVEAU_BO_RD : NOUVEAU_BO_WR;
 
-	if (exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase) {
+	if (!nouveau_exa_pixmap_is_tiled(ppix)) {
 		BEGIN_RING(chan, eng2d, mthd, 2);
 		OUT_RING  (chan, fmt);
 		OUT_RING  (chan, 1);
@@ -438,7 +438,7 @@ NV50EXARenderTarget(PixmapPtr ppix, PicturePtr ppict)
 	unsigned format;
 
 	/*XXX: Scanout buffer not tiled, someone needs to figure it out */
-	if (exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
+	if (!nouveau_exa_pixmap_is_tiled(ppix))
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	switch (ppict->format) {
@@ -511,7 +511,7 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 	const unsigned tcb_flags = NOUVEAU_BO_RDWR | NOUVEAU_BO_VRAM;
 
 	/*XXX: Scanout buffer not tiled, someone needs to figure it out */
-	if (exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
+	if (!nouveau_exa_pixmap_is_tiled(ppix))
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	BEGIN_RING(chan, tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index 0e7d2c4..1ddfeee 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -39,9 +39,6 @@
 static Bool
 nv50_xv_check_image_put(PixmapPtr ppix)
 {
-	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
-	NVPtr pNv = NVPTR(pScrn);
-
 	switch (ppix->drawable.depth) {
 	case 32:
 	case 24:
@@ -51,7 +48,7 @@ nv50_xv_check_image_put(PixmapPtr ppix)
 		return FALSE;
 	}
 
-	if (exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
+	if (!nouveau_exa_pixmap_is_tiled(ppix))
 		return FALSE;
 
 	return TRUE;
diff --git a/src/nv_proto.h b/src/nv_proto.h
index 3cb54ef..cc0d2cc 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -64,6 +64,7 @@ void  NVTakedownDma(ScrnInfoPtr pScrn);
 /* in nouveau_exa.c */
 Bool nouveau_exa_init(ScreenPtr pScreen);
 Bool nouveau_exa_pixmap_is_onscreen(PixmapPtr pPixmap);
+bool nouveau_exa_pixmap_is_tiled(PixmapPtr ppix);
 
 /* in nv_hw.c */
 void NVCalcStateExt(ScrnInfoPtr,struct _riva_hw_state *,int,int,int,int,int,int);
-- 
1.6.1.2

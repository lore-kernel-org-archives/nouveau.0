From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] nv50: implement wfb
Date: Sun,  8 Mar 2009 15:31:50 +0100
Message-ID: <1236522714-11553-1-git-send-email-madman2003@gmail.com>
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

- Only for sufficiently new xserver's and exa_driver_pixmaps.
---
 src/nouveau_exa.c |  217 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 src/nv_driver.c   |   51 +++++++++++--
 src/nv_proto.h    |    4 +
 src/nv_type.h     |   12 +++-
 4 files changed, 267 insertions(+), 17 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 93fc3c5..074a226 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -259,7 +259,11 @@ nouveau_exa_mark_sync(ScreenPtr pScreen)
 static void
 nouveau_exa_wait_marker(ScreenPtr pScreen, int marker)
 {
-	NVSync(xf86Screens[pScreen->myNum]);
+	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+
+	if (!pNv->exa_driver_pixmaps)
+		NVSync(xf86Screens[pScreen->myNum]);
 }
 
 static Bool
@@ -351,17 +355,16 @@ nouveau_exa_modify_pixmap_header(PixmapPtr ppix, int width, int height,
 
 	if (!nvpix->bo && nvpix->size) {
 		uint32_t cpp = ppix->drawable.bitsPerPixel >> 3;
-		/* At some point we should just keep 1bpp pixmaps in sysram */
 		uint32_t flags = NOUVEAU_BO_VRAM;
 		int ret;
 
 		if (pNv->Architecture >= NV_ARCH_50 && cpp) {
-			uint32_t aw = (width + 7) & ~7;
-			uint32_t ah = (height + 7) & ~7;
+			uint32_t ah = (height + 3) & ~3;
 
 			flags |= NOUVEAU_BO_TILED;
 
-			devkind = ((aw * cpp) + 63) & ~63;
+			/* This allignment is very important. */
+			devkind = (width * cpp + 63) & ~63;
 			nvpix->size = devkind * ah;
 		}
 
@@ -390,8 +393,11 @@ nouveau_exa_pixmap_is_tiled(PixmapPtr ppix)
 	NVPtr pNv = NVPTR(pScrn);
 
 	if (pNv->exa_driver_pixmaps) {
-		if (!nouveau_pixmap_bo(ppix)->tiled)
+		if (!nouveau_pixmap_bo(ppix))
+			return false;
+		if (nouveau_pixmap_bo(ppix)->tiled == 0)
 			return false;
+		return true;
 	} else
 	if (pNv->Architecture < NV_ARCH_50 ||
 	    exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
@@ -403,10 +409,12 @@ nouveau_exa_pixmap_is_tiled(PixmapPtr ppix)
 static void *
 nouveau_exa_pixmap_map(PixmapPtr ppix)
 {
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
 	unsigned delta = nouveau_pixmap_offset(ppix);
 
-	if (bo->tiled) {
+	if (!pNv->wfb_enabled && bo->tiled) {
 		struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
 
 		nvpix->linear = xcalloc(1, ppix->devKind * ppix->drawable.height);
@@ -426,9 +434,11 @@ nouveau_exa_pixmap_map(PixmapPtr ppix)
 static void
 nouveau_exa_pixmap_unmap(PixmapPtr ppix)
 {
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
 	struct nouveau_bo *bo = nouveau_pixmap_bo(ppix);
 
-	if (bo->tiled) {
+	if (!pNv->wfb_enabled && bo->tiled) {
 		struct nouveau_pixmap *nvpix = nouveau_pixmap(ppix);
 
 		NVAccelUploadM2MF(ppix, 0, 0, ppix->drawable.width,
@@ -674,3 +684,194 @@ nouveau_exa_init(ScreenPtr pScreen)
 	pNv->EXADriverPtr = exa;
 	return TRUE;
 }
+
+/* WFB functions. */
+
+static FbBits
+nouveau_exa_wfb_read_memory_linear(const void *src, int size)
+{
+	FbBits bits = 0;
+
+	memcpy(&bits, src, size);
+
+	return bits;
+}
+
+static void
+nouveau_exa_wfb_write_memory_linear(void *dst, FbBits value, int size)
+{
+	memcpy(dst, &value, size);
+}
+
+#define TILE_PITCH 32
+#define TILE_HEIGHT 4
+#define SUBTILE_PITCH 8
+#define SUBTILE_HEIGHT 2
+
+#define LINEAR_PITCH (pPixmap->devKind)
+#define NUM_TILES_WIDTH (LINEAR_PITCH/TILE_PITCH)
+
+static NVPtr last_wfb_pNv = NULL;
+
+/* Note, we can only expose one read and write function, the linear versions are for internal consumption. */
+static FbBits
+nouveau_exa_wfb_read_memory(const void *src, int size)
+{
+	int i, line_x, line_y, tile_x, tile_y, subtile_x, subtile_y;
+	unsigned long offset = (unsigned long) src, subpixel_offset;
+	PixmapPtr pPixmap = NULL;
+	FbBits bits = 0;
+	void *new_src;
+
+	if (!last_wfb_pNv)
+		return nouveau_exa_wfb_read_memory_linear(src, size);
+
+	/* Find the right pixmap. */
+	for (i = 0; i < 6; i++)
+		if (offset >= last_wfb_pNv->wfb_pixmaps[i].start && offset < last_wfb_pNv->wfb_pixmaps[i].end) {
+			pPixmap = last_wfb_pNv->wfb_pixmaps[i].ppix;
+			break;
+		}
+
+	if (!pPixmap || !last_wfb_pNv->wfb_pixmaps[i].tiled)
+		return nouveau_exa_wfb_read_memory_linear(src, size);
+
+	/* Now comes the decoding. */
+	offset -= (unsigned long) pPixmap->devPrivate.ptr;
+	/* Assuming dword alligned offsets. */
+	subpixel_offset = offset & ((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+
+	/* Determine the coordinate first. */
+	line_y = offset/LINEAR_PITCH;
+	line_x = offset - line_y * LINEAR_PITCH;
+	tile_x = line_x/TILE_PITCH;
+	tile_y = line_y/TILE_HEIGHT;
+	subtile_x = (line_x - tile_x * TILE_PITCH)/SUBTILE_PITCH;
+	subtile_y = (line_y - tile_y * TILE_HEIGHT)/SUBTILE_HEIGHT;
+
+	new_src = pPixmap->devPrivate.ptr +
+		(((tile_y * NUM_TILES_WIDTH) + tile_x) * (TILE_HEIGHT * TILE_PITCH)) +
+		(((subtile_y * (TILE_PITCH/SUBTILE_PITCH)) + subtile_x) * (SUBTILE_HEIGHT * SUBTILE_PITCH)) +
+		((line_y - tile_y * TILE_HEIGHT - subtile_y * SUBTILE_HEIGHT) * SUBTILE_PITCH) + 
+		(line_x - tile_x * TILE_PITCH - subtile_x * SUBTILE_PITCH) +
+		subpixel_offset;
+
+	memcpy(&bits, new_src, size);
+
+	return bits;
+}
+
+static void
+nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
+{
+	int i, line_x, line_y, tile_x, tile_y, subtile_x, subtile_y;
+	unsigned long offset = (unsigned long) dst, subpixel_offset;
+	PixmapPtr pPixmap = NULL;
+	void *new_dst;
+
+	if (!last_wfb_pNv) {
+		nouveau_exa_wfb_write_memory_linear(dst, value, size);
+		return;
+	}
+
+	/* Find the right pixmap. */
+	for (i = 0; i < 6; i++)
+		if (offset >= last_wfb_pNv->wfb_pixmaps[i].start && offset < last_wfb_pNv->wfb_pixmaps[i].end) {
+			pPixmap = last_wfb_pNv->wfb_pixmaps[i].ppix;
+			break;
+		}
+
+	if (!pPixmap || !last_wfb_pNv->wfb_pixmaps[i].tiled) {
+		nouveau_exa_wfb_write_memory_linear(dst, value, size);
+		return;
+	}
+
+	/* Now comes the decoding. */
+	offset -= (unsigned long) pPixmap->devPrivate.ptr;
+	/* Assuming dword alligned offsets. */
+	subpixel_offset = offset & ((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+	offset &= ~((pPixmap->drawable.bitsPerPixel >> 3) - 1);
+
+	/* Determine the coordinate first. */
+	line_y = offset/LINEAR_PITCH;
+	line_x = offset - line_y * LINEAR_PITCH;
+	tile_x = line_x/TILE_PITCH;
+	tile_y = line_y/TILE_HEIGHT;
+	subtile_x = (line_x - tile_x * TILE_PITCH)/SUBTILE_PITCH;
+	subtile_y = (line_y - tile_y * TILE_HEIGHT)/SUBTILE_HEIGHT;
+
+	new_dst = pPixmap->devPrivate.ptr +
+		(((tile_y * NUM_TILES_WIDTH) + tile_x) * (TILE_HEIGHT * TILE_PITCH)) +
+		(((subtile_y * (TILE_PITCH/SUBTILE_PITCH)) + subtile_x) * (SUBTILE_HEIGHT * SUBTILE_PITCH)) +
+		((line_y - tile_y * TILE_HEIGHT - subtile_y * SUBTILE_HEIGHT) * SUBTILE_PITCH) + 
+		(line_x - tile_x * TILE_PITCH - subtile_x * SUBTILE_PITCH) +
+		subpixel_offset;
+
+	memcpy(new_dst, &value, size);
+}
+
+void
+nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
+				WriteMemoryProcPtr *pWrite,
+				DrawablePtr pDraw)
+{
+	ScrnInfoPtr pScrn = xf86Screens[pDraw->pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+	PixmapPtr pPixmap;
+
+	if (!pRead || !pWrite)
+		return;
+
+	pPixmap = NVGetDrawablePixmap(pDraw);
+	if (!pPixmap)
+		return;
+
+	int i;
+	for (i = 0; i < 6; i++)
+		if (!pNv->wfb_pixmaps[i].used)
+			break;
+
+	if (i == 6) {
+		ErrorF("More than 10 wraps are setup, what the hell is going on?\n");
+		*pRead = NULL;
+		*pWrite = NULL;
+		return;
+	}
+
+	/* We will get a pointer, somewhere in the range of this pixmap. */
+	/* Based on linear representation ofcource. */
+	pNv->wfb_pixmaps[i].ppix = pPixmap;
+	pNv->wfb_pixmaps[i].start = (unsigned long) pPixmap->devPrivate.ptr;
+	pNv->wfb_pixmaps[i].end = pNv->wfb_pixmaps[i].start + exaGetPixmapPitch(pPixmap) * ((pPixmap->drawable.height + 3) & ~3);
+	pNv->wfb_pixmaps[i].used = true;
+	pNv->wfb_pixmaps[i].tiled = nouveau_exa_pixmap_is_tiled(pPixmap);
+
+	*pRead = nouveau_exa_wfb_read_memory;
+	*pWrite = nouveau_exa_wfb_write_memory;
+
+	last_wfb_pNv = pNv;
+}
+
+void
+nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw)
+{
+	ScrnInfoPtr pScrn = xf86Screens[pDraw->pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+	PixmapPtr pPixmap;
+	int i;
+
+	pPixmap = NVGetDrawablePixmap(pDraw);
+	if (!pPixmap)
+		return;
+
+	for (i = 0; i < 6; i++)
+		if (pNv->wfb_pixmaps[i].ppix == pPixmap) {
+			pNv->wfb_pixmaps[i].ppix = NULL;
+			pNv->wfb_pixmaps[i].start = 0;
+			pNv->wfb_pixmaps[i].end = 0;
+			pNv->wfb_pixmaps[i].used = false;
+			pNv->wfb_pixmaps[i].tiled = false;
+			break;
+		}
+}
diff --git a/src/nv_driver.c b/src/nv_driver.c
index d7e8025..4c6b691 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -157,6 +157,12 @@ static const char *fbSymbols[] = {
     NULL
 };
 
+static const char *wfbSymbols[] = {
+    "wfbPictureInit",
+    "wfbScreenInit",
+    NULL
+};
+
 static const char *exaSymbols[] = {
     "exaDriverInit",
     "exaOffscreenInit",
@@ -285,7 +291,7 @@ nouveauSetup(pointer module, pointer opts, int *errmaj, int *errmin)
 		 * Tell the loader about symbols from other modules that this module
 		 * might refer to.
 		 */
-		LoaderRefSymLists(vgahwSymbols, exaSymbols, fbSymbols,
+		LoaderRefSymLists(vgahwSymbols, exaSymbols, fbSymbols, wfbSymbols,
 				ramdacSymbols, shadowSymbols, drmSymbols, 
 				i2cSymbols, ddcSymbols, vbeSymbols,
 				int10Symbols, NULL);
@@ -1510,10 +1516,22 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 	 * section.
 	 */
 
-	if (xf86LoadSubModule(pScrn, "fb") == NULL)
-		NVPreInitFail("\n");
+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,6,99,0,0)
+	if (!pNv->NoAccel && pNv->exa_driver_pixmaps && pNv->Architecture == NV_ARCH_50) {
+		pNv->wfb_enabled = true;
+		if (xf86LoadSubModule(pScrn, "wfb") == NULL)
+			NVPreInitFail("\n");
 
-	xf86LoaderReqSymLists(fbSymbols, NULL);
+		xf86LoaderReqSymLists(wfbSymbols, NULL);
+	} else
+#endif
+	{
+		pNv->wfb_enabled = false;
+		if (xf86LoadSubModule(pScrn, "fb") == NULL)
+			NVPreInitFail("\n");
+
+		xf86LoaderReqSymLists(fbSymbols, NULL);
+	}
 
 	/* Load EXA if needed */
 	if (!pNv->NoAccel) {
@@ -2154,9 +2172,19 @@ NVScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
 	switch (pScrn->bitsPerPixel) {
 		case 16:
 		case 32:
-			ret = fbScreenInit(pScreen, FBStart, pScrn->virtualX, pScrn->virtualY,
-				pScrn->xDpi, pScrn->yDpi,
-				displayWidth, pScrn->bitsPerPixel);
+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,6,99,0,0)
+			if (pNv->wfb_enabled) {
+				ret = wfbScreenInit(pScreen, FBStart, pScrn->virtualX, pScrn->virtualY,
+					pScrn->xDpi, pScrn->yDpi,
+					displayWidth, pScrn->bitsPerPixel,
+					nouveau_exa_wfb_setup_wrap, nouveau_exa_wfb_finish_wrap);
+			} else
+#endif
+			{
+				ret = fbScreenInit(pScreen, FBStart, pScrn->virtualX, pScrn->virtualY,
+					pScrn->xDpi, pScrn->yDpi,
+					displayWidth, pScrn->bitsPerPixel);
+			}
 			break;
 		default:
 			xf86DrvMsg(scrnIndex, X_ERROR,
@@ -2181,7 +2209,14 @@ NVScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
 		}
 	}
 
-	fbPictureInit (pScreen, 0, 0);
+#if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,6,99,0,0)
+	if (pNv->wfb_enabled) {
+		wfbPictureInit(pScreen, 0, 0);
+	} else
+#endif
+	{
+		fbPictureInit(pScreen, 0, 0);
+	}
 
 	xf86SetBlackWhitePixels(pScreen);
 
diff --git a/src/nv_proto.h b/src/nv_proto.h
index 28605a8..5933ddd 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -65,6 +65,10 @@ void  NVTakedownDma(ScrnInfoPtr pScrn);
 Bool nouveau_exa_init(ScreenPtr pScreen);
 Bool nouveau_exa_pixmap_is_onscreen(PixmapPtr pPixmap);
 bool nouveau_exa_pixmap_is_tiled(PixmapPtr ppix);
+void nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
+				WriteMemoryProcPtr *pWrite,
+				DrawablePtr pDraw);
+void nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw);
 
 /* in nv_hw.c */
 void NVCalcStateExt(ScrnInfoPtr,struct _riva_hw_state *,int,int,int,int,int,int);
diff --git a/src/nv_type.h b/src/nv_type.h
index 78a7802..bec4851 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -303,7 +303,8 @@ typedef struct _NVRec {
 
     uint8_t cur_head;
     ExaDriverPtr	EXADriverPtr;
-    Bool		exa_driver_pixmaps;
+    Bool exa_driver_pixmaps;
+    bool wfb_enabled;
     xf86CursorInfoPtr   CursorInfoRec;
     ScreenBlockHandlerProcPtr BlockHandler;
     CloseScreenProcPtr  CloseScreen;
@@ -404,6 +405,15 @@ typedef struct _NVRec {
 	unsigned point_x, point_y;
 	unsigned width_in, width_out;
 	unsigned height_in, height_out;
+
+	/* Wfb related data. */
+	struct {
+		PixmapPtr ppix;
+		bool used;
+		bool tiled;
+		unsigned long start;
+		unsigned long end;
+	} wfb_pixmaps[6];
 } NVRec;
 
 #define NVPTR(p) ((NVPtr)((p)->driverPrivate))
-- 
1.6.2

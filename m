From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/5] nv50: wfb optimisation 3
Date: Sun,  8 Mar 2009 15:31:53 +0100
Message-ID: <1236522714-11553-4-git-send-email-madman2003@gmail.com>
References: <1236522714-11553-1-git-send-email-madman2003@gmail.com>
	<1236522714-11553-2-git-send-email-madman2003@gmail.com>
	<1236522714-11553-3-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1236522714-11553-3-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/nouveau_exa.c |   97 +++++++++++++++++++++++++++++-----------------------
 src/nv_driver.c   |    1 +
 src/nv_proto.h    |    1 +
 src/nv_type.h     |   11 ------
 4 files changed, 56 insertions(+), 54 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index c44e882..2d748e1 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -711,7 +711,16 @@ nouveau_exa_wfb_write_memory_linear(void *dst, FbBits value, int size)
 #define LINEAR_PITCH (pPixmap->devKind)
 #define NUM_TILES_WIDTH (LINEAR_PITCH/TILE_PITCH)
 
-static NVPtr last_wfb_pNv = NULL;
+/* Wfb related data. */
+static struct {
+	PixmapPtr ppix;
+	bool used;
+	bool tiled;
+	unsigned long start;
+	unsigned long end;
+	uint64_t multiply_factor;
+	uint8_t cpp;
+} wfb_pixmaps[6];
 
 /* Note, we can only expose one read and write function, the linear versions are for internal consumption. */
 static FbBits
@@ -725,28 +734,25 @@ nouveau_exa_wfb_read_memory(const void *src, int size)
 	FbBits bits = 0;
 	void *new_src;
 
-	if (!last_wfb_pNv)
-		return nouveau_exa_wfb_read_memory_linear(src, size);
-
 	/* Find the right pixmap. */
 	for (i = 0; i < 6; i++)
-		if (offset >= last_wfb_pNv->wfb_pixmaps[i].start && offset < last_wfb_pNv->wfb_pixmaps[i].end) {
-			pPixmap = last_wfb_pNv->wfb_pixmaps[i].ppix;
+		if (offset >= wfb_pixmaps[i].start && offset < wfb_pixmaps[i].end) {
+			pPixmap = wfb_pixmaps[i].ppix;
 			break;
 		}
 
-	if (!pPixmap || !last_wfb_pNv->wfb_pixmaps[i].tiled)
+	if (!pPixmap || !wfb_pixmaps[i].tiled)
 		return nouveau_exa_wfb_read_memory_linear(src, size);
 
 	/* Now comes the decoding. */
 	offset -= (unsigned long) pPixmap->devPrivate.ptr;
 	/* Assuming dword alligned offsets. */
-	subpixel_offset = offset & (last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
-	offset &= ~(last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
+	subpixel_offset = offset & (wfb_pixmaps[i].cpp - 1);
+	offset &= ~(wfb_pixmaps[i].cpp - 1);
 
 	/* Determine the coordinate first. */
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
-	line_y = (offset * last_wfb_pNv->wfb_pixmaps[i].multiply_factor) >> 32;
+	line_y = (offset * wfb_pixmaps[i].multiply_factor) >> 32;
 	line_x = offset - line_y * LINEAR_PITCH;
 	tile_x = line_x/TILE_PITCH;
 	tile_y = line_y/TILE_HEIGHT;
@@ -775,19 +781,14 @@ nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
 	PixmapPtr pPixmap = NULL;
 	void *new_dst;
 
-	if (!last_wfb_pNv) {
-		nouveau_exa_wfb_write_memory_linear(dst, value, size);
-		return;
-	}
-
 	/* Find the right pixmap. */
 	for (i = 0; i < 6; i++)
-		if (offset >= last_wfb_pNv->wfb_pixmaps[i].start && offset < last_wfb_pNv->wfb_pixmaps[i].end) {
-			pPixmap = last_wfb_pNv->wfb_pixmaps[i].ppix;
+		if (offset >= wfb_pixmaps[i].start && offset < wfb_pixmaps[i].end) {
+			pPixmap = wfb_pixmaps[i].ppix;
 			break;
 		}
 
-	if (!pPixmap || !last_wfb_pNv->wfb_pixmaps[i].tiled) {
+	if (!pPixmap || !wfb_pixmaps[i].tiled) {
 		nouveau_exa_wfb_write_memory_linear(dst, value, size);
 		return;
 	}
@@ -795,12 +796,12 @@ nouveau_exa_wfb_write_memory(void *dst, FbBits value, int size)
 	/* Now comes the decoding. */
 	offset -= (unsigned long) pPixmap->devPrivate.ptr;
 	/* Assuming dword alligned offsets. */
-	subpixel_offset = offset & (last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
-	offset &= ~(last_wfb_pNv->wfb_pixmaps[i].cpp - 1);
+	subpixel_offset = offset & (wfb_pixmaps[i].cpp - 1);
+	offset &= ~(wfb_pixmaps[i].cpp - 1);
 
 	/* Determine the coordinate first. */
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
-	line_y = (offset * last_wfb_pNv->wfb_pixmaps[i].multiply_factor) >> 32;
+	line_y = (offset * wfb_pixmaps[i].multiply_factor) >> 32;
 	line_x = offset - line_y * LINEAR_PITCH;
 	tile_x = line_x/TILE_PITCH;
 	tile_y = line_y/TILE_HEIGHT;
@@ -822,8 +823,6 @@ nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 				WriteMemoryProcPtr *pWrite,
 				DrawablePtr pDraw)
 {
-	ScrnInfoPtr pScrn = xf86Screens[pDraw->pScreen->myNum];
-	NVPtr pNv = NVPTR(pScrn);
 	PixmapPtr pPixmap;
 
 	if (!pRead || !pWrite)
@@ -835,7 +834,7 @@ nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 
 	int i;
 	for (i = 0; i < 6; i++)
-		if (!pNv->wfb_pixmaps[i].used)
+		if (!wfb_pixmaps[i].used)
 			break;
 
 	if (i == 6) {
@@ -847,26 +846,22 @@ nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 
 	/* We will get a pointer, somewhere in the range of this pixmap. */
 	/* Based on linear representation ofcource. */
-	pNv->wfb_pixmaps[i].ppix = pPixmap;
-	pNv->wfb_pixmaps[i].start = (unsigned long) pPixmap->devPrivate.ptr;
-	pNv->wfb_pixmaps[i].end = pNv->wfb_pixmaps[i].start + exaGetPixmapPitch(pPixmap) * ((pPixmap->drawable.height + 3) & ~3);
-	pNv->wfb_pixmaps[i].used = true;
-	pNv->wfb_pixmaps[i].tiled = nouveau_exa_pixmap_is_tiled(pPixmap);
+	wfb_pixmaps[i].ppix = pPixmap;
+	wfb_pixmaps[i].start = (unsigned long) pPixmap->devPrivate.ptr;
+	wfb_pixmaps[i].end = wfb_pixmaps[i].start + exaGetPixmapPitch(pPixmap) * ((pPixmap->drawable.height + 3) & ~3);
+	wfb_pixmaps[i].used = true;
+	wfb_pixmaps[i].tiled = nouveau_exa_pixmap_is_tiled(pPixmap);
 	/* Division is too expensive for large numbers, so we precalculate a multiplication factor. */
-	pNv->wfb_pixmaps[i].multiply_factor = (0xFFFFFFFF/exaGetPixmapPitch(pPixmap)) + 1;
-	pNv->wfb_pixmaps[i].cpp = (pPixmap->drawable.bitsPerPixel >> 3);
+	wfb_pixmaps[i].multiply_factor = (0xFFFFFFFF/exaGetPixmapPitch(pPixmap)) + 1;
+	wfb_pixmaps[i].cpp = (pPixmap->drawable.bitsPerPixel >> 3);
 
 	*pRead = nouveau_exa_wfb_read_memory;
 	*pWrite = nouveau_exa_wfb_write_memory;
-
-	last_wfb_pNv = pNv;
 }
 
 void
 nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw)
 {
-	ScrnInfoPtr pScrn = xf86Screens[pDraw->pScreen->myNum];
-	NVPtr pNv = NVPTR(pScrn);
 	PixmapPtr pPixmap;
 	int i;
 
@@ -875,14 +870,30 @@ nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw)
 		return;
 
 	for (i = 0; i < 6; i++)
-		if (pNv->wfb_pixmaps[i].ppix == pPixmap) {
-			pNv->wfb_pixmaps[i].ppix = NULL;
-			pNv->wfb_pixmaps[i].start = 0;
-			pNv->wfb_pixmaps[i].end = 0;
-			pNv->wfb_pixmaps[i].used = false;
-			pNv->wfb_pixmaps[i].tiled = false;
-			pNv->wfb_pixmaps[i].multiply_factor = 0;
-			pNv->wfb_pixmaps[i].cpp = 0;
+		if (wfb_pixmaps[i].ppix == pPixmap) {
+			wfb_pixmaps[i].ppix = NULL;
+			wfb_pixmaps[i].start = 0;
+			wfb_pixmaps[i].end = 0;
+			wfb_pixmaps[i].used = false;
+			wfb_pixmaps[i].tiled = false;
+			wfb_pixmaps[i].multiply_factor = 0;
+			wfb_pixmaps[i].cpp = 0;
 			break;
 		}
 }
+
+void
+nouveau_exa_wfb_init()
+{
+	int i;
+
+	for (i = 0; i < 6; i++) {
+		wfb_pixmaps[i].ppix = NULL;
+		wfb_pixmaps[i].start = 0;
+		wfb_pixmaps[i].end = 0;
+		wfb_pixmaps[i].used = false;
+		wfb_pixmaps[i].tiled = false;
+		wfb_pixmaps[i].multiply_factor = 0;
+		wfb_pixmaps[i].cpp = 0;
+	}
+}
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 4c6b691..d7cdbab 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1519,6 +1519,7 @@ NVPreInit(ScrnInfoPtr pScrn, int flags)
 #if XORG_VERSION_CURRENT >= XORG_VERSION_NUMERIC(1,6,99,0,0)
 	if (!pNv->NoAccel && pNv->exa_driver_pixmaps && pNv->Architecture == NV_ARCH_50) {
 		pNv->wfb_enabled = true;
+		nouveau_exa_wfb_init();
 		if (xf86LoadSubModule(pScrn, "wfb") == NULL)
 			NVPreInitFail("\n");
 
diff --git a/src/nv_proto.h b/src/nv_proto.h
index 5933ddd..472634c 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -69,6 +69,7 @@ void nouveau_exa_wfb_setup_wrap(ReadMemoryProcPtr *pRead,
 				WriteMemoryProcPtr *pWrite,
 				DrawablePtr pDraw);
 void nouveau_exa_wfb_finish_wrap(DrawablePtr pDraw);
+void nouveau_exa_wfb_init();
 
 /* in nv_hw.c */
 void NVCalcStateExt(ScrnInfoPtr,struct _riva_hw_state *,int,int,int,int,int,int);
diff --git a/src/nv_type.h b/src/nv_type.h
index 78ec614..0cf042a 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -405,17 +405,6 @@ typedef struct _NVRec {
 	unsigned point_x, point_y;
 	unsigned width_in, width_out;
 	unsigned height_in, height_out;
-
-	/* Wfb related data. */
-	struct {
-		PixmapPtr ppix;
-		bool used;
-		bool tiled;
-		unsigned long start;
-		unsigned long end;
-		uint64_t multiply_factor;
-		uint8_t cpp;
-	} wfb_pixmaps[6];
 } NVRec;
 
 #define NVPTR(p) ((NVPtr)((p)->driverPrivate))
-- 
1.6.2

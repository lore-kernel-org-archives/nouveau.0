From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] nv50: initial bits for "shadowfb"
Date: Thu, 12 Feb 2009 23:56:31 +0100
Message-ID: <1234479392-1984-2-git-send-email-madman2003@gmail.com>
References: <1234479392-1984-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1234479392-1984-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- Fallbacks on the frontbuffer still need to be handled.
---
 src/Makefile.am          |    1 +
 src/nouveau_exa.c        |    7 +--
 src/nv50_randr.c         |    2 +-
 src/nv50_shadow_damage.c |  164 ++++++++++++++++++++++++++++++++++++++++++++++
 src/nv_driver.c          |   46 ++++++++++++--
 src/nv_proto.h           |    3 +
 src/nv_type.h            |    3 +
 7 files changed, 214 insertions(+), 12 deletions(-)
 create mode 100644 src/nv50_shadow_damage.c

diff --git a/src/Makefile.am b/src/Makefile.am
index f2ba849..4294796 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -79,6 +79,7 @@ nouveau_drv_la_SOURCES = \
 			 nv50_xv.c \
 			 nv50_texture.h \
 			 nv50reg.h \
+			 nv50_shadow_damage.c \
 			 nouveau_crtc.h \
 			 nouveau_output.h \
 			 nouveau_connector.h \
diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index 3babfd7..c4cafb0 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -279,8 +279,7 @@ nouveau_exa_pixmap_is_tiled(PixmapPtr ppix)
 	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
 	NVPtr pNv = NVPTR(pScrn);
 
-	if (pNv->Architecture < NV_ARCH_50 ||
-		exaGetPixmapOffset(ppix) < pNv->EXADriverPtr->offScreenBase)
+	if (pNv->Architecture < NV_ARCH_50)
 		return false;
 
 	return true;
@@ -437,10 +436,6 @@ nouveau_exa_init(ScreenPtr pScreen)
 	exa->memorySize = pNv->FB->size; 
 
 	if (pNv->Architecture >= NV_ARCH_50) {
-		nouveau_bo_tile(pNv->FB, NOUVEAU_BO_VRAM | NOUVEAU_BO_TILED,
-				exa->offScreenBase,
-				exa->memorySize - exa->offScreenBase);
-
 		exa->maxX = 8192;
 		exa->maxY = 8192;
 	} else
diff --git a/src/nv50_randr.c b/src/nv50_randr.c
index f1cca0c..fcf5d7f 100644
--- a/src/nv50_randr.c
+++ b/src/nv50_randr.c
@@ -99,7 +99,7 @@ nv50_crtc_mode_set(xf86CrtcPtr crtc, DisplayModePtr mode, DisplayModePtr adjuste
 		nv_crtc->crtc->SetFB(nv_crtc->crtc, nv_crtc->shadow);
 		nv_crtc->crtc->SetFBOffset(nv_crtc->crtc, 0, 0);
 	} else {
-		nv_crtc->crtc->SetFB(nv_crtc->crtc, pNv->FB);
+		nv_crtc->crtc->SetFB(nv_crtc->crtc, pNv->scanout);
 		nv_crtc->crtc->SetFBOffset(nv_crtc->crtc, x, y);
 	}
 	nv_crtc->crtc->ModeSet(nv_crtc->crtc, mode);
diff --git a/src/nv50_shadow_damage.c b/src/nv50_shadow_damage.c
new file mode 100644
index 0000000..9d1a8cb
--- /dev/null
+++ b/src/nv50_shadow_damage.c
@@ -0,0 +1,164 @@
+/*
+ * Copyright 2009 Maarten Maathuis
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
+ */
+
+/**
+ * This file serves to process all damage to the frontbuffer pixmap.
+ * This is needed until we can/have:
+ * - Tiled frontbufffer support.
+ * - Working wfb support.
+ * - Widespread wfb exa support.
+ */
+
+#include "nv_include.h"
+
+/* When driver allocated pixmaps are used we can easily fold this back into exa code. */
+static void nv50_shadow_damage_blit(PixmapPtr ppix, RegionPtr pRegion)
+{
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+	struct nouveau_channel *chan = pNv->chan;
+	struct nouveau_grobj *eng2d = pNv->Nv2D;
+	uint32_t fmt;
+	BoxPtr pbox;
+	int nbox;
+
+	pbox = REGION_RECTS(pRegion);
+	nbox = REGION_NUM_RECTS(pRegion);
+	if (!nbox)
+		return;
+
+	/* flush_notify is not needed, we check for all the ring space in advance. */
+	WAIT_RING (chan, 26 + nbox * 13);
+
+	switch (ppix->drawable.depth) {
+		case 8 : fmt = NV50_2D_SRC_FORMAT_8BPP; break;
+		case 15: fmt = NV50_2D_SRC_FORMAT_15BPP; break;
+		case 16: fmt = NV50_2D_SRC_FORMAT_16BPP; break;
+		case 24: fmt = NV50_2D_SRC_FORMAT_24BPP; break;
+		case 32: fmt = NV50_2D_SRC_FORMAT_32BPP; break;
+		default:
+			 xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+				    "Unknown surface format for bpp=%d\n",
+				    ppix->drawable.depth);
+			 return;
+	}
+
+	/* tiled source */
+	BEGIN_RING(chan, eng2d, NV50_2D_SRC_FORMAT, 5);
+	OUT_RING  (chan, fmt);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 1);
+	OUT_RING  (chan, 0);
+
+	BEGIN_RING(chan, eng2d, NV50_2D_SRC_WIDTH, 4);
+	OUT_RING  (chan, ppix->drawable.width);
+	OUT_RING  (chan, ppix->drawable.height);
+	OUT_PIXMAPh(chan, ppix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_PIXMAPl(chan, ppix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+
+	/* untiled destination */
+	BEGIN_RING(chan, eng2d, NV50_2D_DST_FORMAT, 2);
+	OUT_RING  (chan, fmt);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, eng2d, NV50_2D_DST_PITCH, 5);
+	OUT_RING  (chan, NOUVEAU_ALIGN(pScrn->virtualX, 64) *
+			 (pScrn->bitsPerPixel >> 3));
+	OUT_RING  (chan, ppix->drawable.width);
+	OUT_RING  (chan, ppix->drawable.height);
+	OUT_RELOCh(chan, pNv->scanout, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOCl(chan, pNv->scanout, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+
+	BEGIN_RING(chan, eng2d, NV50_2D_CLIP_X, 4);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, ppix->drawable.width);
+	OUT_RING  (chan, ppix->drawable.height);
+	BEGIN_RING(chan, eng2d, NV50_2D_OPERATION, 1);
+	OUT_RING  (chan, NV50_2D_OPERATION_SRCCOPY);
+
+	while (nbox--) {
+		BEGIN_RING(chan, eng2d, NV50_2D_BLIT_DST_X, 12);
+		OUT_RING  (chan, pbox->x1);
+		OUT_RING  (chan, pbox->y1);
+		OUT_RING  (chan, pbox->x2 - pbox->x1);
+		OUT_RING  (chan, pbox->y2 - pbox->y1);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, 1);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, 1);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, pbox->x1);
+		OUT_RING  (chan, 0);
+		OUT_RING  (chan, pbox->y1);
+
+		pbox++;
+	}
+}
+
+static void nv50_shadow_damage_report(DamagePtr pDamage, RegionPtr pRegion, void *closure)
+{
+	PixmapPtr ppix = closure;
+
+	nv50_shadow_damage_blit(ppix, pRegion);
+}
+
+static void nv50_shadow_damage_destroy(DamagePtr pDamage, void *closure)
+{
+	PixmapPtr ppix = closure;
+	ScrnInfoPtr pScrn = xf86Screens[ppix->drawable.pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+
+	pNv->screen_damage = NULL;
+}
+
+bool nv50_shadow_damage_create(ScrnInfoPtr pScrn)
+{
+	NVPtr pNv = NVPTR(pScrn);
+	ScreenPtr pScreen = pScrn->pScreen;
+	PixmapPtr ppix = NULL;
+
+	if (pNv->Architecture < NV_ARCH_50)
+		return false;
+
+	ppix = pScreen->GetScreenPixmap(pScreen);
+	if (!ppix) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			"No screen pixmap.\n");
+		return false;
+	}
+
+	pNv->screen_damage = DamageCreate(nv50_shadow_damage_report, nv50_shadow_damage_destroy, 
+		DamageReportRawRegion, true, pScreen, ppix);
+	if (!pNv->screen_damage) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			"No screen damage\n");
+		return false;
+	}
+
+	/* We want the notification after submission. */
+	DamageSetReportAfterOp(pNv->screen_damage, true);
+
+	DamageRegister(&ppix->drawable, pNv->screen_damage);
+
+	return true;
+}
diff --git a/src/nv_driver.c b/src/nv_driver.c
index 3d6e9ea..c302412 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -1580,6 +1580,8 @@ NVMapMemSW(ScrnInfoPtr pScrn)
 		return FALSE;
 	pNv->GART = NULL;
 
+	nouveau_bo_ref(pNv->FB, &pNv->scanout);
+
 	ret = nouveau_bo_fake(&dev, Cursor0Offset,
 			      NOUVEAU_BO_VRAM | NOUVEAU_BO_PIN,
 			      64*1024, pNv->VRAMMap + Cursor0Offset,
@@ -1625,6 +1627,7 @@ NVMapMem(ScrnInfoPtr pScrn)
 	NVPtr pNv = NVPTR(pScrn);
 	int gart_scratch_size;
 	uint64_t res;
+	uint32_t flags;
 
 	if (pNv->NoAccel)
 		return NVMapMemSW(pScrn);
@@ -1636,15 +1639,39 @@ NVMapMem(ScrnInfoPtr pScrn)
 	nouveau_device_get_param(pNv->dev, NOUVEAU_GETPARAM_AGP_SIZE, &res);
 	pNv->AGPSize=res;
 
-	if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_PIN,
-		0, pNv->VRAMPhysicalSize / 2, &pNv->FB)) {
-			xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "Failed to allocate memory for framebuffer!\n");
-			return FALSE;
-	}
+	flags = NOUVEAU_BO_VRAM | NOUVEAU_BO_PIN;
+	if (pNv->Architecture >= NV_ARCH_50)
+		flags |= NOUVEAU_BO_TILED;
+
+	if (nouveau_bo_new(pNv->dev, flags, 0, pNv->VRAMPhysicalSize / 2,
+			   &pNv->FB)) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			   "Failed to allocate memory for framebuffer!\n");
+		return FALSE;
+ 	}
+
 	xf86DrvMsg(pScrn->scrnIndex, X_INFO,
 		"Allocated %dMiB VRAM for framebuffer + offscreen pixmaps, at offset 0x%X\n",
 		(uint32_t)(pNv->FB->size >> 20), (uint32_t) pNv->FB->offset);
 
+	/* Allocate linear scanout. */
+	if (pNv->Architecture >= NV_ARCH_50) {
+		unsigned scanout_size;
+
+		scanout_size = NOUVEAU_ALIGN(pScrn->virtualX, 64);
+		scanout_size *= (pScrn->bitsPerPixel >> 3);
+		scanout_size *= pScrn->virtualY;
+
+		if (nouveau_bo_new(pNv->dev, NOUVEAU_BO_VRAM | NOUVEAU_BO_PIN,
+				   0, scanout_size, &pNv->scanout)) {
+			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+				   "Failed to allocate scanout buffer\n");
+			return FALSE;
+		}
+	} else {
+		nouveau_bo_ref(pNv->FB, &pNv->scanout);
+	}
+
 	if (pNv->AGPSize) {
 		xf86DrvMsg(pScrn->scrnIndex, X_INFO,
 			   "AGPGART: %dMiB available\n",
@@ -1743,6 +1770,7 @@ NVUnmapMem(ScrnInfoPtr pScrn)
 	}
 
 	nouveau_bo_ref(NULL, &pNv->FB);
+	nouveau_bo_ref(NULL, &pNv->scanout);
 	nouveau_bo_ref(NULL, &pNv->GART);
 	nouveau_bo_ref(NULL, &pNv->Cursor);
 	nouveau_bo_ref(NULL, &pNv->Cursor2);
@@ -2268,6 +2296,14 @@ NVSaveScreen(ScreenPtr pScreen, int mode)
 	bool on = xf86IsUnblank(mode);
 	int i;
 
+	/* This might seem strange, but we need an entry point after CreateScreenResources.
+	 * This happens to one of the few, if not the only place.
+	 * When we move to driver allocated pixmaps, we can move this.
+	 */
+	if (mode == SCREEN_SAVER_FORCER && pNv->Architecture == NV_ARCH_50 && 
+		!pNv->screen_damage && !nv50_shadow_damage_create(pScrn))
+		return FALSE;
+
 	if (!pNv->randr12_enable)
 		return vgaHWSaveScreen(pScreen, mode);
 
diff --git a/src/nv_proto.h b/src/nv_proto.h
index cc0d2cc..f39c294 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -276,6 +276,9 @@ void nv50_xv_video_stop(ScrnInfoPtr, pointer, Bool);
 int nv50_xv_port_attribute_set(ScrnInfoPtr, Atom, INT32, pointer);
 int nv50_xv_port_attribute_get(ScrnInfoPtr, Atom, INT32 *, pointer);
 
+/* nv50_shadow_damage.c */
+bool nv50_shadow_damage_create(ScrnInfoPtr pScrn);
+
 /* To support EXA 2.0, 2.1 has this in the header */
 #ifndef exaMoveInPixmap
 extern void exaMoveInPixmap(PixmapPtr pPixmap);
diff --git a/src/nv_type.h b/src/nv_type.h
index 6da8561..cd9a45c 100644
--- a/src/nv_type.h
+++ b/src/nv_type.h
@@ -248,12 +248,15 @@ typedef struct _NVRec {
 
     /* Various pinned memory regions */
     struct nouveau_bo * FB;
+    struct nouveau_bo * scanout;
     //struct nouveau_bo * FB_old; /* for KMS */
     struct nouveau_bo * shadow[2]; /* for easy acces by exa */
     struct nouveau_bo * Cursor;
     struct nouveau_bo * Cursor2;
     struct nouveau_bo * GART;
 
+    DamagePtr screen_damage; /* for NV50+ */
+
     struct nouveau_bios	VBIOS;
     Bool                NoAccel;
     Bool                HWCursor;
-- 
1.6.1.2

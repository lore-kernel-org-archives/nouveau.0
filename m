From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] nv50: support frontbuffer fallbacks
Date: Thu, 12 Feb 2009 23:56:32 +0100
Message-ID: <1234479392-1984-3-git-send-email-madman2003@gmail.com>
References: <1234479392-1984-1-git-send-email-madman2003@gmail.com>
	<1234479392-1984-2-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1234479392-1984-2-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
 src/nouveau_exa.c        |   36 +++++++++++++++
 src/nv50_shadow_damage.c |  108 ++++++++++++++++++++++++++++++++++++++++++++++
 src/nv_proto.h           |    1 +
 3 files changed, 145 insertions(+), 0 deletions(-)

diff --git a/src/nouveau_exa.c b/src/nouveau_exa.c
index c4cafb0..b6ae8ca 100644
--- a/src/nouveau_exa.c
+++ b/src/nouveau_exa.c
@@ -308,6 +308,36 @@ nouveau_exa_pixmap_unmap(PixmapPtr ppix)
 }
 
 static Bool
+nouveau_exa_prepare_access(PixmapPtr ppix, int index)
+{
+	ScreenPtr pScreen = ppix->drawable.pScreen;
+	NVPtr pNv = NVPTR(xf86Screens[pScreen->myNum]);
+
+	if (ppix == pScreen->GetScreenPixmap(pScreen)) {
+		nouveau_bo_map(pNv->scanout, NOUVEAU_BO_RDWR);
+		ppix->devPrivate.ptr = pNv->scanout->map;
+	} else if (nouveau_exa_pixmap_is_tiled(ppix)) {
+		return false; /* force migration */
+	}
+
+	return true;
+}
+
+static void
+nouveau_exa_finish_access(PixmapPtr ppix, int index)
+{
+	ScreenPtr pScreen = ppix->drawable.pScreen;
+	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
+	NVPtr pNv = NVPTR(pScrn);
+
+	if (ppix == pScreen->GetScreenPixmap(pScreen)) {
+		ppix->devPrivate.ptr = NULL;
+		nouveau_bo_unmap(pNv->scanout);
+		nv50_shadow_damage_frontbuffer_fallback(pScrn);
+	}
+}
+
+static Bool
 nouveau_exa_download_from_screen(PixmapPtr pspix, int x, int y, int w, int h,
 				 char *dst, int dst_pitch)
 {
@@ -447,6 +477,12 @@ nouveau_exa_init(ScreenPtr pScreen)
 		exa->maxY = 2048;
 	}
 
+	/* Needed for frontbuffer fallbacks (to ensure it accesses the linear fb). */
+	if (pNv->Architecture >= NV_ARCH_50) {
+		exa->PrepareAccess = nouveau_exa_prepare_access;
+		exa->FinishAccess = nouveau_exa_finish_access;
+	}
+
 	exa->MarkSync = nouveau_exa_mark_sync;
 	exa->WaitMarker = nouveau_exa_wait_marker;
 
diff --git a/src/nv50_shadow_damage.c b/src/nv50_shadow_damage.c
index 9d1a8cb..a48cfb2 100644
--- a/src/nv50_shadow_damage.c
+++ b/src/nv50_shadow_damage.c
@@ -29,6 +29,7 @@
  */
 
 #include "nv_include.h"
+#include "damagestr.h"
 
 /* When driver allocated pixmaps are used we can easily fold this back into exa code. */
 static void nv50_shadow_damage_blit(PixmapPtr ppix, RegionPtr pRegion)
@@ -115,6 +116,91 @@ static void nv50_shadow_damage_blit(PixmapPtr ppix, RegionPtr pRegion)
 	}
 }
 
+/* For frontbuffer fallbacks. */
+static void nv50_shadow_damage_blit_back(PixmapPtr ppix, RegionPtr pRegion)
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
+	/* untiled source */
+	BEGIN_RING(chan, eng2d, NV50_2D_SRC_FORMAT, 2);
+	OUT_RING  (chan, fmt);
+	OUT_RING  (chan, 1);
+	BEGIN_RING(chan, eng2d, NV50_2D_SRC_PITCH, 5);
+	OUT_RING  (chan, NOUVEAU_ALIGN(pScrn->virtualX, 64) *
+			 (pScrn->bitsPerPixel >> 3));
+	OUT_RING  (chan, ppix->drawable.width);
+	OUT_RING  (chan, ppix->drawable.height);
+	OUT_RELOCh(chan, pNv->scanout, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_RELOCl(chan, pNv->scanout, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+
+	/* tiled destination */
+	BEGIN_RING(chan, eng2d, NV50_2D_DST_FORMAT, 5);
+	OUT_RING  (chan, fmt);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 0);
+	OUT_RING  (chan, 1);
+	OUT_RING  (chan, 0);
+
+	BEGIN_RING(chan, eng2d, NV50_2D_DST_WIDTH, 4);
+	OUT_RING  (chan, ppix->drawable.width);
+	OUT_RING  (chan, ppix->drawable.height);
+	OUT_PIXMAPh(chan, ppix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
+	OUT_PIXMAPl(chan, ppix, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
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
 static void nv50_shadow_damage_report(DamagePtr pDamage, RegionPtr pRegion, void *closure)
 {
 	PixmapPtr ppix = closure;
@@ -122,6 +208,28 @@ static void nv50_shadow_damage_report(DamagePtr pDamage, RegionPtr pRegion, void
 	nv50_shadow_damage_blit(ppix, pRegion);
 }
 
+void nv50_shadow_damage_frontbuffer_fallback(ScrnInfoPtr pScrn)
+{
+	NVPtr pNv = NVPTR(pScrn);
+	ScreenPtr pScreen = pScrn->pScreen;
+	PixmapPtr ppix = NULL;
+	DamagePtr pDamage = pNv->screen_damage;
+
+	if (pNv->Architecture < NV_ARCH_50)
+		return;
+
+	ppix = pScreen->GetScreenPixmap(pScreen);
+	if (!ppix) {
+		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+			"No screen pixmap.\n");
+		return;
+	}
+
+	/* Pending damage reflects the rendering currently being done. */
+	/* When exa calls finish access, damage hasn't flushed it yet. */
+	nv50_shadow_damage_blit_back(ppix, &pDamage->pendingDamage);
+}
+
 static void nv50_shadow_damage_destroy(DamagePtr pDamage, void *closure)
 {
 	PixmapPtr ppix = closure;
diff --git a/src/nv_proto.h b/src/nv_proto.h
index f39c294..f73770d 100644
--- a/src/nv_proto.h
+++ b/src/nv_proto.h
@@ -278,6 +278,7 @@ int nv50_xv_port_attribute_get(ScrnInfoPtr, Atom, INT32 *, pointer);
 
 /* nv50_shadow_damage.c */
 bool nv50_shadow_damage_create(ScrnInfoPtr pScrn);
+void nv50_shadow_damage_frontbuffer_fallback(ScrnInfoPtr pScrn);
 
 /* To support EXA 2.0, 2.1 has this in the header */
 #ifndef exaMoveInPixmap
-- 
1.6.1.2

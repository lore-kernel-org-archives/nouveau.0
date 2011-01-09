From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [ddx PATCH] convert OUT_RELOCh + OUT_RELOCl to OUT_RELOChl
Date: Sun,  9 Jan 2011 18:31:01 +0100
Message-ID: <1294594263-1862-4-git-send-email-marcin.slusarz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

---
 src/nv50_accel.c |   32 ++++++++------------------------
 src/nv50_exa.c   |   24 ++++++++----------------
 src/nv50_xv.c    |   25 ++++++++-----------------
 3 files changed, 24 insertions(+), 57 deletions(-)

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index d6c7528..3ba2898 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -148,9 +148,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x54);
 
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PVP_OFFSET,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PVP_OFFSET,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PVP_OFFSET,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -190,9 +188,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0);
 
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch,
-		       PFP_OFFSET + PFP_S, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch,
 		       PFP_OFFSET + PFP_S, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -208,9 +204,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0xf6400001);
 	OUT_RING  (chan, 0x0000c785);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch,
-		       PFP_OFFSET + PFP_C, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch,
 		       PFP_OFFSET + PFP_C, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -236,9 +230,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0xc004060d);
 	OUT_RING  (chan, 0x00000781);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch,
-		       PFP_OFFSET + PFP_CCA, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch,
 		       PFP_OFFSET + PFP_CCA, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -264,9 +256,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0xc007060d);
 	OUT_RING  (chan, 0x00000781);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_CCASA,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_CCASA,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_CCASA,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -292,9 +282,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0xc004060d);
 	OUT_RING  (chan, 0x00000781);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_S_A8,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_S_A8,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_S_A8,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -314,9 +302,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x1000000d);
 	OUT_RING  (chan, 0x0403c781);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_C_A8,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_C_A8,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_C_A8,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
@@ -342,9 +328,7 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x10000609);
 	OUT_RING  (chan, 0x0403c781);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_NV12,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_NV12,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET + PFP_NV12,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index e8ff5aa..59d7db8 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -137,8 +137,7 @@ NV50EXAAcquireSurface2D(PixmapPtr ppix, int is_src)
 	BEGIN_RING(chan, eng2d, mthd + 0x18, 4);
 	OUT_RING  (chan, ppix->drawable.width);
 	OUT_RING  (chan, ppix->drawable.height);
-	if (OUT_RELOCh(chan, bo, 0, bo_flags) ||
-	    OUT_RELOCl(chan, bo, 0, bo_flags))
+	if (OUT_RELOChl(chan, bo, 0, bo_flags))
 		return FALSE;
 
 	if (is_src == 0)
@@ -494,8 +493,7 @@ NV50EXARenderTarget(PixmapPtr ppix, PicturePtr ppict)
 	}
 
 	BEGIN_RING(chan, tesla, NV50TCL_RT_ADDRESS_HIGH(0), 5);
-	if (OUT_RELOCh(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR))
+	if (OUT_RELOChl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR))
 		return FALSE;
 	OUT_RING  (chan, format);
 	OUT_RING  (chan, bo->tile_mode << 4);
@@ -586,13 +584,11 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 		NOUVEAU_FALLBACK("pixmap is scanout buffer\n");
 
 	BEGIN_RING(chan, tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags))
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags))
 		return FALSE;
 	OUT_RING  (chan, 0x00000800);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags))
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags))
 		return FALSE;
 	OUT_RING  (chan, (CB_TIC << NV50TCL_CB_DEF_SET_BUFFER_SHIFT) | 0x4000);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
@@ -680,13 +676,11 @@ NV50EXATexture(PixmapPtr ppix, PicturePtr ppict, unsigned unit)
 	OUT_RING  (chan, 0x00000000);
 
 	BEGIN_RING(chan, tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags))
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags))
 		return FALSE;
 	OUT_RING  (chan, 0x00000000);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags))
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags))
 		return FALSE;
 	OUT_RING  (chan, (CB_TSC << NV50TCL_CB_DEF_SET_BUFFER_SHIFT) | 0x4000);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_ADDR, 1);
@@ -849,15 +843,13 @@ NV50EXAPrepareComposite(int op,
 		     PICT_FORMAT_RGB(pmpict->format));
 
 	BEGIN_RING(chan, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
 
 	BEGIN_RING(chan, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index 1538cdc..be7d712 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -76,8 +76,7 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 		return FALSE;
 
 	BEGIN_RING(chan, tesla, NV50TCL_RT_ADDRESS_HIGH(0), 5);
-	if (OUT_RELOCh(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
+	if (OUT_RELOChl(chan, bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
@@ -99,15 +98,13 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 	OUT_RING  (chan, 0);
 
 	BEGIN_RING(chan, tesla, NV50TCL_TIC_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
 	OUT_RING  (chan, 0x00000800);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TIC_OFFSET, tcb_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
@@ -200,15 +197,13 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 	}
 
 	BEGIN_RING(chan, tesla, NV50TCL_TSC_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
 	OUT_RING  (chan, 0x00000000);
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, TSC_OFFSET, tcb_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
@@ -242,14 +237,12 @@ nv50_xv_state_emit(PixmapPtr ppix, int id, struct nouveau_bo *src,
 	OUT_RING  (chan, 0x00000000);
 
 	BEGIN_RING(chan, tesla, NV50TCL_VP_ADDRESS_HIGH, 2);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PVP_OFFSET, shd_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
 	BEGIN_RING(chan, tesla, NV50TCL_FP_ADDRESS_HIGH, 2);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags)) {
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_OFFSET, shd_flags)) {
 		MARK_UNDO(chan);
 		return FALSE;
 	}
@@ -403,9 +396,7 @@ nv50_xv_csc_update(ScrnInfoPtr pScrn, NVPortPrivPtr pPriv)
 		return;
 
 	BEGIN_RING(chan, tesla, NV50TCL_CB_DEF_ADDRESS_HIGH, 3);
-	if (OUT_RELOCh(chan, pNv->tesla_scratch, PFP_DATA,
-		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR) ||
-	    OUT_RELOCl(chan, pNv->tesla_scratch, PFP_DATA,
+	if (OUT_RELOChl(chan, pNv->tesla_scratch, PFP_DATA,
 		       NOUVEAU_BO_VRAM | NOUVEAU_BO_WR)) {
 		MARK_UNDO(chan);
 		return;
-- 
1.7.3.3

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [DDX PATCH 2/5] update after nouveau_class.h update
Date: Fri, 25 Dec 2009 22:38:09 +0100
Message-ID: <20091225213809.GB15610@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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
 src/nv50_accel.c |   18 +++++++++---------
 src/nv50_exa.c   |    2 +-
 src/nv50_xv.c    |    6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index b3b1584..ad290ea 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -97,11 +97,11 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 1);
 	BEGIN_RING(chan, tesla, NV50TCL_DMA_NOTIFY, 1);
 	OUT_RING  (chan, chan->nullobj->handle);
-	BEGIN_RING(chan, tesla, NV50TCL_DMA_UNK0(0), NV50TCL_DMA_UNK0__SIZE);
-	for (i = 0; i < NV50TCL_DMA_UNK0__SIZE; i++)
+	BEGIN_RING(chan, tesla, NV50TCL_DMA_ZETA, 11);
+	for (i = 0; i < 11; i++)
 		OUT_RING  (chan, pNv->chan->vram->handle);
-	BEGIN_RING(chan, tesla, NV50TCL_DMA_UNK1(0), NV50TCL_DMA_UNK1__SIZE);
-	for (i = 0; i < NV50TCL_DMA_UNK1__SIZE; i++)
+	BEGIN_RING(chan, tesla, NV50TCL_DMA_COLOR(0), NV50TCL_DMA_COLOR__SIZE);
+	for (i = 0; i < NV50TCL_DMA_COLOR__SIZE; i++)
 		OUT_RING  (chan, pNv->chan->vram->handle);
 	BEGIN_RING(chan, tesla, 0x121c, 1);
 	OUT_RING  (chan, 1);
@@ -368,19 +368,19 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
 	OUT_RING  (chan, 0x08040404);
 	OUT_RING  (chan, 0x00000008); /* NV50TCL_FP_REG_ALLOC_TEMP */
 
-	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_ENABLE, 1);
+	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_ENABLE(0), 1);
 	OUT_RING  (chan, 1);
 
-	BEGIN_RING(chan, tesla, NV50TCL_VIEWPORT_HORIZ, 2);
+	BEGIN_RING(chan, tesla, NV50TCL_VIEWPORT_HORIZ(0), 2);
 	OUT_RING  (chan, 8192 << NV50TCL_VIEWPORT_HORIZ_W_SHIFT);
 	OUT_RING  (chan, 8192 << NV50TCL_VIEWPORT_VERT_H_SHIFT);
 	/* NV50TCL_SCISSOR_VERT_T_SHIFT is wrong, because it was deducted with
 	 * origin lying at the bottom left. This will be changed to _MIN_ and _MAX_
 	 * later, because it is origin dependent.
 	 */
-	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ, 2);
-	OUT_RING  (chan, 8192 << NV50TCL_SCISSOR_HORIZ_R_SHIFT);
-	OUT_RING  (chan, 8192 << NV50TCL_SCISSOR_VERT_T_SHIFT);
+	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
+	OUT_RING  (chan, 8192 << NV50TCL_SCISSOR_HORIZ_MAX_SHIFT);
+	OUT_RING  (chan, 8192 << NV50TCL_SCISSOR_VERT_MAX_SHIFT);
 	BEGIN_RING(chan, tesla, NV50TCL_SCREEN_SCISSOR_HORIZ, 2);
 	OUT_RING  (chan, 8192 << NV50TCL_SCREEN_SCISSOR_HORIZ_W_SHIFT);
 	OUT_RING  (chan, 8192 << NV50TCL_SCREEN_SCISSOR_VERT_H_SHIFT);
diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index c7609b3..8839510 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -906,7 +906,7 @@ NV50EXAComposite(PixmapPtr pdpix, int sx, int sy, int mx, int my,
 	float sX0, sX1, sX2, sY0, sY1, sY2;
 
 	WAIT_RING (chan, 64);
-	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ, 2);
+	BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
 	OUT_RING  (chan, (dx + w) << 16 | dx);
 	OUT_RING  (chan, (dy + h) << 16 | dy);
 	BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BEGIN, 1);
diff --git a/src/nv50_xv.c b/src/nv50_xv.c
index daf1a41..fd339f9 100644
--- a/src/nv50_xv.c
+++ b/src/nv50_xv.c
@@ -342,9 +342,9 @@ nv50_xv_image_put(ScrnInfoPtr pScrn,
 		* origin lying at the bottom left. This will be changed to _MIN_ and _MAX_
 		* later, because it is origin dependent.
 		*/
-		BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ, 2);
-		OUT_RING  (chan, sx2 << NV50TCL_SCISSOR_HORIZ_R_SHIFT | sx1);
-		OUT_RING  (chan, sy2 << NV50TCL_SCISSOR_VERT_T_SHIFT | sy1 );
+		BEGIN_RING(chan, tesla, NV50TCL_SCISSOR_HORIZ(0), 2);
+		OUT_RING  (chan, sx2 << NV50TCL_SCISSOR_HORIZ_MAX_SHIFT | sx1);
+		OUT_RING  (chan, sy2 << NV50TCL_SCISSOR_VERT_MAX_SHIFT | sy1 );
 
 		BEGIN_RING(chan, tesla, NV50TCL_VERTEX_BEGIN, 1);
 		OUT_RING  (chan, NV50TCL_VERTEX_BEGIN_TRIANGLES);
-- 
1.6.6.rc3

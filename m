From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: avoid running out of relocs
Date: Fri,  4 Dec 2009 23:23:33 +0100
Message-ID: <1259965413-6973-1-git-send-email-madman2003@gmail.com>
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

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/gallium/drivers/nouveau/nouveau_stateobj.h |   12 ++++++++----
 src/gallium/drivers/nv50/nv50_query.c          |    2 +-
 src/gallium/drivers/nv50/nv50_surface.c        |    2 ++
 src/gallium/drivers/nv50/nv50_transfer.c       |    4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/src/gallium/drivers/nouveau/nouveau_stateobj.h b/src/gallium/drivers/nouveau/nouveau_stateobj.h
index b595405..28f483f 100644
--- a/src/gallium/drivers/nouveau/nouveau_stateobj.h
+++ b/src/gallium/drivers/nouveau/nouveau_stateobj.h
@@ -113,8 +113,10 @@ so_emit(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 	unsigned nr, i;
 
 	nr = so->cur - so->push;
-	if (pb->remaining < nr)
-		nouveau_pushbuf_flush(chan, nr);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	nouveau_pushbuf_marker_emit(chan, nr, so->cur_reloc);
 	pb->remaining -= nr;
 
 	memcpy(pb->cur, so->push, nr * 4);
@@ -138,8 +140,10 @@ so_emit_reloc_markers(struct nouveau_channel *chan, struct nouveau_stateobj *so)
 		return;
 
 	i = so->cur_reloc << 1;
-	if (pb->remaining < i)
-		nouveau_pushbuf_flush(chan, i);
+	/* This will flush if we need space.
+	 * We don't actually need the marker.
+	 */
+	nouveau_pushbuf_marker_emit(chan, i, i);
 	pb->remaining -= i;
 
 	for (i = 0; i < so->cur_reloc; i++) {
diff --git a/src/gallium/drivers/nv50/nv50_query.c b/src/gallium/drivers/nv50/nv50_query.c
index 5305c93..744afd0 100644
--- a/src/gallium/drivers/nv50/nv50_query.c
+++ b/src/gallium/drivers/nv50/nv50_query.c
@@ -93,7 +93,7 @@ nv50_query_end(struct pipe_context *pipe, struct pipe_query *pq)
 	struct nouveau_grobj *tesla = nv50->screen->tesla;
 	struct nv50_query *q = nv50_query(pq);
 
-	WAIT_RING (chan, 5);
+	MARK_RING(chan, 5, 2); /* flush on lack on space or relocs */
 	BEGIN_RING(chan, tesla, NV50TCL_QUERY_ADDRESS_HIGH, 4);
 	OUT_RELOCh(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
 	OUT_RELOCl(chan, q->bo, 0, NOUVEAU_BO_VRAM | NOUVEAU_BO_WR);
diff --git a/src/gallium/drivers/nv50/nv50_surface.c b/src/gallium/drivers/nv50/nv50_surface.c
index 6bf6f77..5d5e6dd 100644
--- a/src/gallium/drivers/nv50/nv50_surface.c
+++ b/src/gallium/drivers/nv50/nv50_surface.c
@@ -62,6 +62,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
  		return 1;
 
  	if (!bo->tile_flags) {
+		MARK_RING(chan, 9, 2); /* flush on lack on space or relocs */
  		BEGIN_RING(chan, eng2d, mthd, 2);
  		OUT_RING  (chan, format);
  		OUT_RING  (chan, 1);
@@ -72,6 +73,7 @@ nv50_surface_set(struct nv50_screen *screen, struct pipe_surface *ps, int dst)
  		OUT_RELOCh(chan, bo, ps->offset, flags);
  		OUT_RELOCl(chan, bo, ps->offset, flags);
  	} else {
+		MARK_RING(chan, 11, 2); /* flush on lack on space or relocs */
  		BEGIN_RING(chan, eng2d, mthd, 5);
  		OUT_RING  (chan, format);
  		OUT_RING  (chan, 0);
diff --git a/src/gallium/drivers/nv50/nv50_transfer.c b/src/gallium/drivers/nv50/nv50_transfer.c
index 4705f96..4686e3d 100644
--- a/src/gallium/drivers/nv50/nv50_transfer.c
+++ b/src/gallium/drivers/nv50/nv50_transfer.c
@@ -81,7 +81,7 @@ nv50_transfer_rect_m2mf(struct pipe_screen *pscreen,
 	while (height) {
 		int line_count = height > 2047 ? 2047 : height;
 
-		WAIT_RING (chan, 15);
+		MARK_RING (chan, 15, 4); /* flush on lack on space or relocs */
 		BEGIN_RING(chan, m2mf,
 			NV50_MEMORY_TO_MEMORY_FORMAT_OFFSET_IN_HIGH, 2);
 		OUT_RELOCh(chan, src_bo, src_offset, src_reloc);
@@ -282,7 +282,7 @@ nv50_upload_sifc(struct nv50_context *nv50,
 
 	reloc |= NOUVEAU_BO_WR;
 
-	WAIT_RING (chan, 32);
+	MARK_RING (chan, 32, 2); /* flush on lack on space or relocs */
 
 	if (bo->tile_flags) {
 		BEGIN_RING(chan, eng2d, NV50_2D_DST_FORMAT, 5);
-- 
1.6.5.3

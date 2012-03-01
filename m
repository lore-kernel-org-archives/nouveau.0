From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: [PATCH 10/10] dri2: Testpatch: Fix corner case crash but
	not the problem.
Date: Thu,  1 Mar 2012 19:11:15 +0100
Message-ID: <1330625475-7080-3-git-send-email-mario.kleiner@tuebingen.mpg.de>
References: <1330625475-7080-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1330625475-7080-1-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
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
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

Do not apply - Just for illustration:

Introduce reference counting for nouveau_dri2_buffers and
temporarily increase refcount on nouveau_dri2_buffer
frontbuffer to protect it against premature deletion by
x-server as part of the DRI2GetBuffers[WithFormat]() path
while the vblank event for a scheduled swap is still pending
and nouveau_dri2_finish_swap() hasn't completed for this
swap.

This prevents server/ddx crash on deferred swaps with
swaplimit > 1 but doesn't fix the problem: We try to treat
a setup which is only double-buffered as if it is truly
triple-buffered. This causes flickering, so not useful in
practice.

Signed-off-by: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
---
 src/nouveau_dri2.c |   57 +++++++++++++++++++++++++++++++---------------------
 1 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/src/nouveau_dri2.c b/src/nouveau_dri2.c
index 7878a5a..eb008c9 100644
--- a/src/nouveau_dri2.c
+++ b/src/nouveau_dri2.c
@@ -14,6 +14,7 @@
 struct nouveau_dri2_buffer {
 	DRI2BufferRec base;
 	PixmapPtr ppix;
+	unsigned int refcnt;
 };
 
 static inline struct nouveau_dri2_buffer *
@@ -79,6 +80,7 @@ nouveau_dri2_create_buffer(DrawablePtr pDraw, unsigned int attachment,
 	nvbuf->base.format = format;
 	nvbuf->base.flags = 0;
 	nvbuf->ppix = ppix;
+	nvbuf->refcnt++;
 
 	nvpix = nouveau_pixmap(ppix);
 	if (!nvpix || !nvpix->bo ||
@@ -100,6 +102,10 @@ nouveau_dri2_destroy_buffer(DrawablePtr pDraw, DRI2BufferPtr buf)
 	if (!nvbuf)
 		return;
 
+	nvbuf->refcnt--;
+	if (nvbuf->refcnt)
+		return;
+
 	pDraw->pScreen->DestroyPixmap(nvbuf->ppix);
 	free(nvbuf);
 }
@@ -178,6 +184,17 @@ update_front(DrawablePtr draw, DRI2BufferPtr front)
 	return TRUE;
 }
 
+static void
+ref_front(DrawablePtr draw, DRI2BufferPtr front, Bool doref)
+{
+	struct nouveau_dri2_buffer *nvbuf = nouveau_dri2_buffer(front);
+
+	if (doref)
+		nvbuf->refcnt++;
+	else
+		nouveau_dri2_destroy_buffer(draw, front);
+}
+
 static Bool
 can_exchange(DrawablePtr draw, PixmapPtr dst_pix, PixmapPtr src_pix)
 {
@@ -445,25 +462,21 @@ nouveau_dri2_schedule_swap(ClientPtr client, DrawablePtr draw,
 		if (*target_msc == 0)
 			*target_msc = 1;
 
-#if DRI2INFOREC_VERSION >= 6
-		/* Is this a swap in the future, ie. the vblank event will
-		 * not be immediately dispatched, but only at a future vblank?
-		 * If so, we need to temporarily lower the swaplimit to 1, so
-		 * that DRI2GetBuffersWithFormat() requests from the client get
-		 * deferred in the x-server until the vblank event has been
-		 * dispatched to us and nouveau_dri2_finish_swap() is done. If
-		 * we wouldn't do this, DRI2GetBuffersWithFormat() would operate
-		 * on wrong (pre-swap) buffers, and cause a segfault later on in
-		 * nouveau_dri2_finish_swap(). Our vblank event handler restores
-		 * the old swaplimit immediately after nouveau_dri2_finish_swap()
-		 * is done, so we still get 1 video refresh cycle worth of
-		 * triple-buffering. For a swap at next vblank, dispatch of the
-		 * vblank event happens immediately, so there isn't any need
-		 * for this lowered swaplimit.
+		/* Increase refcount on frontbuffer to protect it against
+		 * premature deletion by x-server as part of the
+		 * DRI2GetBuffersWithFormat() path while the vblank event
+		 * is still pending and nouveau_dri2_finish_swap() hasn't
+		 * completed for this swap.
+		 *
+		 * XXX: This prevents server/ddx crash on deferred swaps,
+		 * but doesn't fix the problem: We try to treat a setup
+		 * which is only double-buffered as if it is truly triple-
+		 * buffered. This causes flickering, so not useful in practice.
+		 *
+		 * Tinkering with the DRI2SwapLimit() is ugly but provides
+		 * proper behaviour.
 		 */
-		if (current_msc < *target_msc - 1)
-			DRI2SwapLimit(draw, 1);
-#endif
+		ref_front(draw, s->dst, true);
 
 		/* Request a vblank event one frame before the target */
 		ret = nouveau_wait_vblank(draw, DRM_VBLANK_ABSOLUTE |
@@ -577,12 +590,10 @@ nouveau_dri2_vblank_handler(int fd, unsigned int frame,
 	switch (s->action) {
 	case SWAP:
 		nouveau_dri2_finish_swap(draw, frame, tv_sec, tv_usec, s);
-#if DRI2INFOREC_VERSION >= 6
-		/* Restore real swap limit on drawable, now that it is safe. */
-		ScrnInfoPtr scrn = xf86Screens[draw->pScreen->myNum];
-		DRI2SwapLimit(draw, NVPTR(scrn)->swap_limit);
-#endif
 
+		/* Drop our reference on frontbuffer, now that the swap
+		 * has been programmed. */
+		ref_front(draw, s->dst, false);
 		break;
 
 	case WAIT:
-- 
1.7.5.4

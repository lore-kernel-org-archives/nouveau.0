From: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] drm/nouveau: rewrite nouveau_dma_wait()
Date: Fri, 21 Aug 2009 19:56:51 +1000
Message-ID: <1250848611-21642-1-git-send-email-skeggsb@gmail.com>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

There was at least one situation we could get into in the old code where
we'd end up overrunning the push buffer with the jumps back to the start
of the buffer in an attempt to get more space.

In addition, the new code prevents misdetecting a GPU hang by resetting
the timeout counter if we see the GPU GET pointer advancing, and
simplifies the handling of a confusing corner-case.

There's also a significant amount of commenting added to the code, as some
of the interactions are quite complex and hard to grasp on first looking
at the code.
---
 drivers/gpu/drm/nouveau/nouveau_dma.c |  114 +++++++++++++++++++++------------
 1 files changed, 72 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index e1a0adb..8930420 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -113,8 +113,13 @@ READ_GET(struct nouveau_channel *chan, uint32_t *get)
 
 	val = nvchan_rd32(chan->user_get);
 	if (val < chan->pushbuf_base ||
-	    val >= chan->pushbuf_base + chan->pushbuf_bo->bo.mem.size)
+	    val >= chan->pushbuf_base + chan->pushbuf_bo->bo.mem.size) {
+		/* meaningless to dma_wait() except to know whether the
+		 * GPU has stalled or not
+		 */
+		*get = val;
 		return false;
+	}
 
 	*get = (val - chan->pushbuf_base) >> 2;
 	return true;
@@ -123,54 +128,79 @@ READ_GET(struct nouveau_channel *chan, uint32_t *get)
 int
 nouveau_dma_wait(struct nouveau_channel *chan, int size)
 {
-	const int us_timeout = 100000;
-	uint32_t get;
-	int ret = -EBUSY, i;
+	uint32_t get, prev_get = 0, cnt = 0;
+	bool get_valid;
+
+	while (chan->dma.free < size) {
+		/* reset counter as long as GET is still advancing, this is
+		 * to avoid misdetecting a GPU lockup if the GPU happens to
+		 * just be processing an operation that takes a long time
+		 */
+		get_valid = READ_GET(chan, &get);
+		if (get != prev_get) {
+			prev_get = get;
+			cnt = 0;
+		}
 
-	for (i = 0; i < us_timeout; i++) {
-		if (!READ_GET(chan, &get)) {
+		if ((++cnt & 0xff) == 0) {
 			DRM_UDELAY(1);
-			continue;
+			if (cnt > 10000)
+				return -EBUSY;
 		}
 
-		if (chan->dma.put >= get) {
-			chan->dma.free = chan->dma.max - chan->dma.cur;
-
-			if (chan->dma.free < size) {
-				OUT_RING(chan, 0x20000000|chan->pushbuf_base);
-				if (get <= NOUVEAU_DMA_SKIPS) {
-					/*corner case - will be idle*/
-					if (chan->dma.put <= NOUVEAU_DMA_SKIPS)
-						WRITE_PUT(NOUVEAU_DMA_SKIPS + 1);
-
-					for (; i < us_timeout; i++) {
-						if (READ_GET(chan, &get) &&
-						    get > NOUVEAU_DMA_SKIPS)
-							break;
-
-						DRM_UDELAY(1);
-					}
-
-					if (i >= us_timeout)
-						break;
-				}
-
-				WRITE_PUT(NOUVEAU_DMA_SKIPS);
-				chan->dma.cur  =
-				chan->dma.put  = NOUVEAU_DMA_SKIPS;
-				chan->dma.free = get - (NOUVEAU_DMA_SKIPS + 1);
-			}
-		} else {
-			chan->dma.free = get - chan->dma.cur - 1;
-		}
+		/* loop until we have a usable GET pointer.  the value
+		 * we read from the GPU may be outside the main ring if
+		 * PFIFO is processing a buffer called from the main ring,
+		 * discard these values until something sensible is seen.
+		 *
+		 * the other case we discard GET is while the GPU is fetching
+		 * from the SKIPS area, so the code below doesn't have to deal
+		 * with some fun corner cases.
+		 */
+		if (!get_valid || get < NOUVEAU_DMA_SKIPS)
+			continue;
 
-		if (chan->dma.free >= size) {
-			ret = 0;
-			break;
+		if (get <= chan->dma.cur) {
+			/* engine is fetching behind us, or is completely
+			 * idle (GET == PUT) so we have free space up until
+			 * the end of the push buffer
+			 *
+			 * we can only hit that path once per call due to
+			 * looping back to the beginning of the push buffer,
+			 * we'll hit the fetching-ahead-of-us path from that
+			 * point on.
+			 *
+			 * the *one* exception to that rule is if we read
+			 * GET==PUT, in which case the below conditional will
+			 * always succeed and break us out of the wait loop.
+			 */
+			chan->dma.free = chan->dma.max - chan->dma.cur;
+			if (chan->dma.free >= size)
+				break;
+
+			/* not enough space left at the end of the push buffer,
+			 * instruct the GPU to jump back to the start right
+			 * after processing the currently pending commands.
+			 */
+			OUT_RING  (chan, chan->pushbuf_base | 0x20000000);
+			WRITE_PUT (NOUVEAU_DMA_SKIPS);
+
+			/* we're now submitting commands at the start of
+			 * the push buffer.
+			 */
+			chan->dma.cur  =
+			chan->dma.put  = NOUVEAU_DMA_SKIPS;
 		}
 
-		DRM_UDELAY(1);
+		/* engine fetching ahead of us, we have space up until the
+		 * current GET pointer.  the "- 1" is to ensure there's
+		 * space left to emit a jump back to the beginning of the
+		 * push buffer if we require it.  we can never get GET == PUT
+		 * here, so this is safe.
+		 */
+		chan->dma.free = get - chan->dma.cur - 1;
 	}
 
-	return ret;
+	return 0;
 }
+
-- 
1.6.4

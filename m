From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 4/4] drm/nouveau: fix ring buffer wrap-around
Date: Thu, 20 Aug 2009 21:11:36 +0300
Message-ID: <1250791896-15510-4-git-send-email-pq@iki.fi>
References: <1250791896-15510-1-git-send-email-pq@iki.fi>
	<1250791896-15510-2-git-send-email-pq@iki.fi>
	<1250791896-15510-3-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250791896-15510-3-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

In the wrap around case, it was resetting to SKIPS + 1, which would
leave one dword after the actual SKIPs untouched. It is a bit odd that
the undefined dword has not caused real trouble, or perhaps it is
written a "safe" value by accident.

Rename dma_wait_ring_wrap() to ring_wrap() and clean it up. Make
the dma.free computation just like in nouveau_dma_free().

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c |   22 +++++++++-------------
 1 files changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 28e9c11..5ede79c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -115,33 +115,31 @@ READ_GET(struct nouveau_channel *chan, uint32_t *get)
 	return true;
 }
 
-static int
-dma_wait_ring_wrap(struct nouveau_channel *chan, int size, uint32_t get,
-		   int *timeout)
+static void
+ring_wrap(struct nouveau_channel *chan, int size, uint32_t get, int *timeout)
 {
 	/* Emit jump to the start of the ring buffer. */
 	OUT_RING(chan, 0x20000000 | chan->pushbuf_base);
 
-	if (get <= NOUVEAU_DMA_SKIPS) {
+	if (get < NOUVEAU_DMA_SKIPS) {
 		/* corner case - will be idle */
-		if (chan->dma.put <= NOUVEAU_DMA_SKIPS)
-			WRITE_PUT(chan, NOUVEAU_DMA_SKIPS + 1);
+		if (chan->dma.put < NOUVEAU_DMA_SKIPS)
+			WRITE_PUT(chan, NOUVEAU_DMA_SKIPS);
 
 		for (; *timeout; (*timeout)--) {
-			if (READ_GET(chan, &get) && get > NOUVEAU_DMA_SKIPS)
+			if (READ_GET(chan, &get) && get >= NOUVEAU_DMA_SKIPS)
 				break;
 
 			DRM_UDELAY(1);
 		}
 
 		if (*timeout == 0)
-			return -EBUSY;
+			return;
 	}
 
 	WRITE_PUT(chan, NOUVEAU_DMA_SKIPS);
 	chan->dma.cur  = NOUVEAU_DMA_SKIPS;
-	chan->dma.free = get - (NOUVEAU_DMA_SKIPS + 1);
-	return 0;
+	chan->dma.free = get - chan->dma.cur - 1;
 }
 
 int
@@ -160,9 +158,7 @@ nouveau_dma_wait(struct nouveau_channel *chan, int size)
 			chan->dma.free = chan->dma.max - chan->dma.cur;
 
 			if (chan->dma.free < size)
-				if (dma_wait_ring_wrap(chan, size, get,
-								&us_timeout))
-					return -EBUSY;
+				ring_wrap(chan, size, get, &us_timeout);
 		} else {
 			chan->dma.free = get - chan->dma.cur - 1;
 		}
-- 
1.6.3.3

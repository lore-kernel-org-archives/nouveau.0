From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau: refactor nouveau_dma_wait()
Date: Thu, 20 Aug 2009 21:11:33 +0300
Message-ID: <1250791896-15510-1-git-send-email-pq@iki.fi>
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

A cleanup of nouveau_dma_wait(): extract a sub-function and eliminate
two variables to improve readability.

No functional changes.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c |   72 ++++++++++++++++++---------------
 1 files changed, 39 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index b1f3a71..b787651 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -115,14 +115,43 @@ READ_GET(struct nouveau_channel *chan, uint32_t *get)
 	return true;
 }
 
+static int
+dma_wait_ring_wrap(struct nouveau_channel *chan, int size, uint32_t get,
+		   int *timeout)
+{
+	/* Emit jump to the start of the ring buffer. */
+	OUT_RING(chan, 0x20000000 | chan->pushbuf_base);
+
+	if (get <= NOUVEAU_DMA_SKIPS) {
+		/* corner case - will be idle */
+		if (chan->dma.put <= NOUVEAU_DMA_SKIPS)
+			WRITE_PUT(NOUVEAU_DMA_SKIPS + 1);
+
+		for (; *timeout; (*timeout)--) {
+			if (READ_GET(chan, &get) && get > NOUVEAU_DMA_SKIPS)
+				break;
+
+			DRM_UDELAY(1);
+		}
+
+		if (*timeout == 0)
+			return -EBUSY;
+	}
+
+	WRITE_PUT(NOUVEAU_DMA_SKIPS);
+	chan->dma.cur  = NOUVEAU_DMA_SKIPS;
+	chan->dma.put  = NOUVEAU_DMA_SKIPS;
+	chan->dma.free = get - (NOUVEAU_DMA_SKIPS + 1);
+	return 0;
+}
+
 int
 nouveau_dma_wait(struct nouveau_channel *chan, int size)
 {
-	const int us_timeout = 100000;
+	int us_timeout = 100000;
 	uint32_t get;
-	int ret = -EBUSY, i;
 
-	for (i = 0; i < us_timeout; i++) {
+	for (; us_timeout; us_timeout--) {
 		if (!READ_GET(chan, &get)) {
 			DRM_UDELAY(1);
 			continue;
@@ -131,41 +160,18 @@ nouveau_dma_wait(struct nouveau_channel *chan, int size)
 		if (chan->dma.put >= get) {
 			chan->dma.free = chan->dma.max - chan->dma.cur;
 
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
+			if (chan->dma.free < size)
+				if (dma_wait_ring_wrap(chan, size, get,
+								&us_timeout))
+					return -EBUSY;
 		} else {
 			chan->dma.free = get - chan->dma.cur - 1;
 		}
 
-		if (chan->dma.free >= size) {
-			ret = 0;
-			break;
-		}
+		if (chan->dma.free >= size)
+			return 0;
 
 		DRM_UDELAY(1);
 	}
-
-	return ret;
+	return -EBUSY;
 }
-- 
1.6.3.3

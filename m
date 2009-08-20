From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/4] drm/nouveau: make WRITE_PUT a function
Date: Thu, 20 Aug 2009 21:11:34 +0300
Message-ID: <1250791896-15510-2-git-send-email-pq@iki.fi>
References: <1250791896-15510-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250791896-15510-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Make WRITE_PUT() an inline function, and pass chan as an argument.
Update chan->dma.put in WRITE_PUT() instead of (almost) everywhere by
hand afterwards.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.c |    5 ++---
 drivers/gpu/drm/nouveau/nouveau_dma.h |   16 +++++++++-------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index b787651..28e9c11 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -125,7 +125,7 @@ dma_wait_ring_wrap(struct nouveau_channel *chan, int size, uint32_t get,
 	if (get <= NOUVEAU_DMA_SKIPS) {
 		/* corner case - will be idle */
 		if (chan->dma.put <= NOUVEAU_DMA_SKIPS)
-			WRITE_PUT(NOUVEAU_DMA_SKIPS + 1);
+			WRITE_PUT(chan, NOUVEAU_DMA_SKIPS + 1);
 
 		for (; *timeout; (*timeout)--) {
 			if (READ_GET(chan, &get) && get > NOUVEAU_DMA_SKIPS)
@@ -138,9 +138,8 @@ dma_wait_ring_wrap(struct nouveau_channel *chan, int size, uint32_t get,
 			return -EBUSY;
 	}
 
-	WRITE_PUT(NOUVEAU_DMA_SKIPS);
+	WRITE_PUT(chan, NOUVEAU_DMA_SKIPS);
 	chan->dma.cur  = NOUVEAU_DMA_SKIPS;
-	chan->dma.put  = NOUVEAU_DMA_SKIPS;
 	chan->dma.free = get - (NOUVEAU_DMA_SKIPS + 1);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index cdaa37d..74db74e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -118,11 +118,14 @@ BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 	OUT_RING(chan, (subc << 13) | (size << 18) | mthd);
 }
 
-#define WRITE_PUT(val) do {                                                    \
-	DRM_MEMORYBARRIER();                                                   \
-	nouveau_bo_rd32(chan->pushbuf_bo, 0);                                  \
-	nvchan_wr32(chan->user_put, ((val) << 2) + chan->pushbuf_base);        \
-} while (0)
+static inline void
+WRITE_PUT(struct nouveau_channel *chan, uint32_t index)
+{
+	DRM_MEMORYBARRIER();
+	nouveau_bo_rd32(chan->pushbuf_bo, 0);
+	nvchan_wr32(chan->user_put, index * 4 + chan->pushbuf_base);
+	chan->dma.put = index;
+}
 
 static inline void
 FIRE_RING(struct nouveau_channel *chan)
@@ -135,8 +138,7 @@ FIRE_RING(struct nouveau_channel *chan)
 		return;
 	chan->accel_done = true;
 
-	WRITE_PUT(chan->dma.cur);
-	chan->dma.put = chan->dma.cur;
+	WRITE_PUT(chan, chan->dma.cur);
 }
 
 static inline void
-- 
1.6.3.3

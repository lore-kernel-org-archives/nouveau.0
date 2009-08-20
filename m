From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/4] drm/nouveau: add PCI flush to FIRE_RING()
Date: Thu, 20 Aug 2009 21:11:35 +0300
Message-ID: <1250791896-15510-3-git-send-email-pq@iki.fi>
References: <1250791896-15510-1-git-send-email-pq@iki.fi>
	<1250791896-15510-2-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1250791896-15510-2-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

A PCI write may be cached somewhere in the a PCI bridge/bus for some
time. Doing a PCI read will force all pending writes to be finished.

Add a dummy read to force the PUT register write to arrive to hardware
at FIRE_RING time.

Add comments for the barrier and flush in WRITE_PUT().

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_dma.h |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 74db74e..aada9be 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -121,8 +121,13 @@ BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 static inline void
 WRITE_PUT(struct nouveau_channel *chan, uint32_t index)
 {
+	/* no CPU instruction reordering over this point */
 	DRM_MEMORYBARRIER();
-	nouveau_bo_rd32(chan->pushbuf_bo, 0);
+
+	/* flush pushbuf writes, if it happens to be in VRAM */
+	(void)nouveau_bo_rd32(chan->pushbuf_bo, 0);
+
+	/* fire */
 	nvchan_wr32(chan->user_put, index * 4 + chan->pushbuf_base);
 	chan->dma.put = index;
 }
@@ -139,6 +144,9 @@ FIRE_RING(struct nouveau_channel *chan)
 	chan->accel_done = true;
 
 	WRITE_PUT(chan, chan->dma.cur);
+
+	/* flush the fire PCI write to the card */
+	(void)nvchan_rd32(chan->user_get);
 }
 
 static inline void
-- 
1.6.3.3

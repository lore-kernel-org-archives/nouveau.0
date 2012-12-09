From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/4] drm/nouveau: split fifo interrupt handler
Date: Sun,  9 Dec 2012 15:45:19 +0100
Message-ID: <1355064322-23025-1-git-send-email-marcin.slusarz@gmail.com>
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

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c | 174 ++++++++++++------------
 1 file changed, 88 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
index 2fe14da3..76944c4 100644
--- a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c
@@ -398,6 +398,92 @@ out:
 	return handled;
 }
 
+static void
+nv04_fifo_cache_error(struct nouveau_device *device,
+		struct nv04_fifo_priv *priv, u32 chid, u32 get)
+{
+	u32 mthd, data;
+	int ptr;
+
+	/* NV_PFIFO_CACHE1_GET actually goes to 0xffc before wrapping on my
+	 * G80 chips, but CACHE1 isn't big enough for this much data.. Tests
+	 * show that it wraps around to the start at GET=0x800.. No clue as to
+	 * why..
+	 */
+	ptr = (get & 0x7ff) >> 2;
+
+	if (device->card_type < NV_40) {
+		mthd = nv_rd32(priv, NV04_PFIFO_CACHE1_METHOD(ptr));
+		data = nv_rd32(priv, NV04_PFIFO_CACHE1_DATA(ptr));
+	} else {
+		mthd = nv_rd32(priv, NV40_PFIFO_CACHE1_METHOD(ptr));
+		data = nv_rd32(priv, NV40_PFIFO_CACHE1_DATA(ptr));
+	}
+
+	if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
+		nv_error(priv,
+			 "CACHE_ERROR - Ch %d/%d Mthd 0x%04x Data 0x%08x\n",
+			 chid, (mthd >> 13) & 7, mthd & 0x1ffc, data);
+	}
+
+	nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
+	nv_wr32(priv, NV03_PFIFO_INTR_0, NV_PFIFO_INTR_CACHE_ERROR);
+
+	nv_wr32(priv, NV03_PFIFO_CACHE1_PUSH0,
+		nv_rd32(priv, NV03_PFIFO_CACHE1_PUSH0) & ~1);
+	nv_wr32(priv, NV03_PFIFO_CACHE1_GET, get + 4);
+	nv_wr32(priv, NV03_PFIFO_CACHE1_PUSH0,
+		nv_rd32(priv, NV03_PFIFO_CACHE1_PUSH0) | 1);
+	nv_wr32(priv, NV04_PFIFO_CACHE1_HASH, 0);
+
+	nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH,
+		nv_rd32(priv, NV04_PFIFO_CACHE1_DMA_PUSH) | 1);
+	nv_wr32(priv, NV04_PFIFO_CACHE1_PULL0, 1);
+}
+
+static void
+nv04_fifo_dma_pusher(struct nouveau_device *device, struct nv04_fifo_priv *priv,
+		u32 chid)
+{
+	u32 dma_get = nv_rd32(priv, 0x003244);
+	u32 dma_put = nv_rd32(priv, 0x003240);
+	u32 push = nv_rd32(priv, 0x003220);
+	u32 state = nv_rd32(priv, 0x003228);
+
+	if (device->card_type == NV_50) {
+		u32 ho_get = nv_rd32(priv, 0x003328);
+		u32 ho_put = nv_rd32(priv, 0x003320);
+		u32 ib_get = nv_rd32(priv, 0x003334);
+		u32 ib_put = nv_rd32(priv, 0x003330);
+
+		nv_error(priv,
+			 "DMA_PUSHER - Ch %d Get 0x%02x%08x Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
+			 chid, ho_get, dma_get, ho_put, dma_put, ib_get, ib_put,
+			 state, nv_dma_state_err(state), push);
+
+		/* METHOD_COUNT, in DMA_STATE on earlier chipsets */
+		nv_wr32(priv, 0x003364, 0x00000000);
+		if (dma_get != dma_put || ho_get != ho_put) {
+			nv_wr32(priv, 0x003244, dma_put);
+			nv_wr32(priv, 0x003328, ho_put);
+		} else
+		if (ib_get != ib_put)
+			nv_wr32(priv, 0x003334, ib_put);
+	} else {
+		nv_error(priv,
+			 "DMA_PUSHER - Ch %d Get 0x%08x Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
+			 chid, dma_get, dma_put, state, nv_dma_state_err(state),
+			 push);
+
+		if (dma_get != dma_put)
+			nv_wr32(priv, 0x003244, dma_put);
+	}
+
+	nv_wr32(priv, 0x003228, 0x00000000);
+	nv_wr32(priv, 0x003220, 0x00000001);
+	nv_wr32(priv, 0x002100, NV_PFIFO_INTR_DMA_PUSHER);
+}
+
 void
 nv04_fifo_intr(struct nouveau_subdev *subdev)
 {
@@ -416,96 +502,12 @@ nv04_fifo_intr(struct nouveau_subdev *subdev)
 		get  = nv_rd32(priv, NV03_PFIFO_CACHE1_GET);
 
 		if (status & NV_PFIFO_INTR_CACHE_ERROR) {
-			uint32_t mthd, data;
-			int ptr;
-
-			/* NV_PFIFO_CACHE1_GET actually goes to 0xffc before
-			 * wrapping on my G80 chips, but CACHE1 isn't big
-			 * enough for this much data.. Tests show that it
-			 * wraps around to the start at GET=0x800.. No clue
-			 * as to why..
-			 */
-			ptr = (get & 0x7ff) >> 2;
-
-			if (device->card_type < NV_40) {
-				mthd = nv_rd32(priv,
-					NV04_PFIFO_CACHE1_METHOD(ptr));
-				data = nv_rd32(priv,
-					NV04_PFIFO_CACHE1_DATA(ptr));
-			} else {
-				mthd = nv_rd32(priv,
-					NV40_PFIFO_CACHE1_METHOD(ptr));
-				data = nv_rd32(priv,
-					NV40_PFIFO_CACHE1_DATA(ptr));
-			}
-
-			if (!nv04_fifo_swmthd(priv, chid, mthd, data)) {
-				nv_error(priv, "CACHE_ERROR - Ch %d/%d "
-					      "Mthd 0x%04x Data 0x%08x\n",
-					chid, (mthd >> 13) & 7, mthd & 0x1ffc,
-					data);
-			}
-
-			nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
-			nv_wr32(priv, NV03_PFIFO_INTR_0,
-						NV_PFIFO_INTR_CACHE_ERROR);
-
-			nv_wr32(priv, NV03_PFIFO_CACHE1_PUSH0,
-				nv_rd32(priv, NV03_PFIFO_CACHE1_PUSH0) & ~1);
-			nv_wr32(priv, NV03_PFIFO_CACHE1_GET, get + 4);
-			nv_wr32(priv, NV03_PFIFO_CACHE1_PUSH0,
-				nv_rd32(priv, NV03_PFIFO_CACHE1_PUSH0) | 1);
-			nv_wr32(priv, NV04_PFIFO_CACHE1_HASH, 0);
-
-			nv_wr32(priv, NV04_PFIFO_CACHE1_DMA_PUSH,
-				nv_rd32(priv, NV04_PFIFO_CACHE1_DMA_PUSH) | 1);
-			nv_wr32(priv, NV04_PFIFO_CACHE1_PULL0, 1);
-
+			nv04_fifo_cache_error(device, priv, chid, get);
 			status &= ~NV_PFIFO_INTR_CACHE_ERROR;
 		}
 
 		if (status & NV_PFIFO_INTR_DMA_PUSHER) {
-			u32 dma_get = nv_rd32(priv, 0x003244);
-			u32 dma_put = nv_rd32(priv, 0x003240);
-			u32 push = nv_rd32(priv, 0x003220);
-			u32 state = nv_rd32(priv, 0x003228);
-
-			if (device->card_type == NV_50) {
-				u32 ho_get = nv_rd32(priv, 0x003328);
-				u32 ho_put = nv_rd32(priv, 0x003320);
-				u32 ib_get = nv_rd32(priv, 0x003334);
-				u32 ib_put = nv_rd32(priv, 0x003330);
-
-				nv_error(priv, "DMA_PUSHER - Ch %d Get 0x%02x%08x "
-				     "Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x "
-				     "State 0x%08x (err: %s) Push 0x%08x\n",
-					chid, ho_get, dma_get, ho_put,
-					dma_put, ib_get, ib_put, state,
-					nv_dma_state_err(state),
-					push);
-
-				/* METHOD_COUNT, in DMA_STATE on earlier chipsets */
-				nv_wr32(priv, 0x003364, 0x00000000);
-				if (dma_get != dma_put || ho_get != ho_put) {
-					nv_wr32(priv, 0x003244, dma_put);
-					nv_wr32(priv, 0x003328, ho_put);
-				} else
-				if (ib_get != ib_put) {
-					nv_wr32(priv, 0x003334, ib_put);
-				}
-			} else {
-				nv_error(priv, "DMA_PUSHER - Ch %d Get 0x%08x "
-					     "Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
-					chid, dma_get, dma_put, state,
-					nv_dma_state_err(state), push);
-
-				if (dma_get != dma_put)
-					nv_wr32(priv, 0x003244, dma_put);
-			}
-
-			nv_wr32(priv, 0x003228, 0x00000000);
-			nv_wr32(priv, 0x003220, 0x00000001);
-			nv_wr32(priv, 0x002100, NV_PFIFO_INTR_DMA_PUSHER);
+			nv04_fifo_dma_pusher(device, priv, chid);
 			status &= ~NV_PFIFO_INTR_DMA_PUSHER;
 		}
 
-- 
1.7.12

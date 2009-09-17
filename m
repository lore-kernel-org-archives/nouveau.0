From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 2/3] drm/nouveau: channel user reg accessors into
	functions
Date: Thu, 17 Sep 2009 22:08:49 +0300
Message-ID: <1253214530-4502-2-git-send-email-pq@iki.fi>
References: <1253214530-4502-1-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1253214530-4502-1-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

Change the channel user reg accessor macros into functions. This also
gets rid of the implicit macro argument 'chan', which now has to be
given explicitly.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_dma.c     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h     |    2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.c     |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   12 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_fence.c   |    2 +-
 6 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 8661b68..75353d9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -239,8 +239,8 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	    dev_priv->fifo_alloc_count == 1) {
 		/* setup channel's default get/put values
 		 */
-		nvchan_wr32(chan->user_get, chan->pushbuf_base);
-		nvchan_wr32(chan->user_put, chan->pushbuf_base);
+		nvchan_wr32(chan, chan->user_get, chan->pushbuf_base);
+		nvchan_wr32(chan, chan->user_put, chan->pushbuf_base);
 
 		ret = engine->fifo.load_context(chan);
 		if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 2e4ef62..6ab6f5f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -111,7 +111,7 @@ READ_GET(struct nouveau_channel *chan, uint32_t *get)
 {
 	uint32_t val;
 
-	val = nvchan_rd32(chan->user_get);
+	val = nvchan_rd32(chan, chan->user_get);
 	if (val < chan->pushbuf_base ||
 	    val >= chan->pushbuf_base + chan->pushbuf_bo->bo.mem.size) {
 		/* meaningless to dma_wait() except to know whether the
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 9e439a0..a8a6ea1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -121,7 +121,7 @@ BEGIN_RING(struct nouveau_channel *chan, int subc, int mthd, int size)
 #define WRITE_PUT(val) do {                                                    \
 	DRM_MEMORYBARRIER();                                                   \
 	nouveau_bo_rd32(chan->pushbuf_bo, 0);                                  \
-	nvchan_wr32(chan->user_put, ((val) << 2) + chan->pushbuf_base);        \
+	nvchan_wr32(chan, chan->user_put, ((val) << 2) + chan->pushbuf_base);  \
 } while (0)
 
 static inline void
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouveau/nouveau_drv.c
index c854bbc..94dea9f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
@@ -290,8 +290,8 @@ nouveau_pci_resume(struct pci_dev *pdev)
 		struct nouveau_channel *chan = dev_priv->channel;
 		int ptr = chan->pushbuf_base + (chan->dma.cur << 2);
 
-		nvchan_wr32(chan->user_get, ptr);
-		nvchan_wr32(chan->user_put, ptr);
+		nvchan_wr32(chan, chan->user_get, ptr);
+		nvchan_wr32(chan, chan->user_put, ptr);
 
 		engine->fifo.load_context(chan);
 		engine->graph.load_context(chan);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 63cf483..f1c7ac1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -1047,8 +1047,16 @@ extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 #endif /* !ioread32_native */
 
 /* channel control reg access */
-#define nvchan_wr32(reg, val) iowrite32_native((val), chan->user + (reg))
-#define nvchan_rd32(reg) ioread32_native(chan->user + (reg))
+static inline u32 nvchan_rd32(struct nouveau_channel *chan, unsigned reg)
+{
+	return ioread32_native(chan->user + reg);
+}
+
+static inline void nvchan_wr32(struct nouveau_channel *chan,
+							unsigned reg, u32 val)
+{
+	iowrite32_native(val, chan->user + reg);
+}
 
 /* register access */
 static inline u32 nv_rd32(struct drm_device *dev, unsigned reg)
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ad98e9b..6e7d44e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -65,7 +65,7 @@ nouveau_fence_update(struct nouveau_channel *chan)
 	uint32_t sequence;
 
 	if (USE_REFCNT)
-		sequence = nvchan_rd32(0x48);
+		sequence = nvchan_rd32(chan, 0x48);
 	else
 		sequence = chan->fence.last_sequence_irq;
 
-- 
1.6.3.3

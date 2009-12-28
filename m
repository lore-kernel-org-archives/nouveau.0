From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] drm/nouveau: synchronize channel after buffer
	object move on another channel
Date: Tue, 29 Dec 2009 00:49:41 +0100
Message-ID: <1262044181-6269-2-git-send-email-madman2003@gmail.com>
References: <1262044181-6269-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262044181-6269-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- The implementation is pretty generic and should work on most hw.
- It's only tested on nv50 and the userspace interface lacks awareness of
fences, so it's not possible yet to do this from userspace.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c    |    7 ++
 drivers/gpu/drm/nouveau/nouveau_dma.c   |    5 +
 drivers/gpu/drm/nouveau/nouveau_dma.h   |    1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h   |   21 +++++
 drivers/gpu/drm/nouveau/nouveau_fence.c |  129 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nv10_graph.c    |   50 ++++++++++++
 drivers/gpu/drm/nouveau/nv20_graph.c    |   10 +++
 drivers/gpu/drm/nouveau/nv40_graph.c    |    9 ++
 drivers/gpu/drm/nouveau/nv50_graph.c    |    4 +
 9 files changed, 236 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 5b1c0ae..462fc74 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -467,6 +467,13 @@ nouveau_bo_move_accel_cleanup(struct nouveau_channel *chan,
 	if (ret)
 		return ret;
 
+	/* Make the user channel wait for the kernel channel to be done. */
+	if (nvbo->channel && chan != nvbo->channel) {
+		ret = nouveau_fence_sync(nvbo->channel, fence);
+		if (ret)
+			return ret;
+	}
+
 	ret = ttm_bo_move_accel_cleanup(&nvbo->bo, fence, NULL,
 					evict, no_wait, new_mem);
 	nouveau_fence_unref((void *)&fence);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index f1fd3f2..23547d6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -62,6 +62,11 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	/* Notifier for internal/kernel cross channel synchronisation. */
+	ret = nouveau_notifier_alloc(chan, NvNotify1, 32, &chan->sync_ntfy);
+	if (ret)
+		return ret;
+
 	/* Map push buffer */
 	ret = nouveau_bo_map(chan->pushbuf_bo);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index dabfd65..d1ef524 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -69,6 +69,7 @@ enum {
 	NvGdiRect	= 0x8000000c,
 	NvImageBlit	= 0x8000000d,
 	NvSw		= 0x8000000e,
+	NvNotify1		= 0x8000000f,
 
 	/* G80+ display objects */
 	NvEvoVRAM	= 0x01000000,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9181eae..b836f07 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -228,6 +228,7 @@ struct nouveau_channel {
 
 	/* GPU object info for stuff used in-kernel (mm_enabled) */
 	uint32_t m2mf_ntfy;
+	uint32_t sync_ntfy;
 	uint32_t vram_handle;
 	uint32_t gart_handle;
 	bool accel_done;
@@ -248,6 +249,8 @@ struct nouveau_channel {
 		uint32_t vblsem_offset;
 		uint32_t vblsem_rval;
 		struct list_head vbl_wait;
+		uint32_t syncsem_handle;
+		uint32_t sync_sequence;
 	} nvsw;
 
 	struct {
@@ -983,6 +986,14 @@ extern int  nv10_graph_unload_context(struct drm_device *);
 extern void nv10_graph_context_switch(struct drm_device *);
 extern void nv10_graph_set_region_tiling(struct drm_device *, int, uint32_t,
 					 uint32_t, uint32_t);
+extern int nv10_graph_nvsw_flush_semaphore_notifier(struct nouveau_channel *,
+				int, int, uint32_t);
+extern int nv10_graph_nvsw_flush_semaphore_fence_sequence(
+				struct nouveau_channel *, int, int, uint32_t);
+extern int nv10_graph_nvsw_flush_semaphore_pre_acquire(struct nouveau_channel *,
+				int, int, uint32_t);
+extern int nv10_graph_nvsw_flush_semaphore_flush(struct nouveau_channel *, int,
+				int, uint32_t);
 
 /* nv20_graph.c */
 extern struct nouveau_pgraph_object_class nv20_graph_grclass[];
@@ -1134,6 +1145,12 @@ extern int nouveau_fence_flush(void *obj, void *arg);
 extern void nouveau_fence_unref(void **obj);
 extern void *nouveau_fence_ref(void *obj);
 extern void nouveau_fence_handler(struct drm_device *dev, int channel);
+extern int nouveau_fence_sync(struct nouveau_channel *chan,
+				struct nouveau_fence *fence);
+extern int nouveau_fence_semaphore_pre_acquire(struct nouveau_channel *chan,
+				int channel);
+extern int nouveau_fence_semaphore_flush(struct nouveau_channel *chan,
+				int channel);
 
 /* nouveau_gem.c */
 extern int nouveau_gem_new(struct drm_device *, struct nouveau_channel *,
@@ -1341,5 +1358,9 @@ nv_two_reg_pll(struct drm_device *dev)
 #define NV_SW_VBLSEM_OFFSET                                          0x00000400
 #define NV_SW_VBLSEM_RELEASE_VALUE                                   0x00000404
 #define NV_SW_VBLSEM_RELEASE                                         0x00000408
+#define NV_SW_SYNC_SEMAPHORE_NOTIFIER				0x00000500
+#define NV_SW_SYNC_SEMAPHORE_FENCE_SEQUENCE		0x00000504
+#define NV_SW_SYNC_SEMAPHORE_PRE_ACQUIRE			0x00000508
+#define NV_SW_SYNC_SEMAPHORE_FLUSH				0x0000050C
 
 #endif /* __NOUVEAU_DRV_H__ */
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index faddf53..61cd856 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -260,3 +260,132 @@ nouveau_fence_fini(struct nouveau_channel *chan)
 	}
 }
 
+/* This mechanism relies on having a single notifier for synchronisation between
+ * 2 channels, in this case the kernel channel and one user channel.
+ */
+int
+nouveau_fence_sync(struct nouveau_channel *chan, struct nouveau_fence *fence)
+{
+	struct drm_nouveau_private *dev_priv;
+	int ret;
+
+	if (!chan || !fence)
+		return -EINVAL;
+
+	dev_priv = chan->dev->dev_private;
+
+	if (dev_priv->card_type < NV_10)
+		return -ENOSYS;
+
+	if (!fence->sequence)
+		nouveau_fence_emit(fence);
+
+	ret = RING_SPACE(chan, 13);
+	if (ret)
+		return ret;
+
+	ret = RING_SPACE(fence->channel, 4);
+	if (ret)
+		return ret;
+
+	/* Setup semaphore. */
+	BEGIN_RING(chan, NvSubSw, NV_SW_DMA_SEMAPHORE, 2);
+	OUT_RING(chan, NvNotify1);
+	OUT_RING(chan, 0);
+	BEGIN_RING(chan, NvSubSw, NV_SW_SYNC_SEMAPHORE_NOTIFIER, 1);
+	OUT_RING(chan, NvNotify1);
+	/* What fence sequence should we be waiting for. */
+	BEGIN_RING(chan, NvSubSw, NV_SW_SYNC_SEMAPHORE_FENCE_SEQUENCE, 1);
+	OUT_RING(chan, fence->sequence);
+	/* Set initial value. */
+	BEGIN_RING(chan, NvSubSw, NV_SW_SEMAPHORE_RELEASE, 1);
+	OUT_RING(chan, 0x22222222);
+	/* Set end value if fence has already passed. */
+	BEGIN_RING(chan, NvSubSw, NV_SW_SYNC_SEMAPHORE_PRE_ACQUIRE, 1);
+	OUT_RING(chan, fence->channel->id);
+	/* Wait for condition to become true. */
+	BEGIN_RING(chan, NvSubSw, NV_SW_SEMAPHORE_ACQUIRE, 1);
+	OUT_RING(chan, 0x11111111);
+
+	/* This is the notifier on the blocking channel. */
+	BEGIN_RING(fence->channel, NvSubSw, NV_SW_SYNC_SEMAPHORE_NOTIFIER, 1);
+	OUT_RING(fence->channel, NvNotify1);
+	/* Write to user semaphore notifier. */
+	BEGIN_RING(fence->channel, NvSubSw, NV_SW_SYNC_SEMAPHORE_FLUSH, 1);
+	OUT_RING(fence->channel, chan->id);
+	FIRE_RING(fence->channel);
+
+	return 0;
+}
+
+/* Software method handlers.
+ * Value 0x11111111 is hardcoded as done, and 0x22222222 as not done.
+ */
+int
+nouveau_fence_semaphore_pre_acquire(struct nouveau_channel *chan, int channel)
+{
+	struct drm_device *dev = chan->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_channel *ochan = NULL;
+	struct nouveau_gpuobj_ref *ref = NULL;
+	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
+	uint32_t offset = 0;
+
+	if (channel < 0 || channel >= pfifo->channels)
+		return -EINVAL;
+
+	ochan = dev_priv->fifos[channel];
+
+	spin_lock_irq(&ochan->fence.lock);
+	nouveau_fence_update(ochan);
+	spin_unlock_irq(&ochan->fence.lock);
+
+	if (nouveau_gpuobj_ref_find(chan, chan->nvsw.syncsem_handle, &ref))
+		return -ENOENT;
+
+	if (nouveau_notifier_offset(ref->gpuobj, &offset))
+		return -EINVAL;
+
+	if (chan->nvsw.sync_sequence > ochan->fence.sequence_ack) /* not done */
+		nouveau_bo_wr32(chan->notifier_bo, offset >> 2, 0x22222222);
+	else /* done */
+		nouveau_bo_wr32(chan->notifier_bo, offset >> 2, 0x11111111);
+
+	return 0;
+}
+
+int
+nouveau_fence_semaphore_flush(struct nouveau_channel *chan, int channel)
+{
+	struct drm_device *dev = chan->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_channel *ochan = NULL;
+	struct nouveau_gpuobj_ref *ref = NULL;
+	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
+	uint32_t offset = 0;
+
+	if (channel < 0 || channel >= pfifo->channels)
+		return -EINVAL;
+
+	ochan = dev_priv->fifos[channel];
+
+	/* Race conditions are unavoidable if we rely on the handle from ochan.
+	 * So we store it ourselves.
+	 */
+	if (nouveau_gpuobj_ref_find(ochan, chan->nvsw.syncsem_handle, &ref))
+		return -ENOENT;
+
+	if (nouveau_notifier_offset(ref->gpuobj, &offset))
+		return -EINVAL;
+
+	/* Possible race conditions:
+	 * This sync is from earlier than the channel is waiting for ->
+	 * impossible, since it would be waiting still for the old one.
+	 * This sync is from the future, no problem the value is already
+	 * 0x11111111, and we don't care anyway.
+	 */
+
+	nouveau_bo_wr32(ochan->notifier_bo, offset >> 2, 0x11111111);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nv10_graph.c b/drivers/gpu/drm/nouveau/nv10_graph.c
index fcf2cdd..09394e1 100644
--- a/drivers/gpu/drm/nouveau/nv10_graph.c
+++ b/drivers/gpu/drm/nouveau/nv10_graph.c
@@ -984,7 +984,57 @@ static struct nouveau_pgraph_object_method nv17_graph_celsius_mthds[] = {
 	{}
 };
 
+int
+nv10_graph_nvsw_flush_semaphore_notifier(struct nouveau_channel *chan,
+				int grclass, int mthd, uint32_t data)
+{
+	if (!data)
+		return -EINVAL;
+
+	/* Used for both channels involved in the synchronisation. */
+	chan->nvsw.syncsem_handle = data;
+	chan->nvsw.sync_sequence = ~0;
+
+	return 0;
+}
+
+int
+nv10_graph_nvsw_flush_semaphore_fence_sequence(struct nouveau_channel *chan,
+				int grclass, int mthd, uint32_t data)
+{
+	if (!data)
+		return -EINVAL;
+
+	/* This is a fence sequence from *another* channel. */
+	chan->nvsw.sync_sequence = data;
+
+	return 0;
+}
+
+int
+nv10_graph_nvsw_flush_semaphore_pre_acquire(struct nouveau_channel *chan,
+				int grclass, int mthd, uint32_t data)
+{
+	return nouveau_fence_semaphore_pre_acquire(chan, data);
+}
+
+int
+nv10_graph_nvsw_flush_semaphore_flush(struct nouveau_channel *chan, int grclass,
+			       int mthd, uint32_t data)
+{
+	return nouveau_fence_semaphore_flush(chan, data);
+}
+
+static struct nouveau_pgraph_object_method nv10_graph_nvsw_methods[] = {
+	{ 0x0500, nv10_graph_nvsw_flush_semaphore_notifier },
+	{ 0x0504, nv10_graph_nvsw_flush_semaphore_fence_sequence },
+	{ 0x0508, nv10_graph_nvsw_flush_semaphore_pre_acquire },
+	{ 0x050C, nv10_graph_nvsw_flush_semaphore_flush },
+	{}
+};
+
 struct nouveau_pgraph_object_class nv10_graph_grclass[] = {
+	{ 0x506e, true, nv10_graph_nvsw_methods }, /* nvsw */
 	{ 0x0030, false, NULL }, /* null */
 	{ 0x0039, false, NULL }, /* m2mf */
 	{ 0x004a, false, NULL }, /* gdirect */
diff --git a/drivers/gpu/drm/nouveau/nv20_graph.c b/drivers/gpu/drm/nouveau/nv20_graph.c
index d6fc0a8..7adcdd3 100644
--- a/drivers/gpu/drm/nouveau/nv20_graph.c
+++ b/drivers/gpu/drm/nouveau/nv20_graph.c
@@ -730,7 +730,16 @@ nv30_graph_init(struct drm_device *dev)
 	return 0;
 }
 
+static struct nouveau_pgraph_object_method nv20_graph_nvsw_methods[] = {
+	{ 0x0500, nv10_graph_nvsw_flush_semaphore_notifier },
+	{ 0x0504, nv10_graph_nvsw_flush_semaphore_fence_sequence },
+	{ 0x0508, nv10_graph_nvsw_flush_semaphore_pre_acquire },
+	{ 0x050C, nv10_graph_nvsw_flush_semaphore_flush },
+	{}
+};
+
 struct nouveau_pgraph_object_class nv20_graph_grclass[] = {
+	{ 0x506e, true, nv20_graph_nvsw_methods }, /* nvsw */
 	{ 0x0030, false, NULL }, /* null */
 	{ 0x0039, false, NULL }, /* m2mf */
 	{ 0x004a, false, NULL }, /* gdirect */
@@ -751,6 +760,7 @@ struct nouveau_pgraph_object_class nv20_graph_grclass[] = {
 };
 
 struct nouveau_pgraph_object_class nv30_graph_grclass[] = {
+	{ 0x506e, true, nv20_graph_nvsw_methods }, /* nvsw */
 	{ 0x0030, false, NULL }, /* null */
 	{ 0x0039, false, NULL }, /* m2mf */
 	{ 0x004a, false, NULL }, /* gdirect */
diff --git a/drivers/gpu/drm/nouveau/nv40_graph.c b/drivers/gpu/drm/nouveau/nv40_graph.c
index 53e8afe..835e352 100644
--- a/drivers/gpu/drm/nouveau/nv40_graph.c
+++ b/drivers/gpu/drm/nouveau/nv40_graph.c
@@ -383,7 +383,16 @@ void nv40_graph_takedown(struct drm_device *dev)
 	nouveau_grctx_fini(dev);
 }
 
+static struct nouveau_pgraph_object_method nv40_graph_nvsw_methods[] = {
+	{ 0x0500, nv10_graph_nvsw_flush_semaphore_notifier },
+	{ 0x0504, nv10_graph_nvsw_flush_semaphore_fence_sequence },
+	{ 0x0508, nv10_graph_nvsw_flush_semaphore_pre_acquire },
+	{ 0x050C, nv10_graph_nvsw_flush_semaphore_flush },
+	{}
+};
+
 struct nouveau_pgraph_object_class nv40_graph_grclass[] = {
+	{ 0x506e, true, nv40_graph_nvsw_methods }, /* nvsw */
 	{ 0x0030, false, NULL }, /* null */
 	{ 0x0039, false, NULL }, /* m2mf */
 	{ 0x004a, false, NULL }, /* gdirect */
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index ca79f32..444a46b 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -372,6 +372,10 @@ static struct nouveau_pgraph_object_method nv50_graph_nvsw_methods[] = {
 	{ 0x0400, nv50_graph_nvsw_vblsem_offset },
 	{ 0x0404, nv50_graph_nvsw_vblsem_release_val },
 	{ 0x0408, nv50_graph_nvsw_vblsem_release },
+	{ 0x0500, nv10_graph_nvsw_flush_semaphore_notifier },
+	{ 0x0504, nv10_graph_nvsw_flush_semaphore_fence_sequence },
+	{ 0x0508, nv10_graph_nvsw_flush_semaphore_pre_acquire },
+	{ 0x050C, nv10_graph_nvsw_flush_semaphore_flush },
 	{}
 };
 
-- 
1.6.6.rc4

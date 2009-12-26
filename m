From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/5] drm/nv50: synchronize user channel after
	buffer object move on kernel channel
Date: Sat, 26 Dec 2009 22:43:08 +0100
Message-ID: <1261863788-8318-5-git-send-email-madman2003@gmail.com>
References: <1261863788-8318-1-git-send-email-madman2003@gmail.com>
	<1261863788-8318-2-git-send-email-madman2003@gmail.com>
	<1261863788-8318-3-git-send-email-madman2003@gmail.com>
	<1261863788-8318-4-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1261863788-8318-4-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- This is not yet a generic implementation that will work everywhere, but it's
a start.
- This will fix the corruption surrounding pixmap/texture bo moves on nv50.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c      |    7 ++
 drivers/gpu/drm/nouveau/nouveau_channel.c |    9 ++-
 drivers/gpu/drm/nouveau/nouveau_dma.c     |   26 +++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h     |   11 ++-
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   11 +++
 drivers/gpu/drm/nouveau/nouveau_fence.c   |  103 +++++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_object.c  |    2 +-
 drivers/gpu/drm/nouveau/nv50_graph.c      |   16 +++++
 8 files changed, 179 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 8143612..cd4986a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -474,6 +474,13 @@ nouveau_bo_move_accel_cleanup(struct nouveau_channel *chan,
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 9aaa972..c1ac34b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -414,7 +414,14 @@ nouveau_ioctl_fifo_alloc(struct drm_device *dev, void *data,
 		init->subchan[0].grclass = 0x0039;
 	else
 		init->subchan[0].grclass = 0x5039;
-	init->nr_subchan = 1;
+	if (dev_priv->card_type >= NV_50) {
+		init->subchan[1].handle = NvSw;
+		init->subchan[1].grclass = NV50_NVSW;
+	}
+	if (dev_priv->card_type < NV_50)
+		init->nr_subchan = 1;
+	else
+		init->nr_subchan = 2;
 
 	/* Named memory object area */
 	ret = drm_gem_handle_create(file_priv, chan->notifier_bo->gem,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 7035536..7e66cc8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -52,6 +52,23 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	/* Allocate what we need for (simple) cross channel synchronisation. */
+	if (dev_priv->card_type >= NV_50) {
+		struct nouveau_gpuobj *nvsw = NULL;
+
+		ret = nouveau_gpuobj_sw_new(chan, NV50_NVSW, &nvsw);
+		if (ret)
+			return ret;
+
+		ret = nouveau_gpuobj_ref_add(dev, chan, NvSw, nvsw, NULL);
+		if (ret)
+			return ret;
+
+		ret = nouveau_notifier_alloc(chan, NvNotify1, 32, &chan->sync_ntfy);
+		if (ret)
+			return ret;
+	}
+
 	/* Map push buffer */
 	ret = nouveau_bo_map(chan->pushbuf_bo);
 	if (ret)
@@ -87,6 +104,15 @@ nouveau_dma_init(struct nouveau_channel *chan)
 	BEGIN_RING(chan, NvSubM2MF, NV_MEMORY_TO_MEMORY_FORMAT_DMA_NOTIFY, 1);
 	OUT_RING(chan, NvNotify0);
 
+	/* Bind NvSw to channel. */
+	if (dev_priv->card_type >= NV_50) {
+		ret = RING_SPACE(chan, 2);
+		if (ret)
+			return ret;
+		BEGIN_RING(chan, NvSubSw, 0, 1);
+		OUT_RING(chan, NvSw);
+	}
+
 	/* Sit back and pray the channel works.. */
 	FIRE_RING(chan);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 04e85d8..3c74902 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -46,10 +46,11 @@
 /* Hardcoded object assignments to subchannels (subchannel id). */
 enum {
 	NvSubM2MF	= 0,
-	NvSub2D		= 1,
-	NvSubCtxSurf2D  = 1,
-	NvSubGdiRect    = 2,
-	NvSubImageBlit  = 3
+	NvSubSw            = 1,
+	NvSub2D		= 2,
+	NvSubCtxSurf2D  = 2,
+	NvSubGdiRect    = 3,
+	NvSubImageBlit  = 4
 };
 
 /* Object handles. */
@@ -67,6 +68,8 @@ enum {
 	NvClipRect	= 0x8000000b,
 	NvGdiRect	= 0x8000000c,
 	NvImageBlit	= 0x8000000d,
+	NvSw		= 0x8000000e,
+	NvNotify1		= 0x8000000f,
 
 	/* G80+ display objects */
 	NvEvoVRAM	= 0x01000000,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index ed9bb0d..1857b79 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -230,6 +230,7 @@ struct nouveau_channel {
 
 	/* GPU object info for stuff used in-kernel (mm_enabled) */
 	uint32_t m2mf_ntfy;
+	uint32_t sync_ntfy;
 	uint32_t vram_handle;
 	uint32_t gart_handle;
 	bool accel_done;
@@ -790,6 +791,8 @@ extern int nouveau_gpuobj_gart_dma_new(struct nouveau_channel *,
 				       uint32_t *o_ret);
 extern int nouveau_gpuobj_gr_new(struct nouveau_channel *, int class,
 				 struct nouveau_gpuobj **);
+extern int nouveau_gpuobj_sw_new(struct nouveau_channel *, int class,
+				 struct nouveau_gpuobj **);
 extern int nouveau_ioctl_grobj_alloc(struct drm_device *, void *data,
 				     struct drm_file *);
 extern int nouveau_ioctl_gpuobj_free(struct drm_device *, void *data,
@@ -1134,6 +1137,12 @@ extern int nouveau_fence_flush(void *obj, void *arg);
 extern void nouveau_fence_unref(void **obj);
 extern void *nouveau_fence_ref(void *obj);
 extern void nouveau_fence_handler(struct drm_device *dev, int channel);
+extern int nouveau_fence_sync(struct nouveau_channel *chan,
+				struct nouveau_fence *fence);
+extern int nouveau_fence_semaphore_pre_acquire(struct nouveau_channel *chan,
+				int sequence);
+extern int nouveau_fence_semaphore_flush(struct nouveau_channel *chan,
+				int channel);
 
 /* nouveau_gem.c */
 extern int nouveau_gem_new(struct drm_device *, struct nouveau_channel *,
@@ -1341,5 +1350,7 @@ nv_two_reg_pll(struct drm_device *dev)
 #define NV50_NVSW_VBLSEM_OFFSET                                      0x00000400
 #define NV50_NVSW_VBLSEM_RELEASE_VALUE                               0x00000404
 #define NV50_NVSW_VBLSEM_RELEASE                                     0x00000408
+#define NV50_NVSW_SEMAPHORE_PRE_ACQUIRE                       0x00000500
+#define NV50_NVSW_SEMAPHORE_FLUSH                                  0x00000504
 
 #endif /* __NOUVEAU_DRV_H__ */
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index dacac9a..ba1818d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -260,3 +260,106 @@ nouveau_fence_fini(struct nouveau_channel *chan)
 	}
 }
 
+/* This mechanism relies on having a single notifier for synchronisation between
+ * 2 channels, in this case the kernel channel and one user channel.
+ */
+int
+nouveau_fence_sync(struct nouveau_channel *chan, struct nouveau_fence *fence)
+{
+	int ret;
+
+	if (!chan || !fence)
+		return -EINVAL;
+
+	if (!fence->sequence)
+		nouveau_fence_emit(fence);
+
+	ret = RING_SPACE(chan, 9);
+	if (ret)
+		return ret;
+
+	ret = RING_SPACE(fence->channel, 2);
+	if (ret)
+		return ret;
+
+	/* Setup semaphore. */
+	BEGIN_RING(chan, NvSubSw, NV50_NVSW_DMA_SEMAPHORE, 2);
+	OUT_RING(chan, NvNotify1);
+	OUT_RING(chan, 0);
+	/* Set initial value. */
+	BEGIN_RING(chan, NvSubSw, NV50_NVSW_SEMAPHORE_RELEASE, 1);
+	OUT_RING(chan, 0x22222222);
+	/* Set end value if fence has already passed. */
+	BEGIN_RING(chan, NvSubSw, NV50_NVSW_SEMAPHORE_PRE_ACQUIRE, 1);
+	OUT_RING(chan, fence->sequence);
+	/* Wait for condition to become true. */
+	BEGIN_RING(chan, NvSubSw, NV50_NVSW_SEMAPHORE_ACQUIRE, 1);
+	OUT_RING(chan, 0x11111111);
+
+	/* Write to user semaphore notifier. */
+	BEGIN_RING(fence->channel, NvSubSw, NV50_NVSW_SEMAPHORE_FLUSH, 1);
+	OUT_RING(fence->channel, chan->id);
+	FIRE_RING(fence->channel);
+
+	return 0;
+}
+
+int
+nouveau_fence_semaphore_pre_acquire(struct nouveau_channel *chan, int sequence)
+{
+	struct drm_device *dev = chan->dev;
+	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	struct nouveau_channel *kchan = dev_priv->channel;
+	struct nouveau_gpuobj_ref *ref = NULL;
+	uint32_t offset = 0;
+
+	spin_lock_irq(&kchan->fence.lock);
+	nouveau_fence_update(kchan);
+	spin_unlock_irq(&kchan->fence.lock);
+
+	if (nouveau_gpuobj_ref_find(chan, NvNotify1, &ref))
+		return -ENOENT;
+
+	if (nouveau_notifier_offset(ref->gpuobj, &offset))
+		return -EINVAL;
+
+	if (sequence > kchan->fence.sequence_ack) /* not done */
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
+	struct nouveau_channel *uchan = NULL;
+	struct nouveau_gpuobj_ref *ref = NULL;
+	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
+	uint32_t offset = 0;
+
+	if (channel < 0 || channel >= pfifo->channels)
+		return -EINVAL;
+
+	uchan = dev_priv->fifos[channel];
+
+	if (nouveau_gpuobj_ref_find(uchan, NvNotify1, &ref))
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
+	nouveau_bo_wr32(uchan->notifier_bo, offset >> 2, 0x11111111);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 93379bb..6c2cf81 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -881,7 +881,7 @@ nouveau_gpuobj_gr_new(struct nouveau_channel *chan, int class,
 	return 0;
 }
 
-static int
+int
 nouveau_gpuobj_sw_new(struct nouveau_channel *chan, int class,
 		      struct nouveau_gpuobj **gpuobj_ret)
 {
diff --git a/drivers/gpu/drm/nouveau/nv50_graph.c b/drivers/gpu/drm/nouveau/nv50_graph.c
index ca79f32..9585537 100644
--- a/drivers/gpu/drm/nouveau/nv50_graph.c
+++ b/drivers/gpu/drm/nouveau/nv50_graph.c
@@ -367,11 +367,27 @@ nv50_graph_nvsw_vblsem_release(struct nouveau_channel *chan, int grclass,
 	return 0;
 }
 
+static int
+nv50_graph_semaphore_pre_acquire(struct nouveau_channel *chan, int grclass,
+			       int mthd, uint32_t data)
+{
+	return nouveau_fence_semaphore_pre_acquire(chan, data);
+}
+
+static int
+nv50_graph_semaphore_flush(struct nouveau_channel *chan, int grclass,
+			       int mthd, uint32_t data)
+{
+	return nouveau_fence_semaphore_flush(chan, data);
+}
+
 static struct nouveau_pgraph_object_method nv50_graph_nvsw_methods[] = {
 	{ 0x018c, nv50_graph_nvsw_dma_vblsem },
 	{ 0x0400, nv50_graph_nvsw_vblsem_offset },
 	{ 0x0404, nv50_graph_nvsw_vblsem_release_val },
 	{ 0x0408, nv50_graph_nvsw_vblsem_release },
+	{ 0x0500, nv50_graph_semaphore_pre_acquire },
+	{ 0x0504, nv50_graph_semaphore_flush },
 	{}
 };
 
-- 
1.6.6.rc4

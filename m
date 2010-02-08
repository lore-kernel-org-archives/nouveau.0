From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: don't hold spin lock while calling
	kzalloc with GFP_KERNEL
Date: Mon,  8 Feb 2010 18:38:18 +0100
Message-ID: <1265650698-4773-1-git-send-email-madman2003@gmail.com>
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

- Marcin Slusarz pointed out that this triggers a BUG_ON, because kzalloc could
sleep.
- The irq handler should restore the value NV03_PFIFO_CACHES, but still it's
better if this stuff doesn't happen in the middle of fifo create context. I see
no reason in spin locking pgraph create context, it isn't activated at that
stage.
- Move and rename the lock after some discussion with Marcin, even better
naming suggestions are appreciated.

Tested-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    9 ++-------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    4 +++-
 drivers/gpu/drm/nouveau/nouveau_irq.c     |    4 ++--
 drivers/gpu/drm/nouveau/nouveau_state.c   |    2 +-
 drivers/gpu/drm/nouveau/nv04_fifo.c       |    5 +++++
 drivers/gpu/drm/nouveau/nv40_fifo.c       |    5 +++++
 drivers/gpu/drm/nouveau/nv50_fifo.c       |    5 +++++
 7 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index d25ed61..f7ca950 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -113,7 +113,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
 	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
 	struct nouveau_channel *chan;
-	unsigned long flags;
 	int channel, user;
 	int ret;
 
@@ -204,8 +203,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 		return ret;
 	}
 
-	spin_lock_irqsave(&dev_priv->engine.lock, flags);
-
 	/* disable the fifo caches */
 	pfifo->reassign(dev, false);
 
@@ -225,8 +222,6 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 
 	pfifo->reassign(dev, true);
 
-	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
-
 	ret = nouveau_dma_init(chan);
 	if (!ret)
 		ret = nouveau_fence_init(chan);
@@ -290,7 +285,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	if (pgraph->channel(dev) == chan)
 		nouveau_wait_for_idle(dev);
 
-	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
 
 	pgraph->fifo_access(dev, false);
 	if (pgraph->channel(dev) == chan)
@@ -307,7 +302,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
 
 	pfifo->reassign(dev, true);
 
-	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 
 	/* Release the channel's resources */
 	nouveau_gpuobj_ref_del(dev, &chan->pushbuf);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 64987a9..ea55a41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -358,7 +358,6 @@ struct nouveau_engine {
 	struct nouveau_fb_engine      fb;
 	struct nouveau_pgraph_engine  graph;
 	struct nouveau_fifo_engine    fifo;
-	spinlock_t lock;
 };
 
 struct nouveau_pll_vals {
@@ -534,6 +533,9 @@ struct drm_nouveau_private {
 	struct nouveau_engine engine;
 	struct nouveau_channel *channel;
 
+	/* For PFIFO and PGRAPH. */
+	spinlock_t context_switch_lock;
+
 	/* RAMIN configuration, RAMFC, RAMHT and RAMRO offsets */
 	struct nouveau_gpuobj *ramht;
 	uint32_t ramin_rsvd_vram;
diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouveau/nouveau_irq.c
index cffc9bc..95220dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_irq.c
+++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
@@ -697,7 +697,7 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
 	if (!status)
 		return IRQ_NONE;
 
-	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
 
 	if (dev_priv->fbdev_info) {
 		fbdev_flags = dev_priv->fbdev_info->flags;
@@ -736,7 +736,7 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
 	if (dev_priv->fbdev_info)
 		dev_priv->fbdev_info->flags = fbdev_flags;
 
-	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index 3586667..0a2a437 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -383,7 +383,7 @@ nouveau_card_init(struct drm_device *dev)
 		goto out;
 	engine = &dev_priv->engine;
 	dev_priv->init_state = NOUVEAU_CARD_INIT_FAILED;
-	spin_lock_init(&dev_priv->engine.lock);
+	spin_lock_init(&dev_priv->context_switch_lock);
 
 	/* Parse BIOS tables / Run init tables if card not POSTed */
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
diff --git a/drivers/gpu/drm/nouveau/nv04_fifo.c b/drivers/gpu/drm/nouveau/nv04_fifo.c
index f31347b..66fe559 100644
--- a/drivers/gpu/drm/nouveau/nv04_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv04_fifo.c
@@ -117,6 +117,7 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
 {
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
+	unsigned long flags;
 	int ret;
 
 	ret = nouveau_gpuobj_new_fake(dev, NV04_RAMFC(chan->id), ~0,
@@ -127,6 +128,8 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
+
 	/* Setup initial state */
 	dev_priv->engine.instmem.prepare_access(dev, true);
 	RAMFC_WR(DMA_PUT, chan->pushbuf_base);
@@ -144,6 +147,8 @@ nv04_fifo_create_context(struct nouveau_channel *chan)
 	/* enable the fifo dma operation */
 	nv_wr32(dev, NV04_PFIFO_MODE,
 		nv_rd32(dev, NV04_PFIFO_MODE) | (1 << chan->id));
+
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv40_fifo.c b/drivers/gpu/drm/nouveau/nv40_fifo.c
index b4f19cc..6b2ef4a 100644
--- a/drivers/gpu/drm/nouveau/nv40_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv40_fifo.c
@@ -37,6 +37,7 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	uint32_t fc = NV40_RAMFC(chan->id);
+	unsigned long flags;
 	int ret;
 
 	ret = nouveau_gpuobj_new_fake(dev, NV40_RAMFC(chan->id), ~0,
@@ -45,6 +46,8 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
+
 	dev_priv->engine.instmem.prepare_access(dev, true);
 	nv_wi32(dev, fc +  0, chan->pushbuf_base);
 	nv_wi32(dev, fc +  4, chan->pushbuf_base);
@@ -63,6 +66,8 @@ nv40_fifo_create_context(struct nouveau_channel *chan)
 	/* enable the fifo dma operation */
 	nv_wr32(dev, NV04_PFIFO_MODE,
 		nv_rd32(dev, NV04_PFIFO_MODE) | (1 << chan->id));
+
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv50_fifo.c b/drivers/gpu/drm/nouveau/nv50_fifo.c
index 204a79f..369ecb4 100644
--- a/drivers/gpu/drm/nouveau/nv50_fifo.c
+++ b/drivers/gpu/drm/nouveau/nv50_fifo.c
@@ -243,6 +243,7 @@ nv50_fifo_create_context(struct nouveau_channel *chan)
 	struct drm_device *dev = chan->dev;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_gpuobj *ramfc = NULL;
+	unsigned long flags;
 	int ret;
 
 	NV_DEBUG(dev, "ch%d\n", chan->id);
@@ -278,6 +279,8 @@ nv50_fifo_create_context(struct nouveau_channel *chan)
 			return ret;
 	}
 
+	spin_lock_irqsave(&dev_priv->context_switch_lock, flags);
+
 	dev_priv->engine.instmem.prepare_access(dev, true);
 
 	nv_wo32(dev, ramfc, 0x08/4, chan->pushbuf_base);
@@ -306,10 +309,12 @@ nv50_fifo_create_context(struct nouveau_channel *chan)
 	ret = nv50_fifo_channel_enable(dev, chan->id, false);
 	if (ret) {
 		NV_ERROR(dev, "error enabling ch%d: %d\n", chan->id, ret);
+		spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 		nouveau_gpuobj_ref_del(dev, &chan->ramfc);
 		return ret;
 	}
 
+	spin_unlock_irqrestore(&dev_priv->context_switch_lock, flags);
 	return 0;
 }
 
-- 
1.6.6.1

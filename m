From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 4/6] drm/nouveau: protect channel create/destroy
	and irq handler with a spin lock
Date: Tue,  2 Feb 2010 22:36:03 +0100
Message-ID: <1265146565-6048-4-git-send-email-madman2003@gmail.com>
References: <1265146565-6048-1-git-send-email-madman2003@gmail.com>
	<1265146565-6048-2-git-send-email-madman2003@gmail.com>
	<1265146565-6048-3-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265146565-6048-3-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

- The nv50 pgraph handler (for example) could reenable pgraph fifo access and
that would be bad when pgraph context is being unloaded (we need the garuantee
a ctxprog isn't running).

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    1 +
 drivers/gpu/drm/nouveau/nouveau_irq.c     |    5 +++++
 drivers/gpu/drm/nouveau/nouveau_state.c   |    1 +
 4 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 2281f99..86399f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -113,6 +113,7 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
 	struct nouveau_fifo_engine *pfifo = &dev_priv->engine.fifo;
 	struct nouveau_channel *chan;
+	unsigned long flags;
 	int channel, user;
 	int ret;
 
@@ -203,6 +204,8 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 		return ret;
 	}
 
+	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+
 	/* disable the fifo caches */
 	pfifo->reassign(dev, false);
 
@@ -222,6 +225,8 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
 
 	pfifo->reassign(dev, true);
 
+	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
+
 	ret = nouveau_dma_init(chan);
 	if (!ret)
 		ret = nouveau_fence_init(chan);
@@ -275,6 +280,8 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	 */
 	nouveau_fence_fini(chan);
 
+	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+
 	/* Ensure the channel is no longer active on the GPU */
 	pfifo->reassign(dev, false);
 
@@ -293,6 +300,8 @@ nouveau_channel_free(struct nouveau_channel *chan)
 
 	pfifo->reassign(dev, true);
 
+	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
+
 	/* Release the channel's resources */
 	nouveau_gpuobj_ref_del(dev, &chan->pushbuf);
 	if (chan->pushbuf_bo) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 5445cef..64987a9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -358,6 +358,7 @@ struct nouveau_engine {
 	struct nouveau_fb_engine      fb;
 	struct nouveau_pgraph_engine  graph;
 	struct nouveau_fifo_engine    fifo;
+	spinlock_t lock;
 };
 
 struct nouveau_pll_vals {
diff --git a/drivers/gpu/drm/nouveau/nouveau_irq.c b/drivers/gpu/drm/nouveau/nouveau_irq.c
index baa9b3e..3e46b85 100644
--- a/drivers/gpu/drm/nouveau/nouveau_irq.c
+++ b/drivers/gpu/drm/nouveau/nouveau_irq.c
@@ -678,11 +678,14 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
 	struct drm_device *dev = (struct drm_device *)arg;
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	uint32_t status, fbdev_flags = 0;
+	unsigned long flags;
 
 	status = nv_rd32(dev, NV03_PMC_INTR_0);
 	if (!status)
 		return IRQ_NONE;
 
+	spin_lock_irqsave(&dev_priv->engine.lock, flags);
+
 	if (dev_priv->fbdev_info) {
 		fbdev_flags = dev_priv->fbdev_info->flags;
 		dev_priv->fbdev_info->flags |= FBINFO_HWACCEL_DISABLED;
@@ -720,5 +723,7 @@ nouveau_irq_handler(DRM_IRQ_ARGS)
 	if (dev_priv->fbdev_info)
 		dev_priv->fbdev_info->flags = fbdev_flags;
 
+	spin_unlock_irqrestore(&dev_priv->engine.lock, flags);
+
 	return IRQ_HANDLED;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
index fcd7610..3586667 100644
--- a/drivers/gpu/drm/nouveau/nouveau_state.c
+++ b/drivers/gpu/drm/nouveau/nouveau_state.c
@@ -383,6 +383,7 @@ nouveau_card_init(struct drm_device *dev)
 		goto out;
 	engine = &dev_priv->engine;
 	dev_priv->init_state = NOUVEAU_CARD_INIT_FAILED;
+	spin_lock_init(&dev_priv->engine.lock);
 
 	/* Parse BIOS tables / Run init tables if card not POSTed */
 	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
-- 
1.6.6.1

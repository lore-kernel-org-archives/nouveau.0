From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: reduce usage of fence spinlock to
	when absolutely necessary
Date: Mon, 31 May 2010 13:45:13 +1000
Message-ID: <1275277513-10869-1-git-send-email-skeggsb@gmail.com>
References: <AANLkTinpR2n_Gnd_Uhd8zr3_o1W1kbrEYqm3qSCNz_rI@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinpR2n_Gnd_Uhd8zr3_o1W1kbrEYqm3qSCNz_rI-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_channel.c |    2 -
 drivers/gpu/drm/nouveau/nouveau_drv.h     |    3 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c   |   31 +++++-----------------------
 drivers/gpu/drm/nouveau/nv04_graph.c      |    3 +-
 4 files changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
index 1fc57ef..f9b2acf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_channel.c
+++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
@@ -257,9 +257,7 @@ nouveau_channel_free(struct nouveau_channel *chan)
 	nouveau_debugfs_channel_fini(chan);
 
 	/* Give outstanding push buffers a chance to complete */
-	spin_lock_irqsave(&chan->fence.lock, flags);
 	nouveau_fence_update(chan);
-	spin_unlock_irqrestore(&chan->fence.lock, flags);
 	if (chan->fence.sequence != chan->fence.sequence_ack) {
 		struct nouveau_fence *fence = NULL;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 9eff502..75b1ea7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -196,7 +196,7 @@ struct nouveau_channel {
 		struct list_head pending;
 		uint32_t sequence;
 		uint32_t sequence_ack;
-		uint32_t last_sequence_irq;
+		atomic_t last_sequence_irq;
 	} fence;
 
 	/* DMA push buffer */
@@ -1141,7 +1141,6 @@ extern int nouveau_fence_wait(void *obj, void *arg, bool lazy, bool intr);
 extern int nouveau_fence_flush(void *obj, void *arg);
 extern void nouveau_fence_unref(void **obj);
 extern void *nouveau_fence_ref(void *obj);
-extern void nouveau_fence_handler(struct drm_device *dev, int channel);
 
 /* nouveau_gem.c */
 extern int nouveau_gem_new(struct drm_device *, struct nouveau_channel *,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index faddf53..813d853 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -67,12 +67,13 @@ nouveau_fence_update(struct nouveau_channel *chan)
 	if (USE_REFCNT)
 		sequence = nvchan_rd32(chan, 0x48);
 	else
-		sequence = chan->fence.last_sequence_irq;
+		sequence = atomic_read(&chan->fence.last_sequence_irq);
 
 	if (chan->fence.sequence_ack == sequence)
 		return;
 	chan->fence.sequence_ack = sequence;
 
+	spin_lock(&chan->fence.lock);
 	list_for_each_safe(entry, tmp, &chan->fence.pending) {
 		fence = list_entry(entry, struct nouveau_fence, entry);
 
@@ -84,6 +85,7 @@ nouveau_fence_update(struct nouveau_channel *chan)
 		if (sequence == chan->fence.sequence_ack)
 			break;
 	}
+	spin_unlock(&chan->fence.lock);
 }
 
 int
@@ -119,7 +121,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 {
 	struct drm_nouveau_private *dev_priv = fence->channel->dev->dev_private;
 	struct nouveau_channel *chan = fence->channel;
-	unsigned long flags;
 	int ret;
 
 	ret = RING_SPACE(chan, 2);
@@ -127,9 +128,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 		return ret;
 
 	if (unlikely(chan->fence.sequence == chan->fence.sequence_ack - 1)) {
-		spin_lock_irqsave(&chan->fence.lock, flags);
 		nouveau_fence_update(chan);
-		spin_unlock_irqrestore(&chan->fence.lock, flags);
 
 		BUG_ON(chan->fence.sequence ==
 		       chan->fence.sequence_ack - 1);
@@ -138,9 +137,9 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	fence->sequence = ++chan->fence.sequence;
 
 	kref_get(&fence->refcount);
-	spin_lock_irqsave(&chan->fence.lock, flags);
+	spin_lock(&chan->fence.lock);
 	list_add_tail(&fence->entry, &chan->fence.pending);
-	spin_unlock_irqrestore(&chan->fence.lock, flags);
+	spin_unlock(&chan->fence.lock);
 
 	BEGIN_RING(chan, NvSubSw, USE_REFCNT ? 0x0050 : 0x0150, 1);
 	OUT_RING(chan, fence->sequence);
@@ -173,14 +172,11 @@ nouveau_fence_signalled(void *sync_obj, void *sync_arg)
 {
 	struct nouveau_fence *fence = nouveau_fence(sync_obj);
 	struct nouveau_channel *chan = fence->channel;
-	unsigned long flags;
 
 	if (fence->signalled)
 		return true;
 
-	spin_lock_irqsave(&chan->fence.lock, flags);
 	nouveau_fence_update(chan);
-	spin_unlock_irqrestore(&chan->fence.lock, flags);
 	return fence->signalled;
 }
 
@@ -221,27 +217,12 @@ nouveau_fence_flush(void *sync_obj, void *sync_arg)
 	return 0;
 }
 
-void
-nouveau_fence_handler(struct drm_device *dev, int channel)
-{
-	struct drm_nouveau_private *dev_priv = dev->dev_private;
-	struct nouveau_channel *chan = NULL;
-
-	if (channel >= 0 && channel < dev_priv->engine.fifo.channels)
-		chan = dev_priv->fifos[channel];
-
-	if (chan) {
-		spin_lock_irq(&chan->fence.lock);
-		nouveau_fence_update(chan);
-		spin_unlock_irq(&chan->fence.lock);
-	}
-}
-
 int
 nouveau_fence_init(struct nouveau_channel *chan)
 {
 	INIT_LIST_HEAD(&chan->fence.pending);
 	spin_lock_init(&chan->fence.lock);
+	atomic_set(&chan->fence.last_sequence_irq, 0);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nv04_graph.c b/drivers/gpu/drm/nouveau/nv04_graph.c
index 618355e..2097b3c 100644
--- a/drivers/gpu/drm/nouveau/nv04_graph.c
+++ b/drivers/gpu/drm/nouveau/nv04_graph.c
@@ -527,8 +527,7 @@ static int
 nv04_graph_mthd_set_ref(struct nouveau_channel *chan, int grclass,
 			int mthd, uint32_t data)
 {
-	chan->fence.last_sequence_irq = data;
-	nouveau_fence_handler(chan->dev, chan->id);
+	atomic_set(&chan->fence.last_sequence_irq, data);
 	return 0;
 }
 
-- 
1.7.0.1

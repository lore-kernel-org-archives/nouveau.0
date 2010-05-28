From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Why do we disable local IRQ around
 nouveau_fence_update?
Date: Fri, 28 May 2010 15:47:15 +1000
Message-ID: <1275025635.16293.4.camel@nisroch>
References: <AANLkTin3y9CCtEyiYmtKj4GNvVLQQVj4aa2gU78-TE6n@mail.gmail.com>
	<20100527175556.4c83819d@daedalus.pq.iki.fi>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-loLHVkCauo2wO0nG4uT+"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100527175556.4c83819d-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--=-loLHVkCauo2wO0nG4uT+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-05-27 at 17:55 +0300, Pekka Paalanen wrote:
> On Wed, 26 May 2010 23:24:57 +0200
> Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> > For NV04 i can understand, since it's irq driven fences, so let's
> > split the question.
> > 
> > NV10+: can we reduce it to just spin_lock?
> 
> I don't know the answer, but I know the theory: if there is
> any path, that can take the spinlock from an interrupt
> service path, then you must use the irq-safe version everywhere.
We could, the interrupt-based path is currently only used on really old
chips that don't have REF_CNT.

> 
> > NV04: can't we rely on a normal spin lock and add it as well in
> > nv04_graph_mthd_set_ref?
> 
> So if NV04 fences are driven by irqs, and the ISR needs to
> take the lock, then no, you cannot revert to irq-unsafe spinlocks.
> I'm not sure how it relates to ISR bottom halves, though.
> 
> Note, that also irq-unsafe spinlocks disable preemption, which
> might be enough to disturb audio.
The spinlock was actually only ever meant to protect the list itself and
not the sequence counters.

I've attached a patch removing the spinlock use everywhere except when
we're actually going to touch the pending list, I think
last_sequence_irq is still safe as the NV04 fence IRQ handler is the
only writer.

I haven't tested beyond knowing this laptop I'm typing on still works.

Thoughts?

> 
> 
> my 2c
> 


--=-loLHVkCauo2wO0nG4uT+
Content-Disposition: attachment; filename="fence.patch"
Content-Type: text/x-patch; name="fence.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

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
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index faddf53..4031998 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -73,6 +73,7 @@ nouveau_fence_update(struct nouveau_channel *chan)
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
 
@@ -230,11 +226,10 @@ nouveau_fence_handler(struct drm_device *dev, int channel)
 	if (channel >= 0 && channel < dev_priv->engine.fifo.channels)
 		chan = dev_priv->fifos[channel];
 
-	if (chan) {
-		spin_lock_irq(&chan->fence.lock);
-		nouveau_fence_update(chan);
-		spin_unlock_irq(&chan->fence.lock);
-	}
+	if (!chan)
+		return;
+
+	chan->fence.last_sequence_irq++;
 }
 
 int

--=-loLHVkCauo2wO0nG4uT+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-loLHVkCauo2wO0nG4uT+--

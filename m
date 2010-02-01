From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH 3/3] drm/nouveau: use semaphores for fully on-GPU
	interchannel synchronization
Date: Mon,  1 Feb 2010 10:51:07 +0100
Message-ID: <1265017867-13411-1-git-send-email-luca@luca-barbieri.com>
References: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1265017810-13354-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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
Cc: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This patch implements the nouveau_fence_sync interface introduced
in the first patch using dynamically allocated semaphores,
introduced in the second patch.

This is tested on NV40, but should work on NV17-NV50 (previous cards
will just fallback to CPU waiting).
Make sure you are using the latest Nouveau git, as it contains critical
semaphore support.

Unlike a previously posted patch, this patch does not make any use of
software methods and is designed to do all the work on the GPU, and be
as fast as possible.

To perform inter-channel synchronization, commands are emitted on
both channels involved.

First, a semaphore is allocated, and a valid handle for it is inserted
in the channel hash table if necessary.

DMA_SEMAPHORE is set only if different from the last used one. This
is usually not the case, and thus SEMAPHORE interrupts only happen
once per channel usually.

After that, SEMAPHORE_OFFSET is set if changed and then either ACQUIRE
or RELEASE is used.

On the waiting channel, a fence is also emitted. Once that fence
expires, the semaphore is released and can be reused for any purpose.

This results in synchronization taking place fully on the GPU, with
no CPU waiting necessary at all.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h   |    5 +
 drivers/gpu/drm/nouveau/nouveau_fence.c |  135 +++++++++++++++++++++++++++++--
 2 files changed, 133 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0a7abc7..c4d6502 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -195,6 +195,8 @@ struct nouveau_channel {
 		uint32_t sequence;
 		uint32_t sequence_ack;
 		uint32_t last_sequence_irq;
+		atomic_t sem_count;
+		unsigned sem_threshold;
 	} fence;
 
 	/* DMA push buffer */
@@ -255,6 +257,9 @@ struct nouveau_channel {
 		char name[32];
 		struct drm_info_list info;
 	} debugfs;
+
+	unsigned sem_handle;
+	unsigned sem_num;
 };
 
 struct nouveau_instmem_engine {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 01152f3..ec33bd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -46,6 +46,9 @@ struct nouveau_fence {
 
 	uint32_t sequence;
 	bool signalled;
+
+	struct nouveau_sem_bo *sem_bo;
+	int sem_num;
 };
 
 static inline struct nouveau_fence *
@@ -275,10 +278,122 @@ nouveau_fence_del(struct kref *ref)
 	kfree(fence);
 }
 
+static inline void
+nouveau_sem_emit(struct nouveau_channel *chan, struct nouveau_sem *sem, unsigned op)
+{
+	uint32_t handle = sem->sem_bo->handle;
+	if (chan->sem_handle != handle) {
+		BEGIN_RING(chan, NvSubSw, NV_SW_DMA_SEMAPHORE, 1);
+		OUT_RING(chan, handle);
+		chan->sem_handle = handle;
+	}
+	if (chan->sem_num != sem->num) {
+		BEGIN_RING(chan, NvSubSw, NV_SW_SEMAPHORE_OFFSET, 1);
+		OUT_RING(chan, sem->num << 2);
+		chan->sem_num = sem->num;
+	}
+	BEGIN_RING(chan, NvSubSw, op, 1);
+	OUT_RING(chan, sem->value);
+}
+
+/* Currently this ignores waited_fence->sequence and syncs the last fence on waited_fence->channel
+ * If a better GPU synchronization mechanism is discovered, then the actual fence may be used.
+ * Note that sem_fence is a fence on the *waiting *channel, used to free the semaphore.
+ */
 struct nouveau_fence*
 nouveau_fence_sync(struct nouveau_fence *waited_fence, struct nouveau_channel *chan)
 {
-	return ERR_PTR(-ENOSYS);
+	struct nouveau_channel *waited_chan;
+	struct drm_device *dev;
+	struct drm_nouveau_private *dev_priv;
+	struct nouveau_sem sem;
+	uint32_t handle;
+	int ret;
+	struct nouveau_fence *sem_fence;
+	unsigned long flags;
+
+	dev = chan->dev;
+	dev_priv = chan->dev->dev_private;
+
+	if (dev_priv->chipset < 0x17)
+		return ERR_PTR(-ENOSYS);
+
+	waited_chan = waited_fence->channel;
+
+	ret = RING_SPACE(chan, 6 + 2);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = RING_SPACE(waited_chan, 6);
+	if (ret)
+		return ERR_PTR(ret);
+
+	/* try to reclaim semaphores when we hit the threshold
+	   this helps keeping a low number of active semaphores
+
+	   Note that in the DRI2 case this is never triggered
+	   since we wait for fences on both channels.
+
+	   However, if buffers were all different, this could be
+	   necessary.
+	*/
+	if (atomic_read(&chan->fence.sem_count) >= chan->fence.sem_threshold) {
+		spin_lock_irqsave(&chan->fence.lock, flags);
+		if (atomic_read(&chan->fence.sem_count) >= chan->fence.sem_threshold)
+			nouveau_fence_update(chan);
+		spin_unlock_irqrestore(&chan->fence.lock, flags);
+	}
+
+	ret = nouveau_fence_new(chan, &sem_fence, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = nouveau_sem_alloc(chan->dev, &sem);
+	if (ret) {
+		kfree(sem_fence);
+		return ERR_PTR(ret);
+	}
+
+	BUG_ON(!sem.sem_bo);
+
+	ret = nouveau_sem_bo_channel_init(sem.sem_bo, chan);
+	if (!ret)
+		ret = nouveau_sem_bo_channel_init(sem.sem_bo, waited_chan);
+	if (ret) {
+		nouveau_sem_release(dev, sem.sem_bo, sem.num);
+		kfree(sem_fence);
+		return ERR_PTR(ret);
+	}
+
+	handle = sem.sem_bo->handle;
+
+/*	NV_DEBUG(dev, "sync %i <- %i with %x:%i (sem %i/%i)\n", chan->id, waited_chan->id, sem.sem_bo->handle, sem.num, atomic_read(&chan->fence.sem_count), chan->fence.sem_threshold); */
+
+	sem_fence->sem_bo = sem.sem_bo;
+	sem_fence->sem_num = sem.num;
+
+	atomic_inc(&chan->fence.sem_count);
+
+/* TODO: this should take the channel locks when they are added */
+	nouveau_sem_emit(chan, &sem, NV_SW_SEMAPHORE_ACQUIRE);
+
+	nouveau_fence_emit(sem_fence);
+
+	nouveau_sem_emit(waited_chan, &sem, NV_SW_SEMAPHORE_RELEASE);
+	FIRE_RING(waited_chan);
+	return sem_fence;
+}
+
+void nouveau_fence_complete(struct nouveau_fence *fence)
+{
+	if (fence->sem_bo) {
+		nouveau_sem_release(fence->channel->dev, fence->sem_bo, fence->sem_num);
+		atomic_dec(&fence->channel->fence.sem_count);
+	}
+
+	fence->signalled = true;
+	list_del(&fence->entry);
+	kref_put(&fence->refcount, nouveau_fence_del);
 }
 
 void
@@ -288,6 +403,7 @@ nouveau_fence_update(struct nouveau_channel *chan)
 	struct list_head *entry, *tmp;
 	struct nouveau_fence *fence;
 	uint32_t sequence;
+	unsigned sem_threshold;
 
 	if (USE_REFCNT)
 		sequence = nvchan_rd32(chan, 0x48);
@@ -302,13 +418,16 @@ nouveau_fence_update(struct nouveau_channel *chan)
 		fence = list_entry(entry, struct nouveau_fence, entry);
 
 		sequence = fence->sequence;
-		fence->signalled = true;
-		list_del(&fence->entry);
-		kref_put(&fence->refcount, nouveau_fence_del);
+		nouveau_fence_complete(fence);
 
 		if (sequence == chan->fence.sequence_ack)
 			break;
 	}
+
+	sem_threshold = atomic_read(&chan->fence.sem_count) * 2;
+	if (sem_threshold < NOUVEAU_SEM_MIN_THRESHOLD)
+		sem_threshold = NOUVEAU_SEM_MIN_THRESHOLD;
+	chan->fence.sem_threshold = sem_threshold;
 }
 
 int
@@ -467,6 +586,10 @@ nouveau_fence_init(struct nouveau_channel *chan)
 {
 	INIT_LIST_HEAD(&chan->fence.pending);
 	spin_lock_init(&chan->fence.lock);
+	atomic_set(&chan->fence.sem_count, 0);
+	chan->fence.sem_threshold = NOUVEAU_SEM_MIN_THRESHOLD;
+	chan->sem_handle = 0;
+	chan->sem_num = ~0;
 	return 0;
 }
 
@@ -479,9 +602,7 @@ nouveau_fence_fini(struct nouveau_channel *chan)
 	list_for_each_safe(entry, tmp, &chan->fence.pending) {
 		fence = list_entry(entry, struct nouveau_fence, entry);
 
-		fence->signalled = true;
-		list_del(&fence->entry);
-		kref_put(&fence->refcount, nouveau_fence_del);
+		nouveau_fence_complete(fence);
 	}
 }
 
-- 
1.6.6.1.476.g01ddb

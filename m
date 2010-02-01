From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] drm/nouveau: add lockless dynamic
 semaphore allocator
Date: Mon, 1 Feb 2010 19:03:43 +0100
Message-ID: <20100201180343.GA2905@joi.lan>
References: <1265017810-13354-1-git-send-email-luca@luca-barbieri.com>
	<1265017810-13354-2-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1265017810-13354-2-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Feb 01, 2010 at 10:50:09AM +0100, Luca Barbieri wrote:
> This patch adds code to allocate semaphores in a dynamic way using
> an algorithm with a lockless fast path.

some minor comments below

> 
> 1. Semaphore BOs
> 
> Semaphore BOs are BOs containing semaphores. Each is 4KB large and
> contains 1024 4-byte semaphores. They are pinned.
> 
> Semaphore BOs are allocated on-demand and freed at device takedown.
> Those that are not fully allocated are kept on a free list.
> 
> Each is assigned an handle. DMA objects and references are created
> on demand for each channel that needs to use a semaphore BO.
> Those objects and references are automatically destroyed at channel
> destruction time.
> 
> Typically only a single semaphore BO will be needed.
> 
> 2. Semaphore allocation
> 
> Each semaphore BO contains a bitmask of free semaphores within the BO.
> Allocation is done in a lockless fashion using a count of free
> semaphores and the bitmask.
> 
> Semaphores are released once the fence on the waiting side passed.
> This is done by adding fields to nouveau_fence.
> 
> Semaphore values are zeroed when the semaphore BO is allocated, and
> are afterwards only modified by the GPU.
> 
> This is performed by storing a bitmask that allows to alternate
> between using the values 0 and 1 for a given semaphore.
> 
> Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dma.h   |    1 +
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |    7 +
>  drivers/gpu/drm/nouveau/nouveau_fence.c |  243 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_state.c |    4 +
>  4 files changed, 255 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
> index dabfd65..0658979 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dma.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
> @@ -69,6 +69,7 @@ enum {
>  	NvGdiRect	= 0x8000000c,
>  	NvImageBlit	= 0x8000000d,
>  	NvSw		= 0x8000000e,
> +	NvSem		= 0x81000000, /* range of 16M handles */
>  
>  	/* G80+ display objects */
>  	NvEvoVRAM	= 0x01000000,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 2b78ee6..0a7abc7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -620,6 +620,11 @@ struct drm_nouveau_private {
>  	struct {
>  		struct dentry *channel_root;
>  	} debugfs;
> +
> +	spinlock_t sem_bo_free_list_lock;
> +	struct nouveau_sem_bo *sem_bo_free_list;
> +	atomic_t sem_handles;
> +	uint32_t sem_max_handles;
>  };
>  
>  static inline struct drm_nouveau_private *
> @@ -1141,6 +1146,8 @@ extern int nouveau_fence_flush(void *obj, void *arg);
>  extern void nouveau_fence_unref(void **obj);
>  extern void *nouveau_fence_ref(void *obj);
>  extern void nouveau_fence_handler(struct drm_device *dev, int channel);
> +extern void nouveau_fence_device_init(struct drm_device *dev);
> +extern void nouveau_fence_device_takedown(struct drm_device *dev);
>  
>  /* nouveau_gem.c */
>  extern int nouveau_gem_new(struct drm_device *, struct nouveau_channel *,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 9b1c2c3..01152f3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -32,6 +32,13 @@
>  
>  #define USE_REFCNT (dev_priv->card_type >= NV_10)
>  
> +#define NOUVEAU_SEM_BO_SIZE PAGE_SIZE
> +
> +/* reading fences can be very expensive
> + * use a threshold that would only use up half a single sem_bo
> + */
> +#define NOUVEAU_SEM_MIN_THRESHOLD (NOUVEAU_SEM_BO_SIZE / (NOUVEAU_MAX_CHANNEL_NR * 2))
> +
>  struct nouveau_fence {
>  	struct nouveau_channel *channel;
>  	struct kref refcount;
> @@ -47,6 +54,218 @@ nouveau_fence(void *sync_obj)
>  	return (struct nouveau_fence *)sync_obj;
>  }
>  
> +struct nouveau_sem_bo {
> +	struct nouveau_sem_bo *next;
> +	struct nouveau_bo *bo;
> +	uint32_t handle;
> +
> +	/* >= 0: num_free + 1 slots are free, sem_bo is or is about to be on free_list
> +	    -1: all allocated, sem_bo is NOT on free_list
> +	*/
> +	atomic_t num_free;
> +
> +	DECLARE_BITMAP(free_slots, NOUVEAU_SEM_BO_SIZE / sizeof(uint32_t));
> +	DECLARE_BITMAP(values, NOUVEAU_SEM_BO_SIZE / sizeof(uint32_t));
> +	DECLARE_BITMAP(channels, NOUVEAU_MAX_CHANNEL_NR);
> +};
> +
> +struct nouveau_sem {
> +	struct nouveau_sem_bo *sem_bo;
> +	unsigned num;
> +	uint32_t value;
> +};
> +
> +struct nouveau_sem_bo*
> +nouveau_sem_bo_alloc(struct drm_device *dev)
> +{
> +	struct nouveau_sem_bo *sem_bo = kmalloc(sizeof(*sem_bo), GFP_KERNEL);
^^^^^^^^

> +	struct nouveau_bo *bo;
> +	int flags = TTM_PL_FLAG_VRAM;
> +	int ret;
> +	bool is_iomem;
> +	void *mem;
> +
> +	sem_bo = kmalloc(sizeof(*sem_bo), GFP_KERNEL);

double allocation

> +
> +	if (!sem_bo)
> +		return 0;

sparse would probably complain about 0 instead of NULL

> +
> +	ret = nouveau_bo_new(dev, NULL, NOUVEAU_SEM_BO_SIZE, 0, flags,
> +			0, 0x0000, true, true, &bo);
> +	if (ret)
> +		goto out_free;
> +
> +	sem_bo->bo = bo;
> +
> +	ret = nouveau_bo_pin(bo, flags);
> +	if (ret)
> +		goto out_bo;
> +
> +	ret = nouveau_bo_map(bo);
> +	if (ret)
> +		goto out_unpin;
> +
> +	mem = ttm_kmap_obj_virtual(&bo->kmap, &is_iomem);
> +	if (is_iomem)
> +		memset_io(mem, 0, NOUVEAU_SEM_BO_SIZE);
> +	else
> +		memset(mem, 0, NOUVEAU_SEM_BO_SIZE);
> +
> +	nouveau_bo_unmap(bo);
> +
> +	memset((void *)sem_bo->free_slots, 0xff, sizeof(sem_bo->free_slots));
> +	memset((void *)sem_bo->values, 0xff, sizeof(sem_bo->values));
> +	atomic_set(&sem_bo->num_free, sizeof(sem_bo->free_slots) * 8 - 1);
> +
> +	memset((void *)sem_bo->channels, 0, sizeof(sem_bo->channels));
> +
> +	return sem_bo;
> +
> +out_unpin:
> +	nouveau_bo_unpin(sem_bo->bo);
> +out_bo:
> +	nouveau_bo_ref(0, &sem_bo->bo);
> +out_free:
> +	kfree(sem_bo);
> +	return 0;
> +}
> +
> +static void
> +nouveau_sem_bo_channel_dtor(struct drm_device *dev,
> +			     struct nouveau_gpuobj *gpuobj) {
> +	if (gpuobj->priv) {

if (!gpuobj->priv)
	return;

would save this code from unneeded indentation...

> +		struct nouveau_sem_bo *sem_bo;
> +		struct nouveau_channel *chan = gpuobj->im_channel;
> +		sem_bo = (struct nouveau_sem_bo *)gpuobj->priv;

priv is (void *) - no need to cast it

> +
> +		clear_bit(chan->id, sem_bo->channels);
> +		smp_wmb();
> +	}
> +}
> +
> +int
> +nouveau_sem_bo_channel_init(struct nouveau_sem_bo *sem_bo, struct nouveau_channel *chan)
> +{
> +	struct drm_device *dev = chan->dev;
> +	struct nouveau_gpuobj *obj = NULL;
> +	int ret;
> +
> +	if (test_bit(chan->id, sem_bo->channels))
> +		return 0;
> +
> +	BUG_ON(sem_bo->bo->bo.mem.mem_type != TTM_PL_VRAM);

it might be a bug, but this function has failure path and killing the box is not nice,
so why not handle it properly? (WARN_ON + -EINVAL?)

> +
> +	ret = nouveau_gpuobj_dma_new(chan, NV_CLASS_DMA_IN_MEMORY,
> +		sem_bo->bo->bo.mem.mm_node->start, NOUVEAU_SEM_BO_SIZE,
> +		NV_DMA_ACCESS_RW, NV_DMA_TARGET_VIDMEM, &obj);
> +	if (ret)
> +		return ret;
> +
> +	obj->dtor = nouveau_sem_bo_channel_dtor;
> +	obj->priv = sem_bo;
> +
> +	ret = nouveau_gpuobj_ref_add(dev, chan, sem_bo->handle, obj, NULL);
> +	if (ret) {
> +		nouveau_gpuobj_del(dev, &obj);
> +		return ret;
> +	}
> +
> +	set_bit(chan->id, sem_bo->channels);
> +	smp_wmb();
> +
> +	return 0;
> +}
> +
> +void
> +nouveau_sem_bo_free(struct nouveau_sem_bo *sem_bo)
> +{
> +	nouveau_bo_unpin(sem_bo->bo);
> +	nouveau_bo_ref(0, &sem_bo->bo);
> +	kfree(sem_bo);
> +}
> +
> +static inline void
> +nouveau_sem_bo_enqueue(struct drm_device *dev, struct nouveau_sem_bo *sem_bo)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +
> +	spin_lock(&dev_priv->sem_bo_free_list_lock);
> +	sem_bo->next = dev_priv->sem_bo_free_list;
> +	dev_priv->sem_bo_free_list = sem_bo;
> +	spin_unlock(&dev_priv->sem_bo_free_list_lock);
> +}
> +
> +int
> +nouveau_sem_alloc(struct drm_device *dev, struct nouveau_sem *sem)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nouveau_sem_bo *sem_bo = 0;
> +	int v;
> +
> +retry:
> +	sem_bo = dev_priv->sem_bo_free_list;
> +	if (!sem_bo) {
> +		unsigned handle;
> +
> +		if (atomic_read(&dev_priv->sem_handles) >= dev_priv->sem_max_handles)
> +			return -ENOMEM;
> +
> +		/* this works because sem_handles <= sem_max_handles + NR_CPUS */
> +		handle = atomic_add_return(1, &dev_priv->sem_handles) - 1;
> +
> +		if (handle >= dev_priv->sem_max_handles)
> +			return -ENOMEM;
> +
> +		sem_bo = nouveau_sem_bo_alloc(dev);
> +		if (!sem_bo)
> +			return -ENOMEM;
> +
> +		sem_bo->handle = NvSem + handle;
> +
> +		atomic_dec(&sem_bo->num_free);
> +		nouveau_sem_bo_enqueue(dev, sem_bo);

you could hide "handle" and "next" initialization in nouveau_sem_bo_alloc

> +	} else {
> +		if (unlikely(!atomic_add_unless(&sem_bo->num_free, -1, 0))) {
> +			spin_lock(&dev_priv->sem_bo_free_list_lock);
> +			if (unlikely(sem_bo != dev_priv->sem_bo_free_list)) {
> +				spin_unlock(&dev_priv->sem_bo_free_list_lock);
> +				goto retry;
> +			}
> +
> +			dev_priv->sem_bo_free_list = sem_bo->next;
> +			if (atomic_dec_return(&sem_bo->num_free) >= 0)
> +				dev_priv->sem_bo_free_list = sem_bo;
> +
> +			spin_unlock(&dev_priv->sem_bo_free_list_lock);
> +		}
> +	}
> +
> +retry_bit:
> +	v = find_first_bit(sem_bo->free_slots, sizeof(sem_bo->free_slots) * 8);
> +
> +	/* we reserved our bit by decrementing num_free
> +	   however, the first available bit may have been taken */
> +	BUG_ON(v >= sizeof(sem_bo->free_slots) * 8);

another unneeded BUG

> +
> +	if (unlikely(!test_and_clear_bit(v, sem_bo->free_slots)))
> +		goto retry_bit;
> +
> +	sem->sem_bo = sem_bo;
> +	sem->value = test_and_change_bit(v, sem_bo->values);
> +	sem->num = v;
> +
> +	return 0;
> +}
> +
> +void
> +nouveau_sem_release(struct drm_device *dev, struct nouveau_sem_bo *sem_bo, int i)
> +{
> +	set_bit(i, sem_bo->free_slots);
> +
> +	if (atomic_inc_and_test(&sem_bo->num_free))
> +		nouveau_sem_bo_enqueue(dev, sem_bo);
> +}
> +
>  static void
>  nouveau_fence_del(struct kref *ref)
>  {
> @@ -266,3 +485,27 @@ nouveau_fence_fini(struct nouveau_channel *chan)
>  	}
>  }
>  
> +void
> +nouveau_fence_device_init(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	spin_lock_init(&dev_priv->sem_bo_free_list_lock);
> +	dev_priv->sem_bo_free_list = 0;
> +	atomic_set(&dev_priv->sem_handles, 0);
> +	/* these are each pinned and 4KB, providing 1024 semaphores each
> +	   we should need only one in normal circumstances */
> +	dev_priv->sem_max_handles = 16;
> +}
> +
> +void
> +nouveau_fence_device_takedown(struct drm_device *dev)
> +{
> +	struct drm_nouveau_private *dev_priv = dev->dev_private;
> +	struct nouveau_sem_bo *sem_bo, *next;
> +	/* all the sem_bos allocated must be in the free list since all channels
> +	* and thus fences have already been terminated */
> +	for (sem_bo = dev_priv->sem_bo_free_list; sem_bo; sem_bo = next) {
> +		next = sem_bo->next;
> +		nouveau_sem_bo_free(sem_bo);
> +	}
> +}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_state.c b/drivers/gpu/drm/nouveau/nouveau_state.c
> index fcd7610..7161981 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_state.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_state.c
> @@ -412,6 +412,8 @@ nouveau_card_init(struct drm_device *dev)
>  	if (ret)
>  		goto out_mem;
>  
> +	nouveau_fence_device_init(dev);
> +
>  	/* PMC */
>  	ret = engine->mc.init(dev);
>  	if (ret)
> @@ -532,6 +534,8 @@ static void nouveau_card_takedown(struct drm_device *dev)
>  		engine->timer.takedown(dev);
>  		engine->mc.takedown(dev);
>  
> +		nouveau_fence_device_takedown(dev);
> +
>  		mutex_lock(&dev->struct_mutex);
>  		ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM);
>  		ttm_bo_clean_mm(&dev_priv->ttm.bdev, TTM_PL_TT);
> -- 
> 1.6.6.1.476.g01ddb
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

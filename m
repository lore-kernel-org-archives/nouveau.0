From: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [PATCH] drm/ttm/nouveau: add DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT
Date: Sun, 18 Sep 2011 18:25:08 +0200
Message-ID: <4E761B64.4020705@shipmail.org>
References: <20110918131857.GA3389@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20110918131857.GA3389@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

I need to nak this in its current form.

The TTM design without timeout is intentional.
The fencing system (or the sync objects) is what should control the 
progress of the GPU and if it detects a hang, all fences should be 
signaled and the gpu should be reset if possible. Error propagation 
could be done with a fence subsystem status, or with a result member in 
the fence object.

If the hang needs to be communicated to user-space, then a bo wait 
should be followed by a status check by the driver ioctl code and 
reported back to user space (or by some other means of notification).

There are many reasons for this. In your case user-space will be happy 
because it recieved a notification, but buffer objects will still be 
hanging around and never be destroyed, since their fence object doesn't 
signal. Also there may be other subsystems using fence objects, and they 
need notifications too. The best way to clean this up is to signal all 
fence objects.

One should also be careful when hard-coding timeouts. "gltestperf", for 
example can keep gpus busy for excessive time periods (20-30s). 
Arbitrarily declaring buffer objects as idle after 3s in such situations 
is not a good solution. Currently we hardcode arbitrary timeouts in the 
vmwgfx driver as well, but that is pending a better GPU hang detection. 
In any case, a timeout-based gpu hang detection mechanism should not be 
based on the time elapsed from the first wait (which is arbitrary) but 
from the time elapsed from fence submission.

Having said that, there *are* situations where a smart user-space app 
doesn't want to wait for a complicated shader to execute, but rather 
receive an error and go ahead and do something else. In that situation, 
it might be beneficial with a bo_wait_timeout api, but not to avoid GPU 
hangs causing trouble.

Thomas



On 09/18/2011 03:18 PM, Marcin Slusarz wrote:
> Currently DRM_NOUVEAU_GEM_CPU_PREP ioctl is broken WRT handling of signals.
>
> nouveau_gem_ioctl_cpu_prep calls ttm_bo_wait which waits for fence to
> "signal" or 3 seconds timeout pass.
> But if it detects pending signal, it returns ERESTARTSYS and goes back
> to userspace. After signal handler, userspace repeats the same ioctl which
> starts _new 3 seconds loop_.
> So when the application relies on signals, some ioctls may never finish
> from application POV.
>
> There is one important application which does this - Xorg. It uses SIGIO
> (for input handling) and SIGALARM.
>
> GPU lockups lead to endless ioctl loop which eventually manifests in crash
> with "[mi] EQ overflowing. The server is probably stuck in an infinite loop."
> message instead of being propagated to DDX.
>
> The solutions is to add new ioctl NOUVEAU_GEM_CPU_PREP_TIMEOUT with
> timeout parameter and decrease it on every signal.
>
> Signed-off-by: Marcin Slusarz<marcin.slusarz@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_channel.c |    1 +
>   drivers/gpu/drm/nouveau/nouveau_drv.h     |    7 ++-
>   drivers/gpu/drm/nouveau/nouveau_fence.c   |   34 ++++++++++++++++-
>   drivers/gpu/drm/nouveau/nouveau_gem.c     |   34 +++++++++++++---
>   drivers/gpu/drm/radeon/radeon_ttm.c       |    3 +-
>   drivers/gpu/drm/ttm/ttm_bo.c              |   23 +++++++++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c    |    3 +-
>   include/drm/nouveau_drm.h                 |   58 ++++++++++++++++------------
>   include/drm/ttm/ttm_bo_api.h              |   23 +++++++++++-
>   include/drm/ttm/ttm_bo_driver.h           |    3 +-
>   10 files changed, 145 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
> index 0e3241c..62c09b0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -479,6 +479,7 @@ struct drm_ioctl_desc nouveau_ioctls[] = {
>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP, nouveau_gem_ioctl_cpu_prep, DRM_UNLOCKED|DRM_AUTH),
>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_FINI, nouveau_gem_ioctl_cpu_fini, DRM_UNLOCKED|DRM_AUTH),
>   	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_INFO, nouveau_gem_ioctl_info, DRM_UNLOCKED|DRM_AUTH),
> +	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_CPU_PREP_TIMEOUT, nouveau_gem_ioctl_cpu_prep_timeout, DRM_UNLOCKED|DRM_AUTH),
>   };
>
>   int nouveau_max_ioctl = DRM_ARRAY_SIZE(nouveau_ioctls);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 000e44f..33ddd69 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -1383,7 +1383,8 @@ extern void nouveau_fence_work(struct nouveau_fence *fence,
>   struct nouveau_channel *nouveau_fence_channel(struct nouveau_fence *);
>
>   extern bool __nouveau_fence_signalled(void *obj, void *arg);
> -extern int __nouveau_fence_wait(void *obj, void *arg, bool lazy, bool intr);
> +extern int __nouveau_fence_wait(void *obj, void *arg, bool lazy, bool intr,
> +				struct timespec *remaining_time);
>   extern int __nouveau_fence_flush(void *obj, void *arg);
>   extern void __nouveau_fence_unref(void **obj);
>   extern void *__nouveau_fence_ref(void *obj);
> @@ -1395,7 +1396,7 @@ static inline bool nouveau_fence_signalled(struct nouveau_fence *obj)
>   static inline int
>   nouveau_fence_wait(struct nouveau_fence *obj, bool lazy, bool intr)
>   {
> -	return __nouveau_fence_wait(obj, NULL, lazy, intr);
> +	return __nouveau_fence_wait(obj, NULL, lazy, intr, NULL);
>   }
>   extern int nouveau_fence_sync(struct nouveau_fence *, struct nouveau_channel *);
>   static inline int nouveau_fence_flush(struct nouveau_fence *obj)
> @@ -1430,6 +1431,8 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
>   				      struct drm_file *);
>   extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
>   				  struct drm_file *);
> +extern int nouveau_gem_ioctl_cpu_prep_timeout(struct drm_device *, void *,
> +					      struct drm_file *);
>
>   /* nouveau_display.c */
>   int nouveau_vblank_enable(struct drm_device *dev, int crtc);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 12f522f..614e37a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -228,19 +228,37 @@ __nouveau_fence_signalled(void *sync_obj, void *sync_arg)
>   	return fence->signalled;
>   }
>
> +static inline void zero_timespec(struct timespec *t)
> +{
> +	t->tv_sec = 0;
> +	t->tv_nsec = 0;
> +}
> +
>   int
> -__nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
> +__nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr,
> +					struct timespec *remaining_time)
>   {
> -	unsigned long timeout = jiffies + (3 * DRM_HZ);
> +	unsigned long timeout = jiffies;
> +	struct timespec start;
>   	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
>   	ktime_t t;
>   	int ret = 0;
>
> +	if (remaining_time) {
> +		getnstimeofday(&start);
> +		timeout += timespec_to_jiffies(remaining_time);
> +	} else {
> +		timeout += 3 * DRM_HZ;
> +	}
> +
> +
>   	while (1) {
>   		if (__nouveau_fence_signalled(sync_obj, sync_arg))
>   			break;
>
>   		if (time_after_eq(jiffies, timeout)) {
> +			if (remaining_time)
> +				zero_timespec(remaining_time);
>   			ret = -EBUSY;
>   			break;
>   		}
> @@ -256,6 +274,18 @@ __nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
>   		}
>
>   		if (intr&&  signal_pending(current)) {
> +			if (remaining_time) {
> +				struct timespec now, diff;
> +				getnstimeofday(&now);
> +				diff = timespec_sub(now, start);
> +				*remaining_time =
> +					timespec_sub(*remaining_time, diff);
> +
> +				if (remaining_time->tv_sec<  0 ||
> +						remaining_time->tv_nsec<  0)
> +					zero_timespec(remaining_time);
> +			}
> +
>   			ret = -ERESTARTSYS;
>   			break;
>   		}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index b3d17be..f4979d0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -853,29 +853,49 @@ domain_to_ttm(struct nouveau_bo *nvbo, uint32_t domain)
>   	return flags;
>   }
>
> -int
> -nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
> -			   struct drm_file *file_priv)
> +static int
> +__nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, struct drm_file *file_priv,
> +			     u32 handle, u32 flags, struct timespec *timeout)
>   {
> -	struct drm_nouveau_gem_cpu_prep *req = data;
>   	struct drm_gem_object *gem;
>   	struct nouveau_bo *nvbo;
> -	bool no_wait = !!(req->flags&  NOUVEAU_GEM_CPU_PREP_NOWAIT);
> +	bool no_wait = !!(flags&  NOUVEAU_GEM_CPU_PREP_NOWAIT);
> +
>   	int ret = -EINVAL;
>
> -	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
> +	gem = drm_gem_object_lookup(dev, file_priv, handle);
>   	if (!gem)
>   		return -ENOENT;
>   	nvbo = nouveau_gem_object(gem);
>
>   	spin_lock(&nvbo->bo.bdev->fence_lock);
> -	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
> +	ret = ttm_bo_wait_timeout(&nvbo->bo, true, true, no_wait, timeout);
>   	spin_unlock(&nvbo->bo.bdev->fence_lock);
>   	drm_gem_object_unreference_unlocked(gem);
>   	return ret;
>   }
>
>   int
> +nouveau_gem_ioctl_cpu_prep_timeout(struct drm_device *dev, void *data,
> +				   struct drm_file *file_priv)
> +{
> +	struct drm_nouveau_gem_cpu_prep_timeout *req = data;
> +
> +	return __nouveau_gem_ioctl_cpu_prep(dev, file_priv, req->handle,
> +					    req->flags,&req->timeout);
> +}
> +
> +int
> +nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
> +			   struct drm_file *file_priv)
> +{
> +	struct drm_nouveau_gem_cpu_prep *req = data;
> +
> +	return __nouveau_gem_ioctl_cpu_prep(dev, file_priv, req->handle,
> +					    req->flags, NULL);
> +}
> +
> +int
>   nouveau_gem_ioctl_cpu_fini(struct drm_device *dev, void *data,
>   			   struct drm_file *file_priv)
>   {
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 60125dd..2b6d703 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -462,7 +462,8 @@ static void radeon_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_re
>   }
>
>   static int radeon_sync_obj_wait(void *sync_obj, void *sync_arg,
> -				bool lazy, bool interruptible)
> +				bool lazy, bool interruptible,
> +				struct timespec *remaining_time)
>   {
>   	return radeon_fence_wait((struct radeon_fence *)sync_obj, interruptible);
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 81b6850..49b17a3 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1693,8 +1693,9 @@ out_unlock:
>   	return ret;
>   }
>
> -int ttm_bo_wait(struct ttm_buffer_object *bo,
> -		bool lazy, bool interruptible, bool no_wait)
> +int ttm_bo_wait_timeout(struct ttm_buffer_object *bo,
> +			bool lazy, bool interruptible, bool no_wait,
> +			struct timespec *remaining_time)
>   {
>   	struct ttm_bo_driver *driver = bo->bdev->driver;
>   	struct ttm_bo_device *bdev = bo->bdev;
> @@ -1703,7 +1704,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>   	int ret = 0;
>
>   	if (likely(bo->sync_obj == NULL))
> -		return 0;
> +		goto success;
>
>   	while (bo->sync_obj) {
>
> @@ -1724,7 +1725,7 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>   		sync_obj_arg = bo->sync_obj_arg;
>   		spin_unlock(&bdev->fence_lock);
>   		ret = driver->sync_obj_wait(sync_obj, sync_obj_arg,
> -					    lazy, interruptible);
> +					    lazy, interruptible, remaining_time);
>   		if (unlikely(ret != 0)) {
>   			driver->sync_obj_unref(&sync_obj);
>   			spin_lock(&bdev->fence_lock);
> @@ -1747,8 +1748,22 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>   			spin_lock(&bdev->fence_lock);
>   		}
>   	}
> +
> +success:
> +	if (remaining_time) {
> +		remaining_time->tv_sec = 0;
> +		remaining_time->tv_nsec = 0;
> +	}
> +
>   	return 0;
>   }
> +EXPORT_SYMBOL(ttm_bo_wait_timeout);
> +
> +int ttm_bo_wait(struct ttm_buffer_object *bo,
> +		bool lazy, bool interruptible, bool no_wait)
> +{
> +	return ttm_bo_wait_timeout(bo, lazy, interruptible, no_wait, NULL);
> +}
>   EXPORT_SYMBOL(ttm_bo_wait);
>
>   int ttm_bo_synccpu_write_grab(struct ttm_buffer_object *bo, bool no_wait)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c
> index 87e43e0..6c6b9c6 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_buffer.c
> @@ -301,7 +301,8 @@ static bool vmw_sync_obj_signaled(void *sync_obj, void *sync_arg)
>   }
>
>   static int vmw_sync_obj_wait(void *sync_obj, void *sync_arg,
> -			     bool lazy, bool interruptible)
> +			     bool lazy, bool interruptible,
> +			     struct timespec *remaining_time)
>   {
>   	struct vmw_private *dev_priv = (struct vmw_private *)sync_arg;
>   	uint32_t sequence = (unsigned long) sync_obj;
> diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
> index 5edd3a7..b7e34d0 100644
> --- a/include/drm/nouveau_drm.h
> +++ b/include/drm/nouveau_drm.h
> @@ -176,6 +176,12 @@ struct drm_nouveau_gem_cpu_prep {
>   	uint32_t flags;
>   };
>
> +struct drm_nouveau_gem_cpu_prep_timeout {
> +	uint32_t handle;
> +	uint32_t flags;
> +	struct timespec timeout;
> +};
> +
>   struct drm_nouveau_gem_cpu_fini {
>   	uint32_t handle;
>   };
> @@ -189,30 +195,32 @@ enum nouveau_bus_type {
>   struct drm_nouveau_sarea {
>   };
>
> -#define DRM_NOUVEAU_GETPARAM           0x00
> -#define DRM_NOUVEAU_SETPARAM           0x01
> -#define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
> -#define DRM_NOUVEAU_CHANNEL_FREE       0x03
> -#define DRM_NOUVEAU_GROBJ_ALLOC        0x04
> -#define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC  0x05
> -#define DRM_NOUVEAU_GPUOBJ_FREE        0x06
> -#define DRM_NOUVEAU_GEM_NEW            0x40
> -#define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> -#define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> -#define DRM_NOUVEAU_GEM_CPU_FINI       0x43
> -#define DRM_NOUVEAU_GEM_INFO           0x44
> -
> -#define DRM_IOCTL_NOUVEAU_GETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> -#define DRM_IOCTL_NOUVEAU_SETPARAM           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC      DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> -#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> -#define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC        DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
> -#define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC  DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
> -#define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE        DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
> -#define DRM_IOCTL_NOUVEAU_GEM_NEW            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
> -#define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> -#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> -#define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
> +#define DRM_NOUVEAU_GETPARAM             0x00
> +#define DRM_NOUVEAU_SETPARAM             0x01
> +#define DRM_NOUVEAU_CHANNEL_ALLOC        0x02
> +#define DRM_NOUVEAU_CHANNEL_FREE         0x03
> +#define DRM_NOUVEAU_GROBJ_ALLOC          0x04
> +#define DRM_NOUVEAU_NOTIFIEROBJ_ALLOC    0x05
> +#define DRM_NOUVEAU_GPUOBJ_FREE          0x06
> +#define DRM_NOUVEAU_GEM_NEW              0x40
> +#define DRM_NOUVEAU_GEM_PUSHBUF          0x41
> +#define DRM_NOUVEAU_GEM_CPU_PREP         0x42
> +#define DRM_NOUVEAU_GEM_CPU_FINI         0x43
> +#define DRM_NOUVEAU_GEM_INFO             0x44
> +#define DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT 0x45
> +
> +#define DRM_IOCTL_NOUVEAU_GETPARAM             DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GETPARAM, struct drm_nouveau_getparam)
> +#define DRM_IOCTL_NOUVEAU_SETPARAM             DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_SETPARAM, struct drm_nouveau_setparam)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_ALLOC        DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_ALLOC, struct drm_nouveau_channel_alloc)
> +#define DRM_IOCTL_NOUVEAU_CHANNEL_FREE         DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_CHANNEL_FREE, struct drm_nouveau_channel_free)
> +#define DRM_IOCTL_NOUVEAU_GROBJ_ALLOC          DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GROBJ_ALLOC, struct drm_nouveau_grobj_alloc)
> +#define DRM_IOCTL_NOUVEAU_NOTIFIEROBJ_ALLOC    DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_NOTIFIEROBJ_ALLOC, struct drm_nouveau_notifierobj_alloc)
> +#define DRM_IOCTL_NOUVEAU_GPUOBJ_FREE          DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GPUOBJ_FREE, struct drm_nouveau_gpuobj_free)
> +#define DRM_IOCTL_NOUVEAU_GEM_NEW              DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_NEW, struct drm_nouveau_gem_new)
> +#define DRM_IOCTL_NOUVEAU_GEM_PUSHBUF          DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_PUSHBUF, struct drm_nouveau_gem_pushbuf)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP         DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP, struct drm_nouveau_gem_cpu_prep)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI         DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> +#define DRM_IOCTL_NOUVEAU_GEM_INFO             DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
> +#define DRM_IOCTL_NOUVEAU_GEM_CPU_PREP_TIMEOUT DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_PREP_TIMEOUT, struct drm_nouveau_gem_cpu_prep_timeout)
>
>   #endif /* __NOUVEAU_DRM_H__ */
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 62a0e4c..7692690 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -330,11 +330,32 @@ ttm_bo_reference(struct ttm_buffer_object *bo)
>    * sure any previous rendering to the buffer is completed.
>    * Note: It might be necessary to block validations before the
>    * wait by reserving the buffer.
> - * Returns -EBUSY if no_wait is true and the buffer is busy.
> + * Returns -EBUSY if no_wait is true and the buffer is busy or 3 secs passed
>    * Returns -ERESTARTSYS if interrupted by a signal.
>    */
>   extern int ttm_bo_wait(struct ttm_buffer_object *bo, bool lazy,
>   		       bool interruptible, bool no_wait);
> +
> +/**
> + * ttm_bo_wait - wait for buffer idle.
> + *
> + * @bo:  The buffer object.
> + * @interruptible:  Use interruptible wait.
> + * @no_wait:  Return immediately if buffer is busy.
> + * @remaining_time:  Wait only this amount of time.
> + *
> + * This function must be called with the bo::mutex held, and makes
> + * sure any previous rendering to the buffer is completed.
> + * Note: It might be necessary to block validations before the
> + * wait by reserving the buffer.
> + * Note 2: timeout is decreased if interrupted by signal, and zeroed otherwise
> + * Returns -EBUSY if no_wait is true and the buffer is busy or timeout passed
> + * Returns -ERESTARTSYS if interrupted by a signal.
> + */
> +extern int ttm_bo_wait_timeout(struct ttm_buffer_object *bo, bool lazy,
> +				bool interruptible, bool no_wait,
> +				struct timespec *remaining_time);
> +
>   /**
>    * ttm_bo_validate
>    *
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 09af2d7..bd9678f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -433,7 +433,8 @@ struct ttm_bo_driver {
>
>   	bool (*sync_obj_signaled) (void *sync_obj, void *sync_arg);
>   	int (*sync_obj_wait) (void *sync_obj, void *sync_arg,
> -			      bool lazy, bool interruptible);
> +			      bool lazy, bool interruptible,
> +			      struct timespec *remaining_time);
>   	int (*sync_obj_flush) (void *sync_obj, void *sync_arg);
>   	void (*sync_obj_unref) (void **sync_obj);
>   	void *(*sync_obj_ref) (void *sync_obj);
>    

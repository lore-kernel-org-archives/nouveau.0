From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: initialize chan->fence.lock
	before use
Date: Sun, 9 Oct 2011 21:24:02 +0200
Message-ID: <20111009192402.GC3323@joi.lan>
References: <20110909121642.GA16883@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110909121642.GA16883-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Sep 09, 2011 at 02:16:42PM +0200, Marcin Slusarz wrote:
> Fence lock needs to be initialized before any call to nouveau_channel_put
> because it calls nouveau_channel_idle->nouveau_fence_update which uses
> fence lock.
> 
> BUG: spinlock bad magic on CPU#0, test/24134
>  lock: ffff88019f90dba8, .magic: 00000000, .owner: <none>/-1, .owner_cpu: 0
> Pid: 24134, comm: test Not tainted 3.0.0-nv+ #800
> Call Trace:
>  spin_bug+0x9c/0xa3
>  do_raw_spin_lock+0x29/0x13c
>  _raw_spin_lock+0x1e/0x22
>  nouveau_fence_update+0x2d/0xf1
>  nouveau_channel_idle+0x22/0xa0
>  nouveau_channel_put_unlocked+0x84/0x1bd
>  nouveau_channel_put+0x20/0x24
>  nouveau_channel_alloc+0x4ec/0x585
>  nouveau_ioctl_fifo_alloc+0x50/0x130
>  drm_ioctl+0x289/0x361
>  do_vfs_ioctl+0x4dd/0x52c
>  sys_ioctl+0x42/0x65
>  system_call_fastpath+0x16/0x1b
> 
> It's easily triggerable from userspace.
> 
> Additionally remove double initialization of chan->fence.pending.
> 
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_channel.c |    1 +
>  drivers/gpu/drm/nouveau/nouveau_fence.c   |    2 --
>  2 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_channel.c b/drivers/gpu/drm/nouveau/nouveau_channel.c
> index 85be745..62c09b0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_channel.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_channel.c
> @@ -158,6 +158,7 @@ nouveau_channel_alloc(struct drm_device *dev, struct nouveau_channel **chan_ret,
>  	INIT_LIST_HEAD(&chan->nvsw.vbl_wait);
>  	INIT_LIST_HEAD(&chan->nvsw.flip);
>  	INIT_LIST_HEAD(&chan->fence.pending);
> +	spin_lock_init(&chan->fence.lock);
>  
>  	/* setup channel's memory and vm */
>  	ret = nouveau_gpuobj_channel_init(chan, vram_handle, gart_handle);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index c499591..614e37a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -568,8 +568,6 @@ nouveau_fence_channel_init(struct nouveau_channel *chan)
>  			return ret;
>  	}
>  
> -	INIT_LIST_HEAD(&chan->fence.pending);
> -	spin_lock_init(&chan->fence.lock);
>  	atomic_set(&chan->fence.last_sequence_irq, 0);
>  	return 0;
>  }
> -- 

ping

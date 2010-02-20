From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix missing spin_unlock in
 failure path
Date: Sat, 20 Feb 2010 22:35:15 +0100
Message-ID: <20100220213515.GA8199@joi.lan>
References: <1266660536-10688-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1266660536-10688-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Feb 20, 2010 at 11:08:56AM +0100, Luca Barbieri wrote:
> Found by sparse.
> 
> Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 03d8935..d7ace31 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -557,11 +557,11 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *dev,
>  
>  		spin_lock(&nvbo->bo.lock);
>  		ret = ttm_bo_wait(&nvbo->bo, false, false, false);
> +		spin_unlock(&nvbo->bo.lock);
>  		if (ret) {
>  			NV_ERROR(dev, "reloc wait_idle failed: %d\n", ret);
>  			break;
>  		}
> -		spin_unlock(&nvbo->bo.lock);
>  
>  		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
>  	}
> -- 

just FYI - i hit this code two times today
without this patch:

Feb 20 20:08:49 [kernel] [21713.664339] [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch 3
Feb 20 20:08:52 [kernel] [21716.949829] [drm] nouveau 0000:02:00.0: reloc wait_idle failed: -16
Feb 20 20:08:52 [kernel] [21716.949832] [drm] nouveau 0000:02:00.0: reloc apply: -16
Feb 20 20:08:52 [kernel] [21716.949835] BUG: sleeping function called from invalid context at arch/x86/mm/mmio-mod.c:332
Feb 20 20:08:52 [kernel] [21716.949838] in_atomic(): 1, irqs_disabled(): 0, pid: 2613, name: X
Feb 20 20:08:52 [kernel] [21716.949841] Pid: 2613, comm: X Not tainted 2.6.32-nv5 #253
Feb 20 20:08:52 [kernel] [21716.949843] Call Trace:
Feb 20 20:08:52 [kernel] [21716.949851]  [<ffffffff8103722e>] __might_sleep+0x10a/0x10e
Feb 20 20:08:52 [kernel] [21716.949855]  [<ffffffff8102ce24>] mmiotrace_iounmap+0x21/0x10d
Feb 20 20:08:52 [kernel] [21716.949859]  [<ffffffff810351ee>] ? __wake_up+0x3f/0x48
Feb 20 20:08:52 [kernel] [21716.949863]  [<ffffffff8102820f>] iounmap+0x44/0xca
Feb 20 20:08:52 [kernel] [21716.949870]  [<ffffffffa00bc4c7>] ttm_bo_kunmap+0x36/0x56 [ttm]
Feb 20 20:08:52 [kernel] [21716.949881]  [<ffffffffa00d80dc>] validate_fini_list+0x88/0xfc [nouveau]
Feb 20 20:08:52 [kernel] [21716.949885]  [<ffffffff813c47e1>] ? printk+0x3c/0x3e
Feb 20 20:08:52 [kernel] [21716.949894]  [<ffffffffa00d817c>] validate_fini+0x2c/0x31 [nouveau]
Feb 20 20:08:52 [kernel] [21716.949903]  [<ffffffffa00d8e70>] nouveau_gem_ioctl_pushbuf+0xcef/0xdd2 [nouveau]
Feb 20 20:08:52 [kernel] [21716.949912]  [<ffffffffa0074f3b>] drm_ioctl+0x25f/0x314 [drm]
Feb 20 20:08:52 [kernel] [21716.949921]  [<ffffffffa00d8181>] ? nouveau_gem_ioctl_pushbuf+0x0/0xdd2 [nouveau]
Feb 20 20:08:52 [kernel] [21716.949927]  [<ffffffff810dcb2d>] vfs_ioctl+0x1d/0x82
Feb 20 20:08:52 [kernel] [21716.949931]  [<ffffffff810dd0ca>] do_vfs_ioctl+0x4c1/0x507
Feb 20 20:08:52 [kernel] [21716.949934]  [<ffffffff81039071>] ? sub_preempt_count+0x9e/0xb2
Feb 20 20:08:52 [kernel] [21716.949938]  [<ffffffff810dd152>] sys_ioctl+0x42/0x65
Feb 20 20:08:52 [kernel] [21716.949942]  [<ffffffff8100af6b>] system_call_fastpath+0x16/0x1b
+ lots of "scheduling while atomic" and lockup

with this patch:
Feb 20 22:16:50 [kernel] [ 5471.144533] [drm] nouveau 0000:02:00.0: PFIFO_DMA_PUSHER - Ch 3
Feb 20 22:16:53 [kernel] [ 5474.361086] [drm] nouveau 0000:02:00.0: reloc wait_idle failed: -16
Feb 20 22:16:53 [kernel] [ 5474.361089] [drm] nouveau 0000:02:00.0: reloc apply: -16
and silent lockup

so it's an improvement :)

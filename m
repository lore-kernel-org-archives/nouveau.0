From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] drm/nv04-nv10: Don't jump back to our PUT
 offset on PUSHBUF_CALL.
Date: Mon, 09 Nov 2009 08:20:06 +1000
Message-ID: <1257718806.2216.3.camel@nisroch>
References: <1257520314-16605-1-git-send-email-currojerez@riseup.net>
	<1257520314-16605-2-git-send-email-currojerez@riseup.net>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1257520314-16605-2-git-send-email-currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 2009-11-06 at 16:11 +0100, Francisco Jerez wrote:
> It causes occasional DMA_PUSHER errors.
> 
> Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Reviewed-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c |   12 ++++++++----
>  1 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index a95b8f7..b8c3664 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -604,7 +604,7 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
>  	struct drm_gem_object *gem;
>  	struct nouveau_bo *pbbo;
>  	struct list_head list;
> -	int ret = 0, do_reloc = 0;
> +	int i, ret = 0, do_reloc = 0;
>  
>  	NOUVEAU_CHECK_INITIALISED_WITH_RETURN;
>  	NOUVEAU_GET_USER_CHANNEL_WITH_RETURN(req->channel, file_priv, chan);
> @@ -680,8 +680,8 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
>  	if (!PUSHBUF_CAL) {
>  		uint32_t retaddy;
>  
> -		if (chan->dma.free < 4) {
> -			ret = nouveau_dma_wait(chan, 4);
> +		if (chan->dma.free < 4 + NOUVEAU_DMA_SKIPS) {
> +			ret = nouveau_dma_wait(chan, 4 + NOUVEAU_DMA_SKIPS);
>  			if (ret) {
>  				NV_ERROR(dev, "jmp_space: %d\n", ret);
>  				goto out;
> @@ -738,7 +738,7 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
>  				  req->offset) | 2);
>  		OUT_RING(chan, 0);
>  	} else {
> -		ret = RING_SPACE(chan, 2);
> +		ret = RING_SPACE(chan, 2 + NOUVEAU_DMA_SKIPS);
>  		if (ret) {
>  			NV_ERROR(dev, "jmp_space: %d\n", ret);
>  			goto out;
> @@ -746,6 +746,10 @@ nouveau_gem_ioctl_pushbuf_call(struct drm_device *dev, void *data,
>  		OUT_RING(chan, ((pbbo->bo.mem.mm_node->start << PAGE_SHIFT) +
>  				  req->offset) | 0x20000000);
>  		OUT_RING(chan, 0);
> +
> +		/* Space the jumps apart with NOPs. */
> +		for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
> +			OUT_RING(chan, 0);
>  	}
>  
>  	ret = nouveau_fence_emit(fence);

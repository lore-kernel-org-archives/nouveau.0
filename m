From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix suspend bug in nvc0 fence
	implementation
Date: Tue, 19 Feb 2013 20:49:38 +0100
Message-ID: <20130219194938.GA3080@joi.lan>
References: <CAMuW1wcx8BEkase+S_+bmZp6b+CFunrmAd6PDNaZONFYLfpG-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuW1wcx8BEkase+S_+bmZp6b+CFunrmAd6PDNaZONFYLfpG-g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, Feb 19, 2013 at 10:20:55AM +0000, Maarten Lankhorst wrote:
> Everywhere else the constant is multiplied by 16/4, so it looks like
> nvc0_fence_suspend/resume is buggy here.
> 
> Signed-off-by: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [3.7+]

Yay. It will probably fix https://bugs.freedesktop.org/show_bug.cgi?id=59168.
(note: it doesn't apply on top of nouveau/master)

Reviewed-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> 
> diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c
> b/drivers/gpu/drm/nouveau/nvc0_fence.c
> index 85a0e78..4f46d8b 100644
> --- a/drivers/gpu/drm/nouveau/nvc0_fence.c
> +++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
> @@ -161,11 +161,12 @@ nvc0_fence_suspend(struct nouveau_drm *drm)
>  	struct nouveau_fifo *pfifo = nouveau_fifo(drm->device);
>  	struct nvc0_fence_priv *priv = drm->fence;
>  	int i;
> +	u32 chan = pfifo->max + 1;
> 
> -	priv->suspend = vmalloc((pfifo->max + 1) * sizeof(u32));
> +	priv->suspend = vmalloc(chan * sizeof(u32));
>  	if (priv->suspend) {
> -		for (i = 0; i <= pfifo->max; i++)
> -			priv->suspend[i] = nouveau_bo_rd32(priv->bo, i);
> +		for (i = 0; i < chan; i++)
> +			priv->suspend[i] = nouveau_bo_rd32(priv->bo, i * 16/4);
>  	}
> 
>  	return priv->suspend != NULL;
> @@ -177,10 +178,11 @@ nvc0_fence_resume(struct nouveau_drm *drm)
>  	struct nouveau_fifo *pfifo = nouveau_fifo(drm->device);
>  	struct nvc0_fence_priv *priv = drm->fence;
>  	int i;
> +	u32 chan = pfifo->max + 1;
> 
>  	if (priv->suspend) {
> -		for (i = 0; i <= pfifo->max; i++)
> -			nouveau_bo_wr32(priv->bo, i, priv->suspend[i]);
> +		for (i = 0; i < chan; i++)
> +			nouveau_bo_wr32(priv->bo, i * 16/4, priv->suspend[i]);
>  		vfree(priv->suspend);
>  		priv->suspend = NULL;
>  	}

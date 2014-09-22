From: Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>
Subject: Re: [PATCH] drm/nv84+: fix fence context seqno's
Date: Mon, 22 Sep 2014 10:23:03 -0600
Message-ID: <54204CE7.2010502@tedp.id.au>
References: <541FE720.50504@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <541FE720.50504-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 09/22/2014 03:08 AM, Maarten Lankhorst wrote:
> This fixes a regression introduced by "drm/nouveau: rework to new fence interface"
> (commit 29ba89b2371d466).
> 
> The fence sequence should not be reset after creation, the old value is used instead.
> On destruction the final value is written, to prevent another source of accidental
> wraparound in case of a channel being destroyed after a hang, and unblocking any other
> channel that may wait on the about-to-be-deleted channel to signal.
> 
> I'm nothing if not optimistic about any hope of recovery from that. ;-)
> 
> Reported-by: Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
> index 7b372a68aa4e..4138db4d8291 100644
> --- a/drivers/gpu/drm/nouveau/nv84_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv84_fence.c
> @@ -120,6 +120,7 @@ nv84_fence_context_del(struct nouveau_channel *chan)
>  		nouveau_bo_vma_del(bo, &fctx->dispc_vma[i]);
>  	}
>  
> +	nouveau_bo_wr32(priv->bo, chan->chid * 16 / 4, fctx->base.sequence);
>  	nouveau_bo_vma_del(priv->bo, &fctx->vma_gart);
>  	nouveau_bo_vma_del(priv->bo, &fctx->vma);
>  	nouveau_fence_context_del(&fctx->base);
> @@ -159,8 +160,6 @@ nv84_fence_context_new(struct nouveau_channel *chan)
>  		ret = nouveau_bo_vma_add(bo, cli->vm, &fctx->dispc_vma[i]);
>  	}
>  
> -	nouveau_bo_wr32(priv->bo, chan->chid * 16/4, 0x00000000);
> -
>  	if (ret)
>  		nv84_fence_context_del(chan);
>  	return ret;
> 

This works, thanks :-)

Tested-by: Ted Percival <ted-QSfhGDxlWt8QrrorzV6ljw@public.gmane.org>

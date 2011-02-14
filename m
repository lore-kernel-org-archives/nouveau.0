From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/nouveau: decode PFIFO DMA_PUSHER
 error codes
Date: Mon, 14 Feb 2011 11:26:03 +1000
Message-ID: <1297646767.2037.0.camel@nisroch>
References: <1297626403-3349-1-git-send-email-marcin.slusarz@gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1297626403-3349-1-git-send-email-marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2011-02-13 at 20:46 +0100, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Thanks, pushed.

Ben.
> ---
>  drivers/gpu/drm/nouveau/nv04_fifo.c |   17 ++++++++++++++---
>  1 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nv04_fifo.c b/drivers/gpu/drm/nouveau/nv04_fifo.c
> index f89d104..dfa600c 100644
> --- a/drivers/gpu/drm/nouveau/nv04_fifo.c
> +++ b/drivers/gpu/drm/nouveau/nv04_fifo.c
> @@ -379,6 +379,15 @@ out:
>  	return handled;
>  }
>  
> +static const char *nv_dma_state_err(u32 state)
> +{
> +	static const char * const desc[] = {
> +		"NONE", "CALL_SUBR_ACTIVE", "INVALID_MTHD", "RET_SUBR_INACTIVE",
> +		"INVALID_CMD", "IB_EMPTY"/* NV50+ */, "MEM_FAULT", "UNK"
> +	};
> +	return desc[(state >> 29) & 0x7];
> +}
> +
>  void
>  nv04_fifo_isr(struct drm_device *dev)
>  {
> @@ -460,9 +469,10 @@ nv04_fifo_isr(struct drm_device *dev)
>  				if (nouveau_ratelimit())
>  					NV_INFO(dev, "PFIFO_DMA_PUSHER - Ch %d Get 0x%02x%08x "
>  					     "Put 0x%02x%08x IbGet 0x%08x IbPut 0x%08x "
> -					     "State 0x%08x Push 0x%08x\n",
> +					     "State 0x%08x (err: %s) Push 0x%08x\n",
>  						chid, ho_get, dma_get, ho_put,
>  						dma_put, ib_get, ib_put, state,
> +						nv_dma_state_err(state),
>  						push);
>  
>  				/* METHOD_COUNT, in DMA_STATE on earlier chipsets */
> @@ -476,8 +486,9 @@ nv04_fifo_isr(struct drm_device *dev)
>  				}
>  			} else {
>  				NV_INFO(dev, "PFIFO_DMA_PUSHER - Ch %d Get 0x%08x "
> -					     "Put 0x%08x State 0x%08x Push 0x%08x\n",
> -					chid, dma_get, dma_put, state, push);
> +					     "Put 0x%08x State 0x%08x (err: %s) Push 0x%08x\n",
> +					chid, dma_get, dma_put, state,
> +					nv_dma_state_err(state), push);
>  
>  				if (dma_get != dma_put)
>  					nv_wr32(dev, 0x003244, dma_put);

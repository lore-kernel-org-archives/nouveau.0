From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix nouveau_mm/nouveau_mm_node
 leak
Date: Fri, 19 Oct 2012 16:05:14 +1000
Message-ID: <20121019060514.GA11173@turiel.bne.redhat.com>
References: <20121011215309.GA3511@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121011215309.GA3511-OI9uyE9O0yo@public.gmane.org>
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

On Thu, Oct 11, 2012 at 11:53:09PM +0200, Marcin Slusarz wrote:
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/core/gpuobj.c         | 6 +++++-
>  drivers/gpu/drm/nouveau/core/include/core/gpuobj.h | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/core/core/gpuobj.c b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> index c2a7608..48121d2 100644
> --- a/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> +++ b/drivers/gpu/drm/nouveau/core/core/gpuobj.c
> @@ -39,8 +39,11 @@ nouveau_gpuobj_destroy(struct nouveau_gpuobj *gpuobj)
>  			nv_wo32(gpuobj, i, 0x00000000);
>  	}
>  
> +	if (gpuobj->node)
> +		nouveau_mm_free(gpuobj->node_heap, &gpuobj->node);
> +
if (gpuobj->node) {
	nouveau_mm_free(&nv_gpuobj(gpuobj->parent)->heap,
			&gpuobj->node);
}

Or something to that effect, instead of having to store the heap
pointer again.

>  	if (gpuobj->heap.block_size)
> -		nouveau_mm_fini(&gpuobj->heap);
> +		WARN_ON(nouveau_mm_fini(&gpuobj->heap));
Alright, I get this.  However, perhaps we should go the full hog here
and make nouveau_mm_fini() directly do the WARN_ON() in this situation?

There was, once upon a time, reasons for it not doing this, I don't
believe they're valid anymore though.

If you want to do this, that'd be great.  Bonus points for being in a
separate patch :)

>  
>  	nouveau_object_destroy(&gpuobj->base);
>  }
> @@ -114,6 +117,7 @@ nouveau_gpuobj_create_(struct nouveau_object *parent,
>  				      max(align, (u32)1), &gpuobj->node);
>  		if (ret)
>  			return ret;
> +		gpuobj->node_heap = heap;
>  
>  		gpuobj->addr += gpuobj->node->offset;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h b/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
> index d09adf1..f65bf5b 100644
> --- a/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
> +++ b/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
> @@ -16,7 +16,10 @@ struct nouveau_vm;
>  struct nouveau_gpuobj {
>  	struct nouveau_object base;
>  	struct nouveau_object *parent;
> +
> +	struct nouveau_mm *node_heap;
>  	struct nouveau_mm_node *node;
> +
>  	struct nouveau_mm heap;
>  
>  	u32 flags;
> -- 
> 1.7.12
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

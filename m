From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix takedown in move_notify
Date: Mon, 10 Dec 2012 16:39:20 +0000
Message-ID: <50C61038.1020208@gmail.com>
References: <50ACD3F5.6010007@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50ACD3F5.6010007-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 21/11/12 13:15, Maarten Lankhorst wrote:
> move_notify is called by ttm after the the object is idle and about
> to be destroyed. Clean up the vm list properly in that case.
> 
> This is not a problem right now, since the list should already be
> empty, but if it wasn't empty, vm_put was not called which leads to
> random corruption later.
> 
> With this fix, nouveau_gem_object_close can be safely changed to a noop,
> forcing the vm bindings to be removed when the original object is. This
> is not done in this patch since it may lead to the object staying mapped
> in the vm space until the gem object refcount drops to 0. This shouldn't
> be a big issue however.
> 
> If we choose to do so does allow us to use ttm's delayed destruction
> mechanism to unmap vm after object is idle, resulting in ioread32 no
> longer taking up 30% of cpu in Team Fortress 2 if I don't do the vma
> unmap in nouveau_gem_object_close.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> 
Hi Maarten

I've noticed ioread32 of up-to 40% on of cpu my system. With your patch
if goes down to ~3% with no side effects. Frame-rate appears to be
slightly improved, although it's hard to say.

Is there any reason for holding this patch ?
For what it's worth you can add

Tested-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35ac57f..e8a47f0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1139,12 +1139,22 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
>  	if (bo->destroy != nouveau_bo_del_ttm)
>  		return;
>  
> +	if (!new_mem) {
> +		while (!list_empty(&nvbo->vma_list)) {
> +			vma = list_first_entry(&nvbo->vma_list, struct nouveau_vma, head);
> +
> +			nouveau_vm_unmap(vma);
> +			nouveau_vm_put(vma);
> +			list_del(&vma->head);
> +		}
> +		return;
> +	}
> +
>  	list_for_each_entry(vma, &nvbo->vma_list, head) {
> -		if (new_mem && new_mem->mem_type == TTM_PL_VRAM) {
> +		if (new_mem->mem_type == TTM_PL_VRAM) {
>  			nouveau_vm_map(vma, new_mem->mm_node);
> -		} else
> -		if (new_mem && new_mem->mem_type == TTM_PL_TT &&
> -		    nvbo->page_shift == vma->vm->vmm->spg_shift) {
> +		} else if (new_mem->mem_type == TTM_PL_TT &&
> +		           nvbo->page_shift == vma->vm->vmm->spg_shift) {
>  			if (((struct nouveau_mem *)new_mem->mm_node)->sg)
>  				nouveau_vm_map_sg_table(vma, 0, new_mem->
>  						  num_pages << PAGE_SHIFT,
> @@ -1153,8 +1163,6 @@ nouveau_bo_move_ntfy(struct ttm_buffer_object *bo, struct ttm_mem_reg *new_mem)
>  				nouveau_vm_map_sg(vma, 0, new_mem->
>  						  num_pages << PAGE_SHIFT,
>  						  new_mem->mm_node);
> -		} else {
> -			nouveau_vm_unmap(vma);
>  		}
>  	}
>  }
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
> 

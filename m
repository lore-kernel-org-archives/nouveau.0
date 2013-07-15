From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: kill
 nouveau_ttm_fault_reserve_notify handler to prevent useless buffer moves
Date: Mon, 15 Jul 2013 16:05:54 +1000
Message-ID: <CACAvsv74X7xU0BkfhN0gXHvFG+Ooe=7wrFBzKnqUF7PMeB5wLw@mail.gmail.com>
References: <51DFFA52.6010102@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <51DFFA52.6010102-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 12, 2013 at 10:45 PM, Maarten Lankhorst
<maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> I have no idea what this bogus restriction on placement is, but it breaks decoding 1080p
> VDPAU at boot speed. With this patch applied I only need to bump the vdec clock to
> get real-time 1080p decoding. It prevents a lot of VRAM <-> VRAM buffer moves.
It's not bogus, and is required for pre-GF8 boards with VRAM > BAR size.

What configuration does the buffer that's getting moved here have
exactly?  The placement restriction isn't necessary on GF8, the rest
of the restrictions may currently be required still however.

Ben.


>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index d506da5..86eb321 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1339,34 +1339,6 @@ nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_mem_reg *mem)
>  }
>
>  static int
> -nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
> -{
> -       struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
> -       struct nouveau_bo *nvbo = nouveau_bo(bo);
> -       struct nouveau_device *device = nv_device(drm->device);
> -       u32 mappable = pci_resource_len(device->pdev, 1) >> PAGE_SHIFT;
> -
> -       /* as long as the bo isn't in vram, and isn't tiled, we've got
> -        * nothing to do here.
> -        */
> -       if (bo->mem.mem_type != TTM_PL_VRAM) {
> -               if (nv_device(drm->device)->card_type < NV_50 ||
> -                   !nouveau_bo_tile_layout(nvbo))
> -                       return 0;
> -       }
> -
> -       /* make sure bo is in mappable vram */
> -       if (bo->mem.start + bo->mem.num_pages < mappable)
> -               return 0;
> -
> -
> -       nvbo->placement.fpfn = 0;
> -       nvbo->placement.lpfn = mappable;
> -       nouveau_bo_placement_set(nvbo, TTM_PL_FLAG_VRAM, 0);
> -       return nouveau_bo_validate(nvbo, false, false);
> -}
> -
> -static int
>  nouveau_ttm_tt_populate(struct ttm_tt *ttm)
>  {
>         struct ttm_dma_tt *ttm_dma = (void *)ttm;
> @@ -1524,7 +1496,6 @@ struct ttm_bo_driver nouveau_bo_driver = {
>         .sync_obj_flush = nouveau_bo_fence_flush,
>         .sync_obj_unref = nouveau_bo_fence_unref,
>         .sync_obj_ref = nouveau_bo_fence_ref,
> -       .fault_reserve_notify = &nouveau_ttm_fault_reserve_notify,
>         .io_mem_reserve = &nouveau_ttm_io_mem_reserve,
>         .io_mem_free = &nouveau_ttm_io_mem_free,
>  };
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

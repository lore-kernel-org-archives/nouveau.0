From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 09/21] drm/nouveau: Introduce GEM object functions
Date: Wed, 16 Sep 2020 14:04:24 +0200
Message-ID: <20200916120424.GM438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-10-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-10-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, andrey.grodzovsky-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, miaoqinglang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, matthew.auld-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andi.shyti-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marek.olsak@amd.c
List-Id: nouveau.vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:46PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in nouveau.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>

Hm ttm and gem mmap world still quite disjoint ... Anyway that's an
entirely different thing.

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  9 ---------
>  drivers/gpu/drm/nouveau/nouveau_gem.c   | 13 +++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_gem.h   |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_prime.c |  2 ++
>  4 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 42fc5c813a9b..72640bca1617 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1207,16 +1207,7 @@ driver_stub = {
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_pin = nouveau_gem_prime_pin,
> -	.gem_prime_unpin = nouveau_gem_prime_unpin,
> -	.gem_prime_get_sg_table = nouveau_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
> -	.gem_prime_vmap = nouveau_gem_prime_vmap,
> -	.gem_prime_vunmap = nouveau_gem_prime_vunmap,
> -
> -	.gem_free_object_unlocked = nouveau_gem_object_del,
> -	.gem_open_object = nouveau_gem_object_open,
> -	.gem_close_object = nouveau_gem_object_close,
>  
>  	.dumb_create = nouveau_display_dumb_create,
>  	.dumb_map_offset = nouveau_display_dumb_map_offset,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 89adadf4706b..28e0cbb00876 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -169,6 +169,17 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
>  	ttm_bo_unreserve(&nvbo->bo);
>  }
>  
> +const struct drm_gem_object_funcs nouveau_gem_object_funcs = {
> +	.free = nouveau_gem_object_del,
> +	.open = nouveau_gem_object_open,
> +	.close = nouveau_gem_object_close,
> +	.pin = nouveau_gem_prime_pin,
> +	.unpin = nouveau_gem_prime_unpin,
> +	.get_sg_table = nouveau_gem_prime_get_sg_table,
> +	.vmap = nouveau_gem_prime_vmap,
> +	.vunmap = nouveau_gem_prime_vunmap,
> +};
> +
>  int
>  nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  		uint32_t tile_mode, uint32_t tile_flags,
> @@ -186,6 +197,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
>  	if (IS_ERR(nvbo))
>  		return PTR_ERR(nvbo);
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
> index 978e07591990..b35c180322e2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
> @@ -5,6 +5,8 @@
>  #include "nouveau_drv.h"
>  #include "nouveau_bo.h"
>  
> +extern const struct drm_gem_object_funcs nouveau_gem_object_funcs;
> +
>  static inline struct nouveau_bo *
>  nouveau_gem_object(struct drm_gem_object *gem)
>  {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
> index b2ecb91f8ddc..a8264aebf3d4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -77,6 +77,8 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
>  
>  	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_GART;
>  
> +	nvbo->bo.base.funcs = &nouveau_gem_object_funcs;
> +
>  	/* Initialize the embedded gem-object. We return a single gem-reference
>  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
>  	ret = drm_gem_object_init(dev, &nvbo->bo.base, size);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

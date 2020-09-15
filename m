From: Russell King - ARM Linux admin <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: Re: [PATCH v2 02/21] drm/armada: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:07:42 +0100
Message-ID: <20200915150742.GO1551@shell.armlinux.org.uk>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-3-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-3-tzimmermann-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, chunkuang.hu-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rodrigosiqueiramelo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, oleksandr_andrushchenko@epa
List-Id: nouveau.vger.kernel.org

On Tue, Sep 15, 2020 at 04:59:39PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in armada.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>

Acked-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>

Thanks.

> ---
>  drivers/gpu/drm/armada/armada_drv.c |  3 ---
>  drivers/gpu/drm/armada/armada_gem.c | 12 +++++++++++-
>  drivers/gpu/drm/armada/armada_gem.h |  2 --
>  3 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
> index 980d3f1f8f16..22247cfce80b 100644
> --- a/drivers/gpu/drm/armada/armada_drv.c
> +++ b/drivers/gpu/drm/armada/armada_drv.c
> @@ -37,13 +37,10 @@ DEFINE_DRM_GEM_FOPS(armada_drm_fops);
>  
>  static struct drm_driver armada_drm_driver = {
>  	.lastclose		= drm_fb_helper_lastclose,
> -	.gem_free_object_unlocked = armada_gem_free_object,
>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> -	.gem_prime_export	= armada_gem_prime_export,
>  	.gem_prime_import	= armada_gem_prime_import,
>  	.dumb_create		= armada_gem_dumb_create,
> -	.gem_vm_ops		= &armada_gem_vm_ops,
>  	.major			= 1,
>  	.minor			= 0,
>  	.name			= "armada-drm",
> diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
> index ecf8a55e93d9..c343fbefe47c 100644
> --- a/drivers/gpu/drm/armada/armada_gem.c
> +++ b/drivers/gpu/drm/armada/armada_gem.c
> @@ -25,7 +25,7 @@ static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
>  	return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
>  }
>  
> -const struct vm_operations_struct armada_gem_vm_ops = {
> +static const struct vm_operations_struct armada_gem_vm_ops = {
>  	.fault	= armada_gem_vm_fault,
>  	.open	= drm_gem_vm_open,
>  	.close	= drm_gem_vm_close,
> @@ -184,6 +184,12 @@ armada_gem_map_object(struct drm_device *dev, struct armada_gem_object *dobj)
>  	return dobj->addr;
>  }
>  
> +static const struct drm_gem_object_funcs armada_gem_object_funcs = {
> +	.free = armada_gem_free_object,
> +	.export = armada_gem_prime_export,
> +	.vm_ops = &armada_gem_vm_ops,
> +};
> +
>  struct armada_gem_object *
>  armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  {
> @@ -195,6 +201,8 @@ armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	drm_gem_private_object_init(dev, &obj->obj, size);
>  
>  	DRM_DEBUG_DRIVER("alloc private obj %p size %zu\n", obj, size);
> @@ -214,6 +222,8 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,
>  	if (!obj)
>  		return NULL;
>  
> +	obj->obj.funcs = &armada_gem_object_funcs;
> +
>  	if (drm_gem_object_init(dev, &obj->obj, size)) {
>  		kfree(obj);
>  		return NULL;
> diff --git a/drivers/gpu/drm/armada/armada_gem.h b/drivers/gpu/drm/armada/armada_gem.h
> index de04cc2c8f0e..ffcc7e8dd351 100644
> --- a/drivers/gpu/drm/armada/armada_gem.h
> +++ b/drivers/gpu/drm/armada/armada_gem.h
> @@ -21,8 +21,6 @@ struct armada_gem_object {
>  	void			*update_data;
>  };
>  
> -extern const struct vm_operations_struct armada_gem_vm_ops;
> -
>  #define drm_to_armada_gem(o) container_of(o, struct armada_gem_object, obj)
>  
>  void armada_gem_free_object(struct drm_gem_object *);
> -- 
> 2.28.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

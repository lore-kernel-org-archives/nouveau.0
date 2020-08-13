From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 10/20] drm/omapdrm: Introduce GEM object functions
Date: Thu, 13 Aug 2020 16:38:53 +0300
Message-ID: <20200813133853.GK6057@pendragon.ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-11-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200813083644.31711-11-tzimmermann@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com, mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, olek
List-Id: nouveau.vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Thu, Aug 13, 2020 at 10:36:34AM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in omapdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c |  9 ---------
>  drivers/gpu/drm/omapdrm/omap_gem.c | 16 +++++++++++++++-
>  drivers/gpu/drm/omapdrm/omap_gem.h |  1 -
>  3 files changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index 53d5e184ee77..2e598b8b72af 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -521,12 +521,6 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
>  	return 0;
>  }
>  
> -static const struct vm_operations_struct omap_gem_vm_ops = {
> -	.fault = omap_gem_fault,
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -
>  static const struct file_operations omapdriver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -549,10 +543,7 @@ static struct drm_driver omap_drm_driver = {
>  #endif
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> -	.gem_prime_export = omap_gem_prime_export,
>  	.gem_prime_import = omap_gem_prime_import,
> -	.gem_free_object_unlocked = omap_gem_free_object,
> -	.gem_vm_ops = &omap_gem_vm_ops,
>  	.dumb_create = omap_gem_dumb_create,
>  	.dumb_map_offset = omap_gem_dumb_map_offset,
>  	.ioctls = ioctls,
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
> index d0d12d5dd76c..d68dc63dea0a 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -487,7 +487,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
>   * vma->vm_private_data points to the GEM object that is backing this
>   * mapping.
>   */
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf)
> +static vm_fault_t omap_gem_fault(struct vm_fault *vmf)
>  {
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct drm_gem_object *obj = vma->vm_private_data;
> @@ -1169,6 +1169,18 @@ static bool omap_gem_validate_flags(struct drm_device *dev, u32 flags)
>  	return true;
>  }
>  
> +static const struct vm_operations_struct omap_gem_vm_ops = {
> +	.fault = omap_gem_fault,
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
> +static const struct drm_gem_object_funcs omap_gem_object_funcs = {
> +	.free = omap_gem_free_object,
> +	.export = omap_gem_prime_export,
> +	.vm_ops = &omap_gem_vm_ops,
> +};
> +
>  /* GEM buffer object constructor */
>  struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		union omap_gem_size gsize, u32 flags)
> @@ -1236,6 +1248,8 @@ struct drm_gem_object *omap_gem_new(struct drm_device *dev,
>  		size = PAGE_ALIGN(gsize.bytes);
>  	}
>  
> +	obj->funcs = &omap_gem_object_funcs;
> +
>  	/* Initialize the GEM object. */
>  	if (!(flags & OMAP_BO_MEM_SHMEM)) {
>  		drm_gem_private_object_init(dev, obj, size);
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
> index 729b7812a815..9e6b5c8195d9 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.h
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.h
> @@ -69,7 +69,6 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags);
>  struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
>  		struct dma_buf *buffer);
>  
> -vm_fault_t omap_gem_fault(struct vm_fault *vmf);

I like how this function now becomes internal to omap_gem.c.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  int omap_gem_roll(struct drm_gem_object *obj, u32 roll);
>  void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff);
>  void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,

-- 
Regards,

Laurent Pinchart

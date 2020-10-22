From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v5 08/10] drm/gem: Store client buffer mappings as struct
 dma_buf_map
Date: Thu, 22 Oct 2020 10:49:19 +0200
Message-ID: <20201022084919.GU401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-9-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201020122046.31167-9-tzimmermann-l3A5Bk7waGM@public.gmane.org>
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
Cc: luben.tuikov-5C7GfCeVMHo@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org, melissa.srw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, ray.huang-5C7GfCeVMHo@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lima-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steven.price-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, alyssa.rosenzweig-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, virtualization@lists
List-Id: nouveau.vger.kernel.org

On Tue, Oct 20, 2020 at 02:20:44PM +0200, Thomas Zimmermann wrote:
> Kernel DRM clients now store their framebuffer address in an instance
> of struct dma_buf_map. Depending on the buffer's location, the address
> refers to system or I/O memory.
> 
> Callers of drm_client_buffer_vmap() receive a copy of the value in
> the call's supplied arguments. It can be accessed and modified with
> dma_buf_map interfaces.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> Tested-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_client.c    | 34 +++++++++++++++++++--------------
>  drivers/gpu/drm/drm_fb_helper.c | 23 +++++++++++++---------
>  include/drm/drm_client.h        |  7 ++++---
>  3 files changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index ac0082bed966..fe573acf1067 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	struct drm_device *dev = buffer->client->dev;
>  
> -	drm_gem_vunmap(buffer->gem, buffer->vaddr);
> +	drm_gem_vunmap(buffer->gem, &buffer->map);
>  
>  	if (buffer->gem)
>  		drm_gem_object_put(buffer->gem);
> @@ -291,25 +291,31 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height, u
>  /**
>   * drm_client_buffer_vmap - Map DRM client buffer into address space
>   * @buffer: DRM client buffer
> + * @map_copy: Returns the mapped memory's address
>   *
>   * This function maps a client buffer into kernel address space. If the
> - * buffer is already mapped, it returns the mapping's address.
> + * buffer is already mapped, it returns the existing mapping's address.
>   *
>   * Client buffer mappings are not ref'counted. Each call to
>   * drm_client_buffer_vmap() should be followed by a call to
>   * drm_client_buffer_vunmap(); or the client buffer should be mapped
>   * throughout its lifetime.
>   *
> + * The returned address is a copy of the internal value. In contrast to
> + * other vmap interfaces, you don't need it for the client's vunmap
> + * function. So you can modify it at will during blit and draw operations.
> + *
>   * Returns:
> - *	The mapped memory's address
> + *	0 on success, or a negative errno code otherwise.
>   */
> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
> +int
> +drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map_copy)
>  {
> -	struct dma_buf_map map;
> +	struct dma_buf_map *map = &buffer->map;
>  	int ret;
>  
> -	if (buffer->vaddr)
> -		return buffer->vaddr;
> +	if (dma_buf_map_is_set(map))
> +		goto out;
>  
>  	/*
>  	 * FIXME: The dependency on GEM here isn't required, we could
> @@ -319,13 +325,14 @@ void *drm_client_buffer_vmap(struct drm_client_buffer *buffer)
>  	 * fd_install step out of the driver backend hooks, to make that
>  	 * final step optional for internal users.
>  	 */
> -	ret = drm_gem_vmap(buffer->gem, &map);
> +	ret = drm_gem_vmap(buffer->gem, map);
>  	if (ret)
> -		return ERR_PTR(ret);
> +		return ret;
>  
> -	buffer->vaddr = map.vaddr;
> +out:
> +	*map_copy = *map;
>  
> -	return map.vaddr;
> +	return 0;
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vmap);
>  
> @@ -339,10 +346,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
>   */
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  {
> -	struct dma_buf_map map = DMA_BUF_MAP_INIT_VADDR(buffer->vaddr);
> +	struct dma_buf_map *map = &buffer->map;
>  
> -	drm_gem_vunmap(buffer->gem, &map);
> -	buffer->vaddr = NULL;
> +	drm_gem_vunmap(buffer->gem, map);
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap);
>  
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index c2f72bb6afb1..6212cd7cde1d 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -378,7 +378,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
>  	unsigned int cpp = fb->format->cpp[0];
>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> -	void *dst = fb_helper->buffer->vaddr + offset;
> +	void *dst = fb_helper->buffer->map.vaddr + offset;
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> @@ -400,7 +400,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  	struct drm_clip_rect *clip = &helper->dirty_clip;
>  	struct drm_clip_rect clip_copy;
>  	unsigned long flags;
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	spin_lock_irqsave(&helper->dirty_lock, flags);
>  	clip_copy = *clip;
> @@ -413,8 +414,8 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  
>  		/* Generic fbdev uses a shadow buffer */
>  		if (helper->buffer) {
> -			vaddr = drm_client_buffer_vmap(helper->buffer);
> -			if (IS_ERR(vaddr))
> +			ret = drm_client_buffer_vmap(helper->buffer, &map);
> +			if (ret)
>  				return;
>  			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
>  		}
> @@ -2060,7 +2061,8 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  	struct drm_framebuffer *fb;
>  	struct fb_info *fbi;
>  	u32 format;
> -	void *vaddr;
> +	struct dma_buf_map map;
> +	int ret;
>  
>  	drm_dbg_kms(dev, "surface width(%d), height(%d) and bpp(%d)\n",
>  		    sizes->surface_width, sizes->surface_height,
> @@ -2096,11 +2098,14 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
>  		fb_deferred_io_init(fbi);
>  	} else {
>  		/* buffer is mapped for HW framebuffer */
> -		vaddr = drm_client_buffer_vmap(fb_helper->buffer);
> -		if (IS_ERR(vaddr))
> -			return PTR_ERR(vaddr);
> +		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
> +		if (ret)
> +			return ret;
> +		if (map.is_iomem)
> +			fbi->screen_base = map.vaddr_iomem;
> +		else
> +			fbi->screen_buffer = map.vaddr;
>  
> -		fbi->screen_buffer = vaddr;
>  		/* Shamelessly leak the physical address to user-space */
>  #if IS_ENABLED(CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
>  		if (drm_leak_fbdev_smem && fbi->fix.smem_start == 0)

Just noticed a tiny thing here: I think this needs to be patched to only
set smem_start when the map is _not_ iomem. Since virt_to_page isn't
defined on iomem at all.

I guess it'd be neat if we can set this for iomem too, but I have no idea
how to convert an iomem pointer back to a bus_addr_t ...

Cheers, Daniel

> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 7aaea665bfc2..f07f2fb02e75 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -3,6 +3,7 @@
>  #ifndef _DRM_CLIENT_H_
>  #define _DRM_CLIENT_H_
>  
> +#include <linux/dma-buf-map.h>
>  #include <linux/lockdep.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
> @@ -141,9 +142,9 @@ struct drm_client_buffer {
>  	struct drm_gem_object *gem;
>  
>  	/**
> -	 * @vaddr: Virtual address for the buffer
> +	 * @map: Virtual address for the buffer
>  	 */
> -	void *vaddr;
> +	struct dma_buf_map map;
>  
>  	/**
>  	 * @fb: DRM framebuffer
> @@ -155,7 +156,7 @@ struct drm_client_buffer *
>  drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
>  void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>  int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
> -void *drm_client_buffer_vmap(struct drm_client_buffer *buffer);
> +int drm_client_buffer_vmap(struct drm_client_buffer *buffer, struct dma_buf_map *map);
>  void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  
>  int drm_client_modeset_create(struct drm_client_dev *client);
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

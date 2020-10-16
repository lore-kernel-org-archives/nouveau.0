From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 10/10] drm/fb_helper: Support framebuffers in I/O memory
Date: Fri, 16 Oct 2020 14:03:47 +0200
Message-ID: <20201016120347.GB1125266@ravnborg.org>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-11-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201015123806.32416-11-tzimmermann-l3A5Bk7waGM@public.gmane.org>
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
Cc: luben.tuikov-5C7GfCeVMHo@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org, melissa.srw-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, ray.huang-5C7GfCeVMHo@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, sumit.semwal-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lima-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, steven.price-5wv7dgnIgG8@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alyssa.rosenzweig-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEmxxBWXNxL4zz@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Thomas.

On Thu, Oct 15, 2020 at 02:38:06PM +0200, Thomas Zimmermann wrote:
> At least sparc64 requires I/O-specific access to framebuffers. This
> patch updates the fbdev console accordingly.
> 
> For drivers with direct access to the framebuffer memory, the callback
> functions in struct fb_ops test for the type of memory and call the rsp
> fb_sys_ of fb_cfb_ functions.
> 
> For drivers that employ a shadow buffer, fbdev's blit function retrieves
> the framebuffer address as struct dma_buf_map, and uses dma_buf_map
> interfaces to access the buffer.
> 
> The bochs driver on sparc64 uses a workaround to flag the framebuffer as
> I/O memory and avoid a HW exception. With the introduction of struct
> dma_buf_map, this is not required any longer. The patch removes the rsp
> code from both, bochs and fbdev.
> 
> v4:
> 	* move dma_buf_map changes into separate patch (Daniel)
> 	* TODO list: comment on fbdev updates (Daniel)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>

The original workaround fixed it so we could run qemu with the
-nographic option.

So I went ahead and tried to run quemu version:
v5.0.0-1970-g0b100c8e72-dirty.
And with the BOCHS driver built-in.

With the following command line:
qemu-system-sparc64 -m 512 -kernel vmlinux -append console=ttyS0 -nographic

Behaviour was the same before and after applying this patch.
(panic due to VFS: Unable to mount root fs on unknown-block(0,0))
So I consider it fixed for real now and not just a workaround.

I also tested with:
qemu-system-sparc64 -m 512 -kernel vmlinux -append console=ttyS0 -serial stdio

and it worked in both cases too.

All the comments above so future-me have an easier time finding how to
reproduce.

Tested-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

	Sam

> ---
>  Documentation/gpu/todo.rst        |  19 ++-
>  drivers/gpu/drm/bochs/bochs_kms.c |   1 -
>  drivers/gpu/drm/drm_fb_helper.c   | 217 ++++++++++++++++++++++++++++--
>  include/drm/drm_mode_config.h     |  12 --
>  4 files changed, 220 insertions(+), 29 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7e6fc3c04add..638b7f704339 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -197,13 +197,28 @@ Convert drivers to use drm_fbdev_generic_setup()
>  ------------------------------------------------
>  
>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> -expects the framebuffer in system memory (or system-like memory).
> +atomic modesetting and GEM vmap support. Historically, generic fbdev emulation
> +expected the framebuffer in system memory or system-like memory. By employing
> +struct dma_buf_map, drivers with frambuffers in I/O memory can be supported
> +as well.
>  
>  Contact: Maintainer of the driver you plan to convert
>  
>  Level: Intermediate
>  
> +Reimplement functions in drm_fbdev_fb_ops without fbdev
> +-------------------------------------------------------
> +
> +A number of callback functions in drm_fbdev_fb_ops could benefit from
> +being rewritten without dependencies on the fbdev module. Some of the
> +helpers could further benefit from using struct dma_buf_map instead of
> +raw pointers.
> +
> +Contact: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Daniel Vetter
> +
> +Level: Advanced
> +
> +
>  drm_framebuffer_funcs and drm_mode_config_funcs.fb_create cleanup
>  -----------------------------------------------------------------
>  
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index 13d0d04c4457..853081d186d5 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -151,7 +151,6 @@ int bochs_kms_init(struct bochs_device *bochs)
>  	bochs->dev->mode_config.preferred_depth = 24;
>  	bochs->dev->mode_config.prefer_shadow = 0;
>  	bochs->dev->mode_config.prefer_shadow_fbdev = 1;
> -	bochs->dev->mode_config.fbdev_use_iomem = true;
>  	bochs->dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
>  
>  	bochs->dev->mode_config.funcs = &bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 6212cd7cde1d..462b0c130ebb 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -372,24 +372,22 @@ static void drm_fb_helper_resume_worker(struct work_struct *work)
>  }
>  
>  static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
> -					  struct drm_clip_rect *clip)
> +					  struct drm_clip_rect *clip,
> +					  struct dma_buf_map *dst)
>  {
>  	struct drm_framebuffer *fb = fb_helper->fb;
>  	unsigned int cpp = fb->format->cpp[0];
>  	size_t offset = clip->y1 * fb->pitches[0] + clip->x1 * cpp;
>  	void *src = fb_helper->fbdev->screen_buffer + offset;
> -	void *dst = fb_helper->buffer->map.vaddr + offset;
>  	size_t len = (clip->x2 - clip->x1) * cpp;
>  	unsigned int y;
>  
> -	for (y = clip->y1; y < clip->y2; y++) {
> -		if (!fb_helper->dev->mode_config.fbdev_use_iomem)
> -			memcpy(dst, src, len);
> -		else
> -			memcpy_toio((void __iomem *)dst, src, len);
> +	dma_buf_map_incr(dst, offset); /* go to first pixel within clip rect */
>  
> +	for (y = clip->y1; y < clip->y2; y++) {
> +		dma_buf_map_memcpy_to(dst, src, len);
> +		dma_buf_map_incr(dst, fb->pitches[0]);
>  		src += fb->pitches[0];
> -		dst += fb->pitches[0];
>  	}
>  }
>  
> @@ -417,8 +415,9 @@ static void drm_fb_helper_dirty_work(struct work_struct *work)
>  			ret = drm_client_buffer_vmap(helper->buffer, &map);
>  			if (ret)
>  				return;
> -			drm_fb_helper_dirty_blit_real(helper, &clip_copy);
> +			drm_fb_helper_dirty_blit_real(helper, &clip_copy, &map);
>  		}
> +
>  		if (helper->fb->funcs->dirty)
>  			helper->fb->funcs->dirty(helper->fb, NULL, 0, 0,
>  						 &clip_copy, 1);
> @@ -755,6 +754,136 @@ void drm_fb_helper_sys_imageblit(struct fb_info *info,
>  }
>  EXPORT_SYMBOL(drm_fb_helper_sys_imageblit);
>  
> +static ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
> +				      size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *dst;
> +	u8 __iomem *src;
> +	int c, err = 0;
> +	unsigned long total_size;
> +	unsigned long alloc_size;
> +	ssize_t ret = 0;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p >= total_size)
> +		return 0;
> +
> +	if (count >= total_size)
> +		count = total_size;
> +
> +	if (count + p > total_size)
> +		count = total_size - p;
> +
> +	src = (u8 __iomem *)(info->screen_base + p);
> +
> +	alloc_size = min(count, PAGE_SIZE);
> +
> +	dst = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!dst)
> +		return -ENOMEM;
> +
> +	while (count) {
> +		c = min(count, alloc_size);
> +
> +		memcpy_fromio(dst, src, c);
> +		if (copy_to_user(buf, dst, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +
> +		src += c;
> +		*ppos += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(dst);
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
> +static ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
> +				       size_t count, loff_t *ppos)
> +{
> +	unsigned long p = *ppos;
> +	u8 *src;
> +	u8 __iomem *dst;
> +	int c, err = 0;
> +	unsigned long total_size;
> +	unsigned long alloc_size;
> +	ssize_t ret = 0;
> +
> +	if (info->state != FBINFO_STATE_RUNNING)
> +		return -EPERM;
> +
> +	total_size = info->screen_size;
> +
> +	if (total_size == 0)
> +		total_size = info->fix.smem_len;
> +
> +	if (p > total_size)
> +		return -EFBIG;
> +
> +	if (count > total_size) {
> +		err = -EFBIG;
> +		count = total_size;
> +	}
> +
> +	if (count + p > total_size) {
> +		/*
> +		 * The framebuffer is too small. We do the
> +		 * copy operation, but return an error code
> +		 * afterwards. Taken from fbdev.
> +		 */
> +		if (!err)
> +			err = -ENOSPC;
> +		count = total_size - p;
> +	}
> +
> +	alloc_size = min(count, PAGE_SIZE);
> +
> +	src = kmalloc(alloc_size, GFP_KERNEL);
> +	if (!src)
> +		return -ENOMEM;
> +
> +	dst = (u8 __iomem *)(info->screen_base + p);
> +
> +	while (count) {
> +		c = min(count, alloc_size);
> +
> +		if (copy_from_user(src, buf, c)) {
> +			err = -EFAULT;
> +			break;
> +		}
> +		memcpy_toio(dst, src, c);
> +
> +		dst += c;
> +		*ppos += c;
> +		buf += c;
> +		ret += c;
> +		count -= c;
> +	}
> +
> +	kfree(src);
> +
> +	if (err)
> +		return err;
> +
> +	return ret;
> +}
> +
>  /**
>   * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
>   * @info: fbdev registered by the helper
> @@ -2027,6 +2156,66 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>  		return -ENODEV;
>  }
>  
> +static ssize_t drm_fbdev_fb_read(struct fb_info *info, char __user *buf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		return drm_fb_helper_sys_read(info, buf, count, ppos);
> +	else
> +		return drm_fb_helper_cfb_read(info, buf, count, ppos);
> +}
> +
> +static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
> +				  size_t count, loff_t *ppos)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		return drm_fb_helper_sys_write(info, buf, count, ppos);
> +	else
> +		return drm_fb_helper_cfb_write(info, buf, count, ppos);
> +}
> +
> +static void drm_fbdev_fb_fillrect(struct fb_info *info,
> +				  const struct fb_fillrect *rect)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_fillrect(info, rect);
> +	else
> +		drm_fb_helper_cfb_fillrect(info, rect);
> +}
> +
> +static void drm_fbdev_fb_copyarea(struct fb_info *info,
> +				  const struct fb_copyarea *area)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_copyarea(info, area);
> +	else
> +		drm_fb_helper_cfb_copyarea(info, area);
> +}
> +
> +static void drm_fbdev_fb_imageblit(struct fb_info *info,
> +				   const struct fb_image *image)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_client_buffer *buffer = fb_helper->buffer;
> +
> +	if (drm_fbdev_use_shadow_fb(fb_helper) || !buffer->map.is_iomem)
> +		drm_fb_helper_sys_imageblit(info, image);
> +	else
> +		drm_fb_helper_cfb_imageblit(info, image);
> +}
> +
>  static const struct fb_ops drm_fbdev_fb_ops = {
>  	.owner		= THIS_MODULE,
>  	DRM_FB_HELPER_DEFAULT_OPS,
> @@ -2034,11 +2223,11 @@ static const struct fb_ops drm_fbdev_fb_ops = {
>  	.fb_release	= drm_fbdev_fb_release,
>  	.fb_destroy	= drm_fbdev_fb_destroy,
>  	.fb_mmap	= drm_fbdev_fb_mmap,
> -	.fb_read	= drm_fb_helper_sys_read,
> -	.fb_write	= drm_fb_helper_sys_write,
> -	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> -	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> -	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_read	= drm_fbdev_fb_read,
> +	.fb_write	= drm_fbdev_fb_write,
> +	.fb_fillrect	= drm_fbdev_fb_fillrect,
> +	.fb_copyarea	= drm_fbdev_fb_copyarea,
> +	.fb_imageblit	= drm_fbdev_fb_imageblit,
>  };
>  
>  static struct fb_deferred_io drm_fbdev_defio = {
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 5ffbb4ed5b35..ab424ddd7665 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -877,18 +877,6 @@ struct drm_mode_config {
>  	 */
>  	bool prefer_shadow_fbdev;
>  
> -	/**
> -	 * @fbdev_use_iomem:
> -	 *
> -	 * Set to true if framebuffer reside in iomem.
> -	 * When set to true memcpy_toio() is used when copying the framebuffer in
> -	 * drm_fb_helper.drm_fb_helper_dirty_blit_real().
> -	 *
> -	 * FIXME: This should be replaced with a per-mapping is_iomem
> -	 * flag (like ttm does), and then used everywhere in fbdev code.
> -	 */
> -	bool fbdev_use_iomem;
> -
>  	/**
>  	 * @quirk_addfb_prefer_xbgr_30bpp:
>  	 *
> -- 
> 2.28.0

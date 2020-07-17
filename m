From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Accept 'legacy' format modifiers
Date: Fri, 17 Jul 2020 21:47:51 +0200
Message-ID: <20200717194751.GS3278063@phenom.ffwll.local>
References: <20200717185757.2786-1-jajones@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200717185757.2786-1-jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Kirill A . Shutemov" <kirill-oKw7cIdHH8eLwutG50LtGA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 17, 2020 at 11:57:57AM -0700, James Jones wrote:
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers.
> 
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> and sway 1.5

Just bikeshed, but maybe a few more words on what exactly is broken and
how this works around it. Specifically why we only accept these, but don't
advertise them.

> 
> Signed-off-by: James Jones <jajones-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Needs Fixes: line here. Also nice to mention the bug reporter/link.

> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>  		   uint32_t *tile_mode,
>  		   uint8_t *kind)
>  {
> +	struct nouveau_display *disp = nouveau_display(drm->dev);
>  	BUG_ON(!tile_mode || !kind);
>  
> +	if ((modifier & (0xffull << 12)) == 0ull) {
> +		/* Legacy modifier.  Translate to this device's 'kind.' */
> +		modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +	}

Hm I tried to understand what this magic does by looking at drm_fourcc.h,
but the drm_fourcc_canonicalize_nvidia_format_mod() in there implements
something else. Is that function wrong, or should we use it here instead?

Or is there something else going on entirely?

Cheers, Daniel

> +
>  	if (modifier == DRM_FORMAT_MOD_LINEAR) {
>  		/* tile_mode will not be used in this case */
>  		*tile_mode = 0;
> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>  	}
>  }
>  
> +static const u64 legacy_modifiers[] = {
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
> +	DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
>  static int
>  nouveau_validate_decode_mod(struct nouveau_drm *drm,
>  			    uint64_t modifier,
> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>  	     (disp->format_modifiers[mod] != modifier);
>  	     mod++);
>  
> -	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> -		return -EINVAL;
> +	if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
> +		for (mod = 0;
> +		     (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> +		     (legacy_modifiers[mod] != modifier);
> +		     mod++);
> +		if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> +			return -EINVAL;
> +	}
>  
>  	nouveau_decode_mod(drm, modifier, tile_mode, kind);
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

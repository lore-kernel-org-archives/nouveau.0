From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
Date: Thu, 13 Dec 2012 21:26:12 +0900
Message-ID: <00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
Content-language: ko
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: 'Daniel Vetter' <daniel.vetter@ffwll.ch>, 'DRI Development' <dri-devel@lists.freedesktop.org>
Cc: 'Nouveau Dev' <nouveau@lists.freedesktop.org>, 'Intel Graphics Development' <intel-gfx@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org



> -----Original Message-----
> From: dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org
> [mailto:dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org] On
> Behalf Of Daniel Vetter
> Sent: Thursday, December 13, 2012 8:05 PM
> To: DRI Development
> Cc: Nouveau Dev; Intel Graphics Development; Daniel Vetter
> Subject: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
> 
> For user framebuffers it's easier to just inline the
> exynos_drm_framebuffer_init helper instead of trying to adjust it -
> most of the things that helper sets up need to be overwritten anyway
> again due to the multiple backing storage objects support exynos has,
> but does not use for the fbdev.
> 

Hi Daniel,

I'd rebase this patch to -next. This patch is conflicted with -next.
And if there is no any problem after test, will apply it.

Thanks,
Inki Dae

> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c |   32
++++++++++++++++++++--------
> ----
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index 4ef4cd3..aea6500 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -136,15 +136,15 @@ exynos_drm_framebuffer_init(struct drm_device *dev,
>  		return ERR_PTR(-ENOMEM);
>  	}
> 
> +	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
> +	exynos_fb->exynos_gem_obj[0] = to_exynos_gem_obj(obj);
> +
>  	ret = drm_framebuffer_init(dev, &exynos_fb->fb,
> &exynos_drm_fb_funcs);
>  	if (ret) {
>  		DRM_ERROR("failed to initialize framebuffer\n");
>  		return ERR_PTR(ret);
>  	}
> 
> -	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
> -	exynos_fb->exynos_gem_obj[0] = to_exynos_gem_obj(obj);
> -
>  	return &exynos_fb->fb;
>  }
> 
> @@ -190,9 +190,8 @@ exynos_user_fb_create(struct drm_device *dev, struct
> drm_file *file_priv,
>  		      struct drm_mode_fb_cmd2 *mode_cmd)
>  {
>  	struct drm_gem_object *obj;
> -	struct drm_framebuffer *fb;
>  	struct exynos_drm_fb *exynos_fb;
> -	int i;
> +	int i, ret;
> 
>  	DRM_DEBUG_KMS("%s\n", __FILE__);
> 
> @@ -202,13 +201,13 @@ exynos_user_fb_create(struct drm_device *dev, struct
> drm_file *file_priv,
>  		return ERR_PTR(-ENOENT);
>  	}
> 
> -	fb = exynos_drm_framebuffer_init(dev, mode_cmd, obj);
> -	if (IS_ERR(fb)) {
> -		drm_gem_object_unreference_unlocked(obj);
> -		return fb;
> +	exynos_fb = kzalloc(sizeof(*exynos_fb), GFP_KERNEL);
> +	if (!exynos_fb) {
> +		DRM_ERROR("failed to allocate exynos drm framebuffer\n");
> +		return ERR_PTR(-ENOMEM);
>  	}
> 
> -	exynos_fb = to_exynos_fb(fb);
> +	drm_helper_mode_fill_fb_struct(&exynos_fb->fb, mode_cmd);
>  	exynos_fb->buf_cnt = exynos_drm_format_num_buffers(mode_cmd);
> 
>  	DRM_DEBUG_KMS("buf_cnt = %d\n", exynos_fb->buf_cnt);
> @@ -218,14 +217,23 @@ exynos_user_fb_create(struct drm_device *dev, struct
> drm_file *file_priv,
>  				mode_cmd->handles[i]);
>  		if (!obj) {
>  			DRM_ERROR("failed to lookup gem object\n");
> -			exynos_drm_fb_destroy(fb);
> +			kfree(exynos_fb);
>  			return ERR_PTR(-ENOENT);
>  		}
> 
>  		exynos_fb->exynos_gem_obj[i] = to_exynos_gem_obj(obj);
>  	}
> 
> -	return fb;
> +	ret = drm_framebuffer_init(dev, &exynos_fb->fb,
> &exynos_drm_fb_funcs);
> +	if (ret) {
> +		for (i = 0; i < exynos_fb->buf_cnt; i++)
> +			drm_gem_object_unreference_unlocked(&exynos_fb-
> >exynos_gem_obj[i]->base);
> +
> +		kfree(exynos_fb);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return &exynos_fb->fb;
>  }
> 
>  struct exynos_drm_gem_buf *exynos_drm_fb_buffer(struct drm_framebuffer
> *fb,
> --
> 1.7.10.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

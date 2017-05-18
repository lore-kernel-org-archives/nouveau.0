From: Sinclair Yeh <syeh@vmware.com>
Subject: Re: [PATCH v3] drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to
 UAPI
Date: Thu, 18 May 2017 09:24:40 -0700
Message-ID: <20170518162439.GB73131@ubuntu>
References: <20170518013911.29626-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170518013911.29626-1-robert.foss@collabora.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>
Cc: liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, airlied@linux.ie, linux@armlinux.org.uk, boris.brezillon@free-electrons.com, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, p.zabel@pengutronix.de, robdclark@gmail.com, bskeggs@redhat.com, tomi.valkeinen@ti.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, architt@codeaurora.org, ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

vmwgfx part: Reviewed-by: Sinclair Yeh <syeh@vmware.com>

On Wed, May 17, 2017 at 09:39:11PM -0400, Robert Foss wrote:
> Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ defines to the UAPI
> as a convenience.
> 
> Ideally the DRM_ROTATE_ and DRM_REFLECT_ property ids are looked up
> through the atomic API, but realizing that userspace is likely to take
> shortcuts and assume that the enum values are what is sent over the
> wire.
> 
> As a result these defines are provided purely as a convenience to
> userspace applications.
> 
> Signed-off-by: Robert Foss <robert.foss@collabora.com>
> ---
> Changes since v2:
>  - Changed define prefix from DRM_MODE_PROP_ to DRM_MODE_
>  - Fix compilation errors
>  - Changed comment formatting
>  - Deduplicated comment lines
>  - Clarified DRM_MODE_PROP_REFLECT_ comment
> 
> Changes since v1:
>  - Moved defines from drm.h to drm_mode.h
>  - Changed define prefix from DRM_ to DRM_MODE_PROP_ 
>  - Updated uses of the defines to the new prefix
>  - Removed include from drm_rect.c
>  - Stopped using the BIT() macro 
> 
>  drivers/gpu/drm/arm/malidp_drv.h                |  2 +-
>  drivers/gpu/drm/arm/malidp_planes.c             | 18 ++++-----
>  drivers/gpu/drm/armada/armada_overlay.c         |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 20 +++++-----
>  drivers/gpu/drm/drm_atomic.c                    |  2 +-
>  drivers/gpu/drm/drm_atomic_helper.c             |  2 +-
>  drivers/gpu/drm/drm_blend.c                     | 43 ++++++++++-----------
>  drivers/gpu/drm/drm_fb_helper.c                 |  4 +-
>  drivers/gpu/drm/drm_plane_helper.c              |  2 +-
>  drivers/gpu/drm/drm_rect.c                      | 36 +++++++++---------
>  drivers/gpu/drm/i915/i915_debugfs.c             | 14 +++----
>  drivers/gpu/drm/i915/intel_atomic_plane.c       |  6 +--
>  drivers/gpu/drm/i915/intel_display.c            | 50 ++++++++++++-------------
>  drivers/gpu/drm/i915/intel_fbc.c                |  2 +-
>  drivers/gpu/drm/i915/intel_fbdev.c              |  2 +-
>  drivers/gpu/drm/i915/intel_sprite.c             | 20 +++++-----
>  drivers/gpu/drm/imx/ipuv3-plane.c               |  2 +-
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c       | 30 +++++++--------
>  drivers/gpu/drm/nouveau/nv50_display.c          |  2 +-
>  drivers/gpu/drm/omapdrm/omap_drv.c              |  4 +-
>  drivers/gpu/drm/omapdrm/omap_fb.c               | 18 ++++-----
>  drivers/gpu/drm/omapdrm/omap_plane.c            | 16 ++++----
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c             |  4 +-
>  include/drm/drm_blend.h                         | 21 +----------
>  include/uapi/drm/drm_mode.h                     | 49 +++++++++++++++++++++++-
>  25 files changed, 201 insertions(+), 170 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/malidp_drv.h
> index 040311ffcaec..2e2033140efc 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.h
> +++ b/drivers/gpu/drm/arm/malidp_drv.h
> @@ -65,6 +65,6 @@ void malidp_de_planes_destroy(struct drm_device *drm);
>  int malidp_crtc_init(struct drm_device *drm);
>  
>  /* often used combination of rotational bits */
> -#define MALIDP_ROTATED_MASK	(DRM_ROTATE_90 | DRM_ROTATE_270)
> +#define MALIDP_ROTATED_MASK	(DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270)
>  
>  #endif  /* __MALIDP_DRV_H__ */
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 814fda23cead..063a8d2b0be3 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -80,7 +80,7 @@ static void malidp_plane_reset(struct drm_plane *plane)
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
>  	if (state) {
>  		state->base.plane = plane;
> -		state->base.rotation = DRM_ROTATE_0;
> +		state->base.rotation = DRM_MODE_ROTATE_0;
>  		plane->state = &state->base;
>  	}
>  }
> @@ -221,7 +221,7 @@ static int malidp_de_plane_check(struct drm_plane *plane,
>  		return ret;
>  
>  	/* packed RGB888 / BGR888 can't be rotated or flipped */
> -	if (state->rotation != DRM_ROTATE_0 &&
> +	if (state->rotation != DRM_MODE_ROTATE_0 &&
>  	    (fb->format->format == DRM_FORMAT_RGB888 ||
>  	     fb->format->format == DRM_FORMAT_BGR888))
>  		return -EINVAL;
> @@ -315,12 +315,12 @@ static void malidp_de_plane_update(struct drm_plane *plane,
>  	val &= ~LAYER_ROT_MASK;
>  
>  	/* setup the rotation and axis flip bits */
> -	if (plane->state->rotation & DRM_ROTATE_MASK)
> -		val |= ilog2(plane->state->rotation & DRM_ROTATE_MASK) <<
> +	if (plane->state->rotation & DRM_MODE_ROTATE_MASK)
> +		val |= ilog2(plane->state->rotation & DRM_MODE_ROTATE_MASK) <<
>  		       LAYER_ROT_OFFSET;
> -	if (plane->state->rotation & DRM_REFLECT_X)
> +	if (plane->state->rotation & DRM_MODE_REFLECT_X)
>  		val |= LAYER_H_FLIP;
> -	if (plane->state->rotation & DRM_REFLECT_Y)
> +	if (plane->state->rotation & DRM_MODE_REFLECT_Y)
>  		val |= LAYER_V_FLIP;
>  
>  	/*
> @@ -370,8 +370,8 @@ int malidp_de_planes_init(struct drm_device *drm)
>  	struct malidp_plane *plane = NULL;
>  	enum drm_plane_type plane_type;
>  	unsigned long crtcs = 1 << drm->mode_config.num_crtc;
> -	unsigned long flags = DRM_ROTATE_0 | DRM_ROTATE_90 | DRM_ROTATE_180 |
> -			      DRM_ROTATE_270 | DRM_REFLECT_X | DRM_REFLECT_Y;
> +	unsigned long flags = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
> +			      DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>  	u32 *formats;
>  	int ret, i, j, n;
>  
> @@ -420,7 +420,7 @@ int malidp_de_planes_init(struct drm_device *drm)
>  			continue;
>  		}
>  
> -		drm_plane_create_rotation_property(&plane->base, DRM_ROTATE_0, flags);
> +		drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0, flags);
>  		malidp_hw_write(malidp->dev, MALIDP_ALPHA_LUT,
>  				plane->layer->base + MALIDP_LAYER_COMPOSE);
>  	}
> diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
> index 424e465ff407..e9a29df4b443 100644
> --- a/drivers/gpu/drm/armada/armada_overlay.c
> +++ b/drivers/gpu/drm/armada/armada_overlay.c
> @@ -125,7 +125,7 @@ armada_ovl_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  				 src_x, src_y, src_w, src_h);
>  
>  	ret = drm_plane_helper_check_update(plane, crtc, fb, &src, &dest, &clip,
> -					    DRM_ROTATE_0,
> +					    DRM_MODE_ROTATE_0,
>  					    0, INT_MAX, true, false, &visible);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index 29cc10d053eb..1124200bb280 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -678,8 +678,8 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  		if (!state->bpp[i])
>  			return -EINVAL;
>  
> -		switch (state->base.rotation & DRM_ROTATE_MASK) {
> -		case DRM_ROTATE_90:
> +		switch (state->base.rotation & DRM_MODE_ROTATE_MASK) {
> +		case DRM_MODE_ROTATE_90:
>  			offset = ((y_offset + state->src_y + patched_src_w - 1) /
>  				  ydiv) * fb->pitches[i];
>  			offset += ((x_offset + state->src_x) / xdiv) *
> @@ -688,7 +688,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  					  fb->pitches[i];
>  			state->pstride[i] = -fb->pitches[i] - state->bpp[i];
>  			break;
> -		case DRM_ROTATE_180:
> +		case DRM_MODE_ROTATE_180:
>  			offset = ((y_offset + state->src_y + patched_src_h - 1) /
>  				  ydiv) * fb->pitches[i];
>  			offset += ((x_offset + state->src_x + patched_src_w - 1) /
> @@ -697,7 +697,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  					   state->bpp[i]) - fb->pitches[i];
>  			state->pstride[i] = -2 * state->bpp[i];
>  			break;
> -		case DRM_ROTATE_270:
> +		case DRM_MODE_ROTATE_270:
>  			offset = ((y_offset + state->src_y) / ydiv) *
>  				 fb->pitches[i];
>  			offset += ((x_offset + state->src_x + patched_src_h - 1) /
> @@ -707,7 +707,7 @@ static int atmel_hlcdc_plane_atomic_check(struct drm_plane *p,
>  					  (2 * state->bpp[i]);
>  			state->pstride[i] = fb->pitches[i] - state->bpp[i];
>  			break;
> -		case DRM_ROTATE_0:
> +		case DRM_MODE_ROTATE_0:
>  		default:
>  			offset = ((y_offset + state->src_y) / ydiv) *
>  				 fb->pitches[i];
> @@ -864,11 +864,11 @@ static int atmel_hlcdc_plane_init_properties(struct atmel_hlcdc_plane *plane,
>  		int ret;
>  
>  		ret = drm_plane_create_rotation_property(&plane->base,
> -							 DRM_ROTATE_0,
> -							 DRM_ROTATE_0 |
> -							 DRM_ROTATE_90 |
> -							 DRM_ROTATE_180 |
> -							 DRM_ROTATE_270);
> +							 DRM_MODE_ROTATE_0,
> +							 DRM_MODE_ROTATE_0 |
> +							 DRM_MODE_ROTATE_90 |
> +							 DRM_MODE_ROTATE_180 |
> +							 DRM_MODE_ROTATE_270);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index f32506a7c1d6..f434d79de37e 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -769,7 +769,7 @@ int drm_atomic_plane_set_property(struct drm_plane *plane,
>  	} else if (property == config->prop_src_h) {
>  		state->src_h = val;
>  	} else if (property == plane->rotation_property) {
> -		if (!is_power_of_2(val & DRM_ROTATE_MASK))
> +		if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
>  			return -EINVAL;
>  		state->rotation = val;
>  	} else if (property == plane->zpos_property) {
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 8be9719284b0..165baa9a37e1 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3220,7 +3220,7 @@ void drm_atomic_helper_plane_reset(struct drm_plane *plane)
>  
>  	if (plane->state) {
>  		plane->state->plane = plane;
> -		plane->state->rotation = DRM_ROTATE_0;
> +		plane->state->rotation = DRM_MODE_ROTATE_0;
>  	}
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index a0d0d6843288..6202b13e4a4f 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -119,15 +119,15 @@
>   * drm_property_create_bitmask()) called "rotation" and has the following
>   * bitmask enumaration values:
>   *
> - * DRM_ROTATE_0:
> + * DRM_MODE_ROTATE_0:
>   * 	"rotate-0"
> - * DRM_ROTATE_90:
> + * DRM_MODE_ROTATE_90:
>   * 	"rotate-90"
> - * DRM_ROTATE_180:
> + * DRM_MODE_ROTATE_180:
>   * 	"rotate-180"
> - * DRM_ROTATE_270:
> + * DRM_MODE_ROTATE_270:
>   * 	"rotate-270"
> - * DRM_REFLECT_X:
> + * DRM_MODE_REFLECT_X:
>   * 	"reflect-x"
>   * DRM_REFELCT_Y:
>   * 	"reflect-y"
> @@ -142,17 +142,17 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int supported_rotations)
>  {
>  	static const struct drm_prop_enum_list props[] = {
> -		{ __builtin_ffs(DRM_ROTATE_0) - 1,   "rotate-0" },
> -		{ __builtin_ffs(DRM_ROTATE_90) - 1,  "rotate-90" },
> -		{ __builtin_ffs(DRM_ROTATE_180) - 1, "rotate-180" },
> -		{ __builtin_ffs(DRM_ROTATE_270) - 1, "rotate-270" },
> -		{ __builtin_ffs(DRM_REFLECT_X) - 1,  "reflect-x" },
> -		{ __builtin_ffs(DRM_REFLECT_Y) - 1,  "reflect-y" },
> +		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
>  	};
>  	struct drm_property *prop;
>  
> -	WARN_ON((supported_rotations & DRM_ROTATE_MASK) == 0);
> -	WARN_ON(!is_power_of_2(rotation & DRM_ROTATE_MASK));
> +	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
> +	WARN_ON(!is_power_of_2(rotation & DRM_MODE_ROTATE_MASK));
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> @@ -178,14 +178,14 @@ EXPORT_SYMBOL(drm_plane_create_rotation_property);
>   * @supported_rotations: Supported rotations
>   *
>   * Attempt to simplify the rotation to a form that is supported.
> - * Eg. if the hardware supports everything except DRM_REFLECT_X
> + * Eg. if the hardware supports everything except DRM_MODE_REFLECT_X
>   * one could call this function like this:
>   *
> - * drm_rotation_simplify(rotation, DRM_ROTATE_0 |
> - *                       DRM_ROTATE_90 | DRM_ROTATE_180 |
> - *                       DRM_ROTATE_270 | DRM_REFLECT_Y);
> + * drm_rotation_simplify(rotation, DRM_MODE_ROTATE_0 |
> + *                       DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
> + *                       DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_Y);
>   *
> - * to eliminate the DRM_ROTATE_X flag. Depending on what kind of
> + * to eliminate the DRM_MODE_ROTATE_X flag. Depending on what kind of
>   * transforms the hardware supports, this function may not
>   * be able to produce a supported transform, so the caller should
>   * check the result afterwards.
> @@ -194,9 +194,10 @@ unsigned int drm_rotation_simplify(unsigned int rotation,
>  				   unsigned int supported_rotations)
>  {
>  	if (rotation & ~supported_rotations) {
> -		rotation ^= DRM_REFLECT_X | DRM_REFLECT_Y;
> -		rotation = (rotation & DRM_REFLECT_MASK) |
> -		           BIT((ffs(rotation & DRM_ROTATE_MASK) + 1) % 4);
> +		rotation ^= DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
> +		rotation = (rotation & DRM_MODE_REFLECT_MASK) |
> +		           BIT((ffs(rotation & DRM_MODE_ROTATE_MASK) + 1)
> +		           % 4);
>  	}
>  
>  	return rotation;
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 1f178b878e42..574af01d3ce9 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -378,7 +378,7 @@ static int restore_fbdev_mode_atomic(struct drm_fb_helper *fb_helper)
>  			goto fail;
>  		}
>  
> -		plane_state->rotation = DRM_ROTATE_0;
> +		plane_state->rotation = DRM_MODE_ROTATE_0;
>  
>  		plane->old_fb = plane->fb;
>  		plane_mask |= 1 << drm_plane_index(plane);
> @@ -431,7 +431,7 @@ static int restore_fbdev_mode_legacy(struct drm_fb_helper *fb_helper)
>  		if (plane->rotation_property)
>  			drm_mode_plane_set_obj_prop(plane,
>  						    plane->rotation_property,
> -						    DRM_ROTATE_0);
> +						    DRM_MODE_ROTATE_0);
>  	}
>  
>  	for (i = 0; i < fb_helper->crtc_count; i++) {
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index b84a295230fc..ac1c514cad2c 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -336,7 +336,7 @@ int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  
>  	ret = drm_plane_helper_check_update(plane, crtc, fb,
>  					    &src, &dest, &clip,
> -					    DRM_ROTATE_0,
> +					    DRM_MODE_ROTATE_0,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    false, false, &visible);
> diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
> index bc5575960ebc..9817c1445ba9 100644
> --- a/drivers/gpu/drm/drm_rect.c
> +++ b/drivers/gpu/drm/drm_rect.c
> @@ -310,38 +310,38 @@ void drm_rect_rotate(struct drm_rect *r,
>  {
>  	struct drm_rect tmp;
>  
> -	if (rotation & (DRM_REFLECT_X | DRM_REFLECT_Y)) {
> +	if (rotation & (DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y)) {
>  		tmp = *r;
>  
> -		if (rotation & DRM_REFLECT_X) {
> +		if (rotation & DRM_MODE_REFLECT_X) {
>  			r->x1 = width - tmp.x2;
>  			r->x2 = width - tmp.x1;
>  		}
>  
> -		if (rotation & DRM_REFLECT_Y) {
> +		if (rotation & DRM_MODE_REFLECT_Y) {
>  			r->y1 = height - tmp.y2;
>  			r->y2 = height - tmp.y1;
>  		}
>  	}
>  
> -	switch (rotation & DRM_ROTATE_MASK) {
> -	case DRM_ROTATE_0:
> +	switch (rotation & DRM_MODE_ROTATE_MASK) {
> +	case DRM_MODE_ROTATE_0:
>  		break;
> -	case DRM_ROTATE_90:
> +	case DRM_MODE_ROTATE_90:
>  		tmp = *r;
>  		r->x1 = tmp.y1;
>  		r->x2 = tmp.y2;
>  		r->y1 = width - tmp.x2;
>  		r->y2 = width - tmp.x1;
>  		break;
> -	case DRM_ROTATE_180:
> +	case DRM_MODE_ROTATE_180:
>  		tmp = *r;
>  		r->x1 = width - tmp.x2;
>  		r->x2 = width - tmp.x1;
>  		r->y1 = height - tmp.y2;
>  		r->y2 = height - tmp.y1;
>  		break;
> -	case DRM_ROTATE_270:
> +	case DRM_MODE_ROTATE_270:
>  		tmp = *r;
>  		r->x1 = height - tmp.y2;
>  		r->x2 = height - tmp.y1;
> @@ -373,8 +373,8 @@ EXPORT_SYMBOL(drm_rect_rotate);
>   * them when doing a rotatation and its inverse.
>   * That is, if you do ::
>   *
> - *     drm_rotate(&r, width, height, rotation);
> - *     drm_rotate_inv(&r, width, height, rotation);
> + *     DRM_MODE_PROP_ROTATE(&r, width, height, rotation);
> + *     DRM_MODE_ROTATE_inv(&r, width, height, rotation);
>   *
>   * you will always get back the original rectangle.
>   */
> @@ -384,24 +384,24 @@ void drm_rect_rotate_inv(struct drm_rect *r,
>  {
>  	struct drm_rect tmp;
>  
> -	switch (rotation & DRM_ROTATE_MASK) {
> -	case DRM_ROTATE_0:
> +	switch (rotation & DRM_MODE_ROTATE_MASK) {
> +	case DRM_MODE_ROTATE_0:
>  		break;
> -	case DRM_ROTATE_90:
> +	case DRM_MODE_ROTATE_90:
>  		tmp = *r;
>  		r->x1 = width - tmp.y2;
>  		r->x2 = width - tmp.y1;
>  		r->y1 = tmp.x1;
>  		r->y2 = tmp.x2;
>  		break;
> -	case DRM_ROTATE_180:
> +	case DRM_MODE_ROTATE_180:
>  		tmp = *r;
>  		r->x1 = width - tmp.x2;
>  		r->x2 = width - tmp.x1;
>  		r->y1 = height - tmp.y2;
>  		r->y2 = height - tmp.y1;
>  		break;
> -	case DRM_ROTATE_270:
> +	case DRM_MODE_ROTATE_270:
>  		tmp = *r;
>  		r->x1 = tmp.y1;
>  		r->x2 = tmp.y2;
> @@ -412,15 +412,15 @@ void drm_rect_rotate_inv(struct drm_rect *r,
>  		break;
>  	}
>  
> -	if (rotation & (DRM_REFLECT_X | DRM_REFLECT_Y)) {
> +	if (rotation & (DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y)) {
>  		tmp = *r;
>  
> -		if (rotation & DRM_REFLECT_X) {
> +		if (rotation & DRM_MODE_REFLECT_X) {
>  			r->x1 = width - tmp.x2;
>  			r->x2 = width - tmp.x1;
>  		}
>  
> -		if (rotation & DRM_REFLECT_Y) {
> +		if (rotation & DRM_MODE_REFLECT_Y) {
>  			r->y1 = height - tmp.y2;
>  			r->y2 = height - tmp.y1;
>  		}
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index d689e511744e..bf6d4498a94a 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -3095,17 +3095,17 @@ static const char *plane_rotation(unsigned int rotation)
>  {
>  	static char buf[48];
>  	/*
> -	 * According to doc only one DRM_ROTATE_ is allowed but this
> +	 * According to doc only one DRM_MODE_ROTATE_ is allowed but this
>  	 * will print them all to visualize if the values are misused
>  	 */
>  	snprintf(buf, sizeof(buf),
>  		 "%s%s%s%s%s%s(0x%08x)",
> -		 (rotation & DRM_ROTATE_0) ? "0 " : "",
> -		 (rotation & DRM_ROTATE_90) ? "90 " : "",
> -		 (rotation & DRM_ROTATE_180) ? "180 " : "",
> -		 (rotation & DRM_ROTATE_270) ? "270 " : "",
> -		 (rotation & DRM_REFLECT_X) ? "FLIPX " : "",
> -		 (rotation & DRM_REFLECT_Y) ? "FLIPY " : "",
> +		 (rotation & DRM_MODE_ROTATE_0) ? "0 " : "",
> +		 (rotation & DRM_MODE_ROTATE_90) ? "90 " : "",
> +		 (rotation & DRM_MODE_ROTATE_180) ? "180 " : "",
> +		 (rotation & DRM_MODE_ROTATE_270) ? "270 " : "",
> +		 (rotation & DRM_MODE_REFLECT_X) ? "FLIPX " : "",
> +		 (rotation & DRM_MODE_REFLECT_Y) ? "FLIPY " : "",
>  		 rotation);
>  
>  	return buf;
> diff --git a/drivers/gpu/drm/i915/intel_atomic_plane.c b/drivers/gpu/drm/i915/intel_atomic_plane.c
> index cfb47293fd53..a40c82c65450 100644
> --- a/drivers/gpu/drm/i915/intel_atomic_plane.c
> +++ b/drivers/gpu/drm/i915/intel_atomic_plane.c
> @@ -55,7 +55,7 @@ intel_create_plane_state(struct drm_plane *plane)
>  		return NULL;
>  
>  	state->base.plane = plane;
> -	state->base.rotation = DRM_ROTATE_0;
> +	state->base.rotation = DRM_MODE_ROTATE_0;
>  	state->ckey.flags = I915_SET_COLORKEY_NONE;
>  
>  	return state;
> @@ -178,8 +178,8 @@ int intel_plane_atomic_check_with_state(struct intel_crtc_state *crtc_state,
>  
>  	/* CHV ignores the mirror bit when the rotate bit is set :( */
>  	if (IS_CHERRYVIEW(dev_priv) &&
> -	    state->rotation & DRM_ROTATE_180 &&
> -	    state->rotation & DRM_REFLECT_X) {
> +	    state->rotation & DRM_MODE_ROTATE_180 &&
> +	    state->rotation & DRM_MODE_REFLECT_X) {
>  		DRM_DEBUG_KMS("Cannot rotate and reflect at the same time\n");
>  		return -EINVAL;
>  	}
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index 3617927af269..016aa3f6e69a 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -2468,7 +2468,7 @@ intel_fill_fb_info(struct drm_i915_private *dev_priv,
>  
>  		offset = _intel_compute_tile_offset(dev_priv, &x, &y,
>  						    fb, i, fb->pitches[i],
> -						    DRM_ROTATE_0, tile_size);
> +						    DRM_MODE_ROTATE_0, tile_size);
>  		offset /= tile_size;
>  
>  		if (fb->modifier != DRM_FORMAT_MOD_LINEAR) {
> @@ -2503,7 +2503,7 @@ intel_fill_fb_info(struct drm_i915_private *dev_priv,
>  			drm_rect_rotate(&r,
>  					rot_info->plane[i].width * tile_width,
>  					rot_info->plane[i].height * tile_height,
> -					DRM_ROTATE_270);
> +					DRM_MODE_ROTATE_270);
>  			x = r.x1;
>  			y = r.y1;
>  
> @@ -2939,7 +2939,7 @@ int skl_check_plane_surface(struct intel_plane_state *plane_state)
>  	if (drm_rotation_90_or_270(rotation))
>  		drm_rect_rotate(&plane_state->base.src,
>  				fb->width << 16, fb->height << 16,
> -				DRM_ROTATE_270);
> +				DRM_MODE_ROTATE_270);
>  
>  	/*
>  	 * Handle the AUX surface first since
> @@ -3017,10 +3017,10 @@ static u32 i9xx_plane_ctl(const struct intel_crtc_state *crtc_state,
>  	    fb->modifier == I915_FORMAT_MOD_X_TILED)
>  		dspcntr |= DISPPLANE_TILED;
>  
> -	if (rotation & DRM_ROTATE_180)
> +	if (rotation & DRM_MODE_ROTATE_180)
>  		dspcntr |= DISPPLANE_ROTATE_180;
>  
> -	if (rotation & DRM_REFLECT_X)
> +	if (rotation & DRM_MODE_REFLECT_X)
>  		dspcntr |= DISPPLANE_MIRROR;
>  
>  	return dspcntr;
> @@ -3048,10 +3048,10 @@ int i9xx_check_plane_surface(struct intel_plane_state *plane_state)
>  		int src_w = drm_rect_width(&plane_state->base.src) >> 16;
>  		int src_h = drm_rect_height(&plane_state->base.src) >> 16;
>  
> -		if (rotation & DRM_ROTATE_180) {
> +		if (rotation & DRM_MODE_ROTATE_180) {
>  			src_x += src_w - 1;
>  			src_y += src_h - 1;
> -		} else if (rotation & DRM_REFLECT_X) {
> +		} else if (rotation & DRM_MODE_REFLECT_X) {
>  			src_x += src_w - 1;
>  		}
>  	}
> @@ -3271,17 +3271,17 @@ static u32 skl_plane_ctl_tiling(uint64_t fb_modifier)
>  static u32 skl_plane_ctl_rotation(unsigned int rotation)
>  {
>  	switch (rotation) {
> -	case DRM_ROTATE_0:
> +	case DRM_MODE_ROTATE_0:
>  		break;
>  	/*
> -	 * DRM_ROTATE_ is counter clockwise to stay compatible with Xrandr
> +	 * DRM_MODE_ROTATE_ is counter clockwise to stay compatible with Xrandr
>  	 * while i915 HW rotation is clockwise, thats why this swapping.
>  	 */
> -	case DRM_ROTATE_90:
> +	case DRM_MODE_ROTATE_90:
>  		return PLANE_CTL_ROTATE_270;
> -	case DRM_ROTATE_180:
> +	case DRM_MODE_ROTATE_180:
>  		return PLANE_CTL_ROTATE_180;
> -	case DRM_ROTATE_270:
> +	case DRM_MODE_ROTATE_270:
>  		return PLANE_CTL_ROTATE_90;
>  	default:
>  		MISSING_CASE(rotation);
> @@ -4671,7 +4671,7 @@ int skl_update_scaler_crtc(struct intel_crtc_state *state)
>  	const struct drm_display_mode *adjusted_mode = &state->base.adjusted_mode;
>  
>  	return skl_update_scaler(state, !state->base.active, SKL_CRTC_INDEX,
> -		&state->scaler_state.scaler_id, DRM_ROTATE_0,
> +		&state->scaler_state.scaler_id, DRM_MODE_ROTATE_0,
>  		state->pipe_src_w, state->pipe_src_h,
>  		adjusted_mode->crtc_hdisplay, adjusted_mode->crtc_vdisplay);
>  }
> @@ -9239,7 +9239,7 @@ static u32 i9xx_cursor_ctl(const struct intel_crtc_state *crtc_state,
>  		return 0;
>  	}
>  
> -	if (plane_state->base.rotation & DRM_ROTATE_180)
> +	if (plane_state->base.rotation & DRM_MODE_ROTATE_180)
>  		cntl |= CURSOR_ROTATE_180;
>  
>  	return cntl;
> @@ -9300,7 +9300,7 @@ static void intel_crtc_update_cursor(struct drm_crtc *crtc,
>  
>  		/* ILK+ do this automagically */
>  		if (HAS_GMCH_DISPLAY(dev_priv) &&
> -		    plane_state->base.rotation & DRM_ROTATE_180) {
> +		    plane_state->base.rotation & DRM_MODE_ROTATE_180) {
>  			base += (plane_state->base.crtc_h *
>  				 plane_state->base.crtc_w - 1) * 4;
>  		}
> @@ -13613,22 +13613,22 @@ intel_primary_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
>  
>  	if (INTEL_GEN(dev_priv) >= 9) {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_90 |
> -			DRM_ROTATE_180 | DRM_ROTATE_270;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
> +			DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
>  	} else if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_180 |
> -			DRM_REFLECT_X;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> +			DRM_MODE_REFLECT_X;
>  	} else if (INTEL_GEN(dev_priv) >= 4) {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_180;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>  	} else {
> -		supported_rotations = DRM_ROTATE_0;
> +		supported_rotations = DRM_MODE_ROTATE_0;
>  	}
>  
>  	if (INTEL_GEN(dev_priv) >= 4)
>  		drm_plane_create_rotation_property(&primary->base,
> -						   DRM_ROTATE_0,
> +						   DRM_MODE_ROTATE_0,
>  						   supported_rotations);
>  
>  	drm_plane_helper_add(&primary->base, &intel_plane_helper_funcs);
> @@ -13783,9 +13783,9 @@ intel_cursor_plane_create(struct drm_i915_private *dev_priv, enum pipe pipe)
>  
>  	if (INTEL_GEN(dev_priv) >= 4)
>  		drm_plane_create_rotation_property(&cursor->base,
> -						   DRM_ROTATE_0,
> -						   DRM_ROTATE_0 |
> -						   DRM_ROTATE_180);
> +						   DRM_MODE_ROTATE_0,
> +						   DRM_MODE_ROTATE_0 |
> +						   DRM_MODE_ROTATE_180);
>  
>  	if (INTEL_GEN(dev_priv) >= 9)
>  		state->scaler_id = -1;
> diff --git a/drivers/gpu/drm/i915/intel_fbc.c b/drivers/gpu/drm/i915/intel_fbc.c
> index ded2add18b26..db7f8f0a1f36 100644
> --- a/drivers/gpu/drm/i915/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/intel_fbc.c
> @@ -801,7 +801,7 @@ static bool intel_fbc_can_activate(struct intel_crtc *crtc)
>  		return false;
>  	}
>  	if (INTEL_GEN(dev_priv) <= 4 && !IS_G4X(dev_priv) &&
> -	    cache->plane.rotation != DRM_ROTATE_0) {
> +	    cache->plane.rotation != DRM_MODE_ROTATE_0) {
>  		fbc->no_fbc_reason = "rotation unsupported";
>  		return false;
>  	}
> diff --git a/drivers/gpu/drm/i915/intel_fbdev.c b/drivers/gpu/drm/i915/intel_fbdev.c
> index 332254a8eebe..03347c6ae599 100644
> --- a/drivers/gpu/drm/i915/intel_fbdev.c
> +++ b/drivers/gpu/drm/i915/intel_fbdev.c
> @@ -211,7 +211,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
>  	 * This also validates that any existing fb inherited from the
>  	 * BIOS is suitable for own access.
>  	 */
> -	vma = intel_pin_and_fence_fb_obj(&ifbdev->fb->base, DRM_ROTATE_0);
> +	vma = intel_pin_and_fence_fb_obj(&ifbdev->fb->base, DRM_MODE_ROTATE_0);
>  	if (IS_ERR(vma)) {
>  		ret = PTR_ERR(vma);
>  		goto out_unlock;
> diff --git a/drivers/gpu/drm/i915/intel_sprite.c b/drivers/gpu/drm/i915/intel_sprite.c
> index 8c87c717c7cd..191e14ddde0c 100644
> --- a/drivers/gpu/drm/i915/intel_sprite.c
> +++ b/drivers/gpu/drm/i915/intel_sprite.c
> @@ -398,10 +398,10 @@ static u32 vlv_sprite_ctl(const struct intel_crtc_state *crtc_state,
>  	if (fb->modifier == I915_FORMAT_MOD_X_TILED)
>  		sprctl |= SP_TILED;
>  
> -	if (rotation & DRM_ROTATE_180)
> +	if (rotation & DRM_MODE_ROTATE_180)
>  		sprctl |= SP_ROTATE_180;
>  
> -	if (rotation & DRM_REFLECT_X)
> +	if (rotation & DRM_MODE_REFLECT_X)
>  		sprctl |= SP_MIRROR;
>  
>  	if (key->flags & I915_SET_COLORKEY_SOURCE)
> @@ -533,7 +533,7 @@ static u32 ivb_sprite_ctl(const struct intel_crtc_state *crtc_state,
>  	if (fb->modifier == I915_FORMAT_MOD_X_TILED)
>  		sprctl |= SPRITE_TILED;
>  
> -	if (rotation & DRM_ROTATE_180)
> +	if (rotation & DRM_MODE_ROTATE_180)
>  		sprctl |= SPRITE_ROTATE_180;
>  
>  	if (key->flags & I915_SET_COLORKEY_DESTINATION)
> @@ -674,7 +674,7 @@ static u32 ilk_sprite_ctl(const struct intel_crtc_state *crtc_state,
>  	if (fb->modifier == I915_FORMAT_MOD_X_TILED)
>  		dvscntr |= DVS_TILED;
>  
> -	if (rotation & DRM_ROTATE_180)
> +	if (rotation & DRM_MODE_ROTATE_180)
>  		dvscntr |= DVS_ROTATE_180;
>  
>  	if (key->flags & I915_SET_COLORKEY_DESTINATION)
> @@ -1145,15 +1145,15 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
>  
>  	if (INTEL_GEN(dev_priv) >= 9) {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_90 |
> -			DRM_ROTATE_180 | DRM_ROTATE_270;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
> +			DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
>  	} else if (IS_CHERRYVIEW(dev_priv) && pipe == PIPE_B) {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_180 |
> -			DRM_REFLECT_X;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> +			DRM_MODE_REFLECT_X;
>  	} else {
>  		supported_rotations =
> -			DRM_ROTATE_0 | DRM_ROTATE_180;
> +			DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
>  	}
>  
>  	intel_plane->pipe = pipe;
> @@ -1180,7 +1180,7 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
>  		goto fail;
>  
>  	drm_plane_create_rotation_property(&intel_plane->base,
> -					   DRM_ROTATE_0,
> +					   DRM_MODE_ROTATE_0,
>  					   supported_rotations);
>  
>  	drm_plane_helper_add(&intel_plane->base, &intel_plane_helper_funcs);
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index d63e853a0300..49546222c6d3 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -273,7 +273,7 @@ void ipu_plane_state_reset(struct drm_plane *plane)
>  
>  	if (ipu_state) {
>  		ipu_state->base.plane = plane;
> -		ipu_state->base.rotation = DRM_ROTATE_0;
> +		ipu_state->base.rotation = DRM_MODE_ROTATE_0;
>  	}
>  
>  	plane->state = &ipu_state->base;
> diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> index a38c5fe6cc19..5e7d9af4cba8 100644
> --- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> @@ -67,11 +67,11 @@ static void mdp5_plane_install_rotation_property(struct drm_device *dev,
>  		struct drm_plane *plane)
>  {
>  	drm_plane_create_rotation_property(plane,
> -					   DRM_ROTATE_0,
> -					   DRM_ROTATE_0 |
> -					   DRM_ROTATE_180 |
> -					   DRM_REFLECT_X |
> -					   DRM_REFLECT_Y);
> +					   DRM_MODE_ROTATE_0,
> +					   DRM_MODE_ROTATE_0 |
> +					   DRM_MODE_ROTATE_180 |
> +					   DRM_MODE_REFLECT_X |
> +					   DRM_MODE_REFLECT_Y);
>  }
>  
>  /* helper to install properties which are common to planes and crtcs */
> @@ -369,14 +369,14 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>  			caps |= MDP_PIPE_CAP_SCALE;
>  
>  		rotation = drm_rotation_simplify(state->rotation,
> -						 DRM_ROTATE_0 |
> -						 DRM_REFLECT_X |
> -						 DRM_REFLECT_Y);
> +						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_REFLECT_X |
> +						 DRM_MODE_REFLECT_Y);
>  
> -		if (rotation & DRM_REFLECT_X)
> +		if (rotation & DRM_MODE_REFLECT_X)
>  			caps |= MDP_PIPE_CAP_HFLIP;
>  
> -		if (rotation & DRM_REFLECT_Y)
> +		if (rotation & DRM_MODE_REFLECT_Y)
>  			caps |= MDP_PIPE_CAP_VFLIP;
>  
>  		if (plane->type == DRM_PLANE_TYPE_CURSOR)
> @@ -970,11 +970,11 @@ static int mdp5_plane_mode_set(struct drm_plane *plane,
>  	DBG("scale config = %x", config);
>  
>  	rotation = drm_rotation_simplify(pstate->rotation,
> -					 DRM_ROTATE_0 |
> -					 DRM_REFLECT_X |
> -					 DRM_REFLECT_Y);
> -	hflip = !!(rotation & DRM_REFLECT_X);
> -	vflip = !!(rotation & DRM_REFLECT_Y);
> +					 DRM_MODE_ROTATE_0 |
> +					 DRM_MODE_REFLECT_X |
> +					 DRM_MODE_REFLECT_Y);
> +	hflip = !!(rotation & DRM_MODE_REFLECT_X);
> +	vflip = !!(rotation & DRM_MODE_REFLECT_Y);
>  
>  	spin_lock_irqsave(&mdp5_plane->pipe_lock, flags);
>  
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index a7663249b3ba..9303daa79aba 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -1033,7 +1033,7 @@ nv50_wndw_reset(struct drm_plane *plane)
>  		plane->funcs->atomic_destroy_state(plane, plane->state);
>  	plane->state = &asyw->state;
>  	plane->state->plane = plane;
> -	plane->state->rotation = DRM_ROTATE_0;
> +	plane->state->rotation = DRM_MODE_ROTATE_0;
>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index e1f47f0b3ccf..663e930a7b0f 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -577,7 +577,7 @@ static void dev_lastclose(struct drm_device *dev)
>  
>  		drm_object_property_set_value(&crtc->base,
>  					      crtc->primary->rotation_property,
> -					      DRM_ROTATE_0);
> +					      DRM_MODE_ROTATE_0);
>  	}
>  
>  	for (i = 0; i < priv->num_planes; i++) {
> @@ -588,7 +588,7 @@ static void dev_lastclose(struct drm_device *dev)
>  
>  		drm_object_property_set_value(&plane->base,
>  					      plane->rotation_property,
> -					      DRM_ROTATE_0);
> +					      DRM_MODE_ROTATE_0);
>  	}
>  
>  	if (priv->fbdev) {
> diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
> index 29dc677dd4d3..5ca0537bb427 100644
> --- a/drivers/gpu/drm/omapdrm/omap_fb.c
> +++ b/drivers/gpu/drm/omapdrm/omap_fb.c
> @@ -167,30 +167,30 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
>  		uint32_t w = win->src_w;
>  		uint32_t h = win->src_h;
>  
> -		switch (win->rotation & DRM_ROTATE_MASK) {
> +		switch (win->rotation & DRM_MODE_ROTATE_MASK) {
>  		default:
>  			dev_err(fb->dev->dev, "invalid rotation: %02x",
>  					(uint32_t)win->rotation);
>  			/* fallthru to default to no rotation */
>  		case 0:
> -		case DRM_ROTATE_0:
> +		case DRM_MODE_ROTATE_0:
>  			orient = 0;
>  			break;
> -		case DRM_ROTATE_90:
> +		case DRM_MODE_ROTATE_90:
>  			orient = MASK_XY_FLIP | MASK_X_INVERT;
>  			break;
> -		case DRM_ROTATE_180:
> +		case DRM_MODE_ROTATE_180:
>  			orient = MASK_X_INVERT | MASK_Y_INVERT;
>  			break;
> -		case DRM_ROTATE_270:
> +		case DRM_MODE_ROTATE_270:
>  			orient = MASK_XY_FLIP | MASK_Y_INVERT;
>  			break;
>  		}
>  
> -		if (win->rotation & DRM_REFLECT_X)
> +		if (win->rotation & DRM_MODE_REFLECT_X)
>  			orient ^= MASK_X_INVERT;
>  
> -		if (win->rotation & DRM_REFLECT_Y)
> +		if (win->rotation & DRM_MODE_REFLECT_Y)
>  			orient ^= MASK_Y_INVERT;
>  
>  		/* adjust x,y offset for flip/invert: */
> @@ -205,9 +205,9 @@ void omap_framebuffer_update_scanout(struct drm_framebuffer *fb,
>  		info->rotation_type = OMAP_DSS_ROT_TILER;
>  		info->screen_width  = omap_gem_tiled_stride(plane->bo, orient);
>  	} else {
> -		switch (win->rotation & DRM_ROTATE_MASK) {
> +		switch (win->rotation & DRM_MODE_ROTATE_MASK) {
>  		case 0:
> -		case DRM_ROTATE_0:
> +		case DRM_MODE_ROTATE_0:
>  			/* OK */
>  			break;
>  
> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 9168154d749e..d3d6818c68f8 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -141,7 +141,7 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>  	struct omap_plane_state *omap_state = to_omap_plane_state(plane->state);
>  	struct omap_plane *omap_plane = to_omap_plane(plane);
>  
> -	plane->state->rotation = DRM_ROTATE_0;
> +	plane->state->rotation = DRM_MODE_ROTATE_0;
>  	omap_state->zorder = plane->type == DRM_PLANE_TYPE_PRIMARY
>  			   ? 0 : omap_plane->id;
>  
> @@ -177,7 +177,7 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>  	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdisplay)
>  		return -EINVAL;
>  
> -	if (state->rotation != DRM_ROTATE_0 &&
> +	if (state->rotation != DRM_MODE_ROTATE_0 &&
>  	    !omap_framebuffer_supports_rotation(state->fb))
>  		return -EINVAL;
>  
> @@ -213,15 +213,15 @@ void omap_plane_install_properties(struct drm_plane *plane,
>  	if (priv->has_dmm) {
>  		if (!plane->rotation_property)
>  			drm_plane_create_rotation_property(plane,
> -							   DRM_ROTATE_0,
> -							   DRM_ROTATE_0 | DRM_ROTATE_90 |
> -							   DRM_ROTATE_180 | DRM_ROTATE_270 |
> -							   DRM_REFLECT_X | DRM_REFLECT_Y);
> +							   DRM_MODE_ROTATE_0,
> +							   DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
> +							   DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270 |
> +							   DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y);
>  
>  		/* Attach the rotation property also to the crtc object */
>  		if (plane->rotation_property && obj != &plane->base)
>  			drm_object_attach_property(obj, plane->rotation_property,
> -						   DRM_ROTATE_0);
> +						   DRM_MODE_ROTATE_0);
>  	}
>  
>  	drm_object_attach_property(obj, priv->zorder_prop, 0);
> @@ -273,7 +273,7 @@ static void omap_plane_reset(struct drm_plane *plane)
>  	 */
>  	omap_state->zorder = plane->type == DRM_PLANE_TYPE_PRIMARY
>  			   ? 0 : omap_plane->id;
> -	omap_state->base.rotation = DRM_ROTATE_0;
> +	omap_state->base.rotation = DRM_MODE_ROTATE_0;
>  
>  	plane->state = &omap_state->base;
>  	plane->state->plane = plane;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index ef9f3a2a4030..a8876b070168 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -566,7 +566,7 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
>  
>  	ret = drm_plane_helper_check_update(plane, state->crtc, new_fb,
>  					    &src, &dest, &clip,
> -					    DRM_ROTATE_0,
> +					    DRM_MODE_ROTATE_0,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    false, true, &visible);
> @@ -845,7 +845,7 @@ void vmw_du_plane_reset(struct drm_plane *plane)
>  
>  	plane->state = &vps->base;
>  	plane->state->plane = plane;
> -	plane->state->rotation = DRM_ROTATE_0;
> +	plane->state->rotation = DRM_MODE_ROTATE_0;
>  }
>  
>  
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 13221cf9b3eb..340383810a37 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -25,31 +25,14 @@
>  
>  #include <linux/list.h>
>  #include <linux/ctype.h>
> +#include <drm/drm_mode.h>
>  
>  struct drm_device;
>  struct drm_atomic_state;
>  
> -/*
> - * Rotation property bits. DRM_ROTATE_<degrees> rotates the image by the
> - * specified amount in degrees in counter clockwise direction. DRM_REFLECT_X and
> - * DRM_REFLECT_Y reflects the image along the specified axis prior to rotation
> - *
> - * WARNING: These defines are UABI since they're exposed in the rotation
> - * property.
> - */
> -#define DRM_ROTATE_0	BIT(0)
> -#define DRM_ROTATE_90	BIT(1)
> -#define DRM_ROTATE_180	BIT(2)
> -#define DRM_ROTATE_270	BIT(3)
> -#define DRM_ROTATE_MASK (DRM_ROTATE_0   | DRM_ROTATE_90 | \
> -			 DRM_ROTATE_180 | DRM_ROTATE_270)
> -#define DRM_REFLECT_X	BIT(4)
> -#define DRM_REFLECT_Y	BIT(5)
> -#define DRM_REFLECT_MASK (DRM_REFLECT_X | DRM_REFLECT_Y)
> -
>  static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  {
> -	return rotation & (DRM_ROTATE_90 | DRM_ROTATE_270);
> +	return rotation & (DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_270);
>  }
>  
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 8c67fc03d53d..f630fd16e1a6 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -75,7 +75,7 @@ extern "C" {
>    * (define not exposed to user space).
>    */
>  #define DRM_MODE_FLAG_3D_MASK			(0x1f<<14)
> -#define  DRM_MODE_FLAG_3D_NONE			(0<<14)
> +#define  DRM_MODE_FLAG_3D_NONE		(0<<14)
>  #define  DRM_MODE_FLAG_3D_FRAME_PACKING		(1<<14)
>  #define  DRM_MODE_FLAG_3D_FIELD_ALTERNATIVE	(2<<14)
>  #define  DRM_MODE_FLAG_3D_LINE_ALTERNATIVE	(3<<14)
> @@ -127,6 +127,53 @@ extern "C" {
>  #define DRM_MODE_LINK_STATUS_GOOD	0
>  #define DRM_MODE_LINK_STATUS_BAD	1
>  
> +/*
> + * DRM_MODE_ROTATE_<degrees>
> + *
> + * Signals that a drm plane has been rotated <degrees> degrees in counter
> + * clockwise direction.
> + *
> + * This define is provided as a convenience, looking up the property id
> + * using the name->prop id lookup is the preferred method.
> + */
> +#define DRM_MODE_ROTATE_0       (1<<0)
> +#define DRM_MODE_ROTATE_90      (1<<1)
> +#define DRM_MODE_ROTATE_180     (1<<2)
> +#define DRM_MODE_ROTATE_270     (1<<3)
> +
> +/*
> + * DRM_MODE_ROTATE_MASK
> + *
> + * Bitmask used to look for drm plane rotations.
> + */
> +#define DRM_MODE_ROTATE_MASK (\
> +		DRM_MODE_ROTATE_0  | \
> +		DRM_MODE_ROTATE_90  | \
> +		DRM_MODE_ROTATE_180 | \
> +		DRM_MODE_ROTATE_270)
> +
> +/*
> + * DRM_MODE_REFLECT_<axis>
> + *
> + * Signals that the contents of a drm plane has been reflected in
> + * the <axis> axis.
> + *
> + * This define is provided as a convenience, looking up the property id
> + * using the name->prop id lookup is the preferred method.
> + */
> +#define DRM_MODE_REFLECT_X      (1<<4)
> +#define DRM_MODE_REFLECT_Y      (1<<5)
> +
> +/*
> + * DRM_MODE_REFLECT_MASK
> + *
> + * Bitmask used to look for drm plane reflections.
> + */
> +#define DRM_MODE_REFLECT_MASK (\
> +		DRM_MODE_REFLECT_X | \
> +		DRM_MODE_REFLECT_Y)
> +
> +
>  struct drm_mode_modeinfo {
>  	__u32 clock;
>  	__u16 hdisplay;
> -- 
> 2.11.0.453.g787f75f05
> 

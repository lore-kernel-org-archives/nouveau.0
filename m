From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH 02/10] drm: Rename plane atomic_check state names
Date: Fri, 15 Jan 2021 22:28:59 +0200
Message-ID: <YAH7C0EOsisHhqvR@pendragon.ideasonboard.com>
References: <20210115125703.1315064-1-maxime@cerno.tech>
 <20210115125703.1315064-2-maxime@cerno.tech>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20210115125703.1315064-2-maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Anitha Chrisanthus <anitha.chrisanthus-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-stm32-XDFAJ8BFU24N7RejjzZ/Li2xQDfSxrLKVpNB7YpNyf8@public.gmane.org, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Leo Li <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied@linu>
List-Id: nouveau.vger.kernel.org

Hi Maxime,

Thank you for the patch.

On Fri, Jan 15, 2021 at 01:56:54PM +0100, Maxime Ripard wrote:
> Most drivers call the argument to the plane atomic_check hook simply
> state, which is going to conflict with the global atomic state in a
> later rework. Let's rename it to new_plane_state (or new_state depending
> on the convention used in the driver).
> 
> This was done using the coccinelle script below, and built tested:
> 
> @ plane_atomic_func @
> identifier helpers;
> identifier func;
> @@
> 
>  static const struct drm_plane_helper_funcs helpers = {
>  	.atomic_check = func,
>  };
> 
> @ has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> expression e;
> symbol old_state;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  	struct drm_plane_state *old_state = e;
>  	...
>  }
> 
> @ depends on has_old_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_state
>      )
>  {
>  	<+...
> -	state
> +	new_state
> 	...+>
>  }
> 
> @ has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol state;
> @@
> 
>  func(struct drm_plane *plane, struct drm_plane_state *state)
>  {
>  	...
>  }
> 
> @ depends on has_state @
> identifier plane_atomic_func.func;
> identifier plane;
> symbol old_state;
> @@
> 
>  func(struct drm_plane *plane,
> -	struct drm_plane_state *state
> +	struct drm_plane_state *new_plane_state
>      )
>  {
>  	<+...
> -	state
> +	new_plane_state
> 	...+>
>  }
> 
> Signed-off-by: Maxime Ripard <maxime-R63rPqgGiG5yDzI6CaY1VQ@public.gmane.org>
> ---

[...]

>  drivers/gpu/drm/omapdrm/omap_plane.c          | 19 +++++----
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  7 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  7 ++--
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            | 10 +++--

For these, with the comment below addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

>  41 files changed, 402 insertions(+), 357 deletions(-)

[snip]

> diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
> index 51dc24acea73..78d0eb1fd69d 100644
> --- a/drivers/gpu/drm/omapdrm/omap_plane.c
> +++ b/drivers/gpu/drm/omapdrm/omap_plane.c
> @@ -99,18 +99,19 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
>  }
>  
>  static int omap_plane_atomic_check(struct drm_plane *plane,
> -				   struct drm_plane_state *state)
> +				   struct drm_plane_state *new_plane_state)
>  {
>  	struct drm_crtc_state *crtc_state;
>  
> -	if (!state->fb)
> +	if (!new_plane_state->fb)
>  		return 0;
>  
>  	/* crtc should only be NULL when disabling (i.e., !state->fb) */

s/state/new_plane_state/ here too ?

> -	if (WARN_ON(!state->crtc))
> +	if (WARN_ON(!new_plane_state->crtc))
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
> +	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
> +							new_plane_state->crtc);
>  	/* we should have a crtc state if the plane is attached to a crtc */
>  	if (WARN_ON(!crtc_state))
>  		return 0;
> @@ -118,17 +119,17 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
>  	if (!crtc_state->enable)
>  		return 0;
>  
> -	if (state->crtc_x < 0 || state->crtc_y < 0)
> +	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
>  		return -EINVAL;
>  
> -	if (state->crtc_x + state->crtc_w > crtc_state->adjusted_mode.hdisplay)
> +	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->adjusted_mode.hdisplay)

I can't help thinking we're using too long variable names... :-(

>  		return -EINVAL;
>  
> -	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdisplay)
> +	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
>  		return -EINVAL;
>  
> -	if (state->rotation != DRM_MODE_ROTATE_0 &&
> -	    !omap_framebuffer_supports_rotation(state->fb))
> +	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
> +	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
>  		return -EINVAL;
>  
>  	return 0;

[...]

-- 
Regards,

Laurent Pinchart

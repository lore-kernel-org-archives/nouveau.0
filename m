From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC v5 01/10] drm/vblank: Register drmm cleanup
 action once per drm_vblank_crtc
Date: Tue, 23 Jun 2020 18:17:41 +0200
Message-ID: <20200623161741.GN20149@phenom.ffwll.local>
References: <20200622200730.120716-1-lyude@redhat.com>
 <20200622200730.120716-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200622200730.120716-2-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jun 22, 2020 at 04:07:21PM -0400, Lyude Paul wrote:
> Since we'll be allocating resources for kthread_create_worker() in the
> next commit (which could fail and require us to clean up the mess),
> let's simplify the cleanup process a bit by registering a
> drm_vblank_init_release() action for each drm_vblank_crtc so they're
> still cleaned up if we fail to initialize one of them.
> =

> Changes since v3:
> * Use drmm_add_action_or_reset() - Daniel Vetter
> =

> Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Signed-off-by: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_vblank.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 85e5f2db16085..ce5c1e1d29963 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -492,16 +492,12 @@ static void vblank_disable_fn(struct timer_list *t)
>  =

>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
> -	unsigned int pipe;
> -
> -	for (pipe =3D 0; pipe < dev->num_crtcs; pipe++) {
> -		struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +	struct drm_vblank_crtc *vblank =3D ptr;
>  =

> -		drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> -			    drm_core_check_feature(dev, DRIVER_MODESET));
> +	drm_WARN_ON(dev, READ_ONCE(vblank->enabled) &&
> +		    drm_core_check_feature(dev, DRIVER_MODESET));
>  =

> -		del_timer_sync(&vblank->disable_timer);
> -	}
> +	del_timer_sync(&vblank->disable_timer);
>  }
>  =

>  /**
> @@ -511,7 +507,7 @@ static void drm_vblank_init_release(struct drm_device=
 *dev, void *ptr)
>   *
>   * This function initializes vblank support for @num_crtcs display pipel=
ines.
>   * Cleanup is handled automatically through a cleanup function added with
> - * drmm_add_action().
> + * drmm_add_action_or_reset().
>   *
>   * Returns:
>   * Zero on success or a negative error code on failure.
> @@ -530,10 +526,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  =

>  	dev->num_crtcs =3D num_crtcs;
>  =

> -	ret =3D drmm_add_action(dev, drm_vblank_init_release, NULL);
> -	if (ret)
> -		return ret;
> -
>  	for (i =3D 0; i < num_crtcs; i++) {
>  		struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
>  =

> @@ -542,6 +534,11 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>  		init_waitqueue_head(&vblank->queue);
>  		timer_setup(&vblank->disable_timer, vblank_disable_fn, 0);
>  		seqlock_init(&vblank->seqlock);
> +
> +		ret =3D drmm_add_action_or_reset(dev, drm_vblank_init_release,
> +					       vblank);
> +		if (ret)
> +			return ret;
>  	}
>  =

>  	return 0;

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> -- =

> 2.26.2
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

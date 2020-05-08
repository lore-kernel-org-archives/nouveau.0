From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v4 03/12] drm/vblank: Register drmm cleanup action once per drm_vblank_crtc
Date: Fri, 8 May 2020 22:59:03 +0200
Message-ID: <CAKMK7uGEssowz-9jX1LP4=eRNTuxN_k4MLfrGqG3szjQE=Gonw@mail.gmail.com>
References: <20200508204751.155488-1-lyude@redhat.com> <20200508204751.155488-4-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200508204751.155488-4-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
List-Id: nouveau.vger.kernel.org

On Fri, May 8, 2020 at 10:48 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Since we'll be allocating resources for kthread_create_worker() in the
> next commit (which could fail and require us to clean up the mess),
> let's simplify the cleanup process a bit by registering a
> drm_vblank_init_release() action for each drm_vblank_crtc so they're
> still cleaned up if we fail to initialize one of them.
>
> Changes since v3:
> * Use drmm_add_action_or_reset() - Daniel Vetter
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think the other patches need a brain that's less in w/e mode :-)

Cheers, Daniel

> ---
>  drivers/gpu/drm/drm_vblank.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 758bf74e1cab..a4a9013584e2 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -491,16 +491,12 @@ static void vblank_disable_fn(struct timer_list *t)
>
>  static void drm_vblank_init_release(struct drm_device *dev, void *ptr)
>  {
> -       unsigned int pipe;
> -
> -       for (pipe =3D 0; pipe < dev->num_crtcs; pipe++) {
> -               struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +       struct drm_vblank_crtc *vblank =3D ptr;
>
> -               WARN_ON(READ_ONCE(vblank->enabled) &&
> -                       drm_core_check_feature(dev, DRIVER_MODESET));
> +       WARN_ON(READ_ONCE(vblank->enabled) &&
> +               drm_core_check_feature(dev, DRIVER_MODESET));
>
> -               del_timer_sync(&vblank->disable_timer);
> -       }
> +       del_timer_sync(&vblank->disable_timer);
>  }
>
>  /**
> @@ -510,7 +506,7 @@ static void drm_vblank_init_release(struct drm_device=
 *dev, void *ptr)
>   *
>   * This function initializes vblank support for @num_crtcs display pipel=
ines.
>   * Cleanup is handled automatically through a cleanup function added wit=
h
> - * drmm_add_action().
> + * drmm_add_action_or_reset().
>   *
>   * Returns:
>   * Zero on success or a negative error code on failure.
> @@ -529,10 +525,6 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>
>         dev->num_crtcs =3D num_crtcs;
>
> -       ret =3D drmm_add_action(dev, drm_vblank_init_release, NULL);
> -       if (ret)
> -               return ret;
> -
>         for (i =3D 0; i < num_crtcs; i++) {
>                 struct drm_vblank_crtc *vblank =3D &dev->vblank[i];
>
> @@ -541,6 +533,11 @@ int drm_vblank_init(struct drm_device *dev, unsigned=
 int num_crtcs)
>                 init_waitqueue_head(&vblank->queue);
>                 timer_setup(&vblank->disable_timer, vblank_disable_fn, 0)=
;
>                 seqlock_init(&vblank->seqlock);
> +
> +               ret =3D drmm_add_action_or_reset(dev, drm_vblank_init_rel=
ease,
> +                                              vblank);
> +               if (ret)
> +                       return ret;
>         }
>
>         DRM_INFO("Supports vblank timestamp caching Rev 2 (21.10.2013).\n=
");
> --
> 2.25.4
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

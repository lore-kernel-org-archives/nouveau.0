From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/23] drm/radeon: Convert to struct
 drm_crtc_helper_funcs.get_scanout_position()
Date: Mon, 13 Jan 2020 13:53:36 -0500
Message-ID: <CADnq5_NWuue-Y38vrU3mxawW6S0My5EvpgjWT2WFHm8ohwS2mQ@mail.gmail.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-6-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200110092127.27847-6-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maling list - DRI developers <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, alexandre.torgue-qxv4g6HH51o@public.gmane.org, Chunming Zhou <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Patrik Jakobsson <patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "Wentland, Harry" <harry.wentland-5C7GfCeVMHo@public.gmane.org>, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Leo (Sunpeng) Li" <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Intel Graphics Development <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1562uYJLRA6qg5Q@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 10, 2020 at 4:22 AM Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> radeon over.
>

I'd prefer to just change the signature of
radeon_get_crtc_scanoutpos() to match the new API.

Alex

> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
>  drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
>  5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index da2c9e295408..447d74b78f19 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -2232,6 +2232,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
>         .prepare = atombios_crtc_prepare,
>         .commit = atombios_crtc_commit,
>         .disable = atombios_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>  void radeon_atombios_init_crtc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 962575e27cde..7187158b9963 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1978,3 +1978,16 @@ int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>
>         return ret;
>  }
> +
> +bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
> +                                bool in_vblank_irq, int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode)
> +{
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
> +
> +       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> +                                         stime, etime, mode);
> +}
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index fd74e2611185..1f597f166bff 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -563,16 +563,6 @@ static const struct file_operations radeon_driver_kms_fops = {
>  #endif
>  };
>
> -static bool
> -radeon_get_crtc_scanout_position(struct drm_device *dev, unsigned int pipe,
> -                                bool in_vblank_irq, int *vpos, int *hpos,
> -                                ktime_t *stime, ktime_t *etime,
> -                                const struct drm_display_mode *mode)
> -{
> -       return radeon_get_crtc_scanoutpos(dev, pipe, 0, vpos, hpos,
> -                                         stime, etime, mode);
> -}
> -
>  static struct drm_driver kms_driver = {
>         .driver_features =
>             DRIVER_USE_AGP | DRIVER_GEM | DRIVER_RENDER,
> @@ -585,7 +575,6 @@ static struct drm_driver kms_driver = {
>         .enable_vblank = radeon_enable_vblank_kms,
>         .disable_vblank = radeon_disable_vblank_kms,
>         .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
> -       .get_scanout_position = radeon_get_crtc_scanout_position,
>         .irq_preinstall = radeon_driver_irq_preinstall_kms,
>         .irq_postinstall = radeon_driver_irq_postinstall_kms,
>         .irq_uninstall = radeon_driver_irq_uninstall_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> index a1985a552794..8817fd033cd0 100644
> --- a/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> +++ b/drivers/gpu/drm/radeon/radeon_legacy_crtc.c
> @@ -1111,7 +1111,8 @@ static const struct drm_crtc_helper_funcs legacy_helper_funcs = {
>         .mode_set_base_atomic = radeon_crtc_set_base_atomic,
>         .prepare = radeon_crtc_prepare,
>         .commit = radeon_crtc_commit,
> -       .disable = radeon_crtc_disable
> +       .disable = radeon_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index fd470d6bf3f4..06c4c527d376 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>                                       ktime_t *stime, ktime_t *etime,
>                                       const struct drm_display_mode *mode);
>
> +extern bool radeon_get_crtc_scanout_position(struct drm_crtc *crtc,
> +                                            bool in_vblank_irq, int *vpos,
> +                                            int *hpos, ktime_t *stime,
> +                                            ktime_t *etime,
> +                                            const struct drm_display_mode *mode);
> +
>  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
>  extern struct edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v4 10/22] drm/radeon: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
Date: Mon, 3 Feb 2020 15:39:42 -0500
Message-ID: <CADnq5_M89Hmx-5n+sJgWvMAwcwtvtF31kfjEfui1hUukxaFrvg@mail.gmail.com>
References: <20200123135943.24140-1-tzimmermann@suse.de> <20200123135943.24140-11-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200123135943.24140-11-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, Eric Anholt <eric@anholt.net>, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Wentla
List-Id: nouveau.vger.kernel.org

On Thu, Jan 23, 2020 at 9:00 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The callback struct drm_driver.get_scanout_position() is deprecated in
> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> radeon over.
>
> v4:
>         * 80-character line fixes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/atombios_crtc.c      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c     | 13 +++++++++++++
>  drivers/gpu/drm/radeon/radeon_drv.c         | 11 -----------
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c |  3 ++-
>  drivers/gpu/drm/radeon/radeon_mode.h        |  6 ++++++
>  5 files changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
> index be583695427a..91811757104c 100644
> --- a/drivers/gpu/drm/radeon/atombios_crtc.c
> +++ b/drivers/gpu/drm/radeon/atombios_crtc.c
> @@ -2231,6 +2231,7 @@ static const struct drm_crtc_helper_funcs atombios_helper_funcs = {
>         .prepare = atombios_crtc_prepare,
>         .commit = atombios_crtc_commit,
>         .disable = atombios_crtc_disable,
> +       .get_scanout_position = radeon_get_crtc_scanout_position,
>  };
>
>  void radeon_atombios_init_crtc(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 856526cb2caf..2f641f3b39e7 100644
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
> index fd470d6bf3f4..3a61530c1398 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -881,6 +881,12 @@ extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pipe,
>                                       ktime_t *stime, ktime_t *etime,
>                                       const struct drm_display_mode *mode);
>
> +extern bool
> +radeon_get_crtc_scanout_position(struct drm_crtc *crtc, bool in_vblank_irq,
> +                                int *vpos, int *hpos,
> +                                ktime_t *stime, ktime_t *etime,
> +                                const struct drm_display_mode *mode);
> +
>  extern bool radeon_combios_check_hardcoded_edid(struct radeon_device *rdev);
>  extern struct edid *
>  radeon_bios_get_hardcoded_edid(struct radeon_device *rdev);
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

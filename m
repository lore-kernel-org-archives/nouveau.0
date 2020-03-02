From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 02/22] drm: Add get_scanout_position() to struct drm_crtc_helper_funcs
Date: Mon, 2 Mar 2020 22:55:43 +0100
Message-ID: <CAKMK7uFKHoPrpEDpQzFS2fnr9XeuhEjA-2MxynknCindFHYEvg@mail.gmail.com>
References: <20200123135943.24140-1-tzimmermann@suse.de> <20200123135943.24140-3-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20200123135943.24140-3-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, "Clark, Rob" <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "Anholt, Eric" <eric@anholt.net>, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, VMware Graphics <linux-graphics-maintaine>
List-Id: nouveau.vger.kernel.org

On Thu, Jan 23, 2020 at 2:59 PM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> The new callback get_scanout_position() reads the current location
> of the scanout process. The operation is currently located in struct
> drm_driver, but really belongs to the CRTC. Drivers will be converted
> in separate patches.
>
> To help with the conversion, the timestamp calculation has been
> moved from drm_calc_vbltimestamp_from_scanoutpos() to
> drm_crtc_vblank_helper_get_vblank_timestamp_internal(). The helper
> function supports the new and old interface of get_scanout_position().
> drm_calc_vbltimestamp_from_scanoutpos() remains as a wrapper around
> the new function.
>
> Callback functions return the scanout position from the CRTC. The
> legacy version of the interface receives the device and pipe index,
> the modern version receives a pointer to the CRTC. We keep the
> legacy version until all drivers have been converted.
>
> v4:
>         * 80-character line fixes
> v3:
>         * refactor drm_calc_vbltimestamp_from_scanoutpos() to minimize
>           code duplication
>         * define types for get_scanout_position() callbacks
> v2:
>         * fix logical op in drm_calc_vbltimestamp_from_scanoutpos()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Yannick Fertr=C3=A9 <yannick.fertre@st.com>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

This patch causes new kerneldoc build warnings:

./drivers/gpu/drm/drm_vblank.c:623: warning: Excess function parameter
'dev' description in
'drm_crtc_vblank_helper_get_vblank_timestamp_internal'
./drivers/gpu/drm/drm_vblank.c:623: warning: Excess function parameter
'pipe' description in
'drm_crtc_vblank_helper_get_vblank_timestamp_internal'
./drivers/gpu/drm/drm_vblank.c:624: warning: Function parameter or
member 'crtc' not described in
'drm_crtc_vblank_helper_get_vblank_timestamp_internal'
./drivers/gpu/drm/drm_vblank.c:624: warning: Excess function parameter
'dev' description in
'drm_crtc_vblank_helper_get_vblank_timestamp_internal'
./drivers/gpu/drm/drm_vblank.c:624: warning: Excess function parameter
'pipe' description in
'drm_crtc_vblank_helper_get_vblank_timestamp_internal'


Please fix.
-Daniel

> ---
>  drivers/gpu/drm/drm_vblank.c             | 101 +++++++++++++++++++----
>  include/drm/drm_drv.h                    |   7 +-
>  include/drm/drm_modeset_helper_vtables.h |  47 +++++++++++
>  include/drm/drm_vblank.h                 |  25 ++++++
>  4 files changed, 157 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
> index 326db52f2ad8..7e962c29780c 100644
> --- a/drivers/gpu/drm/drm_vblank.c
> +++ b/drivers/gpu/drm/drm_vblank.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>
> @@ -577,7 +578,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>   * Implements calculation of exact vblank timestamps from given drm_disp=
lay_mode
>   * timings and current video scanout position of a CRTC. This can be dir=
ectly
>   * used as the &drm_driver.get_vblank_timestamp implementation of a kms =
driver
> - * if &drm_driver.get_scanout_position is implemented.
> + * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
>   *
>   * The current implementation only handles standard video modes. For dou=
ble scan
>   * and interlaced modes the driver is supposed to adjust the hardware mo=
de
> @@ -599,28 +600,85 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct d=
rm_device *dev,
>                                            ktime_t *vblank_time,
>                                            bool in_vblank_irq)
>  {
> -       struct timespec64 ts_etime, ts_vblank_time;
> -       ktime_t stime, etime;
> -       bool vbl_status;
>         struct drm_crtc *crtc;
> -       const struct drm_display_mode *mode;
> -       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> -       int vpos, hpos, i;
> -       int delta_ns, duration_ns;
>
>         if (!drm_core_check_feature(dev, DRIVER_MODESET))
>                 return false;
>
>         crtc =3D drm_crtc_from_index(dev, pipe);
> +       if (!crtc)
> +               return false;
>
> -       if (pipe >=3D dev->num_crtcs || !crtc) {
> +       return drm_crtc_vblank_helper_get_vblank_timestamp_internal(crtc,
> +                                                                   max_e=
rror,
> +                                                                   vblan=
k_time,
> +                                                                   in_vb=
lank_irq,
> +                                                                   crtc-=
>helper_private->get_scanout_position,
> +                                                                   dev->=
driver->get_scanout_position);
> +}
> +EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
> +
> +/**
> + * drm_crtc_vblank_helper_get_vblank_timestamp_internal - precise vblank
> + *                                                        timestamp help=
er
> + * @dev: DRM device
> + * @pipe: index of CRTC whose vblank timestamp to retrieve
> + * @max_error: Desired maximum allowable error in timestamps (nanosecs)
> + *             On return contains true maximum error of timestamp
> + * @vblank_time: Pointer to time which should receive the timestamp
> + * @in_vblank_irq:
> + *     True when called from drm_crtc_handle_vblank().  Some drivers
> + *     need to apply some workarounds for gpu-specific vblank irq quirks
> + *     if flag is set.
> + * @get_scanout_position:
> + *     Callback function to retrieve the scanout position. See
> + *     @struct drm_crtc_helper_funcs.get_scanout_position.
> + * @get_scanout_position_legacy:
> + *     Callback function to retrieve the scanout position. See
> + *     @struct drm_driver.get_scanout_position.
> + *
> + * Implements calculation of exact vblank timestamps from given drm_disp=
lay_mode
> + * timings and current video scanout position of a CRTC.
> + *
> + * The current implementation only handles standard video modes. For dou=
ble scan
> + * and interlaced modes the driver is supposed to adjust the hardware mo=
de
> + * (taken from &drm_crtc_state.adjusted mode for atomic modeset drivers)=
 to
> + * match the scanout position reported.
> + *
> + * Note that atomic drivers must call drm_calc_timestamping_constants() =
before
> + * enabling a CRTC. The atomic helpers already take care of that in
> + * drm_atomic_helper_update_legacy_modeset_state().
> + *
> + * Returns:
> + *
> + * Returns true on success, and false on failure, i.e. when no accurate
> + * timestamp could be acquired.
> + */
> +bool
> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(
> +       struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
> +       bool in_vblank_irq,
> +       drm_vblank_get_scanout_position_func get_scanout_position,
> +       drm_vblank_get_scanout_position_legacy_func get_scanout_position_=
legacy)
> +{
> +       struct drm_device *dev =3D crtc->dev;
> +       unsigned int pipe =3D crtc->index;
> +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> +       struct timespec64 ts_etime, ts_vblank_time;
> +       ktime_t stime, etime;
> +       bool vbl_status;
> +       const struct drm_display_mode *mode;
> +       int vpos, hpos, i;
> +       int delta_ns, duration_ns;
> +
> +       if (pipe >=3D dev->num_crtcs) {
>                 DRM_ERROR("Invalid crtc %u\n", pipe);
>                 return false;
>         }
>
>         /* Scanout position query not supported? Should not happen. */
> -       if (!dev->driver->get_scanout_position) {
> -               DRM_ERROR("Called from driver w/o get_scanout_position()!=
?\n");
> +       if (!get_scanout_position && !get_scanout_position_legacy) {
> +               DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\=
n");
>                 return false;
>         }
>
> @@ -635,7 +693,6 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm=
_device *dev,
>         if (mode->crtc_clock =3D=3D 0) {
>                 DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", p=
ipe);
>                 WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
> -
>                 return false;
>         }
>
> @@ -651,11 +708,19 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct d=
rm_device *dev,
>                  * Get vertical and horizontal scanout position vpos, hpo=
s,
>                  * and bounding timestamps stime, etime, pre/post query.
>                  */
> -               vbl_status =3D dev->driver->get_scanout_position(dev, pip=
e,
> -                                                              in_vblank_=
irq,
> -                                                              &vpos, &hp=
os,
> -                                                              &stime, &e=
time,
> -                                                              mode);
> +               if (get_scanout_position) {
> +                       vbl_status =3D get_scanout_position(crtc,
> +                                                         in_vblank_irq,
> +                                                         &vpos, &hpos,
> +                                                         &stime, &etime,
> +                                                         mode);
> +               } else {
> +                       vbl_status =3D get_scanout_position_legacy(dev, p=
ipe,
> +                                                                in_vblan=
k_irq,
> +                                                                &vpos, &=
hpos,
> +                                                                &stime, =
&etime,
> +                                                                mode);
> +               }
>
>                 /* Return as no-op if scanout query unsupported or failed=
. */
>                 if (!vbl_status) {
> @@ -707,7 +772,7 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct drm=
_device *dev,
>
>         return true;
>  }
> -EXPORT_SYMBOL(drm_calc_vbltimestamp_from_scanoutpos);
> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
>
>  /**
>   * drm_get_last_vbltimestamp - retrieve raw timestamp for the most recen=
t
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index cf13470810a5..d0049e5786fc 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -362,11 +362,8 @@ struct drm_driver {
>          * True on success, false if a reliable scanout position counter =
could
>          * not be read out.
>          *
> -        * FIXME:
> -        *
> -        * Since this is a helper to implement @get_vblank_timestamp, we =
should
> -        * move it to &struct drm_crtc_helper_funcs, like all the other
> -        * helper-internal hooks.
> +        * This is deprecated and should not be used by new drivers.
> +        * Use &drm_crtc_helper_funcs.get_scanout_position instead.
>          */
>         bool (*get_scanout_position) (struct drm_device *dev, unsigned in=
t pipe,
>                                       bool in_vblank_irq, int *vpos, int =
*hpos,
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_m=
odeset_helper_vtables.h
> index 5a87f1bd7a3f..e398512bfd5f 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -450,6 +450,53 @@ struct drm_crtc_helper_funcs {
>          */
>         void (*atomic_disable)(struct drm_crtc *crtc,
>                                struct drm_crtc_state *old_crtc_state);
> +
> +       /**
> +        * @get_scanout_position:
> +        *
> +        * Called by vblank timestamping code.
> +        *
> +        * Returns the current display scanout position from a CRTC and a=
n
> +        * optional accurate ktime_get() timestamp of when the position w=
as
> +        * measured. Note that this is a helper callback which is only us=
ed
> +        * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for t=
he
> +        * @drm_driver.get_vblank_timestamp callback.
> +        *
> +        * Parameters:
> +        *
> +        * crtc:
> +        *     The CRTC.
> +        * in_vblank_irq:
> +        *     True when called from drm_crtc_handle_vblank(). Some drive=
rs
> +        *     need to apply some workarounds for gpu-specific vblank irq
> +        *     quirks if the flag is set.
> +        * vpos:
> +        *     Target location for current vertical scanout position.
> +        * hpos:
> +        *     Target location for current horizontal scanout position.
> +        * stime:
> +        *     Target location for timestamp taken immediately before
> +        *     scanout position query. Can be NULL to skip timestamp.
> +        * etime:
> +        *     Target location for timestamp taken immediately after
> +        *     scanout position query. Can be NULL to skip timestamp.
> +        * mode:
> +        *     Current display timings.
> +        *
> +        * Returns vpos as a positive number while in active scanout area=
.
> +        * Returns vpos as a negative number inside vblank, counting the =
number
> +        * of scanlines to go until end of vblank, e.g., -1 means "one sc=
anline
> +        * until start of active scanout / end of vblank."
> +        *
> +        * Returns:
> +        *
> +        * True on success, false if a reliable scanout position counter =
could
> +        * not be read out.
> +        */
> +       bool (*get_scanout_position)(struct drm_crtc *crtc,
> +                                    bool in_vblank_irq, int *vpos, int *=
hpos,
> +                                    ktime_t *stime, ktime_t *etime,
> +                                    const struct drm_display_mode *mode)=
;
>  };
>
>  /**
> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
> index c16c44052b3d..66d1fb376600 100644
> --- a/include/drm/drm_vblank.h
> +++ b/include/drm/drm_vblank.h
> @@ -238,4 +238,29 @@ void drm_calc_timestamping_constants(struct drm_crtc=
 *crtc,
>  wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
>  void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>                                    u32 max_vblank_count);
> +
> +typedef bool (*drm_vblank_get_scanout_position_func)(struct drm_crtc *cr=
tc,
> +                                                    bool in_vblank_irq,
> +                                                    int *vpos, int *hpos=
,
> +                                                    ktime_t *stime,
> +                                                    ktime_t *etime,
> +                                                    const struct drm_dis=
play_mode *mode);
> +
> +typedef bool (*drm_vblank_get_scanout_position_legacy_func)(struct drm_d=
evice *dev,
> +                                                           unsigned int =
pipe,
> +                                                           bool in_vblan=
k_irq,
> +                                                           int *vpos,
> +                                                           int *hpos,
> +                                                           ktime_t *stim=
e,
> +                                                           ktime_t *etim=
e,
> +                                                           const struct =
drm_display_mode *mode);
> +
> +bool
> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(struct drm_crtc *cr=
tc,
> +                                                    int *max_error,
> +                                                    ktime_t *vblank_time=
,
> +                                                    bool in_vblank_irq,
> +                                                    drm_vblank_get_scano=
ut_position_func get_scanout_position,
> +                                                    drm_vblank_get_scano=
ut_position_legacy_func get_scanout_position_legacy);
> +
>  #endif
> --
> 2.24.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

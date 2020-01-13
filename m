From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 17/23] drm/radeon: Convert to CRTC VBLANK callbacks
Date: Mon, 13 Jan 2020 14:02:32 -0500
Message-ID: <CADnq5_MopZ3iP0hV=V-vGd3jdzRDjxq7J=d_NsZU+fDSQoi9fA@mail.gmail.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-18-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20200110092127.27847-18-tzimmermann@suse.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: hamohammed.sa@gmail.com, Dave Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, alexandre.torgue@st.com, Thomas Hellstrom <thellstrom@vmware.com>, Sean Paul <sean@poorly.run>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, mcoquelin.stm32@gmail.com, "Leo (Sunpeng) Li" <sunpeng.li@amd.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Vincent Abriou <vincent.abriou@st.com>, rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com, "Deucher, Alexander" <alexander.deucher@amd.com>, freedreno <freedreno@lists.freedesktop.org>, Christian Koenig <christian.koenig@amd.com>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 10, 2020 at 4:22 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert radeon over.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_display.c | 12 ++++++++--
>  drivers/gpu/drm/radeon/radeon_drv.c     |  7 ------
>  drivers/gpu/drm/radeon/radeon_kms.c     | 29 ++++++++++++++-----------
>  3 files changed, 26 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 7187158b9963..9116975b6eb9 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -45,6 +45,10 @@
>  #include "atom.h"
>  #include "radeon.h"
>
> +u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc);
> +int radeon_enable_vblank_kms(struct drm_crtc *crtc);
> +void radeon_disable_vblank_kms(struct drm_crtc *crtc);
> +
>  static void avivo_crtc_load_lut(struct drm_crtc *crtc)
>  {
>         struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
> @@ -458,7 +462,7 @@ static void radeon_flip_work_func(struct work_struct *__work)
>                 (DRM_SCANOUTPOS_VALID | DRM_SCANOUTPOS_IN_VBLANK) &&
>                 (!ASIC_IS_AVIVO(rdev) ||
>                 ((int) (work->target_vblank -
> -               dev->driver->get_vblank_counter(dev, work->crtc_id)) > 0)))
> +               crtc->funcs->get_vblank_counter(crtc)) > 0)))
>                 usleep_range(1000, 2000);
>
>         /* We borrow the event spin lock for protecting flip_status */
> @@ -574,7 +578,7 @@ static int radeon_crtc_page_flip_target(struct drm_crtc *crtc,
>         }
>         work->base = base;
>         work->target_vblank = target - (uint32_t)drm_crtc_vblank_count(crtc) +
> -               dev->driver->get_vblank_counter(dev, work->crtc_id);
> +               crtc->funcs->get_vblank_counter(crtc);
>
>         /* We borrow the event spin lock for protecting flip_work */
>         spin_lock_irqsave(&crtc->dev->event_lock, flags);
> @@ -666,6 +670,10 @@ static const struct drm_crtc_funcs radeon_crtc_funcs = {
>         .set_config = radeon_crtc_set_config,
>         .destroy = radeon_crtc_destroy,
>         .page_flip_target = radeon_crtc_page_flip_target,
> +       .get_vblank_counter = radeon_get_vblank_counter_kms,
> +       .enable_vblank = radeon_enable_vblank_kms,
> +       .disable_vblank = radeon_disable_vblank_kms,
> +       .get_vblank_timestamp = drm_crtc_calc_vbltimestamp_from_scanoutpos,
>  };
>
>  static void radeon_crtc_init(struct drm_device *dev, int index)
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
> index 1f597f166bff..49ce2e7d5f9e 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -119,9 +119,6 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
>  int radeon_suspend_kms(struct drm_device *dev, bool suspend,
>                        bool fbcon, bool freeze);
>  int radeon_resume_kms(struct drm_device *dev, bool resume, bool fbcon);
> -u32 radeon_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe);
> -int radeon_enable_vblank_kms(struct drm_device *dev, unsigned int pipe);
> -void radeon_disable_vblank_kms(struct drm_device *dev, unsigned int pipe);
>  void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
>  int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
>  void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
> @@ -571,10 +568,6 @@ static struct drm_driver kms_driver = {
>         .postclose = radeon_driver_postclose_kms,
>         .lastclose = radeon_driver_lastclose_kms,
>         .unload = radeon_driver_unload_kms,
> -       .get_vblank_counter = radeon_get_vblank_counter_kms,
> -       .enable_vblank = radeon_enable_vblank_kms,
> -       .disable_vblank = radeon_disable_vblank_kms,
> -       .get_vblank_timestamp = drm_calc_vbltimestamp_from_scanoutpos,
>         .irq_preinstall = radeon_driver_irq_preinstall_kms,
>         .irq_postinstall = radeon_driver_irq_postinstall_kms,
>         .irq_uninstall = radeon_driver_irq_uninstall_kms,
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
> index d24f23a81656..cab891f86dc0 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -739,14 +739,15 @@ void radeon_driver_postclose_kms(struct drm_device *dev,
>  /**
>   * radeon_get_vblank_counter_kms - get frame count
>   *
> - * @dev: drm dev pointer
> - * @pipe: crtc to get the frame count from
> + * @crtc: crtc to get the frame count from
>   *
>   * Gets the frame count on the requested crtc (all asics).
>   * Returns frame count on success, -EINVAL on failure.
>   */
> -u32 radeon_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
> +u32 radeon_get_vblank_counter_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         int vpos, hpos, stat;
>         u32 count;
>         struct radeon_device *rdev = dev->dev_private;
> @@ -808,25 +809,26 @@ u32 radeon_get_vblank_counter_kms(struct drm_device *dev, unsigned int pipe)
>  /**
>   * radeon_enable_vblank_kms - enable vblank interrupt
>   *
> - * @dev: drm dev pointer
>   * @crtc: crtc to enable vblank interrupt for
>   *
>   * Enable the interrupt on the requested crtc (all asics).
>   * Returns 0 on success, -EINVAL on failure.
>   */
> -int radeon_enable_vblank_kms(struct drm_device *dev, int crtc)
> +int radeon_enable_vblank_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct radeon_device *rdev = dev->dev_private;
>         unsigned long irqflags;
>         int r;
>
> -       if (crtc < 0 || crtc >= rdev->num_crtc) {
> -               DRM_ERROR("Invalid crtc %d\n", crtc);
> +       if (pipe < 0 || pipe >= rdev->num_crtc) {
> +               DRM_ERROR("Invalid crtc %d\n", pipe);
>                 return -EINVAL;
>         }
>
>         spin_lock_irqsave(&rdev->irq.lock, irqflags);
> -       rdev->irq.crtc_vblank_int[crtc] = true;
> +       rdev->irq.crtc_vblank_int[pipe] = true;
>         r = radeon_irq_set(rdev);
>         spin_unlock_irqrestore(&rdev->irq.lock, irqflags);
>         return r;
> @@ -835,23 +837,24 @@ int radeon_enable_vblank_kms(struct drm_device *dev, int crtc)
>  /**
>   * radeon_disable_vblank_kms - disable vblank interrupt
>   *
> - * @dev: drm dev pointer
>   * @crtc: crtc to disable vblank interrupt for
>   *
>   * Disable the interrupt on the requested crtc (all asics).
>   */
> -void radeon_disable_vblank_kms(struct drm_device *dev, int crtc)
> +void radeon_disable_vblank_kms(struct drm_crtc *crtc)
>  {
> +       struct drm_device *dev = crtc->dev;
> +       unsigned int pipe = crtc->index;
>         struct radeon_device *rdev = dev->dev_private;
>         unsigned long irqflags;
>
> -       if (crtc < 0 || crtc >= rdev->num_crtc) {
> -               DRM_ERROR("Invalid crtc %d\n", crtc);
> +       if (pipe < 0 || pipe >= rdev->num_crtc) {
> +               DRM_ERROR("Invalid crtc %d\n", pipe);
>                 return;
>         }
>
>         spin_lock_irqsave(&rdev->irq.lock, irqflags);
> -       rdev->irq.crtc_vblank_int[crtc] = false;
> +       rdev->irq.crtc_vblank_int[pipe] = false;
>         radeon_irq_set(rdev);
>         spin_unlock_irqrestore(&rdev->irq.lock, irqflags);
>  }
> --
> 2.24.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

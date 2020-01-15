From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 02/23] drm/amdgpu: Convert to struct drm_crtc_helper_funcs.get_scanout_position()
Date: Wed, 15 Jan 2020 11:35:04 -0500
Message-ID: <CADnq5_MkJy9zNHxeEGOYjvXs8MxuY_kd5_sTP8EWGFEBMpWx6Q@mail.gmail.com>
References: <20200110092127.27847-1-tzimmermann@suse.de> <20200110092127.27847-3-tzimmermann@suse.de>
 <CADnq5_OCsQQ0=Yr6xinWWCursZc0ZGBrNj1=0667kbqE1BorVw@mail.gmail.com> <352f23e9-b690-375f-005b-e5ea1fb9a0d2@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <352f23e9-b690-375f-005b-e5ea1fb9a0d2@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, Eric Anholt <eric@anholt.net>, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com, VMware Graphics <linux-graphics-maintainer@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, Wentla
List-Id: nouveau.vger.kernel.org

On Wed, Jan 15, 2020 at 4:41 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 13.01.20 um 19:52 schrieb Alex Deucher:
> > On Fri, Jan 10, 2020 at 4:21 AM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >>
> >> The callback struct drm_driver.get_scanout_position() is deprecated in
> >> favor of struct drm_crtc_helper_funcs.get_scanout_position(). Convert
> >> amdgpu over.
> >>
> >
> > I would prefer to just change the signature of
> > amdgpu_display_get_crtc_scanoutpos() to match the new API rather than
> > wrapping it again.
>
> While trying to adapt the siganture, I found that
> amdgpu_display_get_crtc_scanoutpos() requires a flags argument that is
> not mappable to the callback API. That wrapper function is necessary.
>

No worries.  We can clean them up later.  Wrapping is fine.

Alex

> Best regards
> Thomas
>
> >
> > Alex
> >
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 12 ++++++++++++
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 11 -----------
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  5 +++++
> >>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  1 +
> >>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  1 +
> >>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
> >>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  1 +
> >>  drivers/gpu/drm/amd/amdgpu/dce_virtual.c          |  1 +
> >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
> >>  9 files changed, 24 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_display.c
> >> index 4e699071d144..a1e769d4417d 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> >> @@ -914,3 +914,15 @@ int amdgpu_display_crtc_idx_to_irq_type(struct am=
dgpu_device *adev, int crtc)
> >>                 return AMDGPU_CRTC_IRQ_NONE;
> >>         }
> >>  }
> >> +
> >> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >> +                       bool in_vblank_irq, int *vpos,
> >> +                       int *hpos, ktime_t *stime, ktime_t *etime,
> >> +                       const struct drm_display_mode *mode)
> >> +{
> >> +       struct drm_device *dev =3D crtc->dev;
> >> +       unsigned int pipe =3D crtc->index;
> >> +
> >> +       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, =
hpos,
> >> +                                                 stime, etime, mode);
> >> +}
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c
> >> index 3f6f14ce1511..0749285dd1c7 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >> @@ -1367,16 +1367,6 @@ int amdgpu_file_to_fpriv(struct file *filp, str=
uct amdgpu_fpriv **fpriv)
> >>         return 0;
> >>  }
> >>
> >> -static bool
> >> -amdgpu_get_crtc_scanout_position(struct drm_device *dev, unsigned int=
 pipe,
> >> -                                bool in_vblank_irq, int *vpos, int *h=
pos,
> >> -                                ktime_t *stime, ktime_t *etime,
> >> -                                const struct drm_display_mode *mode)
> >> -{
> >> -       return amdgpu_display_get_crtc_scanoutpos(dev, pipe, 0, vpos, =
hpos,
> >> -                                                 stime, etime, mode);
> >> -}
> >> -
> >>  static struct drm_driver kms_driver =3D {
> >>         .driver_features =3D
> >>             DRIVER_USE_AGP | DRIVER_ATOMIC |
> >> @@ -1391,7 +1381,6 @@ static struct drm_driver kms_driver =3D {
> >>         .enable_vblank =3D amdgpu_enable_vblank_kms,
> >>         .disable_vblank =3D amdgpu_disable_vblank_kms,
> >>         .get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpo=
s,
> >> -       .get_scanout_position =3D amdgpu_get_crtc_scanout_position,
> >>         .irq_handler =3D amdgpu_irq_handler,
> >>         .ioctls =3D amdgpu_ioctls_kms,
> >>         .gem_free_object_unlocked =3D amdgpu_gem_object_free,
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_mode.h
> >> index eb9975f4decb..37ba07e2feb5 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> >> @@ -612,6 +612,11 @@ void amdgpu_panel_mode_fixup(struct drm_encoder *=
encoder,
> >>                              struct drm_display_mode *adjusted_mode);
> >>  int amdgpu_display_crtc_idx_to_irq_type(struct amdgpu_device *adev, i=
nt crtc);
> >>
> >> +bool amdgpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >> +                       bool in_vblank_irq, int *vpos,
> >> +                       int *hpos, ktime_t *stime, ktime_t *etime,
> >> +                       const struct drm_display_mode *mode);
> >> +
> >>  /* fbdev layer */
> >>  int amdgpu_fbdev_init(struct amdgpu_device *adev);
> >>  void amdgpu_fbdev_fini(struct amdgpu_device *adev);
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/=
amd/amdgpu/dce_v10_0.c
> >> index 40d2ac723dd6..bdc1e0f036d4 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> >> @@ -2685,6 +2685,7 @@ static const struct drm_crtc_helper_funcs dce_v1=
0_0_crtc_helper_funcs =3D {
> >>         .prepare =3D dce_v10_0_crtc_prepare,
> >>         .commit =3D dce_v10_0_crtc_commit,
> >>         .disable =3D dce_v10_0_crtc_disable,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static int dce_v10_0_crtc_init(struct amdgpu_device *adev, int index)
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/=
amd/amdgpu/dce_v11_0.c
> >> index 898ef72d423c..0319da5f7bf9 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> >> @@ -2793,6 +2793,7 @@ static const struct drm_crtc_helper_funcs dce_v1=
1_0_crtc_helper_funcs =3D {
> >>         .prepare =3D dce_v11_0_crtc_prepare,
> >>         .commit =3D dce_v11_0_crtc_commit,
> >>         .disable =3D dce_v11_0_crtc_disable,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static int dce_v11_0_crtc_init(struct amdgpu_device *adev, int index)
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v6_0.c
> >> index db15a112becc..78642c3b14fc 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> >> @@ -2575,6 +2575,7 @@ static const struct drm_crtc_helper_funcs dce_v6=
_0_crtc_helper_funcs =3D {
> >>         .prepare =3D dce_v6_0_crtc_prepare,
> >>         .commit =3D dce_v6_0_crtc_commit,
> >>         .disable =3D dce_v6_0_crtc_disable,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/a=
md/amdgpu/dce_v8_0.c
> >> index f06c9022c1fd..1e8d4975435a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> >> @@ -2593,6 +2593,7 @@ static const struct drm_crtc_helper_funcs dce_v8=
_0_crtc_helper_funcs =3D {
> >>         .prepare =3D dce_v8_0_crtc_prepare,
> >>         .commit =3D dce_v8_0_crtc_commit,
> >>         .disable =3D dce_v8_0_crtc_disable,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static int dce_v8_0_crtc_init(struct amdgpu_device *adev, int index)
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c b/drivers/gpu/dr=
m/amd/amdgpu/dce_virtual.c
> >> index e4f94863332c..4b2f915aba47 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> >> @@ -218,6 +218,7 @@ static const struct drm_crtc_helper_funcs dce_virt=
ual_crtc_helper_funcs =3D {
> >>         .prepare =3D dce_virtual_crtc_prepare,
> >>         .commit =3D dce_virtual_crtc_commit,
> >>         .disable =3D dce_virtual_crtc_disable,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static int dce_virtual_crtc_init(struct amdgpu_device *adev, int inde=
x)
> >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drive=
rs/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> index f2db400a3920..39c5cf242c1b 100644
> >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >> @@ -4821,7 +4821,8 @@ static bool dm_crtc_helper_mode_fixup(struct drm=
_crtc *crtc,
> >>  static const struct drm_crtc_helper_funcs amdgpu_dm_crtc_helper_funcs=
 =3D {
> >>         .disable =3D dm_crtc_helper_disable,
> >>         .atomic_check =3D dm_crtc_helper_atomic_check,
> >> -       .mode_fixup =3D dm_crtc_helper_mode_fixup
> >> +       .mode_fixup =3D dm_crtc_helper_mode_fixup,
> >> +       .get_scanout_position =3D amdgpu_crtc_get_scanout_position,
> >>  };
> >>
> >>  static void dm_encoder_helper_disable(struct drm_encoder *encoder)
> >> --
> >> 2.24.1
> >>
> >> _______________________________________________
> >> amd-gfx mailing list
> >> amd-gfx@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>

From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH v2 19/21] drm/vkms: Convert to CRTC VBLANK callbacks
Date: Wed, 15 Jan 2020 18:18:23 -0500
Message-ID: <20200115231823.v6uyxtgxnfgwmsqq@smtp.gmail.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-20-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mkcm5mxh5ewyz3eu"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200115121652.7050-20-tzimmermann@suse.de>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, hamohammed.sa@gmail.com, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com, jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.f
List-Id: nouveau.vger.kernel.org


--mkcm5mxh5ewyz3eu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the patch, I reviewed and tested it. Everything looks fine
for VKMS.

Reviewed-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>
Tested-by: Rodrigo Siqueira <rodrigosiqueira@gmail.com>

On 01/15, Thomas Zimmermann wrote:
> VBLANK callbacks in struct drm_driver are deprecated in favor of
> their equivalents in struct drm_crtc_funcs. Convert vkms over.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/vkms/vkms_crtc.c | 9 ++++++---
>  drivers/gpu/drm/vkms/vkms_drv.c  | 1 -
>  drivers/gpu/drm/vkms/vkms_drv.h  | 4 ----
>  3 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 74f703b8d22a..ac85e17428f8 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -76,10 +76,12 @@ static void vkms_disable_vblank(struct drm_crtc *crtc)
>  	hrtimer_cancel(&out->vblank_hrtimer);
>  }
> =20
> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
> -			       int *max_error, ktime_t *vblank_time,
> -			       bool in_vblank_irq)
> +static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> +				      int *max_error, ktime_t *vblank_time,
> +				      bool in_vblank_irq)
>  {
> +	struct drm_device *dev =3D crtc->dev;
> +	unsigned int pipe =3D crtc->index;
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(dev);
>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> @@ -154,6 +156,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs =
=3D {
>  	.atomic_destroy_state   =3D vkms_atomic_crtc_destroy_state,
>  	.enable_vblank		=3D vkms_enable_vblank,
>  	.disable_vblank		=3D vkms_disable_vblank,
> +	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>  	.get_crc_sources	=3D vkms_get_crc_sources,
>  	.set_crc_source		=3D vkms_set_crc_source,
>  	.verify_crc_source	=3D vkms_verify_crc_source,
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 25bd7519295f..860de052e820 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -103,7 +103,6 @@ static struct drm_driver vkms_driver =3D {
>  	.dumb_create		=3D vkms_dumb_create,
>  	.gem_vm_ops		=3D &vkms_gem_vm_ops,
>  	.gem_free_object_unlocked =3D vkms_gem_free_object,
> -	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>  	.gem_prime_import_sg_table =3D vkms_prime_import_sg_table,
> =20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 7d52e24564db..eda04ffba7b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -111,10 +111,6 @@ struct vkms_gem_object {
>  int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  		   struct drm_plane *primary, struct drm_plane *cursor);
> =20
> -bool vkms_get_vblank_timestamp(struct drm_device *dev, unsigned int pipe,
> -			       int *max_error, ktime_t *vblank_time,
> -			       bool in_vblank_irq);
> -
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
> =20
>  struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> --=20
> 2.24.1
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--mkcm5mxh5ewyz3eu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl4fnb8ACgkQWJzP/com
vP/gKw/+MnM27NT0QpqQpa6WMwn9PCq/07UFLOG7BuTGP2CvZOJv8Tma7U6bu9Sf
Z3IwiMYNJV8FJtwdRd+BTThIYGPTtofxsJ2R3ybhUj/VEeUaEhC2ifzwVrphEePR
3/b4QFlf/vrMfsdJSOSam6vvaiI+jE4X1ZASrUKbcl5w9KeBhs2VmcwVKmtqQgaD
YHWIWUwiwsd544GltP+mx7qxZ5+ZHVC+OuJq/GNzhwD9MyXTliBcM6nov+FPV/HE
aT4WrhBCiDHhISO9sTYPqiV6Vo7XV6sPzDMFncNqueMwP4qQr/mFebxPtlUtPYOO
jwg0ZTq/6KL+QeJM55Ygg0cvVUvG14G8ZSktb4s7rPRWE4k7/DZWP2w/xP1xVsoP
H+Q2jvjTV1qu+G2A7vtP2gYBsCx7WoYfIoR045pAIEKEz5FLF38GFY04uS/T0M3u
eez0yNDC1EojMWeTTPM5Lm7MCUPx7sR6V14gGDDVs/QBmZpgyJkWj4unYBCwk9Ge
oMSZkUhnnJT4FutLRaJk0awg7iMw7yj4XNJgKB1vEVwS2/RkJ6jrgw/PoihwOBLZ
Gmm6Ys+btER/e9zHA+u8Z5z0guAkI8r9H8ikMtqSza6RipedsEIrncLV8U2l+hwT
ooPnCySDn8Xkw985ZR+/UW0I+FjjWDVdn3jmwcyRZ99fksmbvkY=
=KRlQ
-----END PGP SIGNATURE-----

--mkcm5mxh5ewyz3eu--

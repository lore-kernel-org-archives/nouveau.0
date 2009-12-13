From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: use drm debug levels
Date: Sun, 13 Dec 2009 20:56:13 +0100
Message-ID: <87k4wqmyw2.fsf@riseup.net>
References: <1260719783-3049-1-git-send-email-madman2003@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1225034204=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1260719783-3049-1-git-send-email-madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> (Maarten
	Maathuis's message of "Sun, 13 Dec 2009 16:56:23 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1225034204==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> - Use driver level (0x2) for NV_DEBUG instead of all levels
> - Create a NV_DEBUG_KMS for KMS level (04) and use them in modesetting co=
de
> - Remove a few odd NV_TRACE calls and replace with NV_DEBUG_KMS
>
> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bios.c      |   12 +++++-----
>  drivers/gpu/drm/nouveau/nouveau_connector.c |    8 +++---
>  drivers/gpu/drm/nouveau/nouveau_dp.c        |   28 +++++++++++++--------=
-----
>  drivers/gpu/drm/nouveau/nouveau_drv.h       |   14 +++++++++++-
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c     |    2 +-
>  drivers/gpu/drm/nouveau/nv04_crtc.c         |   10 ++++----
>  drivers/gpu/drm/nouveau/nv04_dac.c          |    8 ++----
>  drivers/gpu/drm/nouveau/nv04_dfp.c          |    8 ++++--
>  drivers/gpu/drm/nouveau/nv04_display.c      |    4 +-
>  drivers/gpu/drm/nouveau/nv17_tv.c           |    4 +-
>  drivers/gpu/drm/nouveau/nv50_crtc.c         |   22 ++++++++++----------
>  drivers/gpu/drm/nouveau/nv50_cursor.c       |    8 +++---
>  drivers/gpu/drm/nouveau/nv50_dac.c          |   20 +++++++++---------
>  drivers/gpu/drm/nouveau/nv50_display.c      |   20 +++++++++---------
>  drivers/gpu/drm/nouveau/nv50_sor.c          |   16 +++++++-------
>  15 files changed, 97 insertions(+), 87 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nou=
veau/nouveau_bios.c
> index 5eec5ed..62fadbb 100644
>
> [...]
>
> diff --git a/drivers/gpu/drm/nouveau/nv04_dac.c b/drivers/gpu/drm/nouveau=
/nv04_dac.c
> index a5fa517..e6b690e 100644
> --- a/drivers/gpu/drm/nouveau/nv04_dac.c
> +++ b/drivers/gpu/drm/nouveau/nv04_dac.c
> @@ -205,7 +205,7 @@ out:
>  	NVWriteVgaSeq(dev, 0, NV_VIO_SR_CLOCK_INDEX, saved_seq1);
>=20=20
>  	if (blue =3D=3D 0x18) {
> -		NV_TRACE(dev, "Load detected on head A\n");
> +		NV_DEBUG_KMS(dev, "Load detected on head A\n");
>  		return connector_status_connected;
>  	}

This is a bit inconsistent with the other "Load detected" messages
below (in nv17_dac_detect), which are NV_INFO.

>=20=20
> @@ -350,13 +350,11 @@ static void nv04_dac_mode_set(struct drm_encoder *e=
ncoder,
>  			      struct drm_display_mode *mode,
>  			      struct drm_display_mode *adjusted_mode)
>  {
> -	struct nouveau_encoder *nv_encoder =3D nouveau_encoder(encoder);
>  	struct drm_device *dev =3D encoder->dev;
>  	struct drm_nouveau_private *dev_priv =3D dev->dev_private;
>  	int head =3D nouveau_crtc(encoder->crtc)->index;
>=20=20
> -	NV_TRACE(dev, "%s called for encoder %d\n", __func__,
> -		      nv_encoder->dcb->index);
> +	NV_DEBUG_KMS(dev, "Output mode on CRTC %d:\n", head);
>=20=20

I don't understand what that debugging message means, I guess you didn't
mean to do that?

>
> [...]
>
> diff --git a/drivers/gpu/drm/nouveau/nv17_tv.c b/drivers/gpu/drm/nouveau/=
nv17_tv.c
> index 46cfd9c..7c4d7c0 100644
> --- a/drivers/gpu/drm/nouveau/nv17_tv.c
> +++ b/drivers/gpu/drm/nouveau/nv17_tv.c
> @@ -219,7 +219,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder=
, int mode)
>  		return;
>  	nouveau_encoder(encoder)->last_dpms =3D mode;
>=20=20
> -	NV_TRACE(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
> +	NV_DEBUG_KMS(dev, "Setting dpms mode %d on TV encoder (output %d)\n",
>  		 mode, nouveau_encoder(encoder)->dcb->index);
>=20=20
>  	regs->ptv_200 &=3D ~1;

This is inconsistent too with the DPMS messages in nv04_dfp/dac/tv.c,
which are NV_INFO (I'm OK either way but IMHO it would be nice to keep
all the DPMS messages at the same debug level).

>
> [...]
>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkslRt0ACgkQ196Zy2qEI5eYKwCfT4J4IUrwrGKwiKuLBaLAsGq5
KdcAoOxfzXJj234aj268w2z6Y9ahV1Cb
=OCWo
-----END PGP SIGNATURE-----
--==-=-=--

--===============1225034204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1225034204==--

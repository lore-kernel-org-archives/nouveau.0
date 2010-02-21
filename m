From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix missing spin_unlock in
	failure path
Date: Sun, 21 Feb 2010 01:00:02 +0100
Message-ID: <87r5ofv4ot.fsf@riseup.net>
References: <1266660536-10688-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0702784239=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1266660536-10688-1-git-send-email-luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> (Luca
	Barbieri's message of "Sat, 20 Feb 2010 11:08:56 +0100")
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
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0702784239==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> writes:

> Found by sparse.
>
> Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouv=
eau/nouveau_gem.c
> index 03d8935..d7ace31 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -557,11 +557,11 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *=
dev,
>=20=20
>  		spin_lock(&nvbo->bo.lock);
>  		ret =3D ttm_bo_wait(&nvbo->bo, false, false, false);
> +		spin_unlock(&nvbo->bo.lock);
>  		if (ret) {
>  			NV_ERROR(dev, "reloc wait_idle failed: %d\n", ret);
>  			break;
>  		}
> -		spin_unlock(&nvbo->bo.lock);
>=20=20
>  		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
>  	}

Pushed, thanks.

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuAd4MACgkQ196Zy2qEI5dvJQCeKfQRVHJlIQTzgbho7SUkcUVn
KYQAnjlwb1dTQU7rnAI/ZMmAbbKNGuHB
=Ie8D
-----END PGP SIGNATURE-----
--==-=-=--

--===============0702784239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0702784239==--

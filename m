From: Pierre Moreau <pierre.morrow@free.fr>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Document nouveau support for
 Tegra in DRIVER_DESC
Date: Sun, 1 Oct 2017 15:39:14 +0200
Message-ID: <20171001133914.uwyaowazyh4byxr6@pmoreau.org>
References: <20170811105616.9727-1-rhyskidd@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1086776022=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170811105616.9727-1-rhyskidd@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Rhys Kidd <rhyskidd@gmail.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--===============1086776022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yufvcz42gksgede"
Content-Disposition: inline


--3yufvcz42gksgede
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

You are right, Tegra should probably be part of the description, even if we=
 do
not support pre-K1 Tegras.

Acked-by: Pierre Moreau <pierre.morrow@free.fr>

On 2017-08-11 =E2=80=94 10:56, Rhys Kidd wrote:
> nouveau supports the Tegra K1 and higher after the SoC-based GPUs converg=
ed
> with the main GeForce GPU families.
>=20
> Signed-off-by: Rhys Kidd <rhyskidd@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index 822fe1d4d35e..fbe42ec0a5f1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -5,7 +5,7 @@
>  #define DRIVER_EMAIL		"nouveau@lists.freedesktop.org"
> =20
>  #define DRIVER_NAME		"nouveau"
> -#define DRIVER_DESC		"nVidia Riva/TNT/GeForce/Quadro/Tesla"
> +#define DRIVER_DESC		"nVidia Riva/TNT/GeForce/Quadro/Tesla/Tegra"
>  #define DRIVER_DATE		"20120801"
> =20
>  #define DRIVER_MAJOR		1
> --=20
> 2.11.0
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--3yufvcz42gksgede
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnQ7/4ACgkQU3l4X80+
KSRpXQ//YWDa6VY+KXhpwihZy0aVBD/obTGs0Q9uNU3R9DQJ4MFfBMXz/5DjSUli
y/643kyjpJNJ/IMex18H+InD9TKypSGf0QSiu7pMwtdv0A/4JW2EhuwCyjvvUVgJ
bnXWYOqeuT96y6Bss9cbNIkCjXh7Nv8XUHoEFD+yFTmwzmZLPwLpd/7Yn4qiBF9n
rnNsRJMuD4GgFOHyH3tIgkB7/63RheRg3HkHioPhpgPGuQEXf+BpTF/rBdGhbRlb
f0lya737Y2IVELxN1B0X8Xnsdou9d8hrini0Orcbuf2dzUGfrRFUiEjb2AYNs4pQ
3Re5XrFiZx9fhcd8pXgRVyOcJP+jXwpT/HMjZpV962rzW0m4xFn3gYmiyrcjqxFy
shpndrDoBMke6TWxtQ6VLkN/YnFr+yznZA/M95EkoWbJZ50zr3h5Dh0tT/uRbbb7
Lsk5eDoNHUpDcnBmDxyai+tfvAkeL2cPwuMLF2J7HvhYSwa6iQnlZA5RF3fin9KC
XcG1LByMUdo3mzhupbpSTVSMgKnju7kfNRrVe5s+cZZ9X+EVCxdFnhAhUJ3cGdLB
h/EYNVOtrYne93SqOSlVBBG29KvCKwfYtOf8HtHcJy4KKvo5RqL/orZQAkXiJLPa
oNuJEtz6F9gaB1CiFUYQooYfII6AegRTb0qCXhKFu5WK3I2quTg=
=mYr7
-----END PGP SIGNATURE-----

--3yufvcz42gksgede--

--===============1086776022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1086776022==--

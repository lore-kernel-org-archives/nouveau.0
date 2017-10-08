From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 02/29] hwmon: properly check for errors
Date: Sun, 8 Oct 2017 12:22:18 +0200
Message-ID: <20171008102218.gkamutl5h7n2yqmi@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-3-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0017110972=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-3-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0017110972==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m2ncqvhcg24fdrzo"
Content-Disposition: inline


--m2ncqvhcg24fdrzo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> Otherwise hwmon interprets error codes as real values.
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/nouveau_hwmon.c | 33 ++++++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
>=20
> diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c
> index f1914d9a..0d75c14d 100644
> --- a/drm/nouveau/nouveau_hwmon.c
> +++ b/drm/nouveau/nouveau_hwmon.c
> @@ -470,18 +470,23 @@ nouveau_fan_read(struct device *dev, u32 attr, int =
channel, long *val)
>  	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>  	struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> +	int ret;
> =20
>  	if (!therm)
>  		return -EOPNOTSUPP;
> =20
>  	switch (attr) {
>  	case hwmon_fan_input:
> -		*val =3D nvkm_therm_fan_sense(therm);
> +		ret =3D nvkm_therm_fan_sense(therm);
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> =20
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D ret;
>  	return 0;
>  }
> =20
> @@ -491,7 +496,7 @@ nouveau_in_read(struct device *dev, u32 attr, int cha=
nnel, long *val)
>  	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>  	struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
>  	struct nvkm_volt *volt =3D nvxx_volt(&drm->client.device);
> -	int ret;
> +	int ret =3D 0;
> =20
>  	if (!volt)
>  		return -EOPNOTSUPP;
> @@ -499,7 +504,8 @@ nouveau_in_read(struct device *dev, u32 attr, int cha=
nnel, long *val)
>  	switch (attr) {
>  	case hwmon_in_input:
>  		ret =3D nvkm_volt_get(volt);
> -		*val =3D ret < 0 ? ret : (ret / 1000);
> +		if (ret >=3D 0)
> +			*val =3D ret / 1000;
>  		break;
>  	case hwmon_in_min:
>  		*val =3D volt->min_uv > 0 ? (volt->min_uv / 1000) : -ENODEV;
> @@ -511,7 +517,7 @@ nouveau_in_read(struct device *dev, u32 attr, int cha=
nnel, long *val)
>  		return -EOPNOTSUPP;
>  	}
> =20
> -	return 0;
> +	return ret;
>  }
> =20
>  static int
> @@ -520,21 +526,26 @@ nouveau_pwm_read(struct device *dev, u32 attr, int =
channel, long *val)
>  	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>  	struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
>  	struct nvkm_therm *therm =3D nvxx_therm(&drm->client.device);
> +	int ret;
> =20
>  	if (!therm || !therm->attr_get || !therm->fan_get)
>  		return -EOPNOTSUPP;
> =20
>  	switch (attr) {
>  	case hwmon_pwm_enable:
> -		*val =3D therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
> +		ret =3D therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
>  		break;
>  	case hwmon_pwm_input:
> -		*val =3D therm->fan_get(therm);
> +		ret =3D therm->fan_get(therm);
>  		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> =20
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D ret;
>  	return 0;
>  }
> =20
> @@ -544,18 +555,26 @@ nouveau_power_read(struct device *dev, u32 attr, in=
t channel, long *val)
>  	struct drm_device *drm_dev =3D dev_get_drvdata(dev);
>  	struct nouveau_drm *drm =3D nouveau_drm(drm_dev);
>  	struct nvkm_iccsense *iccsense =3D nvxx_iccsense(&drm->client.device);
> +	int ret;
> =20
>  	if (!iccsense)
>  		return -EOPNOTSUPP;
> =20
>  	switch (attr) {
>  	case hwmon_power_input:
> -		*val =3D nvkm_iccsense_read_all(iccsense);
> +		ret =3D nvkm_iccsense_read_all(iccsense);
> +		if (ret < 0)
> +			return ret;
> +		*val =3D ret;
>  		break;
>  	case hwmon_power_max:
> +		if (iccsense->power_w_max <=3D 0)
> +			return -ENODEV;
>  		*val =3D iccsense->power_w_max;
>  		break;
>  	case hwmon_power_crit:
> +		if (iccsense->power_w_crit <=3D 0)
> +			return -ENODEV;
>  		*val =3D iccsense->power_w_crit;
>  		break;
>  	default:
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--m2ncqvhcg24fdrzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnZ/FcACgkQU3l4X80+
KSTPBQ//Y2Sp/KXNQ6cpLuRAYgj6cPk0gSvrXV/jb11Z61ogGV+Hv6wcgApffOzG
TE7oY1lwo3ub0ee+LCbKehuVI8BJZUVtTe46tbAJuC0Xu3gB+EBfn/asAqnJDpck
HbhnglERb0JwNU6HnFJIIT8mY7XrLHSsS8z2L1WcobeXs28Kq2Mlw+Byor8ECb3i
aGH50dokNbdgWqNGpyIHnkdjsyafeDHm6Kq0hMaXH5zYodAHiny6w9625R1tHnGB
2jX85HQbj3aHGXtGqvcHDASMijsQyS7f7J0mEwqadk6glCFJh86LCNZHXjG3778i
PiKXgQ4MHG3IevTVBaUZQbqRCA1glWnMdnSLzOICRMm6Ni2ges8riC6ZlM0stDjU
Lwl/NCNb9UH02fTfgFVsb+aep7kvkaKQUMmJVmgdGH+t5ucaThkRFnDq5OAoMe2W
EdBKjbTFB3hgPRZrFrh1UUwmDODeHgTCFjgCWMMmrh13uZXobZab5VsEL7ei5YJ3
t64vxsvqfjHJYKIWwmLXDj09FxMqLR/u8vYVw50EOEjbRgO+4pRsXbJRHg5Tuv2a
HwuG66O9FnDtivp1jzbkvuC8j6Y8IPVy1PGmAggmqptYVny9HL93ns4J+eqqWQ0z
IFx5eTjl2OoIjTwF5L8H3fx7QfTy8Nk0kt9Un/WVQukuBCOQtJQ=
=4W4+
-----END PGP SIGNATURE-----

--m2ncqvhcg24fdrzo--

--===============0017110972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0017110972==--

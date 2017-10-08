From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 14/29] therm: Trigger reclock in
 temperature daemon
Date: Sun, 8 Oct 2017 20:13:51 +0200
Message-ID: <20171008181351.bjm5bqexggvg4b2b@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-15-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0002874074=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-15-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0002874074==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ba4dcar6rmbz2bdp"
Content-Disposition: inline


--ba4dcar6rmbz2bdp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> Depending on the temperature, cstates might become unreachable or the map=
ed
> voltage of a cstate changes. We want to adjust to that.
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/therm/base.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/therm/base.c b/drm/nouveau/nvkm/subd=
ev/therm/base.c
> index 59f01fec..c90b9cfc 100644
> --- a/drm/nouveau/nvkm/subdev/therm/base.c
> +++ b/drm/nouveau/nvkm/subdev/therm/base.c
> @@ -23,6 +23,8 @@
>   */
>  #include "priv.h"
> =20
> +#include <subdev/clk.h>
> +
>  int
>  nvkm_therm_temp_get(struct nvkm_therm *therm, int *val)
>  {
> @@ -168,9 +170,15 @@ nvkm_therm_alarm(struct nvkm_alarm *alarm)
>  	int temp;
>  	struct nvkm_therm *therm =3D
>  	       container_of(alarm, struct nvkm_therm, alarm);
> +	struct nvkm_clk *clk =3D therm->subdev.device->clk;
> +
>  	if (nvkm_therm_temp_get(therm, &temp) >=3D 0)
>  		therm->last_temp =3D temp;
> +
>  	nvkm_therm_update(therm, therm->last_temp, -1);
> +
> +	if (clk)
> +		nvkm_clk_tstate(clk, therm->last_temp);
>  }
> =20
>  int
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--ba4dcar6rmbz2bdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaatoACgkQU3l4X80+
KST4Iw/8C+DzguXpKCr4vv2c8E72U9wZJxpA7l2YwsJ6zDUwsadqSI67hBEWkQVj
vomQjmxz4BzrRSxCumnAOYgWheipkQfsE4hJijkTLmwKi01ECJvctar4HpnZPB1T
oRiWbMk9nZSUybw0BI0J+SJX3lAqrh+XVabxh6UOilgehzwQVUQUeyyZDXqco+zd
YXZLQmpo6+DOxtm5/86C/PEs6ogWlUXLcoC7gyPLZgKK4ouBL6K9faiBboiWOUot
EMWpW9dIWA4rrehKiBK9J8oFiOEr/RAb7FoItOOn1dflcq8pJZxs5JXhYxxbxPKX
yqp6GhFTTF7isiUgfcVK51rAMSHAD5OZpv5KJGXvUMdZl1X8jdasdQWXdJ7hQztW
fqSv9I6nG31guz6kq7+KAsaogVKBzK2PTXgkm9QIA45mpyH5a9C8bumYZq1Ec0/Q
Okd6tns8edSZYlNlS/3Q+1sF8YG3t3/lN4Z2qrTVDquokIUMFIit/MH7aM+/LuLs
blPWHBlWOOTTWUQf3XePEDBx//PtBn7Eygd7fWo+Y5PGlvw8glcz8KiZTpkBBLhf
UQQ7NvLJCWXNL7eqaLb4gjTVDbfCj/PVzk+gS6Trzvz1MfUVaowPdE4dPEz/dAml
6TUrKeK4GpqB4S8OIu4k8Bm7BH8uEUi/0j+WbAtgHzWAQz5P0qY=
=URGB
-----END PGP SIGNATURE-----

--ba4dcar6rmbz2bdp--

--===============0002874074==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0002874074==--

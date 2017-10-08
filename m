From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 16/29] clk: parse thermal policies for
 throttling thresholds
Date: Sun, 8 Oct 2017 20:36:18 +0200
Message-ID: <20171008183618.fvszybhbe2u3m2nv@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-17-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0208634705=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-17-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0208634705==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ljbkywuf6vchhn4u"
Content-Disposition: inline


--ljbkywuf6vchhn4u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> v2: use min_t
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  2 ++
>  drm/nouveau/nvkm/subdev/clk/base.c    | 42 +++++++++++++++++++++++++++++=
++++++
>  2 files changed, 44 insertions(+)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index f35518c3..f5ff1fd9 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -104,6 +104,8 @@ struct nvkm_clk {
>  	struct nvkm_cstate *cstate;
>  	int exp_cstateid;
>  	u8  temp;
> +	u8  max_temp;
> +	u8  relax_temp;

I guess those should be int, similar to the changes you made in patch 1.

> =20
>  	bool allow_reclock;
>  #define NVKM_CLK_BOOST_NONE 0x0
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index 54188d2b..54e14936 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -27,6 +27,7 @@
>  #include <subdev/bios/boost.h>
>  #include <subdev/bios/cstep.h>
>  #include <subdev/bios/perf.h>
> +#include <subdev/bios/thermal_policies.h>
>  #include <subdev/bios/vpstate.h>
>  #include <subdev/fb.h>
>  #include <subdev/therm.h>
> @@ -659,6 +660,44 @@ nvkm_clk =3D {
>  	.fini =3D nvkm_clk_fini,
>  };
> =20
> +static void
> +nvkm_clk_parse_max_temp(struct nvkm_clk *clk)
> +{
> +	struct nvkm_subdev *subdev =3D &clk->subdev;
> +	struct nvkm_bios *bios =3D subdev->device->bios;
> +	struct nvbios_thermal_policies_header header;
> +	struct nvbios_thermal_policies_entry entry;
> +	u8 i;
> +	s16 mt =3D 0xff;
> +	s16 rt =3D 0xff;

Why 0xff? I mean, sure, there is a high possibility that the GPU won=E2=80=
=99t like
temperatures above 255=E2=84=83, but still.

> +
> +	if (nvbios_thermal_policies_parse(bios, &header))
> +		return;
> +
> +	if (!header.ecount)
> +		return;
> +
> +	for (i =3D 0; i < header.ecount; i++) {
> +		if (nvbios_thermal_policies_entry(bios, &header, i, &entry))
> +			return;
> +
> +		if (entry.mode !=3D 1)
> +			continue;
> +
> +		mt =3D min_t(s16, mt, (entry.t0 + entry.down_offset) / 32);
> +		rt =3D min_t(s16, rt, (entry.t0 + entry.up_offset) / 32);
> +	}
> +
> +	if (mt =3D=3D 0xff || rt =3D=3D 0xff)
> +		return;
> +
> +	clk->max_temp =3D mt;
> +	clk->relax_temp =3D rt;
> +
> +	nvkm_debug(subdev, "setting up sw throttling thresholds (%u/%u=C2=B0C)\=
n",
> +		   clk->max_temp, clk->relax_temp);
> +}
> +
>  int
>  nvkm_clk_ctor(const struct nvkm_clk_func *func, struct nvkm_device *devi=
ce,
>  	      int index, bool allow_reclock, struct nvkm_clk *clk)
> @@ -733,6 +772,9 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, struc=
t nvkm_device *device,
> =20
>  	clk->boost_mode =3D nvkm_longopt(device->cfgopt, "NvBoost",
>  				       NVKM_CLK_BOOST_NONE);
> +
> +	nvkm_clk_parse_max_temp(clk);
> +
>  	return 0;
>  }
> =20
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--ljbkywuf6vchhn4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnacB4ACgkQU3l4X80+
KSQ4NxAAk2h0zz/SEwZiJuP6rZ6F16vqJhbaYBrUGtj4iq7UnmCH14Qij828lWaL
wjlQEOXu1cYHaOX1PwC/KlY5jmeYeAYA7i76SlTe+303LUPEec7EDlLNRYXmr/qm
GaZj0iZy0CEFnqeSV6IHOHAVu5EctVPwTYlG+GpYnnNqW5GDuaNfPAZZI+d4I3Jo
e4+ukzZyTkAkwYctcgGWuQOBcLHhmVOyBran3ohsvg+QnmQKSrXegFfaapNShOV+
+AHMwegl9mccWqCiRjrDbPejkPZcPka1ng2NoiSnkl1SGOfK4xS4u22/7w+rQd68
3Nb9LRfAvsXAexuR4sZzqpiYJPD2LoY5dWYDjsDbU8W5WVtfmFQWTbceQsTDfl7J
Kb78kHCO3mTE28UUDHOJLA5LgRLzdqFHtLZaRJEovVMsBBbM304SkccwVCmTIQyl
h9aWOFwBWWzeJQYMeFXBgSFwSmkJUGBf0Qx5BGeJQNLV5jWMfRQkNN7Vd2G+wJ53
TxIs9u4Vout1fCqtZw0EoU4InLlf21bMx2tBKFivn38QBeuRNCpCoWjJB9llgB+3
oQrGcbX6R/8rNB0DVYiU/B+ZijXRTSDRJiZn784ehSl9n04iOzeZZI7IPDdxZ9/v
l3Mmc0OmBvmgIZ0uP/f8Zcg91asNWBDcrM9CZ8kTXylIhu8Kpgo=
=3Ct0
-----END PGP SIGNATURE-----

--ljbkywuf6vchhn4u--

--===============0208634705==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0208634705==--

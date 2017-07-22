From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 13/13] clk: thermal throttling
Date: Sat, 22 Jul 2017 15:23:33 +0200
Message-ID: <20170722132333.ckgtoqtpqxsztnqh@pmoreau.org>
References: <20170721215524.4665-1-karolherbst@gmail.com>
 <20170721215524.4665-14-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1137379772=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170721215524.4665-14-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============1137379772==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73soioyjejdltws2"
Content-Disposition: inline


--73soioyjejdltws2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-07-21 =E2=80=94 23:55, Karol Herbst wrote:
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  1 +
>  drm/nouveau/nvkm/subdev/clk/base.c    | 35 +++++++++++++++++++++++++++++=
++----
>  2 files changed, 32 insertions(+), 4 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index f5ff1fd9..b79bf657 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -106,6 +106,7 @@ struct nvkm_clk {
>  	u8  temp;
>  	u8  max_temp;
>  	u8  relax_temp;
> +	bool throttled;
> =20
>  	bool allow_reclock;
>  #define NVKM_CLK_BOOST_NONE 0x0
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index 60edb57b..34642000 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -279,7 +279,7 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstateid)
>  	struct nvkm_fb *fb =3D subdev->device->fb;
>  	struct nvkm_pci *pci =3D subdev->device->pci;
>  	struct nvkm_pstate *pstate;
> -	int ret;
> +	int ret, cstate;
> =20
>  	if (pstateid =3D=3D NVKM_CLK_PSTATE_DEFAULT)
>  		return 0;
> @@ -308,7 +308,12 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstateid)
>  		ram->func->tidy(ram);
>  	}
> =20
> -	return nvkm_cstate_prog(clk, pstate, clk->exp_cstateid);
> +	if (clk->throttled)
> +		cstate =3D list_first_entry(&pstate->list, struct nvkm_cstate, head)->=
id;
> +	else
> +		cstate =3D clk->exp_cstateid;
> +
> +	return nvkm_cstate_prog(clk, pstate, cstate);
>  }
> =20
>  static void
> @@ -333,12 +338,17 @@ nvkm_clk_update_work(struct work_struct *work)
> =20
>  	pstate =3D clk->pwrsrc ? clk->ustate_ac : clk->ustate_dc;
>  	if (clk->state_nr && pstate !=3D -1) {
> -		pstate =3D (pstate < 0) ? clk->astate : pstate;
> +		if (clk->throttled)
> +			pstate =3D list_first_entry(&clk->states, struct nvkm_pstate, head)->=
pstate;
> +		else
> +			pstate =3D (pstate < 0) ? clk->astate : pstate;
>  	} else {
>  		pstate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	}
> =20
> -	nvkm_trace(subdev, "-> %d\n", pstate);
> +	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d C %d T %d=C2=B0C=
\n",
> +		   pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> +		   clk->astate, clk->exp_cstateid, clk->temp);
> =20
>  	/* only call into the code if the GPU is powered on */
>  	if ((!clk->pstate || pstate !=3D clk->pstate->pstate)
> @@ -574,9 +584,25 @@ nvkm_clk_astate(struct nvkm_clk *clk, int req, int r=
el, bool wait)
>  int
>  nvkm_clk_tstate(struct nvkm_clk *clk, u8 temp)
>  {
> +	struct nvkm_subdev *subdev =3D &clk->subdev;
>  	if (clk->temp =3D=3D temp)
>  		return 0;
>  	clk->temp =3D temp;
> +	if (clk->max_temp && clk->relax_temp) {
> +		if (!clk->throttled && temp > clk->max_temp) {
> +			nvkm_warn(subdev,
> +				  "temperature (%d C) hit the 'downclock' "
> +				  "threshold\n",
> +				  temp);
> +			clk->throttled =3D true;
> +		} else if (clk->throttled && temp < clk->relax_temp) {
> +			nvkm_warn(subdev,
> +				  "temperature (%d C) went below the "
> +				  "'relax' threshold\n",
> +				  temp);
> +			clk->throttled =3D false;

I don't think this should be a warning. Maybe an `nvkm_info()` instead?

Also, should the throttled status be reset/recomputed after suspend/resume =
cycle?

> +		}
> +	}
>  	return nvkm_clk_update(clk, false);
>  }
> =20
> @@ -737,6 +763,7 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, struc=
t nvkm_device *device,
>  	clk->ustate_dc =3D -1;
>  	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
>  	clk->temp =3D 90; /* reasonable default value */
> +	clk->throttled =3D false;
> =20
>  	clk->allow_reclock =3D allow_reclock;
> =20
> --=20
> 2.13.2
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--73soioyjejdltws2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAllzUdEACgkQU3l4X80+
KSSeYg/+N/WlE9cdEWp//T2nESVNrv344IJRf7uX1zP3ft+p08D2KqKp98dM/kMc
rWAmWfr8WB6ZiAlzYmuMy/YnPOkPKPhVTCiGzUtQ/oSgYkN67Q8H0g8FfhWfFjr8
xHgHb8NZNb7XfcamvRaJPJ3osjSbgO+Emgl/couyf96ZPrhmxRGwOsObcsVKga9U
ZRW9qzMiMDQaAAHQmmLZfP0u0ou+zFaRTZItooPQBOyDyrQW/klAxOTPnCyLbaJi
3U1obbKLCYZ4JvKrp++dvJnKOBVCEYlHsIxr14kcbmy3eS8RAUiR6UXulzPax8D0
YbRAReQ01fkl1pxf333HNZW3huCBA9cOAcUHcKu2v75f2TEbgLHRXpWn6YE0vLFG
d5cl9FmwWG9c65gIpT/EXBEtvRcaGYdwnsRlRqUVHTwrIqwCPk5atY3RKqkpPFSk
FIIXsuugxKu5Rl8glKROge2dBOOsfvgD8rIjaPJw2bKpYhWRBs60V+b8Eo90TT9P
d2/fyUA/AyYnJtvkYw9fT3BmpctZoKLxcqz7dAe39Q7CX6wfRSPPk9Hfmd/4w7Eb
19Se/l2QtAWlP6zixoel1domXnyUKR5jkOPsZ2wY++RRFAFZKVGqSHIPQQ+rRbL3
G7zq6uH+NpzwwnaNr/MqbABr096wLKOVqQImdODCmUm/38Ic8AQ=
=5LzM
-----END PGP SIGNATURE-----

--73soioyjejdltws2--

--===============1137379772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1137379772==--

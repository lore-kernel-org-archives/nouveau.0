From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 17/29] clk: thermal throttling
Date: Sun, 8 Oct 2017 20:49:41 +0200
Message-ID: <20171008184941.7gvipzqztuly7mzj@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-18-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0219921965=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-18-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0219921965==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v36nkxvwlhr37pj2"
Content-Disposition: inline


--v36nkxvwlhr37pj2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> v2: make message about relaxed throttling an info
>     rework reporting about current clk state
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  1 +
>  drm/nouveau/nvkm/subdev/clk/base.c    | 44 +++++++++++++++++++++++++----=
------
>  2 files changed, 33 insertions(+), 12 deletions(-)
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
> index 54e14936..72ca5e0c 100644
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
> @@ -322,22 +327,20 @@ nvkm_clk_update_work(struct work_struct *work)
>  		return;
>  	clk->pwrsrc =3D power_supply_is_system_supplied();
> =20
> -	if (clk->pstate)
> -		pstate =3D clk->pstate->pstate;
> -	else
> -		pstate =3D NVKM_CLK_PSTATE_DEFAULT;
> -	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d C %d T %d=C2=B0C=
\n",
> -		   pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> -		   clk->astate, clk->exp_cstateid, clk->temp);
> -
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
> +	nvkm_trace(subdev, "PWR %d U(AC) %d U(DC) %d A %d C %d T %d=C2=B0C\n",
> +		   clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> +		   clk->astate, clk->exp_cstateid, clk->temp);
> +
>  	if (!clk->pstate || pstate !=3D clk->pstate->pstate) {
>  		int ret =3D nvkm_pstate_prog(clk, pstate);
>  		if (ret) {
> @@ -564,9 +567,25 @@ nvkm_clk_astate(struct nvkm_clk *clk, int req, int r=
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
> +			nvkm_info(subdev,
> +				  "temperature (%d C) went below the "
> +				  "'relax' threshold\n",
> +				  temp);
> +			clk->throttled =3D false;
> +		}
> +	}
>  	return nvkm_clk_update(clk, false);
>  }
> =20
> @@ -727,6 +746,7 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, struc=
t nvkm_device *device,
>  	clk->ustate_dc =3D -1;
>  	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
>  	clk->temp =3D 90; /* reasonable default value */
> +	clk->throttled =3D false;
> =20
>  	clk->allow_reclock =3D allow_reclock;
> =20
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--v36nkxvwlhr37pj2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnac0EACgkQU3l4X80+
KSSl5hAAskjnq4Wf4/qrvVpY7S8TlMqnPntw2qCD3ABrEPoik17hRAPxWXPuxUWP
4eWHyFU1bvu2gpadrRlzi3mu7V/uBnm6aQmOI14tnlouX6/tfbFvDc4RPphCcEv0
Ez6CjO/fxiSXeb+bgUMT9hXM8IEXQOsP4dvfumpM9iXV8fReqwBmiyzJkARpd0vx
q8i6QWySKPwtGLVROeKNRM6gGIj8rA35Gnwb7MgeLJcD4Y7nPwBPKPd4gTVybU1N
pOZPN8o/w/7fLHtOOJ+OBCAWFRIKyNNdXpCY1wrecmc7M2tu1hahpwzLYewgAXE0
efYlDu/mY/f9CdxJBRb7FTekg0kdqpaFhT1ODj7XCtziKl65jWwcYc5hLQc2tvr2
09ucZjgMjJijdu0hFrBQpHxRjxO5xi+p4OKD3QgKDJXzyPNY9NppZqDQa/mhEVF9
hRtAq1gzIQYe6sqM1VVnvyS57fCWK9GTG2GFV0CfuZmErqmDkzVu8+Wv8a71xUYF
FiH+YwK/WwzlO9DiDM8m/8pFYqFJLlq2NpQmVP87RghQURmpE5PrNP/XUT//oDOX
RHBH1WkpfJS+0L4T9gkOoaSpG9bwK9days+F18DjE9bltgkH++QBYSiXa+LAkSR/
eE2DovxGq7M77EizM2lrps6Nwc3KmZ1kM6ZJIH/FoZzjd+LHRZo=
=j4EH
-----END PGP SIGNATURE-----

--v36nkxvwlhr37pj2--

--===============0219921965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0219921965==--

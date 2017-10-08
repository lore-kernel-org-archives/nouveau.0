From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 07/29] clk: Hold information about the
 current cstate status
Date: Sun, 8 Oct 2017 13:51:12 +0200
Message-ID: <20171008115112.ujl4q6owrliucycb@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-8-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1575149575=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-8-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============1575149575==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xrsyqsp4gfbhisg"
Content-Disposition: inline


--3xrsyqsp4gfbhisg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Acked-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> Later we will have situations where the expected and the current state
> isn't the same.
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  2 ++
>  drm/nouveau/nvkm/subdev/clk/base.c    | 32 +++++++++++++++++++++++++----=
---
>  2 files changed, 27 insertions(+), 7 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index ec537e08..f35518c3 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -101,6 +101,8 @@ struct nvkm_clk {
>  	int ustate_ac; /* user-requested (-1 disabled, -2 perfmon) */
>  	int ustate_dc; /* user-requested (-1 disabled, -2 perfmon) */
>  	int astate; /* perfmon adjustment (base) */
> +	struct nvkm_cstate *cstate;
> +	int exp_cstateid;
>  	u8  temp;
> =20
>  	bool allow_reclock;
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index 0d4d9fdf..d37c13b7 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -146,9 +146,14 @@ static struct nvkm_cstate *
>  nvkm_cstate_get(struct nvkm_clk *clk, struct nvkm_pstate *pstate, int cs=
tatei)
>  {
>  	struct nvkm_cstate *cstate;
> -	if (cstatei =3D=3D NVKM_CLK_CSTATE_HIGHEST)
> +	switch (cstatei) {
> +	case NVKM_CLK_CSTATE_HIGHEST:
>  		return list_last_entry(&pstate->list, typeof(*cstate), head);
> -	else {
> +	case NVKM_CLK_CSTATE_BASE:
> +		return &pstate->base;
> +	case NVKM_CLK_CSTATE_DEFAULT:
> +		return NULL;
> +	default:
>  		list_for_each_entry(cstate, &pstate->list, head) {
>  			if (cstate->id =3D=3D cstatei)
>  				return cstate;
> @@ -167,6 +172,9 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_ps=
tate *pstate, int cstatei)
>  	struct nvkm_cstate *cstate;
>  	int ret;
> =20
> +	if (cstatei =3D=3D NVKM_CLK_CSTATE_DEFAULT)
> +		return 0;
> +
>  	if (!list_empty(&pstate->list)) {
>  		cstate =3D nvkm_cstate_get(clk, pstate, cstatei);
>  		cstate =3D nvkm_cstate_find_best(clk, pstate, cstate);
> @@ -193,6 +201,7 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_ps=
tate *pstate, int cstatei)
> =20
>  	ret =3D clk->func->calc(clk, cstate);
>  	if (ret =3D=3D 0) {
> +		clk->cstate =3D cstate;
>  		ret =3D clk->func->prog(clk);
>  		clk->func->tidy(clk);
>  	}
> @@ -295,7 +304,7 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
>  		ram->func->tidy(ram);
>  	}
> =20
> -	return nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
> +	return nvkm_cstate_prog(clk, pstate, clk->exp_cstateid);
>  }
> =20
>  static void
> @@ -313,9 +322,9 @@ nvkm_clk_update_work(struct work_struct *work)
>  		pstate =3D clk->pstate->pstate;
>  	else
>  		pstate =3D NVKM_CLK_PSTATE_DEFAULT;
> -	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d T %d=C2=B0C\n",
> +	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d C %d T %d=C2=B0C=
\n",
>  		   pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> -		   clk->astate, clk->temp);
> +		   clk->astate, clk->exp_cstateid, clk->temp);
> =20
>  	pstate =3D clk->pwrsrc ? clk->ustate_ac : clk->ustate_dc;
>  	if (clk->state_nr && pstate !=3D -1) {
> @@ -536,6 +545,7 @@ nvkm_clk_ustate(struct nvkm_clk *clk, int req, int pw=
r)
>  	if (ret >=3D 0) {
>  		if (ret -=3D 2, pwr) clk->ustate_ac =3D ret;
>  		else		   clk->ustate_dc =3D ret;
> +		clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
>  		return nvkm_clk_update(clk, true);
>  	}
>  	return ret;
> @@ -548,6 +558,7 @@ nvkm_clk_astate(struct nvkm_clk *clk, int req, int re=
l, bool wait)
>  	if ( rel) clk->astate +=3D rel;
>  	clk->astate =3D min(clk->astate, clk->state_nr - 1);
>  	clk->astate =3D max(clk->astate, 0);
> +	clk->exp_cstateid =3D NVKM_CLK_CSTATE_BASE;
>  	return nvkm_clk_update(clk, wait);
>  }
> =20
> @@ -618,6 +629,8 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
> =20
>  	clk->astate =3D clk->state_nr - 1;
>  	clk->pstate =3D NULL;
> +	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
> +	clk->cstate =3D NULL;
>  	clk->temp =3D 90; /* reasonable default value */
>  	nvkm_clk_update(clk, true);
>  	return 0;
> @@ -701,15 +714,20 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, str=
uct nvkm_device *device,
>  	if (mode) {
>  		clk->ustate_ac =3D nvkm_clk_nstate(clk, mode, arglen);
>  		clk->ustate_dc =3D nvkm_clk_nstate(clk, mode, arglen);
> +		clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
>  	}
> =20
>  	mode =3D nvkm_stropt(device->cfgopt, "NvClkModeAC", &arglen);
> -	if (mode)
> +	if (mode) {
>  		clk->ustate_ac =3D nvkm_clk_nstate(clk, mode, arglen);
> +		clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
> +	}
> =20
>  	mode =3D nvkm_stropt(device->cfgopt, "NvClkModeDC", &arglen);
> -	if (mode)
> +	if (mode) {
>  		clk->ustate_dc =3D nvkm_clk_nstate(clk, mode, arglen);
> +		clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
> +	}
> =20
>  	clk->boost_mode =3D nvkm_longopt(device->cfgopt, "NvBoost",
>  				       NVKM_CLK_BOOST_NONE);
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--3xrsyqsp4gfbhisg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaETAACgkQU3l4X80+
KSR1kA/9GeHqIyMoGhOBAjcjzMYKh/FuotWJIrDNlRX4u04cE9CAM0mkRCUAWEDu
V17iPqjuqVgXgWErdw00Unv7iZrGrWxTPbhoZj+/Fn+8Tc7Yz4RNKhInkO2tGEiS
ALf1JJaqH45Yax9YigHLuQQ9G6MIwPIEHatmwoOdlGCw1qFurIf18h5ZCPcOrpSG
Y1KOywHDweGnIR1jud/fp9nPb8uZ0wDxOQ0xZsYmviAuv2dnr4h4IPLx+fKWNGX4
lq/pDdYEaxYghhn+eFxQJT2HXYV2/ohzA6iPzw6v2EV2BTuBqa6PDFOtub646mz5
DXh4m4fZ6qFizEZHfkf0U7R72HcPNrEOjkMkFEGb51L4Ia2BSTu5schJHUaM9457
5fpCBMyW7MbuGGK/KyTIO9eJgf7RioBoJmWJz3fF84VJnQpTE57RCcQc0zZGMJh+
RByQIosVv7x9zNYsEn/mLRYcpNe4kpJfUJyk2l1lmwPOVvz2T3qwIpWt3YxsOcMr
PTHnLdPPVNl95r7k2UP1NHZyblQuLAMTLdLL+/cwlKKeRMsNNLRwrgD44I6jZ0Zy
mnL+1wntbg43j9uaQfvaCAdotFi5qlKeAMOka68fLO6DW4ziESc52pTJ+qSoDEkP
10SudD4QOaxQVbsBvnaoUFNI9b1GoL69tW4iHs6wc6QdZA+IYCc=
=VlcN
-----END PGP SIGNATURE-----

--3xrsyqsp4gfbhisg--

--===============1575149575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1575149575==--

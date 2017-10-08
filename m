From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 05/29] clk: Remove dstate
Date: Sun, 8 Oct 2017 13:10:34 +0200
Message-ID: <20171008111034.p5p75jitkp2meuzc@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-6-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1678886581=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-6-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============1678886581==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ood2b2oc2xrunlrk"
Content-Disposition: inline


--ood2b2oc2xrunlrk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch could be applied before patch 04, that way patch 04 does not nee=
d to
update a function (`nvkm_clk_dstate()`) that will be removed in the next pa=
tch.

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> We won't need it now, because we will adjust the clocks depending on engi=
ne
> loads later on anyway or a static lookup table. It also simplifies the
> clocking logic.
>=20
> This code was nowhere used anyway and just a mock up.
>=20
> v2: fixed typo in commit message
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/include/nvkm/subdev/clk.h |  2 --
>  drm/nouveau/nvkm/subdev/clk/base.c    | 16 ++--------------
>  2 files changed, 2 insertions(+), 16 deletions(-)
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/clk.h b/drm/nouveau/include/=
nvkm/subdev/clk.h
> index ce3bbcfe..1340f5b8 100644
> --- a/drm/nouveau/include/nvkm/subdev/clk.h
> +++ b/drm/nouveau/include/nvkm/subdev/clk.h
> @@ -99,7 +99,6 @@ struct nvkm_clk {
>  	int ustate_ac; /* user-requested (-1 disabled, -2 perfmon) */
>  	int ustate_dc; /* user-requested (-1 disabled, -2 perfmon) */
>  	int astate; /* perfmon adjustment (base) */
> -	int dstate; /* display adjustment (min+) */
>  	u8  temp;
> =20
>  	bool allow_reclock;
> @@ -121,7 +120,6 @@ struct nvkm_clk {
>  int nvkm_clk_read(struct nvkm_clk *, enum nv_clk_src);
>  int nvkm_clk_ustate(struct nvkm_clk *, int req, int pwr);
>  int nvkm_clk_astate(struct nvkm_clk *, int req, int rel, bool wait);
> -int nvkm_clk_dstate(struct nvkm_clk *, int req, int rel);
>  int nvkm_clk_tstate(struct nvkm_clk *, u8 temperature);
>  int nvkm_clk_update(struct nvkm_clk *, bool wait);
> =20
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index ecff3ff3..07d530ed 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -306,15 +306,14 @@ nvkm_clk_update_work(struct work_struct *work)
>  		return;
>  	clk->pwrsrc =3D power_supply_is_system_supplied();
> =20
> -	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d T %d=C2=B0C D %d=
\n",
> +	nvkm_trace(subdev, "P %d PWR %d U(AC) %d U(DC) %d A %d T %d=C2=B0C\n",
>  		   clk->pstate, clk->pwrsrc, clk->ustate_ac, clk->ustate_dc,
> -		   clk->astate, clk->temp, clk->dstate);
> +		   clk->astate, clk->temp);
> =20
>  	pstate =3D clk->pwrsrc ? clk->ustate_ac : clk->ustate_dc;
>  	if (clk->state_nr && pstate !=3D -1) {
>  		pstate =3D (pstate < 0) ? clk->astate : pstate;
>  		pstate =3D min(pstate, clk->state_nr - 1);
> -		pstate =3D max(pstate, clk->dstate);
>  	} else {
>  		pstate =3D clk->pstate =3D -1;
>  	}
> @@ -554,16 +553,6 @@ nvkm_clk_tstate(struct nvkm_clk *clk, u8 temp)
>  	return nvkm_clk_update(clk, false);
>  }
> =20
> -int
> -nvkm_clk_dstate(struct nvkm_clk *clk, int req, int rel)
> -{
> -	if (!rel) clk->dstate  =3D req;
> -	if ( rel) clk->dstate +=3D rel;
> -	clk->dstate =3D min(clk->dstate, clk->state_nr - 1);
> -	clk->dstate =3D max(clk->dstate, 0);
> -	return nvkm_clk_update(clk, true);
> -}
> -
>  static int
>  nvkm_clk_pwrsrc(struct nvkm_notify *notify)
>  {
> @@ -621,7 +610,6 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
>  		return clk->func->init(clk);
> =20
>  	clk->astate =3D clk->state_nr - 1;
> -	clk->dstate =3D 0;
>  	clk->pstate =3D -1;
>  	clk->temp =3D 90; /* reasonable default value */
>  	nvkm_clk_update(clk, true);
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--ood2b2oc2xrunlrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaB6YACgkQU3l4X80+
KSSAXA//TG/ASs4RU7ygC3hfoI/W3YbawDLv1DiIs5c1G6u9jVEAjLrSBI7aYAyZ
ep1QoSN6LN2ENttDlgXktnNegndSxNqkxGsAXuwQXN97FEQJS7WkAOi8M2xj3C62
PDjV7LTDfIRi6UwUBbEiCpNqOW557BTLcT89METLPukh1hqRmZ3l1fyLHJgcioQJ
S6EkI+2DyTO51eD3ihZ9gus5OlBadeTLEAZ2v/wKJ3Bpqqp6EP4uRzYs6T5JKyQg
bMyuFOB0oreC3iCCdjJBoWGUqsIq2GNBAunyrE1SyiHeqrgKxZ8TPZ2z8Lgx7XN6
VONpsF/RgnOGCnGoP6KTT2Y3pUGCuGSvShogHhRRrccrVlOM6+X/1Jqg1BviW33l
5lE54HO5T93AQkkBHW3G1yfC9SWkRtAczfT5s2Zbqzhf7cK7d/LxyAOVoucLgAqo
mZQP3xbYl6Icx6Akog4BTJq2uyvjQ8t5FZg+OgDbmIjHn82OXrJvMyxt7x7++KFi
/4XN7g1hud5ll8SMCF8axcVLDspOOE1pK94oQU4evdFldCRcAC3i+SePAIqbs2st
Eo2aMqv73YX5hWgQe4RcsFMd2ka0kuzLjfGDQ5GuU4tg2MVXwjeOA0y7m4/dOkXE
gie/j+SFwuJUAqBOq/7YrakD95ZhrBWjMTFS1WtQod324m78fWU=
=lUi2
-----END PGP SIGNATURE-----

--ood2b2oc2xrunlrk--

--===============1678886581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1678886581==--

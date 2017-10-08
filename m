From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 08/29] clk: We should pass the pstate id
 around not the index in the list
Date: Sun, 8 Oct 2017 16:23:23 +0200
Message-ID: <20171008142323.ybxla2z2yqsd6wfk@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-9-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2085431149=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-9-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============2085431149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yq4c4lsga7slhexl"
Content-Disposition: inline


--yq4c4lsga7slhexl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> This makes the code easier, because we can compare the id with
> pstate->pstate and saves us from the trouble of iterating over the pstates
> to match the index.

I don=E2=80=99t remember whether I have already done  this comment before, =
but I am not
sure where your iterating over the pstates savings are, as in this patch at
least, you iterate as much as you did before.

A few more comments below

> v2: reword commit message
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/nouveau_debugfs.c      |  6 +--
>  drm/nouveau/nvkm/subdev/clk/base.c | 78 +++++++++++++++++++-------------=
------
>  2 files changed, 41 insertions(+), 43 deletions(-)
>=20
> diff --git a/drm/nouveau/nouveau_debugfs.c b/drm/nouveau/nouveau_debugfs.c
> index 963a4dba..27281c4e 100644
> --- a/drm/nouveau/nouveau_debugfs.c
> +++ b/drm/nouveau/nouveau_debugfs.c
> @@ -96,11 +96,11 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *=
data)
>  		} while (attr.index);
> =20
>  		if (state >=3D 0) {
> -			if (info.ustate_ac =3D=3D state)
> +			if (info.ustate_ac =3D=3D attr.state)
>  				seq_printf(m, " AC");
> -			if (info.ustate_dc =3D=3D state)
> +			if (info.ustate_dc =3D=3D attr.state)
>  				seq_printf(m, " DC");
> -			if (info.pstate =3D=3D state)
> +			if (info.pstate =3D=3D attr.state)
>  				seq_printf(m, " *");
>  		} else {
>  			if (info.ustate_ac < -1)
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index d37c13b7..1d71bf09 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -272,23 +272,26 @@ nvkm_cstate_new(struct nvkm_clk *clk, int idx, stru=
ct nvkm_pstate *pstate)
>   * P-States
>   ***********************************************************************=
******/
>  static int
> -nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
> +nvkm_pstate_prog(struct nvkm_clk *clk, int pstateid)
>  {
>  	struct nvkm_subdev *subdev =3D &clk->subdev;
>  	struct nvkm_fb *fb =3D subdev->device->fb;
>  	struct nvkm_pci *pci =3D subdev->device->pci;
>  	struct nvkm_pstate *pstate;
> -	int ret, idx =3D 0;
> +	int ret;
> =20
> -	if (pstatei =3D=3D NVKM_CLK_PSTATE_DEFAULT)
> +	if (pstateid =3D=3D NVKM_CLK_PSTATE_DEFAULT)
>  		return 0;
> =20
>  	list_for_each_entry(pstate, &clk->states, head) {
> -		if (idx++ =3D=3D pstatei)
> +		if (pstate->pstate =3D=3D pstateid)
>  			break;
>  	}
> =20
> -	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
> +	if (!pstate)
> +		return -EINVAL;
> +
> +	nvkm_debug(subdev, "setting performance state %x\n", pstateid);
>  	clk->pstate =3D pstate;
> =20
>  	nvkm_pcie_set_link(pci, pstate->pcie_speed, pstate->pcie_width);
> @@ -329,7 +332,6 @@ nvkm_clk_update_work(struct work_struct *work)
>  	pstate =3D clk->pwrsrc ? clk->ustate_ac : clk->ustate_dc;
>  	if (clk->state_nr && pstate !=3D -1) {
>  		pstate =3D (pstate < 0) ? clk->astate : pstate;
> -		pstate =3D min(pstate, clk->state_nr - 1);
>  	} else {
>  		pstate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	}
> @@ -490,33 +492,10 @@ nvkm_pstate_new(struct nvkm_clk *clk, int idx)
>  /***********************************************************************=
*******
>   * Adjustment triggers
>   ***********************************************************************=
******/
> -static int
> -nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
> -{
> -	struct nvkm_pstate *pstate;
> -	int i =3D 0;
> -
> -	if (!clk->allow_reclock)
> -		return -ENOSYS;
> -
> -	if (req !=3D -1 && req !=3D -2) {
> -		list_for_each_entry(pstate, &clk->states, head) {
> -			if (pstate->pstate =3D=3D req)
> -				break;
> -			i++;
> -		}
> -
> -		if (pstate->pstate !=3D req)
> -			return -EINVAL;
> -		req =3D i;
> -	}
> -
> -	return req + 2;
> -}
> -
>  static int
>  nvkm_clk_nstate(struct nvkm_clk *clk, const char *mode, int arglen)
>  {
> +	struct nvkm_pstate *pstate;
>  	int ret =3D 1;
> =20
>  	if (clk->allow_reclock && !strncasecmpz(mode, "auto", arglen))
> @@ -528,27 +507,46 @@ nvkm_clk_nstate(struct nvkm_clk *clk, const char *m=
ode, int arglen)
> =20
>  		((char *)mode)[arglen] =3D '\0';
>  		if (!kstrtol(mode, 0, &v)) {
> -			ret =3D nvkm_clk_ustate_update(clk, v);
> +			ret =3D v;
>  			if (ret < 0)
>  				ret =3D 1;
>  		}
>  		((char *)mode)[arglen] =3D save;
>  	}
> =20
> -	return ret - 2;
> +	if (ret < 0)
> +		return ret;

Don=E2=80=99t you need to check for `clk->allow_reclock`, as it was done in
`nvkm_clk_ustate_update()`?

> +
> +	list_for_each_entry(pstate, &clk->states, head) {
> +		if (pstate->pstate =3D=3D ret)
> +			return ret;
> +	}
> +	return -EINVAL;
>  }
> =20
>  int
>  nvkm_clk_ustate(struct nvkm_clk *clk, int req, int pwr)
>  {
> -	int ret =3D nvkm_clk_ustate_update(clk, req);
> -	if (ret >=3D 0) {
> -		if (ret -=3D 2, pwr) clk->ustate_ac =3D ret;
> -		else		   clk->ustate_dc =3D ret;
> -		clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
> -		return nvkm_clk_update(clk, true);
> +	struct nvkm_pstate *pstate;
> +	bool valid =3D false;

Same here, don=E2=80=99t you need to check for `clk->allow_reclock`, as it =
was done in
`nvkm_clk_ustate_update()`?

> +
> +	list_for_each_entry(pstate, &clk->states, head) {
> +		if (pstate->pstate =3D=3D req) {
> +			valid =3D true;
> +			break;
> +		}
>  	}
> -	return ret;
> +
> +	if (!valid)
> +		return -EINVAL;
> +
> +	if (pwr)
> +		clk->ustate_ac =3D req;
> +	else
> +		clk->ustate_dc =3D req;
> +
> +	clk->exp_cstateid =3D NVKM_CLK_CSTATE_HIGHEST;
> +	return nvkm_clk_update(clk, true);
>  }
> =20
>  int
> @@ -627,7 +625,7 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
>  	if (clk->func->init)
>  		return clk->func->init(clk);
> =20
> -	clk->astate =3D clk->state_nr - 1;
> +	clk->astate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	clk->pstate =3D NULL;
>  	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
>  	clk->cstate =3D NULL;
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--yq4c4lsga7slhexl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaNNgACgkQU3l4X80+
KSR8IA/+NPKerOu4F940bnk6SequwOSipwSfTtlqw9VJ2deZXzSJ8V6dS1fzGq9i
hfcBddynJOaftI4fm8cFIv8N2NovDmaYFo9rcJyda5zJ9FR1u7jF32j/C2VZtYw9
C257KgXLytilV0X4ozkCVb9OMAY0238oF84jSSOkZgXeIQ8GyqxRmuJElA3xxB0J
N9BSb7BlgiY4y1LwmyykCcimeydMQy8jXg3VsQqLcRB+OHA33XxFMx96kdZt7vj5
1vXth1zzTSb1g5+M3mCYKjgnMLlyyJLwwOUU1jz+0VtPrPaFWiY5g1YWW6xYc2sX
IGOSCIZCQ7in4sEUVlg25SYg25o89BZwHV9Ha0C0ZJYBJmoG27kB3eLF/sbDddqi
j226T/9VhbNi078F/hBUathqzMTiWjB8unXxbIz9TsrdGvILTSqSQYXFEp0alYaP
3tkFJyzRbLizV3IaRc2OjvEnqZi47vgKAmfHcZUW9n7W83rZwWRiH8fTuKoL+Htq
2wB+UfUr2XaZFP1aP6BNxLz9WAWmapuni7SD/+9vMTq+gL6ik6OvZomOcwhEh23w
IVGcKghUnSlDQslVK5NgonsbawQ/fZCaTgGDF/apq8wqYO012z3wAGpJN1e+tJSP
2aHxyg3O4Mz+J/Xan2qE0UvTzVZDImgzARc/Fkh7ZFIc9rYSoPg=
=vnH7
-----END PGP SIGNATURE-----

--yq4c4lsga7slhexl--

--===============2085431149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2085431149==--

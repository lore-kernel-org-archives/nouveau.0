From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 09/29] clk: Set clocks to pre suspend
 state after suspend
Date: Sun, 8 Oct 2017 16:47:57 +0200
Message-ID: <20171008144757.pzzsdmafvoz6ychm@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-10-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0100575436=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-10-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0100575436==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ccivzzue54iokoy7"
Content-Disposition: inline


--ccivzzue54iokoy7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> The idea is to clear out the saved state, because after a resume we can't
> know what the GPU is clocked to. The reclock is triggered by the call to
> nvkm_clk_update later in nvkm_clk_init.
>=20
> v2: convert to C style comments
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/clk/base.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev=
/clk/base.c
> index 1d71bf09..54188d2b 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -625,11 +625,10 @@ nvkm_clk_init(struct nvkm_subdev *subdev)
>  	if (clk->func->init)
>  		return clk->func->init(clk);
> =20
> -	clk->astate =3D NVKM_CLK_PSTATE_DEFAULT;
> +	/* after a resume we have no idea what clocks are set, reset the state
> +	 */
>  	clk->pstate =3D NULL;
> -	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
>  	clk->cstate =3D NULL;
> -	clk->temp =3D 90; /* reasonable default value */
>  	nvkm_clk_update(clk, true);
>  	return 0;
>  }
> @@ -683,8 +682,13 @@ nvkm_clk_ctor(const struct nvkm_clk_func *func, stru=
ct nvkm_device *device,
>  	clk->func =3D func;
>  	INIT_LIST_HEAD(&clk->states);
>  	clk->domains =3D func->domains;
> +
> +	clk->astate =3D NVKM_CLK_PSTATE_DEFAULT;
>  	clk->ustate_ac =3D -1;
>  	clk->ustate_dc =3D -1;
> +	clk->exp_cstateid =3D NVKM_CLK_CSTATE_DEFAULT;
> +	clk->temp =3D 90; /* reasonable default value */
> +
>  	clk->allow_reclock =3D allow_reclock;
> =20
>  	INIT_WORK(&clk->work, nvkm_clk_update_work);
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--ccivzzue54iokoy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnaOp0ACgkQU3l4X80+
KSTw6RAAw2JGa4gTRgWEc1ySL9TIAYR27+qQTHcbZhjkX+ZyhgQRtcXy2EFSa1xF
+tpHkN+doZcw2gcD+WPDtbxa6qlB6ivRzMeveim6pjv0qe2DCJOo5Sf7sSSI3Iom
tS2xKZucg/Xmyaox1DWHnJXjIdZLtUVh+oFB4IdOMwvKgq9u0UVk1GtD3RyNiVnL
vLPIqhPk8cMY315jp6IaIeK0ID56Rv7fCyVesF7oBZJtEhORPPOL8i2TUN//ginf
VjaNyiNwh4hCD/zPzq+l6Xc1OcS1A+b8OReJPjTeYq7zdowcry5yt07+8LdZuSvh
8huGm1Q+auIdp8tmWs8gIwZZ+rePyOO013RsUcaYZpVZ4B6a6XEjudvbn9HFx90Y
3Oziax4TZGF/dn5UblHL1VDeFPUOAeTKKP9ZDKEHAJKT1AKxFeEwK8rNiBqd6ZGv
tKYDQl0ZB5pYuR+4VNrpsxnm8lNOE0gD43BsdmgXVOO9GLzKMqxn0KtHxUAMlS0y
RFvMp9zXtpp29YF8CIDmZr5DGPqREuScOliCu6/DlqzYDO/x4U9OeNSrVlgtYWoR
DoPFNLdfey4QPs+hS1n5CF0bFitfETc3a+aqnvdSg2gkIuBGaH7BZW5t+IsAeSn9
mZtyrACns9WxKIPILt6ml4NEzwQUoLDwxas8RLeXn0WS1kKu/aA=
=rBTi
-----END PGP SIGNATURE-----

--ccivzzue54iokoy7--

--===============0100575436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0100575436==--

From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] ramgf100: Fix small typo.
Date: Fri, 29 Dec 2017 22:37:07 +0100
Message-ID: <20171229213706.tseyuimojjfkxpcb@pmoreau.org>
References: <20170728012010.9376-1-rosenp@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1214393776=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170728012010.9376-1-rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rosen Penev <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1214393776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qeyrnbowdho2u6qc"
Content-Disposition: inline


--qeyrnbowdho2u6qc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The typo is still present in master.
Not sure whether it will help you Ben, regarding Fermi reclocking, but it
shouldn=E2=80=99t harm in reducing possible errors. :-)

Regards,
Pierre

On 2017-07-27 =E2=80=94 18:20, Rosen Penev wrote:
> Signed-off by: Rosen Penev <rosenp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/fb/ramgf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drm/nouveau/nvkm/sub=
dev/fb/ramgf100.c
> index 4a9bd4f1..feb8820c 100644
> --- a/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> +++ b/drm/nouveau/nvkm/subdev/fb/ramgf100.c
> @@ -717,7 +717,7 @@ gf100_ram_new_(const struct nvkm_ram_func *func,
>  	ram->fuc.r_0x10f9b4 =3D ramfuc_reg(0x10f9b4);
>  	ram->fuc.r_0x10fb04 =3D ramfuc_reg(0x10fb04);
>  	ram->fuc.r_0x10fb08 =3D ramfuc_reg(0x10fb08);
> -	ram->fuc.r_0x137310 =3D ramfuc_reg(0x137300);
> +	ram->fuc.r_0x137300 =3D ramfuc_reg(0x137300);
>  	ram->fuc.r_0x137310 =3D ramfuc_reg(0x137310);
>  	ram->fuc.r_0x137360 =3D ramfuc_reg(0x137360);
>  	ram->fuc.r_0x1373ec =3D ramfuc_reg(0x1373ec);
> --=20
> 2.13.3
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--qeyrnbowdho2u6qc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlpGtYIACgkQU3l4X80+
KSS44g//ZWDea/vLjtf2SbvKV2Y+kLjerrae606coXfsryc0RZIRNMDTp2WumOYd
lcY+0LFElhVNDa97SJJMGGvnd4FbsncYDbHt1STDqKFhlvMZUnp9PqOuYpETZog7
wW4QJ/Ibfi/7eS6HSyJhe3VikVn6WFx0dPUqIiyTtRJC5i1uO7i/fRMUzbr/Yx61
495H9SqxydsUCRTMniVt8Qo82D3ABT2UquqX0Lsomf1lisDibCsijVPOwS0Ir95G
7Ur9XH3rNRekGeqvDMjcNFwzE7MWD9G/Kxi7lonpR71vnOkeh+/4e2venb3CpWOs
1BCualZmjSlTua/niBEPBgO9XcAgJ950os3aozw6edLD5GkDN3izWvhI6nLrha90
UrdJPhVfHSM8o8v8sdf+EjcKjwpXn6EdsH/flyh9HSsq9TEWPTk0tH4IioRcwBzo
GLNpTdlN4rC38m0zOLgqT26PSOaLuNC32lf4QG1QYjBlvQ71ZNA+edvhjIrzw12N
mS6UQSTeisReba4gc/3WVh/fk/6yk/Sm5dNeZJNLca4cWuYkwG8kBkhuhvZgeR4C
b5p2HdTH2bu+82TqXSJB/JFMi7Mqo9VmHWAQk8P50bvwnE9814/u3rDaDTmwZxK7
XGQad49DBQbVDB57rfKT5R4NGzNF6kDwGP2SRThpRCuFZ3C8uso=
=kfpc
-----END PGP SIGNATURE-----

--qeyrnbowdho2u6qc--

--===============1214393776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1214393776==--

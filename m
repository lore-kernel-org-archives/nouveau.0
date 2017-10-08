From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 03/29] subdev/volt/gk104: return error
 when read fails
Date: Sun, 8 Oct 2017 12:29:06 +0200
Message-ID: <20171008102906.b7gg4ugqa2w4vdag@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-4-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1360617964=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-4-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============1360617964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmmzllqldkq5r7qg"
Content-Disposition: inline


--cmmzllqldkq5r7qg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> While my gpu was powered off, hwmon returned 0.6V as the current voltage.
> If nvkm_rd32 fails for any reason, return the error.
>=20
> With that sensors will display a "N/A" instead of 0.6V.

Small nitpick, add a comma between =E2=80=9Cthat=E2=80=9D and =E2=80=9Csens=
ors=E2=80=9D.
Otherwise,

Reviewed-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drm/nouveau/nvkm/subdev/volt/gk104.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drm/nouveau/nvkm/subdev/volt/gk104.c b/drm/nouveau/nvkm/subd=
ev/volt/gk104.c
> index 1c744e02..53a7af9d 100644
> --- a/drm/nouveau/nvkm/subdev/volt/gk104.c
> +++ b/drm/nouveau/nvkm/subdev/volt/gk104.c
> @@ -40,10 +40,15 @@ gk104_volt_get(struct nvkm_volt *base)
>  {
>  	struct nvbios_volt *bios =3D &gk104_volt(base)->bios;
>  	struct nvkm_device *device =3D base->subdev.device;
> -	u32 div, duty;
> +	int div, duty;
> =20
>  	div  =3D nvkm_rd32(device, 0x20340);
> +	if (div < 0)
> +		return div;
> +
>  	duty =3D nvkm_rd32(device, 0x20344);
> +	if (duty < 0)
> +		return duty;
> =20
>  	return bios->base + bios->pwm_range * duty / div;
>  }
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--cmmzllqldkq5r7qg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnZ/e4ACgkQU3l4X80+
KSQHEQ//YDuv/90/816yM9mJaLzldZoqaUQak79QbVZNc/18FJx8iJLGhamb1kS1
3ksAKBzl5OOHS9J390Tu69kAdWcjLAv2XlD7aNPjT6PkEnw+QeMU2Ad87xMdRgVJ
rZd2XOtI1w5DpAPVkjRqhkYzcHSzNOAjD/9Gim3+HQGJ2tyhWIEIACGTXDqoXY5a
49wFFU4qmUbrAIgJ6Yue6QkdB0lX81/FfoQkGQb+Y2ZyhODtPv6fk1yFF6lpB6qc
sccktWb2ZDrSqclrV1gbirPWCW5vq3nH3nyHwnWz1zDTqTdOUIIHcs5g0trYDBpP
0qh39fQExxK/A374AgTS8S/Y3TJ7mAVW5ZVWavX2E6St5ig8RN+/C8WsKxjcjSZD
yhb+u9OIIM86JvmgHmtw/f9CsM6AK1svu3dEMXJ8C4afreTjkz+yNl1gCaJso+4j
XXAyddn+0j4tycNgucFeb0XNdnpTligzH/BhsyXQZS2sYnvEHhU4Gix48SjDn+kb
TkgxiHXOD+srQlXtz3bIwP2SjX8OGVEd14hcAwbWH9SNci+gGX1lZ+9J7al0RdYA
3fX16790sKfWb3+VKs7xu96dAonbGJSBMRgkiYU7yIqFB2euhHLbGaJQdoOYY3kU
IFbtw6Vks9K8Ju9zFP78oD05Xs78k77z3fDcEASF0742T5Nc9gQ=
=8qND
-----END PGP SIGNATURE-----

--cmmzllqldkq5r7qg--

--===============1360617964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1360617964==--

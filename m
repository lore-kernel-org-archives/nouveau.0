From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix bug id typo in comment
Date: Thu, 5 Jan 2017 16:20:14 +1000
Message-ID: <ec4e1c0e-8cc8-8a88-6e6e-70b868099e6a@redhat.com>
References: <20170105061315.20434-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1272019579=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170105061315.20434-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1272019579==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NmL2Igd3wxcup6AFiIHUW78qakvL4bIho"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NmL2Igd3wxcup6AFiIHUW78qakvL4bIho
Content-Type: multipart/mixed; boundary="QU54QgMGq2MrUBvl6RlOHr6woogEr0peV"
From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <ec4e1c0e-8cc8-8a88-6e6e-70b868099e6a-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: fix bug id typo in comment
References: <20170105061315.20434-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
In-Reply-To: <20170105061315.20434-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>

--QU54QgMGq2MrUBvl6RlOHr6woogEr0peV
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/05/2017 04:13 PM, Ilia Mirkin wrote:
> The issue was recorded in fd.o bug 27501, not 25701.
Got it, thanks!

Ben.

>=20
> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c b/driver=
s/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c
> index 0a0e44b..017a91d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/rammcp77.c
> @@ -39,7 +39,7 @@ mcp77_ram_init(struct nvkm_ram *base)
>  	u32 flush  =3D ((ram->base.size - (ram->poller_base + 0x40)) >> 5) - =
1;
> =20
>  	/* Enable NISO poller for various clients and set their associated
> -	 * read address, only for MCP77/78 and MCP79/7A. (fd#25701)
> +	 * read address, only for MCP77/78 and MCP79/7A. (fd#27501)
>  	 */
>  	nvkm_wr32(device, 0x100c18, dniso);
>  	nvkm_mask(device, 0x100c14, 0x00000000, 0x00000001);
>=20


--QU54QgMGq2MrUBvl6RlOHr6woogEr0peV--

--NmL2Igd3wxcup6AFiIHUW78qakvL4bIho
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlht5awACgkQdgucYlCS
kftnNRAAof17v0hhFGsl1si2F/I7JoiiE//SzDJv8N8S5Lfg33oxBW59yGNCBnB9
y9T0k2x7b4puw20BcX/5WSUxETrad2nQJb8yqJ2r/Jf/xK0bGYFuBnvqrq+UUQjG
USSB/9LBExAb0otW3UP2W//tLeEV5U/L2cdFX53BmJlsPl/P/qGULsF89QW2Il9t
UaVS1XRzmYubv3QTpehIt7I62HSKetZyHzwz4wGrgsP9OtOvItgsm/m2wetM7mxi
vqv8NNSHS2uNLUKeQZUAIk05BnDFL9S/Dk9vPsPG2325Sxxe4rcvxnpD+MBUsNj6
r180ETzx+6OVX/zPMfPWWVfcyO2ia+kEXKHCWfsrGHbaL5Z+ELBCGGcuiOzzPmNf
OapGaRJ3RUHBV+y6WjaVuGyXgVHu4L64wbwhZYil9evoJNylr9w86i8IXVAFoYCZ
JH9bXQojOn4/7B2bFz+zRyni6Agtu62tmh1QD4ozkFXMzxVlMoiZ72TQLYyDg0Yl
4FLHbbqJYwxQidwNYiqJJPbSp/iLFoylk3EJf0YVsY9BWv+xBCo2oUyJD4okC6xy
BLT3kBT0pPdo0va2UXhLHwerZ1KYOMtemgM7MCPekb8EQXWlV0vDP78mErFtSLOa
cZKJkBTonq0rNeJNBTajklJ47IhpPyNWmn1MMrQy7ZIsWclVhzE=
=zAOZ
-----END PGP SIGNATURE-----

--NmL2Igd3wxcup6AFiIHUW78qakvL4bIho--

--===============1272019579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1272019579==--

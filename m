From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC PATCH 15/29] bios: add thermal policies table
Date: Sun, 8 Oct 2017 20:40:11 +0200
Message-ID: <20171008184011.caivpkpoz2prju4c@pmoreau.org>
References: <20170915171129.5009-1-karolherbst@gmail.com>
 <20170915171129.5009-16-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0895205630=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170915171129.5009-16-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============0895205630==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dz7ooao7f7kg4ekh"
Content-Disposition: inline


--dz7ooao7f7kg4ekh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Looking good. It would be nice to have some defines/enums for the different
modes. Some comments about t0, t1 and t2 would be nice. I saw you are using=
 t0
in patch 16, but I have no idea why use t0 rather than t1 or t2.

Otherwise,
Acked-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>

On 2017-09-15 =E2=80=94 17:11, Karol Herbst wrote:
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../include/nvkm/subdev/bios/thermal_policies.h    | 27 ++++++++
>  drm/nouveau/nvkm/subdev/bios/Kbuild                |  1 +
>  drm/nouveau/nvkm/subdev/bios/thermal_policies.c    | 81 ++++++++++++++++=
++++++
>  3 files changed, 109 insertions(+)
>  create mode 100644 drm/nouveau/include/nvkm/subdev/bios/thermal_policies=
=2Eh
>  create mode 100644 drm/nouveau/nvkm/subdev/bios/thermal_policies.c
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/bios/thermal_policies.h b/dr=
m/nouveau/include/nvkm/subdev/bios/thermal_policies.h
> new file mode 100644
> index 00000000..c9215fdd
> --- /dev/null
> +++ b/drm/nouveau/include/nvkm/subdev/bios/thermal_policies.h
> @@ -0,0 +1,27 @@
> +#ifndef __NVBIOS_THERMAL_POLICIES_H__
> +#define __NVBIOS_THERMAL_POLICIES_H__
> +
> +struct nvbios_thermal_policies_header {
> +	u32 offset;
> +
> +	u8 version;
> +	u8 hlen;
> +	u8 ecount;
> +	u8 elen;
> +};
> +struct nvbios_thermal_policies_entry {
> +	u8  mode;
> +	u16 t0;
> +	u16 t1;
> +	u16 t2;
> +	s16 down_offset;
> +	s16 up_offset;
> +};
> +
> +int nvbios_thermal_policies_parse(struct nvkm_bios *,
> +				  struct nvbios_thermal_policies_header *);
> +int nvbios_thermal_policies_entry(struct nvkm_bios *,
> +				  struct nvbios_thermal_policies_header *,
> +				  u8 idx,
> +				  struct nvbios_thermal_policies_entry *);
> +#endif
> diff --git a/drm/nouveau/nvkm/subdev/bios/Kbuild b/drm/nouveau/nvkm/subde=
v/bios/Kbuild
> index 6b4f1e06..38f31dd0 100644
> --- a/drm/nouveau/nvkm/subdev/bios/Kbuild
> +++ b/drm/nouveau/nvkm/subdev/bios/Kbuild
> @@ -30,6 +30,7 @@ nvkm-y +=3D nvkm/subdev/bios/shadowramin.o
>  nvkm-y +=3D nvkm/subdev/bios/shadowrom.o
>  nvkm-y +=3D nvkm/subdev/bios/timing.o
>  nvkm-y +=3D nvkm/subdev/bios/therm.o
> +nvkm-y +=3D nvkm/subdev/bios/thermal_policies.o
>  nvkm-y +=3D nvkm/subdev/bios/vmap.o
>  nvkm-y +=3D nvkm/subdev/bios/volt.o
>  nvkm-y +=3D nvkm/subdev/bios/vpstate.o
> diff --git a/drm/nouveau/nvkm/subdev/bios/thermal_policies.c b/drm/nouvea=
u/nvkm/subdev/bios/thermal_policies.c
> new file mode 100644
> index 00000000..5105194e
> --- /dev/null
> +++ b/drm/nouveau/nvkm/subdev/bios/thermal_policies.c
> @@ -0,0 +1,81 @@
> +/*
> + * Copyright 2017 Karol Herbst
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Karol Herbst
> + */
> +#include <subdev/bios.h>
> +#include <subdev/bios/bit.h>
> +#include <subdev/bios/thermal_policies.h>
> +
> +static u32
> +nvbios_thermal_policies_offset(struct nvkm_bios *b)
> +{
> +	struct bit_entry bit_P;
> +
> +	if (!bit_entry(b, 'P', &bit_P)) {
> +		if (bit_P.version =3D=3D 2 && bit_P.length >=3D 0x50)
> +			return nvbios_rd32(b, bit_P.offset + 0x50);
> +	}
> +
> +	return 0;
> +}
> +
> +int
> +nvbios_thermal_policies_parse(struct nvkm_bios *b, struct nvbios_thermal=
_policies_header *h)
> +{
> +	if (!h)
> +		return -EINVAL;
> +
> +	h->offset =3D nvbios_thermal_policies_offset(b);
> +	if (!h->offset)
> +		return -ENODEV;
> +
> +	h->version =3D nvbios_rd08(b, h->offset);
> +	switch (h->version) {
> +	case 0x10:
> +		h->hlen     =3D nvbios_rd08(b, h->offset + 0x1);
> +		h->elen     =3D nvbios_rd08(b, h->offset + 0x2);
> +		h->ecount   =3D nvbios_rd08(b, h->offset + 0x3);
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +int
> +nvbios_thermal_policies_entry(struct nvkm_bios *b, struct nvbios_thermal=
_policies_header *h,
> +		     u8 idx, struct nvbios_thermal_policies_entry *e)
> +{
> +	u32 offset;
> +
> +	if (!e || !h || idx > h->ecount)
> +		return -EINVAL;
> +
> +	offset =3D h->offset + h->hlen + idx * h->elen;
> +	e->mode =3D nvbios_rd08(b, offset);
> +	e->t0 =3D nvbios_rd16(b, offset + 0x2);
> +	e->t1 =3D nvbios_rd16(b, offset + 0x4);
> +	e->t2 =3D nvbios_rd16(b, offset + 0x6);
> +	e->down_offset =3D nvbios_rd16(b, offset + 0x12);
> +	e->up_offset =3D nvbios_rd16(b, offset + 0x14);
> +
> +	return 0;
> +}
> --=20
> 2.14.1
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--dz7ooao7f7kg4ekh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYgBv5JnnDxeItcEHU3l4X80+KSQFAlnacQoACgkQU3l4X80+
KSQgfhAAwaRofc60rfaiNEPmKDbNzbVl/JmVBoQU0QigHKe7pdenUa/E38EVlaqD
2X5faZp6WJC/oCWK+IACXAAyuGZ6YEjKfb50fyghxHT0R/bub3DATJa0liSmh3Gu
4GUqEKuUWXfQXXLPCW3WocVcFlxqsQpc5rAhucNPFc5EHjaUGQFEqZyT1lMaM0T3
vBqYfP7FhSC7lmaK2abECZg1rrZ6KgWuXLWAnNbGwV6QaqgLX7OrLNJyufVSjD+j
IObrJwd2lvMJ8jO4PVPpaq+55lJqinjXQVS+54oDyq1ZV6EB17gnyChIeFahts7d
LDxfoSCVOAropuHF2Y6aeN8K1NLyxjQqxaeBG4QdAde5inE3PhAQvt4/uqu4mepe
Csu5+Cma4EeWnswBqMIKnd+zN11iuBnTSLjUUak9nDwT9+oh1k44Xg1HiPB3ze4D
N2Aoh5hpLa0DpKVm1UwwvC0xRjVuIl/6YMKQ4u4/CvuokBiue4vZrdgW4GiM31pg
n7w/uiplpfpdpnGf9aGGM0t2ElFgS+vN3jBgBmRKq4YkSOyNLySm9LCvIjnTZom4
IbKwXe/IOukkr2ExaooR2OKfBtfMqE9IgOJDjhh2vDpZouZbWvAJV1+Ef8BVZHId
ieU/UfxIRhAzqy6gjnezXrmxqJsP22wN2MzACULnJs8rcgm4om4=
=POPf
-----END PGP SIGNATURE-----

--dz7ooao7f7kg4ekh--

--===============0895205630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0895205630==--

From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/3] nvbios/power_budget: Add basic power
 budget parsing
Date: Sat, 12 Nov 2016 12:58:05 +0100
Message-ID: <20161112115805.jzhmo23bexc723ca@pmoreau.org>
References: <20161112105532.5030-1-karolherbst@gmail.com>
 <20161112105532.5030-2-karolherbst@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1226204323=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161112105532.5030-2-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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


--===============1226204323==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eg6onef2zuc453ak"
Content-Disposition: inline


--eg6onef2zuc453ak
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:55 am - Nov 12 2016, Karol Herbst wrote:
> v2: Set entry to 0xff if not found
>     Add cap entry for ver 0x30 tables
>     Rework to fix memory leak
>=20
> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../include/nvkm/subdev/bios/power_budget.h        |  24 ++++
>  drm/nouveau/nvkm/subdev/bios/Kbuild                |   1 +
>  drm/nouveau/nvkm/subdev/bios/power_budget.c        | 122 +++++++++++++++=
++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 drm/nouveau/include/nvkm/subdev/bios/power_budget.h
>  create mode 100644 drm/nouveau/nvkm/subdev/bios/power_budget.c
>=20
> diff --git a/drm/nouveau/include/nvkm/subdev/bios/power_budget.h b/drm/no=
uveau/include/nvkm/subdev/bios/power_budget.h
> new file mode 100644
> index 0000000..f295cc7
> --- /dev/null
> +++ b/drm/nouveau/include/nvkm/subdev/bios/power_budget.h
> @@ -0,0 +1,24 @@
> +#ifndef __NVBIOS_POWER_BUDGET_H__
> +#define __NVBIOS_POWER_BUDGET_H__
> +
> +#include <nvkm/subdev/bios.h>
> +
> +struct nvbios_power_budget_entry {
> +	u32 min_w;
> +	u32 avg_w;
> +	u32 max_w;
> +};
> +
> +struct nvbios_power_budget {
> +	u32 offset;
> +	u8  header_len;
> +	u8  entry_len;
> +	u8  entry_count;
> +	u8  cap_entry;
> +};
> +
> +int nvbios_power_budget_header(struct nvkm_bios *, struct nvbios_power_b=
udget *);
> +int nvbios_power_budget_entry(struct nvkm_bios *, struct nvbios_power_bu=
dget *,
> +                              u8 idx, struct nvbios_power_budget_entry *=
);
> +
> +#endif
> diff --git a/drm/nouveau/nvkm/subdev/bios/Kbuild b/drm/nouveau/nvkm/subde=
v/bios/Kbuild
> index be57220..6b4f1e0 100644
> --- a/drm/nouveau/nvkm/subdev/bios/Kbuild
> +++ b/drm/nouveau/nvkm/subdev/bios/Kbuild
> @@ -19,6 +19,7 @@ nvkm-y +=3D nvkm/subdev/bios/pcir.o
>  nvkm-y +=3D nvkm/subdev/bios/perf.o
>  nvkm-y +=3D nvkm/subdev/bios/pll.o
>  nvkm-y +=3D nvkm/subdev/bios/pmu.o
> +nvkm-y +=3D nvkm/subdev/bios/power_budget.o
>  nvkm-y +=3D nvkm/subdev/bios/ramcfg.o
>  nvkm-y +=3D nvkm/subdev/bios/rammap.o
>  nvkm-y +=3D nvkm/subdev/bios/shadow.o
> diff --git a/drm/nouveau/nvkm/subdev/bios/power_budget.c b/drm/nouveau/nv=
km/subdev/bios/power_budget.c
> new file mode 100644
> index 0000000..ed9760e
> --- /dev/null
> +++ b/drm/nouveau/nvkm/subdev/bios/power_budget.c
> @@ -0,0 +1,122 @@
> +/*
> + * Copyright 2016 Karol Herbst
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
> +#include <subdev/bios/power_budget.h>
> +
> +static u32
> +nvbios_power_budget_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *=
cnt,
> +			  u8 *len)
> +{
> +	struct bit_entry bit_P;
> +	u32 power_budget;
> +
> +	if (bit_entry(bios, 'P', &bit_P) || bit_P.version !=3D 2 ||
> +	    bit_P.length < 0x2c)
> +		return 0;
> +
> +	power_budget =3D nvbios_rd32(bios, bit_P.offset + 0x2c);
> +	if (!power_budget)
> +		return 0;
> +
> +	*ver =3D nvbios_rd08(bios, power_budget);
> +	switch (*ver) {
> +	case 0x10:
> +	case 0x20:
> +	case 0x30:
> +		*hdr =3D nvbios_rd08(bios, power_budget + 0x1);
> +		*len =3D nvbios_rd08(bios, power_budget + 0x2);
> +		*cnt =3D nvbios_rd08(bios, power_budget + 0x3);
> +		return power_budget;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +int
> +nvbios_power_budget_header(struct nvkm_bios *bios,
> +                           struct nvbios_power_budget *budget)
> +{
> +	struct nvkm_subdev *subdev =3D &bios->subdev;
> +	u8 ver, hdr, cnt, len, cap_entry;
> +	u32 header;
> +
> +	header =3D nvbios_power_budget_table(bios, &ver, &hdr, &cnt, &len);
> +	if (!header || !cnt)

Should there be a check for `budget` being `NULL` here, similarly to
`nvbios_power_budger_entry()`? (I haven=E2=80=99t looked at the other patch=
es yet.)

> +		return -ENODEV;
> +
> +	budget->offset =3D header;
> +	budget->header_len =3D hdr;
> +	budget->entry_len =3D len;
> +	budget->entry_count =3D cnt;
> +
> +	switch (ver) {
> +	case 0x20:
> +		cap_entry =3D nvbios_rd08(bios, header + 0x9);
> +		break;
> +	case 0x30:
> +		cap_entry =3D nvbios_rd08(bios, header + 0xa);
> +		break;
> +	default:
> +		cap_entry =3D 0xff;
> +	}
> +
> +	if (cap_entry < cnt)
> +		budget->cap_entry =3D cap_entry;
> +	else {
> +		if (cap_entry !=3D 0xff)
> +			nvkm_warn(subdev,
> +			          "invalid cap_entry in power budget table "
> +			          "found\n");

Printed messages should not be splitted, as it makes it harder to grep for
them.

Pierre


> +		budget->cap_entry =3D 0xff;
> +	}
> +	return 0;
> +}
> +
> +int
> +nvbios_power_budget_entry(struct nvkm_bios *bios,
> +                          struct nvbios_power_budget *budget,
> +                          u8 idx, struct nvbios_power_budget_entry *entr=
y)
> +{
> +	u32 entry_offset;
> +
> +	if (!budget || !budget->offset || idx >=3D budget->entry_count || !entr=
y)
> +		return -EINVAL;
> +
> +	entry_offset =3D budget->offset + budget->header_len + idx * budget->en=
try_len;
> +
> +	if (budget->entry_len >=3D 0xe) {
> +		entry->min_w =3D nvbios_rd32(bios, entry_offset + 0x2);
> +		entry->avg_w =3D nvbios_rd32(bios, entry_offset + 0x6);
> +		entry->max_w =3D nvbios_rd32(bios, entry_offset + 0xa);
> +	} else {
> +		entry->min_w =3D 0;
> +		entry->max_w =3D nvbios_rd32(bios, entry_offset + 0x2);
> +		entry->avg_w =3D entry->max_w;
> +	}
> +
> +	return 0;
> +}
> --=20
> 2.10.2
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--eg6onef2zuc453ak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYJwPHAAoJEI7uMhYTPh3wHzYQAJBxRsFmmJdMfOYcREXTOreu
bECy1/TYz0R9WcduzN3Xx38nOGtIV9hnl6HkXU2K6RCRjr1qhRvMuVLyoA88joII
PQ5iMNu/GbmJQdMFnhvdlMpd13TZ7idq0U0jeyKMZg5tVd0XC0YIjm3VRXcwgAf6
dReJmkTfNhlZqSwKKqHebCsOPXzSY7DUeMCfIk5DmKzN4kq8O9m8X/nQOiwLHALI
Pm56zRQTN6wWOOM4fm98ckyjzhwrBNUCEim7Z8WCuNNqpkCLkxJbbuYJSFWS+/s3
Z4KD8qyGJxT2dr5bI6gzudgHpd7OICBuBq0LzQcOQAQ0odioExjVWrqNYQ9es52A
gS4LrtcHORlwBH24aVlTw6r+n169M3UZi7U9Ho/msXABdD1SlxwWESzj0WOKUYRI
93sul/cHAnNVd0VkngxxjHBRdiEaQyWhI8zu29TSqs5JcQijpDYDIVTeLLLa9R8a
tmZLLpHg3R3LHRhfF/EXk3s8N0PQ4Pr+cynRODCXswxLHZsrU47fZVAl81ScH7CT
nNLs0cqhPTyoCQ2stutEL481hp7WE6HUm1HS1rWeG2lfNub39IhIIpsR3We+Q0LL
Z0tSdjahuH+4Tb7XtoLlBNdTNPyyp4BwZjYWlNNwOz+0MZvtQ+uWcXNKbhFIymrx
mlmOY72QY57zQY+uVYuR
=+pvi
-----END PGP SIGNATURE-----

--eg6onef2zuc453ak--

--===============1226204323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1226204323==--

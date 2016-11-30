From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/3] nvbios/power_budget: Add basic power
 budget parsing
Date: Thu, 1 Dec 2016 09:15:16 +1000
Message-ID: <5d4dfaca-c614-7760-5fe5-70552ccb55c8@gmail.com>
References: <20161130194839.2480-1-karolherbst@gmail.com>
 <20161130194839.2480-2-karolherbst@gmail.com>
 <43304ed7-beb7-a4a4-8a05-112b33a196aa@gmail.com>
 <CAEXux-ZrJPcD_DDtJoyi5LSp50xVOXrX8D3-VPTFJm1FKGukuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1922558343=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEXux-ZrJPcD_DDtJoyi5LSp50xVOXrX8D3-VPTFJm1FKGukuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1922558343==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0Ahp3QN8ep5eVE28tdCBxq9oA9TaiNtgv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0Ahp3QN8ep5eVE28tdCBxq9oA9TaiNtgv
Content-Type: multipart/mixed; boundary="4tr4UjcH8U4OqeJNKUSlgMdvfPRA7ockb"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <5d4dfaca-c614-7760-5fe5-70552ccb55c8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v3 1/3] nvbios/power_budget: Add basic power
 budget parsing
References: <20161130194839.2480-1-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <20161130194839.2480-2-karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <43304ed7-beb7-a4a4-8a05-112b33a196aa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <CAEXux-ZrJPcD_DDtJoyi5LSp50xVOXrX8D3-VPTFJm1FKGukuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAEXux-ZrJPcD_DDtJoyi5LSp50xVOXrX8D3-VPTFJm1FKGukuQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--4tr4UjcH8U4OqeJNKUSlgMdvfPRA7ockb
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/2016 08:56 AM, Karol Herbst wrote:
> 2016-11-30 23:48 GMT+01:00 Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> On 12/01/2016 05:48 AM, Karol Herbst wrote:
>>> v2: Set entry to 0xff if not found
>>>     Add cap entry for ver 0x30 tables
>>>     Rework to fix memory leak
>>> v3: More error checks
>>>     Simplify check for invalid entries
>>>
>>> Signed-off-by: Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  .../include/nvkm/subdev/bios/power_budget.h        |  25 +++++
>>>  drm/nouveau/nvkm/subdev/bios/Kbuild                |   1 +
>>>  drm/nouveau/nvkm/subdev/bios/power_budget.c        | 125 +++++++++++=
++++++++++
>>>  3 files changed, 151 insertions(+)
>>>  create mode 100644 drm/nouveau/include/nvkm/subdev/bios/power_budget=
=2Eh
>>>  create mode 100644 drm/nouveau/nvkm/subdev/bios/power_budget.c
>>>
>>> diff --git a/drm/nouveau/include/nvkm/subdev/bios/power_budget.h b/dr=
m/nouveau/include/nvkm/subdev/bios/power_budget.h
>>> new file mode 100644
>>> index 00000000..89fd4a7a
>>> --- /dev/null
>>> +++ b/drm/nouveau/include/nvkm/subdev/bios/power_budget.h
>>> @@ -0,0 +1,25 @@
>>> +#ifndef __NVBIOS_POWER_BUDGET_H__
>>> +#define __NVBIOS_POWER_BUDGET_H__
>>> +
>>> +#include <nvkm/subdev/bios.h>
>>> +
>>> +struct nvbios_power_budget_entry {
>>> +     u32 min_w;
>>> +     u32 avg_w;
>>> +     u32 max_w;
>>> +};
>>> +
>>> +struct nvbios_power_budget {
>>> +     u32 offset;
>>> +     u8  hlen;
>>> +     u8  elen;
>>> +     u8  ecount;
>>> +     u8  cap_entry;
>>> +};
>>> +
>>> +int nvbios_power_budget_header(struct nvkm_bios *,
>>> +                               struct nvbios_power_budget *);
>>> +int nvbios_power_budget_entry(struct nvkm_bios *, struct nvbios_powe=
r_budget *,
>>> +                              u8 idx, struct nvbios_power_budget_ent=
ry *);
>>> +
>>> +#endif
>>> diff --git a/drm/nouveau/nvkm/subdev/bios/Kbuild b/drm/nouveau/nvkm/s=
ubdev/bios/Kbuild
>>> index be57220a..6b4f1e06 100644
>>> --- a/drm/nouveau/nvkm/subdev/bios/Kbuild
>>> +++ b/drm/nouveau/nvkm/subdev/bios/Kbuild
>>> @@ -19,6 +19,7 @@ nvkm-y +=3D nvkm/subdev/bios/pcir.o
>>>  nvkm-y +=3D nvkm/subdev/bios/perf.o
>>>  nvkm-y +=3D nvkm/subdev/bios/pll.o
>>>  nvkm-y +=3D nvkm/subdev/bios/pmu.o
>>> +nvkm-y +=3D nvkm/subdev/bios/power_budget.o
>>>  nvkm-y +=3D nvkm/subdev/bios/ramcfg.o
>>>  nvkm-y +=3D nvkm/subdev/bios/rammap.o
>>>  nvkm-y +=3D nvkm/subdev/bios/shadow.o
>>> diff --git a/drm/nouveau/nvkm/subdev/bios/power_budget.c b/drm/nouvea=
u/nvkm/subdev/bios/power_budget.c
>>> new file mode 100644
>>> index 00000000..04c69095
>>> --- /dev/null
>>> +++ b/drm/nouveau/nvkm/subdev/bios/power_budget.c
>>> @@ -0,0 +1,125 @@
>>> +/*
>>> + * Copyright 2016 Karol Herbst
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtai=
ning a
>>> + * copy of this software and associated documentation files (the "So=
ftware"),
>>> + * to deal in the Software without restriction, including without li=
mitation
>>> + * the rights to use, copy, modify, merge, publish, distribute, subl=
icense,
>>> + * and/or sell copies of the Software, and to permit persons to whom=
 the
>>> + * Software is furnished to do so, subject to the following conditio=
ns:
>>> + *
>>> + * The above copyright notice and this permission notice shall be in=
cluded in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, E=
XPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTA=
BILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVEN=
T SHALL
>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAM=
AGES OR
>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERW=
ISE,
>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
E OR
>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>> + *
>>> + * Authors: Karol Herbst
>>> + */
>>> +#include <subdev/bios.h>
>>> +#include <subdev/bios/bit.h>
>>> +#include <subdev/bios/power_budget.h>
>>> +
>>> +static u32
>>> +nvbios_power_budget_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, =
u8 *cnt,
>>> +                       u8 *len)
>>> +{
>>> +     struct bit_entry bit_P;
>>> +     u32 power_budget;
>>> +
>>> +     if (bit_entry(bios, 'P', &bit_P) || bit_P.version !=3D 2 ||
>>> +         bit_P.length < 0x2c)
>>> +             return 0;
>>> +
>>> +     power_budget =3D nvbios_rd32(bios, bit_P.offset + 0x2c);
>>> +     if (!power_budget)
>>> +             return 0;
>>> +
>>> +     *ver =3D nvbios_rd08(bios, power_budget);
>>> +     switch (*ver) {
>>> +     case 0x10:
>>> +     case 0x20:
>>> +     case 0x30:
>>> +             *hdr =3D nvbios_rd08(bios, power_budget + 0x1);
>>> +             *len =3D nvbios_rd08(bios, power_budget + 0x2);
>>> +             *cnt =3D nvbios_rd08(bios, power_budget + 0x3);
>>> +             return power_budget;
>>> +     default:
>>> +             break;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +int
>>> +nvbios_power_budget_header(struct nvkm_bios *bios,
>>> +                           struct nvbios_power_budget *budget)
>>> +{
>>> +     struct nvkm_subdev *subdev =3D &bios->subdev;
>>> +     u8 ver, hdr, cnt, len, cap_entry;
>>> +     u32 header;
>>> +
>>> +     if (!bios || !budget)
>>> +             return -EINVAL;
>>> +
>>> +     header =3D nvbios_power_budget_table(bios, &ver, &hdr, &cnt, &l=
en);
>>> +     if (!header || !cnt)
>>> +             return -ENODEV;
>>> +
>>> +     budget->offset =3D header;
>>> +     budget->hlen =3D hdr;
>>> +     budget->elen =3D len;
>>> +     budget->ecount =3D cnt;
>>> +
>>> +     switch (ver) {
>>> +     case 0x20:
>>> +             cap_entry =3D nvbios_rd08(bios, header + 0x9);
>>> +             break;
>>> +     case 0x30:
>>> +             cap_entry =3D nvbios_rd08(bios, header + 0xa);
>>> +             break;
>>> +     default:
>>> +             cap_entry =3D 0xff;
>>> +     }
>>> +
>>> +     if (cap_entry >=3D cnt && cap_entry !=3D 0xff) {
>>> +             nvkm_warn(subdev,
>>> +                       "invalid cap_entry in power budget table foun=
d\n");
>>> +             budget->cap_entry =3D 0xff;
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     budget->cap_entry =3D cap_entry;
>>> +     return 0;
>>> +}
>>> +
>>> +int
>>> +nvbios_power_budget_entry(struct nvkm_bios *bios,
>>> +                          struct nvbios_power_budget *budget,
>>> +                          u8 idx, struct nvbios_power_budget_entry *=
entry)
>>> +{
>>> +     u32 entry_offset;
>>> +
>>> +     if (!bios || !budget || !budget->offset || idx >=3D budget->eco=
unt
>>> +             || !entry)
>>> +             return -EINVAL;
>>> +
>>> +     entry_offset =3D budget->offset + budget->hlen + idx * budget->=
elen;
>>> +
>>> +     if (budget->elen >=3D 0xe) {
>> I question this check.  Generally, when the layout of existing fields
>> changes, there's a version bump to check against.  The length is
>> increased when new fields are added without disturbing the previous on=
es.
>>
>=20
> and I say this doesn't hold up with this table, because this one is stu=
pid :p
>=20
> found lengths:
>=20
> version 10:
> 0x0c, 0x1d
>=20
> version 20:
> 0x0d, 0x1f
>=20
> version 30:
> 0x1f, 0x22
I'm not questioning there's different lengths, I'm questioning whether
all <3.0 versions should have the max_w @ +0x2 layout.

>=20
>>> +             entry->min_w =3D nvbios_rd32(bios, entry_offset + 0x2);=

>>> +             entry->avg_w =3D nvbios_rd32(bios, entry_offset + 0x6);=

>>> +             entry->max_w =3D nvbios_rd32(bios, entry_offset + 0xa);=

>>> +     } else {
>>> +             entry->min_w =3D 0;
>>> +             entry->max_w =3D nvbios_rd32(bios, entry_offset + 0x2);=

>>> +             entry->avg_w =3D entry->max_w;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>>
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>


--4tr4UjcH8U4OqeJNKUSlgMdvfPRA7ockb--

--0Ahp3QN8ep5eVE28tdCBxq9oA9TaiNtgv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlg/XYUACgkQdgucYlCS
kfuvew/8CWfq4s6jDitcSWqIVJ8ChIMWiZoTxJf9qODPU6FyILES0YqPaxjrwwEj
OJDPLiLSGs82L6eTw3FDRQhPpboKCZcq7EbVc0YOMvsgDu/yNS7SjVPsabPC0kw9
KGvnngW+aFdPbgc/OwW1LfdzKSZsfFs1LnrG6PBrFYPJJWmokt+fPR7zQSTv0Jlg
a+BMZJTc8ErOFgY2s4flBLzfwayh0ueAxpZCtQB50UZswkxYIHAO0CcrMYnhl9uh
vIhadEAouNbxEa55Qe8wiBRAkvH8BKnOZ9XRgYGffwfBiPC2ooAniNggZKyI40WM
QYsZBRf00woxxxatJIAUqhs7eBFq374iYaCKIuybIUrh3oU7WR1RBICEDMccamco
TsPEOQGBJzDbpkOjY74jjiQpoodR4/7qh4PzD9VDbefExveo/kp8NMP2RbZTrJQX
+LvTkOtlcohOHZXtwI17D+YGKjG+kWx61k3GhziK/w8ghiC2WPfRP0WAQsryzOYl
r4uux1994EgXRaGfAju4AQjIxWxBMiH0EqE8sOUuEpWDEUMpZEMjpQse4FvY3PK2
G9JM4qzp0bP93WvklAEQAW1E6UPr7uqFHead3OMwRpGDfMkcFuSVwimZZkcPW2sH
jc4o34UlD8AzhmLDGIaMDTpGX+jNnD7ouagaP8229IpL861/UsM=
=0AZZ
-----END PGP SIGNATURE-----

--0Ahp3QN8ep5eVE28tdCBxq9oA9TaiNtgv--

--===============1922558343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1922558343==--

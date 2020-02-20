From: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret-aAmZIGRXKFlg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] nv50_disp_chan_mthd: ensure mthd is not NULL
Date: Thu, 20 Feb 2020 19:09:13 +0100
Message-ID: <ea846dcd-0fc9-01a6-4bb4-dde68888d06e@qubes-os.org>
References: <dac89843-5258-5bed-ee86-7038e94e56da@qubes-os.org>
 <c94ce223-56d5-e31a-2a2c-59defb988b28@qubes-os.org>
 <CAKb7Uvh8Ob592LOizH9FGZz5ag=VJ3R=dh0G5iZSg2-JzWZFMQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0330107956=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvh8Ob592LOizH9FGZz5ag=VJ3R=dh0G5iZSg2-JzWZFMQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0330107956==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hkI44MPNhtb0IuTBA6t4rXJyj69YDa5QI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hkI44MPNhtb0IuTBA6t4rXJyj69YDa5QI
Content-Type: multipart/mixed; boundary="WLJy850lTfsTLeed3UAVaXbc1Hmlnodt8"

--WLJy850lTfsTLeed3UAVaXbc1Hmlnodt8
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Ilia,
Well...if Ben made it's own version you mean using my patch given on comm=
ent https://bugzilla.kernel.org/show_bug.cgi?id=3D206299#c9 and then addi=
ng commit message without quoting me as reporter ok...

At least, upstream is patched.

Best,
Fr=C3=A9d=C3=A9ric

On 2020-02-20 18:32, Ilia Mirkin wrote:
> Hi Fr=C3=A9d=C3=A9ric,
>=20
> It appears Ben made his own version of this patch (probably based on
> the one you added to the kernel bz), and it's already upstream:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.6-rc2&id=3D0e6176c6d286316e9431b4f695940cfac4ffe6c2
>=20
> Cheers,
>=20
>   -ilia
>=20
> On Thu, Feb 20, 2020 at 12:19 PM Fr=C3=A9d=C3=A9ric Pierret
> <frederic.pierret-aAmZIGRXKFlg9hUCZPvPmw@public.gmane.org> wrote:
>>
>> Hi,
>> Is anything missing here? How can I get this merged?
>>
>> Best regards,
>> Fr=C3=A9d=C3=A9ric Pierret
>>
>> On 2020-02-08 20:43, Fr=C3=A9d=C3=A9ric Pierret wrote:
>>> Pointer to structure array is assumed not NULL by default. It has
>>> the consequence to raise a kernel panic when it's not the case.
>>>
>>> Basically, running at least a RTX2080TI on Xen makes a bad mmio error=

>>> which causes having 'mthd' pointer to be NULL in 'channv50.c'. From t=
he
>>> code, it's assumed to be not NULL by accessing directly 'mthd->data[0=
]'
>>> which is the reason of the kernel panic. Simply check if the pointer
>>> is not NULL before continuing.
>>>
>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D206299
>>> Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> Signed-off-by: Fr=C3=A9d=C3=A9ric Pierret (fepitre) <frederic.pierret=
@qubes-os.org>
>>> ---
>>>  drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c b/dr=
ivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
>>> index bcf32d92ee5a..50e3539f33d2 100644
>>> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
>>> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/channv50.c
>>> @@ -74,6 +74,8 @@ nv50_disp_chan_mthd(struct nv50_disp_chan *chan, in=
t debug)
>>>
>>>       if (debug > subdev->debug)
>>>               return;
>>> +     if (!mthd)
>>> +             return;
>>>
>>>       for (i =3D 0; (list =3D mthd->data[i].mthd) !=3D NULL; i++) {
>>>               u32 base =3D chan->head * mthd->addr;
>>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau


--WLJy850lTfsTLeed3UAVaXbc1Hmlnodt8--

--hkI44MPNhtb0IuTBA6t4rXJyj69YDa5QI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEn6ZLkvlecGvyjiymSEAQtc3FduIFAl5Oy0gACgkQSEAQtc3F
duLVXQ//UcaE2INvYMM1EVdYZv3qU9YSA1kGBFofdUewle8ME//5XfA1y9+Regdz
m/iunXPFn06NOCv13zYYTtmvs0PbHEdjWyi0GmfU5Qvmmr7Z+jsFetBDTi3y8IZu
CffSroIMUGSEP0l06JA0Bg4gWJv/fGCIOXcn5rAdL1L0kbE1jAP3Y6nxhQExTgYq
OvvSa2sxOBZ82fkuTTzN/qRKIMY+UGsHzMx+wUbGkRI4ncyxO0M6ZFqBAt4nTFA2
k+FWQc9e8+mUXxQJSQ/8d8z+o2c16ss30CektB8KHQNQX3UqvrzXaOo1+VS3LduG
3HI8kU4KnHT/K3Dy0Bf5AhyAHInS1URBETVEyANzQOMYQ3IOX6ORjdUP6pXeBiht
lGf6OgakKWAos6gAcYYcYbpRFBFZEJEhfYcjvboPmL0WjhuKnmPjwS0UZVdA9iKr
PD8BVzRZW+twgblxMvr1KNfIAyWCYckP53tpsqPq9+WbOEBBg5ub3o/S1UqLp2cH
9h2jTzZoYjY6u+Kuaxw69aL4uZGwToKDD6sD6MW+dND5QE+N4E0zuDUCiUzDmmPm
Aw7DFYVdHJIKDgbWPtdKAePZd3WVZ5OxBGgZAzslY7O26CUyvkUS8GnRqoB3UTdd
aVghJwC5dw0lEXpast9xk0nPyd1TQIoFHFVXnxbxTV38LQ3xrrQ=
=RGFd
-----END PGP SIGNATURE-----

--hkI44MPNhtb0IuTBA6t4rXJyj69YDa5QI--

--===============0330107956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0330107956==--

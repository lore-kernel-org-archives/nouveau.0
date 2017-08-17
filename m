From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH][V2] drm/nouveau: perform null check on
 msto[i] rathern than msto
Date: Fri, 18 Aug 2017 08:23:48 +1000
Message-ID: <2f8ba630-525d-439c-7e6c-c4abbcec68a5@redhat.com>
References: <20170817220323.26717-1-colin.king@canonical.com>
 <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA@mail.gmail.com>
 <83ec451a-ceaa-5d62-948e-c34bbd670c0e@canonical.com>
 <53264562-fddf-8214-859c-0f491b2ca42a@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0761673625=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53264562-fddf-8214-859c-0f491b2ca42a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0761673625==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Eg4oAVa0S1rKCO1V7V7m3hlNtkUOtGv4p"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Eg4oAVa0S1rKCO1V7V7m3hlNtkUOtGv4p
Content-Type: multipart/mixed; boundary="PiLvlbiTddDmgw1kGi4E4cOkD3sWOrrWp";
 protected-headers="v1"
From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Colin Ian King
 <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>,
 "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <2f8ba630-525d-439c-7e6c-c4abbcec68a5-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Nouveau] [PATCH][V2] drm/nouveau: perform null check on msto[i]
 rathern than msto
References: <20170817220323.26717-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
 <CAKb7Uvh0G_KyVjh=p59R_qLF8qz+j0_s93WhscAhMYcV1-Z1AA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <83ec451a-ceaa-5d62-948e-c34bbd670c0e-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
 <53264562-fddf-8214-859c-0f491b2ca42a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <53264562-fddf-8214-859c-0f491b2ca42a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

--PiLvlbiTddDmgw1kGi4E4cOkD3sWOrrWp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 08/18/2017 08:20 AM, Ben Skeggs wrote:
> On 08/18/2017 08:16 AM, Colin Ian King wrote:
>> On 17/08/17 23:07, Ilia Mirkin wrote:
>>> On Thu, Aug 17, 2017 at 6:03 PM, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org=
> wrote:
>>>> From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>>>>
>>>> The null check on the array msto is incorrect since msto is never
>>>> null. The null check should be instead on msto[i] since this is
>>>> being dereferenced in the call to drm_mode_connector_attach_encoder.=

>>>>
>>>> Thanks to Emil Velikov for pointing out the mistake in my original
>>>> fix and for suggesting the correct fix.
>>>>
>>>> Detected by CoverityScan, CID#1375915 ("Array compared against 0")
>>>>
>>>> Fixes: f479c0ba4a17 ("drm/nouveau/kms/nv50: initial support for DP 1=
=2E2 multi-stream")
>>>> Signed-off-by: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>>>> ---
>>>>  drivers/gpu/drm/nouveau/nv50_display.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/dr=
m/nouveau/nv50_display.c
>>>> index f7b4326a4641..ed444ecd9e85 100644
>>>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>>>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>>>> @@ -3141,7 +3141,7 @@ nv50_mstc_new(struct nv50_mstm *mstm, struct d=
rm_dp_mst_port *port,
>>>>         mstc->connector.funcs->reset(&mstc->connector);
>>>>         nouveau_conn_attach_properties(&mstc->connector);
>>>>
>>>> -       for (i =3D 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto; i++)=

>>>> +       for (i =3D 0; i < ARRAY_SIZE(mstm->msto) && mstm->msto[i]; i=
++)
>>>
>>> Ben will have to rule on which way is correct, but another
>>> interpretation is that it should be
>>>
>>> for (...; i < ARRAY_SIZE; i++)
>>>   if (mstm->msto[i])
>>>     do_stuff()
>>
>> Yes, I suspect that is a better generic solution top cope with potenti=
al
>> "holes".
>>>
>>> I haven't the faintest clue whether the msto array can have "holes" o=
r not.
>>
>> Indeed. Let's see what Ben says.
> No, there can't be holes here.  I believe the V2 patch to be correct.
Also, I've taken the patch in my tree, and will get it to Dave at some
point.

Thank you!
Ben.

>=20
> Ben.
>>
>>
>>>
>>>>                 drm_mode_connector_attach_encoder(&mstc->connector, =
&mstm->msto[i]->encoder);
>>>>
>>>>         drm_object_attach_property(&mstc->connector.base, dev->mode_=
config.path_property, 0);
>>>> --
>>>> 2.11.0
>>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe kernel-jani=
tors" in
>>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>=20


--PiLvlbiTddDmgw1kGi4E4cOkD3sWOrrWp--

--Eg4oAVa0S1rKCO1V7V7m3hlNtkUOtGv4p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAlmWF3QACgkQdgucYlCS
kftszw//XV8cGOyJSIVOXsP/5JCuVOl+S8wdIftXWwkoCgCX3i1evt/NoB1E6uL4
bp5tw2brPLOYmS0wbelBqJmS4FEYGIOJ2cXTo9Ap4ZYf0zKQ12E36vJab9H6bM/M
OA61OooLZNgXi9P8AZwO8jRAMzygubBQp+8TJnCRPnjqEpVERSFn1HLE7ZUHDmLn
NVZLc4UAUOVgmBVPHl1EEnV23ffTwc8GF1YlxZdCXZhzc3RjzcZmjfyR26xDNaIZ
iYjT/BbEJyRlvI25NL2Z8OMtmJkqONubzWsg+fIrgImDkvhHY4KvxIV/KmYk23pL
7ETgluDy22jeDk4Ctibx8cMYAkSXVjSsuFVQApuGzilbN+KIsCY0giUFCxlm8N1J
XdNLcN8+1WmVCCAMAhY4y3KLnsg3lPB3FAJuwONiOv5g3lmudzqxpTB7I0RskBIB
fXYH04TXK76CDxCMUXbqNXLBc1haBkIhlEafZRhjSTXVLBZjW2VUVafOgQQOubaF
tCCVNYa45yDWEgQbfm/VLvsdzBVGxtv99yiMiTee0kFNN/CJK3ljHAA1PRoua+dx
SsIgqnFxWmnK26ZyLzFhD6171dpjBhyVsesyd+9wzjEa7hn4AFCwtLAL5V0Jyyej
dh/YbmOcJwh7lozSyzCEfnSXMlDdikor98pkJGiq5glCnB7nzlw=
=dR84
-----END PGP SIGNATURE-----

--Eg4oAVa0S1rKCO1V7V7m3hlNtkUOtGv4p--

--===============0761673625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0761673625==--

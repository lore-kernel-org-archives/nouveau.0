From: Josef Larsson <josef.lar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Accept 3d controllers and not only VGA
 controllers.
Date: Sun, 3 Dec 2017 20:56:02 +0100
Message-ID: <1db4b522-25bf-def4-cdea-d9059a56d19e@gmail.com>
References: <91cc0a88-96b5-9099-2add-37bee1127eda@gmail.com>
 <833b7158-c15d-0f4f-b003-8b7b8810a74a@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1081298136=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <833b7158-c15d-0f4f-b003-8b7b8810a74a-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1081298136==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JjqQOdFbVtajrmd5HuWWdCvlBC6mgnsbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JjqQOdFbVtajrmd5HuWWdCvlBC6mgnsbC
Content-Type: multipart/mixed; boundary="kIXwPHaoNc5aG2h4UguJAJmQLIVEXiAkK";
 protected-headers="v1"
From: Josef Larsson <josef.lar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <1db4b522-25bf-def4-cdea-d9059a56d19e-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] Accept 3d controllers and not only VGA
 controllers.
References: <91cc0a88-96b5-9099-2add-37bee1127eda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
 <833b7158-c15d-0f4f-b003-8b7b8810a74a-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
In-Reply-To: <833b7158-c15d-0f4f-b003-8b7b8810a74a-AqjdNwhu20eELgA04lAiVw@public.gmane.org>

--kIXwPHaoNc5aG2h4UguJAJmQLIVEXiAkK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Sure, I can easily split it into two commits, but I would like to have
an OK on the actual code changes before splitting the patch.

Best regards,

Josef Larsson


On 2017-11-11 01:05, Tobias Klausmann wrote:
>
> On 11/10/17 7:49 PM, Josef Larsson wrote:
>> Accept 3d controllers and not only VGA controllers. According to Ilia
>> Mirkin,
>> the VGA controller check should be removed. This makes it possible
>> to use external connectors on a docking station (40A5) for a Thinkpad
>> P51.
>> (See Bug 101778).
>>
>> lspci example:
>>
>> 01:00.0 3D controller: NVIDIA Corporation GM107GLM [Quadro M1200 Mobil=
e]
>> (rev a2)
>>
>> Also include safe-guards to avoid NULL dereferencing of fbcon, which i=
s
>> how this bug was found.
>> ---
>> =C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_fbcon.c |=C2=A0 3 +--
>> =C2=A0=C2=A0drivers/gpu/drm/nouveau/nv50_display.c=C2=A0 | 13 ++++++++=
+++++
>> =C2=A0=C2=A02 files changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> index 2b12d82aac15..6b4d374a9d82 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> @@ -498,8 +498,7 @@ nouveau_fbcon_init(struct drm_device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int preferred_bpp;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!dev->mode_config.num_crtc ||
>> -=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 (dev->pdev->class >> 8) !=3D PC=
I_CLASS_DISPLAY_VGA)
>> +=C2=A0=C2=A0=C2=A0 if (!dev->mode_config.num_crtc)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbcon =3D kzalloc(sizeof(struct =
nouveau_fbdev), GFP_KERNEL);
>> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c
>> b/drivers/gpu/drm/nouveau/nv50_display.c
>> index fb47d46050ec..061daf036407 100644
>> --- a/drivers/gpu/drm/nouveau/nv50_display.c
>> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
>> @@ -3214,6 +3214,13 @@ nv50_mstm_destroy_connector(struct
>> drm_dp_mst_topology_mgr *mgr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(connector->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nv50_mstc *mstc =3D nv50_mstc(co=
nnector);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!drm->fbcon)
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 NV_WARN(drm, "drm->fbcon of %s =
point to NULL. Will not destroy
>> connector\n",
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 connector->n=
ame);
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_connector_unregister(&mstc->connect=
or);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_modeset_lock_all(drm->dev);
>> @@ -3229,6 +3236,12 @@ nv50_mstm_register_connector(struct drm_connect=
or
>> *connector)
>> =C2=A0=C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_drm *drm =3D nouveau_drm=
(connector->dev);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!drm->fbcon)
>> +=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 NV_WARN(drm, "drm->fbcon of %s =
point to NULL. Will not register
>> connector\n",
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 connector->n=
ame);
>> +=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_modeset_lock_all(drm->dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_fb_helper_add_one_connector(&drm->f=
bcon->helper, connector);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_modeset_unlock_all(drm->dev);
>>
>>
>
> Hi,
>
> the patch looks OK to me, yet as noted in IRC, i'd like to have this
> patch split into two and have the ->fbcon check as a precondition to
> the 3D Controller part. But lets see what the other and more clever
> people think about it! :)
>
> Greetings,
>
> Tobias
>



--kIXwPHaoNc5aG2h4UguJAJmQLIVEXiAkK--

--JjqQOdFbVtajrmd5HuWWdCvlBC6mgnsbC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJIBAEBCAAyFiEEXOZ5DdYY2uMl8/NHxUD9C+gJpGAFAlokVtIUHGpvc2VmLmxh
ckBnbWFpbC5jb20ACgkQxUD9C+gJpGBKWg/+OGqiu2bZirQ+3YxIf0R3DH4SrLlJ
lexq7Zao6YfLh6CJfvzNp/GD7oxQq6dC1R07U8M60+mpniSjc80m75vS1wCkd9je
+jCcquDo7UeJF5fAq+Hf6JC46ueu2tXy0VWwWwgLSI/c2vRnlz7E2jh2uvKTS44D
se3xfSotna2Ol03fWFk4zvEgo+UHLftogfPTrn/ktDTiAHjEcDYVAweCw5Vgxta+
6xJ/Qrqz26vI+4/N3Q8qvZkQt32HQiX0AZvPGaXiDlc8rC8vfCF7rCBWGoLRJe6J
pvnQO6dSLznf1KdCTeGYI+hLeor14aXdCvR55DkXXuTJb0Nb2HsiwVmu4HBHl22f
rGPVjbrIL0yFfshr6P6tZUsjng1oRjdHJadhPLWYDNKYVIQBUP+Ftl7lmFXALY8G
bHH/vLCdc/3WPm8ORpzmpCVFYGhQvPirstgkXA5jpXqEjH3wrNXb/+kZbiv4LaR6
jTFdAK0zBbWmCmMrANTVMuXr5xuFKmntd2Toa5jmnZnUFyY0lpASsLOSn0jL2Iyz
LqwcMk7QLAPhIbw7XEDXWa6i98IEo6deNxFuW43hZo3kdJQlACK1R0srB8pXsXKX
hvR8XlBRl5g9P0ifbTkRzt52eKW6gQseLcbVIjYSLnn5Ygd9MwJSLvodHb8lXk/M
lAeMAXDAA//kJa4=
=Au+i
-----END PGP SIGNATURE-----

--JjqQOdFbVtajrmd5HuWWdCvlBC6mgnsbC--

--===============1081298136==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1081298136==--

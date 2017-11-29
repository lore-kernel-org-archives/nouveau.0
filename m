From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH] gr: did you try turning it off and on
 again.
Date: Wed, 29 Nov 2017 13:59:15 +1000
Message-ID: <3499dd5d-ae01-722e-f671-14740a33f6a9@gmail.com>
References: <20171128131142.2913-1-kherbst@redhat.com>
 <6708daef-4e1b-4950-f4af-2df7aae9f876@mni.thm.de>
 <CACO55tvwy0Pj-zUi-X-APueewbV_qe1N71bmHDHNaGLbqg5jig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0837427573=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tvwy0Pj-zUi-X-APueewbV_qe1N71bmHDHNaGLbqg5jig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0837427573==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TWuKIveUdkFlXv2mdVFw5mURFgQOufVw4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TWuKIveUdkFlXv2mdVFw5mURFgQOufVw4
Content-Type: multipart/mixed; boundary="qtWJ8U9lHA8WpPwdtewFhBfIGUEcr3098";
 protected-headers="v1"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <3499dd5d-ae01-722e-f671-14740a33f6a9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [RFC PATCH] gr: did you try turning it off and on
 again.
References: <20171128131142.2913-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <6708daef-4e1b-4950-f4af-2df7aae9f876-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
 <CACO55tvwy0Pj-zUi-X-APueewbV_qe1N71bmHDHNaGLbqg5jig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CACO55tvwy0Pj-zUi-X-APueewbV_qe1N71bmHDHNaGLbqg5jig-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--qtWJ8U9lHA8WpPwdtewFhBfIGUEcr3098
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 11/29/2017 01:47 PM, Karol Herbst wrote:
> On Tue, Nov 28, 2017 at 4:36 PM, Tobias Klausmann
> <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>> Hi,
>>
>> comments inline
>>
>> On 11/28/17 2:11 PM, Karol Herbst wrote:
>>>
>>> Fixes secure boot on my gp107. No idea why. Otherwise the GPU enters
>>> complete lockdown after starting the gpccs and fecs with the LS image=
s
>>> loaded.
>>>
>>> Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   drm/nouveau/nvkm/engine/gr/gf100.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c
>>> b/drm/nouveau/nvkm/engine/gr/gf100.c
>>> index 2f8dc107..322d9fa6 100644
>>> --- a/drm/nouveau/nvkm/engine/gr/gf100.c
>>> +++ b/drm/nouveau/nvkm/engine/gr/gf100.c
>>> @@ -1731,8 +1731,15 @@ gf100_gr_init_(struct nvkm_gr *base)
>>>   {
>>>         struct gf100_gr *gr =3D gf100_gr(base);
>>>         struct nvkm_subdev *subdev =3D &base->engine.subdev;
>>> +       struct nvkm_device *device =3D subdev->device;
>>>         u32 ret;
>>>   +     /* did you try turning it off and on again? Apparently we nee=
d
>>> this
>>> +        * on pascal, otherwise secboot will just fail.
>>
>>
>>
>> The comments about the off and on looks silly, at least put it in quot=
ation
>> marks, or rewrite it, e.g. "Apparently we need to turn it off and on f=
or the
>> pascal generation, otherwise secboot will just fail."
>>
>=20
> right... I wasn't entirely serious about this one though. Just a
> little annoyed, that this was just a painful issue, because it just
> doesn't make any sense at all in the end. And because this is
> involving secure boot here, who knows how many bugs of this kind are
> still there?
>=20
>>> +        */
>>> +       nvkm_mask(device, 0x200, 0x1000, 0x0000);
>>> +       nvkm_mask(device, 0x200, 0x1000, 0x1000);
>>> +
>>
>>
>>
>> It is needed with pascal, but does it harm other generations calling t=
his
>> init? Maybe guard it against exectution on maxwell
>>
>=20
> Maybe, maybe not? I think it is fairly safe, but I kind of hoped
> somebody with more knowledge about these kind of things would respond
> and tells us this has to be done or maybe not.
This should already be happening actually, so it's definitely weird that
adding it there explicitly does anything at all...

Can you mmiotrace nouveau for me?

Ben.

>=20
>>
>> Greetings,
>>
>> Tobias
>>
>>
>>
>>>         nvkm_pmu_pgob(gr->base.engine.subdev.device->pmu, false);
>>>         ret =3D nvkm_falcon_get(gr->fecs, subdev);
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--qtWJ8U9lHA8WpPwdtewFhBfIGUEcr3098--

--TWuKIveUdkFlXv2mdVFw5mURFgQOufVw4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAloeMJMACgkQdgucYlCS
kftxjBAAvSp/9ncWfZD0+2Bhl/PgePKgR28h48ezfOvHSAQznsUfDWAO7LoU6tYh
E0ydHcm4Rnl5dkEPVh8fZE/m0qK/7+B8knV5aNLZGr9aMv7nbjz+D/o8TLo2aFlV
zRstqX/yMA/LBN8b+8P4cG9ti6JLziEeZ29rihwpr1E1GGTvcJFxcaDSZQOcrf6s
/glSgNZumD5TvFTDYrxML4UkGip9/NJouoKdng6QEjPwAovMUzNSYR5rpWzeLYJf
bjeRBI+nc4++MVC70zBPBB57LEwH47h8jI1URuaTFK21yi82R9Vss5fpdRCotZgN
k6Gsu9jrn0mauB6b/z/zK7DwdjXANkcO38wq2OQYBbLDB4gCFavlpFSbYp/nmvvj
beX6VsfIlUbmwAtsYFaVwfdR1EiC6TobJTZl8s5LbEPbza5EEEYj0An7pTgdDNr7
I5cL9dc4OUBB9wWRUHFUFdVgYhZ1EKEpH+LXzfTYw4Odmk01HWsyu5PdMNs52QYh
NciiODiAOb1K9Hm91kPU4jK+nHnFf0KhXDztGLwb3Bnr8rqYSFaOr4zXltb+O3ft
k1oP63RG90ysevrFNNiY3KUTs7vHsoMeEDzuC4n95timxp1PBOUz54AO3zQbr3Yg
aJwjSHkpfbWmzZerWf4kLkfGqjSiUtweGXTMdYN5nGgD+cEEsg4=
=JzFQ
-----END PGP SIGNATURE-----

--TWuKIveUdkFlXv2mdVFw5mURFgQOufVw4--

--===============0837427573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0837427573==--

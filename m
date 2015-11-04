From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] disp: activate dual link TMDS links only
 when possible
Date: Wed, 4 Nov 2015 11:10:56 +1000
Message-ID: <56395B20.30705@gmail.com>
References: <1446590484-8670-1-git-send-email-imirkin@alum.mit.edu>
 <56394B31.2050504@gmail.com>
 <CAKb7Uvi1uJt29hW4-VbVCwaTD4cOT5VZ9AbFvUdUYg8NZ957hA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1778506226=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvi1uJt29hW4-VbVCwaTD4cOT5VZ9AbFvUdUYg8NZ957hA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1778506226==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Gk6fqdPuCF0frwSIdelxQheV8iAD1EsnT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Gk6fqdPuCF0frwSIdelxQheV8iAD1EsnT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/04/2015 10:37 AM, Ilia Mirkin wrote:
> On Tue, Nov 3, 2015 at 7:02 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On 11/04/2015 08:41 AM, Ilia Mirkin wrote:
>>> From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>>>
>>> Without this patch a pixel clock rate above 165 MHz on a TMDS link is=

>>> assumed to be dual link. This is true for DVI, but not for HDMI. HDMI=

>>> supports no dual link, but it supports pixel clock rates above 165 MH=
z.
>>> Only activate Dual Link mode when it is actual possible.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
>>> Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
>>> ---
>>>  drm/nouveau/nv50_display.c           | 8 ++++----
>>>  drm/nouveau/nvkm/engine/disp/gf119.c | 2 +-
>>>  drm/nouveau/nvkm/engine/disp/nv50.c  | 2 +-
>>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drm/nouveau/nv50_display.c b/drm/nouveau/nv50_display.c
>>> index c053c50..93bcfdf 100644
>>> --- a/drm/nouveau/nv50_display.c
>>> +++ b/drm/nouveau/nv50_display.c
>>> @@ -1961,10 +1961,10 @@ nv50_sor_mode_set(struct drm_encoder *encoder=
, struct drm_display_mode *umode,
>>>       switch (nv_encoder->dcb->type) {
>>>       case DCB_OUTPUT_TMDS:
>>>               if (nv_encoder->dcb->sorconf.link & 1) {
>>> -                     if (mode->clock < 165000)
>>> -                             proto =3D 0x1;
>>> -                     else
>>> -                             proto =3D 0x5;
>>> +                     proto =3D 0x1;
>>> +                     if (mode->clock >=3D 165000 &&
>>> +                         nv_encoder->dcb->duallink_possible)
>>> +                             proto |=3D 0x4;
>> This is a somewhat flaky condition, given that one could plug a
>> single-link HDMI monitor into a duallink-capable TMDS connector.
>>
>> Still, it's an improvement :)
>=20
> Yeah, FWIW I thought of that (for the second patch too). All this
> stuff is pretty fragile. But... what are you gonna do. Is there some
> other way of telling whether we're on HDMI or DVI?
drm_detect_hdmi_monitor() should do the trick :)

>=20
>>
>>>               } else {
>>>                       proto =3D 0x2;
>>>               }
>>> diff --git a/drm/nouveau/nvkm/engine/disp/gf119.c b/drm/nouveau/nvkm/=
engine/disp/gf119.c
>>> index 186fd3a..8691b68 100644
>>> --- a/drm/nouveau/nvkm/engine/disp/gf119.c
>>> +++ b/drm/nouveau/nvkm/engine/disp/gf119.c
>>> @@ -158,7 +158,7 @@ exec_clkcmp(struct nv50_disp *disp, int head, int=
 id, u32 pclk, u32 *conf)
>>>       switch (outp->info.type) {
>>>       case DCB_OUTPUT_TMDS:
>>>               *conf =3D (ctrl & 0x00000f00) >> 8;
>>> -             if (pclk >=3D 165000)
>>> +             if (pclk >=3D 165000 && outp->info.duallink_possible)
>>>                       *conf |=3D 0x0100;
>> I think it might be more robust to key this off the SOR protocol, rath=
er
>> than duplicating the condition above.
>=20
> You mean disp->sor.lvdsconf? What do I do with that? Or did you have
> something else in mind?
No, not that.  The "proto" field you're setting set "5" in the previous
hunk when dual-link is requested is actually
NV907D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS - which is what is parsed here
with (ctrl & 0x00000f00).

So, instead of "if (pclk >=3D 165000)" here, you should just be able to d=
o
"(*conf =3D=3D 5)".

I have no idea why the BIOS tables identify the dual-link data with
0x0105 instead of 0x0005, when "5" already indicates DUAL_TMDS - but anyw=
ay.

>=20
>>
>>>               break;
>>>       case DCB_OUTPUT_LVDS:
>>> diff --git a/drm/nouveau/nvkm/engine/disp/nv50.c b/drm/nouveau/nvkm/e=
ngine/disp/nv50.c
>>> index 32e73a9..ceecd0e 100644
>>> --- a/drm/nouveau/nvkm/engine/disp/nv50.c
>>> +++ b/drm/nouveau/nvkm/engine/disp/nv50.c
>>> @@ -391,7 +391,7 @@ exec_clkcmp(struct nv50_disp *disp, int head, int=
 id, u32 pclk, u32 *conf)
>>>               switch (outp->info.type) {
>>>               case DCB_OUTPUT_TMDS:
>>>                       *conf =3D (ctrl & 0x00000f00) >> 8;
>>> -                     if (pclk >=3D 165000)
>>> +                     if (pclk >=3D 165000 && outp->info.duallink_pos=
sible)
>>>                               *conf |=3D 0x0100;
>> Same here.
>>
>>>                       break;
>>>               case DCB_OUTPUT_LVDS:
>>>
>>


--Gk6fqdPuCF0frwSIdelxQheV8iAD1EsnT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWOVsgAAoJEHYLnGJQkpH7GiAP/RAHrmLezBZzIStrt24YmTuE
8D0mQS5hid9RP3TUfktzAVmaCMgkvYDevHQXhJDMdfDEtTwhgOrgJvlBdDze8jlN
6eTmT26QiFmPtBpqRF60hsE8+VI1B1eTRxZhPP4p6NLcuFrO07fiuCMEArlt0mRo
IBq9EmQqEbU8i4BgTItQa80TXMkYAgAPVuT38gB/DC6+Q/fQvxHoSDPMc/cxOj5h
PXKudSXKSmVA9tVkoIEWvTNTUqv/pdk8xF84Me7iayo+bNzPOediZU2wZKdq7H6a
u/uo838ag+uPzqpBmeoNCX+ksWD9Qiu68BBMY+veKBhw6PnhtTwbeZYE+a7YSWh8
tKoVBFcTzsD7/C4Jyjg3eJkuHEfXIn3gJVd6yRhy4HoqM5egjfnDcLE0K6m4WZID
0xO7FBLCx8FhKcAjYBxXJuz2V1krFXtt2PKQjueaoCcoHWEKIJuWIdaaNi+AiBZ1
CQIfnhvcmHmf54yB5+hQx7U77CPTGK3MCXB+m+NgnbBCoAtp5bD4Kw2Ps7RbiWO6
fU+U8uEr/1OuNicfKlfqJ+M+1WCyXQNE2uL/TmgWGrX1Q3vhLXmdNPLhA6GWuFar
sZP4ZK69ckLzd0dmsk7C4V+FOZ3CouSal3dZuujhfoOMq3x9vyUeV4uciALvor5A
8a3BhqWGrOxAvezStXsq
=P79C
-----END PGP SIGNATURE-----

--Gk6fqdPuCF0frwSIdelxQheV8iAD1EsnT--

--===============1778506226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1778506226==--

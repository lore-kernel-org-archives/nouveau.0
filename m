From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] bios/fan: hardcode the fan mode to linear
Date: Tue, 5 Jan 2016 18:38:56 +1000
Message-ID: <568B8120.2050500@redhat.com>
References: <1448806218-6029-1-git-send-email-martin.peres@free.fr>
 <5672EE74.6090403@free.fr> <568A880E.1070603@free.fr>
 <CACvgo502iJJzC8qj4CA=+2UucHMhWQ=+X=ZpQ22xkiRS4PzDoQ@mail.gmail.com>
 <568B8042.6020800@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0350462777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <568B8042.6020800-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0350462777==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="eKauN9au20qkmXWWwBoWeWbu5mFWvrNW3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eKauN9au20qkmXWWwBoWeWbu5mFWvrNW3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/05/2016 06:35 PM, Martin Peres wrote:
> On 04/01/16 18:42, Emil Velikov wrote:
>> On 4 January 2016 at 14:56, Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> wrote:=

>>> On 17/12/15 19:18, Martin Peres wrote:
>>>> On 29/11/15 16:10, Martin Peres wrote:
>>>>> This is an oversight that made use of the trip-point-based fan
>>>>> managenent
>>>>> on
>>>>> cards that never expose those. This led the fan to stay at fan_min.=

>>>>>
>>>>> Fortunately, the emergency code would kick when the temperature wou=
ld
>>>>> reach
>>>>> 90=C2=B0C.
>>>>>
>>>>> Reported-by: Tom Englund <tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>> Tested-by: Tom Englund <tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>>
>>>> Tested-by: Daemon32 <lnf.purple-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D92126
>>>>
>>>>> Signed-off-by: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
>>>>> ---
>>>>>    drm/nouveau/nvkm/subdev/bios/fan.c | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drm/nouveau/nvkm/subdev/bios/fan.c
>>>>> b/drm/nouveau/nvkm/subdev/bios/fan.c
>>>>> index 43006db..80fed7e 100644
>>>>> --- a/drm/nouveau/nvkm/subdev/bios/fan.c
>>>>> +++ b/drm/nouveau/nvkm/subdev/bios/fan.c
>>>>> @@ -83,6 +83,7 @@ nvbios_fan_parse(struct nvkm_bios *bios, struct
>>>>> nvbios_therm_fan *fan)
>>>>>                fan->type =3D NVBIOS_THERM_FAN_UNK;
>>>>>            }
>>>>>
>>>>> +        fan->fan_mode =3D NVBIOS_THERM_FAN_LINEAR;
>>>>>            fan->min_duty =3D nvbios_rd08(bios, data + 0x02);
>>>>>            fan->max_duty =3D nvbios_rd08(bios, data + 0x03);
>>>>>
>>>>>
>>>> Ben, can you merge this patch? It is kind of critical :s And it
>>>> should be
>>>> CCed to stable too, without it, some kepler/maxwell get 0% fan power=

>>>> which
>>>> is kind of dangerous, even without reclocking!
>>>
>>> Ping, this is really important :s
>>>
>> Not sure who picked it up, but it seems to be in the latest fixes
>> batch [1].
>>
>> [1]
>> http://lists.freedesktop.org/archives/dri-devel/2015-December/097589.h=
tml
>=20
> Thanks Emil, Karol pointed it out to me on IRC too. Thanks to whoever
> picked it up :)
I did, my apologies for not communicating that better!

Ben.


--eKauN9au20qkmXWWwBoWeWbu5mFWvrNW3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWi4EgAAoJEHYLnGJQkpH7qZQQAINPs0WejII3AsnOoH0QFG5p
UkSu0aE/fV33w38L6rnpAnDd4khx5hIuc/kG0os3YnKDKTfF0XlZDraq+GWOpPoD
Hm6MvZey3MJmTpU68vgHzj8iNuBgqF+YwMyXqY5MW4ZEfJAgs+Fqa/qBw5iX0k9C
BuLcL1CM4F41HmtIidvzyVsECDTK+TjYrHNncCtzNuytzQEqMbso1/VsLP9zPMuS
9DIb35jNqldXVDf3UOx5sk+ipu81vWIspPfmhTHe/3aKfdvUuHetaZ55qdzFOa3b
i8B4CXXOv4bpAn0GueRkUGuTxYUeTlhde5sGFPSWYV5ulF2fyb5gXQdMhv7FzKMC
orP/x2ZhawdqilzZi6/nAcFT+inwb438Og3UQNUPSPm3hJF1M7OcD484B9g+GAgI
Oi5wzYQiE5hLf4cn+z1IAyepSWV6+jnp3AoU3dju1IZlh1loGhAxEBVeqRlQmPYT
iYZucF+OHiyIurjA/lAg0DZzQ9/U7ZaqCdMPdDTxCaJJElJl/obf7d3wLxoK3ggo
Fp1/eBoI47DUAItka9tkE82uyHSY/ce4nYWCoHeZZUi/84qx6jBfsgwWfriWOxZo
pmV5ZvJHA38on0W/kZ4pejA4mSmRQaxwBZ+35a/QxtZNP841an6W/jU5CmUgiPmv
XWZxj2p6ox1wJGNFhIN5
=uYea
-----END PGP SIGNATURE-----

--eKauN9au20qkmXWWwBoWeWbu5mFWvrNW3--

--===============0350462777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0350462777==--

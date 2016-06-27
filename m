From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [xf86-video-nouveau] Properly cleanup fb for
 reverse-prime-offload
Date: Tue, 28 Jun 2016 08:43:21 +1000
Message-ID: <96423029-2bf8-57cd-02ec-cd06165f4e2f@gmail.com>
References: <1464957970-19906-1-git-send-email-hdegoede@redhat.com>
 <5a47b449-4b55-8543-a66a-efa791c56da8@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0525392757=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5a47b449-4b55-8543-a66a-efa791c56da8-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0525392757==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6OM7SUj4NXLEkDvcJT5wWI3Jjh3b9PxOx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6OM7SUj4NXLEkDvcJT5wWI3Jjh3b9PxOx
Content-Type: multipart/mixed; boundary="089xDx2I1oNInwVT0NuvObPjb9lRUar3c"
From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Message-ID: <96423029-2bf8-57cd-02ec-cd06165f4e2f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [xf86-video-nouveau] Properly cleanup fb for
 reverse-prime-offload
References: <1464957970-19906-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
 <5a47b449-4b55-8543-a66a-efa791c56da8-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <5a47b449-4b55-8543-a66a-efa791c56da8-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

--089xDx2I1oNInwVT0NuvObPjb9lRUar3c
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 06/27/2016 04:24 PM, Hans de Goede wrote:
> Hi Ilia, Ben, et al.
>=20
> Can I please get a review of this patch, and assuming the review is
> favorable,
> can someone please push this ?
>=20
> Regards,
>=20
> Hans
>=20
>=20
> p.s.
>=20
> Is it ok if I request push rights to the nouveau repos / group
> at freedesktop.org ?
Hey Hans,

Patch looks good to me, and I've pushed it.  And yeah, go ahead and
request that!

Ben.

>=20
>=20
> On 03-06-16 14:46, Hans De Goede wrote:
>> drmmode_set_scanout_pixmap(pix) adds drmmod->fb_id through a call
>> to drmmode_xf86crtc_resize(), but on a subsequent
>> drmmode_set_scanout_pixmap(NULL) it would not remove the fb.
>>
>> This keeps the crtc marked as busy, which causes the dgpu to not
>> being able to runtime suspend, after an output attached to the dgpu
>> has been used once. Which causes burning through an additional 10W
>> of power and the laptop to run quite hot.
>>
>> This commit adds the missing remove fb call, allowing the dgpu to runt=
ime
>> suspend after an external monitor has been plugged into the laptop.
>>
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>  src/drmmode_display.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/src/drmmode_display.c b/src/drmmode_display.c
>> index b950f42..f326e46 100644
>> --- a/src/drmmode_display.c
>> +++ b/src/drmmode_display.c
>> @@ -680,10 +680,16 @@ drmmode_set_scanout_pixmap(xf86CrtcPtr crtc,
>> PixmapPtr ppix)
>>      PixmapPtr screenpix =3D screen->GetScreenPixmap(screen);
>>      xf86CrtcConfigPtr xf86_config =3D XF86_CRTC_CONFIG_PTR(crtc->scrn=
);
>>      drmmode_crtc_private_ptr drmmode_crtc =3D crtc->driver_private;
>> +    drmmode_ptr drmmode =3D drmmode_crtc->drmmode;
>>      int c, total_width =3D 0, max_height =3D 0, this_x =3D 0;
>>      if (!ppix) {
>> -        if (crtc->randr_crtc->scanout_pixmap)
>> +        if (crtc->randr_crtc->scanout_pixmap) {
>>              PixmapStopDirtyTracking(crtc->randr_crtc->scanout_pixmap,=

>> screenpix);
>> +            if (drmmode && drmmode->fb_id) {
>> +                drmModeRmFB(drmmode->fd, drmmode->fb_id);
>> +                drmmode->fb_id =3D 0;
>> +            }
>> +        }
>>          drmmode_crtc->scanout_pixmap_x =3D 0;
>>          return TRUE;
>>      }
>>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--089xDx2I1oNInwVT0NuvObPjb9lRUar3c--

--6OM7SUj4NXLEkDvcJT5wWI3Jjh3b9PxOx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXcawJAAoJEHYLnGJQkpH7XtEQAMTYfmnfmmoPe8rg0yH5VFLD
W4BSMcYJVmydqFEto8rtCPnSZ+7Agv5e+qO98yVgR67OnHbbNlpP8Sz5k2HmlhCx
Zh8KfJos+AKxZGxvJuCcEfAPdXn7eOsEvl8lz6SiiTrZfKNLIDLtzdqRf1nOtJ0k
raxDGsxOc3baLElACsnP7+eUoXZo5IIsyVwDlh4sA+Y+xSJKD8KBYxbDvK9kgXRF
z6ZxvYCcIaU9UmPmf0wqyS3D4fRoPEv0FQKVClt3bxpu+9etUJ2LThEkO0Xz+AY5
pNY4iw6X8noPFt//GD6pMupiT4tXKwx5m0bGvjNLlSFIItil+0Nb++bBCINO+5XC
CIb5jHPmDNPRxUEHH/3XE4KYfuhrFKL44lRqEGTRYfPdWRIE32nQgmj8zUC8RKtA
/FFd61inD0y+IqJjDAZmKCit6Na6L+Uc9wZLkdJro5nPKwWiRUpd5eHAyYbBduUZ
8FOlA4TV99eV8mC/OplRMk4P8BqjUbwtw8wMGvLlF/lbGPMQRdqmK1F0GYMXPO6A
TCw+BlxJUJecyeYm5IBn7L4i6s268f0Z26TgVGmic3RrxoyFfREJnUYjt7Bp7sDM
pJpGVMK19oP3siwMCSgJp4hMpqk3/REsI/GmuHEsslAy1lDKX4waJgdQDrl+nUxG
eKEywt3wnR10iywZ+y7T
=zZJk
-----END PGP SIGNATURE-----

--6OM7SUj4NXLEkDvcJT5wWI3Jjh3b9PxOx--

--===============0525392757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0525392757==--

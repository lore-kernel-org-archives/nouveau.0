From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gr: fallback to legacy paths during firmware
 lookup
Date: Fri, 4 Nov 2016 08:29:23 +1000
Message-ID: <cc55514d-56aa-6fdf-3f39-92884d4064b9@redhat.com>
References: <20161102045417.5886-1-acourbot@nvidia.com>
 <CAKb7UvhfHs=FJ+3FzkwMgmQfi+uMBvg0kSQ10FpTurRmfDX-cQ@mail.gmail.com>
 <a54062b0-afad-51e8-4d18-9fc84b8e48d8@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2119396594=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a54062b0-afad-51e8-4d18-9fc84b8e48d8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2119396594==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bHEIbktXk9QK9ntNKKngE3mEQVU3ect45"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bHEIbktXk9QK9ntNKKngE3mEQVU3ect45
Content-Type: multipart/mixed; boundary="5omLVs40hsutT4Bo7IrTHftDSs4p9brgr"
From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>,
 Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <cc55514d-56aa-6fdf-3f39-92884d4064b9-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] gr: fallback to legacy paths during firmware
 lookup
References: <20161102045417.5886-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
 <CAKb7UvhfHs=FJ+3FzkwMgmQfi+uMBvg0kSQ10FpTurRmfDX-cQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <a54062b0-afad-51e8-4d18-9fc84b8e48d8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
In-Reply-To: <a54062b0-afad-51e8-4d18-9fc84b8e48d8-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--5omLVs40hsutT4Bo7IrTHftDSs4p9brgr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/02/2016 03:52 PM, Alexandre Courbot wrote:
> On 11/02/2016 02:07 PM, Ilia Mirkin wrote:
>> On Wed, Nov 2, 2016 at 12:54 AM, Alexandre Courbot <acourbot-DDmLM1+adcphl2p70BpVqQ@public.gmane.org=
m> wrote:
>>> Look for firmware files using the legacy ("nouveau/nvxx_fucxxxx") pat=
h
>>> if they cannot be found in the new, "official" path. User setups were=

>>> broken by the switch, which is bad.
>>>
>>> There are only 4 firmware files we may want to look up that way, so
>>> hardcode them into the lookup function. All new firmware files should=

>>> use the standard "nvidia/<chip>/gr/" path.
>>>
>>> Fixes: 8539b37acef7 ("drm/nouveau/gr: use NVIDIA-provided external fi=
rmwares")
>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drm/nouveau/nvkm/engine/gr/gf100.c | 56 ++++++++++++++++++++++++++++=
++++++----
>>>  1 file changed, 51 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/en=
gine/gr/gf100.c
>>> index 157919c788e6..9e65adbab21c 100644
>>> --- a/drm/nouveau/nvkm/engine/gr/gf100.c
>>> +++ b/drm/nouveau/nvkm/engine/gr/gf100.c
>>> @@ -1756,24 +1756,70 @@ gf100_gr_ =3D {
>>>  };
>>>
>>>  int
>>> +gf100_gr_ctor_fw_legacy(struct gf100_gr *gr, const char *fwname,
>>> +                       struct gf100_gr_fuc *fuc)
>>> +{
>>> +       struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
>>> +       struct nvkm_device *device =3D subdev->device;
>>> +       const struct firmware *fw;
>>> +       char f[32];
>>> +       int ret;
>>> +
>>> +       snprintf(f, sizeof(f), "nouveau/nv%02x_%s", device->chipset, =
fwname);
>>> +       ret =3D request_firmware(&fw, f, device->dev);
>>> +       if (ret) {
>>> +               snprintf(f, sizeof(f), "nouveau/%s", fwname);
>>> +               ret =3D request_firmware(&fw, f, device->dev);
>>> +               if (ret) {
>>> +                       nvkm_error(subdev, "failed to load %s\n", fwn=
ame);
>>> +                       return ret;
>>> +               }
>>> +       }
>>> +
>>> +       fuc->size =3D fw->size;
>>> +       fuc->data =3D kmemdup(fw->data, fuc->size, GFP_KERNEL);
>>> +       release_firmware(fw);
>>> +       return (fuc->data !=3D NULL) ? 0 : -ENOMEM;
>>> +}
>>> +
>>> +int
>>>  gf100_gr_ctor_fw(struct gf100_gr *gr, const char *fwname,
>>>                  struct gf100_gr_fuc *fuc)
>>>  {
>>>         struct nvkm_subdev *subdev =3D &gr->base.engine.subdev;
>>>         struct nvkm_device *device =3D subdev->device;
>>> +       const char *legacy_fwname =3D NULL;
>>>         const struct firmware *fw;
>>>         int ret;
>>>
>>>         ret =3D nvkm_firmware_get(device, fwname, &fw);
>>> -       if (ret) {
>>> +       /* firmware found, success! */
>>> +       if (!ret) {
>>> +               fuc->size =3D fw->size;
>>> +               fuc->data =3D kmemdup(fw->data, fuc->size, GFP_KERNEL=
);
>>> +               nvkm_firmware_put(fw);
>>> +               return (fuc->data !=3D NULL) ? 0 : -ENOMEM;
>>> +       }
>>> +
>>> +       /* see if this firmware has a legacy path */
>>> +       if (!strcmp(fwname, "fecs_inst"))
>>> +               legacy_fwname =3D "fuc409c";
>>> +       else if (!strcmp(fwname, "fecs_data"))
>>> +               legacy_fwname =3D "fuc409d";
>>> +       else if (!strcmp(fwname, "gpccs_inst"))
>>> +               legacy_fwname =3D "fuc41ac";
>>> +       else if (!strcmp(fwname, "gpccs_data"))
>>> +               legacy_fwname =3D "fuc41ad";
>>
>> As I mentioned on IRC, I find this strcmp thing a little jarring. It
>> should be pretty easy to just pass the legacy fwname into
>> gf100_gr_ctor_fw directly - there are only a handful of callers, and
>> most would just pass NULL in as the legacy fwname - only the ones in
>> gf100.c would pass the "old" names in.
>=20
> Yeah, that was the original approach actually. I switched to this for
> the following reasons:
>=20
> - We don't want to encourage using this legacy path, hence hiding it
> from callers
> - There are only 4 possible legacy files - it's ugly but still
> manageable and contained in a single function
I agree.

>=20
> Of course, if the general consensus is that this is too ugly, it would
> be trivial to turn it the way you suggested, so I don't feel too
> strongly for one approach over the other.
As it is a legacy path, I'm more for hiding it away in ctor_legacy() as
Emil suggests.

Ben.



--5omLVs40hsutT4Bo7IrTHftDSs4p9brgr--

--bHEIbktXk9QK9ntNKKngE3mEQVU3ect45
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYG7pDAAoJEHYLnGJQkpH7hakP/iiLqMWCEodGeovi61YzWDgO
oKDE6Rj8s1YJSNzpDhP9aLf56ho6pIrs53J+6pCkRDeKzgJc40cbJhmPnc64+Ih+
T9z037IScoHh9ZQE1BSepAhFL9oWxY7DUHPEQQI1FHDSRcvfXmF3JlVOdFdVB+oQ
ItboEotUHY5QI33n8TJatfKO3jGnpHZ9oEvlfUJM6tKDRzqfKRK0O65nUReu6kQ8
Zlk60KZqgiNjfCC0Eg+RevGAgp7johanJRyKQxLgWeJT4zH/NKDS2xWTtFdpOjGZ
/ToCTduTacCu43D5Hw5kG74s9in6lLARufytrW4YvHpjBtOYn9nlUVQmtpRMwHU6
347kdxSAr3J+gFIW/QSRW2lNAeEs+EstMib6wTN1LU60NeaPomXoeCHj2vP1kYfo
MfOLHktNinvtatkxcJI8hp+6DOmHPgnBRD1MmSYqj0qHIh+kteOVjdEqs5EHdoMQ
Owq3mxcBgKjiEvpd4nAIHFoydSjKFfZ8/fvYIPIFcYI4SOfTmJLN25SdcA9mAC/9
TBEAxtZ1cMAphnOE49idh6oqEPtyxlpFWduzyrNDUOoM5aBvYNT5bjFKlNqZBrE9
D1siTDBFH237fj11owoOolrpiwBNihEPiaUykckCmeWiOB4OCldpO5ylPZ06kW2O
v77jVPVOzI1R5x2Rcsai
=XrIx
-----END PGP SIGNATURE-----

--bHEIbktXk9QK9ntNKKngE3mEQVU3ect45--

--===============2119396594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2119396594==--

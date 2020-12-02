From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Date: Wed, 2 Dec 2020 09:01:09 +0100
Message-ID: <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0638913211=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Zack Rusin <zackr-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0638913211==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS
Content-Type: multipart/mixed; boundary="eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Zack Rusin <zackr-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org"
 <daniel-/w4YWyX8dFk@public.gmane.org>,
 "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>,
 "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org"
 <virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>,
 "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <e8102216-edd0-bec3-79af-3925e9668e95-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
References: <20201124113824.19994-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20201124113824.19994-15-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
In-Reply-To: <31E75B1A-AAC0-49E3-985E-2DF5B59CD883-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>

--eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 21:59 schrieb Zack Rusin:
>=20
>=20
>> On Nov 24, 2020, at 06:38, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org> wro=
te:
>>
>> Using struct drm_device.pdev is deprecated. Convert vmwgfx to struct
>> drm_device.dev. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> Cc: Roland Scheidegger <sroland-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
>> ---
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  8 ++++----
>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c    | 27 +++++++++++++-------------=

>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c     |  2 +-
>=20
> Reviewed-by: Zack Rusin <zackr-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>

Could you add this patch to the vmwgfx tree?

Best regards
Thomas

>=20
> z
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--eaFRfE55w1MRvdfAsCcfX1mxELLfMlYIe--

--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/HScUFAwAAAAAACgkQlh/E3EQov+A5
lQ/9EOKsA/oUbEGXGt6r0+ZOkVeDk90o3oIDiENMmRAuYbufsmkmqtcqjg8sxmvFdNZc8K1e18JZ
ImyhLHXHNQIOYlvi362TSMxM8G33UGBWo3se5Vhjy0vN+FrmpoWO3Pd2ctIKd3aux2dg5Tmj1wrG
U/dGG1VT+qMZKLUOkXRLXTP+1y7va8aRzEtGQc0pTFdBoDrb/IMsVl+MFaV+SJ5a9Ar95uL0x6vy
4052WSeyA+TDYncD8PeZHDEGotC5y/f8n9elTc+aBXGSCbNfhV5tad23yrM9MPTIs09BMJrGwRoo
8QOsFTfr5XWn5O4ex5UKfHulTRnKcC4aCactTA2G1GKw9A3rai8E6hTV+1BVcHg4Acae1SDNRpIb
USRpiiT89u08+tsbd0919ij3QwgTMzTgI9qdGfMELeNCHQ741LJGaPImJbSVKemITFRI4iKCag+Q
32lfaU2+T+gXIJW98OX/YjTLt1f2cWjEdKwaLG9cDXJG0YB0ezcML6lotmt+WOIvBO+RQQdJaGtj
gAIlRjBvToOGAhqbO0LEiN20VPRCP7mUOeyHcbETIxzmifa8wpWPukXmza6wYFu9P/KIaf1QYxJw
2ZBDHDxXhu155sbPPgL2KH+rK4+H93TwSWVJ2qGWsFNY+oCEaquEYIvOE+h1D8HWxoJXffHhu9GA
w9A=
=XbA6
-----END PGP SIGNATURE-----

--Am4FOUXZOcqPgHq39fhKGA0YvYMWrkUHS--

--===============0638913211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0638913211==--

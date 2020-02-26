From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
Date: Wed, 26 Feb 2020 06:28:15 +0100
Message-ID: <d64d2de7-8c0d-ca32-e9a3-706b98019c46@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0472917992=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "alexander.deucher-5C7GfCeVMHo@public.gmane.org" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, "sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org" <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, "emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org" <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0472917992==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl
Content-Type: multipart/mixed; boundary="CDRuovX7jI9aChelSbkaae7Qnej5MM0rK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>,
 "mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>,
 "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>,
 "bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>,
 "emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org" <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>,
 "alexander.deucher-5C7GfCeVMHo@public.gmane.org" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>,
 "sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org" <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>,
 "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Message-ID: <d64d2de7-8c0d-ca32-e9a3-706b98019c46-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
References: <20200225155902.9751-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200225155902.9751-2-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CACvgo52fCMEiohuOkXyZi_mVrFnhMmmB--W64AvhEgVe3i2T5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--CDRuovX7jI9aChelSbkaae7Qnej5MM0rK
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Emil

Am 25.02.20 um 18:37 schrieb Emil Velikov:
> Hi Thomas,
>=20
> On Tuesday, 25 February 2020, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org
> <mailto:tzimmermann-l3A5Bk7waGM@public.gmane.org>> wrote:
>=20
>     Non-KMS drivers store state in struct drm_driver. This bloats the
>     structure for KMS drivers and prevents it from being declared with
>     'static const' qualifiers. Moving the non-KMS state into a separate=

>     data structure resolves this.
>=20
>=20
> Have you considered subclassing the const drm_driver for legacy drivers=
=2E
> This way the legacy (pointer) data does not need to be exposed to
> non-legacy drivers.

I didn't want to do an upcast each time the legacy data is required. I
know that subclassing is closer to the style of current DRM, but given
the current code base, the additional legacy pointer seemed like the
lesser evil.

Best regards
Thomas

>=20
> Not to mention that const data (drm_driver), which has (const) pointer
> to mutable data (legacy bits) is a trap IMHO
>=20
> Emil

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--CDRuovX7jI9aChelSbkaae7Qnej5MM0rK--

--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5WAfMACgkQaA3BHVML
eiPooggAnxmtcTkZSlg/VKh8bBT+rcT3+1L9bVvmSY71wBKeFJATIQWIFiceXENW
3qjpSIl9NI7A4L2j7oO7pdbQCI0onxzGYdPl3ua59ys28zoUCJ+W0pnrJgD6Zxdl
euXiOJR7g8PdvpMMtaVPe0zCQhGFMN4+Z8HT+EmuxMdoz0JT4aaqpA2/8nHXNEYl
d+0QFHqNPA9rp1+sdVe+mrR148adaC+0bqHs3k8L9CxMacERjyj0ozHj0EhHrSbU
6rV5Pp/x9HxBdMKhA1BQlOy8G0PCbsETNsoFPVJ18IM1H+UlcXVDVZq1mpvLM6sm
GyHYmIK55k/Dk6OlamduDiGXci1stw==
=E9s1
-----END PGP SIGNATURE-----

--Hx0UVgGfo7vakdBHIVTMh3shlfJiKBprl--

--===============0472917992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0472917992==--

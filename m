From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add separate non-KMS state;
 constify struct drm_driver
Date: Wed, 26 Feb 2020 06:39:08 +0100
Message-ID: <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225174400.GP2363188@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0787541944=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200225174400.GP2363188-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0787541944==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3
Content-Type: multipart/mixed; boundary="uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org,
 bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org,
 sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <f042cfae-8f74-0bd5-bd5f-dfb962c0c3b4-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 0/3] Add separate non-KMS state; constify struct
 drm_driver
References: <20200225155902.9751-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200225174400.GP2363188-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
In-Reply-To: <20200225174400.GP2363188-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>

--uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.20 um 18:44 schrieb Daniel Vetter:
> On Tue, Feb 25, 2020 at 04:58:59PM +0100, Thomas Zimmermann wrote:
>> This patchset moves legacy, non-KMS driver state from struct drm_drive=
r
>> into struct drm_legacy_state. Only non-KMS drivers provide an instance=

>> of the latter structure. One special case is nouveau, which supports
>> legacy interfaces. It also provides an instance of the legacy state if=

>> the legacy interfaces have been enabled (i.e., defines the config opti=
on
>> CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>>
>> I reviewed all call sites of legacy state and functions to verify that=

>> DRIVER_LEGACY or DRIVER_KMS_LEGACY_CONTEXT is set on the device; or th=
at
>> DRIVER_MODESET is not set.
>>
>> With the mutable KMS state removed, instances of struct drm_driver can=

>> be declared as constant. The patchset modifies the DRM core accordingl=
y.
>> Individual drivers can follow later on.
>=20
> Bikeshed: We very much have modern non-KMS drivers (vgem, etnaviv, v3d,=

> panfrost, ...). non-KMS !=3D legacy, which is what you're talking about=

> here.

OK, probably needs to be more precise.

>=20
> Other thing, and it's a bit raining on your parade: I don't see the poi=
nt.
> Sprinkling a few more #ifdef CONFIG_DRM_LEGACY over the relevant parts
> sounds like a reasonable idea. But this is a lot of churn for drivers
> which are all pretty much dead, and just waiting for their eventual
> removal. And from a compile-testing pov of making sure modern drivers
> don't use any of the deprecated stuff wrapping it in CONFIG_DRM_LEGACY
> should be plenty enough.

It's not about these old drivers, it's about having constant driver
structures and maybe saving a few bytes in the modern drivers. If these
old drivers hold back improvements to the drivers we care about, I don't
see we they are not to be touched.

This cannot be solved with CONFIG_DRM_LEGACY, unless you want to wrap
any reference in core code to legacy data. I tried at first and it
turned out to be an unreadable mess.

And from a complexity POV the patchset is trivial. It adds a data
structure to each old driver and moves a few initializers around. The
worst thing that can happen is that code tried to dereference the legacy
pointer when it's not set. This bug will happen with modern drivers, so
we should see it easily.

Best regards
Thomas

>=20
> And from a "make stuff const" I think Laurent's much more minimal serie=
s
> also gets us there for all the drivers we care about.
> -Daniel
>=20
>>
>> Thomas Zimmermann (3):
>>   drm: Add separate state structure for legacy, non-KMS drivers
>>   drm: Move non-kms driver state into struct drm_legacy_state
>>   drm: Constify struct drm_driver in DRM core
>>
>>  drivers/gpu/drm/drm_bufs.c            | 10 +++++-----
>>  drivers/gpu/drm/drm_context.c         |  9 +++++----
>>  drivers/gpu/drm/drm_drv.c             | 12 ++++++++----
>>  drivers/gpu/drm/drm_file.c            |  4 ++--
>>  drivers/gpu/drm/drm_legacy_misc.c     |  6 +++---
>>  drivers/gpu/drm/drm_lock.c            |  7 ++++---
>>  drivers/gpu/drm/drm_pci.c             | 16 ++++++++++------
>>  drivers/gpu/drm/drm_vblank.c          | 11 ++++++-----
>>  drivers/gpu/drm/i810/i810_drv.c       | 10 +++++++---
>>  drivers/gpu/drm/mga/mga_drv.c         | 16 ++++++++++------
>>  drivers/gpu/drm/nouveau/nouveau_drm.c |  8 ++++++++
>>  drivers/gpu/drm/r128/r128_drv.c       | 16 ++++++++++------
>>  drivers/gpu/drm/savage/savage_drv.c   | 12 ++++++++----
>>  drivers/gpu/drm/sis/sis_drv.c         |  8 ++++++--
>>  drivers/gpu/drm/tdfx/tdfx_drv.c       |  6 +++++-
>>  drivers/gpu/drm/via/via_drv.c         | 16 ++++++++++------
>>  include/drm/drm_device.h              |  2 +-
>>  include/drm/drm_drv.h                 | 21 +++++----------------
>>  include/drm/drm_legacy.h              | 27 +++++++++++++++++++++++---=
-
>>  include/drm/drm_pci.h                 |  4 ++--
>>  20 files changed, 138 insertions(+), 83 deletions(-)
>>
>> --
>> 2.25.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--uwINkE9aUz1Amsuxs93ui3Lma6VXhBB9g--

--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5WBHwACgkQaA3BHVML
eiPDxAf/eiIvploVeGdiACfKJPm6kAk2t4I2o1E9q91jJ4r9T4+p9VNpxZ4cjM3x
px7LWVyba99XA+oddmzCkOUyMA4hAEsKxGqV1lfnS3XAb6AX0ztSLPGGGAnIuoIm
i0+AlrFj1XFaEIhyfORVaLpO3SLmTZ7GOOxsZVZSeDcECkMXMaCAKsRfinCOYwTn
oB8/9prIoqMB/E3DNxMl4RWqB+8B/g1Uv+sHnmEQ0jD9Z+HMJaEbefzTWvkQ0V1R
Hjknl7bAytXDeaRTuNaBK3sNh0e0QrE1XbENWANQqV8A1efm1H4GXCrBT4Wol9rV
pz6X5w8dvSFEW2mmCb42Cqv43B7FYg==
=P47h
-----END PGP SIGNATURE-----

--nPqAdVrr1M7PHyIBAqpGtdjaVMw8fR6f3--

--===============0787541944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0787541944==--

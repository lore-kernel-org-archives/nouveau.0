From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
Date: Tue, 25 Feb 2020 17:21:51 +0100
Message-ID: <34074e40-a387-d4b7-a158-22c3f9160019@suse.de>
References: <20200225155902.9751-1-tzimmermann@suse.de>
 <20200225155902.9751-2-tzimmermann@suse.de>
 <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1620435833=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1620435833==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QMVIA3zE0V882w7y34I10uDDzcME7UlfX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QMVIA3zE0V882w7y34I10uDDzcME7UlfX
Content-Type: multipart/mixed; boundary="5V10SwBId8ThybYn3z7mowAnlFkOIfUkR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>,
 dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs
 <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>,
 Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Emil Velikov <emil.velikov-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Message-ID: <34074e40-a387-d4b7-a158-22c3f9160019-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 1/3] drm: Add separate state structure for
 legacy, non-KMS drivers
References: <20200225155902.9751-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20200225155902.9751-2-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAKb7UviDs+rqF+vtDnV4CbHmY8PW8_-ahpAExctORYPKKyL7Yw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--5V10SwBId8ThybYn3z7mowAnlFkOIfUkR
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.20 um 17:06 schrieb Ilia Mirkin:
> On Tue, Feb 25, 2020 at 10:59 AM Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org=
> wrote:
>>
>> Non-KMS drivers store state in struct drm_driver. This bloats the
>> structure for KMS drivers and prevents it from being declared with
>> 'static const' qualifiers. Moving the non-KMS state into a separate
>> data structure resolves this.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> ---
>>  drivers/gpu/drm/drm_drv.c             | 4 ++++
>>  drivers/gpu/drm/i810/i810_drv.c       | 4 ++++
>>  drivers/gpu/drm/mga/mga_drv.c         | 4 ++++
>>  drivers/gpu/drm/nouveau/nouveau_drm.c | 8 ++++++++
>>  drivers/gpu/drm/r128/r128_drv.c       | 4 ++++
>>  drivers/gpu/drm/savage/savage_drv.c   | 4 ++++
>>  drivers/gpu/drm/sis/sis_drv.c         | 4 ++++
>>  drivers/gpu/drm/tdfx/tdfx_drv.c       | 4 ++++
>>  drivers/gpu/drm/via/via_drv.c         | 4 ++++
>>  include/drm/drm_drv.h                 | 3 +++
>>  include/drm/drm_legacy.h              | 6 ++++++
>>  11 files changed, 49 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 7b1a628d1f6e..4ba0df097602 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -625,6 +625,10 @@ int drm_dev_init(struct drm_device *dev,
>>         if (WARN_ON(!parent))
>>                 return -EINVAL;
>>
>> +       if (drm_core_check_feature(dev, DRIVER_LEGACY) &&
>> +           WARN_ON(!driver->legacy))
>> +               return -EINVAL;
>> +
>>         kref_init(&dev->ref);
>>         dev->dev =3D get_device(parent);
>>         dev->driver =3D driver;
>> diff --git a/drivers/gpu/drm/i810/i810_drv.c b/drivers/gpu/drm/i810/i8=
10_drv.c
>> index 0e53a066d4db..55f17f00bae9 100644
>> --- a/drivers/gpu/drm/i810/i810_drv.c
>> +++ b/drivers/gpu/drm/i810/i810_drv.c
>> @@ -56,6 +56,9 @@ static const struct file_operations i810_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D i810_legacy_state {
>=20
> Does this compile? I might have assumed this would need to be

I compiled an tested this patchset. But apparently I sent an old patch
or something went wrong somewhere.  Thanks for pointing this out. I'll
resend a fixed version.

Best regards
Thomas

>=20
> static struct drm_legacy_state i810_legacy_state =3D {
>=20
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER=
_LEGACY,
>>         .dev_priv_size =3D sizeof(drm_i810_buf_priv_t),
>> @@ -71,6 +74,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &i810_legacy_state,
>>  };
>>
>>  static struct pci_driver i810_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/mga/mga_drv.c b/drivers/gpu/drm/mga/mga_d=
rv.c
>> index 71128e6f6ae9..4865982d949c 100644
>> --- a/drivers/gpu/drm/mga/mga_drv.c
>> +++ b/drivers/gpu/drm/mga/mga_drv.c
>> @@ -53,6 +53,9 @@ static const struct file_operations mga_driver_fops =
=3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D mga_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_LEGACY |
>> @@ -78,6 +81,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &mga_legacy_state,
>>  };
>>
>>  static struct pci_driver mga_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/n=
ouveau/nouveau_drm.c
>> index 6b1629c14dd7..c88cf32e521c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -1103,6 +1103,11 @@ nouveau_driver_fops =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>> +static struct drm_legacy_state nouveau_legacy_state{
>> +};
>> +#endif
>> +
>>  static struct drm_driver
>>  driver_stub =3D {
>>         .driver_features =3D
>> @@ -1150,6 +1155,9 @@ driver_stub =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +#if defined(CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT)
>> +       .legacy =3D &nouveau_legacy_state,
>> +#endif
>>  };
>>
>>  static struct pci_device_id
>> diff --git a/drivers/gpu/drm/r128/r128_drv.c b/drivers/gpu/drm/r128/r1=
28_drv.c
>> index b7a5f162ebae..ecece3a48d93 100644
>> --- a/drivers/gpu/drm/r128/r128_drv.c
>> +++ b/drivers/gpu/drm/r128/r128_drv.c
>> @@ -57,6 +57,9 @@ static const struct file_operations r128_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D r128_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_PCI_DMA | DRIVER_SG | DRIVER_LEGAC=
Y |
>> @@ -81,6 +84,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &r128_legacy_state,
>>  };
>>
>>  int r128_driver_load(struct drm_device *dev, unsigned long flags)
>> diff --git a/drivers/gpu/drm/savage/savage_drv.c b/drivers/gpu/drm/sav=
age/savage_drv.c
>> index 799bd11adb9c..c0a7146fbde1 100644
>> --- a/drivers/gpu/drm/savage/savage_drv.c
>> +++ b/drivers/gpu/drm/savage/savage_drv.c
>> @@ -47,6 +47,9 @@ static const struct file_operations savage_driver_fo=
ps =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D savage_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_HAVE_DMA | DRIVER_PCI_DMA | DRIVER=
_LEGACY,
>> @@ -65,6 +68,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &savage_legacy_state,
>>  };
>>
>>  static struct pci_driver savage_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_d=
rv.c
>> index 2c54b33abb54..1c794a82c8e6 100644
>> --- a/drivers/gpu/drm/sis/sis_drv.c
>> +++ b/drivers/gpu/drm/sis/sis_drv.c
>> @@ -99,6 +99,9 @@ static void sis_driver_postclose(struct drm_device *=
dev, struct drm_file *file)
>>         kfree(file_priv);
>>  }
>>
>> +static struct drm_legacy_state =3D sis_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_USE_AGP | DRIVER_LEGACY,
>>         .load =3D sis_driver_load,
>> @@ -116,6 +119,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &sis_legacy_state,
>>  };
>>
>>  static struct pci_driver sis_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/tdfx/tdfx_drv.c b/drivers/gpu/drm/tdfx/td=
fx_drv.c
>> index ab699bf0ac5c..17aa93d82d6b 100644
>> --- a/drivers/gpu/drm/tdfx/tdfx_drv.c
>> +++ b/drivers/gpu/drm/tdfx/tdfx_drv.c
>> @@ -56,6 +56,9 @@ static const struct file_operations tdfx_driver_fops=
 =3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D tdfx_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D DRIVER_LEGACY,
>>         .fops =3D &tdfx_driver_fops,
>> @@ -65,6 +68,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &tdfx_legacy_state,
>>  };
>>
>>  static struct pci_driver tdfx_pci_driver =3D {
>> diff --git a/drivers/gpu/drm/via/via_drv.c b/drivers/gpu/drm/via/via_d=
rv.c
>> index 5da38082821f..22113d93ecdd 100644
>> --- a/drivers/gpu/drm/via/via_drv.c
>> +++ b/drivers/gpu/drm/via/via_drv.c
>> @@ -71,6 +71,9 @@ static const struct file_operations via_driver_fops =
=3D {
>>         .llseek =3D noop_llseek,
>>  };
>>
>> +static struct drm_legacy_state =3D via_legacy_state {
>> +};
>> +
>>  static struct drm_driver driver =3D {
>>         .driver_features =3D
>>             DRIVER_USE_AGP | DRIVER_HAVE_IRQ | DRIVER_LEGACY,
>> @@ -97,6 +100,7 @@ static struct drm_driver driver =3D {
>>         .major =3D DRIVER_MAJOR,
>>         .minor =3D DRIVER_MINOR,
>>         .patchlevel =3D DRIVER_PATCHLEVEL,
>> +       .legacy =3D &via_legacy_state,
>>  };
>>
>>  static struct pci_driver via_pci_driver =3D {
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 97109df5beac..94078af0cc28 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -40,6 +40,7 @@ struct dma_buf_attachment;
>>  struct drm_display_mode;
>>  struct drm_mode_create_dumb;
>>  struct drm_printer;
>> +struct drm_legacy_state;
>>
>>  /**
>>   * enum drm_driver_feature - feature flags
>> @@ -599,6 +600,8 @@ struct drm_driver {
>>         const struct file_operations *fops;
>>
>>         /* Everything below here is for legacy driver, never use! */
>> +       struct drm_legacy_state *legacy;
>> +
>>         /* private: */
>>
>>         /* List of devices hanging off this driver with stealth attach=
=2E */
>> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
>> index dcef3598f49e..c98a29e1c2b3 100644
>> --- a/include/drm/drm_legacy.h
>> +++ b/include/drm/drm_legacy.h
>> @@ -49,6 +49,12 @@ struct pci_driver;
>>   * you're doing it terribly wrong.
>>   */
>>
>> +/**
>> + * State for non-KMS drivers.
>> + */
>> +struct drm_legacy_state {
>> +};
>> +
>>  /**
>>   * DMA buffer.
>>   */
>> --
>> 2.25.0
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--5V10SwBId8ThybYn3z7mowAnlFkOIfUkR--

--QMVIA3zE0V882w7y34I10uDDzcME7UlfX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl5VSZ8ACgkQaA3BHVML
eiNlogf/dVKmk+42yLd3D/olzk7T6Uv7wsxQhHKr7uerjfuCv2ctsHy6MGv2d4td
2OACTbVmEeyHLk3TpqaggkMQQKTxCD1zcrBw1ed+oWGurjjW3NNrE91v4gPLOjMV
Jzz6/jpTtuKhnrdfpLBIT2yTvg5kV5+MUD9MNkviH5c3BWuTiFJJjFo2bT4q7kF1
i54DwXBr0evcDUlWIATK80NPTdx2n7vog64bc4laqMZS5tFvuWNV+W1CZliAJLzy
VAIv2S1G0lprsv/egIwB8r1C1680DNdFZGmvVOrXo7uWGJX0dHNTbvQkZY1eczLu
w3Kk6zoZSBaBb8PYkM/AHm3tG2gl5A==
=Txbh
-----END PGP SIGNATURE-----

--QMVIA3zE0V882w7y34I10uDDzcME7UlfX--

--===============1620435833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1620435833==--

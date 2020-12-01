From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 09/15] drm/nouveau: Remove references to
 struct drm_device.pdev
Date: Tue, 1 Dec 2020 10:50:19 +0100
Message-ID: <77dcf689-d22c-5ae8-8c46-10ce7a546a63@suse.de>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-10-tzimmermann@suse.de>
 <20201124214208.GB93095@ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0305198705=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201124214208.GB93095-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0305198705==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4bE8wtoD18K52eefsY2TD0VT1msAv6pGQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4bE8wtoD18K52eefsY2TD0VT1msAv6pGQ
Content-Type: multipart/mixed; boundary="h9BtDHO1BkSllNSHbFLWYUa8dv8v2U8Rv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
To: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org,
 Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Message-ID: <77dcf689-d22c-5ae8-8c46-10ce7a546a63-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 09/15] drm/nouveau: Remove references to struct
 drm_device.pdev
References: <20201124113824.19994-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20201124113824.19994-10-tzimmermann-l3A5Bk7waGM@public.gmane.org>
 <20201124214208.GB93095-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
In-Reply-To: <20201124214208.GB93095-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

--h9BtDHO1BkSllNSHbFLWYUa8dv8v2U8Rv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 24.11.20 um 22:42 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Tue, Nov 24, 2020 at 12:38:18PM +0100, Thomas Zimmermann wrote:
>> Using struct drm_device.pdev is deprecated. Convert nouveau to struct
>> drm_device.dev. No functional changes.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
>> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>=20
> Suggestion to an alternative implmentation below.
>=20
>> ---
>>   drivers/gpu/drm/nouveau/dispnv04/arb.c      | 12 +++++++-----
>>   drivers/gpu/drm/nouveau/dispnv04/disp.h     | 14 ++++++++------
>>   drivers/gpu/drm/nouveau/dispnv04/hw.c       | 10 ++++++----
>>   drivers/gpu/drm/nouveau/nouveau_abi16.c     |  7 ++++---
>>   drivers/gpu/drm/nouveau/nouveau_acpi.c      |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_bios.c      | 11 ++++++++---
>>   drivers/gpu/drm/nouveau/nouveau_connector.c | 10 ++++++----
>>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  5 ++---
>>   drivers/gpu/drm/nouveau/nouveau_fbcon.c     |  6 ++++--
>>   drivers/gpu/drm/nouveau/nouveau_vga.c       | 20 ++++++++++++-------=
-
>>   10 files changed, 58 insertions(+), 39 deletions(-)
>>
>=20
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/=
nouveau/nouveau_bios.c
>> index d204ea8a5618..7cc683b8dc7a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
>> @@ -110,6 +110,9 @@ static int call_lvds_manufacturer_script(struct dr=
m_device *dev, struct dcb_outp
>>   	struct nvbios *bios =3D &drm->vbios;
>>   	uint8_t sub =3D bios->data[bios->fp.xlated_entry + script] + (bios-=
>fp.link_c_increment && dcbent->or & DCB_OUTPUT_C ? 1 : 0);
>>   	uint16_t scriptofs =3D ROM16(bios->data[bios->init_script_tbls_ptr =
+ sub * 2]);
>> +#ifdef __powerpc__
>> +	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
>> +#endif
> Or
> 	int device =3D 0;
>>  =20
>>   	if (!bios->fp.xlated_entry || !sub || !scriptofs)
>>   		return -EINVAL;
>> @@ -123,8 +126,8 @@ static int call_lvds_manufacturer_script(struct dr=
m_device *dev, struct dcb_outp
>>   #ifdef __powerpc__
>>   	/* Powerbook specific quirks */
> 	device =3D to_pci_dev(dev->dev)->device;
> 	if (script =3D=3D LVDS_RESET && (device =3D=3D 0x0179 || device =3D=3D=
 0x0189 || device =3D=3D 0x0329))

I see the point, but I'm trying to not change the existing=20
implementation too much.

>=20
>>   	if (script =3D=3D LVDS_RESET &&
>> -	    (dev->pdev->device =3D=3D 0x0179 || dev->pdev->device =3D=3D 0x0=
189 ||
>> -	     dev->pdev->device =3D=3D 0x0329))
>> +	    (pdev->device =3D=3D 0x0179 || pdev->device =3D=3D 0x0189 ||
>> +	     pdev->device =3D=3D 0x0329))
>>   		nv_write_tmds(dev, dcbent->or, 0, 0x02, 0x72);
>>   #endif
>>  =20
>=20
>=20
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm=
/nouveau/nouveau_fbcon.c
>> index 24ec5339efb4..4fc0fa696461 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
>> @@ -396,7 +396,9 @@ nouveau_fbcon_create(struct drm_fb_helper *helper,=

>>   	NV_INFO(drm, "allocated %dx%d fb: 0x%llx, bo %p\n",
>>   		fb->width, fb->height, nvbo->offset, nvbo);
>>  =20
>> -	vga_switcheroo_client_fb_set(dev->pdev, info);
>> +	if (dev_is_pci(dev->dev))
>> +		vga_switcheroo_client_fb_set(to_pci_dev(dev->dev), info);
>> +
> I cannot see why dev_is_pci() is needed here.
> So I am obviously missing something :-(

vga_switcheroo_client_fb_set() expects a PCI device. It's a bit of a=20
stretch, but at least it is possible to pass NULL for non-PCI devices.=20
Passing the upcasted dev->dev is just garbage.

As the VGA switcheroo is only relevant for PCI devices, I added the=20
branching to make this work reliably.

Best regards
Thomas

>=20
>>   	return 0;
>>  =20
>>   out_unlock:
>> @@ -548,7 +550,7 @@ nouveau_fbcon_init(struct drm_device *dev)
>>   	int ret;
>>  =20
>>   	if (!dev->mode_config.num_crtc ||
>> -	    (dev->pdev->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
>> +	    (to_pci_dev(dev->dev)->class >> 8) !=3D PCI_CLASS_DISPLAY_VGA)
>>   		return 0;
>>  =20
>>   	fbcon =3D kzalloc(sizeof(struct nouveau_fbdev), GFP_KERNEL);
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/n=
ouveau/nouveau_vga.c
>> index c85dd8afa3c3..7c4b374b3eca 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
>> @@ -87,18 +87,20 @@ nouveau_vga_init(struct nouveau_drm *drm)
>>   {
>>   	struct drm_device *dev =3D drm->dev;
>>   	bool runtime =3D nouveau_pmops_runtime();
>> +	struct pci_dev *pdev;
>>  =20
>>   	/* only relevant for PCI devices */
>> -	if (!dev->pdev)
>> +	if (!dev_is_pci(dev->dev))
>>   		return;
>> +	pdev =3D to_pci_dev(dev->dev);
>>  =20
>> -	vga_client_register(dev->pdev, dev, NULL, nouveau_vga_set_decode);
>> +	vga_client_register(pdev, dev, NULL, nouveau_vga_set_decode);
>>  =20
>>   	/* don't register Thunderbolt eGPU with vga_switcheroo */
>> -	if (pci_is_thunderbolt_attached(dev->pdev))
>> +	if (pci_is_thunderbolt_attached(pdev))
>>   		return;
>>  =20
>> -	vga_switcheroo_register_client(dev->pdev, &nouveau_switcheroo_ops, r=
untime);
>> +	vga_switcheroo_register_client(pdev, &nouveau_switcheroo_ops, runtim=
e);
>>  =20
>>   	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>>   		vga_switcheroo_init_domain_pm_ops(drm->dev->dev, &drm->vga_pm_doma=
in);
>> @@ -109,17 +111,19 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>>   {
>>   	struct drm_device *dev =3D drm->dev;
>>   	bool runtime =3D nouveau_pmops_runtime();
>> +	struct pci_dev *pdev;
>>  =20
>>   	/* only relevant for PCI devices */
>> -	if (!dev->pdev)
>> +	if (!dev_is_pci(dev->dev))
>>   		return;
>> +	pdev =3D to_pci_dev(dev->dev);
>>  =20
>> -	vga_client_register(dev->pdev, NULL, NULL, NULL);
>> +	vga_client_register(pdev, NULL, NULL, NULL);
>>  =20
>> -	if (pci_is_thunderbolt_attached(dev->pdev))
>> +	if (pci_is_thunderbolt_attached(pdev))
>>   		return;
>>  =20
>> -	vga_switcheroo_unregister_client(dev->pdev);
>> +	vga_switcheroo_unregister_client(pdev);
>>   	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>>   		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>>   }
>> --=20
>> 2.29.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--h9BtDHO1BkSllNSHbFLWYUa8dv8v2U8Rv--

--4bE8wtoD18K52eefsY2TD0VT1msAv6pGQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GEdsFAwAAAAAACgkQlh/E3EQov+Df
kRAAvj2+LkBCXz/2aIbjZjTpvfqk5RKkEA3ePFiR6UttUmznYEPIJkPmdsqr2JNUU5YI85JJRvM7
7/QvWO4KXVqYbbPAzFhdHqySRrSnWpV89jseDccMSnjcHEKc1cNj386s3YDWeJ3/pmAuysLnOU30
bTdrdkKpYL4CvHWI6RQyGG/5D65TteLwDT6ZAXThOVthuraz2XvGwt2pOhVSiwX1mNfibm2lQ0G6
7b7sv+5l5sKaq5uETZi4iW++TmdotLrd40VioW/dttTfBwtfiIFHZm2jcO8Kb0+WkpZ4JKEDPZT2
nfxMeK2euCeehZYCWFz4xlDg3SiBAbTTB2uhasE7McPPA25P3MoR4d8Ivf237PbA1EVSGNuTshKU
zc4S9Rnw6zyqD9lc5rlofsyDUrESgMGQlbneHb52dUwFxIcgfdvg3nitUSBGw9deFIRDd6Rjrbu+
+ns4Z223cVq+TEmRNSERvAxVwCDlSN2x7Q0U4P0MIBd/4cPKsmwOvjZlWlGMfpTKlfkhWyMVV0aZ
mK6WZxRrV827KprLxdT9vSGLlPNEbYYOz1dqRsaRgtSk+XhplfGJwPBnsbPiUVt7NlOGmltFHFl8
8+vR4ygf4RBTIO4Y23B8ba2NwuvqxMEo9asKO0hZ1IqPbQQYYRZnkqXtZtKMlIo7TUb41I8gNFHR
Yc4=
=91fY
-----END PGP SIGNATURE-----

--4bE8wtoD18K52eefsY2TD0VT1msAv6pGQ--

--===============0305198705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0305198705==--

From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v3 1/2] nouveau/bl: Assign different names to
 interfaces
Date: Mon, 14 Nov 2016 13:05:30 +0100
Message-ID: <20161114120530.ghtxapkowa3rrjz7@pmoreau.org>
References: <1460732242-4161-1-git-send-email-pierre.morrow@free.fr>
 <20161113195707.4113-1-dev@pmoreau.org>
 <20161114101740.GA9829@wunner.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0877286557=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20161114101740.GA9829-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0877286557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d3avabwqbbbcrezv"
Content-Disposition: inline


--d3avabwqbbbcrezv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:17 am - Nov 14 2016, Lukas Wunner wrote:
> On Sun, Nov 13, 2016 at 08:57:06PM +0100, Pierre Moreau wrote:
> > From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> >=20
> > Currently, every backlight interface created by Nouveau uses the same n=
ame,
> > nv_backlight. This leads to a sysfs warning as it tries to create an al=
ready
> > existing folder. This patch adds a incremented number to the name, but =
keeps
> > the initial name as nv_backlight, to avoid possibly breaking userspace;=
 the
> > second interface will be named nv_backlight1, and so on.
> >=20
> > Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D86539
> >=20
> > v2:
> > * Switch to using ida for generating unique IDs, as suggested by Ilia M=
irkin;
> > * Allocate backlight name on the stack, as suggested by Ilia Mirkin;
> > * Move `nouveau_get_backlight_name()` to avoid forward declaration, as
> >   suggested by Ilia Mirkin;
> > * Fix reference to bug report formatting, as reported by Nick Tenney.
> >=20
> > v3:
> > * Define a macro for the size of the backlight name, to avoid defining
> >   it multiple times;
> > * Use snprintf in place of sprintf.
> >=20
> > Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c | 65 +++++++++++++++++++++=
++++++--
> >  drivers/gpu/drm/nouveau/nouveau_display.h   | 10 +++++
> >  drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +
> >  drivers/gpu/drm/nouveau/nouveau_drv.h       |  1 +
> >  4 files changed, 74 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/=
drm/nouveau/nouveau_backlight.c
> > index 5e2c568..0e69612 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > @@ -31,11 +31,32 @@
> >   */
> > =20
> >  #include <linux/backlight.h>
> > +#include <linux/idr.h>
> > =20
> >  #include "nouveau_drv.h"
> >  #include "nouveau_reg.h"
> >  #include "nouveau_encoder.h"
> > =20
> > +static struct ida bl_ida;
> > +#define BL_NAME_SIZE 15 // 12 for name + 2 for digits + 1 for '\0'
> > +
> > +struct backlight_connector {
> > +	struct list_head head;
> > +	int id;
> > +};
> > +
> > +static void
> > +nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE], struct
> > +		backlight_connector *connector)
> > +{
> > +	const int nb =3D ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
> > +	if (nb > 0 && nb < 100)
> > +		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
> > +	else
> > +		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
> > +	connector->id =3D nb;
> > +}
> > +
>=20
> Just a minor issue, in the >=3D 100 case, backlight creation should proba=
bly
> fail rather than reverting to "nv_backlight".  Other than that LGTM.

I don=E2=80=99t see how you could get to more than 100 backlight interfaces=
, but you
are absolutely right, it should fail rather than reverting to "nv_backlight=
".
I=E2=80=99ll add a return code to `nouveau_get_backlight_name()` and check =
for that in
the `nvX0_backlight_init()` functions. If it is non-zero, I=E2=80=99m not s=
ure whether
I should return an error code (and if so, which one) or just a plain 0.

Thanks,
Pierre

PS: I have no idea what went wrong with the e-mail address, and why it deci=
ded
to send it from my other e-mail address rather than the usual one=E2=80=A6 =
I=E2=80=99ll have to
fix that before sending the updated version.

>=20
> Thanks,
>=20
> Lukas
>=20
> >  static int
> >  nv40_get_intensity(struct backlight_device *bd)
> >  {
> > @@ -74,6 +95,8 @@ nv40_backlight_init(struct drm_connector *connector)
> >  	struct nvif_object *device =3D &drm->device.object;
> >  	struct backlight_properties props;
> >  	struct backlight_device *bd;
> > +	struct backlight_connector bl_connector;
> > +	char backlight_name[BL_NAME_SIZE];
> > =20
> >  	if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK=
))
> >  		return 0;
> > @@ -81,10 +104,16 @@ nv40_backlight_init(struct drm_connector *connecto=
r)
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> >  	props.type =3D BACKLIGHT_RAW;
> >  	props.max_brightness =3D 31;
> > -	bd =3D backlight_device_register("nv_backlight", connector->kdev, drm,
> > +	nouveau_get_backlight_name(backlight_name, &bl_connector);
> > +	bd =3D backlight_device_register(backlight_name , connector->kdev, dr=
m,
> >  				       &nv40_bl_ops, &props);
> > -	if (IS_ERR(bd))
> > +
> > +	if (IS_ERR(bd)) {
> > +		if (bl_connector.id > 0)
> > +			ida_simple_remove(&bl_ida, bl_connector.id);
> >  		return PTR_ERR(bd);
> > +	}
> > +	list_add(&bl_connector.head, &drm->bl_connectors);
> >  	drm->backlight =3D bd;
> >  	bd->props.brightness =3D nv40_get_intensity(bd);
> >  	backlight_update_status(bd);
> > @@ -182,6 +211,8 @@ nv50_backlight_init(struct drm_connector *connector)
> >  	struct backlight_properties props;
> >  	struct backlight_device *bd;
> >  	const struct backlight_ops *ops;
> > +	struct backlight_connector bl_connector;
> > +	char backlight_name[BL_NAME_SIZE];
> > =20
> >  	nv_encoder =3D find_encoder(connector, DCB_OUTPUT_LVDS);
> >  	if (!nv_encoder) {
> > @@ -203,11 +234,17 @@ nv50_backlight_init(struct drm_connector *connect=
or)
> >  	memset(&props, 0, sizeof(struct backlight_properties));
> >  	props.type =3D BACKLIGHT_RAW;
> >  	props.max_brightness =3D 100;
> > -	bd =3D backlight_device_register("nv_backlight", connector->kdev,
> > +	nouveau_get_backlight_name(backlight_name, &bl_connector);
> > +	bd =3D backlight_device_register(backlight_name , connector->kdev,
> >  				       nv_encoder, ops, &props);
> > -	if (IS_ERR(bd))
> > +
> > +	if (IS_ERR(bd)) {
> > +		if (bl_connector.id > 0)
> > +			ida_simple_remove(&bl_ida, bl_connector.id);
> >  		return PTR_ERR(bd);
> > +	}
> > =20
> > +	list_add(&bl_connector.head, &drm->bl_connectors);
> >  	drm->backlight =3D bd;
> >  	bd->props.brightness =3D bd->ops->get_brightness(bd);
> >  	backlight_update_status(bd);
> > @@ -221,6 +258,8 @@ nouveau_backlight_init(struct drm_device *dev)
> >  	struct nvif_device *device =3D &drm->device;
> >  	struct drm_connector *connector;
> > =20
> > +	INIT_LIST_HEAD(&drm->bl_connectors);
> > +
> >  	list_for_each_entry(connector, &dev->mode_config.connector_list, head=
) {
> >  		if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS &&
> >  		    connector->connector_type !=3D DRM_MODE_CONNECTOR_eDP)
> > @@ -247,9 +286,27 @@ void
> >  nouveau_backlight_exit(struct drm_device *dev)
> >  {
> >  	struct nouveau_drm *drm =3D nouveau_drm(dev);
> > +	struct backlight_connector *connector;
> > +
> > +	list_for_each_entry(connector, &drm->bl_connectors, head) {
> > +		if (connector->id >=3D 0)
> > +			ida_simple_remove(&bl_ida, connector->id);
> > +	}
> > =20
> >  	if (drm->backlight) {
> >  		backlight_device_unregister(drm->backlight);
> >  		drm->backlight =3D NULL;
> >  	}
> >  }
> > +
> > +void
> > +nouveau_backlight_ctor(void)
> > +{
> > +	ida_init(&bl_ida);
> > +}
> > +
> > +void
> > +nouveau_backlight_dtor(void)
> > +{
> > +	ida_destroy(&bl_ida);
> > +}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/dr=
m/nouveau/nouveau_display.h
> > index 330fe0f..4a75df0 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_display.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_display.h
> > @@ -91,6 +91,8 @@ int nouveau_crtc_set_config(struct drm_mode_set *set);
> >  #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> >  extern int nouveau_backlight_init(struct drm_device *);
> >  extern void nouveau_backlight_exit(struct drm_device *);
> > +extern void nouveau_backlight_ctor(void);
> > +extern void nouveau_backlight_dtor(void);
> >  #else
> >  static inline int
> >  nouveau_backlight_init(struct drm_device *dev)
> > @@ -101,6 +103,14 @@ nouveau_backlight_init(struct drm_device *dev)
> >  static inline void
> >  nouveau_backlight_exit(struct drm_device *dev) {
> >  }
> > +
> > +static inline void
> > +nouveau_backlight_ctor(void) {
> > +}
> > +
> > +static inline void
> > +nouveau_backlight_dtor(void) {
> > +}
> >  #endif
> > =20
> >  struct drm_framebuffer *
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/no=
uveau/nouveau_drm.c
> > index 9876e6f..2b93b55 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -1113,6 +1113,7 @@ nouveau_drm_init(void)
> >  #endif
> > =20
> >  	nouveau_register_dsm_handler();
> > +	nouveau_backlight_ctor();
> >  	return drm_pci_init(&driver_pci, &nouveau_drm_pci_driver);
> >  }
> > =20
> > @@ -1123,6 +1124,7 @@ nouveau_drm_exit(void)
> >  		return;
> > =20
> >  	drm_pci_exit(&driver_pci, &nouveau_drm_pci_driver);
> > +	nouveau_backlight_dtor();
> >  	nouveau_unregister_dsm_handler();
> > =20
> >  #ifdef CONFIG_NOUVEAU_PLATFORM_DRIVER
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/no=
uveau/nouveau_drv.h
> > index 4cd47ba..923dbce 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -161,6 +161,7 @@ struct nouveau_drm {
> >  	struct nvbios vbios;
> >  	struct nouveau_display *display;
> >  	struct backlight_device *backlight;
> > +	struct list_head bl_connectors;
> > =20
> >  	/* power management */
> >  	struct nouveau_hwmon *hwmon;
> > --=20
> > 2.10.2
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--d3avabwqbbbcrezv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYKaiCAAoJEI7uMhYTPh3wXDwP/35VCsyb2h98CDchkcPdIhNY
21KAEcdnQpzQ0pzLsG+6lB5buWMtV7ZC/5MEr9D7RsYTdbO6/gBlnRhTkZH2PGAn
FlIJTvxF59h0RupDlOmnpPaAM0nIwM7fqXsl46AoixHFu+ErpQvzPNra3dNZs/8X
0s/K6PvNsSV0cKZv0N4MAPOaq1lhSoLWlSuk/ESyezaazGPlWail6u1aoHw6+vAS
46IubwiY2gX1gmhouh9stRUP8OwQS/tHs8lv5LKZc6QjTkjJiZEXQ1ka3xfRsU2T
Q48rcBdlrEgVg2z7nGBWbvHNi91CjzEYrtYeIssklx+f4ibqvs7LAcjnAIJYHHHO
Y0ArC6u7oGHRbwah0EYxtfavBc1nbXsjvBfBDCEMzfKnwtmKAPAjpWdK4JfIoEQl
aeaOJMPTtcgfdPKPezO3YRRBPPlHnAxD+GTc75u0inYPJBFdXFuC2mShQQa3RhRX
gSEP7kNxTDV5pjmYE48LrjRAhJip4+I1SYQdTCKsEGbcOaT2n04lmlFmj2Fxp8/c
p7yijbqa2X+xYaWhk1Vz2RSTi4RCPqMBp3hJ8I5ECrGDoBgliR8wa1JWd1NlX43J
O9E6FcTGotLB6WKsoDJIAfzhaUW5dkq2NkSN22LuJ1coWKySDuieZ1g+8Wr/RXmW
QV1jYm40groNSUZa05Zk
=cUzZ
-----END PGP SIGNATURE-----

--d3avabwqbbbcrezv--

--===============0877286557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0877286557==--

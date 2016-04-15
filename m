From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH 1/2] nouveau/bl: Assign different names to
 interfaces
Date: Fri, 15 Apr 2016 17:22:12 +0200
Message-ID: <20160415152212.GA1697@Thessia.alltele.se>
References: <1460732242-4161-1-git-send-email-pierre.morrow@free.fr>
 <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1136200717=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg3OxWuooJ=otSb1N_yRr1VcVgvH4K0DDy1zzDs9js4CA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1136200717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:06 AM - Apr 15 2016, Ilia Mirkin wrote:
> On Fri, Apr 15, 2016 at 10:57 AM, Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> w=
rote:
> > Currently, every backlight interface created by Nouveau uses the same n=
ame,
> > nv_backlight. This leads to a sysfs warning as it tries to create an al=
ready
> > existing folder. This patch adds a incremented number to the name, but =
keeps
> > the initial name as nv_backlight, to avoid possibly breaking userspace;=
 the
> > second interface will be named nv_backlight1, and so on.
> >
> > Fixes: fdo#86539
> > Signed-off-by: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
> > ---
> >  drm/nouveau/nouveau_backlight.c | 35 +++++++++++++++++++++++++++++++++=
--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/drm/nouveau/nouveau_backlight.c b/drm/nouveau/nouveau_back=
light.c
> > index 89eb460..914e2cb 100644
> > --- a/drm/nouveau/nouveau_backlight.c
> > +++ b/drm/nouveau/nouveau_backlight.c
> > @@ -36,6 +36,10 @@
> >  #include "nouveau_reg.h"
> >  #include "nouveau_encoder.h"
> >
> > +static atomic_t bl_interfaces_nb =3D { 0 };
>=20
> static data is initialized to 0, this should be unnecessary.

I didn=E2=80=99t know that. But on the other hand, I like having it explici=
t, and it
should not add any overhead.

>=20
> I'd also call it "backlights" or something like that. No need for
> multiple words...

I prefer to use a plural noun when talking about a container of those nouns,
rathter than a counter of those nouns. But I=E2=80=99ll change it.

>=20
> > +
> > +static char* nouveau_get_backlight_name(void);
>=20
> Please organize the code to avoid forward declarations.
>=20
> > +
> >  static int
> >  nv40_get_intensity(struct backlight_device *bd)
> >  {
> > @@ -74,6 +78,7 @@ nv40_backlight_init(struct drm_connector *connector)
> >         struct nvif_object *device =3D &drm->device.object;
> >         struct backlight_properties props;
> >         struct backlight_device *bd;
> > +       char* backlight_name =3D NULL;
> >
> >         if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGH=
T_MASK))
> >                 return 0;
> > @@ -81,8 +86,14 @@ nv40_backlight_init(struct drm_connector *connector)
> >         memset(&props, 0, sizeof(struct backlight_properties));
> >         props.type =3D BACKLIGHT_RAW;
> >         props.max_brightness =3D 31;
> > -       bd =3D backlight_device_register("nv_backlight", connector->kde=
v, drm,
> > +       backlight_name =3D nouveau_get_backlight_name();
> > +       bd =3D backlight_device_register(backlight_name , connector->kd=
ev, drm,
> >                                        &nv40_bl_ops, &props);
> > +
> > +       // backlight_device_register() makes a copy
> > +       kfree(backlight_name);
> > +       backlight_name =3D NULL;
> > +
> >         if (IS_ERR(bd))
> >                 return PTR_ERR(bd);
> >         drm->backlight =3D bd;
> > @@ -182,6 +193,7 @@ nv50_backlight_init(struct drm_connector *connector)
> >         struct backlight_properties props;
> >         struct backlight_device *bd;
> >         const struct backlight_ops *ops;
> > +       char* backlight_name =3D NULL;
> >
> >         nv_encoder =3D find_encoder(connector, DCB_OUTPUT_LVDS);
> >         if (!nv_encoder) {
> > @@ -203,8 +215,14 @@ nv50_backlight_init(struct drm_connector *connecto=
r)
> >         memset(&props, 0, sizeof(struct backlight_properties));
> >         props.type =3D BACKLIGHT_RAW;
> >         props.max_brightness =3D 100;
> > -       bd =3D backlight_device_register("nv_backlight", connector->kde=
v,
> > +       backlight_name =3D nouveau_get_backlight_name();
> > +       bd =3D backlight_device_register(backlight_name, connector->kde=
v,
> >                                        nv_encoder, ops, &props);
> > +
> > +       // backlight_device_register() makes a copy
> > +       kfree(backlight_name);
> > +       backlight_name =3D NULL;
> > +
> >         if (IS_ERR(bd))
> >                 return PTR_ERR(bd);
> >
> > @@ -252,3 +270,16 @@ nouveau_backlight_exit(struct drm_device *dev)
> >                 drm->backlight =3D NULL;
> >         }
> >  }
> > +
> > +static char*
> > +nouveau_get_backlight_name(void)
> > +{
> > +       // 12 chars for "nv_backlight" + 2 for two digits number + 1 fo=
r '\0'
> > +       char* backlight_name =3D (char*)kmalloc(sizeof(char[15]), GFP_K=
ERNEL);
>=20
> Making this stack-allocated in the caller would be so much simpler...

--" I was planning to use a dynamic size to allow numbers bigger than 99, a=
nd
lesser than 10, but stopped midway through the process. I=E2=80=99ll revert=
 to a plain
stack-allocated.

>=20
> > +       const int nb =3D atomic_inc_return(&bl_interfaces_nb) - 1;
>=20
> This kinda sucks if you reload nouveau a bunch. How about using an
> "ida". Have a look in drivers/gpu/drm/drm_crtc.c for how I use that
> one.

Yeah, I=E2=80=99m not really fond of that part. I=E2=80=99ll have a look at=
 drm_crtc.c!

Pierre


>=20
> > +       if (nb > 0 && nb < 100)
> > +               sprintf(backlight_name, "nv_backlight%d", nb);
> > +       else
> > +               sprintf(backlight_name, "nv_backlight");
> > +       return backlight_name;
> > +}
> > --
> > 2.8.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXEQceAAoJEI7uMhYTPh3w1OgP/R2yUfnEGw3QstOyIDFddcpD
bhzMWOb56fLVmh7WgBy29KqswG6NVgAW3aaCl9tv4QfFMvWrbbbl8lJMekWIjzKh
221dlU6qZKSqWJ7DjWWPIYOmEWnrnywAHEYZQnrxm+SfaJpz3j/fq2c2eHHCQYbT
N2I+1Jk7ALXunBlyrg9hyHuabtVAGFeQ8FliPI6b6+BtBD8w868vUfQpzve/ymef
BKRoVo4QcuuIKDgyooX5DoFaWtkx4X/l+qByxA/kw6oMptqTDerntruXOzfPmkl0
ELK5Z2oQ0OXBhEzFayssXx0y9Dczj9KxpSn2xIZI8pa9dRZ+fC5THGMvWQuL0bJ0
ablFSn5yo1PugHoctIBB/TA1oWZIvZ2v8Xn0IFcBO/PJXDxD7AlazNOgmC57N1TW
iPGAVv9/PNuBx0UcvdduRxkcPO2ug3CDlMD8H7tBXk9oWbT6EXUf+QlvlI/lgXx5
7LeZuETeXea7IQi6YeU8KJR7+Imx3G56QoduEG/QQgD3RU5evdhfZ7QW9xS9/YiC
5oNmgq5SYWQhPKFVLGJ9ORLDIgKBfQn1xsbDU3jsOWYCq1wur3tozup7xLFyCmNd
mBj8Tmw4eJXZovUADUbSPpZwkPM8D+ddj6pTLAdLX2Z470pPVXqNEm1/t7kVGUmw
xPnYM32Q6tiQ11EySfmu
=CEYO
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

--===============1136200717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1136200717==--

From: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: Re: NV50 backlight brightness
Date: Thu, 21 Oct 2010 11:16:21 +0200
Message-ID: <20101021091621.GA29567@aeneby.se>
References: <20101019091030.GA28588@aeneby.se>
	<1287573459.24955.11.camel@araqiel>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0472765621=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1287573459.24955.11.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0472765621==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline


--V0207lvV8h4k8FAm
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 20, 2010 at 09:17:39PM +1000, Ben Skeggs wrote:
> I have a question to you that's important first:  if you fix nouveau's
> max_brightness level, can you actually properly change the brightness?
>=20
> I have an eDP laptop that shows the same backlight level regardless of
> what's in that register.
>=20

By applying the attached patch I can properly change the brightness levels =
using g-p-m. The only question is what the 0x40000000 bit represents as set=
 by BIOS/ACPI - both 0x40001fff and 0x00001fff seem to work fine as far as =
brightness levels are concerned.

--fUYQa+Pmc3FrFX/N
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="linux-2.6.35-20100921.patch"
Content-Transfer-Encoding: quoted-printable

diff -uNrp kernel-2.6.35.fc14.orig/drivers/gpu/drm/nouveau/nouveau_backligh=
t.c kernel-2.6.35.fc14.new/drivers/gpu/drm/nouveau/nouveau_backlight.c
--- kernel-2.6.35.fc14.orig/drivers/gpu/drm/nouveau/nouveau_backlight.c	201=
0-09-10 14:04:09.301972164 +0200
+++ kernel-2.6.35.fc14.new/drivers/gpu/drm/nouveau/nouveau_backlight.c	2010=
-10-21 10:04:03.709309995 +0200
@@ -120,7 +120,11 @@ static int nouveau_nv50_backlight_init(s
 		return 0;
=20
 	memset(&props, 0, sizeof(struct backlight_properties));
-	props.max_brightness =3D 1025;
+	if (dev_priv->chipset >=3D 0xa8) =20
+		props.max_brightness =3D 0x0001ffff;
+	else
+		props.max_brightness =3D 1025;
+
 	bd =3D backlight_device_register("nv_backlight", &dev->pdev->dev, dev,
 				       &nv50_bl_ops, &props);
 	if (IS_ERR(bd))

--fUYQa+Pmc3FrFX/N--

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJMwATkAAoJECw8YUUfeQL9A6gH/iT2U4ceetQLPxah7rH+qOtJ
I7roVd/yg7Msf5pcrf9v707lC4UR7TqyWwTQRcoI9uf0roonQU4QcYTckguX7vUw
03Y9vbVKSYlzVGBumFpyHL8paHlFOw8UYdBT2EJVbUy3yD+nBExxGKb7OTL4rG8M
WegP8B0pVo7TePq6u2TeuhWynU3FMaphLpm4vSmIezj4nRTNDmUTJMMCWUoxHJ+B
tOdOvBM9ObSxhvNYrEx+HALgIrDTJ9RH+aubfTwpcHxjBqpyIxbtu9FqpaHnnox0
5o7ZPFjZmnhbfC7Afc+0+zXRyvxEvd4Q0yyCCvyTcqP0t8sU0rGzgofVuU3RQ0k=
=nVF8
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--

--===============0472765621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0472765621==--

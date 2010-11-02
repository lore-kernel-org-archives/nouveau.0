From: Aaron Sowry <aaron+nv-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: Re: nouveau exposes backlight controls in presence of	ACPI
Date: Tue, 2 Nov 2010 15:51:53 +0100
Message-ID: <20101102145153.GA4075@aeneby.se>
References: <20101029154934.GA2076@aeneby.se> <1288670315.6477.2.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0349997499=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1288670315.6477.2.camel@nisroch>
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


--===============0349997499==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline


--s2ZSL+KKDSLx8OML
Content-Type: multipart/mixed; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> However.  There's also the platform-specific modules (thinkpad etc) that
> will provide their own backlight methods if the standard ACPI mechanism
> isn't available.  I didn't see any immediately obvious way of knowing
> whether or not they were being provided.
>=20
> I'm not too certain the best way to deal with this, any ideas? :)

See attached patch, which prevents nouveau registering a backlight control =
if ACPI already provides one. If there are no glaring errors in the code/im=
plementation then I would like to submit it.

Dealing with platform-specific modules is tricky because it looks like nouv=
eau initialises itself quite early on in the boot process:

[aaron@jules ~]$ dmesg | grep ACPI
=2E..
[    3.359377] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    3.359560] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    4.860678] [drm] nouveau 0000:01:00.0: Detected ACPI backlight support,=
 not registering control
[   14.206997] ACPI: WMI: Skipping duplicate GUID 05901221-D566-11D1-B2F0-0=
0A0C9062910
[   14.207693] ACPI: WMI: Mapper loaded
[   17.686907] thinkpad_acpi: ThinkPad ACPI Extras v0.24
[   17.689517] thinkpad_acpi: This ThinkPad has standard ACPI backlight bri=
ghtness control, supported by the ACPI video driver
[   17.756039] thinkpad_acpi: Standard ACPI backlight interface available, =
not loading native one.

My suggestion would be that it is the responsibility of user-space to selec=
t an appropriate ACPI backlight control.

/Aaron

--X1bOJ3K7DJ5YkBrT
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nouveau_state.patch"
Content-Transfer-Encoding: quoted-printable

--- kernel-2.6.35.fc14.orig/drivers/gpu/drm/nouveau/nouveau_state.c	2010-11=
-02 13:04:25.433000083 +0100
+++ kernel-2.6.35.fc14.new/drivers/gpu/drm/nouveau/nouveau_state.c	2010-11-=
02 15:18:26.116693011 +0100
@@ -23,6 +23,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
=20
+#include <linux/acpi.h>
 #include <linux/swab.h>
 #include <linux/slab.h>
 #include "drmP.h"
@@ -600,9 +601,13 @@ nouveau_card_init(struct drm_device *dev
 			goto out_irq;
 	}
=20
+	if (acpi_video_backlight_support())
+		NV_INFO(dev, "Detected ACPI backlight support, not registering control\n=
");
+	else {
 	ret =3D nouveau_backlight_init(dev);
-	if (ret)
-		NV_ERROR(dev, "Error %d registering backlight\n", ret);
+		if (ret)
+			NV_ERROR(dev, "Error %d registering backlight\n", ret);
+	}
=20
 	nouveau_fbcon_init(dev);
 	drm_kms_helper_poll_init(dev);

--X1bOJ3K7DJ5YkBrT--

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJM0CWIAAoJECw8YUUfeQL95nkH/0xl6boRWQr60Ld92MJWNqlN
qKO7V69RfgKa0b78RqdVspzKyfCjrYVOe9EGcFwoQ5WqOx7da67CPkv8IqtJ8m+1
kOOXFUmLVnSNhi9GfRekncdFOgZwJ5lItL6kv/rCJTnkBvDGxf9la+1E91tCoyp/
ttq7YSROo6+oBB5uESZNfck8tazteUnTBR/ZuNVZXlrpqNCIrqgn4cDlEaa226Kv
j6GSu9IfNGYAU8qClwU4hoM9FQDzJA2JA4MmL7xVJ8HRGU4h415iR/MazcnM3ja8
LCkDd8aY2snbEifPLl6U08l5VBApKPSDsc60VBApWcYIycvq2T0Op1f2AgQkTgI=
=1HFt
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--

--===============0349997499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0349997499==--

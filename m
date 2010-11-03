From: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] nouveau: Don't expose backlight control in
	presence of ACPI
Date: Wed, 3 Nov 2010 11:12:29 +0100
Message-ID: <20101103101229.GA4523@aeneby.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0363814000=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0363814000==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>

Avoid confusing userspace by not publishing backlight controls if ACPI equi=
valents are available.
Signed-off-by: Aaron Sowry <aaron-+1tCnOwpXBmzQB+pC5nmwQ@public.gmane.org>
---
--- linux-2.6/drivers/gpu/drm/nouveau/nouveau_state.c.orig      2010-11-03 =
09:56:29.502828966 +0100
+++ linux-2.6/drivers/gpu/drm/nouveau/nouveau_state.c   2010-11-03 10:46:27=
=2E765829000 +0100
@@ -23,6 +23,7 @@
  * DEALINGS IN THE SOFTWARE.
  */

+#include <linux/acpi.h>
 #include <linux/swab.h>
 #include <linux/slab.h>
 #include "drmP.h"
@@ -648,9 +649,14 @@ nouveau_card_init(struct drm_device *dev
                        goto out_fence;
        }

-       ret =3D nouveau_backlight_init(dev);
-       if (ret)
-               NV_ERROR(dev, "Error %d registering backlight\n", ret);
+       if (acpi_video_backlight_support())
+               NV_INFO(dev, "Detected ACPI backlight support, "
+                               "not registering interface\n");
+       else {
+               ret =3D nouveau_backlight_init(dev);
+               if (ret)
+                       NV_ERROR(dev, "Error %d registering backlight\n", r=
et);
+       }

        nouveau_fbcon_init(dev);
        drm_kms_helper_poll_init(dev);

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAEBAgAGBQJM0TWMAAoJECw8YUUfeQL9s9oH/iG3Tzy5RCRzDznRPpxxsSMV
V8qmc+tokkpybjvoXyRD3erp5H90AjpDEQBeu1setWeYrZDr5DuWerXEjvqSoZss
ae9Wc0+3Se7WxfeTAJY1+QuBm1dnK0lNz7q3hOeBovwBhbK5fGMxPHbFYbwFuKHB
oaiznoW3W/InGIJHqBfpA+wymd6jwt/mr6KcJi9wGcS/ZLuYTB4Z7r/InC85I8mM
tjJh+IdycT5SdQSISef6M5dWeBsgvPSY9+zw/2xmAYanXBj+1sfsoyLqh7s6gYdx
klxRU6zABMgFiGgicznS3901ZWwbIvD6EuiDZk0gxI9YSVHaX2uMiKHOCBJ3cb0=
=9m0Z
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

--===============0363814000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0363814000==--

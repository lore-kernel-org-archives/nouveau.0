From: Rupert Swarbrick <rswarbrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Building with new kernels
Date: Sat, 09 May 2009 12:35:44 +0100
Message-ID: <gu3pqt$4vq$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1458394092=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1458394092==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=


There have been two kernel changes recently which stop the nouveau drm
building: irqreturn.h has lost the IRQ_HANDLED #define and the device
struct has lost bus_id.

There is a trivial fix for the first problem: just check for either the
old or the new name in drm_os_linux.h.

For the second, the patch I'm attaching uses dev_set_name instead of the
(removed) bus_id. The dev_set_name function was added for 2.6.26, but I
don't know if that's too new: if so you need to do some sort of
versioning macros to use the right method I guess.

Anyway, this got things working here (and I'm running the result whilst
writing this!)

Rupert


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=diff.patch
Content-Transfer-Encoding: quoted-printable

diff --git a/linux-core/drm_os_linux.h b/linux-core/drm_os_linux.h
index f58296b..48af5b2 100644
=2D-- a/linux-core/drm_os_linux.h
+++ b/linux-core/drm_os_linux.h
@@ -32,7 +32,7 @@
 /** IRQ handler arguments and return type and values */
 #define DRM_IRQ_ARGS		int irq, void *arg
 /** backwards compatibility with old irq return values */
=2D#ifndef IRQ_HANDLED
+#if !( defined(IRQ_RETVAL) || defined(IRQ_HANDLED) )
 typedef void irqreturn_t;
 #define IRQ_HANDLED		/* nothing */
 #define IRQ_NONE		/* nothing */
diff --git a/linux-core/drm_sysfs.c b/linux-core/drm_sysfs.c
index 6de9367..79a4489 100644
=2D-- a/linux-core/drm_sysfs.c
+++ b/linux-core/drm_sysfs.c
@@ -169,7 +169,7 @@ int drm_sysfs_device_add(struct drm_minor *minor)
 	minor->kdev.devt =3D minor->device;
 	minor_str =3D "card%d";
=20=09
=2D	snprintf(minor->kdev.bus_id, BUS_ID_SIZE, minor_str, minor->index);
+	dev_set_name(&minor->kdev, minor_str, minor->index);
=20
 	err =3D device_register(&minor->kdev);
 	if (err) {

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iJwEAQECAAYFAkoFapEACgkQRtd/pJbYVobslQQAqZFFkAUhb2iFSt7rYAad48JY
Wew7O5c/q+q3+Is3IFN+bCzC1iq6naWzi7iUFmpFIbBgNBwV5ZsdF2s5Vwqo24st
IRcabWYoIH73jn80eLn/pPwtcJrLFm4YnerXOKR5glN7DKFEmt2m7m+HS5Tzqm2M
ikE/fTHCeNVHrxKSNOg=
=Rhk6
-----END PGP SIGNATURE-----
--==-=-=--


--===============1458394092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1458394092==--

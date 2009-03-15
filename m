From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: [PATCH] Fix mmap handle
Date: Sun, 15 Mar 2009 14:07:01 -0500
Message-ID: <1237144021.1774.28.camel@balrog.2hip.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1657088968=="
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
To: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============1657088968==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-zay/+FHngsQr5Pj0BSZi"


--=-zay/+FHngsQr5Pj0BSZi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

=46rom 340b563375e001e87a504973581ab48d399ff64b Mon Sep 17 00:00:00 2001
From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Date: Sun, 15 Mar 2009 13:52:58 -0500
Subject: [PATCH] libdrm_nouveau: The handle that is passed to mmap needs to=
 be drm_handle_t

drm_handle_t is defined to be a u32 on linux and a u64 on everything
else.  This addresses an issue on FreeBSD amd64 where the map offsets
may be greater than 32bits.  When the handle is cast to 32bit, mmap
cannot match the requested map and causes X to crash.

This should be a NOOP on linux since drm_handle_t is always 32bit.

Signed-off-by: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
---
 libdrm/nouveau/nouveau_private.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/libdrm/nouveau/nouveau_private.h b/libdrm/nouveau/nouveau_priv=
ate.h
index 9dc1b44..32a9052 100644
--- a/libdrm/nouveau/nouveau_private.h
+++ b/libdrm/nouveau/nouveau_private.h
@@ -173,7 +173,7 @@ struct nouveau_bo_priv {
=20
 	/* Kernel object */
 	uint32_t global_handle;
-	unsigned handle;
+	drm_handle_t handle;
 	void *map;
=20
 	/* Last known information from kernel on buffer status */
--=20
1.6.1.3


--=20
Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2 Hip Networks

--=-zay/+FHngsQr5Pj0BSZi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (FreeBSD)

iEYEABECAAYFAkm9UdUACgkQM4TrQ4qfROPfYACaAlQ4VVUvrXpA9wFeJ9AeX0AG
4DMAniI+RXOJcembMKcSA3Uj1SojT70P
=Sz92
-----END PGP SIGNATURE-----

--=-zay/+FHngsQr5Pj0BSZi--


--===============1657088968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1657088968==--

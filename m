From: Rico Tzschichholz <ricotz-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: Patch to fix "make dist"
Date: Thu, 01 Apr 2010 20:44:46 +0200
Message-ID: <4BB4E99E.3090908@t-online.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1981527828=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============1981527828==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------enig466DDA44B0C93ECE46F18068"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig466DDA44B0C93ECE46F18068
Content-Type: multipart/mixed;
 boundary="------------060009090004050502000603"

This is a multi-part message in MIME format.
--------------060009090004050502000603
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A patch is attached to fix this problem.

It removes the deprecated reference to README.NV1 and properly adds
src/nv_rop.h

Thanks,
Rico Tzschichholz

--------------060009090004050502000603
Content-Type: text/x-patch;
 name="0001-Fix-make-dist.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-Fix-make-dist.patch"

=46rom 21f6c1bbb8b566fd75e3687c290cb89ae1cdb8cb Mon Sep 17 00:00:00 2001
From: Rico Tzschichholz <ricotz-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Date: Thu, 1 Apr 2010 20:39:23 +0200
Subject: [PATCH] Fix "make dist"
 - remove README.NV1 reference from Makefile.am
 - add nv_rop.h to src/Makefile.am

---
 Makefile.am     |    2 +-
 src/Makefile.am |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 4d17fd0..011c574 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -21,7 +21,7 @@
 AUTOMAKE_OPTIONS =3D foreign
 SUBDIRS =3D src man
=20
-EXTRA_DIST =3D README.NV1 ChangeLog
+EXTRA_DIST =3D ChangeLog
=20
 # Always regenerate the changelog
 CLEANFILES =3D ChangeLog
diff --git a/src/Makefile.am b/src/Makefile.am
index b5f7c86..f3c2c96 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -39,6 +39,7 @@ nouveau_drv_la_SOURCES =3D \
 			 nv_driver.c \
 			 nv_include.h \
 			 nv_proto.h \
+			 nv_rop.h \
 			 nv_shadow.c \
 			 nv_type.h \
 			 nv04_exa.c \
--=20
1.7.0.1


--------------060009090004050502000603--

--------------enig466DDA44B0C93ECE46F18068
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQIcBAEBCAAGBQJLtOmeAAoJEF3s26iScOcjpyAP/i8s9ARmm5DWklA9nsR0J4m/
RItbwXbHT934tW7JL3I8/LM4IVVQ1TuDs6LunJFhGgGdD75u3aXkqnGL/Ugedls0
Nxnbw9PQiOy4TSPDj9QXPNUnaUOjq7iA4NMjaL1kfox2H+irdMlzycQBY/o0/zGz
d6Ue91MRYvrj1Jj4SsJn09mXKVFnhBrfjE5WinLM09qPRk1S/+SR6L1eqW5VoiuO
eHBZXYLF4tBGWdffRsXwqJPQ8AqesdyxFvWkCRcSIljDhuSph2URCe7lXhr0sV4x
vfKLX2R5DXdFqccYUVN2hLUr4T6hVfv2ZiRMqZOcLyIpbRGpwc6FSOGoc6z0lsf4
HKskBlLFGpxxtTvV5d8Urw2dUVrBfZZzCPjTmShirYWzxwNiluCd/D2K3kZMM/LC
oxIXgvk/TOWu0+L3Xz2Jqh1XAEaJNIRRrJsKDf9gdqWV20kA+idkAq9r2wxwVb7c
VsDufSsx+AmuK6XFomEg4mdmezEK6mbC3pP0Jdn9XqSGTJ7DfXnLiuw+q2LnX/U2
x09ceF1ZJrFKiXWnxv2+t1GZybYFVcmOxHphpywY1yiNPpud+dm2oBSww1HygPaB
cqxXSbw6sgbmNRYRjFn29pukUZe0uFzvXe43Q/GACSFopb7ivbP8pBOcYSKoSB9S
HlfqVXi1/oDwhEBg20Sj
=OjYU
-----END PGP SIGNATURE-----

--------------enig466DDA44B0C93ECE46F18068--

--===============1981527828==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1981527828==--

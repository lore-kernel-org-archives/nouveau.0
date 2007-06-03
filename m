From: Maurice van der Pot <griffon26-bCGDfOjggl9Wk0Htik3J/w@public.gmane.org>
Subject: [Patch] fix wrapping of index into hash table
	in	nouveau_ht_object_insert()
Date: Sun, 3 Jun 2007 22:00:04 +0200
Message-ID: <20070603200003.GC9204@kfk4ever.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0590378262=="
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


--===============0590378262==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Content-Disposition: inline


--jCrbxBqMcLqd4mOl
Content-Type: multipart/mixed; boundary="kfjH4zxOES6UT95V"
Content-Disposition: inline


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi guys,

Just something I noticed while reading the code.

I would be interested to know if you think the problem would occur in
normal usage.

Regards,
Maurice.

--=20
Maurice van der Pot

Gentoo Linux Developer   griffon26-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org     http://www.gentoo.org
Creator of BiteMe!       griffon26-bCGDfOjggl9Wk0Htik3J/w@public.gmane.org   http://www.kfk4ever.com


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="nouveau_object_ht.patch"
Content-Transfer-Encoding: quoted-printable

diff --git a/shared-core/nouveau_object.c b/shared-core/nouveau_object.c
index ace7c2a..e36568c 100644
--- a/shared-core/nouveau_object.c
+++ b/shared-core/nouveau_object.c
@@ -167,7 +167,7 @@ nouveau_ht_object_insert(drm_device_t* dev, int channel=
, uint32_t handle,
=20
 	while (NV_READ(ht_base + ofs) || NV_READ(ht_base + ofs + 4)) {
 		ofs +=3D 8;
-		if (ofs =3D=3D ht_end) ofs =3D ht_base;
+		if (ofs =3D=3D dev_priv->ramht_size) ofs =3D 0;
 		if (ofs =3D=3D o_ofs) {
 			DRM_ERROR("no free hash table entries\n");
 			return 1;

--kfjH4zxOES6UT95V--

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4 (GNU/Linux)

iD8DBQFGYx3DMGnpIbeahxwRAoOcAJ4siR71jLOtV2uIZMnfAzLO5wa71QCggKTh
ULjf6F2G53MagcAJ+nTdIbY=
=M4gm
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--

--===============0590378262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0590378262==--

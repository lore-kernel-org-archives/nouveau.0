From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: drm copyright
Date: Sat, 20 Jun 2009 18:08:39 -0500
Message-ID: <1245539319.1724.37.camel@balrog.2hip.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0805629313=="
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
To: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--===============0805629313==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-tl9f2ZqOUtvTcTVdWoAL"


--=-tl9f2ZqOUtvTcTVdWoAL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I'm planning to ship nouveau drm in FreeBSD 8.0.  In order to do that, I
need to get copyright/license headers on a few files.  The license I
think is pretty straight forward, since I'll be using the usual MIT drm
license.  The following files don't seem to have headers at the moment
and I would like to get this resolved soon, since we are approaching
code freeze in a few days.

=3D=3D> nouveau_sgdma.c <=3D=3D
=3D=3D> nv04_fb.c <=3D=3D
=3D=3D> nv04_instmem.c <=3D=3D
=3D=3D> nv04_timer.c <=3D=3D
=3D=3D> nv10_fb.c <=3D=3D
=3D=3D> nv20_graph.c <=3D=3D
=3D=3D> nv40_fb.c <=3D=3D
=3D=3D> nv40_mc.c <=3D=3D
=3D=3D> nv50_grctx.h <=3D=3D

robert.

--=20
Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2Hip Networks

--=-tl9f2ZqOUtvTcTVdWoAL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (FreeBSD)

iEYEABECAAYFAko9a/cACgkQM4TrQ4qfROO4NQCdFtdqM4odIpqWcjmeSftQ0xI8
hqoAn1H+M7AvfEPsElUhfS14sEwsA+mZ
=XpF/
-----END PGP SIGNATURE-----

--=-tl9f2ZqOUtvTcTVdWoAL--


--===============0805629313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0805629313==--

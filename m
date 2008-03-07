From: "Hanno =?utf-8?q?B=C3=B6ck?=" <hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org>
Subject: Current state - how to get gallium-stuff running?
Date: Fri, 7 Mar 2008 21:32:20 +0100
Message-ID: <200803072132.23321.hanno@hboeck.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0821547862=="
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

--===============0821547862==
Content-Type: multipart/signed;
  boundary="nextPart4617543.XBUjI3XZtC";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4617543.XBUjI3XZtC
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

As the last tindc said something about 3d really working on nv4x, I wanted =
to=20
try that ( on a NV43). Built nouveau/mesa -> gallium-0.1 branch of mesa and=
=20
git head of libdrm, kernel-drm and xf86-video-nouveau.

glxinfo says:
nouveau DRI driver expected DDX version 1-1.2.x but got version 0.0.10

So I assume I need some other branch of xf86-video-nouveau (?)

I asked in irc but was pointed that it's not the right place to ask, though=
 I=20
didn't find any information in the wiki. Can someone give me some pointers?=
=20
I'd volunteer to write some wiki documentation if I get it running.

=2D-=20
Hanno B=C3=B6ck		Blog:		http://www.hboeck.de/
GPG: 3DBD3B20		Jabber/Mail:	hanno-60OJuG18Xr6zQB+pC5nmwQ@public.gmane.org

--nextPart4617543.XBUjI3XZtC
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.7 (GNU/Linux)

iD8DBQBH0aZXr2QksT29OyARAsw7AJ9A+Xfg4z84+qd7iTMR8xbZLPxFGACeIiMJ
1mJEMxQ/OW13vnH94OhCPXs=
=0gyD
-----END PGP SIGNATURE-----

--nextPart4617543.XBUjI3XZtC--

--===============0821547862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0821547862==--

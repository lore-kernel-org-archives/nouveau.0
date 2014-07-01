From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau xorg driver - compile error
Date: Tue, 1 Jul 2014 21:47:46 +0200
Message-ID: <201407012147.46585@pali>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0045598125=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0045598125==
Content-Type: multipart/signed;
  boundary="nextPart6064645.cpxXmfAeA7";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart6064645.cpxXmfAeA7
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

nouveau xorg driver from master git repository cannot be compiled
on ubuntu precise. Here is build log:

https://launchpadlibrarian.net/179062836/buildlog_ubuntu-precise-amd64.xser=
ver-xorg-video-nouveau_1:1.0.10-git201407010817~ubuntu12.04.1_FAILEDTOBUILD=
=2Etxt.gz

Problem is somewhere in drmmode_display.c. Can somebody look at
it and fix compile error problems?

=2D-=20
Pali Roh=C3=A1r
pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--nextPart6064645.cpxXmfAeA7
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlOzEGIACgkQi/DJPQPkQ1LUwACaAsJy4WZf1OkcFWc0wcep3Zcw
aRIAn0zD1t52FJbQyZQtcnfBfks+ELNc
=CM0w
-----END PGP SIGNATURE-----

--nextPart6064645.cpxXmfAeA7--

--===============0045598125==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0045598125==--

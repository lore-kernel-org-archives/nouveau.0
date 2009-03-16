From: Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
Subject: Re: install nouveau in FreeBSD 8-CURRENT amd64
Date: Sun, 15 Mar 2009 22:18:37 -0500
Message-ID: <1237173517.18826.6.camel@balrog.2hip.net>
References: <312325d97d9810dfd7c4d9d7ffd6de9a.squirrel@cygnus.homeunix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1483178802=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <312325d97d9810dfd7c4d9d7ffd6de9a.squirrel-bzViLfiN5KH9SnoQui8ZVEEOCMrvLtNR@public.gmane.org>
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
To: Nenhum_de_Nos <matheus-jerQ8XtSt+hHp6+AxK4YsA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1483178802==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-WkI5/oM22F2q2pmZTXo1"


--=-WkI5/oM22F2q2pmZTXo1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, 2009-03-15 at 16:43 -0300, Nenhum_de_Nos wrote:
> hail,
>=20
> I'd like to try it in this OS, how to do ?
>=20
> I saw on http://wiki.x.org/wiki/Development/git some info, but I really
> need to rebuild all that ?
>=20
> from my ports dir, I got error:
> nv_dri.c:263:2: error: #error nouveau_drm.h does not match expected
> patchlevel, update libdrm.
> *** Error code 1
>=20
> Stop in
> /usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.=
20090129/src.
> *** Error code 1
>=20
> Stop in
> /usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.=
20090129.
> *** Error code 1
>=20
> Stop in
> /usr/ports/x11-drivers/xf86-video-nouveau/work/xf86-video-nouveau-0.0.10.=
20090129.
> *** Error code 1
>=20
> Stop in /usr/ports/x11-drivers/xf86-video-nouveau.
>=20
>=20
> and also that was a tar.bz2 from january.
>=20
> is there a easy way to have the new code to run in here ? I already got
> the latest code from git.

Right now, you either need to get libdrm from git, or apply one of the
patches from gnats.  I haven't yet done anything about fixing up the
ports.

robert.

> thanks,
>=20
> matheus
>=20
>=20
--=20
Robert Noland <rnoland-4LXSwLOGEL8@public.gmane.org>
2 Hip Networks

--=-WkI5/oM22F2q2pmZTXo1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (FreeBSD)

iEYEABECAAYFAkm9xQ0ACgkQM4TrQ4qfROOWYwCeKeXFxy7RJA/HC9Lb6W93mS+/
OgUAoIe/82N9LyGhthCTzYTrGwMZp2ZF
=kRUn
-----END PGP SIGNATURE-----

--=-WkI5/oM22F2q2pmZTXo1--


--===============1483178802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1483178802==--

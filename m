From: Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Introduction and discussion - Nouveau for Ubuntu Lucid
Date: Mon, 23 Nov 2009 10:43:29 +1100
Message-ID: <1258933410.29110.273.camel@Ed.Bebop.cooperteam.net>
References: <4B08B10D.7020409@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1258074450=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B08B10D.7020409-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
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


--===============1258074450==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-YauAsH2CMciNJReDKT3s"


--=-YauAsH2CMciNJReDKT3s
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2009-11-21 at 21:33 -0600, Steve Conklin wrote:
> Hi,
>=20
>   I've been following the list for a short while and scanned the archive.
> Apologies for missing any answers that were in the archive.
>=20
>   I'm the Ubuntu kernel team member focusing on graphics during the Ubunt=
u
> Lucid Lynx (10.4) cycle. At the Ubuntu developer summit last week, we mad=
e
> the decision to include Nouveau in the Lucid kernel.  I'd like to open a =
few
> topics for discussion with the Nouveau community:

Hi.  I (mostly) maintain the xserver-xorg-video-nouveau &
nouveau-kernel-source packages in Ubuntu & the xorg-edgers PPA.
I've obviously missed this session from UDS, but I also haven't noticed
anything about this on the ubuntu-x mailing list either.

What is the goal (and perceived advantages) of including the nouveau drm
with Lucid's kernel?  Is it to replace nv with nouveau as the default
DDX for nvidia chips?

The current situation, with a dkms-using nouveau-kernel-source[1]
package building nouveau.ko (and drm.ko & friends) has been useful in
the past, where the drm's ABI has changed and so updates to the DDX have
required lock-step drm updates as well.  This would be much more effort
if it required a full kernel update.  I'm not aware of any push for
further ABI changes, but I'm also not aware of any guarantee about ABI
stability, at least until the drm hits staging.

[1] Packaging in a bzr tree at
lp:~raof/nouveau/xorg-edgers-kernel-source

--=-YauAsH2CMciNJReDKT3s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iQEcBAABAgAGBQJLCcyZAAoJEBUHnPSAqAyglEsH/3GWHqrsIPtXbvZp5NUh+Zts
W+u1h4DonJ6zJqTBmw4aZ0dc0CywQZbkFjd9NSjKRbgxgSSlvkBA3x8Or4NSMi2D
fILdTFuZNpDhoKMZydB3LuBuP7Q38ZrRUEvFqgVbtKfB0pt0EV5E13HwB778DYYt
RLUTW3OBpuUVrsGNUJ0mEGwh5UTTStmN65cBfc2+JLzfnigTQIIVNz200I5GLCy4
UO3sOnFt9ubwFc13hoxhe1p7vKMuUTPjNXOj4e/1uTP801qMBxIRjndoED73R1dz
FNEqikKLNhU7ZygUACvRu4ODWLdgJeEdCRRQGv/PpFGVgMUNXKC0Sxb3BHvVcN4=
=yZrs
-----END PGP SIGNATURE-----

--=-YauAsH2CMciNJReDKT3s--


--===============1258074450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1258074450==--

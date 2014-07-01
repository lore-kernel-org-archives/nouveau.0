From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau xorg driver - compile error
Date: Wed, 2 Jul 2014 01:28:16 +0200
Message-ID: <201407020128.16732@pali>
References: <201407012147.46585@pali> <53B32AA1.5010705@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1850312487=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <53B32AA1.5010705-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1850312487==
Content-Type: multipart/signed;
  boundary="nextPart117033310.WcSabq8H19";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart117033310.WcSabq8H19
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tuesday 01 July 2014 23:39:45 Emil Velikov wrote:
> Hi Pali,
>=20
> If the future can you include the error message (plus a couple
> of lines of context) in the email ? Thanks.
>=20

Ok.

> Seems like the list* symbols got prefixed with xorg_ during
> the 1.12 development cycle (commit ca64912c02b), and your
> build uses 1.11.x.
>=20

Compilation failed with version 1.11.4.

> I'm using xorg-server 1.15 so cannot really test this but the
> attached patch should help. Can you give it a try ?
>=20

I tried your patch and now nouveau driver with it compiled=20
successfully. So thanks!

> Cheers,
> Emil
>=20
> On 01/07/14 20:47, Pali Roh=C3=A1r wrote:
> > Hello,
> >=20
> > nouveau xorg driver from master git repository cannot be
> > compiled on ubuntu precise. Here is build log:
> >=20
> > https://launchpadlibrarian.net/179062836/buildlog_ubuntu-pre
> > cise-amd64.xserver-xorg-video-nouveau_1:1.0.10-git2014070108
> > 17~ubuntu12.04.1_FAILEDTOBUILD.txt.gz
> >=20
> > Problem is somewhere in drmmode_display.c. Can somebody look
> > at it and fix compile error problems?
> >=20
> >=20
> >=20
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/nouveau

=2D-=20
Pali Roh=C3=A1r
pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--nextPart117033310.WcSabq8H19
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlOzRBAACgkQi/DJPQPkQ1L2VwCgtvr4C62oWJ6yWdaLwBFSuDlu
PFoAniPIh0sqQKvUFVe5NuYsIo+IWpE7
=M6K4
-----END PGP SIGNATURE-----

--nextPart117033310.WcSabq8H19--

--===============1850312487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1850312487==--

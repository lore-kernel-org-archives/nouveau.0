From: Soeren Sonnenburg <sonne-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: 2.6.33-rc8-git: nouveaufb hangs on boot on
	MacBookPro5, 3
Date: Sat, 06 Mar 2010 17:31:35 +0100
Message-ID: <1267893095.3456.16.camel@no>
References: <1266444104.6276.49.camel@no>  <20100221163022.GA3277@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0725380488=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100221163022.GA3277-OI9uyE9O0yo@public.gmane.org>
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
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0725380488==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-kahqa+JHg9zzs8iSkG9/"


--=-kahqa+JHg9zzs8iSkG9/
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-02-21 at 17:30 +0100, Marcin Slusarz wrote:
> On Wed, Feb 17, 2010 at 11:01:44PM +0100, Soeren Sonnenburg wrote:
> > Dear all,
> >=20
> > nouveaufb hangs on MacBookPro5,3 with PFIFO_INTR 0x04000000 - Ch1 when
> > booting in efi mode via elilo.
> >=20
> > I am attaching a (dirty) screenshot, maybe someone can clear this up
> >=20
> > http://sonnenburgs.de/media/bugs/nouveau_hang_2.6.33-rc8.jpg
> >=20
> > If there is anything else you want me to try, please say so.
> >=20
> > Soeren
>=20
> cc nouveau mailing list

no news :`-(

same hang happens with current git
 64ba9926759792cf7b95f823402e2781edd1b5d4 ...

Soeren
--=20
For the one fact about the future of which we can be certain is that it
will be utterly fantastic. -- Arthur C. Clarke, 1962

--=-kahqa+JHg9zzs8iSkG9/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAABAgAGBQJLkoNnAAoJEH82z1Wqh6p3Pi0QAK54tPI3wbFN1to4yAJ0g/lx
qzavvsXhr2oQP6SW/Z1Z3X7ZYEzZyecy7SIT87Og/fwBT0ZA+vhsE79j+Ax+qzOU
WEeZ4NkqaeDc8FaxkRqk7zrmYzb00MBQQ9h2/CfpAMyAJpCK3gDFuCQ8kbLH4bh9
eyAmq5OUV1c4xo/CAS98UOjVMyuo7x5CUkI+NemyttCvn0nJYCLVq9LbHio7B6Mn
yEJ7fJT+uJk/x7ibQP6QkCjAI3PDeVrqFROk1lULV8ibPL8Sftiy7761l9YfdPCV
eFUZ0nQ8YAWEecwehtwXkOWxu3dRVSk6CfniULiKazGuwSi4qfKPPstcaW3m8hR1
xuyGcW0VhLV1KLaDa20V/MT1p7vs6x9anlqKvqQ6wHkGqIwYnHxAfj8npIdGTws6
/QmWVnSCegIfAugZMBAo60G0KGbhL5mbugzsYogba2JEhv1ucSx/0Ju1N5TSdI6J
w4Dect4ASLSqxfjIqxeop5LPWNKCppO0uPgDEiLD9onBYkC7CL26gL/sxJaGSxSk
5ffRHD9IvBIdWGQSNvFZ72uo5ohHmuMUh+xPVWhotgmrDpoiBTSJBiPGEYooA4+R
t4oGmI5kRCCiEmLWo/1pgC7QAZdYIBkFhbQWRL9iWmmZoXMO5m736zDDkj3KNs6j
+ppkyqTdHROnhkDK+0ge
=YiB9
-----END PGP SIGNATURE-----

--=-kahqa+JHg9zzs8iSkG9/--

--===============0725380488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0725380488==--

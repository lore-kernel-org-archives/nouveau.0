From: Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Testing
Date: Fri, 01 Apr 2011 17:54:41 +1100
Message-ID: <1301640881.3759.5.camel@Ed>
References: <1301109372.2105.13.camel@delen>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209435637=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1301109372.2105.13.camel@delen>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Owens <doctormo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0209435637==
Content-Type: multipart/signed; micalg="pgp-sha256"; protocol="application/pgp-signature"; boundary="=-pPucKh8enP6Xu4PBAzT0"


--=-pPucKh8enP6Xu4PBAzT0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2011-03-25 at 23:16 -0400, Martin Owens wrote:
> Hello,
>=20
> I have two quick questions if you will indulge me:
>=20
>  1) What proportion of functionality is covered by 100% automated tests?

Hm.  Some :).

It depends on what you're interested in:
 *) mesa has the piglit test suite, which covers quite a lot of GL
functionality.  It tests quite a lot of things which aren't implemented,
though, so it's most useful at picking up regressions.
 *) There's the rendercheck suite for X rendering.  I've not used it.
 *) There's modetest (in the libdrm tree) for kms testing

>  2) What danger is presented to users who run tests?

A significant probability of X crashing or the GPU locking up.  I don't
think it's particularly more likely to physically damage hardware than
just using nouveau normally.


--=-pPucKh8enP6Xu4PBAzT0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABCAAGBQJNlXamAAoJEBUHnPSAqAygf/oH/in5nHfjRcaEeeGxoEbupSEF
GDLVuBm9s25jgamtNatrjDOAwDMKKDoHghVjwjcen+x/bj+hXchvKuXgkZ+VsHml
M8SQZVIzf3oX9C6PP0+NbDPcq7rMgf73YKgdBRStQL438b47EbUqW2bj3k+PNUOk
Zsccc/Ta4SGW0rxU61dEc+8ElaixTwhwA1yierrK9APAwuJ3s+IV/THp8AGdg7Gn
nQLWgmm0eoDM3tlBp47sNPozzCJMW1vWP6ZDvD1HBd8v4Q+Ld/xqdm/2JC8wbp6s
NRnQGWenA9fWTnoXCMW/r/ApvOzUdwIco9u5PbZ54+L+Qbk59L1KZJ5MN/Pj6cM=
=IxSR
-----END PGP SIGNATURE-----

--=-pPucKh8enP6Xu4PBAzT0--


--===============0209435637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0209435637==--

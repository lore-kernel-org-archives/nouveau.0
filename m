From: Lukasz Stelmach <stlman-IjDXvh/HVVUAvxtiuMwx3w@public.gmane.org>
Subject: sys-kernel/gentoo-sources-3.17.7 - nouveau driver fails
 at system resume - nouveau E[ PGRAPH][0000:01:00.0] PGRAPH TLB flush idle
 timeout fail
Date: Sun, 04 Jan 2015 11:32:09 +0100
Message-ID: <54A916A9.5040706@poczta.fm>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1560924395=="
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1560924395==
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="DTL0jguATXeOTvAQgu52V8r56Vpn92COU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DTL0jguATXeOTvAQgu52V8r56Vpn92COU
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I'd like to bring to your attention a bug report[1] I have filed
on the Gentoo bugzilla about a regression (quite an old one) in
the nouveau driver.

If there is anything missing in the report that could help fixing
the problem, please feel free to ask.

[1] https://bugs.gentoo.org/show_bug.cgi?id=3D534038
--=20
By=C5=82o mi bardzo mi=C5=82o.                   Twoje oczy lubi=C4=85 mn=
ie
>=C5=81ukasz<                                     i to mnie zgubi  (c)SNL=



--DTL0jguATXeOTvAQgu52V8r56Vpn92COU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUqRa0AAoJEAC2l2xjkdNxvKMIALFG4FS3E02n98S1YUM3eVmF
w8jzFHrCYMDhqNcqnnVMFd4bdr5uwTzXIys9+QU9ZDs8YRbuWz+uEafRWXuMu8yg
Mecyl2hXX47TzRnlVxr0LJ3txz4+UUJxLc+4BMenulAnm4wsxELazTuLagqiAtim
fni3TyPRz/RPOYlh8y6yCE06/IoHIjlFysndzSmYcnVF6NTTdEMdzvZnp4mxhyq/
LlEOthYOYmcyfJXlr/Ql74Vnhy9JBvnv97X/Mo1/8gWKTuD9VR8CH3KXvkU0Uw+r
UG8vYWQZS7aJDNMnSa5Wr2lM3BesBi03w/UzGh9LLGw/2n2/n+ner/I8UU280oA=
=nnhX
-----END PGP SIGNATURE-----

--DTL0jguATXeOTvAQgu52V8r56Vpn92COU--

--===============1560924395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1560924395==--

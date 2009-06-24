From: Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Out of tree nouveau.ko build.
Date: Wed, 24 Jun 2009 20:32:11 +1000
Message-ID: <1245839531.5592.12.camel@Ed.Bebop.cooperteam.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1332027531=="
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


--===============1332027531==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-MLpLgKIoRATqFp/OtkFL"


--=-MLpLgKIoRATqFp/OtkFL
Content-Type: multipart/mixed; boundary="=-eYLya9czus8/ug/xTykw"


--=-eYLya9czus8/ug/xTykw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

As a part of updating Ubuntu's nouveau package, I've been figuring
exactly how to build nouveau.ko from
cgit.freedesktop.org/nouveau/linux-2.6

A first and trivial pass at this is attached.  It doesn't do any
interesting kernel configuration checking; it just sets the right
include paths and calls out to make.

--=-eYLya9czus8/ug/xTykw
Content-Disposition: attachment; filename="Makefile"
Content-Type: text/x-makefile; name="Makefile"; charset="UTF-8"
Content-Transfer-Encoding: base64

aWZuZGVmIExJTlVYRElSDQpSVU5OSU5HX1JFTCA6PSAkKHNoZWxsIHVuYW1lIC1yKQ0KDQpMSU5V
WERJUiA6PSAkKHNoZWxsIGlmIFsgLWUgL2xpYi9tb2R1bGVzLyQoUlVOTklOR19SRUwpL3NvdXJj
ZSBdOyB0aGVuIFwNCgkJIGVjaG8gL2xpYi9tb2R1bGVzLyQoUlVOTklOR19SRUwpL3NvdXJjZTsg
XA0KCQkgZWxzZSBlY2hvIC9saWIvbW9kdWxlcy8kKFJVTk5JTkdfUkVMKS9idWlsZDsgZmkpDQpl
bmRpZg0KDQphbGw6IG1vZHVsZXMNCg0KbW9kdWxlczoNCgltYWtlIC1DICQoTElOVVhESVIpIEND
PSIkKENDKSAtSSQoQ1VSRElSKS9pbmNsdWRlL2RybSIgU1VCRElSUz1gL2Jpbi9wd2RgL2RyaXZl
cnMvZ3B1L2RybSBDT05GSUdfRFJNX05PVVZFQVU9bSBDT05GSUdfRFJNX1RUTT1tIG1vZHVsZXMN
Cg0KaW5zdGFsbDoNCgltYWtlIC1DICQoTElOVVhESVIpIENDPSIkKENDKSAtSSQoQ1VSRElSKS9p
bmNsdWRlL2RybSIgU1VCRElSUz1gL2Jpbi9wd2RgL2RyaXZlcnMvZ3B1L2RybSBDT05GSUdfRFJN
X05PVVZFQVU9bSBDT05GSUdfRFJNX1RUTT1tIG1vZHVsZXNfaW5zdGFsbA0KDQpjbGVhbjoNCglt
YWtlIC1DICQoTElOVVhESVIpIFNVQkRJUlM9YC9iaW4vcHdkYC9kcml2ZXJzL2dwdS9kcm0gQ09O
RklHX0RSTV9OT1VWRUFVPW0gQ09ORklHX0RSTV9UVE09bSBjbGVhbg0K


--=-eYLya9czus8/ug/xTykw--

--=-MLpLgKIoRATqFp/OtkFL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkpCAKAACgkQ+cDq7ALkfBahDACgvZwQ/RXOWBlUgM1mLKXiWjkv
AKIAn2N7fbobohns9HzLx/R+bukOqtW8
=IzUm
-----END PGP SIGNATURE-----

--=-MLpLgKIoRATqFp/OtkFL--


--===============1332027531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1332027531==--

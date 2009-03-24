From: Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] DDX fails to build with --with-kms=no set
Date: Tue, 24 Mar 2009 19:53:04 +1100
Message-ID: <1237884784.16009.15.camel@CowboyLaputopu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1484822874=="
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


--===============1484822874==
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-u0U6fx788Zij9wJqlliW"


--=-u0U6fx788Zij9wJqlliW
Content-Type: multipart/mixed; boundary="=-FxKH7CPAqMhMvP3IxNNN"


--=-FxKH7CPAqMhMvP3IxNNN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

In the recent implementation of dpms+kms, the --with-kms=3Dno codepath got
broken - pNv->allow_dpms was being used unconditionally, while this is
only defined when XF86DRM_MODE is set.

The attached patch guards these with ifdef.

--=-FxKH7CPAqMhMvP3IxNNN
Content-Disposition: attachment; filename="0001-Fix-with-kms-no-build.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-Fix-with-kms-no-build.patch"; charset="UTF-8"

RnJvbSA0NWE1YzU1YTMxOGNiMjhlYTQ0ZDdiZmIxOWQ5MTYwZGE0ZWVlODU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2hyaXN0b3BoZXIgSmFtZXMgSGFsc2UgUm9nZXJzIDxyYW9m
QHVidW50dS5jb20+DQpEYXRlOiBUdWUsIDI0IE1hciAyMDA5IDE3OjI4OjM5ICsxMTAwDQpTdWJq
ZWN0OiBbUEFUQ0hdIEZpeCAtLXdpdGgta21zPW5vIGJ1aWxkLg0KDQpDb21taXQgOThjOWU0ZWRi
NTgzNzRmMTgyNDllNWM5YzUzYjM5MmZiOGI0YTFkMSBpbnRyb2R1Y2VkIHNvbWUgdW5ndWFyZGVk
IHBOdi0+YWxsb3dfZHBtcyB1c2FnZSwgYnV0IHRoaXMgaXMgb25seSBkZWZpbmVkIHdoZW4gWEY4
Nk1PREUgaXMgZGVmaW5lZA0KLS0tDQogc3JjL252X2RyaXZlci5jIHwgICAgNCArKysrDQogMSBm
aWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9zcmMvbnZfZHJpdmVyLmMgYi9zcmMvbnZfZHJpdmVyLmMNCmluZGV4IGVjNDU3N2YuLmY3
OTE1YTggMTAwNjQ0DQotLS0gYS9zcmMvbnZfZHJpdmVyLmMNCisrKyBiL3NyYy9udl9kcml2ZXIu
Yw0KQEAgLTY4NCwxMCArNjg0LDE0IEBAIE5WRW50ZXJWVChpbnQgc2NybkluZGV4LCBpbnQgZmxh
Z3MpDQogCQkJcmV0dXJuIEZBTFNFOw0KIAkJTlZBZGp1c3RGcmFtZShzY3JuSW5kZXgsIHBTY3Ju
LT5mcmFtZVgwLCBwU2Nybi0+ZnJhbWVZMCwgMCk7DQogCX0gZWxzZSB7DQorI2lmZGVmIFhGODZE
Uk1fTU9ERQ0KIAkJcE52LT5hbGxvd19kcG1zID0gRkFMU0U7DQorI2VuZGlmDQogCQlpZiAoIXhm
ODZTZXREZXNpcmVkTW9kZXMocFNjcm4pKQ0KIAkJCXJldHVybiBGQUxTRTsNCisjaWZkZWYgWEY4
NkRSTV9NT0RFDQogCQlwTnYtPmFsbG93X2RwbXMgPSBUUlVFOw0KKyNlbmRpZg0KIAl9DQogDQog
CWlmIChwTnYtPm92ZXJsYXlBZGFwdG9yICYmIHBOdi0+QXJjaGl0ZWN0dXJlICE9IE5WX0FSQ0hf
MDQpDQotLSANCjEuNi4wLjQNCg0K


--=-FxKH7CPAqMhMvP3IxNNN--

--=-u0U6fx788Zij9wJqlliW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAknIn2sACgkQ/Aocxi8wZlHDGgCeM5Bi1ScF2H5bq6Gq3dQ+Omfq
lagAn10xKxlVA+04l/r7WWdklafWFgkc
=gvib
-----END PGP SIGNATURE-----

--=-u0U6fx788Zij9wJqlliW--


--===============1484822874==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1484822874==--

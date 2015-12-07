From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [libdrm v2 14/14] Bump version for release
Date: Mon, 7 Dec 2015 14:54:12 +1000
Message-ID: <566510F4.4070307@redhat.com>
References: <1448586173-8289-1-git-send-email-skeggsb@gmail.com>
 <1448586173-8289-14-git-send-email-skeggsb@gmail.com>
 <CAKb7Uvi-1B3_8gYsridtvnpgKBbi+tRB2BG8x00MpTjWDWrhxg@mail.gmail.com>
 <CAKb7UvipivXFeoDo4PkmKiMYiAJnpozswiXf_-8uEE=kG9zJwA@mail.gmail.com>
 <CAPM=9tymE4vBif0eEiDvY_D=6NEd6NHaLqwrQ9djAMDUnuExyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2112367192=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAPM=9tymE4vBif0eEiDvY_D=6NEd6NHaLqwrQ9djAMDUnuExyg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2112367192==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aRidlcv8s0ofn2aqpCnDlixj9MlqomgaX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aRidlcv8s0ofn2aqpCnDlixj9MlqomgaX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/07/2015 02:38 PM, Dave Airlie wrote:
> On 7 December 2015 at 14:24, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
>> Er hm, I guess if it never had external users, it's OK. And so then
>> old userspace should still work with new libdrm?
>=20
> That doesn't seem right.
>=20
> new libdrm shouldn't break old mesa.
Already mentioned to Dave on IRC, but nothing breaks here, the old ABI
is intact (I even tested it!).  The version bump is so future Mesa
patches can make use of the newer functions.

Ben.

>=20
> Dave.
>=20


--aRidlcv8s0ofn2aqpCnDlixj9MlqomgaX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWZRD0AAoJEHYLnGJQkpH79sEQAMJcmQSzDGCLY7YSg+Tn6+j5
sYI8wNXlWvO64DTaoePVpr4HhdqRTGsOB4CZ1dJcd7F3BVCJjjIzROCV0OPshXTU
ju+FS2DZGtzaon+U4kuji0Xyzu6nUB4wfKkqt0TCrnMAWdoyCQG7GFu4LGTBccIB
MmpX2AojHxXdrK3Nd2rt9FOeLCtyQ6iVYutaD0c9AXcqHxZDW1qVaDkadfyDUgEz
g5U+djFZAVXWXrnOsAnUR+YD9kJ2igNX6xw2387g/uu7/PGnY9B+6UJQPwU4+sda
6BlYGyoGeHRShSzW91k0mRw7kLYz36n5ZyhznwaeqvWOgkfeW/ETIaxO4l6JoBnP
V4KCt+1d+ZxQHZgsonzkM2dhrzaR8kwCwA8g/VOANbjoULasLg/CKbtKmhm+oVGn
1HrnP9o3aT/NmeslBQLEPbXIPPwhdxshRn6Lu60VwVE6t5LbDo/GMh+d1Z9r3eBx
X5ztSdjU6im+lP7B8Y5V9I1Fttjim5Z4omz7ZnN2MH8sjAsXM6yMJLyvSv1riLdb
gv4s8t5W5sBfTIW+Gcl0x2Cg0eFjnSyeuLcmevV2xVw7AA89HbuWzdD1beTXgfH1
dG4LXV6Divm6GqJAQZX6+kcfl1tf/R9gHuLHtUWqKDIU8ezw+75xy0uwDGN8qWMB
2lBMzJYkqkBxCYH7jikn
=7ESC
-----END PGP SIGNATURE-----

--aRidlcv8s0ofn2aqpCnDlixj9MlqomgaX--

--===============2112367192==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2112367192==--

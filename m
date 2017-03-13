From: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [ANNOUNCE] xf86-video-nouveau 1.0.14
Date: Mon, 13 Mar 2017 05:47:50 +0100
Message-ID: <1489380470.10993.2.camel@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0463251476=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: xorg-announce-go0+a7rfsptAfugRpC6u6w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0463251476==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5V1KeF0iRJ7rrGhPEaOx"


--=-5V1KeF0iRJ7rrGhPEaOx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ilia Mirkin (7):
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exa: add GM10x acceleration support
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hwdefs: update nvc0_3d, add gm107_textu=
re for new TIC format
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvc0: make use of the new hwdefs for TE=
X_CB_INDEX
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvc0: rename BEGIN_IMC0 to IMMED_NVC0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nvc0: refactor TIC uploads to allow dif=
ferent specifics per generation
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0copy: add maxwell/pascal copy engine cl=
asses
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0recognize and accelerate GM20x

Lyude (2):
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Consider CRTCs disabled when DPMS is of=
f
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Bump version to 1.0.14

git tag: xf86-video-nouveau-1.0.14

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1=
.0.14.tar.bz2
MD5:=C2=A0=C2=A0c57c89e1a3c9bc319d26f2e11c80e7fb=C2=A0=C2=A0xf86-video-nouv=
eau-1.0.14.tar.bz2
SHA1: 6c5c46d6e0d8595b71e2a1df6879ab5d650f2097=C2=A0=C2=A0xf86-video-nouvea=
u-1.0.14.tar.bz2
SHA256: 4ddff99b3cc49f16cdcf99f6e1c5856b6f06589ec98376cedb5754100afe31c1=C2=
=A0=C2=A0xf86-video-nouveau-1.0.14.tar.bz2
PGP:=C2=A0=C2=A0https://xorg.freedesktop.org/archive/individual/driver/xf86=
-video-nouveau-1.0.14.tar.bz2.sig

https://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouveau-1=
.0.14.tar.gz
MD5:=C2=A0=C2=A0caf49bd019afc33474737ec05e315e57=C2=A0=C2=A0xf86-video-nouv=
eau-1.0.14.tar.gz
SHA1: c0f174fe286a0ecb81e3f34c0df0e2f58889b8f7=C2=A0=C2=A0xf86-video-nouvea=
u-1.0.14.tar.gz
SHA256: c0a944b5f1a2b8a3f2937c44d99edfbd5488350f3017d9c6da06dcc99d0ed6e0=C2=
=A0=C2=A0xf86-video-nouveau-1.0.14.tar.gz
PGP:=C2=A0=C2=A0https://xorg.freedesktop.org/archive/individual/driver/xf86=
-video-nouveau-1.0.14.tar.gz.sig
--=-5V1KeF0iRJ7rrGhPEaOx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJYxiR2AAoJEMVGn7h1j5wrHgsP/RTrtq8Xn2a3e0qlUKY04mWK
g08phFSwYBw/ZAk1c35UB7YY7lAOT1WD4Uu/rRuVF7OFBQYUPO4EMHDyI1onHL5X
ctDEEXpIJAy4H7aIdk8aJ2NzyD+SlzC8lJ8fSO6u3tuUWTyy0bGd2WaYWRjNNVtS
0RdmQZeswr8pYuSqbCN6WNscC4qewcmEZwUq3tXKOMXOjP6NAwB/02TwQuYla0hR
q5mecRW8uuy7N0zXGk59a4W3pRp+AE39W9vlMA0p7OIvr1UCYb63ytowTKiE5KsD
Awj8Md6nNG/vScCV3IFKAs8zxUyEiCyUSldH0TRBxh++n018n0aoK5jAIzYDW7RO
DlUjb+CypNJyW3YkBVbLF0hFb6U5K1G9PNHukTh1Yuc92noyiHQQ59AzyMqFTUej
c/ebwvR1hdrCdeZvf/ot/uR8VMe+2Ou0eIlE42I7N4wl7WPQBy96fuV+SmT1y07m
b2Efon4ueXPxuu8AwGZyGZulyth/OKr/kwtWN1m9eKzF5orFMl3LPBRI8JX/sYSw
AHRigF4Rt2IileMk+DDNsbwiO/h41ltxo6PPgTFoOxnxXPRhEIGejiiwyjZsa1u6
m/H9BW0y1TPtKiLr41exxDEKFIDgD5AgMsb70ohCChbHQsnzpRrcmBwAp84y6KlL
+U/CakEgK/NcNk02GOC6
=sQLx
-----END PGP SIGNATURE-----

--=-5V1KeF0iRJ7rrGhPEaOx--


--===============0463251476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0463251476==--

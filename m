From: =?UTF-8?Q?Jean-S=c3=a9bastien_P=c3=a9dron?= <dumbbell-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Subject: Re: Nouveau for FreeBSD
Date: Wed, 4 Nov 2015 11:56:59 +0100
Message-ID: <5639E47B.1020704@FreeBSD.org>
References: <01e201d11694$9fb0a5a0$df11f0e0$@verizon.net>
 <20151104070855.5476436.86664.54094@pathscale.com> <5639C2E4.7030104@free.fr>
 <CAOnawYrES9c8ZDSDbSrcvSbacn2ftCHUS0r4z9PXm6AL+mtZWQ@mail.gmail.com>
 <5639C587.2010904@free.fr> <20151104095833.GA3908@Normandy>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1484490525=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20151104095833.GA3908@Normandy>
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
--===============1484490525==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="CprsmgWLEC1Qnaif5X2jTpniOn5tTkn9m"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CprsmgWLEC1Qnaif5X2jTpniOn5tTkn9m
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04.11.2015 10:58, Pierre Moreau wrote:
> Wasn't there some work being done by Fran=C3=A7ois Tigeot or Jean-S=C3=A9=
bastien P=C3=A9dron
> to port Nouveau to DragonFlyBSD/FreeBSD? Or at least they were talking =
about porting it
> at XDC 2014, no idea what the current status is.
>=20
> Pierre
>=20
> PS: Looking at Fran=C3=A7ois' slides from this year XDC, it seems there=
 isn't much
> progress about it.

Hi!

Pierre, you're right, and the same applies to FreeBSD: nobody started to
work on this.

I will let Fran=C3=A7ois comment for DragonFly, but on FreeBSD, our probl=
em
is that the diff with Linux was too large to do an easy port of a
driver. This was fixed in DRM core earlier this year, and I'm about to
finish an update to i915 which is the last part to finally have a small
diff with Linux. At that point our entire DRM subsystem will correspond
to Linux 3.8 (minus dma-buf).

At that point, it will be far easier to contribute to FreeBSD. As Martin
said, TTM is already ported so I believe everything is in place to port
Nouveau.

In the coming months, the goal will be to bring our DRM subsystem to
match Linux 3.9 then 3.10, etc. I personnally have no plan to work on
Nouveau for the time being because the i915 and Radeon drivers are
enough to keep me busy. However, we would welcome any contributions!
People are asking about this on a regular basis, so please contact me if
you are willing to work on this.

Soon, we'll see Tux proudly holding a trident in the logo! :)

(Don't get me wrong, I love the current logo)

--=20
Jean-S=C3=A9bastien P=C3=A9dron


--CprsmgWLEC1Qnaif5X2jTpniOn5tTkn9m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJWOeR7XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ2NzA4N0ZEMUFFQUUwRTEyREJDNkE2RjAz
OUU5OTc2MUE1RkQ5NENDAAoJEDnpl2Gl/ZTMYGcP/3UoyjTPiKUS1n4u5MroOVP2
pUc3xSForBYCtclyMghWWVMtN4RkaHCh1C7UMcKyxEMKLVSsbbbPDk5oAvaz13sh
DmuBya5H66buQZZfNIBHhclFpp7d+ZoOvVo+gIRLHZND92DIPR21XGHxL0x4Gnzt
x2OUGOPyZleZ2UljSKIjt1Zfjy+Kgas2Co5Phx0JPAO9hP4JGi61qkyxldzAu2Ze
IGQG7G6ccbBQh8ly+//AguKcFAC07P8b6vGBCzr2WqyiYsyoX3RY3TYKq7QpkLXv
DySu9npqUmQLp+9u4XZR0Zaw4as4pE5/3KtXNxbdNq3HL0m0w0Fg40hVmz3ozZET
ejCKBU8Ye+z1PKaEaLLrCqj3ew9PP+t0z3L4BSFwvNxqD16IQdvG3CO0wHaAAlw5
nmukbDGLcxneIbTN5Ql6DewBC1npk3awd7lYbcUuWYXB3nZ8EoilzDlbGMPTyfLD
Pxri8ojgHKpGoQ+cSYCIehVJCWESL/05ZxdlQ4S4HcqMVZe1iaFlS+wa5/oXGsx/
CJgbGtaEJrx6N1YmaK064WvYsp+ApKb8XW3v+eUffbw6KvWp1UAjR+q97Fl11GU/
CSZpsHJCXF+PTyDaDRaF36J3DfYBIxoA4Cy79jCHCn7kY3atY09b07HscWSGycu8
m35+KnMSYY9LCArYh0x/
=5Ici
-----END PGP SIGNATURE-----

--CprsmgWLEC1Qnaif5X2jTpniOn5tTkn9m--

--===============1484490525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1484490525==--

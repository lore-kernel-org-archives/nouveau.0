From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [ANNOUNCE] xf86-video-nouveau 1.0.12
Date: Thu, 10 Dec 2015 16:00:31 +1000
Message-ID: <566914FF.30407@gmail.com>
References: <1449714365-9359-1-git-send-email-airlied@redhat.com>
 <CAGfK2pd-hagnOoT9VUVW2wbq0X4_NSWF_F5jcY5UOhj1ub7huA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1762340513=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGfK2pd-hagnOoT9VUVW2wbq0X4_NSWF_F5jcY5UOhj1ub7huA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
--===============1762340513==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Drkl6K5tRRXEN130v4GVgJKAfLS7Ipsq7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Drkl6K5tRRXEN130v4GVgJKAfLS7Ipsq7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/10/2015 12:31 PM, Craig Garner wrote:
> What Fedora release is this going to make it in to?  Is it going to be
> in FC23?  If so, I'll give it a test.  I would like to be able to
> upgrade again :)
It's been submitted for F23 and Rawhide.

Thanks,
Ben.

>=20
>=20
> On Wed, Dec 9, 2015 at 9:26 PM, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> <mailto:airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>> wrote:
>=20
>=20
> New nouveau DDX release.
>=20
> Ben Skeggs (1):
>       Bump version to 1.0.12
>=20
> Ilia Mirkin (14):
>       copy: don't bother trying to create copy on pre-nva3
>       allow path to envyas binary to be specified
>       kepler: remove unnecessary texbars, add live-only tex for nvf0
>       use defined method names where available
>       nv50: explicitly disable ZETA buffer
>       Check before trying a solid fill
>       nv04-nv40: don't attempt to do 32-bit shifts
>       older hardware prefers copy to clear, so use that
>       nv50/exa: add comments showing the code that makes up the program=
s
>       Avoid build fail without COMPOSITE
>       glamor: remove
>       remove maxwell GM10x support for now
>       xv: use correct max width/height settings
>       fix build after glamor removal
>=20
> Maarten Lankhorst (13):
>       enable dri3 support without glamor
>       move down call to nouveau_present_init until after fb init.
>       fix crash in nouveau_glamor_set_shared_pixmap_backing
>       fix !DRI3 case
>       rework initialization to prevent some crashes
>       check memory allocation in
> nouveau_glamor_set_shared_pixmap_backing
>       fix null pointer deref
>       Make the ddx load with platform devices
>       Use the correct class and shader ops for GK20A.
>       Use drmGetRenderDeviceNameFromFd to obtain the dri3 node.
>       Simplify nouveau_allocate_surface's pitch calculation.
>       Try using EXA ops harder in drmmode_fbcon_copy fallback
>       Actually do a clear instead of doing a bogus copy.
>=20
> Mario Kleiner (3):
>       present: Fixup return type of nouveau_present_init()
>       Add Option "DRI" to allow selection of maximum DRI level. (v2)
>       Take shift in crtc positions for ZaphodHeads configs into account=
=2E
>=20
> Samuel Pitoiset (1):
>       fix a wrong use of a logical operator in drmmode_output_dpms()
>=20
> Vadim Rutkovsky (1):
>       Adapt to new dirty tracking api
>=20
> git tag: xf86-video-nouveau-1.0.12
>=20
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouvea=
u-1.0.12.tar.bz2
> MD5
> <http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouve=
au-1.0.12.tar.bz2
> MD5>:  dc79910c7b9e32321cefc7af250c7765=20
> xf86-video-nouveau-1.0.12.tar.bz2
> SHA1: 480a8e1da05683e9bbedba61885cd56e7623bc00=20
> xf86-video-nouveau-1.0.12.tar.bz2
> SHA256:
> 0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e=20
> xf86-video-nouveau-1.0.12.tar.bz2
> PGP:=20
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouvea=
u-1.0.12.tar.bz2.sig
>=20
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouvea=
u-1.0.12.tar.gz
> MD5
> <http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouve=
au-1.0.12.tar.gz
> MD5>:  5dfbc08933f2db994b2e100b9c49f480=20
> xf86-video-nouveau-1.0.12.tar.gz
> SHA1: c0ad3ccdfab29c43d2477400069e40c54c848e29=20
> xf86-video-nouveau-1.0.12.tar.gz
> SHA256:
> b82ed744e3431d077c54516d8447da292a9028b1b1ce1055a2062807b08c24b6=20
> xf86-video-nouveau-1.0.12.tar.gz
> PGP:=20
> http://xorg.freedesktop.org/archive/individual/driver/xf86-video-nouvea=
u-1.0.12.tar.gz.sig
>=20
>     _______________________________________________
>     Nouveau mailing list
>     Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org=
>
>     http://lists.freedesktop.org/mailman/listinfo/nouveau
>=20
>=20
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>=20


--Drkl6K5tRRXEN130v4GVgJKAfLS7Ipsq7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWaRUDAAoJEHYLnGJQkpH7MlcQALZwiFjTRSgggeLkzywh586u
gPtm8V8S4aHSBJgGtI1FNoHwbr541SDsO1IGsIeCg2v25Lj5pXdUpK8oLGBGFC7W
r2AcGmRDkS32PTibBDOnhig1GTEMHHWCqOmAKw3oBDP5xYsFrhoIWflXO/RSMsfO
KClwjAJ67oXvc/BBBkt0irqoLGMi0DaioAGz3qSALXEMYjXG4e3msnxPJWIFbKQR
Yoi0B9eotiVZsld0+C904UdAXeakWVa9jnENfkn1uU0VL4uY2KqjMXVXcBo3yr2o
tbX3NQnJt2zE/7p0IxkHoMHraKCM73dLzt6VsqeWsxJuziUh22xghHkkVrAsFjlH
ZiYce1X+SNGeWi20NvS3ZxPi3WWhp6S1qJ8w8mkQ0WuqEowJDo2HEP2pFEwq+s5B
0GBYcRNAfXtbsOE/HQbe4Rh7F3TRaSZdq5tWrd45x3uz3N7M4VjRU/LWJiIsPKSL
TaeDxPYPMFBUHG4pD+Ske1XBsFIqVjp7KjAoblXuTgBFOm6qa3t79S8km6nMFSg1
JZ8veUXIwTRs7lczgKF+JauCxDwkTmD11BmtrQj0K0kBTBHGEc5iqxAtN2gUH3NF
58VwKV3EkN6mfCO/Iomh5qzHka/UzSHwVMsx7r8JKQwmIO1uNwKJ3KrImKtF4qYx
ysJw53RMZ8vHhjfN4k22
=MAFp
-----END PGP SIGNATURE-----

--Drkl6K5tRRXEN130v4GVgJKAfLS7Ipsq7--

--===============1762340513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1762340513==--

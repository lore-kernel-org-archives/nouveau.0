From: =?UTF-8?B?SmVhbi1Tw6liYXN0aWVuIFDDqWRyb24=?= <dumbbell-HZy0K5TPuP5AfugRpC6u6w@public.gmane.org>
Subject: Re: (Free)BSD support?
Date: Fri, 07 Nov 2014 10:06:06 +0100
Message-ID: <545C8B7E.3090508@FreeBSD.org>
References: <397bff86faf5fab73830fe01bdefbe40@ultimatedns.net>
 <545BD2D4.2000300@gmail.com>
 <25816c50da8ffab03f170a71055ba3ff@ultimatedns.net>,
 <CAPM=9tyCU3-yF+oQ7xPLA-0tfAbyjojG-eZXZo_1e7UTy7eiMg@mail.gmail.com>
 <c83ef171f859f35611d7c9229d5e874a@ultimatedns.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1750330491=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <c83ef171f859f35611d7c9229d5e874a-kXB7xIAHHG1poJpnivc+mw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Chris <nouveau-uqy9GaD9SVlWk0Htik3J/w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1750330491==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="rTgJrt02bUGPSij1xbHuun9kcfo2KFeTn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rTgJrt02bUGPSij1xbHuun9kcfo2KFeTn
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 07.11.2014 03:22, Chris wrote:
> On Fri, 7 Nov 2014 12:11:08 +1000 Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote=

>> this is a kernel driver that needs porting, not just a userspace drive=
r,
>> there are no userspace drivers anymore. porting the X.org userspace
>> driver is required but not sufficient.
>
> Indeed. I _think_ I understood correctly. I can't envision any _real_
> problems. If I understand correctly, it'll be a matter of creating a
> kernel module for the BSD platform, and making it loadable (kldload,
> in BSD speak). Which will allow it to work with the resources made
> available to the kernel (hardware). In fact it should be even easier,
> given that there is a Linux ABI available on BSD which even nVidia
> makes use of, with the blobs they provide.
> Do I seem on track?

Hi!

The Nouveau kernel driver is close to the Radeon kernel in terms of
DRM/TTM infrastructure requirements. We have that working in FreeBSD.

So the task consists of:
    1. Taking Nouveau from Linux, preferrably 3.8 to keep our DRM code
       on the same base (so we can update the whole consistently).
    2. Adding the source files to the FreeBSD kernel
    3. Start the porting effort: the locking primitives, the PCI API,
       how memory is allocated, etc. are different compared to Linux.

It's probably not that difficult to do, however, it needs time. I would
recommend to not start this effort right now: we are in the process of
updating the DRM device-independent code to match Linux 3.8.
Furthermore, I'm preparing a proposal to have some sort of Linux kernel
API wrapper above FreeBSD facilities to reduce the diff with Linux and
help with porting new drivers.

--=20
Jean-S=C3=A9bastien P=C3=A9dron


--rTgJrt02bUGPSij1xbHuun9kcfo2KFeTn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJUXIuEXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQ2NzA4N0ZEMUFFQUUwRTEyREJDNkE2RjAz
OUU5OTc2MUE1RkQ5NENDAAoJEDnpl2Gl/ZTM/SsQAIWQfx09UApDsy9xLQd+iAoj
fq3vIT9CTP7hNgPVFo8v28xfNRUcn7w4BByUPMb26/Jj9SXhbYyY+GuSRhOCUR7F
q4js/a39byF5TxwAFYQNsGx+a8gz7JILv2p9IYHE1jLHd5ds7bUC10TV0HLAn1Tp
OWmbM89ziOwx2jdoUbi8j2cV5Jvhee653IMRCZwbIvq4rrtwgp7P+W4mqPyMwK0E
5wxSATEZ4HEC9iSFXzB2KzEtrSczI6uQ24bVrLkPmCwIMv8ApCxb6ei0aHiFbo4J
xdLunNtK5yoUF9c8sPnlSAoueuvJkVIOCtlpfaQdRyknuocrF9ncNrHeJfRmkS93
M0d5P/r63TjEJtTuCVUqdUXB5rGKm59OKqPJ4zuM5Z/GDstra4IBn16RGrmFvLe4
1mGP3pzXuA2WuIrMKxUNqUkXAyDKi2nNdybaMIxJcC8O6rFCXW1sFdREOwkKSyvv
WI1h6MGG0SgU3am1xBfeS42oCeUy7tHLV56CR/7112gTt3bqk9ZEN8u5WLZrp/+H
llJkhnFvguY1+wUQuU1Fgw8SI1H91xdgudzRCVtXxktp87TICIKgoVcOlncUntbD
VY4xnFol0FiWdyqrsyYvcqQ8+R7QCvoBrIrDcvy1kfTmS9yNFaIxwvr1eX8wUvsL
KaxZLQo4dA3a8Qih4Qei
=EztY
-----END PGP SIGNATURE-----

--rTgJrt02bUGPSij1xbHuun9kcfo2KFeTn--

--===============1750330491==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1750330491==--

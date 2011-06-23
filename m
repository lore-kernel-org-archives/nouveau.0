From: Maze <maze@pkbd.org>
Subject: Bug#631337: xserver-xorg-video-nouveau: excessive fan speed on GeForce 9600GT
Date: Thu, 23 Jun 2011 02:11:08 +0200
Message-ID: <20110623001108.GA7583@sherka.no-ip.biz>
Reply-To: Maze <maze@pkbd.org>, 631337@bugs.debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <bounce-debian-bugs-dist=glddb-debian-bugs-dist=m.gmane.org@lists.debian.org>
Resent-To: debian-bugs-dist@lists.debian.org
Resent-Message-ID: <handler.631337.B.13087878782355@bugs.debian.org>
Content-Disposition: inline
List-Post: <mailto:debian-bugs-dist@lists.debian.org>
List-Help: <mailto:debian-bugs-dist-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-bugs-dist-request@lists.debian.org?subject=unsubscribe>
To: Debian Bug Tracking System <submit@bugs.debian.org>
Cc: nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Package: xserver-xorg-video-nouveau
Version: 1:0.0.16+git20110411+8378443-1+b1
Severity: important
Tags: upstream patch


I own a GeForce 9600GT video card. The issue I've always had with this
card is that the fan speed remains at 100%, generating approx. the same
noise as a 747 during take off.

My loud beast is enrolled by the following ID:
02:00.0 VGA compatible controller: nVidia Corporation G94 [GeForce 9600 GT]=
 (rev a1)

It is only when I have an X server started with the nvidia module loaded
that my GPU fanspeed falls down to a reasonnably noisy and otherwise
adequate 35%.

The following situations leave the card at 100% fan speed, with (to my
knowledge) no easy way for the user to remedy:
- no driver loaded
- nvidia module loaded and X not started
- nouveau loaded and X started
- nouveau loaded and X not started

Now, after two years of living with it, I found a way to fix it!

In order to get a fan speed of 35%, you need to have the following
values in your GPU registers:
NV_E100 (0xe100): 00001b00
NV_E11C (0xe11c): 0000021c
NV_E120 (0xe120): 000000bd

Instead, what I normally get when using nouveau is the following:
NV_E100 (0xe100): 00001900
NV_E11C (0xe11c): 00000001
NV_E120 (0xe120): 00000000

This is not a patch but rather a workaround. It'd be =C3=BCbercool if
freedesktop could integrate that to nouveau so that my GPU fan speed is
adjusted when the driver is loaded. The proprietary driver only does it
when X is started, which is not the good way to go, so you could have it
right when they don't.

E11C and E120 are PWM registers for fan current supply which you
probably know about. Don't ask me about E100, I found it by comparing
the register content in cases where it works and cases where it don't.

I'd be interested to know if someone else owns a 9600GT and uses it
without the same issue in GNU/Linux. By googling I found out that quite=20
a few people are suffering from excessive fan noise issues with this=20
chipset in other OSes.  Once I talked to a guy on a forum who said he=20
had exactly the same issue with a 9600GT on GNU/Linux.

Regards,

--=20
Maze
http://www.pkbd.org

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOAoScAAoJEPtv9OGFsrEp3NgIAMgPtWto/Y06r3943sdjcDYR
JIR8CpZWPPXFhVI3k2SvJgwnKel4T3/hG8Xbu8k/qtm8kEgsL2kyTBfxwASUe0Jw
XMP3rV/IPnW9Mq5ttkFcTu316WcK4wgUJCMgAxH6B1a4RCeEOC+FuMHBmxi/rTo7
zsej/mr8RoXZB/x4nDMj77q25o0TO99IhDZebbrQwuelPrusWlVF14LtkNe4ZG6X
JJtLrZjRhHZNoA4I7EVNhjoQFMAo/qzLH2xq032gDcLGArJd+4xkkQj7J/wnSCpw
GkEyEJ1XsJ0Ms3ytw2l4AZUdTF6x1R+mQE88Md+xZTFq7PVR7QlCcTzYWdFEN2w=
=gyOR
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--

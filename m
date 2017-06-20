From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: Fwd: [Bug 99900] nouveau: freeze / crash after kernel update to
 4.10
Date: Wed, 21 Jun 2017 06:51:46 +1000
Message-ID: <d9132312-d174-a5d3-ff2b-56855266ccf7@gmail.com>
References: <bug-99900-502@http.bugs.freedesktop.org/>
 <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0737080241=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Olof Johansson <olof@lixom.net>, DRI mailing list <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, bskeggs@redhat.com, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0737080241==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iFh3hoS3bNpIArN0hrO5EqOnmpSo4Wqsq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iFh3hoS3bNpIArN0hrO5EqOnmpSo4Wqsq
Content-Type: multipart/mixed; boundary="M36XAOm4HoO3eSli338m9Ut0bGIArEAN3";
 protected-headers="v1"
From: Ben Skeggs <skeggsb@gmail.com>
To: Olof Johansson <olof@lixom.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org
Message-ID: <d9132312-d174-a5d3-ff2b-56855266ccf7@gmail.com>
Subject: Re: Fwd: [Bug 99900] nouveau: freeze / crash after kernel update to
 4.10
References: <bug-99900-502@http.bugs.freedesktop.org/>
 <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>
In-Reply-To: <CAOesGMiES49o_Xt1GxsUj7+hivhcwdFECv8QfqiQqZjO57oj6w@mail.gmail.com>

--M36XAOm4HoO3eSli338m9Ut0bGIArEAN3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 06/21/2017 02:54 AM, Olof Johansson wrote:
> Hey,
>=20
> This was reported back in February and it seems nobody's given a shit?
>=20
> I've got a machine here with a Quadro 4000 that the screen locks up on
> every single time the monitor goes to sleep. Userspace is Ubuntu 16.04,=

> kernel is recent mainline (4.12-rc4+). It's been happening since 4.10
> though.
>=20
> Can we please see this fixed by 4.12? It's an enormous regression and a=

> major hassle to deal with as a user.
I'm not sure how exactly it could be related to the PBDMA errors, but
the "flip queue failed" is a bug in the 2D driver that got fixed in
xf86-video-nouveau-1.0.14.

Ben.

>=20
>=20
> -Olof
>=20
> ---------- Forwarded message ----------
> From: ** <bugzilla-daemon@freedesktop.org
> <mailto:bugzilla-daemon@freedesktop.org>>
> Date: Wed, Feb 22, 2017 at 4:03 AM
> Subject: [Bug 99900] nouveau: freeze / crash after kernel update to 4.1=
0
> To: dri-devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop=
=2Eorg>
>=20
>=20
> Bug ID 	99900 <https://bugs.freedesktop.org/show_bug.cgi?id=3D99900>
> Summary 	nouveau: freeze / crash after kernel update to 4.10
> Product 	DRI
> Version 	XOrg git
> Hardware 	x86-64 (AMD64)
> OS 	Linux (All)
> Status 	NEW
> Severity 	normal
> Priority 	medium
> Component 	DRM/other
> Assignee 	dri-devel@lists.freedesktop.org
> <mailto:dri-devel@lists.freedesktop.org>
> Reporter 	krah.tm@gmail.com <mailto:krah.tm@gmail.com>
>=20
> Created attachment 129823
> <https://bugs.freedesktop.org/attachment.cgi?id=3D129823> [details]
> <https://bugs.freedesktop.org/attachment.cgi?id=3D129823&action=3Dedit>=

> dmesg 4.10 - fifo write fault
>=20
> After release of 4.10 kernel i've used that one from here:
>=20
> http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/
> <http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/>
>=20
> with my ubuntu trusty LTS.
> Xorg is now crashing whenever my monitors are going to sleep (happens a=
lways in
> my lunch time) - after returning its crashed and i need todo a hard res=
et to
> get the gpu running again.
> This is what is printed to dmesg when this happens (machine is still wo=
rking
> via ssh):
>=20
> [11010.813785] nouveau 0000:01:00.0: fifo: PBDMA0: 04000100 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 5 mthd 001c data 00000001
> [11010.813815] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 0010 data 00000000
> [11010.813838] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 0014 data 0001b020
> [11010.813864] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 0018 data 003c9310
> [11010.813886] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 001c data 00000002
> [11010.813905] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 0020 data 00000000
> [11010.813919] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 3 mthd 0200 data 000000cf
> [11010.813937] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 3 mthd 0204 data 00000000
> [11010.813954] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 3 mthd 0208 data 00000010
> [11010.813973] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 3 mthd 020c data 00000001
> [11010.813990] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 3 mthd 0210 data 00000000
> [11010.814014] nouveau 0000:01:00.0: fifo: PBDMA0: 04000000 [] ch 2 [00=
1fcc0000
> Xorg[2593]] subc 0 mthd 0010 data 00000000
> [11010.814060] nouveau 0000:01:00.0: fifo: write fault at 000169b000 en=
gine 00
> [PGRAPH] client 0f [GPC0/PROP] reason 02 [PAGE_NOT_PRESENT] on channel =
2
> [001fcc0000 Xorg[2593]]
> [11010.814070] nouveau 0000:01:00.0: fifo: gr engine fault on channel 2=
,
> recovering...
>=20
>=20
> Xorg.log does have that:
>=20
> [    42.993] (WW) NOUVEAU(0): flip queue failed: Device or resource bus=
y
>=20
> Trying to restart Xorg is unsuccessful.
>=20
> [  8810.799] (WW) NOUVEAU(0): flip queue failed: Invalid argument
>=20
>=20
> This does not happen with 4.9.6 i've running now.
> Anything i should/can provide or try to get this fixed?
>=20
> -----------------------------------------------------------------------=
-
> You are receiving this mail because:
>=20
>   * You are the assignee for the bug.
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop.org=
>
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> <https://lists.freedesktop.org/mailman/listinfo/dri-devel>
>=20
>=20
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20


--M36XAOm4HoO3eSli338m9Ut0bGIArEAN3--

--iFh3hoS3bNpIArN0hrO5EqOnmpSo4Wqsq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEETp/uv2nr9kIVth0/dgucYlCSkfsFAllJiuIACgkQdgucYlCS
kfvcsQ/+IKu8+Uu6JUlN92afYGyY1/UTPyCrsojUfPgsbtWPA0oyRBAh8nNdYznw
qoMTiXqFEYWZxfpbEqxa1e37zD4djixvtm40qc+mimyTnX+KBUgJruWB0ToHLQoT
UqLDotF9Ms24WpTS8btbKwW3N7CTnk84fcwRh8xd8f6bRz8ULySKeDWDPv1GiosT
YPNaitxbea9E7msNCknO/aV5udf5VClOhR2sC30Z+5o8lUiUWJUUZHvbOTm9Lt/4
k24NIzPCc/KPSJwXyl1SfdaxopMZ1Ml47lBdVz5PW/xDXtjS91LxlYRQhslovDiA
ZDn+PH7BTuqC1Su3LV77su0BB38RF1T4PqtBEuio1GvwHXwXjll6x0nmOlmz298j
5qxbENm9xYv4r/0r4Pq4pn2vWs5nIHUnJQ2BA+JVrGfyqUvqf9dzq9i5xfG0MuA9
1qPwzqvXkBxHlW77cTZSvwegIE3RJaNhCyUicJyMVWHjaLhSva7lfnlNqHT8WSl5
01vYBmsKgFmT9OdKWh29fFTM7U9LNcNgTqbm3USkQgDWHOtVz5dYIYgNY/T0YlDo
l7gYvozZgzMaWKNh367e6Ech8u702FLWn4wIMpuhEj6B2gIsAfZTzd4zHn5NQ/ov
pf0A1beSQ9UDCGM+Clp9j9BoRHGMH660PPkpD0a4kjs6B6gzF0w=
=tUaX
-----END PGP SIGNATURE-----

--iFh3hoS3bNpIArN0hrO5EqOnmpSo4Wqsq--

--===============0737080241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0737080241==--

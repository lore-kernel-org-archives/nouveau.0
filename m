From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: TDMS bandwidth limits
Date: Thu, 03 Feb 2011 22:40:52 +0100
Message-ID: <87k4hg4x0b.fsf@riseup.net>
References: <DE8B09DD-4ACE-499A-A33C-C12C005803F0@math.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0858189787=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <DE8B09DD-4ACE-499A-A33C-C12C005803F0-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org> ("Edgar
	=?utf-8?Q?Fu=C3=9F=22's?= message of "Thu, 3 Feb 2011 19:59:43 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Edgar =?utf-8?Q?Fu=C3=9F?= <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0858189787==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Edgar Fu=C3=9F <ef-o02PS0xoJP/q4qjOmvqfQQ@public.gmane.org> writes:

> I'm curious what the TDMS bandwidth limit values in get_tmds_link_bandwid=
th() are based on.

They're based on what the nvidia proprietary driver itself refuses to
do, though, I'm not 100% sure that I had nv44 in my sample when I made
that change.

> We're using chipset =3D=3D 44 cards that happily run 1600x1200@60 using t=
he propriety driver and which also used to work with nouveau up to Linux 2.=
6.36.2. Since 2.6.37, nouveau refuses to use that mode because the required=
 163M pixel clock exceeds the computed TDMS bandwidth of 155M (earlier vers=
ions allowed for 165M regardless of chipset value).
> Although I cannot tell for sure which timing the closed-source driver run=
s 1600x1200@60 with on these monitors, I find it unlikely that it uses some=
 built-in, non-EDID timing requiring a lower pixel clock. I also don't susp=
ect NVidia running their own chips above specs.

It might be using a reduced-blanking mode, check your Xorg.0.log to be
sure. See the "-logverbose" option if you don't get all the timings
printed out with the default verbosity level.

> So either NVidia doesn't disclose the specs even to their own programmers=
, the values in get_tmds_link_bandwidth() are wrong, or, more likely, I'm m=
issing something.
> Patching get_tmds_link_bandwidth() to allow for 165M already for chipset =
>=3D 0x44 appears to work. However, I don't feel comfortable with stretchin=
g rates above spec.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAk1LIOUACgkQg5k4nX1Sv1tVFQD9GQRe3G0mbRrR1z6jEq19NpNX
h7NwHuLZ7l5N7SwQYuIA+gOIGfwlvKpAX4YCvqLFFQyOUIzD4JtbU0KZqGGYl7T3
=QmCX
-----END PGP SIGNATURE-----
--==-=-=--

--===============0858189787==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0858189787==--

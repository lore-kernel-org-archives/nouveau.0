From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Enabling TV-out with the nouveau driver
Date: Fri, 11 Jun 2010 11:43:16 +0200
Message-ID: <878w6lnbuz.fsf@riseup.net>
References: <4C10A1F8.4010107@romtelecom.ro> <87k4q7mavl.fsf@riseup.net>
	<4C11CC42.3000705@romtelecom.ro>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0711432643=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C11CC42.3000705-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org> (Adrian Popa's message of "Fri,
	11 Jun 2010 08:40:18 +0300")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0711432643==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Adrian Popa <adrian_gh.popa-W9Zz3XeOr4Mo9/FJvwSGXQ@public.gmane.org> writes:

> Hello,
>
> I've checked and i have a GeForce 4 MX 440, and i do see a TV-1 in xrandr=
 but I didn't manage to configure it
> with xrandr.
>
> I've looked over [2] and by using xrandr --output TV-1 --right-of VGA-1 i=
 managed to extend my desktop to my
> TV. Also, i see the window transparency effect keeps working ;)
>
> The problem is=C2=A0 - I tried to configure xorg.conf but I didn't manage=
 to add the displays side by side (the TV
> overlaps with the monitor from the top-left corner), even if they have di=
fferent resolutions. I have attached
> my xorg.conf for reference. I realize I must be missing something trivial=
 in the configuration. Anyone care to
> point it out?
>
> Thanks,
> Adrian
>
> Section "ServerLayout"
> 	Identifier     "X.org Configured"
> 	Screen      0  "Screen0" 0 0
> 	InputDevice    "Mouse0" "CorePointer"
> 	InputDevice    "Keyboard0" "CoreKeyboard"
> EndSection
>=20
> Section "Files"
> 	ModulePath   "/usr/lib/xorg/modules"
> 	FontPath     "/usr/share/fonts/X11/misc"
> 	FontPath     "/usr/share/fonts/X11/cyrillic"
> 	FontPath     "/usr/share/fonts/X11/100dpi/:unscaled"
> 	FontPath     "/usr/share/fonts/X11/75dpi/:unscaled"
> 	FontPath     "/usr/share/fonts/X11/Type1"
> 	FontPath     "/usr/share/fonts/X11/100dpi"
> 	FontPath     "/usr/share/fonts/X11/75dpi"
> 	FontPath     "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType"
> 	FontPath     "built-ins"
> EndSection
>=20
> Section "Module"
> 	Load  "record"
> 	Load  "dri2"
> 	Load  "dri"
> 	Load  "glx"
> 	Load  "extmod"
> 	Load  "dbe"
> EndSection
>=20
You probably don't need any of the last two sections.

> Section "InputDevice"
> 	Identifier  "Keyboard0"
> 	Driver      "kbd"
> EndSection
>=20
> Section "InputDevice"
> 	Identifier  "Mouse0"
> 	Driver      "mouse"
> 	Option	    "Protocol" "auto"
> 	Option	    "Device" "/dev/input/mice"
> 	Option	    "ZAxisMapping" "4 5 6 7"
> EndSection
>=20
> Section "Monitor"
> 	Identifier   "VGA-1"

> 	DisplaySize	  340   270	# mm
> 	VendorName   "NEC"
> 	ModelName    "LCD72VM"
> 	HorizSync    31.0 - 81.0
> 	VertRefresh  56.0 - 75.0
> 	Option	    "DPMS"
You shouldn't need any of the options above.

> EndSection
>=20
> Section "Monitor"
> 	Identifier   "TV-1"=20
> 	Option "RightOf" "Monitor0"
The "Monitor0" identifier is wrong, I guess you meant "VGA-1".

>         HorizSync    30-50
> 	VertRefresh  60
> 	# 720x576 @ 50Hz, 31.25kHz, itu-r bt.1358 625/50/p/1:1, RGB, YPbPr, HDMI
> 	ModeLine "720x576@50"  27     720 732 795 864  576 581 586 625 -hsync -v=
sync
> 	# nonstandard PAL (Works with BOB deinterlace) It is 60Hz but works well=
 with nVIDIA PAL-B TV-OUT
> 	# Nvidia option: Option "TVStandard" "PAL-B"
> 	ModeLine "720x576@60" 32.7  720 744 816 912  576 577 580 597
>=20
> 	# This modeline is 50Hz interlaced and works well with kerneldeint:
> 	ModeLine "720x576i" 13.875  720 744 808 888  576 581 586 625 -hsync -vsy=
nc interlace
>=20=09
You shouldn't need to set any timings manually.

> EndSection=09
> Section "Device"
>         ### Available Driver options are:-
>         ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
>         ### <string>: "String", <freq>: "<f> Hz/kHz/MHz"
>         ### [arg]: arg optional
>         #Option     "SWcursor"           	# [<bool>]
>         #Option     "HWcursor"           	# [<bool>]
>         #Option     "NoAccel"            	# [<bool>]
>         #Option     "ShadowFB"           	# [<bool>]
>         #Option     "UseFBDev"           	# [<bool>]
>         #Option     "Rotate"             	# [<str>]
>         #Option     "VideoKey"           	# <i>
>         #Option     "FlatPanel"          	# [<bool>]
>         #Option     "FPDither"           	# [<bool>]
>         #Option     "CrtcNumber"         	# <i>
>         #Option     "FPScale"            	# [<bool>]
>         #Option     "FPTweak"            	# <i>
>         #Option     "DualHead"   "True"        	# [<bool>]
> 	Identifier  "Card0"
> 	Driver      "nouveau"
> 	VendorName  "nVidia Corporation"
> 	BoardName   "NV18 [GeForce4 MX 440 AGP 8x]"
> 	BusID       "PCI:2:0:0"
> 	Option	    "Monitor-VGA-1" "VGA-1"
> 	Option	    "Monitor-TV-1" "TV-1"
> EndSection
>=20
> Section "Screen"
> 	Identifier "Screen0"
> 	Device     "Card0"
> 	#Monitor    "Monitor0"
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     1
> 	EndSubSection
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     4
> 	EndSubSection
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     8
> 	EndSubSection
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     15
> 	EndSubSection
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     16
> 	EndSubSection
> 	SubSection "Display"
> 		Viewport   0 0
> 		Depth     24
> 	EndSubSection
> EndSection
>=20

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkwSBTUACgkQg5k4nX1Sv1sCBgD/ezG3A5V/ayf+Dfs4yHL/M1BP
w8t6e5lDwXfodYoGXmkA/AgpbZRZntot/Sol96KHOa5nmtmxAoJXGL4RYz3AWGWC
=uNE6
-----END PGP SIGNATURE-----
--==-=-=--

--===============0711432643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0711432643==--

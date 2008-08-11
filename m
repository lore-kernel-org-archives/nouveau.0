From: Stefan Wolf <wolfs-cg1h10c7RbKzQB+pC5nmwQ@public.gmane.org>
Subject: Nouveau takes 100% CPU on startx but does not show
	anything on GeForce FX 5200
Date: Mon, 11 Aug 2008 21:54:44 +0200
Message-ID: <200808112154.49658.wolfs@fs.tum.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1489550439=="
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

--===============1489550439==
Content-Type: multipart/signed;
  boundary="nextPart2471745.NT14HDxTuR";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2471745.NT14HDxTuR
Content-Type: multipart/mixed;
  boundary="Boundary-01=_EkJoI8ZWc+IpAZu"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--Boundary-01=_EkJoI8ZWc+IpAZu
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I just installed the latest nouveau driver from git to try if it works and=
=20
after modifying my xorg.conf and switching to xorg-x11 opengl startx change=
s=20
screenmode (screen gets black) and nothing more happens. I can ssh from=20
another maschine and see that X takes 100% CPU but nothing more happens. I =
am=20
on Gentoo Linux, followed the guide from the Wiki, have Xorg-x11-7.2,=20
tuxonice patched sources 2.6.24 and x11-drm, libdrm and nouveau from git.=20
Loading the drm and the nouveau module worked fine. I attach the Xorg logfi=
le=20
and xorg.conf. I started X with startx -- -layout NouveauLayout

Best Regards,
=2D-=20
  Stefan Wolf <wolfs-cg1h10c7RbKzQB+pC5nmwQ@public.gmane.org>

--Boundary-01=_EkJoI8ZWc+IpAZu
Content-Type: text/x-java;
  charset="utf-8";
  name="Xorg.0.nouveau"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="Xorg.0.nouveau"

_XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
_XSERVTransOpen: transport open failed for inet6/bender:0
_XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6

X Window System Version 1.3.0
Release Date: 19 April 2007
X Protocol Version 11, Revision 0, Release 1.3
Build Operating System: UNKNOWN=20
Current Operating System: Linux bender 2.6.24-tuxonice-r9 #4 Sun Aug 10 19:=
39:06 CEST 2008 i686
Build Date: 12 June 2008
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Mon Aug 11 20:26:52 2008
(=3D=3D) Using config file: "/etc/X11/xorg.conf"
(++) ServerLayout "NouveauLayout"
(**) |-->Screen "Nouveau Screen" (0)
(**) |   |-->Monitor "Samtron 95P"
(**) |   |-->Device "Nouveau0"
(**) |-->Input Device "PSMouse"
(**) |-->Input Device "Mouse1"
(**) |-->Input Device "Keyboard1"
(**) FontPath set to:
	unix/:-1
(**) RgbPath set to "/usr/share/X11/rgb"
(=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
(**) Option "BlankTime" "10"
(**) Option "StandbyTime" "20"
(**) Option "SuspendTime" "30"
(**) Option "OffTime" "60"
(**) Option "AIGLX" "false"
(**) Extension "Composite" is enabled
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x81e35c0
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 1.2
	X.Org XInput driver : 0.7
	X.Org Server Extension : 0.3
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/xorg/modules//libpcidata.so
(II) Module pcidata: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 1.2
(--) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 1106,3189 card 1043,807f rev 80 class 06,00,00 hdr =
00
(II) PCI: 00:01:0: chip 1106,b198 card 0000,0000 rev 00 class 06,04,00 hdr =
01
(II) PCI: 00:0a:0: chip 1274,5880 card 1274,8001 rev 02 class 04,01,00 hdr =
00
(II) PCI: 00:0e:0: chip 13d0,2103 card 13d0,2103 rev 02 class 02,80,00 hdr =
00
(II) PCI: 00:10:0: chip 1106,3038 card 1043,80a1 rev 80 class 0c,03,00 hdr =
80
(II) PCI: 00:10:1: chip 1106,3038 card 1043,80a1 rev 80 class 0c,03,00 hdr =
80
(II) PCI: 00:10:2: chip 1106,3038 card 1043,80a1 rev 80 class 0c,03,00 hdr =
80
(II) PCI: 00:10:3: chip 1106,3104 card 1043,80a1 rev 82 class 0c,03,20 hdr =
00
(II) PCI: 00:11:0: chip 1106,3177 card 1043,80a1 rev 00 class 06,01,00 hdr =
80
(II) PCI: 00:11:1: chip 1106,0571 card 1043,80a1 rev 06 class 01,01,8a hdr =
00
(II) PCI: 00:12:0: chip 1106,3065 card 1043,80a1 rev 74 class 02,00,00 hdr =
00
(II) PCI: 01:00:0: chip 10de,0322 card 1043,8180 rev a1 class 03,00,00 hdr =
00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (0,0,1), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 1: bridge is at (0:1:0), (0,1,1), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 1 non-prefetchable memory range:
	[0] -1	0	0xe6000000 - 0xe7efffff (0x1f00000) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1	0	0xe7f00000 - 0xefffffff (0x8100000) MX[B]
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:17:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is set)
(--) PCI:*(1:0:0) nVidia Corporation NV34 [GeForce FX 5200] rev 161, Mem @ =
0xe6000000/24, 0xe8000000/27, BIOS @ 0xe7fe0000/17
(II) Addressable bus resource ranges are
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
	[1] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[5] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(II) PCI Memory resource overlap reduced 0xf0000000 from 0xf7ffffff to 0xef=
ffffff
(II) Active PCI resource ranges:
	[0] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[1] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[2] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[3] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[4] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[5] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[6] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[7] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[8] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[9] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[10] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[11] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[12] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[13] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[1] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[2] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[3] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[4] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[5] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[6] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[7] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[8] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[9] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[10] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[11] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[12] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[13] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
(II) OS-reported resource ranges after removing overlaps with PCI:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[5] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
(II) All system resource ranges:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[5] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[6] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[7] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[8] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[9] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[10] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[11] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[12] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[13] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[14] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[15] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[16] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[17] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[18] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[19] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension SHAPE
(II) Loading extension MIT-SUNDRY-NONSTANDARD
(II) Loading extension BIG-REQUESTS
(II) Loading extension SYNC
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XC-MISC
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-Misc
(II) Loading extension DPMS
(II) Loading extension TOG-CUP
(II) Loading extension Extended-Visual-Information
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "type1"
(II) Loading /usr/lib/xorg/modules/fonts//libtype1.so
(II) Module type1: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.2
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font Type1
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules/fonts//libfreetype.so
(II) Module freetype: vendor=3D"X.Org Foundation & the After X-TT Project"
	compiled for 1.3.0, module version =3D 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(**) AIGLX disabled
(II) Loading extension GLX
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 1.2
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.2.3
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 0.7
(II) LoadModule: "evdev"
(II) Loading /usr/lib/xorg/modules/input//evdev_drv.so
(II) Module evdev: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.1.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 0.7
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor=3D"X.Org Foundation"
	compiled for 7.2.0, module version =3D 1.1.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 0.7
(II) NOUVEAU driver=20
(II) NOUVEAU driver for NVIDIA chipset families :
	RIVA TNT    (NV04)
	RIVA TNT2   (NV05)
	GeForce 256 (NV10)
	GeForce 2   (NV11, NV15)
	GeForce 4MX (NV17, NV18)
	GeForce 3   (NV20)
	GeForce 4Ti (NV25, NV28)
	GeForce FX  (NV3x)
	GeForce 6   (NV4x)
	GeForce 7   (G7x)
	GeForce 8   (G8x)
(II) Primary Device is: PCI 01:00:0
(--) Assigning device section with no busID to primary device
(--) Chipset NVIDIA NV34 found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[5] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[6] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[7] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[8] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[9] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[10] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[11] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[12] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[13] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[14] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[15] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[16] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[17] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[18] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[19] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
(II) resource ranges after probing:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[5] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[6] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[7] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[8] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[9] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[10] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[11] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[12] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[13] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[14] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[15] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[16] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[17] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[18] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[19] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[20] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[21] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[22] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
	[23] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[24] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(--) NOUVEAU(0): Chipset: "NVIDIA NV34"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 1.2
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(=3D=3D) NOUVEAU(0): RGB weight 888
(=3D=3D) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 0.1.0
	ABI class: X.Org Video Driver, version 1.2
(=3D=3D) NOUVEAU(0): Randr1.2 support enabled
(=3D=3D) NOUVEAU(0): New (experimental) restore support disabled
(=3D=3D) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xE8000000
(--) NOUVEAU(0): MMIO registers at 0xE6000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: drmOpenMinor returns 8
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module ve=
rsion 0.0.11
(II) NOUVEAU(0): Initial CRTC_OWNER is 4
(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x19D10001
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Loading NV17 power sequencing microcode
(II) NOUVEAU(0): 	Write: Reg: 0x00001304, Data: 0x00000800
(II) NOUVEAU(0): 	Write: Reg: 0x00001400, Data: 0xA9A81AA2
(II) NOUVEAU(0): 	Write: Reg: 0x00001404, Data: 0x7FA01E23
(II) NOUVEAU(0): 	Write: Reg: 0x00001408, Data: 0xC9C825C0
(II) NOUVEAU(0): 	Write: Reg: 0x0000140C, Data: 0x7F27C215
(II) NOUVEAU(0): 	Write: Reg: 0x00001410, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001414, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001418, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000141C, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001098, Data: 0x20CE067C
(II) NOUVEAU(0): 	Write: Reg: 0x00001098, Data: 0x20CE067C
(II) NOUVEAU(0): BMP BIOS found
(II) NOUVEAU(0): BMP version 5.41
(II) NOUVEAU(0): Bios version 04.34.20.87
(II) NOUVEAU(0): 0xED03: Parsing init table 0
(II) NOUVEAU(0): 0xED03: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xED03: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED03: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0060081C, Data: 0x66666666
(II) NOUVEAU(0): 	Write: Reg: 0x0060081C, Data: 0x66666666
(II) NOUVEAU(0): 0xED10: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED10: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0060081C, Data: 0x66666666
(II) NOUVEAU(0): 	Write: Reg: 0x0060081C, Data: 0x66666666
(II) NOUVEAU(0): 0xED1D: [ (0x65) - INIT_RESET ]
(II) NOUVEAU(0): 	Read:  Reg: 0x0000184C, Data: 0x1F000312
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x03000000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x03110110
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x1F000312
(II) NOUVEAU(0): 	Read:  Reg: 0x00001850, Data: 0x00000001
(II) NOUVEAU(0): 	Write: Reg: 0x00001850, Data: 0x00000000
(II) NOUVEAU(0): 0xED2A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED2A: Reg: 0x00101000, Mask: 0xFFFFFFFB, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0xA0C0E09B
(II) NOUVEAU(0): 0xED37: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED37: Reg: 0x0010100C, Mask: 0x00000000, Data: 0x80000010
(II) NOUVEAU(0): 	Read:  Reg: 0x0010100C, Data: 0x80000010
(II) NOUVEAU(0): 	Write: Reg: 0x0010100C, Data: 0x80000010
(II) NOUVEAU(0): 0xED44: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xED44: Cond: 0x02, Reg: 0x00101000, Mask: 0x00000020, Cmp=
val: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): 0xED44: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xED44: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xED44: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xED46: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED53: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xED53: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xED54: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xED54: Cond: 0x00, Reg: 0x00101000, Mask: 0x00000040, Cmp=
val: 0x00000040
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): 0xED54: Checking if 0x00000000 equals 0x00000040
(II) NOUVEAU(0): 0xED54: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xED54: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xED56: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 0xED5B: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xED5B: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xED5C: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xED61: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xED62: [ (0x37) - INIT_COPY ]
(II) NOUVEAU(0): 0xED62: Reg: 0x00101000, Shift: 0xFE, SrcMask: 0xF0, Port:=
 0x03D4, Index: 0x3C, Mask: 0x0F
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xED6D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED6D: Reg: 0x00680500, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680500, Data: 0x00012502
(II) NOUVEAU(0): 	Write: Reg: 0x00680500, Data: 0x00012502
(II) NOUVEAU(0): 0xED7A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00001111
(II) NOUVEAU(0): 0xED83: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00003333
(II) NOUVEAU(0): 0xED8C: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x000010C0, Data: 0x911C0801
(II) NOUVEAU(0): 0xED95: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680510, Data: 0x0000F11C
(II) NOUVEAU(0): 0xED9E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xED9E: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xEDA1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680510, Data: 0x0000011C
(II) NOUVEAU(0): 0xEDAA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x000010C0, Data: 0x811C0801
(II) NOUVEAU(0): 0xEDB3: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xEDB3: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xEDB6: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00001111
(II) NOUVEAU(0): 0xEDBF: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEDBF: Port: 0x03D4, Index: 0x35, Mask: 0xFE, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x35, Head: 0x00, =
Data: 0x13
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x35, Head: 0x00, =
Data: 0x13
(II) NOUVEAU(0): 0xEDC5: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEDC5: Port: 0x03D4, Index: 0x3C, Mask: 0xF7, Data: 0x08
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEDCB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x000010F0, Data: 0xC0004000
(II) NOUVEAU(0): 0xEDD4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x07010111
(II) NOUVEAU(0): 0xEDDD: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEDDD: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data: 0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x20
(II) NOUVEAU(0): 0xEDE3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004014, Data: 0x00000000
(II) NOUVEAU(0): 0xEDEC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000402C, Data: 0x0F71F010
(II) NOUVEAU(0): 0xEDF5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004030, Data: 0x00002626
(II) NOUVEAU(0): 0xEDFE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004034, Data: 0x0417E273
(II) NOUVEAU(0): 0xEE07: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004108, Data: 0x33003333
(II) NOUVEAU(0): 0xEE10: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEE10: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0000410C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEE10: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x0000410C, Data: 0x0000DDDD
(II) NOUVEAU(0): 0xEE3B: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEE3B: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x000010D8
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEE3B: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x000010D8, Data: 0x00000000
(II) NOUVEAU(0): 0xEE66: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001518, Data: 0x80010000
(II) NOUVEAU(0): 0xEE6F: [ (0x79) - INIT_PLL ]
(II) NOUVEAU(0): 0xEE6F: Reg: 0x00680500, Freq: 250000kHz
(II) NOUVEAU(0): 	Read:  Reg: 0x00680500, Data: 0x00012502
(II) NOUVEAU(0): 0xEE76: [ (0x79) - INIT_PLL ]
(II) NOUVEAU(0): 0xEE76: Reg: 0x00680504, Freq: 400000kHz
(II) NOUVEAU(0): 	Read:  Reg: 0x00680504, Data: 0x00000F01
(II) NOUVEAU(0): 0xEE7D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680510, Data: 0x0000011C
(II) NOUVEAU(0): 0xEE86: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0068050C, Data: 0x00000500
(II) NOUVEAU(0): 0xEE8F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000140, Data: 0x00000000
(II) NOUVEAU(0): 0xEE98: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x07110111
(II) NOUVEAU(0): 0xEEA1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x00000000
(II) NOUVEAU(0): 0xEEAA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010021C, Data: 0x00000001
(II) NOUVEAU(0): 0xEEB3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEEB3: Reg: 0x000010E0, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x000010E0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x000010E0, Data: 0x00000000
(II) NOUVEAU(0): 0xEEC0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001084, Data: 0x00205749
(II) NOUVEAU(0): 0xEEC9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100080, Data: 0x610200C0
(II) NOUVEAU(0): 0xEED2: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEED2: Reg: 0x00001584, Mask: 0xFFF00000, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 0xEEDF: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEEDF: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100220
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEEDF: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100220, Data: 0x44480E0E
(II) NOUVEAU(0): 0xEF0A: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEF0A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100224
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEF0A: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100224, Data: 0x03542154
(II) NOUVEAU(0): 0xEF35: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEF35: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100228
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEF35: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100228, Data: 0x0000063F
(II) NOUVEAU(0): 0xEF60: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEF60: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0010022C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEF60: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x0010022C, Data: 0x00000000
(II) NOUVEAU(0): 0xEF8B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680608, Data: 0xF0010000
(II) NOUVEAU(0): 0xEF94: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00682608, Data: 0xF0010000
(II) NOUVEAU(0): 0xEF9D: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xEF9E: Parsing init table 1
(II) NOUVEAU(0): 0xEF9E: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xEF9E: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEF9E: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data: 0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x20
(II) NOUVEAU(0): 0xEFA4: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEFA4: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100210
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEFA4: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xEFCF: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001220, Data: 0x00000000
(II) NOUVEAU(0): 0xEFD8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001228, Data: 0x00000000
(II) NOUVEAU(0): 0xEFE1: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEFE1: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00001210
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xEFE1: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00001210, Data: 0x00000000
(II) NOUVEAU(0): 0xF00C: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF00C: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00001214
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF00C: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00001214, Data: 0x78787878
(II) NOUVEAU(0): 0xF037: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF037: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00001218
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF037: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00001218, Data: 0x30000101
(II) NOUVEAU(0): 0xF062: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF062: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100200
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF062: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x19D10001
(II) NOUVEAU(0): 0xF08D: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF08D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100204
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF08D: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100204, Data: 0x00000020
(II) NOUVEAU(0): 0xF0B8: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF0B8: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100210
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF0B8: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xF0E3: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xF0E4: Parsing init table 2
(II) NOUVEAU(0): 0xF0E4: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xF0E4: [ (0x79) - INIT_PLL ]
(II) NOUVEAU(0): 0xF0E4: Reg: 0x00680508, Freq: 36000kHz
(II) NOUVEAU(0): 	Read:  Reg: 0x00680508, Data: 0x00045405
(II) NOUVEAU(0): 	Read:  Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00000100
(II) NOUVEAU(0): 	Write: Reg: 0x00680508, Data: 0x00044003
(II) NOUVEAU(0): 	Read:  Reg: 0x00680508, Data: 0x00045405
(II) NOUVEAU(0): 	Write: Reg: 0x00680508, Data: 0x00044003
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 0xF0EB: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF0EB: Reg: 0x00001098, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001098, Data: 0x20CE067C
(II) NOUVEAU(0): 	Write: Reg: 0x00001098, Data: 0x20CE067C
(II) NOUVEAU(0): 0xF0F8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000108C, Data: 0x000000D1
(II) NOUVEAU(0): 0xF101: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF101: Reg: 0x00680880, Mask: 0xFFFFFFFF, Data: 0x10000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680880, Data: 0x31101111
(II) NOUVEAU(0): 	Write: Reg: 0x00680880, Data: 0x31101111
(II) NOUVEAU(0): 0xF10E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680610, Data: 0x00000000
(II) NOUVEAU(0): 0xF117: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF117: Port: 0x03D4, Index: 0x38, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x38, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x38, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF11D: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF11D: Port: 0x03D4, Index: 0x1A, Mask: 0x00, Data: 0x3F
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x1A, Head: 0x00, =
Data: 0x3D
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x1A, Head: 0x00, =
Data: 0x3F
(II) NOUVEAU(0): 0xF123: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF123: Port: 0x03D4, Index: 0x28, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x28, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x28, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF129: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF129: Port: 0x03D4, Index: 0x33, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x33, Head: 0x00, =
Data: 0x08
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x33, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF12F: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF12F: Port: 0x03D4, Index: 0x21, Mask: 0x00, Data: 0xFA
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x21, Head: 0x00, =
Data: 0xFA
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head: 0x00, =
Data: 0xFA
(II) NOUVEAU(0): 0xF135: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF135: Port: 0x03D4, Index: 0x2B, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF13B: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF13B: Port: 0x03D4, Index: 0x2C, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF141: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF141: Port: 0x03D4, Index: 0x3A, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3A, Head: 0x00, =
Data: 0x03
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF147: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF147: Port: 0x03D4, Index: 0x3B, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3B, Head: 0x00, =
Data: 0x22
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF14D: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF14D: Port: 0x03D4, Index: 0x4A, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4A, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF153: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF153: Port: 0x03D4, Index: 0x4B, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4B, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF159: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF159: Port: 0x03D4, Index: 0x4C, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF15F: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF15F: Port: 0x03D4, Index: 0x57, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF165: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF165: Port: 0x03D4, Index: 0x58, Mask: 0x00, Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x7F
(II) NOUVEAU(0): 0xF16B: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF16B: Port: 0x03D4, Index: 0x57, Mask: 0x00, Data: 0x02
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x02
(II) NOUVEAU(0): 0xF171: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF171: Port: 0x03D4, Index: 0x58, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF177: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF177: Port: 0x03D4, Index: 0x57, Mask: 0x00, Data: 0x06
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x06
(II) NOUVEAU(0): 0xF17D: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF17D: Port: 0x03D4, Index: 0x58, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF183: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF183: Port: 0x03D4, Index: 0x43, Mask: 0x00, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x43, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 0xF189: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF189: Port: 0x03D4, Index: 0x44, Mask: 0x00, Data: 0x03
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x03
(II) NOUVEAU(0): 0xF18F: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF18F: Port: 0x03D4, Index: 0x21, Mask: 0x00, Data: 0xFA
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x21, Head: 0x01, =
Data: 0xFA
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head: 0x01, =
Data: 0xFA
(II) NOUVEAU(0): 0xF195: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF195: Port: 0x03D4, Index: 0x2B, Mask: 0x10, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF19B: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF19B: Port: 0x03D4, Index: 0x2C, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1A1: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1A1: Port: 0x03D4, Index: 0x3A, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1A7: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1A7: Port: 0x03D4, Index: 0x3B, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1AD: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1AD: Port: 0x03D4, Index: 0x3C, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1B3: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1B3: Port: 0x03D4, Index: 0x4A, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1B9: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1B9: Port: 0x03D4, Index: 0x4B, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1BF: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1BF: Port: 0x03D4, Index: 0x4C, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x4C, Head: 0x01, =
Data: 0x10
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1C5: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1C5: Port: 0x03D4, Index: 0x57, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1CB: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1CB: Port: 0x03D4, Index: 0x58, Mask: 0x00, Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0x7F
(II) NOUVEAU(0): 0xF1D1: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1D1: Port: 0x03D4, Index: 0x57, Mask: 0x00, Data: 0x02
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x02
(II) NOUVEAU(0): 0xF1D7: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1D7: Port: 0x03D4, Index: 0x58, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xF1DD: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1DD: Port: 0x03D4, Index: 0x43, Mask: 0x00, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x43, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 0xF1E3: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1E3: Port: 0x03D4, Index: 0x44, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x44, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF1E9: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1E9: Port: 0x03D4, Index: 0x52, Mask: 0x00, Data: 0x04
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x52, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x52, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 0xF1EF: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF1EF: Port: 0x03D4, Index: 0x53, Mask: 0x00, Data: 0x40
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x53, Head: 0x00, =
Data: 0x40
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x53, Head: 0x00, =
Data: 0x40
(II) NOUVEAU(0): 0xF1F5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001580, Data: 0x00000000
(II) NOUVEAU(0): 0xF1FE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001588, Data: 0x00000000
(II) NOUVEAU(0): 0xF207: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000158C, Data: 0x00440000
(II) NOUVEAU(0): 0xF210: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100090, Data: 0xEFFFCFE1
(II) NOUVEAU(0): 0xF219: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001590, Data: 0x00000000
(II) NOUVEAU(0): 0xF222: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xF22B: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF22B: Reg: 0x0068052C, Mask: 0xFFFFFEFF, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 	Write: Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 0xF238: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF238: Reg: 0x0068252C, Mask: 0xFFFFFFFF, Data: 0x00000101
(II) NOUVEAU(0): 	Read:  Reg: 0x0068252C, Data: 0x00000100
(II) NOUVEAU(0): 	Write: Reg: 0x0068252C, Data: 0x00000101
(II) NOUVEAU(0): 0xF245: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF245: Reg: 0x00680528, Mask: 0xFFFFFFFF, Data: 0x40000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680528, Data: 0x40000000
(II) NOUVEAU(0): 	Write: Reg: 0x00680528, Data: 0x40000000
(II) NOUVEAU(0): 0xF252: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF252: Reg: 0x00680848, Mask: 0xFFFFFFFF, Data: 0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680848, Data: 0x11100011
(II) NOUVEAU(0): 	Write: Reg: 0x00680848, Data: 0x11100011
(II) NOUVEAU(0): 0xF25F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF25F: Reg: 0x00682848, Mask: 0xFFFFFFFF, Data: 0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00682848, Data: 0x11100011
(II) NOUVEAU(0): 	Write: Reg: 0x00682848, Data: 0x11100011
(II) NOUVEAU(0): 0xF26C: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xF26D: Parsing init table 3
(II) NOUVEAU(0): 0xF26D: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xF26D: [ (0x34) - INIT_IO_RESTRICT_PLL ]
(II) NOUVEAU(0): 0xF26D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, IO Flag Condition: 0xFFFFFFFF, Count: 0x08, Reg: 0x00680500
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF26D: Reg: 0x00680500, Config: 0x07, Freq: 250000kHz
(II) NOUVEAU(0): 	Read:  Reg: 0x00680500, Data: 0x00012502
(II) NOUVEAU(0): 0xF289: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xF28A: Parsing init table 4
(II) NOUVEAU(0): 0xF28A: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xF28A: [ (0x34) - INIT_IO_RESTRICT_PLL ]
(II) NOUVEAU(0): 0xF28A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, IO Flag Condition: 0x01, Count: 0x08, Reg: 0x00680504
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF28A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x700D, FAMask: 0x03, Cmpval: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF28A: Checking if 0x01 equals 0x01
(II) NOUVEAU(0): 0xF28A: CONDITION FULFILLED - FREQ DOUBLED
(II) NOUVEAU(0): 0xF28A: Reg: 0x00680504, Config: 0x07, Freq: 400000kHz
(II) NOUVEAU(0): 	Read:  Reg: 0x00680504, Data: 0x00000F01
(II) NOUVEAU(0): 0xF2A6: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xF2A7: Parsing init table 5
(II) NOUVEAU(0): 0xF2A7: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xF2A7: [ (0x49) - INIT_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xF2A7: ControlReg: 0x006808B0, DataReg: 0x006808B4, Mask:=
 0x00000000, Data: 0x00000000, Count: 0x01
(II) NOUVEAU(0): 0xF2A7: Address: 0x2B, Data: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x006808B4, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x006808B0, Data: 0x00000004
(II) NOUVEAU(0): 	Write: Reg: 0x006808B0, Data: 0x0000002B
(II) NOUVEAU(0): 0xF2BB: [ (0x49) - INIT_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xF2BB: ControlReg: 0x006828B0, DataReg: 0x006828B4, Mask:=
 0x00000000, Data: 0x00000000, Count: 0x01
(II) NOUVEAU(0): 0xF2BB: Address: 0x2B, Data: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x006828B4, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x006828B0, Data: 0x0000002B
(II) NOUVEAU(0): 	Write: Reg: 0x006828B0, Data: 0x0000002B
(II) NOUVEAU(0): 0xF2CF: [ (0x49) - INIT_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xF2CF: ControlReg: 0x006828B0, DataReg: 0x006828B4, Mask:=
 0x00000000, Data: 0x00000000, Count: 0x01
(II) NOUVEAU(0): 0xF2CF: Address: 0x2B, Data: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x006828B4, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x006828B0, Data: 0x0000002B
(II) NOUVEAU(0): 	Write: Reg: 0x006828B0, Data: 0x0000002B
(II) NOUVEAU(0): 0xF2E3: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xF2E3: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xF2E6: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xF2E6: Macro: 0x03, MacroTableIndex: 0x03, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002DC, Data: 0x00000001
(II) NOUVEAU(0): 0xF2E8: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF2E8: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100218
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF2E8: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x00000001
(II) NOUVEAU(0): 0xF313: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0xF313: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x700D, FAMask: 0x10, Cmpval: 0x10
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF313: Checking if 0x00 equals 0x10
(II) NOUVEAU(0): 0xF313: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xF313: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xF315: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 0xF31E: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xF31E: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xF31F: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xF31F: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xF321: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF321: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002C4
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF321: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x001002C4, Data: 0x00000002
(II) NOUVEAU(0): 0xF34C: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xF34C: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002C0
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x78
(II) NOUVEAU(0): 0xF34C: Writing config 07
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000131
(II) NOUVEAU(0): 0xF377: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xF377: Sleeping for 0x0005 microseconds
(II) NOUVEAU(0): 0xF37A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xF37A: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xF37C: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xF37C: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xF37E: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xF37E: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xF380: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xF380: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000031
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000031
(II) NOUVEAU(0): 0xF38D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xF396: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 0xF39F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0068252C, Data: 0x00000001
(II) NOUVEAU(0): 0xF3A8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001100, Data: 0xFFFFFFFF
(II) NOUVEAU(0): 0xF3B1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001140, Data: 0x00000001
(II) NOUVEAU(0): 0xF3BA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00002100, Data: 0xFFFFFFFF
(II) NOUVEAU(0): 0xF3C3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00002140, Data: 0x00001111
(II) NOUVEAU(0): 0xF3CC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00003080, Data: 0x00000000
(II) NOUVEAU(0): 0xF3D5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00003280, Data: 0x00000000
(II) NOUVEAU(0): 0xF3DE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000140, Data: 0x00000000
(II) NOUVEAU(0): 0xF3E7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002E4, Data: 0x83303A98
(II) NOUVEAU(0): 0xF3F0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002E8, Data: 0x02000180
(II) NOUVEAU(0): 0xF3F9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000000
(II) NOUVEAU(0): 0xF402: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002CC, Data: 0x001F1F1F
(II) NOUVEAU(0): 0xF40B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002EC, Data: 0x9393939F
(II) NOUVEAU(0): 0xF414: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002F0, Data: 0x9393939A
(II) NOUVEAU(0): 0xF41D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002F4, Data: 0x9595959F
(II) NOUVEAU(0): 0xF426: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001002F8, Data: 0x9595959F
(II) NOUVEAU(0): 0xF42F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0070FFF0, Data: 0x00000000
(II) NOUVEAU(0): 0xF438: [ (0x63) - INIT_COMPUTE_MEM ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x19D10001
(II) NOUVEAU(0): 0xF439: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xF439: Port: 0x03C4, Index: 0x01, Mask: 0xDF, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xF43F: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xF440: Parsing init table 6
(II) NOUVEAU(0): 0xF440: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xF440: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA0C0E09F
(II) NOUVEAU(0): Found LVDS manufacturer table revision 0.10
(II) NOUVEAU(0): Found flat panel mode table revision 1.0
(II) NOUVEAU(0): Found flat panel mode in BIOS tables:
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 =
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 2.2 found
Raw DCB entry 0: 01000310 00009c40
Raw DCB entry 1: 01010302 00000000
Raw DCB entry 2: 020203f1 00000203
(II) NOUVEAU(0): Found 3 entries in DCB
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module already built-in
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(--) NOUVEAU(0): DCB entry 0: type: 0, heads: 3, or: 1
(II) NOUVEAU(0): Output VGA-0 using monitor section Samtron 95P
(II) NOUVEAU(0): I2C bus "VGA-0" initialized.
(--) NOUVEAU(0): DCB entry 1: type: 2, heads: 3, or: 1
(II) NOUVEAU(0): Output DVI-D-0 has no monitor section
(II) NOUVEAU(0): I2C bus "DVI-D-0" initialized.
(--) NOUVEAU(0): DCB entry 2: type: 1, heads: 3, or: 2
(II) NOUVEAU(0): nv_analog_output_detect is called.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" removed.
(II) NOUVEAU(0): Output VGA-0 connected
(II) NOUVEAU(0): nv_output_get_ddc_modes is called.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" removed.
(II) NOUVEAU(0): nv_output_get_modes is called.
(II) NOUVEAU(0): EDID for output VGA-0
(II) NOUVEAU(0): Manufacturer: SAM  Model: 40db  Serial#: 1346842937
(II) NOUVEAU(0): Year: 2000  Week: 16
(II) NOUVEAU(0): EDID Version: 1.2
(II) NOUVEAU(0): Analog Display Input,  Input Voltage Level: 0.700/0.300 V
(II) NOUVEAU(0): Sync:  Separate  Composite  SyncOnGreenSerration on. V.Syn=
c Pulse req. if CompSync or SyncOnGreen
(II) NOUVEAU(0): Max H-Image Size [cm]: horiz.: 36  vert.: 27
(II) NOUVEAU(0): Gamma: 2.28
(II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off; RGB/Color Display
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): GTF timings supported
(II) NOUVEAU(0): redX: 0.638 redY: 0.325   greenX: 0.276 greenY: 0.596
(II) NOUVEAU(0): blueX: 0.143 blueY: 0.066   whiteX: 0.283 whiteY: 0.298
(II) NOUVEAU(0): Supported VESA Video Modes:
(II) NOUVEAU(0): 720x400@70Hz
(II) NOUVEAU(0): 720x400@88Hz
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@67Hz
(II) NOUVEAU(0): 640x480@72Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@56Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@72Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 832x624@75Hz
(II) NOUVEAU(0): 1024x768@87Hz (interlaced)
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@70Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): 1280x1024@75Hz
(II) NOUVEAU(0): 1152x870@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported Future Video Modes:
(II) NOUVEAU(0): #0: hsize: 640  vsize 480  refresh: 85  vid: 22833
(II) NOUVEAU(0): #1: hsize: 800  vsize 600  refresh: 85  vid: 22853
(II) NOUVEAU(0): #2: hsize: 1024  vsize 768  refresh: 85  vid: 22881
(II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 85  vid: 39297
(II) NOUVEAU(0): #4: hsize: 1600  vsize 1200  refresh: 75  vid: 20393
(II) NOUVEAU(0): #5: hsize: 1024  vsize 768  refresh: 100  vid: 26721
(II) NOUVEAU(0): Supported additional Video Mode:
(II) NOUVEAU(0): clock: 157.5 MHz   Image Size:  352 x 264 mm
(II) NOUVEAU(0): h_active: 1280  h_sync: 1344  h_sync_end 1504 h_blank_end =
1728 h_border: 0
(II) NOUVEAU(0): v_active: 1024  v_sync: 1025  v_sync_end 1028 v_blanking: =
1072 v_border: 0
(II) NOUVEAU(0): Ranges: V min: 50  V max: 160 Hz, H min: 30  H max: 96 kHz=
, PixClock max 210 MHz
(II) NOUVEAU(0): Monitor name: SAMTRON 95P+
(II) NOUVEAU(0): Serial No: H3NN412353
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0): 	00ffffffffffff004c2ddb4039314750
(II) NOUVEAU(0): 	100a01020f241b80eb5e89a353469824
(II) NOUVEAU(0): 	11484cffff803159455961598199a94f
(II) NOUVEAU(0): 	616801010101863d00c05100304040a0
(II) NOUVEAU(0): 	130060081100001e000000fd0032a01e
(II) NOUVEAU(0): 	6015000a202020202020000000fc0053
(II) NOUVEAU(0): 	414d54524f4e203935502b0a000000ff
(II) NOUVEAU(0): 	0048334e4e3431323335330a20200019
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "800x600"   40.00  800 840 968 1056  600 601 605 =
628 +hsync +vsync
(II) NOUVEAU(0): Modeline "800x600"   36.00  800 824 896 1024  600 601 603 =
625 +hsync +vsync
(II) NOUVEAU(0): Modeline "640x480"   31.50  640 656 720 840  480 481 484 5=
00 -hsync -vsync
(II) NOUVEAU(0): Modeline "640x480"   31.50  640 664 704 832  480 489 491 5=
20 -hsync -vsync
(II) NOUVEAU(0): Modeline "640x480"   30.24  640 704 768 864  480 483 486 5=
25 -hsync -vsync
(II) NOUVEAU(0): Modeline "640x480"   25.20  640 656 752 800  480 490 492 5=
25 -hsync -vsync
(II) NOUVEAU(0): Modeline "720x400"   35.50  720 738 846 900  400 421 423 4=
49 -hsync -vsync
(II) NOUVEAU(0): Modeline "720x400"   28.32  720 738 846 900  400 412 414 4=
49 -hsync +vsync
(II) NOUVEAU(0): Modeline "1280x1024"  135.00  1280 1296 1440 1688  1024 10=
25 1028 1066 +hsync +vsync
(II) NOUVEAU(0): Modeline "1024x768"   78.80  1024 1040 1136 1312  768 769 =
772 800 +hsync +vsync
(II) NOUVEAU(0): Modeline "1024x768"   75.00  1024 1048 1184 1328  768 771 =
777 806 -hsync -vsync
(II) NOUVEAU(0): Modeline "1024x768"   65.00  1024 1048 1184 1344  768 771 =
777 806 -hsync -vsync
(II) NOUVEAU(0): Modeline "1024x768"   44.90  1024 1032 1208 1264  768 768 =
776 817 interlace +hsync +vsync
(II) NOUVEAU(0): Modeline "832x624"   57.28  832 864 928 1152  624 625 628 =
667 -hsync -vsync
(II) NOUVEAU(0): Modeline "800x600"   49.50  800 816 896 1056  600 601 604 =
625 +hsync +vsync
(II) NOUVEAU(0): Modeline "800x600"   50.00  800 856 976 1040  600 637 643 =
666 +hsync +vsync
(II) NOUVEAU(0): Modeline "1152x864"  108.00  1152 1216 1344 1600  864 865 =
868 900 +hsync +vsync
(II) NOUVEAU(0): Modeline "640x480"   35.00  640 664 728 816  480 483 487 5=
07 -hsync +vsync
(II) NOUVEAU(0): Modeline "800x600"   56.75  800 848 928 1056  600 603 607 =
633 -hsync +vsync
(II) NOUVEAU(0): Modeline "1024x768"   94.50  1024 1096 1200 1376  768 771 =
775 809 -hsync +vsync
(II) NOUVEAU(0): Modeline "1280x1024"  159.50  1280 1376 1512 1744  1024 10=
27 1034 1078 -hsync +vsync
(II) NOUVEAU(0): Modeline "1600x1200"  204.75  1600 1720 1888 2176  1200 12=
03 1207 1255 -hsync +vsync
(II) NOUVEAU(0): Modeline "1024x768"  112.25  1024 1096 1200 1376  768 771 =
775 816 -hsync +vsync
(II) NOUVEAU(0): Modeline "1280x1024"  157.50  1280 1344 1504 1728  1024 10=
25 1028 1072 +hsync +vsync
(II) NOUVEAU(0): EDID vendor "SAM", prod id 16603
(II) NOUVEAU(0): Not using default mode "640x350" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x175" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x400" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x200" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "720x400" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "360x200" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x960" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x960" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "832x624" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "416x312" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "576x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1024" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "800x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (bad mode clock/interla=
ce/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Printing probed modes for output VGA-0
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  10=
24 1025 1028 1072 +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  204.75  1600 1720 1888 2176  12=
00 1203 1207 1255 -hsync +vsync (94.1 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x84.8  159.50  1280 1376 1512 1744  10=
24 1027 1034 1078 -hsync +vsync (91.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864=
 865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x100.0  112.25  1024 1096 1200 1376  76=
8 771 775 816 -hsync +vsync (81.6 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x84.9   94.50  1024 1096 1200 1376  768=
 771 775 809 -hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768=
 769 772 800 +hsync +vsync (60.1 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768=
 771 777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768=
 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x87.0   44.90  1024 1032 1208 1264  768=
 768 776 817 interlace +hsync +vsync (35.5 kHz)
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625=
 628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x84.9   56.75  800 848 928 1056  600 603=
 607 633 -hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637=
 643 666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601=
 604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601=
 605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601=
 603 625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "640x480"x84.6   35.00  640 664 728 816  480 483 =
487 507 -hsync +vsync (42.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 =
484 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 =
491 520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 =
486 525 -hsync -vsync (35.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 =
492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x87.8   35.50  720 738 846 900  400 421 =
423 449 -hsync -vsync (39.4 kHz)
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 =
414 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): nv_tmds_output_detect is called.
(II) NOUVEAU(0): I2C device "DVI-D-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DVI-D-0:ddc2" removed.
(II) NOUVEAU(0): Output DVI-D-0 disconnected
(II) NOUVEAU(0): EDID for output DVI-D-0
(II) NOUVEAU(0): Output VGA-0 connected
(II) NOUVEAU(0): Output DVI-D-0 disconnected
(II) NOUVEAU(0): Output VGA-0 using initial mode 1280x1024
(--) NOUVEAU(0): VideoRAM: 131072 kBytes
(=3D=3D) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(--) NOUVEAU(0): Virtual size is 1600x1600 (pitch 1600)
(**) NOUVEAU(0):  Driver mode "1280x1024": 157.5 MHz (scaled from 0.0 MHz),=
 91.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"  157.50  1280 1344 1504 1728  1024 10=
25 1028 1072 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "1600x1200": 204.8 MHz (scaled from 0.0 MHz),=
 94.1 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"  204.75  1600 1720 1888 2176  1200 12=
03 1207 1255 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "1280x1024": 159.5 MHz (scaled from 0.0 MHz),=
 91.5 kHz, 84.8 Hz
(II) NOUVEAU(0): Modeline "1280x1024"  159.50  1280 1376 1512 1744  1024 10=
27 1034 1078 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz),=
 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"  135.00  1280 1296 1440 1688  1024 10=
25 1028 1066 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), =
67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"  108.00  1152 1216 1344 1600  864 865 =
868 900 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 112.2 MHz (scaled from 0.0 MHz), =
81.6 kHz, 100.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"  112.25  1024 1096 1200 1376  768 771 =
775 816 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 94.5 MHz (scaled from 0.0 MHz), 6=
8.7 kHz, 84.9 Hz
(II) NOUVEAU(0): Modeline "1024x768"   94.50  1024 1096 1200 1376  768 771 =
775 809 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 6=
0.1 kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"   78.80  1024 1040 1136 1312  768 769 =
772 800 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 5=
6.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"   75.00  1024 1048 1184 1328  768 771 =
777 806 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 4=
8.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"   65.00  1024 1048 1184 1344  768 771 =
777 806 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "1024x768": 44.9 MHz (scaled from 0.0 MHz), 3=
5.5 kHz, 87.0 Hz (I)
(II) NOUVEAU(0): Modeline "1024x768"   44.90  1024 1032 1208 1264  768 768 =
776 817 interlace +hsync +vsync
(**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49=
=2E7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"   57.28  832 864 928 1152  624 625 628 =
667 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "800x600": 56.8 MHz (scaled from 0.0 MHz), 53=
=2E7 kHz, 84.9 Hz
(II) NOUVEAU(0): Modeline "800x600"   56.75  800 848 928 1056  600 603 607 =
633 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48=
=2E1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"   50.00  800 856 976 1040  600 637 643 =
666 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46=
=2E9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"   49.50  800 816 896 1056  600 601 604 =
625 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37=
=2E9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"   40.00  800 840 968 1056  600 601 605 =
628 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35=
=2E2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"   36.00  800 824 896 1024  600 601 603 =
625 +hsync +vsync
(**) NOUVEAU(0):  Driver mode "640x480": 35.0 MHz (scaled from 0.0 MHz), 42=
=2E9 kHz, 84.6 Hz
(II) NOUVEAU(0): Modeline "640x480"   35.00  640 664 728 816  480 483 487 5=
07 -hsync +vsync
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37=
=2E5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"   31.50  640 656 720 840  480 481 484 5=
00 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37=
=2E9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"   31.50  640 664 704 832  480 489 491 5=
20 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35=
=2E0 kHz, 66.7 Hz
(II) NOUVEAU(0): Modeline "640x480"   30.24  640 704 768 864  480 483 486 5=
25 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31=
=2E5 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "640x480"   25.20  640 656 752 800  480 490 492 5=
25 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "720x400": 35.5 MHz (scaled from 0.0 MHz), 39=
=2E4 kHz, 87.8 Hz
(II) NOUVEAU(0): Modeline "720x400"   35.50  720 738 846 900  400 421 423 4=
49 -hsync -vsync
(**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31=
=2E5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"   28.32  720 738 846 900  400 412 414 4=
49 -hsync +vsync
(**) NOUVEAU(0): Display dimensions: (360, 270) mm
(**) NOUVEAU(0): DPI set to (112, 150)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules//libfb.so
(II) Module fb: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.3
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/xorg/modules//libexa.so
(II) Module exa: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 2.1.0
	ABI class: X.Org Video Driver, version 1.2
(II) Loading sub module "ramdac"
(II) LoadModule: "ramdac"(II) Module already built-in
(--) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
	[0] 0	0	0xe8000000 - 0xefffffff (0x8000000) MX[B]
	[1] 0	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B]
	[2] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[3] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[4] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[5] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[6] -1	0	0xe4800000 - 0xe48000ff (0x100) MX[B]
	[7] -1	0	0xe5000000 - 0xe50000ff (0x100) MX[B]
	[8] -1	0	0xe5800000 - 0xe580ffff (0x10000) MX[B]
	[9] -1	0	0xf0000000 - 0xefffffff (0x0) MX[B]O
	[10] -1	0	0xe7fe0000 - 0xe7ffffff (0x20000) MX[B](B)
	[11] -1	0	0xe8000000 - 0xefffffff (0x8000000) MX[B](B)
	[12] -1	0	0xe6000000 - 0xe6ffffff (0x1000000) MX[B](B)
	[13] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B](OprD)
	[14] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B](OprD)
	[15] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B](OprD)
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[18] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[19] -1	0	0x0000b000 - 0x0000b00f (0x10) IX[B]
	[20] -1	0	0x0000b400 - 0x0000b41f (0x20) IX[B]
	[21] -1	0	0x0000b800 - 0x0000b81f (0x20) IX[B]
	[22] -1	0	0x0000d000 - 0x0000d01f (0x20) IX[B]
	[23] -1	0	0x0000d400 - 0x0000d41f (0x20) IX[B]
	[24] -1	0	0x0000d800 - 0x0000d83f (0x40) IX[B]
	[25] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B](OprU)
	[26] 0	0	0x000003c0 - 0x000003df (0x20) IS[B](OprU)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: drmOpenMinor returns 8
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) NOUVEAU(0): [drm] DRM interface version 1.3
(II) NOUVEAU(0): [drm] created "nouveau" driver at busid "pci:0000:01:00.0"
(II) NOUVEAU(0): [drm] added 8192 byte SAREA at 0xf88a3000
(II) NOUVEAU(0): [drm] mapped SAREA 0xf88a3000 to 0xb7a46000
(II) NOUVEAU(0): [drm] framebuffer handle =3D 0xe8000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): Allocated 64MiB VRAM for framebuffer + offscreen pixmaps, =
at offset 0x0
(II) NOUVEAU(0): AGPGART: 128MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) NOUVEAU(0): Opened GPU channel 1
(II) NOUVEAU(0): CRTC 0: Console mode: 640x144 depth: 4 bpp: 4 crtc_start: =
0x0.
(II) NOUVEAU(0): CRTC 1: Console mode: 640x144 depth: 4 bpp: 4 crtc_start: =
0x0.
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): Saving VGA fonts
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): nv_crtc_save is called for CRTC 0.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): nv_crtc_save is called for CRTC 1.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): nv_output_save is called.
(II) NOUVEAU(0): nv_output_save is called.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): nv_output_mode_fixup is called.
(II) NOUVEAU(0): nv_output_prepare is called.
(II) NOUVEAU(0): nv_analog_output_dpms is called with mode 3.
(II) NOUVEAU(0): nv_crtc_prepare is called for CRTC 0.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): nv_crtc_dpms is called for CRTC 0 with mode 3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): nv_crtc_mode_set is called for CRTC 0.
(WW) NOUVEAU(0): Mode on CRTC 0
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  10=
24 1025 1028 1072 +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Mode clock: 157500
(II) NOUVEAU(0): Adjusted mode clock: 157500
(II) NOUVEAU(0): vpll: n 70 m 3 log2p 2
(II) NOUVEAU(0): Writing NV_RAMDAC_SEL_CLK 00000000
(II) NOUVEAU(0): Writing NV_RAMDAC_VPLL 00024603
(II) NOUVEAU(0): Writing NV_RAMDAC_PLL_SELECT 10000700
(II) NOUVEAU(0): NVCrtcSetBase is called with coordinates: x: 0 y: 0
(II) NOUVEAU(0): nv_output_mode_set is called.
(II) NOUVEAU(0): nv_crtc_commit for CRTC 0.
(II) NOUVEAU(0): nv_crtc_dpms is called for CRTC 0 with mode 0.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): nv_output_commit is called.
(II) NOUVEAU(0): Output VGA-0 is running on CRTC 0 using output A
(II) NOUVEAU(0): nv_analog_output_dpms is called with mode 0.
(II) NOUVEAU(0): nv_tmds_output_dpms is called with mode 3.
(II) NOUVEAU(0): nv_crtc_dpms is called for CRTC 1 with mode 3.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) EXA(0): Offscreen pixmap area of 56868864 bytes
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(=3D=3D) NOUVEAU(0): Backing store disabled
(=3D=3D) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): X context handle =3D 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(II) NOUVEAU(0): [DRI] installation complete
(**) Option "dpms"
(**) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled mes=
sage.
(II) NOUVEAU(0): Xv: Composite is enabled, enabling overlay with smart blit=
ter fallback
(II) NOUVEAU(0): Xv: Randr12 is enabled, using overlay with smart blitter f=
allback and automatic CRTC switching
(II) NOUVEAU(0): [XvMC] Associated with NV30 texture adapter.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(--) RandR disabled
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-APPGROUP
(II) Initializing built-in extension XAccessControlExtension
(II) Initializing built-in extension SECURITY
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension XFree86-Bigfont
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) Initializing built-in extension XEVIE
(II) Loading local sub module "GLcore"
(II) LoadModule: "GLcore"
(II) Loading /usr/lib/xorg/modules/extensions//libGLcore.so
(II) Module GLcore: vendor=3D"X.Org Foundation"
	compiled for 1.3.0, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) GLX: Initialized MESA-PROXY GL provider for screen 0
(II) NOUVEAU(0): Setting screen physical size to 352 x 264
(II) NOUVEAU(0): nv_xf86crtc_resize is called with 1280x1024 resolution.
(**) Option "Protocol" "PS/2"
(**) PSMouse: Device: "/dev/input/mice"
(**) PSMouse: Protocol: "PS/2"
(**) Option "AlwaysCore"
(**) PSMouse: always reports core events
(**) Option "Device" "/dev/input/mice"
(**) Option "Emulate3Buttons"
(**) PSMouse: Emulate3Buttons, Emulate3Timeout: 50
(**) PSMouse: ZAxisMapping: buttons 4 and 5
(**) PSMouse: Buttons: 9
(**) PSMouse: Sensitivity: 1
(II) evdev brain: Rescanning devices (1).
(**) Option "CorePointer"
(**) Mouse1-usb-0000:00:10.1-2/input0: Core Pointer
(II) Mouse1-usb-0000:00:10.1-2/input0: Found 3 relative axes.
(II) Mouse1-usb-0000:00:10.1-2/input0: Configuring as pointer.
(**) Mouse1-usb-0000:00:10.1-2/input0: WHEELRelativeAxisButtons: 4 5.
(II) Mouse1-usb-0000:00:10.1-2/input0: Found 3 mouse buttons
(**) Mouse1-usb-0000:00:10.1-2/input0: Configuring 3 relative axes.
(II) Mouse1-usb-0000:00:10.1-2/input0: Configured 5 mouse buttons
(**) Option "CoreKeyboard"
(**) Keyboard1: Core Keyboard
(**) Option "Protocol" "standard"
(**) Keyboard1: Protocol: standard
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xorg"
(**) Keyboard1: XkbRules: "xorg"
(**) Option "XkbModel" "pc105"
(**) Keyboard1: XkbModel: "pc105"
(**) Option "XkbLayout" "latin+level3,colemak"
(**) Keyboard1: XkbLayout: "latin+level3,colemak"
(**) Option "XkbOptions" "grp:alt_shift_toggle"
(**) Keyboard1: XkbOptions: "grp:alt_shift_toggle"
(**) Option "CustomKeycodes" "off"
(**) Keyboard1: CustomKeycodes disabled
(II) XINPUT: Adding extended input device "Keyboard1" (type: KEYBOARD)
(II) XINPUT: Adding extended input device "Mouse1-usb-0000:00:10.1-2/input0=
" (type: MOUSE)
(II) XINPUT: Adding extended input device "evdev brain" (type: evdev brain)
(II) XINPUT: Adding extended input device "PSMouse" (type: MOUSE)
(**) Mouse1-usb-0000:00:10.1-2/input0: 3 valuators.
(**) evdev_btn.c (166): Registering 5 buttons.
(II) Mouse1-usb-0000:00:10.1-2/input0: Init
(II) PSMouse: ps2EnableDataReporting: succeeded
(II) evdev brain: Rescanning devices (2).
(II) Mouse1-usb-0000:00:10.1-2/input0: On

--Boundary-01=_EkJoI8ZWc+IpAZu
Content-Type: text/plain;
  charset="utf-8";
  name="xorg.conf"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="xorg.conf"

# $XFree86: xc/programs/Xserver/hw/xfree86/XF86Conf.cpp,v 3.45 2003/02/20 0=
4:05:12 dawes Exp $
#
# Copyright (c) 1994-1998 by The XFree86 Project, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#=20
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#=20
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
# THE XFREE86 PROJECT BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
# OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#=20
# Except as contained in this notice, the name of the XFree86 Project shall
# not be used in advertising or otherwise to promote the sale, use or other
# dealings in this Software without prior written authorization from the
# XFree86 Project.
#
# $XConsortium: XF86Conf.cpp /main/22 1996/10/23 11:43:51 kaleb $

# **********************************************************************
# This is a sample configuration file only, intended to illustrate
# what a config file might look like.  Refer to the XF86Config(4/5)
# man page for details about the format of this file. This man page
# is installed as /usr/X11R6/man/man5/XF86Config.5x=20
# **********************************************************************

# The ordering of sections is not important in version 4.0 and later.

# **********************************************************************
# Files section.  This allows default font and rgb paths to be set
# **********************************************************************

Section "Files"

# The location of the RGB database.  Note, this is the name of the
# file minus the extension (like ".txt" or ".db").  There is normally
# no need to change the default.

    RgbPath	"/usr/share/X11/rgb"

# Multiple FontPath entries are allowed (which are concatenated together),
# as well as specifying multiple comma-separated entries in one FontPath
# command (or a combination of both methods)

	FontPath	"unix/:-1"
#    FontPath   "/usr/share/fonts/local/"
#    FontPath   "/usr/share/fonts/misc/"
#    FontPath   "/usr/share/fonts/75dpi/:unscaled"
#    FontPath   "/usr/share/fonts/100dpi/:unscaled"
#    FontPath   "/usr/share/fonts/Type1/"
#    FontPath   "/usr/share/fonts/Speedo/"
#    FontPath   "/usr/share/fonts/75dpi/"
#    FontPath   "/usr/share/fonts/100dpi/"
#    FontPath   "/usr/share/fonts/ttf/zh_TW/"
#    FontPath   "/usr/share/fonts/ttf/zh_CN/"
#	FontPath   "/usr/share/fonts/corefonts"
#	FontPath   "/usr/share/fonts/artwiz"
#	FontPath   "/usr/share/fonts/xawtv"
# The default path is shown here.

#    ModulePath	"/usr/lib/xorg/modules"

EndSection

# **********************************************************************
# Module section -- this is an optional section which is used to specify
# which run-time loadable modules to load when the X server starts up.
# **********************************************************************

Section "Module"

# This loads the DBE extension module.

    Load        "dbe"  	# Double buffer extension

#    Load	"extmod"
# This loads the miscellaneous extensions module, and disables
# initialisation of the XFree86-DGA extension within that module.

    SubSection	"extmod"
		Option	"omit xfree86-dga"
    EndSubSection

# This loads the Type1 and FreeType font modules

    Load	"type1"
    Load	"freetype"

	Load    "glx"
#	Load    "v4l"

EndSection

Section "Extensions"
    Option "Composite" "Enable"
EndSection

# **********************************************************************
# Server flags section.  This contains various server-wide Options.
# **********************************************************************

Section "ServerFlags"

# Uncomment this to cause a core dump at the spot where a signal is=20
# received.  This may leave the console in an unusable state, but may
# provide a better stack trace in the core dump to aid in debugging

#    Option	"NoTrapSignals"

# Uncomment this to disable the <Crtl><Alt><Fn> VT switch sequence
# (where n is 1 through 12).  This allows clients to receive these key
# events.

#    Option	"DontVTSwitch"

# Uncomment this to disable the <Crtl><Alt><BS> server abort sequence
# This allows clients to receive this key event.

#    Option	"DontZap"

# Uncomment this to disable the <Crtl><Alt><KP_+>/<KP_-> mode switching
# sequences.  This allows clients to receive these key events.

#    Option	"DontZoom"

# Uncomment this to disable tuning with the xvidtune client. With
# it the client can still run and fetch card and monitor attributes,
# but it will not be allowed to change them. If it tries it will
# receive a protocol error.

#    Option	"DisableVidModeExtension"

# Uncomment this to enable the use of a non-local xvidtune client.

#    Option	"AllowNonLocalXvidtune"

# Uncomment this to disable dynamically modifying the input device
# (mouse and keyboard) settings.

#    Option	"DisableModInDev"

# Uncomment this to enable the use of a non-local client to
# change the keyboard or mouse settings (currently only xset).

#    Option	"AllowNonLocalModInDev"

# Set the basic blanking screen saver timeout.

    Option	"blank time"	"10"	# 10 minutes

# Set the DPMS timeouts.  These are set here because they are global
# rather than screen-specific.  These settings alone don't enable DPMS.
# It is enabled per-screen (or per-monitor), and even then only when
# the driver supports it.

    Option	"standby time"	"20"
    Option	"suspend time"	"30"
    Option	"off time"	"60"

# On some platform the server needs to estimate the sizes of PCI
# memory and pio ranges. This is done by assuming that PCI ranges
# don't overlap. Some broken BIOSes tend to set ranges of inactive
# devices wrong. Here one can adjust how aggressive the assumptions
# should be. Default is 0.

# Option   "EstimateSizesAggresively" "0"

EndSection

# **********************************************************************
# Input devices
# **********************************************************************

# **********************************************************************
# Core keyboard's InputDevice section
# **********************************************************************

Section "InputDevice"

    Identifier	"Keyboard1"
    Driver	"kbd"

# For most OSs the protocol can be omitted (it defaults to "Standard").
# When using XQUEUE (only for SVR3 and SVR4, but not Solaris), comment
# out the above line, and uncomment the following line.

#    Option	"Protocol"	"Xqueue"

# Set the keyboard auto repeat parameters.  Not all platforms implement
# this.

    Option	"AutoRepeat"	"500 30"

# Specifiy which keyboard LEDs can be user-controlled (eg, with xset(1)).

#    Option	"Xleds"	"1 2 3"

#    Option "LeftAlt"     "Meta"
#    Option "RightAlt"    "ModeShift"

# To customise the XKB settings to suit your keyboard, modify the
# lines below (which are the defaults).  For example, for a European
# keyboard, you will probably want to use one of:
#
#    Option	"XkbModel"	"pc102"
#    Option	"XkbModel"	"pc105"
#
# If you have a Microsoft Natural keyboard, you can use:
#
#    Option	"XkbModel"	"microsoft"
#
# If you have a US "windows" keyboard you will want:
#
#    Option	"XkbModel"	"pc104"
#
# Then to change the language, change the Layout setting.
# For example, a german layout can be obtained with:
#
#    Option	"XkbLayout"	"de"
#
# or:
#
#    Option	"XkbLayout"	"de"
#    Option	"XkbVariant"	"nodeadkeys"
#
# If you'd like to switch the positions of your capslock and
# control keys, use:
#
#    Option	"XkbOptions"	"ctrl:swapcaps"


# These are the default XKB settings for XFree86

#    Option "XkbModel"    "pc101"
#    Option "XkbLayout"   "us"
#    Option "XkbVariant"  ""
#    Option "XkbOptions"  ""

#    Option "XkbDisable"


    Option "XkbModel"	"pc105"
    Option "XkbLayout"	"latin+level3,colemak"
#    Option "XkbOptions"	"altwin:meta_alt"
    Option "XkbOptions"	"grp:alt_shift_toggle"

EndSection


# **********************************************************************
# Core Pointer's InputDevice section
# **********************************************************************
Section "InputDevice"

# Identifier and driver

    Identifier	"PSMouse"
    Driver	"mouse"
    Option "Protocol"    	"PS/2"
    Option "Device"      	"/dev/input/mice"
#    Option "Device"      	"/dev/input/by-id/usb-Microsoft_Microsoft_Wheel_=
Mouse_Optical-mouse"
#    Option "ZAxisMapping" 	"4 5"

#    Option "Device"      	"/dev/input/event4"

# The mouse protocol and device.  The device is normally set to /dev/mouse,
# which is usually a symbolic link to the real device.

#    Option	"Protocol"	"Microsoft"
#    Option	"Device"	"/dev/mouse"

# On platforms where PnP mouse detection is supported the following
# protocol setting can be used when using a newer PnP mouse:

#    Option	"Protocol"	"Auto"

# When using mouse connected to a PS/2 port (aka "MousePort), set the
# the protocol as follows.  On some platforms some other settings may
# be available.

#    Option "Protocol"	"PS/2"

# When using XQUEUE (only for SVR3 and SVR4, but not Solaris), use
# the following instead of any of the lines above.  The Device line
# is not required in this case.

#    Option	"Protocol"	"Xqueue"

# Baudrate and SampleRate are only for some older Logitech mice.  In
# almost every case these lines should be omitted.

#    Option	"BaudRate"	"9600"
#    Option	"SampleRate"	"150"

# Emulate3Buttons is an option for 2-button mice
# Emulate3Timeout is the timeout in milliseconds (default is 50ms)

    Option	"Emulate3Buttons"
#    Option	"Emulate3Timeout"	"50"

# ChordMiddle is an option for some 3-button Logitech mice, or any
# 3-button mouse where the middle button generates left+right button
# events.

#    Option	"ChordMiddle"

EndSection

Section "InputDevice"

# Identifier and driver

    Identifier	"Mouse1"
#    Driver	"mouse"
#    Option "Protocol"    	"IMPS/2"
#    Option "Device"      	"/dev/input/microsoftmouse"
#    Option "Device"      	"/dev/input/by-id/usb-Microsoft_Microsoft_Wheel_=
Mouse_Optical-mouse"
#    Option "ZAxisMapping" 	"4 5"

	Driver		"evdev"
	Option		"Name" 		"Microsoft Microsoft Wheel Mouse Optical*"
#    Option "Device"      	"/dev/input/event4"

# The mouse protocol and device.  The device is normally set to /dev/mouse,
# which is usually a symbolic link to the real device.

#    Option	"Protocol"	"Microsoft"
#    Option	"Device"	"/dev/mouse"

# On platforms where PnP mouse detection is supported the following
# protocol setting can be used when using a newer PnP mouse:

#    Option	"Protocol"	"Auto"

# When using mouse connected to a PS/2 port (aka "MousePort), set the
# the protocol as follows.  On some platforms some other settings may
# be available.

#    Option "Protocol"	"PS/2"

# When using XQUEUE (only for SVR3 and SVR4, but not Solaris), use
# the following instead of any of the lines above.  The Device line
# is not required in this case.

#    Option	"Protocol"	"Xqueue"

# Baudrate and SampleRate are only for some older Logitech mice.  In
# almost every case these lines should be omitted.

#    Option	"BaudRate"	"9600"
#    Option	"SampleRate"	"150"

# Emulate3Buttons is an option for 2-button mice
# Emulate3Timeout is the timeout in milliseconds (default is 50ms)

#    Option	"Emulate3Buttons"
#    Option	"Emulate3Timeout"	"50"

# ChordMiddle is an option for some 3-button Logitech mice, or any
# 3-button mouse where the middle button generates left+right button
# events.

#    Option	"ChordMiddle"

EndSection

Section "InputDevice"

# Identifier and driver

    Identifier	"Bluemouse"

	Driver		"evdev"
	Option		"Name" 		"Logitech Bluetooth Mouse"

EndSection



# **********************************************************************
# Other input device sections=20
# this is optional and is required only if you
# are using extended input devices.  This is for example only.  Refer
# to the XF86Config man page for a description of the options.
# **********************************************************************
#
# Section "InputDevice"=20
#    Identifier  "Mouse2"
#    Driver      "mouse"
#    Option      "Protocol"      "MouseMan"
#    Option      "Device"        "/dev/mouse2"
# EndSection
#
# Section "InputDevice"
#    Identifier	"spaceball"
#    Driver	"magellan"
#    Option	"Device"	"/dev/cua0"
# EndSection
#
# Section "InputDevice"
#    Identifier	"spaceball2"
#    Driver	"spaceorb"
#    Option	"Device"	"/dev/cua0"
# EndSection
#
# Section "InputDevice"
#    Identifier	"touchscreen0"
#    Driver	"microtouch"
#    Option	"Device"	"/dev/ttyS0"
#    Option	"MinX"		"1412"
#    Option	"MaxX"		"15184"
#    Option	"MinY"		"15372"
#    Option	"MaxY"		"1230"
#    Option	"ScreenNumber"	"0"
#    Option	"ReportingMode"	"Scaled"
#    Option	"ButtonNumber"	"1"
#    Option	"SendCoreEvents"
# EndSection
#
# Section "InputDevice"
#    Identifier	"touchscreen1"
#    Driver	"elo2300"
#    Option	"Device"	"/dev/ttyS0"
#    Option	"MinX"		"231"
#    Option	"MaxX"		"3868"
#    Option	"MinY"		"3858"
#    Option	"MaxY"		"272"
#    Option	"ScreenNumber"	"0"
#    Option	"ReportingMode"	"Scaled"
#    Option	"ButtonThreshold"	"17"
#    Option	"ButtonNumber"	"1"
#    Option	"SendCoreEvents"
# EndSection

# **********************************************************************
# Monitor section
# **********************************************************************

# Any number of monitor sections may be present

Section "Monitor"

    Identifier  "TV"

# HorizSync is in kHz unless units are specified.
# HorizSync may be a comma separated list of discrete values, or a
# comma separated list of ranges of values.
# NOTE: THE VALUES HERE ARE EXAMPLES ONLY.  REFER TO YOUR MONITOR'S
# USER MANUAL FOR THE CORRECT NUMBERS.

    HorizSync   30-90

#    HorizSync	30-64         # multisync
#    HorizSync	31.5, 35.2    # multiple fixed sync frequencies
#    HorizSync	15-25, 30-50  # multiple ranges of sync frequencies

# VertRefresh is in Hz unless units are specified.
# VertRefresh may be a comma separated list of discrete values, or a
# comma separated list of ranges of values.
# NOTE: THE VALUES HERE ARE EXAMPLES ONLY.  REFER TO YOUR MONITOR'S
# USER MANUAL FOR THE CORRECT NUMBERS.

    VertRefresh 50-60



# If a monitor requires that the sync signals be superimposed on the
# green signal, the following option will enable this when used with
# drivers that support it.  Only a relatively small range of hardware
# (and drivers) actually support this.

#    Option	"sync on green"

Option	"TVStandard"		"Pal-G"

EndSection

Section "Monitor"

    Identifier  "Samtron 95P"

# HorizSync is in kHz unless units are specified.
# HorizSync may be a comma separated list of discrete values, or a
# comma separated list of ranges of values.
# NOTE: THE VALUES HERE ARE EXAMPLES ONLY.  REFER TO YOUR MONITOR'S
# USER MANUAL FOR THE CORRECT NUMBERS.

    HorizSync   30-96

#    HorizSync	30-64         # multisync
#    HorizSync	31.5, 35.2    # multiple fixed sync frequencies
#    HorizSync	15-25, 30-50  # multiple ranges of sync frequencies

# VertRefresh is in Hz unless units are specified.
# VertRefresh may be a comma separated list of discrete values, or a
# comma separated list of ranges of values.
# NOTE: THE VALUES HERE ARE EXAMPLES ONLY.  REFER TO YOUR MONITOR'S
# USER MANUAL FOR THE CORRECT NUMBERS.

    VertRefresh 50-160


    Option	"dpms"

# If a monitor requires that the sync signals be superimposed on the
# green signal, the following option will enable this when used with
# drivers that support it.  Only a relatively small range of hardware
# (and drivers) actually support this.

#    Option	"sync on green"

EndSection

# **********************************************************************
# Graphics device section
# **********************************************************************

# Any number of graphics device sections may be present

# Standard VGA Device:

Section "Device"

# The Identifier must be present.

    Identifier	"Generic VGA"

# The Driver line must be present.  When using run-time loadable driver
# modules, this line instructs the server to load the specified driver
# module.  Even when not using loadable driver modules, this line
# indicates which driver should interpret the information in this section.

    Driver	"vga"

# The chipset line is optional in most cases.  It can be used to override
# the driver's chipset detection, and should not normally be specified.

#    Chipset	"generic"

# Various other lines can be specified to override the driver's automatic
# detection code.  In most cases they are not needed.

#    VideoRam	256
#    Clocks	25.2 28.3

# The BusID line is used to specify which of possibly multiple devices
# this section is intended for.  When this line isn't present, a device
# section can only match up with the primary video device.  For PCI
# devices a line like the following could be used.  This line should not
# normally be included unless there is more than one video device
# intalled.

#    BusID	"PCI:0:10:0"

# Various option lines can be added here as required.  Some options
# are more appropriate in Screen sections, Display subsections or even
# Monitor sections.

#    Option	"hw cursor" "off"

EndSection

# Device configured by xf86config:

Section "Device"
    Identifier  "Geforce 2 MX"
    Driver      "nvidia"
	Option		"RenderAccel" "true"
	Option		"AddARGBGLXVisuals" "true"
#	Option		"AllowGLXWithComposite" "true"
#	Option		"NoRenderExtension" "true"
	Option 		"IgnoreDisplayDevices" "DFP, TV"
	Option		"NvAGP"	"1"
	Option		"UseEDIDDpi"	"false"
	Option		"DPI"		"92x92"
#	Option		"BackingStore" "On"
    #VideoRam    32768
    # Insert Clocks lines here if appropriate
EndSection

Section "Device"
    Identifier  "Nouveau0"
    Driver      "nouveau"
#	Option		"AllowGLXWithComposite" "true"
#	Option		"NoRenderExtension" "true"
#	Option		"BackingStore" "On"
    #VideoRam    32768
    # Insert Clocks lines here if appropriate
EndSection


Section "Device"
    Identifier  "Geforce 2 MX TwinView"
    Driver      "nvidia"
	Option		"RenderAccel" "true"
	Option		"AddARGBGLXVisuals" "true"
#	Option		"NoRenderExtension" "true"
	Option 		"IgnoreDisplayDevices" "DFP"
    #VideoRam    32768
    # Insert Clocks lines here if appropriate
	Option		"TwinView"
	Option		"SecondMonitorHorizSync"	"30-50"
	Option		"SecondMonitorVertRefresh"	"50"
	Option		"TwinViewOrientation"		"clone"
	Option		"MetaModes"					"1280x1024,NULL; NULL,800x600"
    Option 		"ConnectedMonitor"         "crt,TV"
EndSection

Section "Device"
    Identifier  "Geforce 2 MX TV"
    Driver      "nvidia"
	Option		"RenderAccel" "false"
#	Option		"NoRenderExtension" "true"
	Option 		"IgnoreDisplayDevices" "DFP"
    #VideoRam    32768
    # Insert Clocks lines here if appropriate
    Option 		"ConnectedMonitor"         "TV"
EndSection


# **********************************************************************
# Screen sections.
# **********************************************************************

# Any number of screen sections may be present.  Each describes
# the configuration of a single screen.  A single specific screen section
# may be specified from the X server command line with the "-screen"
# option.
Section "Screen"
    Identifier  "Screen 1"
    Device      "Geforce 2 MX"
    Monitor     "Samtron 95P"
    DefaultDepth 24

    Subsection "Display"
        Depth       8
        Modes       "640x480" "768x576" "800x600" "1024x768" "1280x1024"
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       16
        Modes       "1280x1024" "768x576" "1024x768" "800x600" "640x480"=20
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       24
        Modes       "1280x1024" "768x576" "1024x768" "800x600" "640x480"
        ViewPort    0 0
    EndSubsection
EndSection

Section "Screen"
    Identifier  "Nouveau Screen"
    Device      "Nouveau0"
    Monitor     "Samtron 95P"
    DefaultDepth 24

    Subsection "Display"
        Depth       8
        Modes       "640x480" "768x576" "800x600" "1024x768" "1280x1024"
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       16
        Modes       "1280x1024" "768x576" "1024x768" "800x600" "640x480"=20
        ViewPort    0 0
    EndSubsection
    Subsection "Display"
        Depth       24
        Modes       "1280x1024" "768x576" "1024x768" "800x600" "640x480"
        ViewPort    0 0
    EndSubsection
EndSection

Section "Screen"
    Identifier  "Screen TV"
    Device      "Geforce 2 MX TV"
    Monitor     "TV"
    DefaultDepth 16

    Subsection "Display"
        Depth       16
        Modes       "800x600" "640x480"
        ViewPort    0 0
    EndSubsection
EndSection

# **********************************************************************
# ServerLayout sections.
# **********************************************************************

# Any number of ServerLayout sections may be present.  Each describes
# the way multiple screens are organised.  A specific ServerLayout
# section may be specified from the X server command line with the
# "-layout" option.  In the absence of this, the first section is used.
# When now ServerLayout section is present, the first Screen section
# is used alone.

Section "ServerLayout"

# The Identifier line must be present
    Identifier  "Simple Layout"

# Each Screen line specifies a Screen section name, and optionally
# the relative position of other screens.  The four names after
# primary screen name are the screens to the top, bottom, left and right
# of the primary screen.  In this example, screen 2 is located to the
# right of screen 1.

    Screen "Screen 1"

# Each InputDevice line specifies an InputDevice section name and
# optionally some options to specify the way the device is to be
# used.  Those options include "CorePointer", "CoreKeyboard" and
# "SendCoreEvents".  In this example, "Mouse1" is the core pointer,
# and "Mouse2" is an extended input device that also generates core
# pointer events (i.e., both mice will move the standard pointer).

    InputDevice "PSMouse" "AlwaysCore"
    InputDevice "Mouse1" "CorePointer"
#    InputDevice "Bluemouse" "AlwaysCore"
    InputDevice "Keyboard1" "CoreKeyboard"

	Option         "AIGLX" "true"

EndSection

Section "ServerLayout"
    Identifier  "NouveauLayout"
    Screen "Nouveau Screen"
    InputDevice "PSMouse" "AlwaysCore"
    InputDevice "Mouse1" "CorePointer"
#    InputDevice "Bluemouse" "AlwaysCore"
    InputDevice "Keyboard1" "CoreKeyboard"
	Option         "AIGLX" "false"
EndSection

Section "ServerLayout"

# The Identifier line must be present
    Identifier  "TV"

# Each Screen line specifies a Screen section name, and optionally
# the relative position of other screens.  The four names after
# primary screen name are the screens to the top, bottom, left and right
# of the primary screen.  In this example, screen 2 is located to the
# right of screen 1.

    Screen "Screen TV"

# Each InputDevice line specifies an InputDevice section name and
# optionally some options to specify the way the device is to be
# used.  Those options include "CorePointer", "CoreKeyboard" and
# "SendCoreEvents".  In this example, "Mouse1" is the core pointer,
# and "Mouse2" is an extended input device that also generates core
# pointer events (i.e., both mice will move the standard pointer).

#    InputDevice "Mouse1" "AlwaysCore"
    InputDevice "PSMouse" "CorePointer"
    InputDevice "Bluemouse" "AlwaysCore"
    InputDevice "Keyboard1" "CoreKeyboard"

EndSection


--Boundary-01=_EkJoI8ZWc+IpAZu--

--nextPart2471745.NT14HDxTuR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEABECAAYFAkigmQkACgkQoaeDF2W6mwcvewCfRsFfNCEi5IuBV6t4ge1ffi8G
jOgAoKkfJSEANEG+QSZv1an3gh54dAwO
=5X7p
-----END PGP SIGNATURE-----

--nextPart2471745.NT14HDxTuR--

--===============1489550439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1489550439==--

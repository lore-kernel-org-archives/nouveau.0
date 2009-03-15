From: Martin Ketzer <martin.ketzer-Mmb7MZpHnFY@public.gmane.org>
Subject: Unknown DCB 1.4 / 1.5 entry, please report
Date: Sun, 15 Mar 2009 17:47:29 +0100
Message-ID: <49BD3121.3020608@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020401010807070605000608"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------020401010807070605000608
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hallo,
when i am trying to use nouveau i get the errors in the attached Xorg.log=
=2E I'm using debian
unstable. Any suggestions?


--------------020401010807070605000608
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="Xorg.0.log"


X.Org X Server 1.4.2
Release Date: 11 June 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux Debian (xorg-server 2:1.4.2-11)
Current Operating System: Linux ketzer-p933 2.6.27.15 #1 PREEMPT Sat Feb =
7 13:17:19 CET 2009 i686
Build Date: 20 February 2009  03:06:29AM
=20
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Sun Mar 15 17:22:30 2009
(=3D=3D) Using config file: "/etc/X11/xorg.conf"
(=3D=3D) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Generic Monitor"
(**) |   |-->Device "Generic Video Card"
(**) |-->Input Device "Generic Keyboard"
(**) |-->Input Device "Configured Mouse"
(**) |-->Input Device "Synaptics Touchpad"
(**) Option "DontZap"
(**) Option "BlankTime" "0"
(**) Option "StandbyTime" "0"
(**) Option "SuspendTime" "0"
(**) Option "OffTime" "0"
(**) Option "AIGLX" "true"
(=3D=3D) Automatically adding devices
(=3D=3D) Automatically enabling devices
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
	Entry deleted from font path.
(=3D=3D) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType
(=3D=3D) RgbPath set to "/etc/X11/rgb"
(=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
(**) Extension "Composite" is enabled
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x81e3800
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 2.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 0.3
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/xorg/modules//libpcidata.so
(II) Module pcidata: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(++) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 8086,3575 card 1179,ff00 rev 02 class 06,00,00 hd=
r 00
(II) PCI: 00:01:0: chip 8086,3576 card 0000,0000 rev 02 class 06,04,00 hd=
r 01
(II) PCI: 00:1d:0: chip 8086,2482 card 1179,ff00 rev 01 class 0c,03,00 hd=
r 80
(II) PCI: 00:1d:1: chip 8086,2484 card 1179,ff00 rev 01 class 0c,03,00 hd=
r 00
(II) PCI: 00:1d:2: chip 8086,2487 card 1179,ff00 rev 01 class 0c,03,00 hd=
r 00
(II) PCI: 00:1e:0: chip 8086,2448 card 0000,0000 rev 41 class 06,04,00 hd=
r 01
(II) PCI: 00:1f:0: chip 8086,248c card 0000,0000 rev 01 class 06,01,00 hd=
r 80
(II) PCI: 00:1f:1: chip 8086,248a card 1179,ff00 rev 01 class 01,01,8a hd=
r 00
(II) PCI: 00:1f:3: chip 8086,2483 card 1179,ff00 rev 01 class 0c,05,00 hd=
r 00
(II) PCI: 00:1f:5: chip 8086,2485 card 1179,ff00 rev 01 class 04,01,00 hd=
r 00
(II) PCI: 00:1f:6: chip 8086,2486 card 1179,0001 rev 01 class 07,03,00 hd=
r 00
(II) PCI: 01:00:0: chip 10de,0112 card 1179,ff00 rev b2 class 03,00,00 hd=
r 00
(II) PCI: 02:00:0: chip 104c,8023 card 1179,ff00 rev 00 class 0c,00,10 hd=
r 00
(II) PCI: 02:01:0: chip 10ec,8139 card 1179,ff00 rev 10 class 02,00,00 hd=
r 00
(II) PCI: 02:04:0: chip 104c,ac51 card 3400,0000 rev 00 class 06,07,00 hd=
r 82
(II) PCI: 02:04:1: chip 104c,ac51 card 3c00,0000 rev 00 class 06,07,00 hd=
r 82
(II) PCI: 02:06:0: chip 1179,0804 card 1179,ff00 rev 02 class 08,80,00 hd=
r 00
(II) PCI: End of PCI scan
(II) Intel Bridge workaround enabled
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (0,0,7), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 1: bridge is at (0:1:0), (0,1,1), BCTRL: 0x000c (VGA_EN is set)
(II) Bus 1 non-prefetchable memory range:
	[0] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B]
(II) Subtractive PCI-to-PCI bridge:
(II) Bus 2: bridge is at (0:30:0), (0,2,10), BCTRL: 0x0004 (VGA_EN is cle=
ared)
(II) Bus 2 I/O range:
	[0] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[1] -1	0	0x00003400 - 0x000034ff (0x100) IX[B]
	[2] -1	0	0x00003800 - 0x000038ff (0x100) IX[B]
	[3] -1	0	0x00003c00 - 0x00003cff (0x100) IX[B]
(II) Bus 2 non-prefetchable memory range:
	[0] -1	0	0xd2000000 - 0xd20fffff (0x100000) MX[B]
(II) Bus 2 prefetchable memory range:
	[0] -1	0	0x50000000 - 0x57ffffff (0x8000000) MX[B]
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:31:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is s=
et)
(II) PCI-to-CardBus bridge:
(II) Bus 3: bridge is at (2:4:0), (2,3,6), BCTRL: 0x05c0 (VGA_EN is clear=
ed)
(II) Bus 3 I/O range:
	[0] -1	0	0x00003400 - 0x000034ff (0x100) IX[B]
	[1] -1	0	0x00003800 - 0x000038ff (0x100) IX[B]
(II) Bus 3 prefetchable memory range:
	[0] -1	0	0x50000000 - 0x53ffffff (0x4000000) MX[B]
(II) PCI-to-CardBus bridge:
(II) Bus 7: bridge is at (2:4:1), (2,7,10), BCTRL: 0x05c0 (VGA_EN is clea=
red)
(II) Bus 7 I/O range:
	[0] -1	0	0x00003c00 - 0x00003cff (0x100) IX[B]
(II) Bus 7 prefetchable memory range:
	[0] -1	0	0x54000000 - 0x57ffffff (0x4000000) MX[B]
(--) PCI:*(1:0:0) nVidia Corporation NV11 [GeForce2 Go] rev 178, Mem @ 0x=
d1000000/24, 0xf0000000/27
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
(II) PCI Memory resource overlap reduced 0xe0000000 from 0xefffffff to 0x=
dfffffff
(II) Active PCI resource ranges:
	[0] -1	0	0xd2004c00 - 0xd2004c1f (0x20) MX[B]
	[1] -1	0	0xd2004800 - 0xd20048ff (0x100) MX[B]
	[2] -1	0	0xd2000000 - 0xd2003fff (0x4000) MX[B]
	[3] -1	0	0xd2004000 - 0xd20047ff (0x800) MX[B]
	[4] -1	0	0xd0000000 - 0xd00003ff (0x400) MX[B]
	[5] -1	0	0xe0000000 - 0xdfffffff (0x0) MX[B]O
	[6] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B](B)
	[7] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B](B)
	[8] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[9] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[10] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[11] -1	0	0x000018c0 - 0x000018ff (0x40) IX[B]
	[12] -1	0	0x00001c00 - 0x00001cff (0x100) IX[B]
	[13] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[14] -1	0	0x00001860 - 0x0000186f (0x10) IX[B]
	[15] -1	0	0x00000374 - 0x00000374 (0x1) IX[B]
	[16] -1	0	0x00000170 - 0x00000177 (0x8) IX[B]
	[17] -1	0	0x000003f4 - 0x000003f4 (0x1) IX[B]
	[18] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[19] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[20] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[21] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xd2004c00 - 0xd2004c1f (0x20) MX[B]
	[1] -1	0	0xd2004800 - 0xd20048ff (0x100) MX[B]
	[2] -1	0	0xd2000000 - 0xd2003fff (0x4000) MX[B]
	[3] -1	0	0xd2004000 - 0xd20047ff (0x800) MX[B]
	[4] -1	0	0xd0000000 - 0xd00003ff (0x400) MX[B]
	[5] -1	0	0xe0000000 - 0xdfffffff (0x0) MX[B]O
	[6] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B](B)
	[7] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B](B)
	[8] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[9] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[10] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[11] -1	0	0x000018c0 - 0x000018ff (0x40) IX[B]
	[12] -1	0	0x00001c00 - 0x00001cff (0x100) IX[B]
	[13] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[14] -1	0	0x00001860 - 0x0000186f (0x10) IX[B]
	[15] -1	0	0x00000374 - 0x00000374 (0x1) IX[B]
	[16] -1	0	0x00000170 - 0x00000177 (0x8) IX[B]
	[17] -1	0	0x000003f4 - 0x000003f4 (0x1) IX[B]
	[18] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[19] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[20] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[21] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
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
	[4] -1	0	0xd2004c00 - 0xd2004c1f (0x20) MX[B]
	[5] -1	0	0xd2004800 - 0xd20048ff (0x100) MX[B]
	[6] -1	0	0xd2000000 - 0xd2003fff (0x4000) MX[B]
	[7] -1	0	0xd2004000 - 0xd20047ff (0x800) MX[B]
	[8] -1	0	0xd0000000 - 0xd00003ff (0x400) MX[B]
	[9] -1	0	0xe0000000 - 0xdfffffff (0x0) MX[B]O
	[10] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B](B)
	[11] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B](B)
	[12] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[13] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[14] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[15] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[16] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[17] -1	0	0x000018c0 - 0x000018ff (0x40) IX[B]
	[18] -1	0	0x00001c00 - 0x00001cff (0x100) IX[B]
	[19] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[20] -1	0	0x00001860 - 0x0000186f (0x10) IX[B]
	[21] -1	0	0x00000374 - 0x00000374 (0x1) IX[B]
	[22] -1	0	0x00000170 - 0x00000177 (0x8) IX[B]
	[23] -1	0	0x000003f4 - 0x000003f4 (0x1) IX[B]
	[24] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[25] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[26] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[27] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
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
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension TOG-CUP
(II) Loading extension Extended-Visual-Information
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(**) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules//fonts/libfreetype.so
(II) Module freetype: vendor=3D"X.Org Foundation & the After X-TT Project=
"
	compiled for 1.4.2, module version =3D 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 2.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor=3D"X.Org Foundation"
	compiled for 1.4.0.90, module version =3D 1.3.1
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor=3D"X.Org Foundation"
	compiled for 1.4.0.90, module version =3D 1.3.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "synaptics"
(II) Loading /usr/lib/xorg/modules/input//synaptics_drv.so
(II) Module synaptics: vendor=3D"X.Org Foundation"
	compiled for 4.3.99.902, module version =3D 1.0.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
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
(--) Chipset NVIDIA NV11 found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xd2004c00 - 0xd2004c1f (0x20) MX[B]
	[5] -1	0	0xd2004800 - 0xd20048ff (0x100) MX[B]
	[6] -1	0	0xd2000000 - 0xd2003fff (0x4000) MX[B]
	[7] -1	0	0xd2004000 - 0xd20047ff (0x800) MX[B]
	[8] -1	0	0xd0000000 - 0xd00003ff (0x400) MX[B]
	[9] -1	0	0xe0000000 - 0xdfffffff (0x0) MX[B]O
	[10] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B](B)
	[11] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B](B)
	[12] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[13] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[14] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[15] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[16] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[17] -1	0	0x000018c0 - 0x000018ff (0x40) IX[B]
	[18] -1	0	0x00001c00 - 0x00001cff (0x100) IX[B]
	[19] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[20] -1	0	0x00001860 - 0x0000186f (0x10) IX[B]
	[21] -1	0	0x00000374 - 0x00000374 (0x1) IX[B]
	[22] -1	0	0x00000170 - 0x00000177 (0x8) IX[B]
	[23] -1	0	0x000003f4 - 0x000003f4 (0x1) IX[B]
	[24] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[25] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[26] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[27] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
(II) resource ranges after probing:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xd2004c00 - 0xd2004c1f (0x20) MX[B]
	[5] -1	0	0xd2004800 - 0xd20048ff (0x100) MX[B]
	[6] -1	0	0xd2000000 - 0xd2003fff (0x4000) MX[B]
	[7] -1	0	0xd2004000 - 0xd20047ff (0x800) MX[B]
	[8] -1	0	0xd0000000 - 0xd00003ff (0x400) MX[B]
	[9] -1	0	0xe0000000 - 0xdfffffff (0x0) MX[B]O
	[10] -1	0	0xf0000000 - 0xf7ffffff (0x8000000) MX[B](B)
	[11] -1	0	0xd1000000 - 0xd1ffffff (0x1000000) MX[B](B)
	[12] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[13] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[14] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[15] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[16] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[17] -1	0	0x00003000 - 0x000030ff (0x100) IX[B]
	[18] -1	0	0x00002000 - 0x0000207f (0x80) IX[B]
	[19] -1	0	0x00002400 - 0x000024ff (0x100) IX[B]
	[20] -1	0	0x000018c0 - 0x000018ff (0x40) IX[B]
	[21] -1	0	0x00001c00 - 0x00001cff (0x100) IX[B]
	[22] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[23] -1	0	0x00001860 - 0x0000186f (0x10) IX[B]
	[24] -1	0	0x00000374 - 0x00000374 (0x1) IX[B]
	[25] -1	0	0x00000170 - 0x00000177 (0x8) IX[B]
	[26] -1	0	0x000003f4 - 0x000003f4 (0x1) IX[B]
	[27] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[28] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[29] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[30] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[31] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[32] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(--) NOUVEAU(0): Chipset: "NVIDIA NV11"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(=3D=3D) NOUVEAU(0): RGB weight 888
(=3D=3D) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor=3D"X.Org Foundation"
	compiled for 1.4.2, module version =3D 0.1.0
	ABI class: X.Org Video Driver, version 2.0
(=3D=3D) NOUVEAU(0): Randr1.2 support enabled
(=3D=3D) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xF0000000
(--) NOUVEAU(0): MMIO registers at 0xD1000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such device)
drmOpenDevice: open result is -1, (No such device)
drmOpenDevice: Open failed
[drm] failed to load kernel module "nouveau"
(EE) NOUVEAU(0): [dri] Failed to open the DRM
(EE) NOUVEAU(0): DRI pre-initialisation failed.  Setting NoAccel
(II) NOUVEAU(0): Initial CRTC_OWNER is 3
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(!!) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(!!) NOUVEAU(0): ... BIOS checksum invalid
(II) NOUVEAU(0): Attempting to load BIOS image from PCI ROM
(II) Attempted to read BIOS 64KB from /sys/bus/pci/devices/0000:01:00.0/r=
om: got 57KB
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BMP BIOS found
(II) NOUVEAU(0): BMP version 5.20
(II) NOUVEAU(0): Bios version 03.11.01.38
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xB9C0
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0xC0F0
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0xB9DB
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0xBA65
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0xBBB9
(--) NOUVEAU(0): Parsing VBIOS init table 5 at offset 0xBA8A
(--) NOUVEAU(0): Parsing VBIOS init table 6 at offset 0xC097
(--) NOUVEAU(0): Parsing VBIOS init table 7 at offset 0xBB54
(II) NOUVEAU(0): Found flat panel mode in BIOS tables:
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  76=
8 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Found Display Configuration Block version 1.5
(!!) NOUVEAU(0): Raw DCB entry 0: f0003f00 000088b8
(!!) NOUVEAU(0): Raw DCB entry 1: f2045ff2 00000980
(EE) NOUVEAU(0): Unknown DCB 1.4 / 1.5 entry, please report
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(EE) NOUVEAU(0): 1392: No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found

--------------020401010807070605000608
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------020401010807070605000608--

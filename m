From: Andrew McNabb <amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org>
Subject: hang when starting X
Date: Mon, 21 Apr 2008 11:15:41 -0600
Message-ID: <20080421171541.GA2795@mcnabbs.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1367494305=="
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


--===============1367494305==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline


--JP+T4n/bALQSJXh8
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi.  I've been testing Fedora rawhide, since Fedora 9 will be coming out
soon.  I tried running nouveau, and had a hang, so I thought I'd report
it here.  I'm not sure whether or not this is helpful, but I figured it
can't hurt.

Anyway, when X started, it got far enough that the X cursor showed up in
the middle of the screen, but I was unable to get the cursor to move.
As far as I could tell, the machine had completely hung.

I'm attaching my xorg.conf and Xorg.0.log.  I hope this is helpful.

Thanks for all you do!

--=20
Andrew McNabb
http://www.mcnabbs.org/andrew/
PGP Fingerprint: 8A17 B57C 6879 1863 DE55  8012 AB4D 6098 8826 6868

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xorg.conf"

# Xorg configuration created by livna-config-display

Section "ServerLayout"
	Identifier     "Default Layout"
	Screen      0  "Screen0" 0 0
	InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
	ModulePath   "/usr/lib64/xorg/modules"
EndSection

Section "ServerFlags"
	Option	    "AIGLX" "off"
EndSection

Section "InputDevice"

# keyboard added by rhpxl
	Identifier  "Keyboard0"
	Driver      "kbd"
	Option	    "XkbModel" "pc105"
	Option	    "XkbLayout" "us+inet"
EndSection

Section "Device"
	Identifier  "Videocard0"
	#Driver      "nv"
	Driver      "nouveau"
EndSection

Section "Screen"
	Identifier "Screen0"
	Device     "Videocard0"
	DefaultDepth     24
	SubSection "Display"
		Viewport   0 0
		Depth     24
	EndSubSection
EndSection

Section "Extensions"
	Option "Composite" "Disable"
EndSection


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="Xorg.0.log"
Content-Transfer-Encoding: quoted-printable


X.Org X Server 1.4.99.901 (1.5.0 RC 1)
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-53.1.14.el5xen x86_64=20
Current Operating System: Linux prodigy.aml.cs.byu.edu 2.6.25-1.fc9.x86_64 =
#1 SMP Thu Apr 17 01:11:31 EDT 2008 x86_64
Build Date: 14 April 2008  11:48:57PM
Build ID: xorg-x11-server 1.4.99.901-22.20080415.fc9=20
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Mon Apr 21 11:03:20 2008
(=3D=3D) Using config file: "/etc/X11/xorg.conf"
(=3D=3D) ServerLayout "Default Layout"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "<default monitor>"
(**) |   |-->Device "Videocard0"
(=3D=3D) No monitor specified for screen "Screen0".
	Using a default monitor configuration.
(**) |-->Input Device "Keyboard0"
(**) Option "AIGLX" "off"
(=3D=3D) Automatically adding devices
(=3D=3D) Automatically enabling devices
(=3D=3D) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
(**) ModulePath set to "/usr/lib64/xorg/modules"
(**) Extension "Composite" is disabled
(=3D=3D) |-->Input Device "<default pointer>"
(=3D=3D) The core pointer device wasn't specified explicitly in the layout.
	Using the default mouse configuration.
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x7b3f20
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 4.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 1.0
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(--) using VT number 7

(--) PCI:*(0@5:0:0) nVidia Corporation NV43 [GeForce 6800 GS] rev 162, Mem =
@ 0xfd000000/16777216, 0xd0000000/268435456, 0xfc000000/16777216, BIOS @ 0x=
????????/131072
(II) System resource ranges:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[5] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[6] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[7] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[8] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[9] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[10] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[11] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[12] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[13] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[14] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[15] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[16] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[17] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[18] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[19] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[20] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[21] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[22] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[23] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[24] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[25] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[26] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[27] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[28] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[29] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[30] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[31] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[32] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[33] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[34] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[35] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[36] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[37] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[38] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[39] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[40] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[41] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[42] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[43] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[44] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[45] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[46] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[47] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[48] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[49] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[50] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[51] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[52] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[53] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) LoadModule: "extmod"

(II) Loading /usr/lib64/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension SELinux
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

(II) Loading /usr/lib64/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"

(II) Loading /usr/lib64/xorg/modules/extensions//libglx.so
(II) Module glx: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(**) AIGLX disabled
(**) Exporting typical set of GLX visuals
(II) Loading extension GLX
(II) LoadModule: "freetype"

(II) Loading /usr/lib64/xorg/modules/fonts//libfreetype.so
(II) Module freetype: vendor=3D"X.Org Foundation & the After X-TT Project"
	compiled for 1.4.99.901, module version =3D 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "dri"

(II) Loading /usr/lib64/xorg/modules/extensions//libdri.so
(II) Module dri: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"

(II) Loading /usr/lib64/xorg/modules/extensions//libdri2.so
(II) Module dri2: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"

(II) Loading /usr/lib64/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "kbd"

(II) Loading /usr/lib64/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.3.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "mouse"

(II) Loading /usr/lib64/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.3.0
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
(II) Primary Device is: PCI 05@00:00:0
(II) resource ranges after probing:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[5] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[6] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[7] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[8] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[9] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[10] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[11] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[12] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[13] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[14] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[15] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[16] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[17] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[18] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[19] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[20] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[21] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[22] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[23] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[24] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[25] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[26] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[27] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[28] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[29] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[30] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[31] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[32] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[33] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[34] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[35] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[36] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[37] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[38] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[39] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[40] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[41] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[42] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[43] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[44] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[45] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[46] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[47] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[48] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[49] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[50] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[51] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[52] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[53] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) Loading sub module "int10"
(II) LoadModule: "int10"

(II) Loading /usr/lib64/xorg/modules//libint10.so
(II) Module int10: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org Video Driver, version 4.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "NVIDIA NV41"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(=3D=3D) NOUVEAU(0): RGB weight 888
(=3D=3D) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"

(II) Loading /usr/lib64/xorg/modules//libvgahw.so
(II) Module vgahw: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 0.1.0
	ABI class: X.Org Video Driver, version 4.0
(=3D=3D) NOUVEAU(0): Randr1.2 support disabled
(=3D=3D) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD0000000
(--) NOUVEAU(0): MMIO registers at 0xFD000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"

(II) Reloading /usr/lib64/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: Open failed
drmOpenByBusid: Searching for BusID pci:0000:05:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: drmOpenMinor returns 11
drmOpenByBusid: drmGetBusid reports pci:0000:05:00.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module ve=
rsion 0.0.10
(II) NOUVEAU(0): Initial CRTC_OWNER is 4
(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x43002023
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 05.41.02.47
(II) NOUVEAU(0): DAC load detection comparison table version 0 found
(II) NOUVEAU(0): 0xE1DC: Parsing init table 0
(II) NOUVEAU(0): 0xE1DC: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE1DC: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE1DC: Reg: 0x000012C4, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x000012C4, Data: 0x0100B030
(II) NOUVEAU(0): 	Write: Reg: 0x000012C4, Data: 0x0100B030
(II) NOUVEAU(0): 0xE1E9: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x03
(II) NOUVEAU(0): 0xE1EC: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE1EC: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data: 0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x01, =
Data: 0x20
(II) NOUVEAU(0): 0xE1F2: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xE1F5: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE1F5: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data: 0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x20
(II) NOUVEAU(0): 0xE1FB: [ (0x65) - INIT_RESET ]
(II) NOUVEAU(0): 	Read:  Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x01100000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x05110111
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001850, Data: 0x00000001
(II) NOUVEAU(0): 	Write: Reg: 0x00001850, Data: 0x00000000
(II) NOUVEAU(0): 0xE208: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE208: Reg: 0x00101000, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 0xE215: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE215: Reg: 0x0010100C, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0010100C, Data: 0x80000490
(II) NOUVEAU(0): 	Write: Reg: 0x0010100C, Data: 0x80000490
(II) NOUVEAU(0): 0xE222: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE222: Reg: 0x00600818, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00600818, Data: 0x01100110
(II) NOUVEAU(0): 	Write: Reg: 0x00600818, Data: 0x01100110
(II) NOUVEAU(0): 0xE22F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE22F: Reg: 0x00600818, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00600818, Data: 0x01100110
(II) NOUVEAU(0): 	Write: Reg: 0x00600818, Data: 0x01100110
(II) NOUVEAU(0): 0xE23C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE23C: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0060081C, Data: 0xA6666666
(II) NOUVEAU(0): 	Write: Reg: 0x0060081C, Data: 0xA6666666
(II) NOUVEAU(0): 0xE249: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE249: Reg: 0x0060081C, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0060081C, Data: 0xA6666666
(II) NOUVEAU(0): 	Write: Reg: 0x0060081C, Data: 0xA6666666
(II) NOUVEAU(0): 0xE256: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xE256: Index: 0x5E, Mask: 0xFF, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x5E, Head: 0x00, =
Data: 0xA6
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x5E, Head: 0x00, =
Data: 0xA6
(II) NOUVEAU(0): 0xE25A: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xE25A: Index: 0x5D, Mask: 0xFF, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x5D, Head: 0x00, =
Data: 0x66
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x5D, Head: 0x00, =
Data: 0x66
(II) NOUVEAU(0): 0xE25E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C000, Data: 0x00000001
(II) NOUVEAU(0): 0xE267: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001540, Data: 0x001F1F07
(II) NOUVEAU(0): 0xE270: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xE279: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x30000000
(II) NOUVEAU(0): 0xE282: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0x0000001C
(II) NOUVEAU(0): 0xE28B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x01C00000
(II) NOUVEAU(0): 0xE294: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680580, Data: 0x01C0001C
(II) NOUVEAU(0): 0xE29D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0x2000001C
(II) NOUVEAU(0): 0xE2A6: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000402C, Data: 0x2000001C
(II) NOUVEAU(0): 0xE2AF: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0x2000001C
(II) NOUVEAU(0): 0xE2B8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004044, Data: 0x2000001C
(II) NOUVEAU(0): 0xE2C1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100360, Data: 0x8B303A98
(II) NOUVEAU(0): 0xE2CA: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xE2CA: Cond: 0x00, Reg: 0x00101000, Mask: 0x00000040, Cmp=
val: 0x00000040
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 0xE2CA: Checking if 0x00000000 equals 0x00000040
(II) NOUVEAU(0): 0xE2CA: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xE2CA: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE2CC: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 0xE2D1: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xE2D1: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE2D2: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xE2D7: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xE2D8: [ (0x37) - INIT_COPY ]
(II) NOUVEAU(0): 0xE2D8: Reg: 0x00101000, Shift: 0xFE, SrcMask: 0xF0, Port:=
 0x03D4, Index: 0x3C, Mask: 0x0F
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE2E3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004400, Data: 0x00000001
(II) NOUVEAU(0): 0xE2EC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x30000000
(II) NOUVEAU(0): 0xE2F5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680510, Data: 0x0000001C
(II) NOUVEAU(0): 0xE2FE: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE2FE: Reg: 0x00001580, Mask: 0xCFFFFFFF, Data: 0x10000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001580, Data: 0x10000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001580, Data: 0x10000000
(II) NOUVEAU(0): 0xE30B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C044, Data: 0x00001010
(II) NOUVEAU(0): 0xE314: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE314: Reg: 0x0068050C, Mask: 0xFFFFFFFF, Data: 0x00000500
(II) NOUVEAU(0): 	Read:  Reg: 0x0068050C, Data: 0x00004F04
(II) NOUVEAU(0): 	Write: Reg: 0x0068050C, Data: 0x00004F04
(II) NOUVEAU(0): 0xE321: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000140, Data: 0x00000000
(II) NOUVEAU(0): 0xE32A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x07111111
(II) NOUVEAU(0): 0xE333: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001084, Data: 0x00205649
(II) NOUVEAU(0): 0xE33C: [ (0x4B) - INIT_PLL2 ]
(II) NOUVEAU(0): 0xE33C: Reg: 0x4024, Freq: 200000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00004020
(II) NOUVEAU(0): 	Read:  Reg: 0x00004020, Data: 0xE071001C
(II) NOUVEAU(0): 	Read:  Reg: 0x00004024, Data: 0x13030E02
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00004020
(II) NOUVEAU(0): 	Read:  Reg: 0x00004600, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004600, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF071001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xB072001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0x30F2001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0x30F2001C
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0B0233
(II) NOUVEAU(0): 	Write: Reg: 0x00004024, Data: 0x14032809
(II) NOUVEAU(0): 	Write: Reg: 0x0000403C, Data: 0x14032809
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF0F2001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF072001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0xF072001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004600, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xE072001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0xE072001C
(II) NOUVEAU(0): 0xE345: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xE345: EXECUTING SUB-SCRIPT 6
(II) NOUVEAU(0): 0xECD2: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xECD2: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00004004
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xECD2: Reg: 0x00004004, Config: 0x05, Freq: 325000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004000, Data: 0xC001001C
(II) NOUVEAU(0): 	Read:  Reg: 0x00004004, Data: 0x0C020802
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0xD001001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0x8001001C
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC000
(II) NOUVEAU(0): 	Write: Reg: 0x00004004, Data: 0x0D033209
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0xC001001C
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 0xECFD: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE345: END OF SUB-SCRIPT 6
(II) NOUVEAU(0): 0xE347: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010037C, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE350: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100388, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE359: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100394, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE362: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003A0, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE36B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100380, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE374: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010038C, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE37D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100398, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE386: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003A4, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE38F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003AC, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE398: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003B4, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3A1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003BC, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3AA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003C4, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3B3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003B0, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3BC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003B8, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3C5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003C0, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3CE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001003C8, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE3D7: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE3D7: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100384
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE3D7: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100384, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE402: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE402: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100390
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE402: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100390, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE42D: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE42D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0010039C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE42D: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x0010039C, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE458: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE458: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001003A8
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE458: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001003A8, Data: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE483: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004138, Data: 0x049308A5
(II) NOUVEAU(0): 0xE48C: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000413C, Data: 0x0C511484
(II) NOUVEAU(0): 0xE495: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004140, Data: 0x0A239C63
(II) NOUVEAU(0): 0xE49E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004144, Data: 0x00021446
(II) NOUVEAU(0): 0xE4A7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004204, Data: 0x00000000
(II) NOUVEAU(0): 0xE4B0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004210, Data: 0x00000000
(II) NOUVEAU(0): 0xE4B9: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE4B9: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00004028
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE4B9: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00004028, Data: 0x80000000
(II) NOUVEAU(0): 0xE4E4: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE4E4: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00004034
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE4E4: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00004034, Data: 0x80000000
(II) NOUVEAU(0): 0xE50F: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE50F: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00004040
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE50F: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00004040, Data: 0x80000000
(II) NOUVEAU(0): 0xE53A: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE53A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0000404C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE53A: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x0000404C, Data: 0x80000000
(II) NOUVEAU(0): 0xE565: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3003C000
(II) NOUVEAU(0): 0xE56E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE56E: Reg: 0x0000C040, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 0xE57B: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE57B: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100220
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE57B: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100220, Data: 0x070C1B13
(II) NOUVEAU(0): 0xE5A6: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE5A6: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100224
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE5A6: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100224, Data: 0x09010709
(II) NOUVEAU(0): 0xE5D1: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE5D1: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100228
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE5D1: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100228, Data: 0x21240508
(II) NOUVEAU(0): 0xE5FC: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE5FC: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0010022C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE5FC: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x0010022C, Data: 0x550D9506
(II) NOUVEAU(0): 0xE627: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE627: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100230
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE627: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100230, Data: 0x0000061F
(II) NOUVEAU(0): 0xE652: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE652: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100234
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE652: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100234, Data: 0x00B5FF44
(II) NOUVEAU(0): 0xE67D: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE67D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100238
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE67D: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100238, Data: 0x003F0818
(II) NOUVEAU(0): 0xE6A8: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE6A9: Parsing init table 1
(II) NOUVEAU(0): 0xE6A9: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE6A9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100328, Data: 0x08030114
(II) NOUVEAU(0): 0xE6B2: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010032C, Data: 0xFFFF3F1F
(II) NOUVEAU(0): 0xE6BB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100330, Data: 0xCCCC5044
(II) NOUVEAU(0): 0xE6C4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100334, Data: 0x33332022
(II) NOUVEAU(0): 0xE6CD: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100338, Data: 0x0000000E
(II) NOUVEAU(0): 0xE6D6: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010033C, Data: 0x00041286
(II) NOUVEAU(0): 0xE6DF: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100340, Data: 0x000001FF
(II) NOUVEAU(0): 0xE6E8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100344, Data: 0x00000000
(II) NOUVEAU(0): 0xE6F1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100348, Data: 0x00000000
(II) NOUVEAU(0): 0xE6FA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100350, Data: 0x0000440A
(II) NOUVEAU(0): 0xE703: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100354, Data: 0x00000806
(II) NOUVEAU(0): 0xE70C: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE70C: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001003F4
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE70C: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001003F4, Data: 0x00000004
(II) NOUVEAU(0): 0xE737: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE737: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001003F8
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE737: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001003F8, Data: 0x00000004
(II) NOUVEAU(0): 0xE762: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE762: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00001080
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE762: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00001080, Data: 0x00000000
(II) NOUVEAU(0): 0xE78D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xE796: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001220, Data: 0x00000000
(II) NOUVEAU(0): 0xE79F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001228, Data: 0x00000000
(II) NOUVEAU(0): 0xE7A8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001210, Data: 0x00000001
(II) NOUVEAU(0): 0xE7B1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001214, Data: 0x03770101
(II) NOUVEAU(0): 0xE7BA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001218, Data: 0xF0000101
(II) NOUVEAU(0): 0xE7C3: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xE7C3: BaseReg: 0x00001230, Count: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00001230, Data: 0x80000A0A
(II) NOUVEAU(0): 	Write: Reg: 0x00001234, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001238, Data: 0xF83E0000
(II) NOUVEAU(0): 0xE7D5: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xE7D5: BaseReg: 0x00001240, Count: 0x04
(II) NOUVEAU(0): 	Write: Reg: 0x00001240, Data: 0x80000A0A
(II) NOUVEAU(0): 	Write: Reg: 0x00001244, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001248, Data: 0xF83E0000
(II) NOUVEAU(0): 	Write: Reg: 0x0000124C, Data: 0xAA11AA11
(II) NOUVEAU(0): 0xE7EB: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE7EB: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE7EE: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE7EE: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100218
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE7EE: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x01000100
(II) NOUVEAU(0): 0xE819: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE819: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE81C: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xE81C: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x0010021C, Data: 0x00000001
(II) NOUVEAU(0): 0xE81E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE81E: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE821: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE821: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100200
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE821: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x43002023
(II) NOUVEAU(0): 0xE84C: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xE84C: Cond: 0x03, Reg: 0x00101000, Mask: 0x00000020, Cmp=
val: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): 0xE84C: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xE84C: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xE84C: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE84E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE85B: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xE85B: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xE85C: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE85C: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE85F: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE85F: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100204
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE85F: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100204, Data: 0x00449000
(II) NOUVEAU(0): 0xE88A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xE893: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100214, Data: 0x000000B0
(II) NOUVEAU(0): 0xE89C: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE89C: Sleeping for 0x00C8 microseconds
(II) NOUVEAU(0): 0xE89F: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE89F: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100218
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE89F: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x01000000
(II) NOUVEAU(0): 0xE8CA: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE8CA: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE8CD: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE8CD: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100218
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE8CD: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x01000001
(II) NOUVEAU(0): 0xE8F8: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE8F8: Sleeping for 0x07D0 microseconds
(II) NOUVEAU(0): 0xE8FB: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xE8FB: Sleeping for 0x00C8 microseconds
(II) NOUVEAU(0): 0xE8FE: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xE8FE: Macro: 0x03, MacroTableIndex: 0x03, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D8, Data: 0x00000001
(II) NOUVEAU(0): 0xE900: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xE900: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xE902: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0xE902: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x40, Cmpval: 0x40
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE902: Checking if 0x00 equals 0x40
(II) NOUVEAU(0): 0xE902: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xE902: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE904: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE92F: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE95A: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xE95A: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xE95B: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE95B: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002C4
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE95B: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001002C4, Data: 0x00100038
(II) NOUVEAU(0): 0xE986: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE986: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002CC
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE986: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001002CC, Data: 0x00100038
(II) NOUVEAU(0): 0xE9B1: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE9B1: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100450
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE9B1: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100450, Data: 0x00110110
(II) NOUVEAU(0): 0xE9DC: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE9DC: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100454
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xE9DC: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100454, Data: 0x00000011
(II) NOUVEAU(0): 0xEA07: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEA07: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100460
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEA07: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100460, Data: 0x77777777
(II) NOUVEAU(0): 0xEA32: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEA32: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100464
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEA32: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100464, Data: 0x77777777
(II) NOUVEAU(0): 0xEA5D: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEA5D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100468
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEA5D: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100468, Data: 0x77777777
(II) NOUVEAU(0): 0xEA88: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEA88: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0010046C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEA88: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x0010046C, Data: 0x77777777
(II) NOUVEAU(0): 0xEAB3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100480, Data: 0xBBBBBBBB
(II) NOUVEAU(0): 0xEABC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100484, Data: 0xBBBBBBBB
(II) NOUVEAU(0): 0xEAC5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100488, Data: 0xBBBBBBBB
(II) NOUVEAU(0): 0xEACE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010048C, Data: 0xBBBBBBBB
(II) NOUVEAU(0): 0xEAD7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100490, Data: 0x00000001
(II) NOUVEAU(0): 0xEAE0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100494, Data: 0x00000001
(II) NOUVEAU(0): 0xEAE9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100498, Data: 0x00000001
(II) NOUVEAU(0): 0xEAF2: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010049C, Data: 0x00000001
(II) NOUVEAU(0): 0xEAFB: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEAFB: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100458
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEAFB: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100458, Data: 0x00000010
(II) NOUVEAU(0): 0xEB26: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEB26: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x0010045C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEB26: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x0010045C, Data: 0x00001011
(II) NOUVEAU(0): 0xEB51: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100470, Data: 0x00000100
(II) NOUVEAU(0): 0xEB5A: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xEB5A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00100474
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xEB5A: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x00100474, Data: 0x11110004
(II) NOUVEAU(0): 0xEB85: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100080, Data: 0xF0000020
(II) NOUVEAU(0): 0xEB8E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100084, Data: 0x0000001D
(II) NOUVEAU(0): 0xEB97: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100090, Data: 0x00000000
(II) NOUVEAU(0): 0xEBA0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001000A0, Data: 0x00000000
(II) NOUVEAU(0): 0xEBA9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x001000F0, Data: 0x00000000
(II) NOUVEAU(0): 0xEBB2: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xEBB3: Parsing init table 2
(II) NOUVEAU(0): 0xEBB3: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xEBB3: [ (0x4B) - INIT_PLL2 ]
(II) NOUVEAU(0): 0xEBB3: Reg: 0x680508, Freq: 36000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680508, Data: 0x00021504
(II) NOUVEAU(0): 	Read:  Reg: 0x00680578, Data: 0x80000D03
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Read:  Reg: 0x00680580, Data: 0x01C0001C
(II) NOUVEAU(0): 	Write: Reg: 0x00680580, Data: 0x01C0001C
(II) NOUVEAU(0): 	Write: Reg: 0x00680578, Data: 0x80001003
(II) NOUVEAU(0): 	Write: Reg: 0x00680508, Data: 0x00040802
(II) NOUVEAU(0): 0xEBBC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001088, Data: 0x000011F0
(II) NOUVEAU(0): 0xEBC5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000108C, Data: 0x000000D1
(II) NOUVEAU(0): 0xEBCE: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEBCE: Reg: 0x00001530, Mask: 0xFFFFF9FF, Data: 0x00000400
(II) NOUVEAU(0): 	Read:  Reg: 0x00001530, Data: 0x0000047F
(II) NOUVEAU(0): 	Write: Reg: 0x00001530, Data: 0x0000047F
(II) NOUVEAU(0): 0xEBDB: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEBDB: Reg: 0x00680880, Mask: 0xFFFFFFFF, Data: 0x10000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680880, Data: 0x01101191
(II) NOUVEAU(0): 	Write: Reg: 0x00680880, Data: 0x11101191
(II) NOUVEAU(0): 0xEBE8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680610, Data: 0x00000000
(II) NOUVEAU(0): 0xEBF1: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x38, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x1A, Head: 0x00, =
Data: 0x3F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x28, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x33, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head: 0x00, =
Data: 0xFA
(II) NOUVEAU(0): 0xEBFD: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xEBFD: Index: 0x2B, Mask: 0x20, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xEC01: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xEC0F: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xEC0F: Index1: 0x57, Index2: 0x58, BaseAddr: 0x00, Count:=
 0x07
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x02
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x03
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x05
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x06
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 0xEC1B: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 0xEC1E: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEC1E: Port: 0x03D4, Index: 0x85, Mask: 0x00, Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x85, Head: 0x00, =
Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x85, Head: 0x00, =
Data: 0xFF
(II) NOUVEAU(0): 0xEC24: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEC24: Port: 0x03D4, Index: 0x86, Mask: 0x00, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x86, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x86, Head: 0x00, =
Data: 0x01
(II) NOUVEAU(0): 0xEC2A: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x03
(II) NOUVEAU(0): 0xEC2D: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head: 0x01, =
Data: 0xFA
(II) NOUVEAU(0): 0xEC30: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEC30: Port: 0x03D4, Index: 0x85, Mask: 0x00, Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x85, Head: 0x01, =
Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x85, Head: 0x01, =
Data: 0xFF
(II) NOUVEAU(0): 0xEC36: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEC36: Port: 0x03D4, Index: 0x86, Mask: 0x00, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x86, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x86, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 0xEC3C: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xEC3C: Index: 0x2B, Mask: 0x10, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xEC40: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xEC50: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xEC50: Index1: 0x57, Index2: 0x58, BaseAddr: 0x00, Count:=
 0x03
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x02
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head: 0x01, =
Data: 0x00
(II) NOUVEAU(0): 0xEC58: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head: 0x01, =
Data: 0x01
(II) NOUVEAU(0): 0xEC5B: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xEC5E: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x52, Head: 0x00, =
Data: 0x04
(II) NOUVEAU(0): 0xEC61: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x53, Head: 0x00, =
Data: 0x40
(II) NOUVEAU(0): 0xEC64: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEC64: Reg: 0x00001584, Mask: 0xFFF00000, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 0xEC71: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEC71: Reg: 0x00001588, Mask: 0xFFFFFFFC, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x00001588, Data: 0x00800001
(II) NOUVEAU(0): 	Write: Reg: 0x00001588, Data: 0x00800001
(II) NOUVEAU(0): 0xEC7E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEC7E: Reg: 0x0000158C, Mask: 0xFFFFFFFC, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000158C, Data: 0x00440000
(II) NOUVEAU(0): 	Write: Reg: 0x0000158C, Data: 0x00440000
(II) NOUVEAU(0): 0xEC8B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xEC94: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEC94: Reg: 0x0068052C, Mask: 0xFFFFFEFF, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 	Write: Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 0xECA1: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xECA1: Reg: 0x0068252C, Mask: 0xFFFFFFFF, Data: 0x00000101
(II) NOUVEAU(0): 	Read:  Reg: 0x0068252C, Data: 0x00000100
(II) NOUVEAU(0): 	Write: Reg: 0x0068252C, Data: 0x00000101
(II) NOUVEAU(0): 0xECAE: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xECAE: Reg: 0x00680848, Mask: 0xFFFFFFFF, Data: 0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680848, Data: 0x11100010
(II) NOUVEAU(0): 	Write: Reg: 0x00680848, Data: 0x11100010
(II) NOUVEAU(0): 0xECBB: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xECBB: Reg: 0x00682848, Mask: 0xFFFFFFFF, Data: 0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00682848, Data: 0x11100010
(II) NOUVEAU(0): 	Write: Reg: 0x00682848, Data: 0x11100010
(II) NOUVEAU(0): 0xECC8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001200, Data: 0x0003103C
(II) NOUVEAU(0): 0xECD1: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xED2A: Parsing init table 3
(II) NOUVEAU(0): 0xED2A: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xED2A: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xED2A: EXECUTING SUB-ROUTINE AT 0x28DA
(II) NOUVEAU(0): 0x28DA: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xED2A: END OF SUB-ROUTINE AT 0x28DA
(II) NOUVEAU(0): 0xED2D: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xED2D: EXECUTING SUB-ROUTINE AT 0xD68E
(II) NOUVEAU(0): 0xD68E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001304, Data: 0x00000800
(II) NOUVEAU(0): 0xD697: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xD697: BaseReg: 0x00001400, Count: 0x04
(II) NOUVEAU(0): 	Write: Reg: 0x00001400, Data: 0xA9A81DA2
(II) NOUVEAU(0): 	Write: Reg: 0x00001404, Data: 0x7FB71E23
(II) NOUVEAU(0): 	Write: Reg: 0x00001408, Data: 0xC9C825D7
(II) NOUVEAU(0): 	Write: Reg: 0x0000140C, Data: 0x7F27C216
(II) NOUVEAU(0): 0xD6AD: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD6AD: Reg: 0x00001098, Mask: 0xFFFFFFF7, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001098, Data: 0x21EA0664
(II) NOUVEAU(0): 	Write: Reg: 0x00001098, Data: 0x21EA0664
(II) NOUVEAU(0): 0xD6BA: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD6BA: Reg: 0x00001310, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001310, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001310, Data: 0x00000000
(II) NOUVEAU(0): 0xD6C7: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xED2D: END OF SUB-ROUTINE AT 0xD68E
(II) NOUVEAU(0): 0xED30: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xED30: Reg: 0x00001098, Mask: 0xFFFFFFFF, Data: 0x00000060
(II) NOUVEAU(0): 	Read:  Reg: 0x00001098, Data: 0x21EA0664
(II) NOUVEAU(0): 	Write: Reg: 0x00001098, Data: 0x21EA0664
(II) NOUVEAU(0): 0xED3D: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xED3D: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002C0
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xED3D: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000572
(II) NOUVEAU(0): 0xED68: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xED68: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x001002C8
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xED68: Writing config 05
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 0xED93: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xED93: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xED96: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED96: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xED98: [ (0x33) - INIT_REPEAT ]
(II) NOUVEAU(0): 0xED98: REPEATING FOLLOWING SEGMENT 10 TIMES
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9A: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xED9A: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xED9C: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xED9D: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xED9D: EXECUTING SUB-SCRIPT 8
(II) NOUVEAU(0): 0x5F5A: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0x5F5A: Port: 0x03D4, Index: 0x44, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0x5F60: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5F60: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x2F, Cmpval: 0x21
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5F60: Checking if 0x03 equals 0x21
(II) NOUVEAU(0): 0x5F60: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0x5F60: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5F62: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F6F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F7C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F89: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F96: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0x5F99: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x5F99: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5F9A: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5F9A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x2F, Cmpval: 0x23
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5F9A: Checking if 0x03 equals 0x23
(II) NOUVEAU(0): 0x5F9A: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0x5F9A: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5F9C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FA9: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FB6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FC3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FD0: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0x5FD3: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x5FD3: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5FD4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5FD4: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x20, Cmpval: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5FD4: Checking if 0x00 equals 0x00
(II) NOUVEAU(0): 0x5FD4: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0x5FD6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FD6: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 0x5FE3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FE3: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 0x5FF0: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FF0: Reg: 0x001002C8, Mask: 0xFFFFFFFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000132
(II) NOUVEAU(0): 0x5FFD: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FFD: Reg: 0x001002C0, Mask: 0xFFFFFFFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000572
(II) NOUVEAU(0): 0x600A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x600A: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 0x6017: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x6017: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 0x6024: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x6025: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xED9D: END OF SUB-SCRIPT 8
(II) NOUVEAU(0): 0xED9F: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xED9F: Sleeping for 0x0064 microseconds
(II) NOUVEAU(0): 0xEDA2: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xEDA2: Macro: 0x04, MacroTableIndex: 0x04, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002DC, Data: 0x00000001
(II) NOUVEAU(0): 0xEDA4: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xEDA4: EXECUTING SUB-SCRIPT 7
(II) NOUVEAU(0): 0xECFE: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xECFE: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, Count: 0x08, Reg: 0x00004024
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0xECFE: Reg: 0x00004024, Config: 0x05, Freq: 600000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00004020
(II) NOUVEAU(0): 	Read:  Reg: 0x00004020, Data: 0xE071001C
(II) NOUVEAU(0): 	Read:  Reg: 0x00004024, Data: 0x13030E02
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0xA34EF897
(II) NOUVEAU(0): Loading PLL limits for reg 0x00004020
(II) NOUVEAU(0): 	Read:  Reg: 0x00004600, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004600, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF071001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xB061001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0x30E1001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0x30E1001C
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0B0233
(II) NOUVEAU(0): 	Write: Reg: 0x00004024, Data: 0x19031003
(II) NOUVEAU(0): 	Write: Reg: 0x0000403C, Data: 0x19031003
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF0E1001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xF061001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0xF061001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004600, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xE061001C
(II) NOUVEAU(0): 	Write: Reg: 0x00004038, Data: 0xE061001C
(II) NOUVEAU(0): 0xED29: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xEDA4: END OF SUB-SCRIPT 7
(II) NOUVEAU(0): 0xEDA6: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xEDA6: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xEDA9: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xEDA9: Macro: 0x05, MacroTableIndex: 0x05, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002DC, Data: 0x00000000
(II) NOUVEAU(0): 0xEDAB: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xEDAB: EXECUTING SUB-SCRIPT 8
(II) NOUVEAU(0): 0x5F5A: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0x5F5A: Port: 0x03D4, Index: 0x44, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0x5F60: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5F60: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x2F, Cmpval: 0x21
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5F60: Checking if 0x03 equals 0x21
(II) NOUVEAU(0): 0x5F60: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0x5F60: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5F62: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F6F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F7C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F89: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5F96: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0x5F99: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x5F99: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5F9A: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5F9A: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x2F, Cmpval: 0x23
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5F9A: Checking if 0x03 equals 0x23
(II) NOUVEAU(0): 0x5F9A: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0x5F9A: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5F9C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FA9: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FB6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FC3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FD0: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0x5FD3: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x5FD3: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5FD4: [ (0x39) - INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5FD4: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift: 0x04=
, FlagArray: 0x5DA2, FAMask: 0x20, Cmpval: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head: 0x00, =
Data: 0x50
(II) NOUVEAU(0): 0x5FD4: Checking if 0x00 equals 0x00
(II) NOUVEAU(0): 0x5FD4: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0x5FD6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FD6: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 0x5FE3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FE3: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 0x5FF0: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FF0: Reg: 0x001002C8, Mask: 0xFFFFFFFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000132
(II) NOUVEAU(0): 0x5FFD: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x5FFD: Reg: 0x001002C0, Mask: 0xFFFFFFFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000572
(II) NOUVEAU(0): 0x600A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x600A: Reg: 0x001002C8, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 	Write: Reg: 0x001002C8, Data: 0x00000032
(II) NOUVEAU(0): 0x6017: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x6017: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000472
(II) NOUVEAU(0): 0x6024: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0x6025: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xEDAB: END OF SUB-SCRIPT 8
(II) NOUVEAU(0): 0xEDAD: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xEDAD: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xEDB0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000001
(II) NOUVEAU(0): 0xEDB9: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0070FFF0, Data: 0x00000000
(II) NOUVEAU(0): 0xEDC2: [ (0x63) - INIT_COMPUTE_MEM ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x43002023
(II) NOUVEAU(0): 0xEDC3: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xEDC3: Port: 0x03C4, Index: 0x01, Mask: 0xDF, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head: 0x00, =
Data: 0x00
(II) NOUVEAU(0): 0xEDC9: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEDC9: Reg: 0x0000C040, Mask: 0xFFFFF000, Data: 0x0C080233
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x3C0BC233
(II) NOUVEAU(0): 0xEDD6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEDD6: Reg: 0x00088140, Mask: 0xFFFFF9FF, Data: 0x00000600
(II) NOUVEAU(0): 	Read:  Reg: 0x00088140, Data: 0x00010600
(II) NOUVEAU(0): 	Write: Reg: 0x00088140, Data: 0x00010600
(II) NOUVEAU(0): 0xEDE3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEDE3: Reg: 0x00011014, Mask: 0xFFFF7FFF, Data: 0x00008000
(II) NOUVEAU(0): 	Read:  Reg: 0x00011014, Data: 0x0000B6C8
(II) NOUVEAU(0): 	Write: Reg: 0x00011014, Data: 0x0000B6C8
(II) NOUVEAU(0): 0xEDF0: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xEDF0: Reg: 0x00100200, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x43002023
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x43002023
(II) NOUVEAU(0): 0xEDFD: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xEDFE: Parsing init table 4
(II) NOUVEAU(0): 0xEDFE: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xEDFE: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): Found TMDS table revision 1.1
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 3.0 found
(II) NOUVEAU(0): DCB header length 25, with 10 possible entries
Raw DCB entry 0: 01000300 00000028
Raw DCB entry 1: 04011312 00000000
Raw DCB entry 2: 04011310 00000028
Raw DCB entry 3: 01000302 00200030
Raw DCB entry 4: 020223f1 0020c080
(II) NOUVEAU(0): Found 5 entries in DCB
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"
(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"
(II) Module "ddc" already built-in
(II) NOUVEAU(0): I2C bus "DDC" initialized.
(II) NOUVEAU(0): Probing for analog device on output A...
(--) NOUVEAU(0):   ...can't find one
(II) NOUVEAU(0): Probing for analog device on output B...
(--) NOUVEAU(0):   ...found one
(II) NOUVEAU(0): Probing for EDID on I2C bus A...
(II) NOUVEAU(0): I2C device "DDC:ddc2" registered at address 0xA0.
(--) NOUVEAU(0): DDC detected a DFP:
(II) NOUVEAU(0): Manufacturer: DEL  Model: a010  Serial#: 810176083
(II) NOUVEAU(0): Year: 2005  Week: 43
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Digital Display Input
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 52  vert.: 33
(II) NOUVEAU(0): Gamma: 2.20
(II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off(II) NOUVEAU(0):=20
Supported color encodings: RGB 4:4:4 YCrCb 4:4:4=20
(II) NOUVEAU(0): Default color space is primary color space
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300 greenY: 0.607
(II) NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
(II) NOUVEAU(0): Supported VESA Video Modes:
(II) NOUVEAU(0): 720x400@70Hz
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): 1280x1024@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported Future Video Modes:
(II) NOUVEAU(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
(II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
(II) NOUVEAU(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337
(II) NOUVEAU(0): #3: hsize: 1680  vsize 1050  refresh: 60  vid: 179
(II) NOUVEAU(0): Supported additional Video Mode:
(II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  519 x 324 mm
(II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end =
2080 h_border: 0
(II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: =
1235 v_border: 0
(II) NOUVEAU(0): Serial No: T61335AH0JNS
(II) NOUVEAU(0): Monitor name: DELL 2405FPW
(II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 81 kHz, P=
ixClock max 170 MHz
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0): 	00ffffffffffff0010ac10a0534e4a30
(II) NOUVEAU(0): 	2b0f010380342178eeee50a3544c9b26
(II) NOUVEAU(0): 	0f5054a54b008180a940714fb3000101
(II) NOUVEAU(0): 	010101010101283c80a070b023403020
(II) NOUVEAU(0): 	360007442100001a000000ff00543631
(II) NOUVEAU(0): 	3333354148304a4e5320000000fc0044
(II) NOUVEAU(0): 	454c4c20323430354650570a000000fd
(II) NOUVEAU(0): 	00384c1e5111000a20202020202000c6
(II) NOUVEAU(0): Probing for EDID on I2C bus B...
(--) NOUVEAU(0): DDC detected a DFP:
(II) NOUVEAU(0): Manufacturer: DEL  Model: a010  Serial#: 810299987
(II) NOUVEAU(0): Year: 2005  Week: 43
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Digital Display Input
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 52  vert.: 33
(II) NOUVEAU(0): Gamma: 2.20
(II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off(II) NOUVEAU(0):=20
Supported color encodings: RGB 4:4:4 YCrCb 4:4:4=20
(II) NOUVEAU(0): Default color space is primary color space
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300 greenY: 0.607
(II) NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
(II) NOUVEAU(0): Supported VESA Video Modes:
(II) NOUVEAU(0): 720x400@70Hz
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): 1280x1024@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported Future Video Modes:
(II) NOUVEAU(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
(II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
(II) NOUVEAU(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337
(II) NOUVEAU(0): #3: hsize: 1680  vsize 1050  refresh: 60  vid: 179
(II) NOUVEAU(0): Supported additional Video Mode:
(II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  519 x 324 mm
(II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end =
2080 h_border: 0
(II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: =
1235 v_border: 0
(II) NOUVEAU(0): Serial No: T61335AH0L2S
(II) NOUVEAU(0): Monitor name: DELL 2405FPW
(II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 81 kHz, P=
ixClock max 170 MHz
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0): 	00ffffffffffff0010ac10a053324c30
(II) NOUVEAU(0): 	2b0f010380342178eeee50a3544c9b26
(II) NOUVEAU(0): 	0f5054a54b008180a940714fb3000101
(II) NOUVEAU(0): 	010101010101283c80a070b023403020
(II) NOUVEAU(0): 	360007442100001a000000ff00543631
(II) NOUVEAU(0): 	3333354148304c325320000000fc0044
(II) NOUVEAU(0): 	454c4c20323430354650570a000000fd
(II) NOUVEAU(0): 	00384c1e5111000a20202020202000fa
(--) NOUVEAU(0): CRTC 0 is currently programmed for DFP
(II) NOUVEAU(0): Using DFP on CRTC 0
(--) NOUVEAU(0): Panel size is 1920 x 1200
(II) NOUVEAU(0): EDID vendor "DEL", prod id 40976
(II) NOUVEAU(0): Using EDID range info for horizontal sync
(II) NOUVEAU(0): Using EDID range info for vertical refresh
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  120=
0 1203 1209 1235 +hsync -vsync (74.0 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 =
605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 4=
84 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.20  640 656 752 800  480 490 4=
92 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 4=
14 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  102=
4 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.80  1024 1040 1136 1312  768 =
769 772 800 +hsync +vsync (60.1 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 =
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 =
604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.88  1280 1360 1496 1712  10=
24 1025 1028 1060 -hsync +vsync (63.6 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  160.96  1600 1704 1880 2160  12=
00 1201 1204 1242 -hsync +vsync (74.5 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x75.0  104.99  1152 1224 1352 1552  864=
 865 868 902 -hsync +vsync (67.7 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  147.14  1680 1784 1968 2256  10=
50 1051 1054 1087 -hsync +vsync (65.2 kHz)
(II) NOUVEAU(0): Panel is TMDS
(--) NOUVEAU(0): VideoRAM: 262144 kBytes
(=3D=3D) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(II) NOUVEAU(0): <default monitor>: Using hsync range of 30.00-81.00 kHz
(II) NOUVEAU(0): <default monitor>: Using vrefresh range of 56.00-76.00 Hz
(II) NOUVEAU(0): <default monitor>: Using maximum pixel clock of 170.00 MHz
(II) NOUVEAU(0): Estimated virtual size for aspect ratio 1.5758 is 1920x1200
(II) NOUVEAU(0): Clock range:  12.00 to 400.00 MHz
(II) NOUVEAU(0): Not using default mode "640x350" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x175" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x400" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x200" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "720x400" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "360x200" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x960" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (mode clock too high)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "416x312" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "680x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "680x384" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "720x450" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "800x512" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (mode clock too high)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "960x540" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "960x600" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for v=
irtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode clock/interlace=
/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (width too large for vi=
rtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (width too large for vi=
rtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (width too large for vi=
rtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode clock/interlac=
e/doublescan)
(--) NOUVEAU(0): Virtual size is 1920x1200 (pitch 1920)
(**) NOUVEAU(0): *Driver mode "1920x1200": 154.0 MHz, 74.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  12=
00 1203 1209 1235 +hsync -vsync (74.0 kHz)
(**) NOUVEAU(0): *Driver mode "1920x1200": 154.0 MHz, 74.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  12=
00 1203 1209 1235 +hsync -vsync (74.0 kHz)
(**) NOUVEAU(0): *Default mode "1920x1200": 154.0 MHz, 74.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  12=
00 1203 1209 1235 +hsync -vsync (74.0 kHz)
(**) NOUVEAU(0): *Default mode "1920x1080": 138.5 MHz, 66.6 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  10=
80 1083 1088 1111 +hsync -vsync (66.6 kHz)
(**) NOUVEAU(0): *Driver mode "1600x1200": 161.0 MHz, 74.5 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  160.96  1600 1704 1880 2160  12=
00 1201 1204 1242 -hsync +vsync (74.5 kHz)
(**) NOUVEAU(0): *Default mode "1600x1200": 162.0 MHz, 75.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  12=
00 1201 1204 1250 +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0): *Driver mode "1680x1050": 147.1 MHz, 65.2 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  147.14  1680 1784 1968 2256  10=
50 1051 1054 1087 -hsync +vsync (65.2 kHz)
(**) NOUVEAU(0): *Default mode "1680x1050": 146.2 MHz, 65.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  10=
50 1053 1059 1089 -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0): *Default mode "1680x1050": 119.0 MHz, 64.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  10=
50 1053 1059 1080 +hsync -vsync (64.7 kHz)
(**) NOUVEAU(0): *Default mode "1600x1024": 103.1 MHz, 62.0 kHz, 60.2 Hz
(II) NOUVEAU(0): Modeline "1600x1024"x60.2  103.12  1600 1600 1656 1664  10=
24 1024 1029 1030 +hsync +vsync (62.0 kHz)
(**) NOUVEAU(0): *Default mode "1400x1050": 155.8 MHz, 81.5 kHz, 74.8 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  10=
50 1052 1064 1090 +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0): *Default mode "1400x1050": 145.1 MHz, 76.5 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x70.0  145.06  1400 1496 1648 1896  10=
50 1051 1054 1093 -hsync +vsync (76.5 kHz)
(**) NOUVEAU(0): *Default mode "1400x1050": 122.0 MHz, 64.9 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  10=
50 1052 1064 1082 +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0): *Driver mode "1280x1024": 135.0 MHz, 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0): *Driver mode "1280x1024": 108.9 MHz, 63.6 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.88  1280 1360 1496 1712  10=
24 1025 1028 1060 -hsync +vsync (63.6 kHz)
(**) NOUVEAU(0): *Default mode "1280x1024": 135.0 MHz, 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0): *Default mode "1280x1024": 108.0 MHz, 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  10=
24 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0): *Default mode "1440x900": 106.5 MHz, 55.9 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900=
 903 909 934 -hsync +vsync (55.9 kHz)
(**) NOUVEAU(0): *Default mode "1280x960": 108.0 MHz, 60.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960=
 961 964 1000 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0): *Default mode "1360x768": 72.0 MHz, 47.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1360x768"x60.0   72.00  1360 1408 1440 1520  768=
 771 781 790 +hsync -vsync (47.4 kHz)
(**) NOUVEAU(0): *Default mode "1360x768": 84.8 MHz, 47.7 kHz, 59.8 Hz
(II) NOUVEAU(0): Modeline "1360x768"x59.8   84.75  1360 1432 1568 1776  768=
 771 781 798 -hsync +vsync (47.7 kHz)
(**) NOUVEAU(0): *Driver mode "1152x864": 105.0 MHz, 67.7 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  104.99  1152 1224 1352 1552  864=
 865 868 902 -hsync +vsync (67.7 kHz)
(**) NOUVEAU(0): *Default mode "1152x864": 108.0 MHz, 67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864=
 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0): *Default mode "1152x864": 105.0 MHz, 67.6 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  104.99  1152 1224 1352 1552  864=
 865 868 902 -hsync +vsync (67.6 kHz)
(**) NOUVEAU(0): *Default mode "1152x864": 96.8 MHz, 63.0 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x70.0   96.77  1152 1224 1344 1536  864=
 865 868 900 -hsync +vsync (63.0 kHz)
(**) NOUVEAU(0): *Default mode "1152x864": 81.6 MHz, 53.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x60.0   81.62  1152 1216 1336 1520  864=
 865 868 895 -hsync +vsync (53.7 kHz)
(**) NOUVEAU(0): *Driver mode "1024x768": 78.8 MHz, 60.1 kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768=
 769 772 800 +hsync +vsync (60.1 kHz)
(**) NOUVEAU(0): *Driver mode "1024x768": 65.0 MHz, 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768=
 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0): *Default mode "1024x768": 78.8 MHz, 60.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768=
 769 772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0): *Default mode "1024x768": 75.0 MHz, 56.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768=
 771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0): *Default mode "1024x768": 65.0 MHz, 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768=
 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0): *Default mode "832x624": 57.3 MHz, 49.7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625=
 628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0): *Driver mode "800x600": 49.5 MHz, 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601=
 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0): *Driver mode "800x600": 40.0 MHz, 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601=
 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 49.5 MHz, 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601=
 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 50.0 MHz, 48.1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637=
 643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 40.0 MHz, 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601=
 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 36.0 MHz, 35.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601=
 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0): *Driver mode "640x480": 31.5 MHz, 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 =
484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0): *Driver mode "640x480": 25.2 MHz, 31.5 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 =
492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0): *Default mode "640x480": 31.5 MHz, 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 =
484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0): *Default mode "640x480": 31.5 MHz, 37.9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 =
492 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0): *Default mode "640x480": 25.2 MHz, 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 =
492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0): *Driver mode "720x400": 28.3 MHz, 31.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 =
414 449 -hsync +vsync (31.5 kHz)
(**) NOUVEAU(0): Display dimensions: (520, 330) mm
(**) NOUVEAU(0): DPI set to (93, 92)
(II) Loading sub module "fb"
(II) LoadModule: "fb"

(II) Loading /usr/lib64/xorg/modules//libfb.so
(II) Module fb: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.3
(II) Loading sub module "exa"
(II) LoadModule: "exa"

(II) Loading /usr/lib64/xorg/modules//libexa.so
(II) Module exa: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 2.4.0
	ABI class: X.Org Video Driver, version 4.0
(II) Loading sub module "ramdac"
(II) LoadModule: "ramdac"
(II) Module "ramdac" already built-in
(--) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
	[0] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[5] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[6] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[7] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[8] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[9] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[10] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[11] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[12] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[13] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[14] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[15] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[16] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[17] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[18] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[19] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[20] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[21] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[22] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[23] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[24] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[25] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[26] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[27] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[28] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[29] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[30] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[31] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[32] -1	0	0xffffffff - 0xffffffff (0x1) MX[B]
	[33] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[34] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[35] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[36] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[37] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[38] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[39] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[40] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[41] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[42] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[43] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[44] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[45] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[46] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[47] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[48] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[49] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[50] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[51] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[52] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[53] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: Searching for BusID pci:0000:05:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: drmOpenMinor returns 11
drmOpenByBusid: drmGetBusid reports pci:0000:05:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle =3D 0xd8000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle =3D 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(II) NOUVEAU(0): Allocated 128MiB VRAM for framebuffer + offscreen pixmaps
(II) NOUVEAU(0): AGPGART: 128MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) NOUVEAU(0): Opened GPU channel 1
(II) EXA(0): Offscreen pixmap area of 124878848 bytes
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(=3D=3D) NOUVEAU(0): Backing store disabled
(=3D=3D) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): [DRI] installation complete
(II) NOUVEAU(0): DPMS enabled
(=3D=3D) RandR enabled
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) Initializing built-in extension XEVIE
(II) Loading sub module "GLcore"
(II) LoadModule: "GLcore"

(II) Loading /usr/lib64/xorg/modules/extensions//libGLcore.so
(II) Module GLcore: vendor=3D"X.Org Foundation"
	compiled for 1.4.99.901, module version =3D 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(II) GLX: Initialized MESA-PROXY GL provider for screen 0
(**) Option "CoreKeyboard"
(**) Keyboard0: always reports core events
(**) Option "Protocol" "standard"
(**) Keyboard0: Protocol: standard
(**) Option "AutoRepeat" "500 30"
(**) Option "XkbRules" "xorg"
(**) Keyboard0: XkbRules: "xorg"
(**) Option "XkbModel" "pc105"
(**) Keyboard0: XkbModel: "pc105"
(**) Option "XkbLayout" "us+inet"
(**) Keyboard0: XkbLayout: "us+inet"
(**) Option "CustomKeycodes" "off"
(**) Keyboard0: CustomKeycodes disabled
(WW) <default pointer>: No Device specified, looking for one...
(II) <default pointer>: Setting Device option to "/dev/input/mice"
(--) <default pointer>: Device: "/dev/input/mice"
(=3D=3D) <default pointer>: Protocol: "Auto"
(**) Option "CorePointer"
(**) <default pointer>: always reports core events
(=3D=3D) <default pointer>: Emulate3Buttons, Emulate3Timeout: 50
(**) <default pointer>: ZAxisMapping: buttons 4 and 5
(**) <default pointer>: Buttons: 9
(**) <default pointer>: Sensitivity: 1
(II) evaluating device (<default pointer>)
(II) XINPUT: Adding extended input device "<default pointer>" (type: MOUSE)
(II) evaluating device (Keyboard0)
(II) XINPUT: Adding extended input device "Keyboard0" (type: KEYBOARD)
(II) <default pointer>: Setting mouse protocol to "ExplorerPS/2"
(II) <default pointer>: ps2EnableDataReporting: succeeded

--0OAP2g/MAC+5xKAE--

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFIDMu9q01gmIgmaGgRAo6aAJ9gZ+GJ2vfIPPZRrfKAuFinDMIi9ACgrkw+
bbW8SAzURpRuSk//3gwBogI=
=r74V
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--

--===============1367494305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1367494305==--

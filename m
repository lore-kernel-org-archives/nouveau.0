From: Alfred Zastrow <ml.zastrow-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org>
Subject: Looking for NV44 testers?
Date: Thu, 01 Nov 2007 13:14:38 +0100
Message-ID: <4729C32E.6050105@t-online.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi all,

I tried the latest nouveau & drm drivers (both were git from today) on
my Geforce 6200 TM and - like all versions I tried before - it locks up
my computer that a hard reset is needed. :-(

On Screen is only a some pixel wide vertical stripe



Here ist the x-org log:
----------------------


X.Org X Server 1.4.0
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.23.1 i686
Current Operating System: Linux z1 2.6.23.1 #2 SMP PREEMPT Sun Oct 21
08:05:02 CEST 2007 i686
Build Date: 28 October 2007  07:03:01PM

	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Thu Nov  1 12:51:35 2007
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "X.org Configured"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Card0"
(**) |-->Input Device "Mouse0"
(**) |-->Input Device "Keyboard0"
(==) Automatically adding devices
(==) Automatically enabling devices
(WW) The directory "/usr/lib/X11/fonts/CID/" does not exist.
	Entry deleted from font path.
(WW) `fonts.dir' not found (or not valid) in
"/usr/lib/X11/fonts/encodings/".
	Entry deleted from font path.
	(Run 'mkfontdir' on "/usr/lib/X11/fonts/encodings/").
(WW) `fonts.dir' not found (or not valid) in "/usr/lib/X11/fonts/util/".
	Entry deleted from font path.
	(Run 'mkfontdir' on "/usr/lib/X11/fonts/util/").
(==) Including the default font path
/usr/lib/X11/fonts/misc/,/usr/lib/X11/fonts/TTF/,/usr/lib/X11/fonts/OTF,/usr/lib/X11/fonts/Type1/,/usr/lib/X11/fonts/100dpi/,/usr/lib/X11/fonts/75dpi/.
(**) FontPath set to:
	/usr/lib/X11/fonts/misc/,
	/usr/lib/X11/fonts/Type1/,
	/usr/lib/X11/fonts/Speedo/,
	/usr/lib/X11/fonts/TTF/,
	/usr/lib/X11/fonts/100dpi/,
	/usr/lib/X11/fonts/75dpi/,
	/usr/lib/X11/fonts/cyrillic/,
	/usr/lib/X11/fonts/OTF,
	/usr/lib/X11/fonts/misc/,
	/usr/lib/X11/fonts/TTF/,
	/usr/lib/X11/fonts/OTF,
	/usr/lib/X11/fonts/Type1/,
	/usr/lib/X11/fonts/100dpi/,
	/usr/lib/X11/fonts/75dpi/
(**) RgbPath set to "/usr/lib/X11/rgb"
(**) ModulePath set to "/usr/lib/X11/modules"
(**) Extension "Composite" is enabled
(WW) Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
(II) No APM support in BIOS or kernel
(II) Loader magic: 0x81ce2e0
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 2.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 0.3
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/X11/modules//libpcidata.so
(II) Module pcidata: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(--) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 10de,02f4 card 10de,02f4 rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:1: chip 10de,02fa card 10de,02fa rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:2: chip 10de,02fe card 10de,02fe rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:3: chip 10de,02f8 card 10de,02f8 rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:4: chip 10de,02f9 card 10de,02f9 rev a2 class 05,00,00
hdr 00
(II) PCI: 00:00:5: chip 10de,02ff card 10de,02ff rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:6: chip 10de,027f card 10de,027f rev a2 class 05,00,00
hdr 80
(II) PCI: 00:00:7: chip 10de,027e card 10de,027e rev a2 class 05,00,00
hdr 80
(II) PCI: 00:04:0: chip 10de,02fb card 0000,0000 rev a1 class 06,04,00
hdr 01
(II) PCI: 00:08:0: chip 10de,0369 card 1043,cb84 rev a1 class 05,00,00
hdr 00
(II) PCI: 00:09:0: chip 10de,0360 card 1043,cb84 rev a2 class 06,01,00
hdr 80
(II) PCI: 00:09:1: chip 10de,0368 card 1043,cb84 rev a2 class 0c,05,00
hdr 80
(II) PCI: 00:09:2: chip 10de,036a card 1043,cb84 rev a2 class 05,00,00
hdr 80
(II) PCI: 00:0a:0: chip 10de,036c card 1043,cb84 rev a1 class 0c,03,10
hdr 80
(II) PCI: 00:0a:1: chip 10de,036d card 1043,cb84 rev a2 class 0c,03,20
hdr 80
(II) PCI: 00:0c:0: chip 10de,036e card 1043,cb84 rev a1 class 01,01,8a
hdr 00
(II) PCI: 00:0d:0: chip 10de,037f card 1043,cb84 rev a2 class 01,01,85
hdr 80
(II) PCI: 00:0d:1: chip 10de,037f card 1043,cb84 rev a2 class 01,01,85
hdr 80
(II) PCI: 00:0d:2: chip 10de,037f card 1043,cb84 rev a2 class 01,01,85
hdr 80
(II) PCI: 00:0e:0: chip 10de,0370 card 0000,0000 rev a2 class 06,04,01
hdr 81
(II) PCI: 00:0e:1: chip 10de,0371 card 1043,81f6 rev a2 class 04,03,00
hdr 80
(II) PCI: 00:10:0: chip 10de,0373 card 1043,cb84 rev a2 class 06,80,00
hdr 00
(II) PCI: 00:11:0: chip 10de,0373 card 1043,cb84 rev a2 class 06,80,00
hdr 00
(II) PCI: 00:16:0: chip 10de,0375 card 0000,0000 rev a2 class 06,04,00
hdr 01
(II) PCI: 00:18:0: chip 1022,1100 card 0000,0000 rev 00 class 06,00,00
hdr 80
(II) PCI: 00:18:1: chip 1022,1101 card 0000,0000 rev 00 class 06,00,00
hdr 80
(II) PCI: 00:18:2: chip 1022,1102 card 0000,0000 rev 00 class 06,00,00
hdr 80
(II) PCI: 00:18:3: chip 1022,1103 card 0000,0000 rev 00 class 06,00,00
hdr 80
(II) PCI: 01:00:0: chip 10de,0161 card 1462,0271 rev a1 class 03,00,00
hdr 00
(II) PCI: 02:07:0: chip 109e,036e card 0070,13eb rev 02 class 04,00,00
hdr 80
(II) PCI: 02:07:1: chip 109e,0878 card 0070,13eb rev 02 class 04,80,00
hdr 80
(II) PCI: 02:0b:0: chip 104c,8023 card 1043,815b rev 00 class 0c,00,10
hdr 00
(II) PCI: 03:00:0: chip 1095,3132 card 1043,819f rev 01 class 01,80,00
hdr 00
(II) PCI: End of PCI scan
(II) PCI-to-PCI bridge:
(II) Bus 1: bridge is at (0:4:0), (0,1,1), BCTRL: 0x001c (VGA_EN is set)
(II) Bus 1 non-prefetchable memory range:
	[0] -1	0	0xfa000000 - 0xfcffffff (0x3000000) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B]
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:9:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is set)
(II) Subtractive PCI-to-PCI bridge:
(II) Bus 2: bridge is at (0:14:0), (0,2,2), BCTRL: 0x0a04 (VGA_EN is
cleared)
(II) Bus 2 non-prefetchable memory range:
	[0] -1	0	0xfde00000 - 0xfdefffff (0x100000) MX[B]
(II) Bus 2 prefetchable memory range:
	[0] -1	0	0xfdf00000 - 0xfdffffff (0x100000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 3: bridge is at (0:22:0), (0,3,3), BCTRL: 0x0004 (VGA_EN is
cleared)
(II) Bus 3 I/O range:
	[0] -1	0	0x0000a000 - 0x0000a0ff (0x100) IX[B]
	[1] -1	0	0x0000a400 - 0x0000a4ff (0x100) IX[B]
	[2] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[3] -1	0	0x0000ac00 - 0x0000acff (0x100) IX[B]
(II) Bus 3 non-prefetchable memory range:
	[0] -1	0	0xfdd00000 - 0xfddfffff (0x100000) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:24:0), (0,0,3), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
	[0] -1	0	0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
	[0] -1	0	0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI:*(1:0:0) nVidia Corporation NV44 [GeForce 6200 TurboCache(TM)]
rev 161, Mem @ 0xfa000000/24, 0xe0000000/28, 0xfb000000/24, BIOS @
0xfcfe0000/17
(--) PCI: (2:7:0) Brooktree Corporation Bt878 Video Capture rev 2, Mem @
0xfdfff000/12
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
(II) Active PCI resource ranges:
	[0] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[1] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[2] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[3] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[4] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[5] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[6] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[7] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[8] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[9] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[10] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[11] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[12] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[13] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[14] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[15] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[16] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[17] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[18] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[19] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[20] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[21] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[22] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[23] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[24] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[25] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[26] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[27] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[28] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[29] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[30] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[31] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[32] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[33] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[34] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[35] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[36] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[37] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[38] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[39] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[40] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[41] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[42] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[1] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[2] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[3] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[4] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[5] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[6] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[7] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[8] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[9] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[10] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[11] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[12] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[13] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[14] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[15] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[16] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[17] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[18] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[19] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[20] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[21] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[22] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[23] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[24] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[25] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[26] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[27] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[28] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[29] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[30] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[31] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[32] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[33] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[34] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[35] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[36] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[37] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[38] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[39] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[40] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[41] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[42] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
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
	[4] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[5] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[6] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[7] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[8] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[9] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[10] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[11] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[12] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[13] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[14] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[15] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[16] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[17] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[18] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[19] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[20] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[21] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[22] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[23] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[24] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[25] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[26] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[27] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[28] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[29] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[30] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[31] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[32] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[33] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[34] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[35] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[36] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[37] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[38] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[39] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[40] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[41] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[42] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[43] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[44] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[45] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[46] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[47] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[48] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
(II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.
(II) "glx" will be loaded. This was enabled by default and also
specified in the config file.
(II) "freetype" will be loaded. This was enabled by default and also
specified in the config file.
(II) "type1" will be loaded. This was enabled by default and also
specified in the config file.
(II) "record" will be loaded. This was enabled by default and also
specified in the config file.
(II) "dri" will be loaded. This was enabled by default and also
specified in the config file.
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(II) LoadModule: "glx"
(II) Loading /usr/lib/X11/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "extmod"
(II) Loading /usr/lib/X11/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
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
(II) LoadModule: "xtrap"
(II) Loading /usr/lib/X11/modules/extensions//libxtrap.so
(II) Module xtrap: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DEC-XTRAP
(II) LoadModule: "record"
(II) Loading /usr/lib/X11/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "dbe"
(II) Loading /usr/lib/X11/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "dri"
(II) Loading /usr/lib/X11/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "freetype"
(II) Loading /usr/lib/X11/modules/fonts//libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
	compiled for 1.4.0, module version = 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "type1"
(II) Loading /usr/lib/X11/modules/fonts//libtype1.so
(II) Module type1: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.2
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font Type1
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/X11/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.2.0
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 2.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/X11/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.2.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/X11/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.2.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) NOUVEAU driver
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
(--) Chipset NVIDIA NV44 found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[5] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[6] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[7] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[8] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[9] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[10] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[11] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[12] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[13] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[14] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[15] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[16] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[17] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[18] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[19] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[20] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[21] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[22] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[23] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[24] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[25] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[26] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[27] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[28] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[29] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[30] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[31] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[32] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[33] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[34] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[35] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[36] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[37] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[38] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[39] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[40] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[41] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[42] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[43] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[44] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[45] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[46] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[47] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[48] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
(II) resource ranges after probing:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[5] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[6] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[7] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[8] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[9] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[10] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[11] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[12] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[13] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[14] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[15] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[16] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[17] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[18] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[19] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[20] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[21] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[22] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[23] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[24] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[25] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[26] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[27] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[28] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[29] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[30] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[31] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[32] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[33] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[34] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[35] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[36] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[37] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[38] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[39] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[40] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[41] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[42] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[43] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[44] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[45] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[46] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[47] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[48] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[49] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[50] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[51] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
	[52] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[53] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/X11/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "NVIDIA NV44"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/X11/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 0.1.0
	ABI class: X.Org Video Driver, version 2.0
(==) NOUVEAU(0): Randr1.2 support disabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xE0000000
(--) NOUVEAU(0): MMIO registers at 0xFA000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/X11/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: drmOpenMinor returns 8
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module
version 0.0.10
(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(II) NOUVEAU(0): ...appears to be valid
(II) NOUVEAU(0): BIT signature found.
(II) NOUVEAU(0): 0x021E: Found BIT command with id 0x00
(II) NOUVEAU(0): 0x0224: Found BIT command with id 0x32
(II) NOUVEAU(0): 0x022A: Found BIT command with id 0x42
(II) NOUVEAU(0): 0x0230: Found BIT command with id 0x43
(II) NOUVEAU(0): 0x0236: Found BIT command with id 0x44
(II) NOUVEAU(0): 0x023C: Found BIT command with id 0x49
(II) NOUVEAU(0): 0x023C: Found init table entry in BIT structure.
(II) NOUVEAU(0): 0xDE45: Parsing init table 0
(II) NOUVEAU(0): 0xDE45: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xDE45:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE45: REG: 0x000012C4, VALUE: 0x00C0B030
(II) NOUVEAU(0): 0xDE45: CURRENT VALUE IS: 0x00C0B030
(II) NOUVEAU(0): 0xDE52:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE52: REG: 0x00600818, VALUE: 0x01100010
(II) NOUVEAU(0): 0xDE52: CURRENT VALUE IS: 0x01100010
(II) NOUVEAU(0): 0xDE5F:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE5F: REG: 0x0060081C, VALUE: 0x66655602
(II) NOUVEAU(0): 0xDE5F: CURRENT VALUE IS: 0x66655602
(II) NOUVEAU(0): 0xDE6C:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE6C: REG: 0x00600858, VALUE: 0x00001FFF
(II) NOUVEAU(0): 0xDE6C: CURRENT VALUE IS: 0x00001FFF
(II) NOUVEAU(0): 0xDE79:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE79: REG: 0x00602858, VALUE: 0x00001FFF
(II) NOUVEAU(0): 0xDE79: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDE86:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE86: REG: 0x00600818, VALUE: 0x01100010
(II) NOUVEAU(0): 0xDE86: CURRENT VALUE IS: 0x01100010
(II) NOUVEAU(0): 0xDE93:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDE93: REG: 0x0060081C, VALUE: 0x66655602
(II) NOUVEAU(0): 0xDE93: CURRENT VALUE IS: 0x66655602
(II) NOUVEAU(0): 0xDEA0:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xDEA0: CRTC INDEX: 0x44, VALUE: 0x03
(II) NOUVEAU(0): 0xDEA0: CURRENT VALUE IS: 0x24
(II) NOUVEAU(0): 0xDEA3:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xDEA3: CRTC REG: 0x03C4, INDEX: 0x0001, VALUE: 0x20
(II) NOUVEAU(0): 0xDEA3: CURRENT VALUE IS: 0x00
(II) NOUVEAU(0): 0xDEA9:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xDEA9: CRTC INDEX: 0x44, VALUE: 0x00
(II) NOUVEAU(0): 0xDEA9: CURRENT VALUE IS: 0x24
(II) NOUVEAU(0): 0xDEAC:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xDEAC: CRTC REG: 0x03C4, INDEX: 0x0001, VALUE: 0x20
(II) NOUVEAU(0): 0xDEAC: CURRENT VALUE IS: 0x00
(II) NOUVEAU(0): 0xDEB2:  [ (0x65) -  INIT_RESET ]
(II) NOUVEAU(0): 0xDEB2: REG: 0x00000200, VALUE: 0x01100000
(II) NOUVEAU(0): 0xDEB2: REG: 0x00000200, VALUE: 0x05110111
(II) NOUVEAU(0): 0xDEB2: CURRENT VALUE IS: 0x17111113
(II) NOUVEAU(0): 0xDEBF:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDEBF: REG: 0x00101000, VALUE: 0x2340DE8B
(II) NOUVEAU(0): 0xDEBF: CURRENT VALUE IS: 0x2340DE8B
(II) NOUVEAU(0): 0xDECC:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDECC: REG: 0x0010100C, VALUE: 0x00000490
(II) NOUVEAU(0): 0xDECC: CURRENT VALUE IS: 0x00000490
(II) NOUVEAU(0): 0xDED9:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDED9: REG: 0x0000C000, VALUE: 0x00000001
(II) NOUVEAU(0): 0xDED9: CURRENT VALUE IS: 0x00020000
(II) NOUVEAU(0): 0xDEE2:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDEE2: REG: 0x0000C000, VALUE: 0x00020000
(II) NOUVEAU(0): 0xDEE2: CURRENT VALUE IS: 0x00020000
(II) NOUVEAU(0): 0xDEEF:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDEEF: REG: 0x0000C020, VALUE: 0x00000000
(II) NOUVEAU(0): 0xDEEF: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDEF8:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDEF8: REG: 0x00100210, VALUE: 0x00000000
(II) NOUVEAU(0): 0xDEF8: CURRENT VALUE IS: 0x80006060
(II) NOUVEAU(0): 0xDF01:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF01: REG: 0x0000C040, VALUE: 0x30000000
(II) NOUVEAU(0): 0xDF01: CURRENT VALUE IS: 0x3C0BC003
(II) NOUVEAU(0): 0xDF0A:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF0A: REG: 0x00004000, VALUE: 0xC000001C
(II) NOUVEAU(0): 0xDF0A: CURRENT VALUE IS: 0xC002001C
(II) NOUVEAU(0): 0xDF13:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF13: REG: 0x00004008, VALUE: 0xE000001C
(II) NOUVEAU(0): 0xDF13: CURRENT VALUE IS: 0xC000001C
(II) NOUVEAU(0): 0xDF1C:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF1C: REG: 0x00680580, VALUE: 0x01C0001C
(II) NOUVEAU(0): 0xDF1C: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDF25:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF25: REG: 0x00004020, VALUE: 0x2000001C
(II) NOUVEAU(0): 0xDF25: CURRENT VALUE IS: 0xE041001C
(II) NOUVEAU(0): 0xDF2E:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF2E: REG: 0x00680510, VALUE: 0x01F0001F
(II) NOUVEAU(0): 0xDF2E: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDF37:  [ (0x75) -  INIT_CONDITION ]
(II) NOUVEAU(0): 0xDF37: CHECKING IF REGVAL: 0x00000000 equals COND:
0x00000040
(II) NOUVEAU(0): 0xDF37: CONDITION IS NOT FULFILLED.
(II) NOUVEAU(0): 0xDF37: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xDF39:  [ (0x62) -  INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 0xDF3E:  [ (0x38) -  INIT_NOT ]
(II) NOUVEAU(0): 0xDF3E: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xDF3F:  [ (0x62) -  INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 0xDF3F: CRTC REG: 0x03D4, INDEX: 0x003C, VALUE: 0x00
(II) NOUVEAU(0): 0xDF3F: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xDF44:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0xDF45:  [ (0x37) -  INIT_COPY ]
(II) NOUVEAU(0): 0xDF45: CRTC REG: 0x03D4, INDEX: 0x003C, VALUE: 0x20
(II) NOUVEAU(0): 0xDF45: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xDF50:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF50: REG: 0x00001508, VALUE: 0x00000000
(II) NOUVEAU(0): 0xDF50: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDF59:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDF59: REG: 0x00001584, VALUE: 0x00000011
(II) NOUVEAU(0): 0xDF59: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDF66:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF66: REG: 0x00680580, VALUE: 0x01F0001F
(II) NOUVEAU(0): 0xDF66: CURRENT VALUE IS: 0x01F0001F
(II) NOUVEAU(0): 0xDF6F:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDF6F: REG: 0x00001580, VALUE: 0x30000000
(II) NOUVEAU(0): 0xDF6F: CURRENT VALUE IS: 0x30000000
(II) NOUVEAU(0): 0xDF7C:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF7C: REG: 0x0000C044, VALUE: 0x00001010
(II) NOUVEAU(0): 0xDF7C: CURRENT VALUE IS: 0x00001010
(II) NOUVEAU(0): 0xDF85:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF85: REG: 0x00000140, VALUE: 0x00000000
(II) NOUVEAU(0): 0xDF85: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xDF8E:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDF8E: REG: 0x000015B4, VALUE: 0x08000000
(II) NOUVEAU(0): 0xDF8E: CURRENT VALUE IS: 0x08000000
(II) NOUVEAU(0): 0xDF9B:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDF9B: REG: 0x000015B8, VALUE: 0x94800000
(II) NOUVEAU(0): 0xDF9B: CURRENT VALUE IS: 0x94800000
(II) NOUVEAU(0): 0xDFA4:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xDFA4: REG: 0x00000200, VALUE: 0x17111113
(II) NOUVEAU(0): 0xDFA4: CURRENT VALUE IS: 0x17111113
(II) NOUVEAU(0): 0xDFB1:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDFB1: REG: 0x00680608, VALUE: 0x00100000
(II) NOUVEAU(0): 0xDFB1: CURRENT VALUE IS: 0xF0100000
(II) NOUVEAU(0): 0xDFBA:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDFBA: REG: 0x00682608, VALUE: 0x00100000
(II) NOUVEAU(0): 0xDFBA: CURRENT VALUE IS: 0xF0110000
(II) NOUVEAU(0): 0xDFC3:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDFC3: REG: 0x00100080, VALUE: 0x47170020
(II) NOUVEAU(0): 0xDFC3: CURRENT VALUE IS: 0x47170020
(II) NOUVEAU(0): 0xDFCC:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xDFCC: REG: 0x00001084, VALUE: 0x00205749
(II) NOUVEAU(0): 0xDFCC: CURRENT VALUE IS: 0x00205749
(II) NOUVEAU(0): 0xDFD5:  [ (0x6B) -  INIT_SUB ]
(II) NOUVEAU(0): 0xDFD5: EXECUTING SUB-SCRIPT: 7
(II) NOUVEAU(0): 0xE7F5:  [ (0x4A) -  INIT_IO_RESTRICT_PLL ]
(II) NOUVEAU(0): 0xE7F5: [ NOT YET IMPLEMENTED ]
(II) NOUVEAU(0): 0xDFD5: END OF SUB-SCRIPT
(II) NOUVEAU(0): 0xDFD7:  [ (0x6B) -  INIT_SUB ]
(II) NOUVEAU(0): 0xDFD7: EXECUTING SUB-SCRIPT: 6
(II) NOUVEAU(0): 0xE7C9:  [ (0x4A) -  INIT_IO_RESTRICT_PLL ]
(II) NOUVEAU(0): 0xE7C9: [ NOT YET IMPLEMENTED ]
(II) NOUVEAU(0): 0xDFD7: END OF SUB-SCRIPT
(II) NOUVEAU(0): 0xDFD9:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xDFD9: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xDFD9: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xDFD9: REG: 0x0010037C, VALUE: 0x0F0F0F0F
(II) NOUVEAU(0): 0xDFD9: CURRENT VALUE IS: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE004:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE004: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE004: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE004: REG: 0x00100380, VALUE: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE004: CURRENT VALUE IS: 0x0F0F0F0F
(II) NOUVEAU(0): 0xE02F:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE02F: REG: 0x001003AC, VALUE: 0x80808080
(II) NOUVEAU(0): 0xE02F: CURRENT VALUE IS: 0x80808080
(II) NOUVEAU(0): 0xE038:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE038: REG: 0x001003B0, VALUE: 0x80808080
(II) NOUVEAU(0): 0xE038: CURRENT VALUE IS: 0x80808080
(II) NOUVEAU(0): 0xE041:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE041: REG: 0x00004028, VALUE: 0x80000AA8
(II) NOUVEAU(0): 0xE041: CURRENT VALUE IS: 0x80000AA8
(II) NOUVEAU(0): 0xE04A:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE04A: REG: 0x0000C040, VALUE: 0x3C0BC003
(II) NOUVEAU(0): 0xE04A: CURRENT VALUE IS: 0x3C0BC003
(II) NOUVEAU(0): 0xE053:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE053: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE053: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE053: REG: 0x00100220, VALUE: 0x06101B15
(II) NOUVEAU(0): 0xE053: CURRENT VALUE IS: 0x06101B15
(II) NOUVEAU(0): 0xE07E:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE07E: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE07E: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE07E: REG: 0x00100224, VALUE: 0x0B010804
(II) NOUVEAU(0): 0xE07E: CURRENT VALUE IS: 0x0B010804
(II) NOUVEAU(0): 0xE0A9:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE0A9: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE0A9: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE0A9: REG: 0x00100228, VALUE: 0x23230606
(II) NOUVEAU(0): 0xE0A9: CURRENT VALUE IS: 0x23230606
(II) NOUVEAU(0): 0xE0D4:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE0D4: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE0D4: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE0D4: REG: 0x0010022C, VALUE: 0x530B9304
(II) NOUVEAU(0): 0xE0D4: CURRENT VALUE IS: 0x530B9304
(II) NOUVEAU(0): 0xE0FF:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE0FF: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE0FF: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE0FF: REG: 0x00100230, VALUE: 0x000002FF
(II) NOUVEAU(0): 0xE0FF: CURRENT VALUE IS: 0x000002FF
(II) NOUVEAU(0): 0xE12A:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE12A: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE12A: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE12A: REG: 0x00100234, VALUE: 0x00B5FF22
(II) NOUVEAU(0): 0xE12A: CURRENT VALUE IS: 0x00B5FF22
(II) NOUVEAU(0): 0xE155:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE155: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE155: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE155: REG: 0x00100238, VALUE: 0x00140200
(II) NOUVEAU(0): 0xE155: CURRENT VALUE IS: 0x00140200
(II) NOUVEAU(0): 0xE180:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE180: REG: 0x00100440, VALUE: 0x80300100
(II) NOUVEAU(0): 0xE180: CURRENT VALUE IS: 0x8030010B
(II) NOUVEAU(0): 0xE18A: Parsing init table 1
(II) NOUVEAU(0): 0xE18A: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE18A:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE18A: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE18A: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE18A: REG: 0x00100350, VALUE: 0x0000440A
(II) NOUVEAU(0): 0xE18A: CURRENT VALUE IS: 0x0000440A
(II) NOUVEAU(0): 0xE1B5:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE1B5: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE1B5: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE1B5: REG: 0x001003F4, VALUE: 0x04020204
(II) NOUVEAU(0): 0xE1B5: CURRENT VALUE IS: 0x04020204
(II) NOUVEAU(0): 0xE1E0:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE1E0: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE1E0: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE1E0: REG: 0x001003F8, VALUE: 0x04020204
(II) NOUVEAU(0): 0xE1E0: CURRENT VALUE IS: 0x04020204
(II) NOUVEAU(0): 0xE20B:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE20B: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE20B: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE20B: REG: 0x00001080, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE20B: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE236:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE236: REG: 0x00100210, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE236: CURRENT VALUE IS: 0x80000303
(II) NOUVEAU(0): 0xE23F:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE23F: REG: 0x00001220, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE23F: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE248:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE248: REG: 0x00001228, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE248: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE251:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE251: REG: 0x00001210, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE251: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE25A:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE25A: REG: 0x00001214, VALUE: 0x04770101
(II) NOUVEAU(0): 0xE25A: CURRENT VALUE IS: 0x04770101
(II) NOUVEAU(0): 0xE263:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE263: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE263: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE263: REG: 0x00001218, VALUE: 0xF0000101
(II) NOUVEAU(0): 0xE263: CURRENT VALUE IS: 0xF0000101
(II) NOUVEAU(0): 0xE28E:  [ (0x58) -  INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xE28E: REG: 0x00001230, VALUE: 0xBFBFBFBF
(II) NOUVEAU(0): 0xE28E: CURRENT VALUE IS: 0x80009F9F
(II) NOUVEAU(0): 0xE28E: REG: 0x00001234, VALUE: 0xBFBFBFBF
(II) NOUVEAU(0): 0xE28E: CURRENT VALUE IS: 0x206F3DBF
(II) NOUVEAU(0): 0xE28E: REG: 0x00001238, VALUE: 0xBFBFBEBF
(II) NOUVEAU(0): 0xE28E: CURRENT VALUE IS: 0xBFBFB41F
(II) NOUVEAU(0): 0xE2A0:  [ (0x58) -  INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xE2A0: REG: 0x00001240, VALUE: 0xBFBFBFBF
(II) NOUVEAU(0): 0xE2A0: CURRENT VALUE IS: 0x80009F9F
(II) NOUVEAU(0): 0xE2A0: REG: 0x00001244, VALUE: 0xBFBFBFBF
(II) NOUVEAU(0): 0xE2A0: CURRENT VALUE IS: 0x246F3DBF
(II) NOUVEAU(0): 0xE2A0: REG: 0x00001248, VALUE: 0xBFBFBEBF
(II) NOUVEAU(0): 0xE2A0: CURRENT VALUE IS: 0xBFBFB41F
(II) NOUVEAU(0): 0xE2A0: REG: 0x0000124C, VALUE: 0xAA11AA11
(II) NOUVEAU(0): 0xE2A0: CURRENT VALUE IS: 0x0A110A11
(II) NOUVEAU(0): 0xE2B6:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE2B6: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE2B6: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE2B6: REG: 0x00100360, VALUE: 0x8B303A98
(II) NOUVEAU(0): 0xE2B6: CURRENT VALUE IS: 0x8B303A98
(II) NOUVEAU(0): 0xE2E1:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE2E1: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE2E1: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE2E1: REG: 0x00100450, VALUE: 0x00010101
(II) NOUVEAU(0): 0xE2E1: CURRENT VALUE IS: 0x00010101
(II) NOUVEAU(0): 0xE30C:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE30C: REG: 0x00100454, VALUE: 0x00000011
(II) NOUVEAU(0): 0xE30C: CURRENT VALUE IS: 0x00000011
(II) NOUVEAU(0): 0xE315:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE315: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE315: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE315: REG: 0x00100458, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE315: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE340:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE340: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE340: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE340: REG: 0x0010045C, VALUE: 0x00001011
(II) NOUVEAU(0): 0xE340: CURRENT VALUE IS: 0x00001011
(II) NOUVEAU(0): 0xE36B:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE36B: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE36B: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE36B: REG: 0x00100470, VALUE: 0x00000100
(II) NOUVEAU(0): 0xE36B: CURRENT VALUE IS: 0x00000100
(II) NOUVEAU(0): 0xE396:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE396: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE396: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE396: REG: 0x00100474, VALUE: 0x11110012
(II) NOUVEAU(0): 0xE396: CURRENT VALUE IS: 0x11110012
(II) NOUVEAU(0): 0xE3C1:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE3C1: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE3C1: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE3C1: REG: 0x00100490, VALUE: 0x00000002
(II) NOUVEAU(0): 0xE3C1: CURRENT VALUE IS: 0x00000002
(II) NOUVEAU(0): 0xE3EC:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE3EC: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE3EC: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE3EC: REG: 0x00100480, VALUE: 0x77777777
(II) NOUVEAU(0): 0xE3EC: CURRENT VALUE IS: 0x77777777
(II) NOUVEAU(0): 0xE417:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE417: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE417: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE417: REG: 0x00100460, VALUE: 0x99999999
(II) NOUVEAU(0): 0xE417: CURRENT VALUE IS: 0x99999999
(II) NOUVEAU(0): 0xE442:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE442: Sleeping for 0x03E8 microseconds.
(II) NOUVEAU(0): 0xE445:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE445: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE445: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE445: REG: 0x00100218, VALUE: 0x00000100
(II) NOUVEAU(0): 0xE445: CURRENT VALUE IS: 0x00000101
(II) NOUVEAU(0): 0xE470:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE470: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE473:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE473: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE473: REG: 0x0010021C, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE473: CURRENT VALUE IS: 0x00000001
(II) NOUVEAU(0): 0xE475:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE475: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE478:  [ (0x75) -  INIT_CONDITION ]
(II) NOUVEAU(0): 0xE478: CHECKING IF REGVAL: 0x00000000 equals COND:
0x00000020
(II) NOUVEAU(0): 0xE478: CONDITION IS NOT FULFILLED.
(II) NOUVEAU(0): 0xE478: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE47A:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE4A5:  [ (0x38) -  INIT_NOT ]
(II) NOUVEAU(0): 0xE4A5: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE4A6:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE4A6: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE4A6: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE4A6: REG: 0x00100200, VALUE: 0x43003E00
(II) NOUVEAU(0): 0xE4A6: CURRENT VALUE IS: 0x43003E00
(II) NOUVEAU(0): 0xE4D1:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0xE4D2:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE4D2: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE4D5:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE4D5: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE4D5: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE4D5: REG: 0x00100204, VALUE: 0x00559020
(II) NOUVEAU(0): 0xE4D5: CURRENT VALUE IS: 0x00559020
(II) NOUVEAU(0): 0xE500:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE500: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE500: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE500: REG: 0x00100210, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE500: CURRENT VALUE IS: 0x80000808
(II) NOUVEAU(0): 0xE52B:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE52B: REG: 0x00100214, VALUE: 0x000000B0
(II) NOUVEAU(0): 0xE52B: CURRENT VALUE IS: 0x000000B0
(II) NOUVEAU(0): 0xE534:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE534: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE537:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE537: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE537: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE537: REG: 0x00100218, VALUE: 0x00000100
(II) NOUVEAU(0): 0xE537: CURRENT VALUE IS: 0x00000101
(II) NOUVEAU(0): 0xE562:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE562: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE565:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE565: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE565: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE565: REG: 0x00100218, VALUE: 0x00000101
(II) NOUVEAU(0): 0xE565: CURRENT VALUE IS: 0x00000101
(II) NOUVEAU(0): 0xE590:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE590: Sleeping for 0x07D0 microseconds.
(II) NOUVEAU(0): 0xE593:  [ (0x39) -  INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0xE593: CHECKING IF DATA: 00 equals COND: 10
(II) NOUVEAU(0): 0xE593: CONDITION IS NOT FULFILLED.
(II) NOUVEAU(0): 0xE593: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE595:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE59E:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE5A7:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0xE5A7: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xE5A8:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE5A8: Sleeping for 0x00C8 microseconds.
(II) NOUVEAU(0): 0xE5AB:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE5AB: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE5AB: REG: 0x001002D8, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE5AB: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE5AD:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE5AD: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE5AD: REG: 0x001002D4, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE5AD: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE5AF:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE5AF: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE5AF: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE5AF: REG: 0x001002E0, VALUE: 0x00200000
(II) NOUVEAU(0): 0xE5AF: CURRENT VALUE IS: 0x00300000
(II) NOUVEAU(0): 0xE5DA:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE5DA: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE5DA: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE5DA: REG: 0x001002E8, VALUE: 0x00200000
(II) NOUVEAU(0): 0xE5DA: CURRENT VALUE IS: 0x00300000
(II) NOUVEAU(0): 0xE605:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE605: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE605: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE605: REG: 0x001002E0, VALUE: 0x00300000
(II) NOUVEAU(0): 0xE605: CURRENT VALUE IS: 0x00300000
(II) NOUVEAU(0): 0xE630:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE630: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE630: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE630: REG: 0x001002E8, VALUE: 0x00300000
(II) NOUVEAU(0): 0xE630: CURRENT VALUE IS: 0x00300000
(II) NOUVEAU(0): 0xE65B:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE65B: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE65B: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE65B: REG: 0x001002C4, VALUE: 0x00100006
(II) NOUVEAU(0): 0xE65B: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE686:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE686: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE686: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE686: REG: 0x001002CC, VALUE: 0x00100006
(II) NOUVEAU(0): 0xE686: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE6B1:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE6B1: REG: 0x00100084, VALUE: 0x0000001D
(II) NOUVEAU(0): 0xE6B1: CURRENT VALUE IS: 0x00000011
(II) NOUVEAU(0): 0xE6BA:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE6BA: REG: 0x00100090, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE6BA: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE6C4: Parsing init table 2
(II) NOUVEAU(0): 0xE6C4: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE6C4:  [ (0x4B) -  INIT_PLL ]
(II) NOUVEAU(0): 0xE6CD:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE6CD: REG: 0x00001088, VALUE: 0x000011F0
(II) NOUVEAU(0): 0xE6CD: CURRENT VALUE IS: 0x000211F0
(II) NOUVEAU(0): 0xE6D6:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE6D6: REG: 0x0000108C, VALUE: 0x000000D1
(II) NOUVEAU(0): 0xE6D6: CURRENT VALUE IS: 0x000000D1
(II) NOUVEAU(0): 0xE6DF:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE6DF: REG: 0x00001530, VALUE: 0x80000577
(II) NOUVEAU(0): 0xE6DF: CURRENT VALUE IS: 0x80000577
(II) NOUVEAU(0): 0xE6EC:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE6EC: REG: 0x00680880, VALUE: 0x31101191
(II) NOUVEAU(0): 0xE6EC: CURRENT VALUE IS: 0x21101191
(II) NOUVEAU(0): 0xE6F9:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE6F9: REG: 0x00680610, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE6F9: CURRENT VALUE IS: 0x94050140
(II) NOUVEAU(0): 0xE702:  [ (0x54) -  INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 0xE702: CRTC INDEX: 0x38, VALUE: 0x00
(II) NOUVEAU(0): 0xE702: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE702: CRTC INDEX: 0x1A, VALUE: 0x3F
(II) NOUVEAU(0): 0xE702: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE702: CRTC INDEX: 0x28, VALUE: 0x00
(II) NOUVEAU(0): 0xE702: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE702: CRTC INDEX: 0x33, VALUE: 0x00
(II) NOUVEAU(0): 0xE702: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE702: CRTC INDEX: 0x21, VALUE: 0xFA
(II) NOUVEAU(0): 0xE702: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE70E:  [ (0x52) -  INIT_CR ]
(II) NOUVEAU(0): 0xE70E: CRTC INDEX: 0x2B, VALUE: 0x20
(II) NOUVEAU(0): 0xE70E: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712:  [ (0x54) -  INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x2C, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x3A, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x3B, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x4A, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x4B, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE712: CRTC INDEX: 0x4C, VALUE: 0x00
(II) NOUVEAU(0): 0xE712: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720:  [ (0x51) -  INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 7F
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 01
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 02
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 03
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 04
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 05
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 57    DATA: 06
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE720: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE720: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE72C:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE72C: CRTC INDEX: 0x43, VALUE: 0x01
(II) NOUVEAU(0): 0xE72C: CURRENT VALUE IS: 0x20
(II) NOUVEAU(0): 0xE72F:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE72F: CRTC REG: 0x03D4, INDEX: 0x0085, VALUE: 0xFF
(II) NOUVEAU(0): 0xE72F: CURRENT VALUE IS: 0xFF
(II) NOUVEAU(0): 0xE735:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE735: CRTC REG: 0x03D4, INDEX: 0x0086, VALUE: 0x01
(II) NOUVEAU(0): 0xE735: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE73B:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE73B: CRTC INDEX: 0x44, VALUE: 0x03
(II) NOUVEAU(0): 0xE73B: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE73E:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE73E: CRTC INDEX: 0x21, VALUE: 0xFA
(II) NOUVEAU(0): 0xE73E: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE741:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE741: CRTC REG: 0x03D4, INDEX: 0x0085, VALUE: 0xFF
(II) NOUVEAU(0): 0xE741: CURRENT VALUE IS: 0xFF
(II) NOUVEAU(0): 0xE747:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE747: CRTC REG: 0x03D4, INDEX: 0x0086, VALUE: 0x01
(II) NOUVEAU(0): 0xE747: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE74D:  [ (0x52) -  INIT_CR ]
(II) NOUVEAU(0): 0xE74D: CRTC INDEX: 0x2B, VALUE: 0x00
(II) NOUVEAU(0): 0xE74D: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751:  [ (0x54) -  INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x2C, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x3A, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x3B, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x3C, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x4A, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x4B, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE751: CRTC INDEX: 0x4C, VALUE: 0x00
(II) NOUVEAU(0): 0xE751: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761:  [ (0x51) -  INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 57    DATA: 00
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 58    DATA: 7F
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 57    DATA: 01
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 57    DATA: 02
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE761: CRTC INDEX: 58    DATA: 00
(II) NOUVEAU(0): 0xE761: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE769:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE769: CRTC INDEX: 0x43, VALUE: 0x01
(II) NOUVEAU(0): 0xE769: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE76C:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE76C: CRTC INDEX: 0x44, VALUE: 0x00
(II) NOUVEAU(0): 0xE76C: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE76F:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE76F: CRTC INDEX: 0x52, VALUE: 0x04
(II) NOUVEAU(0): 0xE76F: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE772:  [ (0x53) -  INIT_ZM_CR ]
(II) NOUVEAU(0): 0xE772: CRTC INDEX: 0x53, VALUE: 0x40
(II) NOUVEAU(0): 0xE772: CURRENT VALUE IS: 0x01
(II) NOUVEAU(0): 0xE775:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE775: REG: 0x00001584, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE775: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE782:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE782: REG: 0x00100210, VALUE: 0x80000000
(II) NOUVEAU(0): 0xE782: CURRENT VALUE IS: 0x8000C8C8
(II) NOUVEAU(0): 0xE78B:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE78B: REG: 0x0068052C, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE78B: CURRENT VALUE IS: 0x00000001
(II) NOUVEAU(0): 0xE798:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE798: REG: 0x0068252C, VALUE: 0x00000101
(II) NOUVEAU(0): 0xE798: CURRENT VALUE IS: 0x00000100
(II) NOUVEAU(0): 0xE7A5:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE7A5: REG: 0x00680848, VALUE: 0x11100101
(II) NOUVEAU(0): 0xE7A5: CURRENT VALUE IS: 0x11100101
(II) NOUVEAU(0): 0xE7B2:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE7B2: REG: 0x00682848, VALUE: 0x11100011
(II) NOUVEAU(0): 0xE7B2: CURRENT VALUE IS: 0x11100011
(II) NOUVEAU(0): 0xE7BF:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE7BF: REG: 0x00001200, VALUE: 0x0003103C
(II) NOUVEAU(0): 0xE7BF: CURRENT VALUE IS: 0x0003103C
(II) NOUVEAU(0): 0xE821: Parsing init table 3
(II) NOUVEAU(0): 0xE821: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE821:  [ (0x5B) -  INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xE821: EXECUTING SUB-ROUTINE AT: 0xD2F6
(II) NOUVEAU(0): 0xD2F6:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xD2F6: REG: 0x00001304, VALUE: 0x00000800
(II) NOUVEAU(0): 0xD2F6: CURRENT VALUE IS: 0x00000800
(II) NOUVEAU(0): 0xD2FF:  [ (0x58) -  INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xD2FF: REG: 0x00001400, VALUE: 0xA9A81DA2
(II) NOUVEAU(0): 0xD2FF: CURRENT VALUE IS: 0xA9A81DA2
(II) NOUVEAU(0): 0xD2FF: REG: 0x00001404, VALUE: 0x7FB71E23
(II) NOUVEAU(0): 0xD2FF: CURRENT VALUE IS: 0x7FB71E23
(II) NOUVEAU(0): 0xD2FF: REG: 0x00001408, VALUE: 0xC9C825D7
(II) NOUVEAU(0): 0xD2FF: CURRENT VALUE IS: 0xC9C825D7
(II) NOUVEAU(0): 0xD2FF: REG: 0x0000140C, VALUE: 0x7F27C216
(II) NOUVEAU(0): 0xD2FF: CURRENT VALUE IS: 0x7F27C216
(II) NOUVEAU(0): 0xD315:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xD315: REG: 0x00001098, VALUE: 0x21CA0604
(II) NOUVEAU(0): 0xD315: CURRENT VALUE IS: 0x21CA0604
(II) NOUVEAU(0): 0xD322:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xD322: REG: 0x00001310, VALUE: 0x00000000
(II) NOUVEAU(0): 0xD322: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE821: END OF SUB-ROUTINE
(II) NOUVEAU(0): 0xE824:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE824: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE824: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE824: REG: 0x001002C0, VALUE: 0x00000B52
(II) NOUVEAU(0): 0xE824: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0xE84F:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE84F: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE84F: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE84F: REG: 0x001002C8, VALUE: 0x00000B52
(II) NOUVEAU(0): 0xE84F: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0xE87A:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE87A: Sleeping for 0x03E8 microseconds.
(II) NOUVEAU(0): 0xE87D:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE87D: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE87D: REG: 0x001002D4, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE87D: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE87F:  [ (0x33) -  INIT_REPEAT ]
(II) NOUVEAU(0): 0xE87F: REPEATING FOLLOWING SEGMENT 10 TIMES.
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE881:  [ (0x6F) -  INIT_MACRO ]
(II) NOUVEAU(0): 0xE881: WRITE 1 32-BIT REGS:
(II) NOUVEAU(0): 0xE881: REG: 0x001002D0, VALUE: 0x00000001
(II) NOUVEAU(0): 0xE881: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE883:  [ (0x36) -  INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xE884:  [ (0x6B) -  INIT_SUB ]
(II) NOUVEAU(0): 0xE884: EXECUTING SUB-SCRIPT: 8
(II) NOUVEAU(0): 0x5DCE:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0x5DCE: CRTC REG: 0x03D4, INDEX: 0x0044, VALUE: 0x00
(II) NOUVEAU(0): 0x5DCE: CURRENT VALUE IS: 0x00
(II) NOUVEAU(0): 0x5DD4:  [ (0x39) -  INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5DD4: CHECKING IF DATA: 02 equals COND: 21
(II) NOUVEAU(0): 0x5DD4: CONDITION IS NOT FULFILLED.
(II) NOUVEAU(0): 0x5DD4: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5DD6:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5DE3:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5DF0:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5DFD:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E0A:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0x5E0D:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0x5E0D: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5E0E:  [ (0x39) -  INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5E0E: CHECKING IF DATA: 02 equals COND: 23
(II) NOUVEAU(0): 0x5E0E: CONDITION IS NOT FULFILLED.
(II) NOUVEAU(0): 0x5E0E: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0x5E10:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E1D:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E2A:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E37:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E44:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0x5E47:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0x5E47: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0x5E48:  [ (0x39) -  INIT_IO_FLAG_CONDITION ]
(II) NOUVEAU(0): 0x5E48: CHECKING IF DATA: 00 equals COND: 00
(II) NOUVEAU(0): 0x5E48: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0x5E4A:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E4A: REG: 0x001002C8, VALUE: 0x00000B52
(II) NOUVEAU(0): 0x5E4A: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0x5E57:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E57: REG: 0x001002C0, VALUE: 0x00000B52
(II) NOUVEAU(0): 0x5E57: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0x5E64:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E64: REG: 0x001002C8, VALUE: 0x00000A52
(II) NOUVEAU(0): 0x5E64: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0x5E71:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0x5E71: REG: 0x001002C0, VALUE: 0x00000A52
(II) NOUVEAU(0): 0x5E71: CURRENT VALUE IS: 0x00000A52
(II) NOUVEAU(0): 0x5E7E:  [ (0x72) -  INIT_RESUME ]
(II) NOUVEAU(0): 0xE884: END OF SUB-SCRIPT
(II) NOUVEAU(0): 0xE886:  [ (0x74) -  INIT_TIME ]
(II) NOUVEAU(0): 0xE886: Sleeping for 0x0064 microseconds.
(II) NOUVEAU(0): 0xE889:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE889: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE889: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE889: REG: 0x00100440, VALUE: 0x8030010B
(II) NOUVEAU(0): 0xE889: CURRENT VALUE IS: 0x8030010B
(II) NOUVEAU(0): 0xE8B4:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE8B4: REG: 0x00100210, VALUE: 0x80000000
(II) NOUVEAU(0): 0xE8B4: CURRENT VALUE IS: 0x80005151
(II) NOUVEAU(0): 0xE8BD:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE8BD: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE8BD: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE8BD: REG: 0x001002C4, VALUE: 0x00100386
(II) NOUVEAU(0): 0xE8BD: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE8E8:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE8E8: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE8E8: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE8E8: REG: 0x001002CC, VALUE: 0x00100386
(II) NOUVEAU(0): 0xE8E8: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE913:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE913: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE913: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE913: REG: 0x001002C4, VALUE: 0x00100042
(II) NOUVEAU(0): 0xE913: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE93E:  [ (0x32) -  INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xE93E: CRTC REG: 0x03D4, INDEX: 0x3C
(II) NOUVEAU(0): 0xE93E: CONFIGURATION TO USE: 0x02
(II) NOUVEAU(0): 0xE93E: REG: 0x001002CC, VALUE: 0x00100042
(II) NOUVEAU(0): 0xE93E: CURRENT VALUE IS: 0x00100042
(II) NOUVEAU(0): 0xE969:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE969: REG: 0x0070FFF0, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE969: CURRENT VALUE IS: 0x00020000
(II) NOUVEAU(0): 0xE972:  [ (0x63) -  INIT_COMPUTE_MEM ]
(II) NOUVEAU(0): 0xE973:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE973: REG: 0x0070FFF0, VALUE: 0x00000000
(II) NOUVEAU(0): 0xE973: CURRENT VALUE IS: 0x00020000
(II) NOUVEAU(0): 0xE97C:  [ (0x5F) -  INIT_COPY_NV_REG ]
(II) NOUVEAU(0): 0xE97C: REG: 0x00001700, VALUE: 0x08000000
(II) NOUVEAU(0): 0xE97C: CURRENT VALUE IS: 0x08000000
(II) NOUVEAU(0): 0xE992:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE992: REG: 0x00100200, VALUE: 0x43003E00
(II) NOUVEAU(0): 0xE992: CURRENT VALUE IS: 0x43003E00
(II) NOUVEAU(0): 0xE99F:  [ (0x78) -  INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE99F: CRTC REG: 0x03C4, INDEX: 0x0001, VALUE: 0x00
(II) NOUVEAU(0): 0xE99F: CURRENT VALUE IS: 0x00
(II) NOUVEAU(0): 0xE9A5:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE9A5: REG: 0x00011014, VALUE: 0x00008000
(II) NOUVEAU(0): 0xE9A5: CURRENT VALUE IS: 0x00000000
(II) NOUVEAU(0): 0xE9B2:  [ (0x7A) -  INIT_ZM_REG ]
(II) NOUVEAU(0): 0xE9B2: REG: 0x00088150, VALUE: 0x00000002
(II) NOUVEAU(0): 0xE9B2: CURRENT VALUE IS: 0x00000002
(II) NOUVEAU(0): 0xE9BB:  [ (0x6E) -  INIT_NV_REG ]
(II) NOUVEAU(0): 0xE9BB: REG: 0x0008813C, VALUE: 0x07000000
(II) NOUVEAU(0): 0xE9BB: CURRENT VALUE IS: 0x07000000
(II) NOUVEAU(0): 0xE9C9: Parsing init table 4
(II) NOUVEAU(0): 0xE9C9: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0x0242: Found BIT command with id 0x4C
(II) NOUVEAU(0): 0x0248: Found BIT command with id 0x74
(II) NOUVEAU(0): 0x024E: Found BIT command with id 0x4D
(II) NOUVEAU(0): 0x0254: Found BIT command with id 0x4E
(II) NOUVEAU(0): 0x025A: Found BIT command with id 0x50
(II) NOUVEAU(0): 0x0260: Found BIT command with id 0x53
(II) NOUVEAU(0): 0x0266: Found BIT command with id 0x54
(II) NOUVEAU(0): 0x026C: Found BIT command with id 0x55
(II) NOUVEAU(0): 0x0272: Found BIT command with id 0x56
(II) NOUVEAU(0): 0x0278: Found BIT command with id 0x63
(II) NOUVEAU(0): 0x027E: Found BIT command with id 0x69
(II) NOUVEAU(0): 0x0284: Found BIT command with id 0x00
(II) NOUVEAU(0): Display Configuration Block version 3.0 found
(II) NOUVEAU(0): DCB header length 19, with 0A possible entries
(II) NOUVEAU(0): Found 10 entries in DCB.
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(II) NOUVEAU(0): I2C bus "DDC" initialized.
(II) NOUVEAU(0): Probing for analog device on output A...
(--) NOUVEAU(0):   ...can't find one
(II) NOUVEAU(0): Probing for analog device on output B...
(--) NOUVEAU(0):   ...found one
(II) NOUVEAU(0): Probing for EDID on I2C bus A...
(II) NOUVEAU(0): I2C device "DDC:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC:ddc2" removed.
(II) NOUVEAU(0):   ... none found
(II) NOUVEAU(0): Probing for EDID on I2C bus B...
(II) NOUVEAU(0): I2C device "DDC:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC:ddc2" removed.
(II) NOUVEAU(0):   ... none found
(--) NOUVEAU(0): CRTC 0 is currently programmed for DFP
(II) NOUVEAU(0): Using DFP on CRTC 0
(--) NOUVEAU(0): Panel size is 1400 x 1050
(II) NOUVEAU(0): Panel is TMDS
(--) NOUVEAU(0): VideoRAM: 131072 kBytes
(==) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(II) NOUVEAU(0): Monitor0: Using hsync range of 30.00-92.00 kHz
(II) NOUVEAU(0): Monitor0: Using vrefresh range of 50.00-180.00 Hz
(II) NOUVEAU(0): Clock range:  12.00 to 400.00 MHz
(II) NOUVEAU(0): Not using default mode "320x175" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x200" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "360x200" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x600" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1792x1344" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "896x672" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1856x1392" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "928x696" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "416x312" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "576x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1024" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1440" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "960x720" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "2048x1536" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode
clock/interlace/doublescan)
(--) NOUVEAU(0): Virtual size is 1400x1050 (pitch 1408)
(**) NOUVEAU(0): *Driver mode "1400x1050": 101.0 MHz, 64.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x59.9  101.00  1400 1448 1480 1560
 1050 1053 1057 1080 +hsync -vsync (64.7 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 155.8 MHz, 81.5 kHz, 74.8 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912
 1050 1052 1064 1090 +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 122.0 MHz, 64.9 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880
 1050 1052 1064 1082 +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 157.5 MHz, 91.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728
 1024 1025 1028 1072 +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 135.0 MHz, 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688
 1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 108.0 MHz, 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688
 1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 148.5 MHz, 85.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x85.0  148.50  1280 1344 1504 1728
960 961 964 1011 +hsync +vsync (85.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 108.0 MHz, 60.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800
960 961 964 1000 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 108.0 MHz, 67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600
864 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "1152x768": 65.0 MHz, 44.2 kHz, 54.8 Hz
(II) NOUVEAU(0): Modeline "1152x768"x54.8   65.00  1152 1178 1314 1472
768 771 777 806 +hsync +vsync (44.2 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 94.5 MHz, 68.7 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376
768 769 772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 78.8 MHz, 60.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312
768 769 772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 75.0 MHz, 56.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328
768 771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 65.0 MHz, 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344
768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Default mode "832x624": 57.3 MHz, 49.7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624
625 628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 56.3 MHz, 53.7 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.30  800 832 896 1048  600
601 604 631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 49.5 MHz, 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600
601 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 50.0 MHz, 48.1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600
637 643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 40.0 MHz, 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600
601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 36.0 MHz, 35.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600
601 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 36.0 MHz, 43.3 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x85.0   36.00  640 696 752 832  480
481 484 509 -hsync -vsync (43.3 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz, 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480
481 484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz, 37.9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480
489 492 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 25.2 MHz, 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480
490 492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Default mode "720x400": 35.5 MHz, 37.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "720x400"x85.0   35.50  720 756 828 936  400
401 404 446 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x400": 31.5 MHz, 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x400"x85.1   31.50  640 672 736 832  400
401 404 445 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x350": 31.5 MHz, 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x350"x85.1   31.50  640 672 736 832  350
382 385 445 +hsync -vsync (37.9 kHz)
(==) NOUVEAU(0): DPI set to (75, 75)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/X11/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.3
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/X11/modules//libexa.so
(II) Module exa: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 2.2.0
	ABI class: X.Org Video Driver, version 2.0
(II) Loading sub module "ramdac"
(II) LoadModule: "ramdac"(II) Module "ramdac" already built-in
(--) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
	[0] 0	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B]
	[1] 0	0	0xe0000000 - 0xefffffff (0x10000000) MX[B]
	[2] 0	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B]
	[3] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[4] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[5] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[6] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[7] -1	0	0xfddf8000 - 0xfddfbfff (0x4000) MX[B]
	[8] -1	0	0xfddff000 - 0xfddff07f (0x80) MX[B]
	[9] -1	0	0xfdef8000 - 0xfdefbfff (0x4000) MX[B]
	[10] -1	0	0xfdeff000 - 0xfdeff7ff (0x800) MX[B]
	[11] -1	0	0xfdffe000 - 0xfdffefff (0x1000) MX[B]
	[12] -1	0	0xfe025000 - 0xfe02500f (0x10) MX[B]
	[13] -1	0	0xfe026000 - 0xfe0260ff (0x100) MX[B]
	[14] -1	0	0xfe027000 - 0xfe027fff (0x1000) MX[B]
	[15] -1	0	0xfe028000 - 0xfe02800f (0x10) MX[B]
	[16] -1	0	0xfe029000 - 0xfe0290ff (0x100) MX[B]
	[17] -1	0	0xfe02a000 - 0xfe02afff (0x1000) MX[B]
	[18] -1	0	0xfe020000 - 0xfe023fff (0x4000) MX[B]
	[19] -1	0	0xfe02b000 - 0xfe02bfff (0x1000) MX[B]
	[20] -1	0	0xfe02c000 - 0xfe02cfff (0x1000) MX[B]
	[21] -1	0	0xfe02d000 - 0xfe02dfff (0x1000) MX[B]
	[22] -1	0	0xfe02e000 - 0xfe02e0ff (0x100) MX[B]
	[23] -1	0	0xfe02f000 - 0xfe02ffff (0x1000) MX[B]
	[24] -1	0	0xfdfff000 - 0xfdffffff (0x1000) MX[B](B)
	[25] -1	0	0xfcfe0000 - 0xfcffffff (0x20000) MX[B](B)
	[26] -1	0	0xfb000000 - 0xfbffffff (0x1000000) MX[B](B)
	[27] -1	0	0xe0000000 - 0xefffffff (0x10000000) MX[B](B)
	[28] -1	0	0xfa000000 - 0xfaffffff (0x1000000) MX[B](B)
	[29] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B](OprD)
	[30] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B](OprD)
	[31] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B](OprD)
	[32] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[33] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[34] -1	0	0x0000ac00 - 0x0000ac7f (0x80) IX[B]
	[35] -1	0	0x0000b000 - 0x0000b007 (0x8) IX[B]
	[36] -1	0	0x0000b400 - 0x0000b407 (0x8) IX[B]
	[37] -1	0	0x0000b800 - 0x0000b80f (0x10) IX[B]
	[38] -1	0	0x0000bc00 - 0x0000bc03 (0x4) IX[B]
	[39] -1	0	0x0000c000 - 0x0000c007 (0x8) IX[B]
	[40] -1	0	0x0000c400 - 0x0000c403 (0x4) IX[B]
	[41] -1	0	0x0000c800 - 0x0000c807 (0x8) IX[B]
	[42] -1	0	0x0000cc00 - 0x0000cc0f (0x10) IX[B]
	[43] -1	0	0x00000b60 - 0x00000b63 (0x4) IX[B]
	[44] -1	0	0x00000960 - 0x00000967 (0x8) IX[B]
	[45] -1	0	0x00000be0 - 0x00000be3 (0x4) IX[B]
	[46] -1	0	0x000009e0 - 0x000009e7 (0x8) IX[B]
	[47] -1	0	0x0000e000 - 0x0000e00f (0x10) IX[B]
	[48] -1	0	0x00000b70 - 0x00000b73 (0x4) IX[B]
	[49] -1	0	0x00000970 - 0x00000977 (0x8) IX[B]
	[50] -1	0	0x00000bf0 - 0x00000bf3 (0x4) IX[B]
	[51] -1	0	0x000009f0 - 0x000009f7 (0x8) IX[B]
	[52] -1	0	0x0000f400 - 0x0000f40f (0x10) IX[B]
	[53] -1	0	0x00001c40 - 0x00001c7f (0x40) IX[B]
	[54] -1	0	0x00001c00 - 0x00001c3f (0x40) IX[B]
	[55] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B](OprU)
	[56] 0	0	0x000003c0 - 0x000003df (0x20) IS[B](OprU)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: drmOpenMinor returns 8
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle = 0xe4000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle = 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler

That's all, here comes the crash.

Some hints, what to do?

Best regards from Germany
Alfred

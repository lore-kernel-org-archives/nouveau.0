From: Jean Schurger <jean-n4NR3XaoQERg9hUCZPvPmw@public.gmane.org>
Subject: report : Unknown LVDS configuration bits
Date: Tue, 20 May 2008 13:44:26 -0400
Message-ID: <1211305466.4300.3.camel@Apostrophe>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-UCDYnQSUgqUbpZIQzoMV"
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


--=-UCDYnQSUgqUbpZIQzoMV
Content-Type: multipart/alternative; boundary="=-zquK0D80wtwCh6BkQUFy"


--=-zquK0D80wtwCh6BkQUFy
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

  I try to use the "nouveau" (from git today march 20) driver on my
laptop : an hp dv9000
that have an 

01:00.0 VGA compatible controller: nVidia Corporation GeForce 8600M GS
(rev a1)

X says :

(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found

and ask to report :

(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report

the whole X.0.log is attached at this mail

Jean.

--=-zquK0D80wtwCh6BkQUFy
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.18.1">
</HEAD>
<BODY>
Hi,<BR>
<BR>
&nbsp; I try to use the &quot;nouveau&quot; (from git today march 20) driver on my laptop : an hp dv9000<BR>
that have an <BR>
<BR>
01:00.0 VGA compatible controller: nVidia Corporation GeForce 8600M GS (rev a1)<BR>
<BR>
X says :<BR>
<BR>
(EE) Screen(s) found, but none have a usable configuration.<BR>
<BR>
Fatal server error:<BR>
no screens found<BR>
<BR>
and ask to report :<BR>
<BR>
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report<BR>
<BR>
the whole X.0.log is attached at this mail<BR>
<BR>
Jean.
</BODY>
</HTML>

--=-zquK0D80wtwCh6BkQUFy--

--=-UCDYnQSUgqUbpZIQzoMV
Content-Disposition: attachment; filename=Xorg.0.log
Content-Type: text/x-log; name=Xorg.0.log; charset=UTF-8
Content-Transfer-Encoding: 7bit


This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.4.0.90
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux Ubuntu (xorg-server 2:1.4.1~git20080131-1ubuntu9)
Current Operating System: Linux Apostrophe 2.6.24-16-generic #1 SMP Thu Apr 10 13:23:42 UTC 2008 i686
Build Date: 15 April 2008  05:26:17PM
 
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Tue May 20 13:34:39 2008
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Configured Monitor"
(**) |   |-->Device "Configured Video Device"
(**) |-->Input Device "Generic Keyboard"
(**) |-->Input Device "Configured Mouse"
(**) |-->Input Device "Synaptics Touchpad"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) No FontPath specified.  Using compiled-in default.
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
	Entry deleted from font path.
(==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType
(==) RgbPath set to "/etc/X11/rgb"
(==) ModulePath set to "/usr/lib/xorg/modules"
(**) Extension "Composite" is enabled
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x81dc500
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 2.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 0.3
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/xorg/modules//libpcidata.so
(II) Module pcidata: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(--) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 8086,2a00 card 103c,30cc rev 0c class 06,00,00 hdr 00
(II) PCI: 00:01:0: chip 8086,2a01 card 0000,0000 rev 0c class 06,04,00 hdr 01
(II) PCI: 00:1a:0: chip 8086,2834 card 103c,30cc rev 03 class 0c,03,00 hdr 80
(II) PCI: 00:1a:1: chip 8086,2835 card 103c,30cc rev 03 class 0c,03,00 hdr 00
(II) PCI: 00:1a:7: chip 8086,283a card 103c,30cc rev 03 class 0c,03,20 hdr 00
(II) PCI: 00:1b:0: chip 8086,284b card 103c,30cc rev 03 class 04,03,00 hdr 00
(II) PCI: 00:1c:0: chip 8086,283f card 0000,0000 rev 03 class 06,04,00 hdr 81
(II) PCI: 00:1c:1: chip 8086,2841 card 0000,0000 rev 03 class 06,04,00 hdr 81
(II) PCI: 00:1c:5: chip 8086,2849 card 0000,0000 rev 03 class 06,04,00 hdr 81
(II) PCI: 00:1d:0: chip 8086,2830 card 103c,30cc rev 03 class 0c,03,00 hdr 80
(II) PCI: 00:1d:1: chip 8086,2831 card 103c,30cc rev 03 class 0c,03,00 hdr 00
(II) PCI: 00:1d:2: chip 8086,2832 card 103c,30cc rev 03 class 0c,03,00 hdr 00
(II) PCI: 00:1d:7: chip 8086,2836 card 103c,30cc rev 03 class 0c,03,20 hdr 00
(II) PCI: 00:1e:0: chip 8086,2448 card 0000,0000 rev f3 class 06,04,01 hdr 01
(II) PCI: 00:1f:0: chip 8086,2815 card 103c,30cc rev 03 class 06,01,00 hdr 80
(II) PCI: 00:1f:1: chip 8086,2850 card 103c,30cc rev 03 class 01,01,8a hdr 00
(II) PCI: 00:1f:2: chip 8086,2829 card 103c,30cc rev 03 class 01,06,01 hdr 00
(II) PCI: 00:1f:3: chip 8086,283e card 103c,30cc rev 03 class 0c,05,00 hdr 00
(II) PCI: 01:00:0: chip 10de,0425 card 103c,30cc rev a1 class 03,00,00 hdr 00
(II) PCI: 02:00:0: chip 8086,4229 card 8086,1100 rev 61 class 02,80,00 hdr 00
(II) PCI: 06:00:0: chip 10ec,8168 card 103c,30cc rev 01 class 02,00,00 hdr 00
(II) PCI: 07:09:0: chip 1180,0832 card 103c,30cc rev 05 class 0c,00,10 hdr 80
(II) PCI: 07:09:1: chip 1180,0822 card 103c,30cc rev 22 class 08,05,00 hdr 80
(II) PCI: 07:09:2: chip 1180,0592 card 103c,30cc rev 12 class 08,80,00 hdr 80
(II) PCI: 07:09:3: chip 1180,0852 card 103c,30cc rev 12 class 08,80,00 hdr 80
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
(II) Bus 1: bridge is at (0:1:0), (0,1,1), BCTRL: 0x001a (VGA_EN is set)
(II) Bus 1 I/O range:
	[0] -1	0	0x00002000 - 0x00002fff (0x1000) IX[B]
(II) Bus 1 non-prefetchable memory range:
	[0] -1	0	0xc4000000 - 0xc6ffffff (0x3000000) MX[B]
(II) Bus 1 prefetchable memory range:
	[0] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 2: bridge is at (0:28:0), (0,2,3), BCTRL: 0x0004 (VGA_EN is cleared)
(II) Bus 2 I/O range:
	[0] -1	0	0x00004000 - 0x000040ff (0x100) IX[B]
	[1] -1	0	0x00004400 - 0x000044ff (0x100) IX[B]
	[2] -1	0	0x00004800 - 0x000048ff (0x100) IX[B]
	[3] -1	0	0x00004c00 - 0x00004cff (0x100) IX[B]
	[4] -1	0	0x00005000 - 0x000050ff (0x100) IX[B]
	[5] -1	0	0x00005400 - 0x000054ff (0x100) IX[B]
	[6] -1	0	0x00005800 - 0x000058ff (0x100) IX[B]
	[7] -1	0	0x00005c00 - 0x00005cff (0x100) IX[B]
	[8] -1	0	0x00006000 - 0x000060ff (0x100) IX[B]
	[9] -1	0	0x00006400 - 0x000064ff (0x100) IX[B]
	[10] -1	0	0x00006800 - 0x000068ff (0x100) IX[B]
	[11] -1	0	0x00006c00 - 0x00006cff (0x100) IX[B]
	[12] -1	0	0x00007000 - 0x000070ff (0x100) IX[B]
	[13] -1	0	0x00007400 - 0x000074ff (0x100) IX[B]
	[14] -1	0	0x00007800 - 0x000078ff (0x100) IX[B]
	[15] -1	0	0x00007c00 - 0x00007cff (0x100) IX[B]
(II) Bus 2 non-prefetchable memory range:
	[0] -1	0	0xf4000000 - 0xf7ffffff (0x4000000) MX[B]
(II) Bus 2 prefetchable memory range:
	[0] -1	0	0xf0000000 - 0xf3ffffff (0x4000000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 4: bridge is at (0:28:1), (0,4,5), BCTRL: 0x0004 (VGA_EN is cleared)
(II) Bus 4 I/O range:
	[0] -1	0	0x00008000 - 0x000080ff (0x100) IX[B]
	[1] -1	0	0x00008400 - 0x000084ff (0x100) IX[B]
	[2] -1	0	0x00008800 - 0x000088ff (0x100) IX[B]
	[3] -1	0	0x00008c00 - 0x00008cff (0x100) IX[B]
	[4] -1	0	0x00009000 - 0x000090ff (0x100) IX[B]
	[5] -1	0	0x00009400 - 0x000094ff (0x100) IX[B]
	[6] -1	0	0x00009800 - 0x000098ff (0x100) IX[B]
	[7] -1	0	0x00009c00 - 0x00009cff (0x100) IX[B]
	[8] -1	0	0x0000a000 - 0x0000a0ff (0x100) IX[B]
	[9] -1	0	0x0000a400 - 0x0000a4ff (0x100) IX[B]
	[10] -1	0	0x0000a800 - 0x0000a8ff (0x100) IX[B]
	[11] -1	0	0x0000ac00 - 0x0000acff (0x100) IX[B]
	[12] -1	0	0x0000b000 - 0x0000b0ff (0x100) IX[B]
	[13] -1	0	0x0000b400 - 0x0000b4ff (0x100) IX[B]
	[14] -1	0	0x0000b800 - 0x0000b8ff (0x100) IX[B]
	[15] -1	0	0x0000bc00 - 0x0000bcff (0x100) IX[B]
(II) Bus 4 non-prefetchable memory range:
	[0] -1	0	0xbc000000 - 0xbfffffff (0x4000000) MX[B]
(II) Bus 4 prefetchable memory range:
	[0] -1	0	0xc8000000 - 0xcbffffff (0x4000000) MX[B]
(II) PCI-to-PCI bridge:
(II) Bus 6: bridge is at (0:28:5), (0,6,6), BCTRL: 0x0004 (VGA_EN is cleared)
(II) Bus 6 I/O range:
	[0] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[1] -1	0	0x0000c400 - 0x0000c4ff (0x100) IX[B]
	[2] -1	0	0x0000c800 - 0x0000c8ff (0x100) IX[B]
	[3] -1	0	0x0000cc00 - 0x0000ccff (0x100) IX[B]
(II) Bus 6 non-prefetchable memory range:
	[0] -1	0	0xf8000000 - 0xf80fffff (0x100000) MX[B]
(II) Bus 6 prefetchable memory range:
	[0] -1	0	0x88000000 - 0x880fffff (0x100000) MX[B]
(II) Subtractive PCI-to-PCI bridge:
(II) Bus 7: bridge is at (0:30:0), (0,7,7), BCTRL: 0x0004 (VGA_EN is cleared)
(II) Bus 7 non-prefetchable memory range:
	[0] -1	0	0xf8100000 - 0xf81fffff (0x100000) MX[B]
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:31:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is set)
(--) PCI:*(1:0:0) nVidia Corporation GeForce 8600M GS rev 161, Mem @ 0xc6000000/24, 0xd0000000/28, 0xc4000000/25, I/O @ 0x2000/7
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
	[0] -1	0	0xf8101000 - 0xf81010ff (0x100) MX[B]
	[1] -1	0	0xf8100c00 - 0xf8100cff (0x100) MX[B]
	[2] -1	0	0xf8100800 - 0xf81008ff (0x100) MX[B]
	[3] -1	0	0xf8100000 - 0xf81007ff (0x800) MX[B]
	[4] -1	0	0xf8000000 - 0xf8000fff (0x1000) MX[B]
	[5] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[6] -1	0	0x88100000 - 0x881000ff (0x100) MX[B]
	[7] -1	0	0xf8404000 - 0xf84047ff (0x800) MX[B]
	[8] -1	0	0xf8404c00 - 0xf8404fff (0x400) MX[B]
	[9] -1	0	0xf8400000 - 0xf8403fff (0x4000) MX[B]
	[10] -1	0	0xf8404800 - 0xf8404bff (0x400) MX[B]
	[11] -1	0	0xc4000000 - 0xc5ffffff (0x2000000) MX[B](B)
	[12] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[13] -1	0	0xc6000000 - 0xc6ffffff (0x1000000) MX[B](B)
	[14] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[15] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[16] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[17] -1	0	0x000018c8 - 0x000018cb (0x4) IX[B]
	[18] -1	0	0x000018d0 - 0x000018d7 (0x8) IX[B]
	[19] -1	0	0x000018cc - 0x000018cf (0x4) IX[B]
	[20] -1	0	0x000018d8 - 0x000018df (0x8) IX[B]
	[21] -1	0	0x000018a0 - 0x000018af (0x10) IX[B]
	[22] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[23] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[24] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[25] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[26] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[27] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[28] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[29] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[30] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[31] -1	0	0x00002000 - 0x0000207f (0x80) IX[B](B)
(II) Active PCI resource ranges after removing overlaps:
	[0] -1	0	0xf8101000 - 0xf81010ff (0x100) MX[B]
	[1] -1	0	0xf8100c00 - 0xf8100cff (0x100) MX[B]
	[2] -1	0	0xf8100800 - 0xf81008ff (0x100) MX[B]
	[3] -1	0	0xf8100000 - 0xf81007ff (0x800) MX[B]
	[4] -1	0	0xf8000000 - 0xf8000fff (0x1000) MX[B]
	[5] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[6] -1	0	0x88100000 - 0x881000ff (0x100) MX[B]
	[7] -1	0	0xf8404000 - 0xf84047ff (0x800) MX[B]
	[8] -1	0	0xf8404c00 - 0xf8404fff (0x400) MX[B]
	[9] -1	0	0xf8400000 - 0xf8403fff (0x4000) MX[B]
	[10] -1	0	0xf8404800 - 0xf8404bff (0x400) MX[B]
	[11] -1	0	0xc4000000 - 0xc5ffffff (0x2000000) MX[B](B)
	[12] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[13] -1	0	0xc6000000 - 0xc6ffffff (0x1000000) MX[B](B)
	[14] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[15] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[16] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[17] -1	0	0x000018c8 - 0x000018cb (0x4) IX[B]
	[18] -1	0	0x000018d0 - 0x000018d7 (0x8) IX[B]
	[19] -1	0	0x000018cc - 0x000018cf (0x4) IX[B]
	[20] -1	0	0x000018d8 - 0x000018df (0x8) IX[B]
	[21] -1	0	0x000018a0 - 0x000018af (0x10) IX[B]
	[22] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[23] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[24] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[25] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[26] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[27] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[28] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[29] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[30] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[31] -1	0	0x00002000 - 0x0000207f (0x80) IX[B](B)
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
	[4] -1	0	0xf8101000 - 0xf81010ff (0x100) MX[B]
	[5] -1	0	0xf8100c00 - 0xf8100cff (0x100) MX[B]
	[6] -1	0	0xf8100800 - 0xf81008ff (0x100) MX[B]
	[7] -1	0	0xf8100000 - 0xf81007ff (0x800) MX[B]
	[8] -1	0	0xf8000000 - 0xf8000fff (0x1000) MX[B]
	[9] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[10] -1	0	0x88100000 - 0x881000ff (0x100) MX[B]
	[11] -1	0	0xf8404000 - 0xf84047ff (0x800) MX[B]
	[12] -1	0	0xf8404c00 - 0xf8404fff (0x400) MX[B]
	[13] -1	0	0xf8400000 - 0xf8403fff (0x4000) MX[B]
	[14] -1	0	0xf8404800 - 0xf8404bff (0x400) MX[B]
	[15] -1	0	0xc4000000 - 0xc5ffffff (0x2000000) MX[B](B)
	[16] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[17] -1	0	0xc6000000 - 0xc6ffffff (0x1000000) MX[B](B)
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[20] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[21] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[22] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[23] -1	0	0x000018c8 - 0x000018cb (0x4) IX[B]
	[24] -1	0	0x000018d0 - 0x000018d7 (0x8) IX[B]
	[25] -1	0	0x000018cc - 0x000018cf (0x4) IX[B]
	[26] -1	0	0x000018d8 - 0x000018df (0x8) IX[B]
	[27] -1	0	0x000018a0 - 0x000018af (0x10) IX[B]
	[28] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[29] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[30] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[31] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[32] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[33] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[34] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[35] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[36] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[37] -1	0	0x00002000 - 0x0000207f (0x80) IX[B](B)
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
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
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules//fonts/libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
	compiled for 1.4.0.90, module version = 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
	ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 2.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.2.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
	compiled for 1.4.0, module version = 1.2.3
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "synaptics"
(II) Loading /usr/lib/xorg/modules/input//synaptics_drv.so
(II) Module synaptics: vendor="X.Org Foundation"
	compiled for 4.3.99.902, module version = 1.0.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) NOUVEAU driver Date:   Tue May 20 19:19:53 2008 +0200
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
(--) Chipset NVIDIA NV86 found
(II) resource ranges after xf86ClaimFixedResources() call:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xf8101000 - 0xf81010ff (0x100) MX[B]
	[5] -1	0	0xf8100c00 - 0xf8100cff (0x100) MX[B]
	[6] -1	0	0xf8100800 - 0xf81008ff (0x100) MX[B]
	[7] -1	0	0xf8100000 - 0xf81007ff (0x800) MX[B]
	[8] -1	0	0xf8000000 - 0xf8000fff (0x1000) MX[B]
	[9] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[10] -1	0	0x88100000 - 0x881000ff (0x100) MX[B]
	[11] -1	0	0xf8404000 - 0xf84047ff (0x800) MX[B]
	[12] -1	0	0xf8404c00 - 0xf8404fff (0x400) MX[B]
	[13] -1	0	0xf8400000 - 0xf8403fff (0x4000) MX[B]
	[14] -1	0	0xf8404800 - 0xf8404bff (0x400) MX[B]
	[15] -1	0	0xc4000000 - 0xc5ffffff (0x2000000) MX[B](B)
	[16] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[17] -1	0	0xc6000000 - 0xc6ffffff (0x1000000) MX[B](B)
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[20] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[21] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[22] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[23] -1	0	0x000018c8 - 0x000018cb (0x4) IX[B]
	[24] -1	0	0x000018d0 - 0x000018d7 (0x8) IX[B]
	[25] -1	0	0x000018cc - 0x000018cf (0x4) IX[B]
	[26] -1	0	0x000018d8 - 0x000018df (0x8) IX[B]
	[27] -1	0	0x000018a0 - 0x000018af (0x10) IX[B]
	[28] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[29] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[30] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[31] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[32] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[33] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[34] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[35] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[36] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[37] -1	0	0x00002000 - 0x0000207f (0x80) IX[B](B)
(II) resource ranges after probing:
	[0] -1	0	0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
	[1] -1	0	0x000f0000 - 0x000fffff (0x10000) MX[B]
	[2] -1	0	0x000c0000 - 0x000effff (0x30000) MX[B]
	[3] -1	0	0x00000000 - 0x0009ffff (0xa0000) MX[B]
	[4] -1	0	0xf8101000 - 0xf81010ff (0x100) MX[B]
	[5] -1	0	0xf8100c00 - 0xf8100cff (0x100) MX[B]
	[6] -1	0	0xf8100800 - 0xf81008ff (0x100) MX[B]
	[7] -1	0	0xf8100000 - 0xf81007ff (0x800) MX[B]
	[8] -1	0	0xf8000000 - 0xf8000fff (0x1000) MX[B]
	[9] -1	0	0xf4000000 - 0xf4001fff (0x2000) MX[B]
	[10] -1	0	0x88100000 - 0x881000ff (0x100) MX[B]
	[11] -1	0	0xf8404000 - 0xf84047ff (0x800) MX[B]
	[12] -1	0	0xf8404c00 - 0xf8404fff (0x400) MX[B]
	[13] -1	0	0xf8400000 - 0xf8403fff (0x4000) MX[B]
	[14] -1	0	0xf8404800 - 0xf8404bff (0x400) MX[B]
	[15] -1	0	0xc4000000 - 0xc5ffffff (0x2000000) MX[B](B)
	[16] -1	0	0xd0000000 - 0xdfffffff (0x10000000) MX[B](B)
	[17] -1	0	0xc6000000 - 0xc6ffffff (0x1000000) MX[B](B)
	[18] 0	0	0x000a0000 - 0x000affff (0x10000) MS[B]
	[19] 0	0	0x000b0000 - 0x000b7fff (0x8000) MS[B]
	[20] 0	0	0x000b8000 - 0x000bffff (0x8000) MS[B]
	[21] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[22] -1	0	0x00000000 - 0x000000ff (0x100) IX[B]
	[23] -1	0	0x0000c000 - 0x0000c0ff (0x100) IX[B]
	[24] -1	0	0x00001c00 - 0x00001c1f (0x20) IX[B]
	[25] -1	0	0x000018e0 - 0x000018ff (0x20) IX[B]
	[26] -1	0	0x000018c8 - 0x000018cb (0x4) IX[B]
	[27] -1	0	0x000018d0 - 0x000018d7 (0x8) IX[B]
	[28] -1	0	0x000018cc - 0x000018cf (0x4) IX[B]
	[29] -1	0	0x000018d8 - 0x000018df (0x8) IX[B]
	[30] -1	0	0x000018a0 - 0x000018af (0x10) IX[B]
	[31] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[32] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[33] -1	0	0x000001f0 - 0x000001f0 (0x1) IX[B]
	[34] -1	0	0x000001f0 - 0x000001f7 (0x8) IX[B]
	[35] -1	0	0x00001880 - 0x0000189f (0x20) IX[B]
	[36] -1	0	0x00001860 - 0x0000187f (0x20) IX[B]
	[37] -1	0	0x00001840 - 0x0000185f (0x20) IX[B]
	[38] -1	0	0x00001820 - 0x0000183f (0x20) IX[B]
	[39] -1	0	0x00001800 - 0x0000181f (0x20) IX[B]
	[40] -1	0	0x00002000 - 0x0000207f (0x80) IX[B](B)
	[41] 0	0	0x000003b0 - 0x000003bb (0xc) IS[B]
	[42] 0	0	0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 1.0.0
	ABI class: X.Org Video Driver, version 2.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "NVIDIA NV86"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.4.0.90, module version = 0.1.0
	ABI class: X.Org Video Driver, version 2.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): New (experimental) restore support disabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD0000000
(--) NOUVEAU(0): MMIO registers at 0xC6000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: open result is -1, (No such device or address)
drmOpenDevice: Open failed
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: drmOpenMinor returns 9
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module version 0.0.10
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(WW) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to locate BIOS image in PRAMIN
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 60.86.44.00
(II) NOUVEAU(0): 0xC2EB: Parsing init table 0
(II) NOUVEAU(0): 0xC2EB: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xC2EB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x00000000
(II) NOUVEAU(0): 0xC2F4: [ (0x33) - INIT_REPEAT ]
(II) NOUVEAU(0): 0xC2F4: REPEATING FOLLOWING SEGMENT 20 TIMES
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC2F6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC2F6: Reg: 0x00000000, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 	Write: Reg: 0x00000000, Data: 0x086500A2
(II) NOUVEAU(0): 0xC303: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xC304: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC304: Cond: 0x0B, Reg: 0x0000C040, Mask: 0x00000300, Cmpval: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xC304: Checking if 0x00000300 equals 0x00000000
(II) NOUVEAU(0): 0xC304: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xC304: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC306: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 0xC30F: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC30F: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC310: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC310: Cond: 0x0A, Reg: 0x00001540, Mask: 0x00FF0000, Cmpval: 0x00030000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001540, Data: 0xF3030001
(II) NOUVEAU(0): 0xC310: Checking if 0x00030000 equals 0x00030000
(II) NOUVEAU(0): 0xC310: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xC312: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC312: Cond: 0x0B, Reg: 0x0000C040, Mask: 0x00000300, Cmpval: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xC312: Checking if 0x00000300 equals 0x00000000
(II) NOUVEAU(0): 0xC312: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xC312: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC314: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC321: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC321: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC322: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC322: Cond: 0x0A, Reg: 0x00001540, Mask: 0x00FF0000, Cmpval: 0x00030000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001540, Data: 0xF3030001
(II) NOUVEAU(0): 0xC322: Checking if 0x00030000 equals 0x00030000
(II) NOUVEAU(0): 0xC322: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xC324: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC324: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC324: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xC324: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xC324: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC326: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC328: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC335: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC335: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC336: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC336: Reg: 0x0061C00C, Mask: 0xFFFFFFDF, Data: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x0061C00C, Data: 0x01060200
(II) NOUVEAU(0): 	Write: Reg: 0x0061C00C, Data: 0x01060220
(II) NOUVEAU(0): 0xC343: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC343: Reg: 0x0061C80C, Mask: 0xFFFFFFDF, Data: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x0061C80C, Data: 0x03010700
(II) NOUVEAU(0): 	Write: Reg: 0x0061C80C, Data: 0x03010720
(II) NOUVEAU(0): 0xC350: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0xC0110111
(II) NOUVEAU(0): 0xC359: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xC359: EXECUTING SUB-ROUTINE AT 0xD108
(II) NOUVEAU(0): 0xD108: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xD108: BaseReg: 0x001009C0, Count: 0x07
(II) NOUVEAU(0): 	Write: Reg: 0x001009C0, Data: 0x04040004
(II) NOUVEAU(0): 	Write: Reg: 0x001009C4, Data: 0x00000404
(II) NOUVEAU(0): 	Write: Reg: 0x001009C8, Data: 0x04040004
(II) NOUVEAU(0): 	Write: Reg: 0x001009CC, Data: 0x00000404
(II) NOUVEAU(0): 	Write: Reg: 0x001009D0, Data: 0x00000404
(II) NOUVEAU(0): 	Write: Reg: 0x001009D4, Data: 0x04000004
(II) NOUVEAU(0): 	Write: Reg: 0x001009D8, Data: 0x04000004
(II) NOUVEAU(0): 0xD12A: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xD12A: Reg: 0x001009DC, RegIncrement: 0x04, Count: 0x05, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001009DC, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001009E0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001009E4, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001009E8, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001009EC, Data: 0x00000000
(II) NOUVEAU(0): 0xD1D1: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC359: END OF SUB-ROUTINE AT 0xD108
(II) NOUVEAU(0): 0xC35C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC35C: Reg: 0x001008C0, Mask: 0xFF00FFFF, Data: 0x08040000
(II) NOUVEAU(0): 	Read:  Reg: 0x001008C0, Data: 0x8B303A98
(II) NOUVEAU(0): 	Write: Reg: 0x001008C0, Data: 0x8B043A98
(II) NOUVEAU(0): 0xC369: [ (0x69) - INIT_IO ]
(II) NOUVEAU(0): 0xC369: Port: 0x03C3, Mask: 0x00, Data: 0x01
(II) NOUVEAU(0): 	IO read:  Port: 0x03C3, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	IO write: Port: 0x03C3, Head: 0x00, Data: 0x01
(II) NOUVEAU(0): 0xC36E: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3F, Head: 0x00, Data: 0x57
(II) NOUVEAU(0): 0xC371: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC371: Reg: 0x0000E104, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 0xC37E: [ (0x8E) - INIT_8E ]
(II) NOUVEAU(0): 0xC37E: Entry: 0x70000700, Reg: 0x0000E104, Shift: 0x00, Mask: 0xFFFFFFFC, Data: 0x00000002
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266202
(II) NOUVEAU(0): 0xC37E: Entry: 0x70000700, Reg: 0x0000E100, Shift: 0x00, Mask: 0xFFFEFFFE, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37E: Entry: 0xA4002102, Reg: 0x0000E104, Shift: 0x08, Mask: 0xFFFFFCFF, Data: 0x00000200
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 0xC37E: Entry: 0xA4002102, Reg: 0x0000E100, Shift: 0x02, Mask: 0xFFFBFFFB, Data: 0x00040000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37E: Entry: 0x24000103, Reg: 0x0000E104, Shift: 0x0C, Mask: 0xFFFFCFFF, Data: 0x00002000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 0xC37E: Entry: 0x24000103, Reg: 0x0000E100, Shift: 0x03, Mask: 0xFFF7FFF7, Data: 0x00080000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37E: Entry: 0x24000004, Reg: 0x0000E104, Shift: 0x10, Mask: 0xFFFCFFFF, Data: 0x00020000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 0xC37E: Entry: 0x24000004, Reg: 0x0000E100, Shift: 0x04, Mask: 0xFFEFFFEF, Data: 0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37E: Entry: 0x20000405, Reg: 0x0000E104, Shift: 0x14, Mask: 0xFFCFFFFF, Data: 0x00200000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 0xC37E: Entry: 0x20000405, Reg: 0x0000E100, Shift: 0x05, Mask: 0xFFDFFFDF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37E: Entry: 0x70014200, Reg: 0x0000E104, Shift: 0x00, Mask: 0xFFFFFFFC, Data: 0x00000002
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E104, Data: 0x00266200
(II) NOUVEAU(0): 	Write: Reg: 0x0000E104, Data: 0x00266202
(II) NOUVEAU(0): 0xC37E: Entry: 0x70014200, Reg: 0x0000E100, Shift: 0x00, Mask: 0xFFFEFFFE, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 	Write: Reg: 0x0000E100, Data: 0x001C0100
(II) NOUVEAU(0): 0xC37F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC37F: Reg: 0x00001084, Mask: 0xFFFFF7FF, Data: 0x00000800
(II) NOUVEAU(0): 	Read:  Reg: 0x00001084, Data: 0x00001469
(II) NOUVEAU(0): 	Write: Reg: 0x00001084, Data: 0x00001C69
(II) NOUVEAU(0): 0xC38C: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC38C: Cond: 0x09, Reg: 0x0002130C, Mask: 0x00000001, Cmpval: 0x00000001
(EE) NOUVEAU(0): ========== unknown reg 0x0002130C ==========
(II) NOUVEAU(0): 0xC38C: Checking if 0x00000000 equals 0x00000001
(II) NOUVEAU(0): 0xC38C: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xC38C: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC38E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xC391: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC39E: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC39E: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC39F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E054, Data: 0x7FFF7FFF
(II) NOUVEAU(0): 0xC3A8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00009220, Data: 0x00000009
(II) NOUVEAU(0): 0xC3B1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00009200, Data: 0x000000D8
(II) NOUVEAU(0): 0xC3BA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00009210, Data: 0x00000019
(II) NOUVEAU(0): 0xC3C3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC3C3: Reg: 0x00101000, Mask: 0x70FFFFFF, Data: 0x8F000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC3D0: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC3D0: Reg: 0x0010100C, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0010100C, Data: 0x8001B010
(II) NOUVEAU(0): 	Write: Reg: 0x0010100C, Data: 0x8001B010
(II) NOUVEAU(0): 0xC3DD: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC3DD: Cond: 0x0B, Reg: 0x0000C040, Mask: 0x00000300, Cmpval: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xC3DD: Checking if 0x00000300 equals 0x00000000
(II) NOUVEAU(0): 0xC3DD: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xC3DD: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC3DF: [ (0x5F) - INIT_COPY_NV_REG ]
(II) NOUVEAU(0): 0xC3F5: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC3F5: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC3F6: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00619F00, Data: 0x00000009
(II) NOUVEAU(0): 0xC3FF: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC3FF: Cond: 0x06, Reg: 0x00021218, Mask: 0x000000FF, Cmpval: 0x00000000
(EE) NOUVEAU(0): ========== unknown reg 0x00021218 ==========
(II) NOUVEAU(0): 0xC3FF: Checking if 0x00000000 equals 0x00000000
(II) NOUVEAU(0): 0xC3FF: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xC401: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A068, Data: 0x4C00B71F
(II) NOUVEAU(0): 0xC40A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A868, Data: 0x4C00B71F
(II) NOUVEAU(0): 0xC413: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061B068, Data: 0x4C00B71F
(II) NOUVEAU(0): 0xC41C: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xC41C: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC41D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC42A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC437: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC444: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC444: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC445: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00617348, Data: 0x80000001
(II) NOUVEAU(0): 0xC44E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004700, Data: 0x80000021
(II) NOUVEAU(0): 0xC457: [ (0x37) - INIT_COPY ]
(II) NOUVEAU(0): 0xC457: Reg: 0x00101000, Shift: 0x02, SrcMask: 0x0F, Port: 0x03D4, Index: 0x88, Mask: 0xF0
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x03
(II) NOUVEAU(0): 0xC462: [ (0x37) - INIT_COPY ]
(II) NOUVEAU(0): 0xC462: Reg: 0x00101000, Shift: 0x18, SrcMask: 0x0F, Port: 0x03D4, Index: 0x8B, Mask: 0xF0
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x8B, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x8B, Head: 0x00, Data: 0x0F
(II) NOUVEAU(0): 0xC46D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC46D: Reg: 0x00001580, Mask: 0xFFFFFFFF, Data: 0x00090000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001580, Data: 0x00090000
(II) NOUVEAU(0): 	Write: Reg: 0x00001580, Data: 0x00090000
(II) NOUVEAU(0): 0xC47A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001538, Data: 0x00013333
(II) NOUVEAU(0): 0xC483: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC483: Reg: 0x0010002C, Mask: 0xFFFFFF00, Data: 0x00000012
(II) NOUVEAU(0): 	Read:  Reg: 0x0010002C, Data: 0x00000012
(II) NOUVEAU(0): 	Write: Reg: 0x0010002C, Data: 0x00000012
(II) NOUVEAU(0): 0xC490: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC490: Reg: 0x00003310, Mask: 0xFFFFF8FF, Data: 0x00000500
(II) NOUVEAU(0): 	Read:  Reg: 0x00003310, Data: 0x00000300
(II) NOUVEAU(0): 	Write: Reg: 0x00003310, Data: 0x00000500
(II) NOUVEAU(0): 0xC49D: [ (0x7A) - INIT_ZM_REG ]
(EE) NOUVEAU(0): ========== unknown reg 0x0002004C ==========
(II) NOUVEAU(0): 0xC4A6: [ (0x7A) - INIT_ZM_REG ]
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(II) NOUVEAU(0): 0xC4AF: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00088138, Data: 0x10000000
(II) NOUVEAU(0): 0xC4B8: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xC4B8: Cond: 0x0A, Reg: 0x00001540, Mask: 0x00FF0000, Cmpval: 0x00030000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001540, Data: 0xF3030001
(II) NOUVEAU(0): 0xC4B8: Checking if 0x00030000 equals 0x00030000
(II) NOUVEAU(0): 0xC4B8: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xC4BA: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xC4BA: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xC4BB: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC4C8: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xC4C8: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xC4C9: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC4C9: Reg: 0x0008818C, Mask: 0x0FFFFFF8, Data: 0xD0000007
(II) NOUVEAU(0): 	Read:  Reg: 0x0008818C, Data: 0xD0000007
(II) NOUVEAU(0): 	Write: Reg: 0x0008818C, Data: 0xD0000007
(II) NOUVEAU(0): 0xC4D6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC4D6: Reg: 0x00001604, Mask: 0xFFF33FFF, Data: 0x00044000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001604, Data: 0x00066A04
(II) NOUVEAU(0): 	Write: Reg: 0x00001604, Data: 0x00066A04
(II) NOUVEAU(0): 0xC4E3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC4E3: Reg: 0x00001530, Mask: 0xFFFFFFF0, Data: 0x0000000A
(II) NOUVEAU(0): 	Read:  Reg: 0x00001530, Data: 0x800412FA
(II) NOUVEAU(0): 	Write: Reg: 0x00001530, Data: 0x800412FA
(II) NOUVEAU(0): 0xC4F0: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xC4F0: EXECUTING SUB-SCRIPT 7
(II) NOUVEAU(0): 0xD2DA: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xD2DA: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00004008
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD2DA: Reg: 0x00004008, Config: 0x00, Freq: 200000kHz
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004004, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 	Write: Reg: 0x00004004, Data: 0x10000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004004, Data: 0x80020100
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x01011E01
(II) NOUVEAU(0): 	Write: Reg: 0x00004004, Data: 0xC0020100
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xD305: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC4F0: END OF SUB-SCRIPT 7
(II) NOUVEAU(0): 0xC4F2: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xC4F2: EXECUTING SUB-SCRIPT 8
(II) NOUVEAU(0): 0xD306: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xD306: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00004020
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD306: Reg: 0x00004020, Config: 0x00, Freq: 550000kHz
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000401C, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004020, Data: 0x80010000
(II) NOUVEAU(0): 	Write: Reg: 0x0000401C, Data: 0x10000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000401C, Data: 0x80010100
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0x01012901
(II) NOUVEAU(0): 	Write: Reg: 0x0000401C, Data: 0xC0010100
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xD331: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC4F2: END OF SUB-SCRIPT 8
(II) NOUVEAU(0): 0xC4F4: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xC4F4: EXECUTING SUB-SCRIPT 6
(II) NOUVEAU(0): 0xD2AE: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xD2AE: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00004028
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD2AE: Reg: 0x00004028, Config: 0x00, Freq: 275000kHz
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004024, Data: 0x00000B01
(II) NOUVEAU(0): 	Read:  Reg: 0x00004028, Data: 0xA0020000
(II) NOUVEAU(0): 	Write: Reg: 0x00004024, Data: 0x10000B01
(II) NOUVEAU(0): 	Write: Reg: 0x00004024, Data: 0x80020B01
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x00004028, Data: 0x01012901
(II) NOUVEAU(0): 	Write: Reg: 0x00004024, Data: 0xC0020B01
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xD2D9: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC4F4: END OF SUB-SCRIPT 6
(II) NOUVEAU(0): 0xC4F6: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xC4F6: EXECUTING SUB-SCRIPT 9
(II) NOUVEAU(0): 0xD332: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xD332: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00004030
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD332: Reg: 0x00004030, Config: 0x00, Freq: 450000kHz
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000402C, Data: 0x00001602
(II) NOUVEAU(0): 	Read:  Reg: 0x00004030, Data: 0x80010000
(II) NOUVEAU(0): 	Write: Reg: 0x0000402C, Data: 0x10001602
(II) NOUVEAU(0): 	Write: Reg: 0x0000402C, Data: 0x80011702
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 	Write: Reg: 0x00004030, Data: 0x01012101
(II) NOUVEAU(0): 	Write: Reg: 0x0000402C, Data: 0xC0011702
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xD35D: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC4F6: END OF SUB-SCRIPT 9
(II) NOUVEAU(0): 0xC4F8: [ (0x5F) - INIT_COPY_NV_REG ]
(II) NOUVEAU(0): 0xC4F8: SrcReg: 0x00004030, Shift: 0x08, SrcMask: 0x00000700, Xor: 0x00000000, DstReg: 0x00004700, DstMask: 0xFFFFF8FF
(II) NOUVEAU(0): 	Read:  Reg: 0x00004030, Data: 0x80010000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004700, Data: 0x80000121
(II) NOUVEAU(0): 	Write: Reg: 0x00004700, Data: 0x80000121
(II) NOUVEAU(0): 0xC50E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC50E: Reg: 0x0000E18C, Mask: 0xFFFFFFFE, Data: 0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0000E18C, Data: 0x00010001
(II) NOUVEAU(0): 	Write: Reg: 0x0000E18C, Data: 0x00010001
(II) NOUVEAU(0): 0xC51B: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xC51B: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xC51E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E818, Data: 0x80080000
(II) NOUVEAU(0): 0xC527: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xC527: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xC52A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC52A: Reg: 0x00004020, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004020, Data: 0x80010000
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0x80010000
(II) NOUVEAU(0): 0xC537: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC537: Reg: 0x00004028, Mask: 0xFFFFFFFF, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004028, Data: 0xA0020000
(II) NOUVEAU(0): 	Write: Reg: 0x00004028, Data: 0xA0020000
(II) NOUVEAU(0): 0xC544: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC544: Reg: 0x00004008, Mask: 0xFFFFFFFF, Data: 0x80001200
(II) NOUVEAU(0): 	Read:  Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x80027600
(II) NOUVEAU(0): 0xC551: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xC551: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xC554: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC554: Reg: 0x00004028, Mask: 0xFFFFFFFF, Data: 0xA0000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004028, Data: 0xA0020000
(II) NOUVEAU(0): 	Write: Reg: 0x00004028, Data: 0xA0020000
(II) NOUVEAU(0): 0xC561: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC561: Reg: 0x00004008, Mask: 0xFFFFEFFF, Data: 0x80004600
(II) NOUVEAU(0): 	Read:  Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x80026600
(II) NOUVEAU(0): 0xC56E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xC56E: Sleeping for 0x0064 microseconds
(II) NOUVEAU(0): 0xC571: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x2EE01B33
(II) NOUVEAU(0): 0xC57A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC57A: Reg: 0x00004008, Mask: 0xFFFFFDFF, Data: 0x80004400
(II) NOUVEAU(0): 	Read:  Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 0xC587: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E81C, Data: 0x00032001
(II) NOUVEAU(0): 0xC590: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E820, Data: 0x80660201
(II) NOUVEAU(0): 0xC599: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100B80, Data: 0x00780078
(II) NOUVEAU(0): 0xC5A2: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100B84, Data: 0x00780078
(II) NOUVEAU(0): 0xC5AB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100B0C, Data: 0x00080028
(II) NOUVEAU(0): 0xC5B4: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC5B4: Reg: 0x00020018, Mask: 0xFFFFFFFF, Data: 0x00000000
(EE) NOUVEAU(0): ========== unknown reg 0x00020018 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020018 ==========
(II) NOUVEAU(0): 0xC5C1: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xC5C1: EXECUTING SUB-ROUTINE AT 0xC092
(II) NOUVEAU(0): 0xC092: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC5C1: END OF SUB-ROUTINE AT 0xC092
(II) NOUVEAU(0): 0xC5C4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C044, Data: 0x00000008
(II) NOUVEAU(0): 0xC5CD: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100F34, Data: 0x00000001
(II) NOUVEAU(0): 0xC5D6: [ (0x7A) - INIT_ZM_REG ]
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(II) NOUVEAU(0): 0xC5DF: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E610, Data: 0x0000000F
(II) NOUVEAU(0): 0xC5E8: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E61C, Data: 0x0000000F
(II) NOUVEAU(0): 0xC5F1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E690, Data: 0xF4000204
(II) NOUVEAU(0): 0xC5FA: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC5FA: Reg: 0x00089008, Mask: 0xFFFFCFFF, Data: 0x00002000
(EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089008 ==========
(II) NOUVEAU(0): 0xC607: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC607: Reg: 0x00089028, Mask: 0xF8FFFFFF, Data: 0x01000000
(EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00089028 ==========
(II) NOUVEAU(0): 0xC614: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0008848C, Data: 0x15B20AD9
(II) NOUVEAU(0): 0xC61D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xC61D: Reg: 0x00001084, Mask: 0xFFFFF7FF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001084, Data: 0x00001469
(II) NOUVEAU(0): 	Write: Reg: 0x00001084, Data: 0x00001469
(II) NOUVEAU(0): 0xC62A: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC62B: Parsing init table 1
(II) NOUVEAU(0): 0xC62B: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xC62B: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xC62B: BaseReg: 0x00100718, Count: 0x02
(II) NOUVEAU(0): 	Write: Reg: 0x00100718, Data: 0x00100077
(II) NOUVEAU(0): 	Write: Reg: 0x0010071C, Data: 0x00022077
(II) NOUVEAU(0): 0xC639: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC639: Reg: 0x00100720, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100720, Data: 0x55555555
(II) NOUVEAU(0): 	Write: Reg: 0x00100724, Data: 0x55555555
(II) NOUVEAU(0): 0xC680: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC680: Reg: 0x001008A0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001008A0, Data: 0x87057C5F
(II) NOUVEAU(0): 	Write: Reg: 0x001008A4, Data: 0x87057C5F
(II) NOUVEAU(0): 0xC6C7: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC6C7: Reg: 0x00100A20, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100A20, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100A24, Data: 0x00000000
(II) NOUVEAU(0): 0xC70E: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC70E: Reg: 0x00100A40, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100A40, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100A44, Data: 0x00000000
(II) NOUVEAU(0): 0xC755: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC755: Reg: 0x00100A60, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100A60, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100A64, Data: 0x00000000
(II) NOUVEAU(0): 0xC79C: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC79C: Reg: 0x00100A80, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100A80, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100A84, Data: 0x00000000
(II) NOUVEAU(0): 0xC7E3: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC7E3: Reg: 0x00100AA0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100AA0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100AA4, Data: 0x00000000
(II) NOUVEAU(0): 0xC82A: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC82A: Reg: 0x00100AC0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100AC0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100AC4, Data: 0x00000000
(II) NOUVEAU(0): 0xC871: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xC871: EXECUTING SUB-ROUTINE AT 0xCE32
(II) NOUVEAU(0): 0xCE32: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xCE32: Reg: 0x00004008, Mask: 0xFFFF9FFF, Data: 0x00006000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0x80026400
(II) NOUVEAU(0): 0xCE3F: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCE3F: Reg: 0x00100760, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100760, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100764, Data: 0x00000000
(II) NOUVEAU(0): 0xCE86: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCE86: Reg: 0x00100780, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100780, Data: 0xABAA99A9
(II) NOUVEAU(0): 	Write: Reg: 0x00100784, Data: 0x88AA8888
(II) NOUVEAU(0): 0xCECD: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCECD: Reg: 0x001007A0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001007A0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001007A4, Data: 0x00000000
(II) NOUVEAU(0): 0xCF14: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCF14: Reg: 0x001007C0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001007C0, Data: 0xDDBBAACB
(II) NOUVEAU(0): 	Write: Reg: 0x001007C4, Data: 0x88AA8888
(II) NOUVEAU(0): 0xCF5B: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCF5B: Reg: 0x001007E0, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001007E0, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x001007E4, Data: 0x00000000
(II) NOUVEAU(0): 0xCFA2: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCFA2: Reg: 0x00100800, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100800, Data: 0x80898909
(II) NOUVEAU(0): 	Write: Reg: 0x00100804, Data: 0x08998888
(II) NOUVEAU(0): 0xCFE9: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC871: END OF SUB-ROUTINE AT 0xCE32
(II) NOUVEAU(0): 0xC874: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xC874: EXECUTING SUB-ROUTINE AT 0xCFEA
(II) NOUVEAU(0): 0xCFEA: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCFEA: Reg: 0x00100820, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100820, Data: 0x11111111
(II) NOUVEAU(0): 	Write: Reg: 0x00100824, Data: 0x11111111
(II) NOUVEAU(0): 0xD031: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xD031: Reg: 0x00100840, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100840, Data: 0x22224422
(II) NOUVEAU(0): 	Write: Reg: 0x00100844, Data: 0x22222222
(II) NOUVEAU(0): 0xD078: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC874: END OF SUB-ROUTINE AT 0xCFEA
(II) NOUVEAU(0): 0xC877: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xC877: EXECUTING SUB-ROUTINE AT 0xD079
(II) NOUVEAU(0): 0xD079: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xD079: Reg: 0x00100860, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100860, Data: 0x11111111
(II) NOUVEAU(0): 	Write: Reg: 0x00100864, Data: 0x11111111
(II) NOUVEAU(0): 0xD0C0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xD0C0: Reg: 0x00100880, RegIncrement: 0x04, Count: 0x02, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100880, Data: 0x22225522
(II) NOUVEAU(0): 	Write: Reg: 0x00100884, Data: 0x22222222
(II) NOUVEAU(0): 0xD107: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xC877: END OF SUB-ROUTINE AT 0xD079
(II) NOUVEAU(0): 0xC87A: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xC87A: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100700
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xC87A: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100700, Data: 0x00000000
(II) NOUVEAU(0): 0xC8A5: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xC8A5: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100714
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xC8A5: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100714, Data: 0x00033101
(II) NOUVEAU(0): 0xC8D0: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xC8D0: BaseReg: 0x00100740, Count: 0x02
(II) NOUVEAU(0): 	Write: Reg: 0x00100740, Data: 0x0A000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100744, Data: 0x0B000000
(II) NOUVEAU(0): 0xC8DE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100710, Data: 0x00000000
(II) NOUVEAU(0): 0xC8E7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010053C, Data: 0x00001000
(II) NOUVEAU(0): 0xC8F0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC8F0: Reg: 0x00100080, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100080, Data: 0x00000020
(II) NOUVEAU(0): 0xC917: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xC917: Reg: 0x00100220, RegIncrement: 0x04, Count: 0x0A, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100220, Data: 0x0D21461E
(II) NOUVEAU(0): 	Write: Reg: 0x00100224, Data: 0x0E010D06
(II) NOUVEAU(0): 	Write: Reg: 0x00100228, Data: 0x04060A0A
(II) NOUVEAU(0): 	Write: Reg: 0x0010022C, Data: 0x1A160505
(II) NOUVEAU(0): 	Write: Reg: 0x00100230, Data: 0x00000707
(II) NOUVEAU(0): 	Write: Reg: 0x00100234, Data: 0x460A090D
(II) NOUVEAU(0): 	Write: Reg: 0x00100238, Data: 0x002E052F
(II) NOUVEAU(0): 	Write: Reg: 0x0010023C, Data: 0x04050202
(II) NOUVEAU(0): 	Write: Reg: 0x00100240, Data: 0x110F0302
(II) NOUVEAU(0): 	Write: Reg: 0x00100244, Data: 0x00000307
(II) NOUVEAU(0): 0xCA5E: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCA5E: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCA5E: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xCA5E: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCA5E: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCA60: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCA8B: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCA8B: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xCA8C: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCA8C: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100200
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCA8C: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x01000000
(II) NOUVEAU(0): 0xCAB7: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCAB8: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCAB8: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100204
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCAB8: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100204, Data: 0x00559020
(II) NOUVEAU(0): 0xCAE3: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCAE3: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100214
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCAE3: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100214, Data: 0x00000033
(II) NOUVEAU(0): 0xCB0E: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCB0E: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x00100250
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCB0E: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x00100250, Data: 0x00000000
(II) NOUVEAU(0): 0xCB39: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCB39: Cond: 0x0A, Reg: 0x00001540, Mask: 0x00FF0000, Cmpval: 0x00030000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001540, Data: 0xF3030001
(II) NOUVEAU(0): 0xCB39: Checking if 0x00030000 equals 0x00030000
(II) NOUVEAU(0): 0xCB39: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xCB3B: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xCB3B: Reg: 0x0000122C, Mask: 0xFFFFFFFC, Data: 0x00000003
(II) NOUVEAU(0): 	Read:  Reg: 0x0000122C, Data: 0x00000003
(II) NOUVEAU(0): 	Write: Reg: 0x0000122C, Data: 0x00000003
(II) NOUVEAU(0): 0xCB48: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCB48: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCB49: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xCB56: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCB56: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xCB57: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCB57: Reg: 0x00100440, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100440, Data: 0x00300300
(II) NOUVEAU(0): 0xCB7E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xCB7E: Sleeping for 0x36B0 microseconds
(II) NOUVEAU(0): 0xCB81: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCB81: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xCB83: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xCB83: Sleeping for 0x00C8 microseconds
(II) NOUVEAU(0): 0xCB86: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x00000100
(II) NOUVEAU(0): 0xCB8F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010021C, Data: 0x00000001
(II) NOUVEAU(0): 0xCB98: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCB98: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCB98: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xCB98: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCB98: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCB9A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 0xCBA3: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCBA3: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xCBA4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x00000100
(II) NOUVEAU(0): 0xCBAD: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCBAE: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xCBAE: Sleeping for 0x0064 microseconds
(II) NOUVEAU(0): 0xCBB1: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100218, Data: 0x00000101
(II) NOUVEAU(0): 0xCBBA: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCBBA: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D8, Data: 0x00000001
(II) NOUVEAU(0): 0xCBBC: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCBBC: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xCBBE: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCBBE: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCBBE: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xCBBE: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCBBE: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCBC0: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 0xCBE7: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 0xCC0E: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 0xCC35: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCC35: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xCC36: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCC36: Reg: 0x001002E0, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001002E0, Data: 0x00200000
(II) NOUVEAU(0): 0xCC5D: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCC5D: Reg: 0x001002E4, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001002E4, Data: 0x00300000
(II) NOUVEAU(0): 0xCC84: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCC84: Reg: 0x001002C4, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001002C4, Data: 0x00100000
(II) NOUVEAU(0): 0xCCAB: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCCAC: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCCAC: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x001002C0
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCCAC: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000F62
(II) NOUVEAU(0): 0xCCD7: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCCD7: Cond: 0x07, Reg: 0x00100200, Mask: 0x00000004, Cmpval: 0x00000004
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xCCD7: Checking if 0x00000000 equals 0x00000004
(II) NOUVEAU(0): 0xCCD7: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCCD7: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCCD9: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCCE2: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCCEB: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCCF4: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCCFD: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCCFD: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xCCFE: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCCFE: Macro: 0x02, MacroTableIndex: 0x02, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D8, Data: 0x00000001
(II) NOUVEAU(0): 0xCD00: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCD00: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xCD02: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCD02: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xCD04: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCD04: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xCD06: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xCD06: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xCD08: [ (0x32) - INIT_IO_RESTRICT_PROG ]
(II) NOUVEAU(0): 0xCD08: Port: 0x03D4, Index: 0x88, Mask: 0x07, Shift: 0x00, Count: 0x08, Reg: 0x001002C0
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xCD08: Writing config 00
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 0xCD33: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCD33: Cond: 0x07, Reg: 0x00100200, Mask: 0x00000004, Cmpval: 0x00000004
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xCD33: Checking if 0x00000000 equals 0x00000004
(II) NOUVEAU(0): 0xCD33: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCD33: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCD35: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCD3E: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCD3E: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xCD3F: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCD3F: Reg: 0x00100440, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x00100440, Data: 0x0030030B
(II) NOUVEAU(0): 0xCD66: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCD66: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCD66: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xCD66: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCD66: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCD68: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 0xCD8F: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCD8F: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xCD90: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCD90: Reg: 0x001002C4, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001002C4, Data: 0x00100380
(II) NOUVEAU(0): 0xCDB7: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCDB8: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCDB8: Cond: 0x07, Reg: 0x00100200, Mask: 0x00000004, Cmpval: 0x00000004
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xCDB8: Checking if 0x00000000 equals 0x00000004
(II) NOUVEAU(0): 0xCDB8: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCDB8: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCDBA: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCDC3: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCDC3: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xCDC4: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCDC4: Cond: 0x08, Reg: 0x00101000, Mask: 0x00000020, Cmpval: 0x00000020
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCDC4: Checking if 0x00000000 equals 0x00000020
(II) NOUVEAU(0): 0xCDC4: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCDC4: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCDC6: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 0xCDED: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xCDED: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xCDEE: [ (0x8F) - INIT_RAM_RESTRICT_ZM_REG_GROUP ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): 0xCDEE: Reg: 0x001002C4, RegIncrement: 0x04, Count: 0x01, StrapRamCfg: 0x03, Index: 0x03
(II) NOUVEAU(0): 	Write: Reg: 0x001002C4, Data: 0x00100000
(II) NOUVEAU(0): 0xCE15: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCE16: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xCE16: Cond: 0x07, Reg: 0x00100200, Mask: 0x00000004, Cmpval: 0x00000004
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xCE16: Checking if 0x00000000 equals 0x00000004
(II) NOUVEAU(0): 0xCE16: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xCE16: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xCE18: [ (0x90) - INIT_COPY_ZM_REG ]
(II) NOUVEAU(0): 0xCE21: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xCE21: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xCE22: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xCE22: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xCE25: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xCE2E: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xCE2E: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xCE31: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xD26C: Parsing init table 2
(II) NOUVEAU(0): 0xD26C: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xD26C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD26C: Reg: 0x001008C0, Mask: 0xFF00FFFF, Data: 0x00300000
(II) NOUVEAU(0): 	Read:  Reg: 0x001008C0, Data: 0x8B303A98
(II) NOUVEAU(0): 	Write: Reg: 0x001008C0, Data: 0x8B303A98
(II) NOUVEAU(0): 0xD279: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000108C, Data: 0x000000D1
(II) NOUVEAU(0): 0xD282: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xF0, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD285: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xD285: Index1: 0xA0, Index2: 0xA1, BaseAddr: 0x08, Count: 0x02
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x08
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA1, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x09
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA1, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD28C: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xD28C: Index1: 0xA0, Index2: 0xA1, BaseAddr: 0x18, Count: 0x02
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x18
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA1, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x19
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA1, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xA0, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD293: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xD293: Index: 0x88, Mask: 0xBF, Data: 0x40
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x88, Head: 0x00, Data: 0x40
(II) NOUVEAU(0): 0xD297: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xD297: Index: 0x8A, Mask: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x8A, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x8A, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD29B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000E200, Data: 0x0003103C
(II) NOUVEAU(0): 0xD2A4: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x30, Head: 0x00, Data: 0x10
(II) NOUVEAU(0): 0xD2A7: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x31, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD2AA: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0xAA, Head: 0x00, Data: 0x00
(II) NOUVEAU(0): 0xD2AD: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xD35E: Parsing init table 3
(II) NOUVEAU(0): 0xD35E: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xD35E: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xD35E: EXECUTING SUB-ROUTINE AT 0x1A2A
(II) NOUVEAU(0): 0x1A2A: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xD35E: END OF SUB-ROUTINE AT 0x1A2A
(II) NOUVEAU(0): 0xD361: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xD361: Cond: 0x0A, Reg: 0x00001540, Mask: 0x00FF0000, Cmpval: 0x00030000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001540, Data: 0xF3030001
(II) NOUVEAU(0): 0xD361: Checking if 0x00030000 equals 0x00030000
(II) NOUVEAU(0): 0xD361: CONDITION FULFILLED - CONTINUING TO EXECUTE
(II) NOUVEAU(0): 0xD363: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xD363: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xD364: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD371: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD37E: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xD37E: ---- EXECUTING FOLLOWING COMMANDS ----
(II) NOUVEAU(0): 0xD37F: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0xD37F: Sleeping for 0x03E8 microseconds
(II) NOUVEAU(0): 0xD382: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xD382: EXECUTING SUB-SCRIPT 10
(II) NOUVEAU(0): 0x540E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x540E: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 0x541B: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x541B: Reg: 0x001002C0, Mask: 0xFFFFFFFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000F62
(II) NOUVEAU(0): 0x5428: [ (0x74) - INIT_TIME ]
(II) NOUVEAU(0): 0x5428: Sleeping for 0x0028 microseconds
(II) NOUVEAU(0): 0x542B: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0x542B: Reg: 0x001002C0, Mask: 0xFFFFFEFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 	Write: Reg: 0x001002C0, Data: 0x00000E62
(II) NOUVEAU(0): 0x5438: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xD382: END OF SUB-SCRIPT 10
(II) NOUVEAU(0): 0xD384: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD384: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xD386: [ (0x33) - INIT_REPEAT ]
(II) NOUVEAU(0): 0xD386: REPEATING FOLLOWING SEGMENT 10 TIMES
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD388: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD388: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38A: [ (0x36) - INIT_END_REPEAT ]
(II) NOUVEAU(0): 0xD38B: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD38B: Macro: 0x00, MacroTableIndex: 0x00, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D4, Data: 0x00000001
(II) NOUVEAU(0): 0xD38D: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD38D: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD38F: [ (0x6F) - INIT_MACRO ]
(II) NOUVEAU(0): 0xD38F: Macro: 0x01, MacroTableIndex: 0x01, Count: 0x01
(II) NOUVEAU(0): 	Write: Reg: 0x001002D0, Data: 0x00000001
(II) NOUVEAU(0): 0xD391: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000001
(II) NOUVEAU(0): 0xD39A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100678, Data: 0x58805880
(II) NOUVEAU(0): 0xD3A3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100B08, Data: 0x000003FF
(II) NOUVEAU(0): 0xD3AC: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD3AC: Reg: 0x00100600, Mask: 0xFFFFFFFF, Data: 0x00004000
(II) NOUVEAU(0): 	Read:  Reg: 0x00100600, Data: 0x9703C610
(II) NOUVEAU(0): 	Write: Reg: 0x00100600, Data: 0x9703C610
(II) NOUVEAU(0): 0xD3B9: [ (0x63) - INIT_COMPUTE_MEM ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xD3BA: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00612000, Data: 0x00000210
(II) NOUVEAU(0): 0xD3C3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00614000, Data: 0x00633A10
(II) NOUVEAU(0): 0xD3CC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00614100, Data: 0x10000611
(II) NOUVEAU(0): 0xD3D5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00614900, Data: 0x10000611
(II) NOUVEAU(0): 0xD3DE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A008, Data: 0x03A502D1
(II) NOUVEAU(0): 0xD3E7: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD3E7: Reg: 0x0061A2C8, Mask: 0xBFFFFFFF, Data: 0x40000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A2C8, Data: 0x412A020D
(II) NOUVEAU(0): 	Write: Reg: 0x0061A2C8, Data: 0x412A020D
(II) NOUVEAU(0): 0xD3F4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A170, Data: 0x12854B58
(II) NOUVEAU(0): 0xD3FD: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A178, Data: 0x0E08C290
(II) NOUVEAU(0): 0xD406: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A1B0, Data: 0x12854B58
(II) NOUVEAU(0): 0xD40F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A1B8, Data: 0x0E08C290
(II) NOUVEAU(0): 0xD418: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A1F0, Data: 0x0FB3EF20
(II) NOUVEAU(0): 0xD421: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A1F8, Data: 0x8BC89280
(II) NOUVEAU(0): 0xD42A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A230, Data: 0x12854B58
(II) NOUVEAU(0): 0xD433: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A238, Data: 0x0E08C290
(II) NOUVEAU(0): 0xD43C: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A270, Data: 0x12854B58
(II) NOUVEAU(0): 0xD445: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A278, Data: 0x8E08C290
(II) NOUVEAU(0): 0xD44E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A2B0, Data: 0x0FB3EF20
(II) NOUVEAU(0): 0xD457: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A2B8, Data: 0x8BC89280
(II) NOUVEAU(0): 0xD460: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061A338, Data: 0x000BD234
(II) NOUVEAU(0): 0xD469: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD469: Reg: 0x0061A148, Mask: 0xFF00FFFF, Data: 0x00150000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A148, Data: 0x4015020D
(II) NOUVEAU(0): 	Write: Reg: 0x0061A148, Data: 0x4015020D
(II) NOUVEAU(0): 0xD476: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD476: Reg: 0x0061A188, Mask: 0xFF00FFFF, Data: 0x00150000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A188, Data: 0x4015020D
(II) NOUVEAU(0): 	Write: Reg: 0x0061A188, Data: 0x4015020D
(II) NOUVEAU(0): 0xD483: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD483: Reg: 0x0061A1C8, Mask: 0xFF00FFFF, Data: 0x00170000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A1C8, Data: 0x0C170271
(II) NOUVEAU(0): 	Write: Reg: 0x0061A1C8, Data: 0x0C170271
(II) NOUVEAU(0): 0xD490: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD490: Reg: 0x0061A208, Mask: 0xFF00FFFF, Data: 0x00150000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A208, Data: 0x4415020D
(II) NOUVEAU(0): 	Write: Reg: 0x0061A208, Data: 0x4415020D
(II) NOUVEAU(0): 0xD49D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD49D: Reg: 0x0061A288, Mask: 0xFF00FFFF, Data: 0x00170000
(II) NOUVEAU(0): 	Read:  Reg: 0x0061A288, Data: 0x0C170271
(II) NOUVEAU(0): 	Write: Reg: 0x0061A288, Data: 0x0C170271
(II) NOUVEAU(0): 0xD4AA: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD4AA: Reg: 0x006165A4, Mask: 0xFFFFFF80, Data: 0x00000038
(II) NOUVEAU(0): 	Read:  Reg: 0x006165A4, Data: 0x00020038
(II) NOUVEAU(0): 	Write: Reg: 0x006165A4, Data: 0x00020038
(II) NOUVEAU(0): 0xD4B7: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD4B7: Reg: 0x00616DA4, Mask: 0xFFFFFF80, Data: 0x00000038
(II) NOUVEAU(0): 	Read:  Reg: 0x00616DA4, Data: 0x00020038
(II) NOUVEAU(0): 	Write: Reg: 0x00616DA4, Data: 0x00020038
(II) NOUVEAU(0): 0xD4C4: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD4C4: Reg: 0x0061F018, Mask: 0xFFFFFFF3, Data: 0x0000000C
(II) NOUVEAU(0): 	Read:  Reg: 0x0061F018, Data: 0x0000030E
(II) NOUVEAU(0): 	Write: Reg: 0x0061F018, Data: 0x0000030E
(II) NOUVEAU(0): 0xD4D1: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD4D1: Reg: 0x00100600, Mask: 0xFFFF7FFF, Data: 0x00008000
(II) NOUVEAU(0): 	Read:  Reg: 0x00100600, Data: 0x9703C610
(II) NOUVEAU(0): 	Write: Reg: 0x00100600, Data: 0x9703C610
(II) NOUVEAU(0): 0xD4DE: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD4DE: Reg: 0x00003310, Mask: 0xFFFFF8FF, Data: 0x00000300
(II) NOUVEAU(0): 	Read:  Reg: 0x00003310, Data: 0x00000300
(II) NOUVEAU(0): 	Write: Reg: 0x00003310, Data: 0x00000300
(II) NOUVEAU(0): 0xD4EB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00617338, Data: 0x80000000
(II) NOUVEAU(0): 0xD4F4: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061C080, Data: 0x00000000
(II) NOUVEAU(0): 0xD4FD: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0061C084, Data: 0x00000000
(II) NOUVEAU(0): 0xD506: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x85, Head: 0x00, Data: 0xFF
(II) NOUVEAU(0): 0xD509: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD509: Reg: 0x00100200, Mask: 0xFFFFF7FF, Data: 0x00000800
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x01000800
(II) NOUVEAU(0): 0xD516: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD516: Reg: 0x006105D4, Mask: 0xFFFFFFE0, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x006105D4, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x006105D4, Data: 0x00000000
(II) NOUVEAU(0): 0xD523: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD523: Reg: 0x006105D8, Mask: 0xFFFFFFE0, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x006105D8, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x006105D8, Data: 0x00000000
(II) NOUVEAU(0): 0xD530: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD530: Reg: 0x006105DC, Mask: 0xF8000000, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x006105DC, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x006105DC, Data: 0x00000000
(II) NOUVEAU(0): 0xD53D: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD53D: Reg: 0x0008814C, Mask: 0xFFFFFFFF, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0008814C, Data: 0x0300001B
(II) NOUVEAU(0): 	Write: Reg: 0x0008814C, Data: 0x0300001B
(II) NOUVEAU(0): 0xD54A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD54A: Reg: 0x00088150, Mask: 0xFFFFFEFF, Data: 0x00000100
(II) NOUVEAU(0): 	Read:  Reg: 0x00088150, Data: 0x6000FF10
(II) NOUVEAU(0): 	Write: Reg: 0x00088150, Data: 0x6000FF10
(II) NOUVEAU(0): 0xD557: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xD558: Parsing init table 4
(II) NOUVEAU(0): 0xD558: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xD558: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x8F44948C
(II) NOUVEAU(0): Found LVDS manufacturer table revision 4.0
(EE) NOUVEAU(0): LVDS table revision not currently supported
(EE) NOUVEAU(0): Pointers to flat panel table invalid
(II) NOUVEAU(0): Found TMDS table revision 2.0
(WW) NOUVEAU(0): TMDS table script pointers not stubbed
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 4.0 found
(II) NOUVEAU(0): DCB header length 27, with 10 possible entries
Raw DCB entry 0: 01000323 00000034
(EE) NOUVEAU(0): Unknown LVDS configuration bits, please report
(II) NOUVEAU(0): NV50DispPreInit is called.
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(EE) NOUVEAU(0): 1364: No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found

--=-UCDYnQSUgqUbpZIQzoMV
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-UCDYnQSUgqUbpZIQzoMV--

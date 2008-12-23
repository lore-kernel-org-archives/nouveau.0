From: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Subject: PB 12" G4: Pointer to flat panel table invalid
Date: Tue, 23 Dec 2008 11:35:52 -0500
Message-ID: <jwvhc4u26xm.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
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

I just installed Debian on my PowerBook G4 12", but my X server
refuses the start.  I've appended my Xorg.log and xorg.conf.

This is with a Debian testing system with the following relevant packages:

   # dpkg -l '*nouveau' 'drm*' 'xserver-xorg'
   Desired=Unknown/Install/Remove/Purge/Hold
   | Status=Not/Inst/Cfg-files/Unpacked/Failed-cfg/Half-inst/trig-aWait/Trig-pend
   |/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
   ||/ Name                          Version                                Description
   +++-===============================================================================================================================
   un  drm-modules                   <none>                                 (no description available)
   ii  drm-modules-2.6.26-1-powerpc  2.4.1+git+20081116+930c0e7-1+2.6.26-12 DRM rendering modules for Linux (kernel 2.6.26-1-powerpc).
   ii  drm-modules-source            2.4.1+git+20081116+930c0e7-1           Source for the DRM kernel rendering modules
   ii  xserver-xorg                  1:7.3+18                               the X.Org X server
   ii  xserver-xorg-video-nouveau    1:0.0.10~git+20081028+cea05e1-1        X.Org X server -- Nouveau display driver (experimental)

Reading this list it appears that the `nouveau' driver should work on my
machine (tho I'm not quite sure yet whether I'll be able to use the
composite-video output to my TV set).  So I guess I'm doing something
stupid, but I can't seem to figure out what.  I tried with a without the
UseFBDev option, but it makes no difference.  Any idea what I might
be missing?


	Stefan


# cat /etc/X11/xorg.conf

Section "InputDevice"
        Identifier      "Generic Keyboard"
        Driver          "kbd"
        Option          "XkbRules"      "xorg"
        Option          "XkbModel"      "pc104"
        Option          "XkbLayout"     "us"
EndSection

Section "InputDevice"
        Identifier      "Configured Mouse"
        Driver          "mouse"
EndSection

Section "Device"
        Identifier      "Configured Video Device"
        BusID           "PCI:0:16:0"
        Driver          "nouveau"
        Option          "UseFBDev"              "true"
EndSection

Section "Monitor"
        Identifier      "Configured Monitor"
EndSection

Section "Screen"
        Identifier      "Default Screen"
        Monitor         "Configured Monitor"
EndSection

# cat /var/log/Xorg.0.log

X.Org X Server 1.4.2
Release Date: 11 June 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux Debian (xorg-server 2:1.4.2-9)
Current Operating System: Linux empanada 2.6.26-1-powerpc #1 Mon Dec 15 13:20:34
 CET 2008 ppc
Build Date: 15 November 2008  06:57:24PM
 
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Tue Dec 23 11:24:04 2008
(==) Using config file: "/etc/X11/xorg.conf"
(==) No Layout section.  Using the first Screen section.
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Configured Monitor"
(==) No device specified for screen "Default Screen".
        Using the first device section listed.
(**) |   |-->Device "Configured Video Device"
(==) |-->Input Device "Configured Mouse"
(==) |-->Input Device "Generic Keyboard"
(==) The core pointer device wasn't specified explicitly in the layout.
        Using the first mouse device.
(==) The core keyboard device wasn't specified explicitly in the layout.
        Using the first keyboard device.
(==) Automatically adding devices
(==) Automatically enabling devices
(==) No FontPath specified.  Using compiled-in default.
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
        Entry deleted from font path.
(WW) The directory "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType" does not e
xist.
        Entry deleted from font path.
(==) FontPath set to:
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi
(==) RgbPath set to "/etc/X11/rgb"
(==) ModulePath set to "/usr/lib/xorg/modules"
(II) No APM support in BIOS or kernel
(II) Loader magic: 0x101e3494
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
        compiled for 1.4.2, module version = 1.0.0
        ABI class: X.Org Video Driver, version 2.0
(++) using VT number 7

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:0b:0: chip 106b,0034 card 0000,0000 rev 00 class 06,00,00 hdr 00
(II) PCI: 00:10:0: chip 10de,0329 card 10de,0010 rev a1 class 03,00,00 hdr 00
(II) PCI: 10:0b:0: chip 106b,0035 card 0000,0000 rev 00 class 06,00,00 hdr 00
(II) PCI: 10:12:0: chip 14e4,4320 card 106b,004e rev 03 class 02,80,00 hdr 00
(II) PCI: 10:17:0: chip 106b,003e card 0000,0000 rev 00 class ff,00,00 hdr 00
(II) PCI: 10:18:0: chip 106b,003f card 0000,0000 rev 00 class 0c,03,10 hdr 00
(II) PCI: 10:19:0: chip 106b,003f card 0000,0000 rev 00 class 0c,03,10 hdr 00
(II) PCI: 10:1a:0: chip 106b,003f card 0000,0000 rev 00 class 0c,03,10 hdr 00
(II) PCI: 10:1b:0: chip 1033,0035 card 1033,0035 rev 43 class 0c,03,10 hdr 80
(II) PCI: 10:1b:1: chip 1033,0035 card 1033,0035 rev 43 class 0c,03,10 hdr 00
(II) PCI: 10:1b:2: chip 1033,00e0 card 1033,00e0 rev 04 class 0c,03,20 hdr 00
(II) PCI: 20:0b:0: chip 106b,0036 card 0000,0000 rev 00 class 06,00,00 hdr 00
(II) PCI: 20:0d:0: chip 106b,003b card 0000,0000 rev 00 class ff,00,00 hdr 00
(II) PCI: 20:0e:0: chip 106b,0031 card 106b,5811 rev 81 class 0c,00,10 hdr 00
(II) PCI: 20:0f:0: chip 106b,0032 card 0000,0000 rev 80 class 02,00,00 hdr 00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:11:0), (0,0,32), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
        [0] -1  0       0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 16: bridge is at (16:11:0), (16,16,32), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 16 I/O range:
        [0] -1  0       0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 16 non-prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 16 prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Host-to-PCI bridge:
(II) Bus 32: bridge is at (32:11:0), (32,32,32), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 32 I/O range:
        [0] -1  0       0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 32 non-prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 32 prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(--) PCI:*(0:16:0) nVidia Corporation NV34M [GeForce FX Go5200] rev 161, Mem @ 0
x91000000/24, 0xa0000000/27, BIOS @ 0x90000000/17
(II) Addressable bus resource ranges are
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
        [1] -1  0       0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) OS-reported resource ranges:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [5] -1  0       0x00000000 - 0x000000ff (0x100) IX[B]
(II) Active PCI resource ranges:
        [0] -1  0       0xf5200000 - 0xf53fffff (0x200000) MX[B]E
        [1] -1  0       0xf5000000 - 0xf5ffffff (0x1000000) MX[B]E
        [2] -1  0       0xf5004000 - 0xf5007fff (0x4000) MX[B]E
        [3] -1  0       0x80080000 - 0x800fffff (0x80000) MX[B]E
        [4] -1  0       0x80081000 - 0x80081fff (0x1000) MX[B]E
        [5] -1  0       0x80082000 - 0x80083fff (0x2000) MX[B]E
        [6] -1  0       0x80083000 - 0x80083fff (0x1000) MX[B]E
        [7] -1  0       0x80000000 - 0xffffffff (0x80000000) MX[B]E
        [8] -1  0       0x80084000 - 0x80087fff (0x4000) MX[B]E
        [9] -1  0       0x90000000 - 0x9001ffff (0x20000) MX[B](B)
        [10] -1 0       0xa0000000 - 0xa7ffffff (0x8000000) MX[B](B)
        [11] -1 0       0x91000000 - 0x91ffffff (0x1000000) MX[B](B)
(II) PCI Memory resource overlap reduced 0xf5000000 from 0xf5ffffff to 0xf5003ff
f
(II) PCI Memory resource overlap reduced 0x80080000 from 0x800fffff to 0x80080ff
f
(II) PCI Memory resource overlap reduced 0x80082000 from 0x80083fff to 0x80082ff
f
(II) PCI Memory resource overlap reduced 0x80000000 from 0xffffffff to 0x8007fff
f
(II) Active PCI resource ranges after removing overlaps:
        [0] -1  0       0xf5200000 - 0xf53fffff (0x200000) MX[B]E
        [1] -1  0       0xf5000000 - 0xf5003fff (0x4000) MX[B]E
        [2] -1  0       0xf5004000 - 0xf5007fff (0x4000) MX[B]E
        [3] -1  0       0x80080000 - 0x80080fff (0x1000) MX[B]E
        [4] -1  0       0x80081000 - 0x80081fff (0x1000) MX[B]E
        [5] -1  0       0x80082000 - 0x80082fff (0x1000) MX[B]E
        [6] -1  0       0x80083000 - 0x80083fff (0x1000) MX[B]E
        [7] -1  0       0x80000000 - 0x8007ffff (0x80000) MX[B]E
        [8] -1  0       0x80084000 - 0x80087fff (0x4000) MX[B]E
        [9] -1  0       0x90000000 - 0x9001ffff (0x20000) MX[B](B)
        [10] -1 0       0xa0000000 - 0xa7ffffff (0x8000000) MX[B](B)
        [11] -1 0       0x91000000 - 0x91ffffff (0x1000000) MX[B](B)
(II) OS-reported resource ranges after removing overlaps with PCI:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [5] -1  0       0x00000000 - 0x000000ff (0x100) IX[B]
(II) All system resource ranges:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xf5200000 - 0xf53fffff (0x200000) MX[B]E
        [5] -1  0       0xf5000000 - 0xf5003fff (0x4000) MX[B]E
        [6] -1  0       0xf5004000 - 0xf5007fff (0x4000) MX[B]E
        [7] -1  0       0x80080000 - 0x80080fff (0x1000) MX[B]E
        [8] -1  0       0x80081000 - 0x80081fff (0x1000) MX[B]E
        [9] -1  0       0x80082000 - 0x80082fff (0x1000) MX[B]E
        [10] -1 0       0x80083000 - 0x80083fff (0x1000) MX[B]E
        [11] -1 0       0x80000000 - 0x8007ffff (0x80000) MX[B]E
        [12] -1 0       0x80084000 - 0x80087fff (0x4000) MX[B]E
        [13] -1 0       0x90000000 - 0x9001ffff (0x20000) MX[B](B)
        [14] -1 0       0xa0000000 - 0xa7ffffff (0x8000000) MX[B](B)
        [15] -1 0       0x91000000 - 0x91ffffff (0x1000000) MX[B](B)
        [16] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [17] -1 0       0x00000000 - 0x000000ff (0x100) IX[B]
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.0.0
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
        compiled for 1.4.2, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.0.0
        ABI class: X.Org Server Extension, version 0.3
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules//fonts/libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
        compiled for 1.4.2, module version = 2.1.0
        Module class: X.Org Font Renderer
        ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.13.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.0.0
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 2.0
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
        compiled for 1.4.0.90, module version = 1.3.0
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
        compiled for 1.4.0.90, module version = 1.3.1
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 2.0
(II) NOUVEAU driver Date:   Sun Oct 26 03:51:36 2008 +0000
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
(II) Primary Device is: PCI 00:10:0
(--) Chipset NVIDIA NV34 found
(II) resource ranges after xf86ClaimFixedResources() call:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xf5200000 - 0xf53fffff (0x200000) MX[B]E
        [5] -1  0       0xf5000000 - 0xf5003fff (0x4000) MX[B]E
        [6] -1  0       0xf5004000 - 0xf5007fff (0x4000) MX[B]E
        [7] -1  0       0x80080000 - 0x80080fff (0x1000) MX[B]E
        [8] -1  0       0x80081000 - 0x80081fff (0x1000) MX[B]E
        [9] -1  0       0x80082000 - 0x80082fff (0x1000) MX[B]E
        [10] -1 0       0x80083000 - 0x80083fff (0x1000) MX[B]E
        [11] -1 0       0x80000000 - 0x8007ffff (0x80000) MX[B]E
        [12] -1 0       0x80084000 - 0x80087fff (0x4000) MX[B]E
        [13] -1 0       0x90000000 - 0x9001ffff (0x20000) MX[B](B)
        [14] -1 0       0xa0000000 - 0xa7ffffff (0x8000000) MX[B](B)
        [15] -1 0       0x91000000 - 0x91ffffff (0x1000000) MX[B](B)
        [16] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [17] -1 0       0x00000000 - 0x000000ff (0x100) IX[B]
(II) resource ranges after probing:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xf5200000 - 0xf53fffff (0x200000) MX[B]E
        [5] -1  0       0xf5000000 - 0xf5003fff (0x4000) MX[B]E
        [6] -1  0       0xf5004000 - 0xf5007fff (0x4000) MX[B]E
        [7] -1  0       0x80080000 - 0x80080fff (0x1000) MX[B]E
        [8] -1  0       0x80081000 - 0x80081fff (0x1000) MX[B]E
        [9] -1  0       0x80082000 - 0x80082fff (0x1000) MX[B]E
        [10] -1 0       0x80083000 - 0x80083fff (0x1000) MX[B]E
        [11] -1 0       0x80000000 - 0x8007ffff (0x80000) MX[B]E
        [12] -1 0       0x80084000 - 0x80087fff (0x4000) MX[B]E
        [13] -1 0       0x90000000 - 0x9001ffff (0x20000) MX[B](B)
        [14] -1 0       0xa0000000 - 0xa7ffffff (0x8000000) MX[B](B)
        [15] -1 0       0x91000000 - 0x91ffffff (0x1000000) MX[B](B)
        [16] 0  0       0x000a0000 - 0x000affff (0x10000) MS[B]
        [17] 0  0       0x000b0000 - 0x000b7fff (0x8000) MS[B]
        [18] 0  0       0x000b8000 - 0x000bffff (0x8000) MS[B]
        [19] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [20] -1 0       0x00000000 - 0x000000ff (0x100) IX[B]
        [21] 0  0       0xf00003b0 - 0xf00003bb (0xc) IS[B]
        [22] 0  0       0xf00003c0 - 0xf00003df (0x20) IS[B]
(II) Setting vga for screen 0.
(--) NOUVEAU(0): Chipset: "NVIDIA NV34"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.0.0
        ABI class: X.Org Video Driver, version 2.0
(II) NOUVEAU(0): Creating default Display subsection in Screen section
        "Default Screen" for depth/fbbpp 24/32
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 0.1.0
        ABI class: X.Org Video Driver, version 2.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xA0000000
(--) NOUVEAU(0): MMIO registers at 0x91000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 6, (OK)
drmOpenByBusid: Searching for BusID pci:0000:00:10.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 6, (OK)
drmOpenByBusid: drmOpenMinor returns 6
drmOpenByBusid: drmGetBusid reports pci:0000:00:10.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module version
 0.0.11
(II) NOUVEAU(0): Initial CRTC_OWNER is 3
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(!!) NOUVEAU(0): ... BIOS checksum invalid
(II) NOUVEAU(0): Using BIOS image from PRAMIN
(II) NOUVEAU(0): Loading NV17 power sequencing microcode
(II) NOUVEAU(0): BMP BIOS found
(II) NOUVEAU(0): BMP version 5.38
(II) NOUVEAU(0): Bios version 04.34.20.18
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0x02FA
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0x0547
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0x068D
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0x082D
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0x084A
(--) NOUVEAU(0): Parsing VBIOS init table 5 at offset 0x0874
(--) NOUVEAU(0): Parsing VBIOS init table 6 at offset 0x09C9
(EE) NOUVEAU(0): Pointer to flat panel table invalid
(II) Loading sub module "i2c"
(II) LoadModule: "i2c"(II) Module "i2c" already built-in
(II) Loading sub module "ddc"
(II) LoadModule: "ddc"(II) Module "ddc" already built-in
(EE) NOUVEAU(0): 1373: No valid modes.
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found

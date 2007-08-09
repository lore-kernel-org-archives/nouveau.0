From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11919] New: XServer fails to open DRM
Date: Thu,  9 Aug 2007 12:48:00 -0700 (PDT)
Message-ID: <bug-11919-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11919

           Summary: XServer fails to open DRM
           Product: xorg
           Version: 7.2
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: drcosquared-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


DRM fails to load with the nouveau driver.
Here is the XORG log:


X Window System Version 1.3.0
Release Date: 19 April 2007
X Protocol Version 11, Revision 0, Release 1.3
Build Operating System: Linux Debian
Current Operating System: Linux debian 2.6.22-1-486 #1 Sun Jul 29 13:59:48 UTC
2007 i586
Build Date: 14 July 2007
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Thu Aug  9 15:11:45 2007
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Generic Monitor"
(**) |   |-->Device "Generic Video Card"
(**) |-->Input Device "Generic Keyboard"
(**) |-->Input Device "Configured Mouse"
(WW) The directory "/usr/X11R6/lib/X11/fonts/misc" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/cyrillic" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/100dpi/" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/75dpi/" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/Type1" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/100dpi" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/X11R6/lib/X11/fonts/75dpi" does not exist.
        Entry deleted from font path.
(WW) The directory "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType" does not
exist.
        Entry deleted from font path.
(WW) Including the default font path
/usr/share/fonts/X11/misc,/usr/share/fonts/X11/cyrillic,/usr/share/fonts/X11/100dpi/:unscaled,/usr/share/fonts/X11/75dpi/:unscaled,/usr/share/fonts/X11/Type1,/usr/share/fonts/X11/100dpi,/usr/share/fonts/X11/75dpi,/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType.
(**) FontPath set to:
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/cyrillic,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        /var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType
(==) RgbPath set to "/etc/X11/rgb"
(==) ModulePath set to "/usr/lib/xorg/modules"
(**) Extension "Composite" is enabled
(WW) Open ACPI failed (/var/run/acpid.socket) (No such file or directory)
(II) No APM support in BIOS or kernel
(II) Loader magic: 0x81e50c0
(II) Module ABI versions:
        X.Org ANSI C Emulation: 0.3
        X.Org Video Driver: 1.2
        X.Org XInput driver : 0.7
        X.Org Server Extension : 0.3
        X.Org Font Renderer : 0.5
(II) Loader running on linux
(II) LoadModule: "pcidata"
(II) Loading /usr/lib/xorg/modules//libpcidata.so
(II) Module pcidata: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
        ABI class: X.Org Video Driver, version 1.2
(--) using VT number 2

(II) PCI: PCI scan (all values are in hex)
(II) PCI: 00:00:0: chip 1106,1595 card 0000,0000 rev 03 class 06,00,00 hdr 00
(II) PCI: 00:02:0: chip 10de,002d card 0000,0000 rev 15 class 03,00,00 hdr 00
(II) PCI: 00:03:0: chip 4005,4000 card 4005,4000 rev 00 class 04,01,00 hdr 00
(II) PCI: 00:04:0: chip 100b,0020 card 1385,f311 rev 00 class 02,00,00 hdr 00
(II) PCI: 00:07:0: chip 1106,0586 card 0000,0000 rev 31 class 06,01,00 hdr 80
(II) PCI: 00:07:1: chip 1106,0571 card 0000,0000 rev 06 class 01,01,8a hdr 00
(II) PCI: 00:07:2: chip 1106,3038 card 0925,1234 rev 02 class 0c,03,00 hdr 00
(II) PCI: 00:07:3: chip 1106,3040 card 0000,0000 rev 00 class 00,00,00 hdr 00
(II) PCI: 00:0f:0: chip 5333,8901 card 0000,0000 rev 04 class 03,00,00 hdr 00
(II) PCI: End of PCI scan
(II) Host-to-PCI bridge:
(II) Bus 0: bridge is at (0:0:0), (0,0,0), BCTRL: 0x0008 (VGA_EN is set)
(II) Bus 0 I/O range:
        [0] -1  0       0x00000000 - 0x0000ffff (0x10000) IX[B]
(II) Bus 0 non-prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) Bus 0 prefetchable memory range:
        [0] -1  0       0x00000000 - 0xffffffff (0x0) MX[B]
(II) PCI-to-ISA bridge:
(II) Bus -1: bridge is at (0:7:0), (0,-1,-1), BCTRL: 0x0008 (VGA_EN is set)
(--) PCI:*(0:2:0) nVidia Corporation NV5M64 [RIVA TNT2 Model 64/Model 64 Pro]
rev 21, Mem @ 0x44000000/24, 0x46000000/25
(--) PCI: (0:15:0) S3 Inc. 86c775/86c785 [Trio 64V2/DX or /GX] rev 4, Mem @
0x10000000/26
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
        [0] -1  0       0x40000000 - 0x40000fff (0x1000) MX[B]
        [1] -1  0       0x46000000 - 0x47ffffff (0x2000000) MX[B](B)
        [2] -1  0       0x44000000 - 0x44ffffff (0x1000000) MX[B](B)
        [3] -1  0       0x000018a0 - 0x000018bf (0x20) IX[B]
        [4] -1  0       0x00001880 - 0x0000188f (0x10) IX[B]
        [5] -1  0       0x00001000 - 0x000010ff (0x100) IX[B]
        [6] -1  0       0x00001800 - 0x0000187f (0x80) IX[B]
        [7] -1  0       0x00001400 - 0x000014ff (0x100) IX[B]
(II) Inactive PCI resource ranges:
        [0] -1  0       0x10000000 - 0x13ffffff (0x4000000) MX[B](B)
(II) Active PCI resource ranges after removing overlaps:
        [0] -1  0       0x40000000 - 0x40000fff (0x1000) MX[B]
        [1] -1  0       0x46000000 - 0x47ffffff (0x2000000) MX[B](B)
        [2] -1  0       0x44000000 - 0x44ffffff (0x1000000) MX[B](B)
        [3] -1  0       0x000018a0 - 0x000018bf (0x20) IX[B]
        [4] -1  0       0x00001880 - 0x0000188f (0x10) IX[B]
        [5] -1  0       0x00001000 - 0x000010ff (0x100) IX[B]
        [6] -1  0       0x00001800 - 0x0000187f (0x80) IX[B]
        [7] -1  0       0x00001400 - 0x000014ff (0x100) IX[B]
(II) Inactive PCI resource ranges after removing overlaps:
        [0] -1  0       0x10000000 - 0x13ffffff (0x4000000) MX[B](B)
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
        [4] -1  0       0x40000000 - 0x40000fff (0x1000) MX[B]
        [5] -1  0       0x46000000 - 0x47ffffff (0x2000000) MX[B](B)
        [6] -1  0       0x44000000 - 0x44ffffff (0x1000000) MX[B](B)
        [7] -1  0       0x10000000 - 0x13ffffff (0x4000000) MX[B](B)
        [8] -1  0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [9] -1  0       0x00000000 - 0x000000ff (0x100) IX[B]
        [10] -1 0       0x000018a0 - 0x000018bf (0x20) IX[B]
        [11] -1 0       0x00001880 - 0x0000188f (0x10) IX[B]
        [12] -1 0       0x00001000 - 0x000010ff (0x100) IX[B]
        [13] -1 0       0x00001800 - 0x0000187f (0x80) IX[B]
        [14] -1 0       0x00001400 - 0x000014ff (0x100) IX[B]
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension XFree86-DRI
(II) LoadModule: "ddc"(II) Module already built-in
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
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
(II) LoadModule: "freetype"
(II) Loading /usr/lib/xorg/modules//fonts/libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
        compiled for 1.3.0, module version = 2.1.0
        Module class: X.Org Font Renderer
        ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
        ABI class: X.Org Server Extension, version 0.3
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
        ABI class: X.Org Video Driver, version 1.2
(II) LoadModule: "vbe"
(II) Loading /usr/lib/xorg/modules//libvbe.so
(II) Module vbe: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.1.0
        ABI class: X.Org Video Driver, version 1.2
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.13.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 0.3
(II) Loading extension RECORD
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 1.2
(II) LoadModule: "kbd"
(II) Loading /usr/lib/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.2.1
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 0.7
(II) LoadModule: "mouse"
(II) Loading /usr/lib/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 1.2.1
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 0.7
(II) NOUVEAU driver Date:   Thu Aug 9 01:46:46 2007 +1000
(II) NOUVEAU driver for NVIDIA chipset families :
        RIVA 128    (NV03)
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
(II) Primary Device is: PCI 00:02:0
(--) Assigning device section with no busID to primary device
(--) Chipset RIVA TNT2 Model 64 found
(II) resource ranges after xf86ClaimFixedResources() call:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0x40000000 - 0x40000fff (0x1000) MX[B]
        [5] -1  0       0x46000000 - 0x47ffffff (0x2000000) MX[B](B)
        [6] -1  0       0x44000000 - 0x44ffffff (0x1000000) MX[B](B)
        [7] -1  0       0x10000000 - 0x13ffffff (0x4000000) MX[B](B)
        [8] -1  0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [9] -1  0       0x00000000 - 0x000000ff (0x100) IX[B]
        [10] -1 0       0x000018a0 - 0x000018bf (0x20) IX[B]
        [11] -1 0       0x00001880 - 0x0000188f (0x10) IX[B]
        [12] -1 0       0x00001000 - 0x000010ff (0x100) IX[B]
        [13] -1 0       0x00001800 - 0x0000187f (0x80) IX[B]
        [14] -1 0       0x00001400 - 0x000014ff (0x100) IX[B]
(II) resource ranges after probing:
        [0] -1  0       0x00100000 - 0x3fffffff (0x3ff00000) MX[B]E(B)
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0x40000000 - 0x40000fff (0x1000) MX[B]
        [5] -1  0       0x46000000 - 0x47ffffff (0x2000000) MX[B](B)
        [6] -1  0       0x44000000 - 0x44ffffff (0x1000000) MX[B](B)
        [7] -1  0       0x10000000 - 0x13ffffff (0x4000000) MX[B](B)
        [8] 0   0       0x000a0000 - 0x000affff (0x10000) MS[B]
        [9] 0   0       0x000b0000 - 0x000b7fff (0x8000) MS[B]
        [10] 0  0       0x000b8000 - 0x000bffff (0x8000) MS[B]
        [11] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [12] -1 0       0x00000000 - 0x000000ff (0x100) IX[B]
        [13] -1 0       0x000018a0 - 0x000018bf (0x20) IX[B]
        [14] -1 0       0x00001880 - 0x0000188f (0x10) IX[B]
        [15] -1 0       0x00001000 - 0x000010ff (0x100) IX[B]
        [16] -1 0       0x00001800 - 0x0000187f (0x80) IX[B]
        [17] -1 0       0x00001400 - 0x000014ff (0x100) IX[B]
        [18] 0  0       0x000003b0 - 0x000003bb (0xc) IS[B]
        [19] 0  0       0x000003c0 - 0x000003df (0x20) IS[B]
(II) Setting vga for screen 0.
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Reloading /usr/lib/xorg/modules//libint10.so
(II) NOUVEAU(0): Initializing int10
(WW) System lacks support for changing MTRRs
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "RIVA TNT2 Model 64"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
        compiled for 1.3.0, module version = 0.1.0
        ABI class: X.Org Video Driver, version 1.2
(==) NOUVEAU(0): Using HW cursor
(==) NOUVEAU(0): Using EXA acceleration method
(--) NOUVEAU(0): Linear framebuffer at 0x46000000
(--) NOUVEAU(0): MMIO registers at 0x44000000
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
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

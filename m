From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20915] New: Refresh rate out of range,
	server backtrace
Date: Fri, 27 Mar 2009 16:27:23 -0700 (PDT)
Message-ID: <bug-20915-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20915

           Summary: Refresh rate out of range, server backtrace
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: orange.abc99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24327)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24327)
bios

I'm using a 9600GSO/386Mb card with a CRT Horizon Monitor connected using a
dvi2vga connector and with the following modeline:
ModeLine     "1280x960@75" 129.9 1280 1368 1504 1728 960 961 964 1002 -hsync
+vsync

This works in nv, nvidia and vesa drivers. In nouveau I get an Out of Range
Popup, a plain black screen or a backtrace:

Caught signal 8.  Server aborting
(EE) NOUVEAU(0): PLL limits table revision 0x30 not currently supported

For certain fixed vertical and horizontal ranges I get either an out-of-range
message or the black screen but only on first run after a previosly successful
nv, nvidia or vesa run. If I try to run nouveau twice in a row then I get the
backtrace.

I've attached the Xorg log and the card bios (extracted using the dd method).

X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-128.1.1.el5 x86_64 
Current Operating System: Linux localhost.localdomain
2.6.27.12-170.2.5.fc10.x86_64 #1 SMP Wed Jan 21 01:33:24 EST 2009 x86_64
Build Date: 10 March 2009  07:20:43PM
Build ID: xorg-x11-server 1.5.3-15.fc10 
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sat Mar 28 00:53:26 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "single head configuration"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Device0"
(**) |-->Input Device "Keyboard0"
(**) |-->Input Device "Mouse0"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
(==) ModulePath set to "/usr/lib64/xorg/modules"
(WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will be
disabled.
(WW) Disabling Keyboard0
(WW) Disabling Mouse0
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x7aec00
(II) Module ABI versions:
        X.Org ANSI C Emulation: 0.4
        X.Org Video Driver: 4.1
        X.Org XInput driver : 2.1
        X.Org Server Extension : 1.1
        X.Org Font Renderer : 0.6
(II) Loader running on linux
(--) using VT number 8

(--) PCI: (0@0:1:3) nVidia Corporation MCP78S [GeForce 8200] Co-Processor rev
162, Mem @ 0xf9f80000/524288
(--) PCI:*(0@2:0:0) nVidia Corporation GeForce 9600 GSO rev 162, Mem @
0xfc000000/16777216, 0xd0000000/268435456, 0xfa000000/33554432, I/O @
0x0000dc00/128, BIOS @ 0x????????/131072
(II) System resource ranges:
        [0] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [5] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [6] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [7] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [8] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [9] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [10] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [11] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [12] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [13] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [14] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [15] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [16] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [17] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [18] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [19] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [20] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [21] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [24] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [25] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [26] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [27] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [28] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [29] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
(II) "extmod" will be loaded. This was enabled by default and also specified in
the config file.
(II) "dbe" will be loaded. This was enabled by default and also specified in
the config file.
(II) "glx" will be loaded. This was enabled by default and also specified in
the config file.
(II) "freetype" will be loaded. This was enabled by default and also specified
in the config file.
(II) "dri" will be loaded by default.
(II) LoadModule: "dbe"

(II) Loading /usr/lib64/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 1.1
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "extmod"

(II) Loading /usr/lib64/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 1.1
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
(II) LoadModule: "type1"

(WW) Warning, couldn't open module type1
(II) UnloadModule: "type1"
(EE) Failed to load module "type1" (module does not exist, 0)
(II) LoadModule: "freetype"

(II) Loading /usr/lib64/xorg/modules/fonts//libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
        compiled for 1.5.3, module version = 2.1.0
        Module class: X.Org Font Renderer
        ABI class: X.Org Font Renderer, version 0.6
(II) Loading font FreeType
(II) LoadModule: "glx"

(II) Loading /usr/lib64/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Server Extension, version 1.1
(==) AIGLX enabled
(==) Exporting typical set of GLX visuals
(II) Loading extension GLX
(II) LoadModule: "dri"

(II) Loading /usr/lib64/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Server Extension, version 1.1
(II) Loading extension XFree86-DRI
(II) LoadModule: "nouveau"

(II) Loading /usr/lib64/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) NOUVEAU driver Date:   Fri Mar 27 15:37:17 2009 +1000
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
(II) Primary Device is: PCI 02@00:00:0
(II) resource ranges after probing:
        [0] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [5] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [6] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [7] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [8] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [9] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [10] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [11] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [12] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [13] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [14] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [15] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [16] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [17] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [18] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [19] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [20] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [21] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [24] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [25] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [26] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [27] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [28] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [29] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
(--) NOUVEAU(0): Chipset: "NVIDIA NV92"
(II) Loading sub module "int10"
(II) LoadModule: "int10"

(II) Loading /usr/lib64/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Video Driver, version 4.1
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: Searching for BusID pci:0000:02:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: drmOpenMinor returns 13
drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] nouveau interface version: 0.0.12
(--) NOUVEAU(0): [drm] kernel modesetting not available
(--) NOUVEAU(0): VESA-HACK: Console VGA mode is 0x3
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"

(II) Loading /usr/lib64/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 0.1.0
        ABI class: X.Org Video Driver, version 4.1
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD0000000
(--) NOUVEAU(0): MMIO registers at 0xFC000000
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 62.92.43.00
(WW) NOUVEAU(0): TMDS table revision 2.0 not currently supported
(II) NOUVEAU(0): Found Display Configuration Block version 4.0
(!!) NOUVEAU(0): Raw DCB entry 0: 02000300 00000028
(!!) NOUVEAU(0): Raw DCB entry 1: 01000302 00020030
(!!) NOUVEAU(0): Raw DCB entry 2: 04011310 00000028
(!!) NOUVEAU(0): Raw DCB entry 3: 02011312 00020030
(!!) NOUVEAU(0): Raw DCB entry 4: 010223f1 00c0c080
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xC33E
(EE) NOUVEAU(0): ========== unknown reg 0x0002100C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021054 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021010 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021058 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021014 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002105C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021018 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002101C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021064 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021020 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021068 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021024 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002106C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021028 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021070 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002102C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021074 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021030 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021078 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021034 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002107C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021038 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021080 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002103C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021084 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021040 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021088 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021044 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002108C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021048 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021090 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002104C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021094 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021050 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021098 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002100C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002104C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021050 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021054 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021010 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021050 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021058 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021024 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002104C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021050 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002106C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021414 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x000204CC ==========
(EE) NOUVEAU(0): 0xD66D: Init table command not found: 0x87
(EE) NOUVEAU(0): 0xD690: Init table command not found: 0x87
(EE) NOUVEAU(0): 0xD64A: Init table command not found: 0x87
(EE) NOUVEAU(0): 0xD6B3: Init table command not found: 0x87
(II) NOUVEAU(0): I2C bus "DCB-I2C-2" initialized.
(II) NOUVEAU(0): I2C device "DCB-I2C-2:init script device" registered at
address 0x5C.
(II) NOUVEAU(0): I2C device "DCB-I2C-2:init script device" removed.
(EE) NOUVEAU(0): ========== unknown reg 0x0008900C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0008900C ==========
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0xC86F
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0xD608
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0xD706
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0xD954
(EE) NOUVEAU(0): ========== unknown reg 0x00020000 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020004 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020074 ==========
(II) NOUVEAU(0): NV50DispPreInit is called.
(--) NOUVEAU(0): DCB entry 0: type: 0, i2c_index: 0, heads: 3, bus: 0, or: 2
(II) NOUVEAU(0): I2C bus "DVI-0" initialized.
(II) NOUVEAU(0): DAC-1 attached with index 0 to DVI-0
(--) NOUVEAU(0): DCB entry 1: type: 2, i2c_index: 0, heads: 3, bus: 0, or: 1
(II) NOUVEAU(0): SOR-0 attached with index 1 to DVI-0
(--) NOUVEAU(0): DCB entry 2: type: 0, i2c_index: 1, heads: 3, bus: 1, or: 4
(II) NOUVEAU(0): I2C bus "DVI-1" initialized.
(II) NOUVEAU(0): DAC-2 attached with index 0 to DVI-1
(--) NOUVEAU(0): DCB entry 3: type: 2, i2c_index: 1, heads: 3, bus: 1, or: 2
(II) NOUVEAU(0): SOR-1 attached with index 1 to DVI-1
(--) NOUVEAU(0): DCB entry 4: type: 1, i2c_index: 15, heads: 3, bus: 2, or: 1
(II) NOUVEAU(0): I2C bus "TV-2" initialized.
(II) NOUVEAU(0): Output DVI-0 using monitor section Monitor0
(II) NOUVEAU(0): Output DVI-1 has no monitor section
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-0:E-EDID segment register" registered at
address 0x60.
(II) NOUVEAU(0): I2C device "DVI-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Detected a Analog output on DVI-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID for output DVI-0
(II) NOUVEAU(0): Manufacturer: KTC  Model: 1700  Serial#: 0
(II) NOUVEAU(0): Year: 2007  Week: 49
(II) NOUVEAU(0): EDID Version: 1.0
(II) NOUVEAU(0): Analog Display Input,  Input Voltage Level: 0.700/0.300 V
(II) NOUVEAU(0): Sync:  Separate
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 32  vert.: 24
(II) NOUVEAU(0): Gamma: 2.53
(II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off; RGB/Color Display
(II) NOUVEAU(0): redX: 0.625 redY: 0.340   greenX: 0.310 greenY: 0.529
(II) NOUVEAU(0): blueX: 0.150 blueY: 0.063   whiteX: 0.281 whiteY: 0.311
(II) NOUVEAU(0): Supported VESA Video Modes:
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@72Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@72Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@70Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported Future Video Modes:
(II) NOUVEAU(0): #0: hsize: 640  vsize 480  refresh: 85  vid: 22833
(II) NOUVEAU(0): #1: hsize: 800  vsize 600  refresh: 85  vid: 22853
(II) NOUVEAU(0): #2: hsize: 1024  vsize 768  refresh: 85  vid: 22881
(II) NOUVEAU(0): #3: hsize: 640  vsize 480  refresh: 100  vid: 26673
(II) NOUVEAU(0): #4: hsize: 800  vsize 600  refresh: 100  vid: 26693
(II) NOUVEAU(0): #5: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
(II) NOUVEAU(0): #6: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0):        00ffffffffffff002e83001700000000
(II) NOUVEAU(0):        3111010008201899e80692a0574f8726
(II) NOUVEAU(0):        10484f2dce0031594559615931684568
(II) NOUVEAU(0):        8180a9400101000000fc004b2d373030
(II) NOUVEAU(0):        0a20202020202020000000fe004b2054
(II) NOUVEAU(0):        20430a20202020202020000000fe004d
(II) NOUVEAU(0):        6f6e69746f720a2020202020000000fe
(II) NOUVEAU(0):        004d61646520496e204368696e61001b
(II) NOUVEAU(0): EDID vendor "KTC", prod id 5888
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x843 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1355 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1613 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1613 mode
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   36.00  640 696 752 832  480 481 484
509 -hsync -vsync (43.3 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (75.0 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "KTC", prod id 5888
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x843 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1355 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1613 mode
(II) NOUVEAU(0): DDCModeFromDetailedTiming: Ignoring tiny 0x1613 mode
(II) NOUVEAU(0): DVI-0: no preferred mode found, using 800x600
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): Not using default mode "320x175" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "320x200" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "360x200" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "320x240" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "320x240" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "320x240" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "320x240" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "400x300" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "400x300" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "400x300" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "512x384" (mode clock too low)
(II) NOUVEAU(0): Not using default mode "1856x1392" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "928x696" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1920x1440" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "960x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1920x1440" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "960x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "2048x1536" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "2048x1536" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Printing probed modes for output DVI-0
(II) NOUVEAU(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536
1537 1540 1589 -hsync +vsync (95.3 kHz)
(II) NOUVEAU(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440
1441 1444 1500 -hsync +vsync (90.0 kHz)
(II) NOUVEAU(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392
1393 1396 1439 -hsync +vsync (86.4 kHz)
(II) NOUVEAU(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344
1345 1348 1417 -hsync +vsync (106.3 kHz)
(II) NOUVEAU(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344
1345 1348 1394 -hsync +vsync (83.7 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x85.0  229.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (106.2 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (87.5 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (81.2 kHz)
(II) NOUVEAU(0): Modeline "1600x1200@60"x60.0  162.00  1600 1664 1856 2160 
1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (75.0 kHz)
(II) NOUVEAU(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050
1052 1064 1090 +hsync +vsync (81.5 kHz)
(II) NOUVEAU(0): Modeline "1400x1050@60"x60.0  122.60  1400 1488 1640 1880 
1050 1051 1054 1087 -hsync +vsync (65.2 kHz)
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050
1052 1064 1082 +hsync +vsync (64.9 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1280x960"x85.0  148.50  1280 1344 1504 1728  960 961
964 1011 +hsync +vsync (85.9 kHz)
(II) NOUVEAU(0): Modeline "1280x960@75"x75.0  129.90  1280 1368 1504 1728  960
961 964 1002 -hsync +vsync (75.2 kHz)
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1280x960@60"x60.0  102.10  1280 1360 1496 1712  960
961 964 994 -hsync +vsync (59.6 kHz)
(II) NOUVEAU(0): Modeline "1152x864@75"x75.0  108.00  1152 1216 1344 1600  864
865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1152x768@54"x54.8   65.00  1152 1178 1314 1472  768
771 777 806 +hsync +vsync (44.2 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768
770 794 doublescan -hsync +vsync (95.3 kHz)
(II) NOUVEAU(0): Modeline "1024x768@85"x85.0   94.50  1024 1072 1168 1376  768
769 772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768@75"x75.1   78.80  1024 1040 1136 1312  768
769 772 800 +hsync +vsync (60.1 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768@70"x70.1   75.00  1024 1048 1184 1328  768
771 777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768@60"x60.0   65.00  1024 1048 1184 1344  768
771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "1024x768@43"x87.0   44.90  1024 1032 1208 1264  768
768 776 817 interlace +hsync +vsync (35.5 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x87.0   44.90  1024 1032 1208 1264  768 768
776 817 interlace +hsync +vsync (35.5 kHz)
(II) NOUVEAU(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720
722 750 doublescan -hsync +vsync (90.0 kHz)
(II) NOUVEAU(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696
698 719 doublescan -hsync +vsync (86.4 kHz)
(II) NOUVEAU(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672
674 708 doublescan -hsync +vsync (106.3 kHz)
(II) NOUVEAU(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672
674 697 doublescan -hsync +vsync (83.7 kHz)
(II) NOUVEAU(0): Modeline "832x624@75"x74.6   57.30  832 864 928 1152  624 625
628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x85.0  114.75  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (106.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (93.8 kHz)
(II) NOUVEAU(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (87.5 kHz)
(II) NOUVEAU(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (81.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (75.0 kHz)
(II) NOUVEAU(0): Modeline "800x600@85"x85.1   56.30  800 832 896 1048  600 601
604 631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.30  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "800x600@72"x72.2   50.00  800 856 976 1040  600 637
643 666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): Modeline "800x600@75"x75.0   49.50  800 816 896 1056  600 601
604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600@60"x60.3   40.00  800 840 968 1056  600 601
605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "800x600@56"x56.2   36.00  800 824 896 1024  600 601
603 625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz)
(II) NOUVEAU(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532
545 doublescan +hsync +vsync (81.5 kHz)
(II) NOUVEAU(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532
541 doublescan +hsync +vsync (64.9 kHz)
(II) NOUVEAU(0): Modeline "640x512"x85.0   78.75  640 672 752 864  512 512 514
536 doublescan +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514
533 doublescan +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514
533 doublescan +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x85.1   74.25  640 672 752 864  480 480 482
505 doublescan +hsync +vsync (85.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482
500 doublescan +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "640x480@85"x85.0   36.00  640 696 752 832  480 481
484 509 -hsync -vsync (43.3 kHz)
(II) NOUVEAU(0): Modeline "640x480"x85.0   36.00  640 696 752 832  480 481 484
509 -hsync -vsync (43.3 kHz)
(II) NOUVEAU(0): Modeline "640x480@72"x72.8   31.50  640 664 704 832  480 489
491 520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480@75"x75.0   31.50  640 656 720 840  480 481
484 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480@60"x60.0   25.20  640 656 752 800  480 490
492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x85.0   35.50  720 756 828 936  400 401 404
446 -hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x400"x85.1   31.50  640 672 736 832  400 401 404
445 -hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434
450 doublescan +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "640x350"x85.1   31.50  640 672 736 832  350 382 385
445 +hsync -vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "512x384"x85.0   47.25  512 536 584 688  384 384 386
404 doublescan +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386
400 doublescan +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388
403 doublescan -hsync -vsync (56.5 kHz)
(II) NOUVEAU(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388
403 doublescan -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314
333 doublescan -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "400x300"x85.3   28.15  400 416 448 524  300 300 302
315 doublescan +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321
333 doublescan +hsync +vsync (48.1 kHz)
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-1:E-EDID segment register" registered at
address 0x60.
(II) NOUVEAU(0): I2C device "DVI-1:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Using bios provided load value of 295
(--) NOUVEAU(0): No Load present on DAC-2
(II) NOUVEAU(0): EDID for output DVI-1
(II) NOUVEAU(0): Output DVI-0 connected
(II) NOUVEAU(0): Output DVI-1 disconnected
(II) NOUVEAU(0): Using fuzzy aspect match for initial modes
(II) NOUVEAU(0): Output DVI-0 using initial mode 2048x1536
(--) NOUVEAU(0): VideoRAM: 262144 kBytes
(==) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(--) NOUVEAU(0): Virtual size is 2048x2048 (pitch 2048)
(**) NOUVEAU(0):  Default mode "2048x1536": 266.9 MHz (scaled from 0.0 MHz),
95.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536
1537 1540 1589 -hsync +vsync (95.3 kHz)
(**) NOUVEAU(0):  Default mode "1920x1440": 234.0 MHz (scaled from 0.0 MHz),
90.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440
1441 1444 1500 -hsync +vsync (90.0 kHz)
(**) NOUVEAU(0):  Default mode "1856x1392": 218.3 MHz (scaled from 0.0 MHz),
86.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392
1393 1396 1439 -hsync +vsync (86.4 kHz)
(**) NOUVEAU(0):  Default mode "1792x1344": 261.0 MHz (scaled from 0.0 MHz),
106.3 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344
1345 1348 1417 -hsync +vsync (106.3 kHz)
(**) NOUVEAU(0):  Default mode "1792x1344": 204.8 MHz (scaled from 0.0 MHz),
83.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344
1345 1348 1394 -hsync +vsync (83.7 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 229.5 MHz (scaled from 0.0 MHz),
106.2 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x85.0  229.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (106.2 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 202.5 MHz (scaled from 0.0 MHz),
93.8 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 189.0 MHz (scaled from 0.0 MHz),
87.5 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (87.5 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 175.5 MHz (scaled from 0.0 MHz),
81.2 kHz, 65.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (81.2 kHz)
(**) NOUVEAU(0):  Mode "1600x1200@60": 162.0 MHz (scaled from 0.0 MHz), 75.0
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200@60"x60.0  162.00  1600 1664 1856 2160 
1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz),
75.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 155.8 MHz (scaled from 0.0 MHz),
81.5 kHz, 74.8 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050
1052 1064 1090 +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0):  Mode "1400x1050@60": 122.6 MHz (scaled from 0.0 MHz), 65.2
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050@60"x60.0  122.60  1400 1488 1640 1880 
1050 1051 1054 1087 -hsync +vsync (65.2 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 122.0 MHz (scaled from 0.0 MHz),
64.9 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050
1052 1064 1082 +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 157.5 MHz (scaled from 0.0 MHz),
91.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz),
80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz),
64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 148.5 MHz (scaled from 0.0 MHz),
85.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x85.0  148.50  1280 1344 1504 1728  960 961
964 1011 +hsync +vsync (85.9 kHz)
(**) NOUVEAU(0):  Mode "1280x960@75": 129.9 MHz (scaled from 0.0 MHz), 75.2
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x960@75"x75.0  129.90  1280 1368 1504 1728  960
961 964 1002 -hsync +vsync (75.2 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 108.0 MHz (scaled from 0.0 MHz),
60.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Mode "1280x960@60": 102.1 MHz (scaled from 0.0 MHz), 59.6
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960@60"x60.0  102.10  1280 1360 1496 1712  960
961 964 994 -hsync +vsync (59.6 kHz)
(**) NOUVEAU(0):  Mode "1152x864@75": 108.0 MHz (scaled from 0.0 MHz), 67.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864@75"x75.0  108.00  1152 1216 1344 1600  864
865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 108.0 MHz (scaled from 0.0 MHz),
67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Mode "1152x768@54": 65.0 MHz (scaled from 0.0 MHz), 44.2 kHz,
54.8 Hz
(II) NOUVEAU(0): Modeline "1152x768@54"x54.8   65.00  1152 1178 1314 1472  768
771 777 806 +hsync +vsync (44.2 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 133.5 MHz (scaled from 0.0 MHz),
95.3 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768
770 794 doublescan -hsync +vsync (95.3 kHz)
(**) NOUVEAU(0):  Mode "1024x768@85": 94.5 MHz (scaled from 0.0 MHz), 68.7 kHz,
85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768@85"x85.0   94.50  1024 1072 1168 1376  768
769 772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 94.5 MHz (scaled from 0.0 MHz), 68.7
kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Mode "1024x768@75": 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz,
75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768@75"x75.1   78.80  1024 1040 1136 1312  768
769 772 800 +hsync +vsync (60.1 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.0
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Mode "1024x768@70": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz,
70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768@70"x70.1   75.00  1024 1048 1184 1328  768
771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Mode "1024x768@60": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz,
60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768@60"x60.0   65.00  1024 1048 1184 1344  768
771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Mode "1024x768@43": 44.9 MHz (scaled from 0.0 MHz), 35.5 kHz,
87.0 Hz (I)
(II) NOUVEAU(0): Modeline "1024x768@43"x87.0   44.90  1024 1032 1208 1264  768
768 776 817 interlace +hsync +vsync (35.5 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 44.9 MHz (scaled from 0.0 MHz), 35.5
kHz, 87.0 Hz (I)
(II) NOUVEAU(0): Modeline "1024x768"x87.0   44.90  1024 1032 1208 1264  768 768
776 817 interlace +hsync +vsync (35.5 kHz)
(**) NOUVEAU(0):  Default mode "960x720": 117.0 MHz (scaled from 0.0 MHz), 90.0
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720
722 750 doublescan -hsync +vsync (90.0 kHz)
(**) NOUVEAU(0):  Default mode "928x696": 109.2 MHz (scaled from 0.0 MHz), 86.4
kHz, 60.1 Hz (D)
(II) NOUVEAU(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696
698 719 doublescan -hsync +vsync (86.4 kHz)
(**) NOUVEAU(0):  Default mode "896x672": 130.5 MHz (scaled from 0.0 MHz),
106.3 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672
674 708 doublescan -hsync +vsync (106.3 kHz)
(**) NOUVEAU(0):  Default mode "896x672": 102.4 MHz (scaled from 0.0 MHz), 83.7
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672
674 697 doublescan -hsync +vsync (83.7 kHz)
(**) NOUVEAU(0):  Mode "832x624@75": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz,
74.6 Hz
(II) NOUVEAU(0): Modeline "832x624@75"x74.6   57.30  832 864 928 1152  624 625
628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7
kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 114.8 MHz (scaled from 0.0 MHz),
106.2 kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x85.0  114.75  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (106.2 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 101.2 MHz (scaled from 0.0 MHz), 93.8
kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 94.5 MHz (scaled from 0.0 MHz), 87.5
kHz, 70.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (87.5 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 87.8 MHz (scaled from 0.0 MHz), 81.2
kHz, 65.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (81.2 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 81.0 MHz (scaled from 0.0 MHz), 75.0
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602
625 doublescan +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Mode "800x600@85": 56.3 MHz (scaled from 0.0 MHz), 53.7 kHz,
85.1 Hz
(II) NOUVEAU(0): Modeline "800x600@85"x85.1   56.30  800 832 896 1048  600 601
604 631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 56.3 MHz (scaled from 0.0 MHz), 53.7
kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.30  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 56.2 MHz (scaled from 0.0 MHz), 53.7
kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Mode "800x600@72": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz,
72.2 Hz
(II) NOUVEAU(0): Modeline "800x600@72"x72.2   50.00  800 856 976 1040  600 637
643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1
kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Mode "800x600@75": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz,
75.0 Hz
(II) NOUVEAU(0): Modeline "800x600@75"x75.0   49.50  800 816 896 1056  600 601
604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Mode "800x600@60": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz,
60.3 Hz
(II) NOUVEAU(0): Modeline "800x600@60"x60.3   40.00  800 840 968 1056  600 601
605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9
kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Mode "800x600@56": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz,
56.2 Hz
(II) NOUVEAU(0): Modeline "800x600@56"x56.2   36.00  800 824 896 1024  600 601
603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2
kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 77.9 MHz (scaled from 0.0 MHz), 81.5
kHz, 74.8 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532
545 doublescan +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 61.0 MHz (scaled from 0.0 MHz), 64.9
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532
541 doublescan +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 78.8 MHz (scaled from 0.0 MHz), 91.1
kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x85.0   78.75  640 672 752 864  512 512 514
536 doublescan +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 67.5 MHz (scaled from 0.0 MHz), 80.0
kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514
533 doublescan +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 54.0 MHz (scaled from 0.0 MHz), 64.0
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514
533 doublescan +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 74.2 MHz (scaled from 0.0 MHz), 85.9
kHz, 85.1 Hz (D)
(II) NOUVEAU(0): Modeline "640x480"x85.1   74.25  640 672 752 864  480 480 482
505 doublescan +hsync +vsync (85.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 54.0 MHz (scaled from 0.0 MHz), 60.0
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482
500 doublescan +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Mode "640x480@85": 36.0 MHz (scaled from 0.0 MHz), 43.3 kHz,
85.0 Hz
(II) NOUVEAU(0): Modeline "640x480@85"x85.0   36.00  640 696 752 832  480 481
484 509 -hsync -vsync (43.3 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 36.0 MHz (scaled from 0.0 MHz), 43.3
kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x85.0   36.00  640 696 752 832  480 481 484
509 -hsync -vsync (43.3 kHz)
(**) NOUVEAU(0):  Mode "640x480@72": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz,
72.8 Hz
(II) NOUVEAU(0): Modeline "640x480@72"x72.8   31.50  640 664 704 832  480 489
491 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Mode "640x480@75": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz,
75.0 Hz
(II) NOUVEAU(0): Modeline "640x480@75"x75.0   31.50  640 656 720 840  480 481
484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Mode "640x480@60": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz,
60.0 Hz
(II) NOUVEAU(0): Modeline "640x480@60"x60.0   25.20  640 656 752 800  480 490
492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5
kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Default mode "720x400": 35.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "720x400"x85.0   35.50  720 756 828 936  400 401 404
446 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x400": 31.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x400"x85.1   31.50  640 672 736 832  400 401 404
445 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 54.0 MHz (scaled from 0.0 MHz), 67.5
kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434
450 doublescan +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "640x350": 31.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x350"x85.1   31.50  640 672 736 832  350 382 385
445 +hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 47.2 MHz (scaled from 0.0 MHz), 68.7
kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x85.0   47.25  512 536 584 688  384 384 386
404 doublescan +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 39.4 MHz (scaled from 0.0 MHz), 60.0
kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386
400 doublescan +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 37.5 MHz (scaled from 0.0 MHz), 56.5
kHz, 70.1 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388
403 doublescan -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 32.5 MHz (scaled from 0.0 MHz), 48.4
kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388
403 doublescan -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Default mode "416x312": 28.6 MHz (scaled from 0.0 MHz), 49.7
kHz, 74.7 Hz (D)
(II) NOUVEAU(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314
333 doublescan -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "400x300": 28.1 MHz (scaled from 0.0 MHz), 53.7
kHz, 85.3 Hz (D)
(II) NOUVEAU(0): Modeline "400x300"x85.3   28.15  400 416 448 524  300 300 302
315 doublescan +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "400x300": 25.0 MHz (scaled from 0.0 MHz), 48.1
kHz, 72.2 Hz (D)
(II) NOUVEAU(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321
333 doublescan +hsync +vsync (48.1 kHz)
(++) NOUVEAU(0): DPI set to (75, 75)
(II) Loading sub module "fb"
(II) LoadModule: "fb"

(II) Loading /usr/lib64/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "exa"
(II) LoadModule: "exa"

(II) Loading /usr/lib64/xorg/modules//libexa.so
(II) Module exa: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 2.4.0
        ABI class: X.Org Video Driver, version 4.1
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"

(II) Loading /usr/lib64/xorg/modules//libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org ANSI C Emulation, version 0.4
(--) Depth 24 pixmap format is 32 bpp
(II) do I need RAC?  No, I don't.
(II) resource ranges after preInit:
        [0] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [5] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [6] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [7] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [8] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [9] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [10] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [11] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [12] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [13] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [14] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [15] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [16] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [17] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [18] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [19] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [20] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [21] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [24] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [25] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [26] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [27] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [28] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [29] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
(II) NOUVEAU(0): Allocated 128MiB VRAM for framebuffer + offscreen pixmaps, at
offset 0x20000000
(II) NOUVEAU(0): AGPGART: 32MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle = 0xd0000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle = 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(II) NOUVEAU(0): Opened GPU channel 2
(II) EXA(0): Offscreen pixmap area of 117440512 bytes
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): [DRI] installation complete
(II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): NV50DispInit is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC0.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(II) NOUVEAU(0): nv50_output_prepare is called.
(II) NOUVEAU(0): nv50_crtc_prepare is called for CRTC0.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): Disconnecting SOR.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): Disconnecting DAC.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): Disconnecting SOR.
(II) NOUVEAU(0): nv50_crtc_mode_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcModeSet is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetDither is called (no update).
(II) NOUVEAU(0): NV50CrtcBlank is called (unblanked) for CRTC0.
(II) NOUVEAU(0): nv50_output_mode_set is called.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 0.
(II) NOUVEAU(0): NV50CrtcSetScale is called with mode 0 for CRTC0.
(II) NOUVEAU(0): nv50_crtc_commit is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcBlank is called (blanked) for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetPixelClock is called for CRTC0.
(EE) NOUVEAU(0): PLL limits table revision 0x30 not currently supported

Backtrace:
0: /usr/bin/X(xorg_backtrace+0x26) [0x4e7c96]
1: /usr/bin/X(xf86SigHandler+0x39) [0x47a6a9]
2: /lib64/libc.so.6 [0x344b032f90]
3: /usr/lib64/xorg/modules/drivers//nouveau_drv.so(nouveau_bios_getmnp+0x481)
[0x3fd4491]
4: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x3ffce29]
5: /usr/lib64/xorg/modules/drivers//nouveau_drv.so(NV50DisplayCommand+0x221)
[0x3ffd111]
6: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x4004a4d]
7: /usr/bin/X(xf86CrtcSetMode+0x3fd) [0x4a24ad]
8: /usr/bin/X(xf86SetDesiredModes+0x1c5) [0x4a2945]
9: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x3fdbc4d]
10: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x3fdc73e]
11: /usr/bin/X(AddScreen+0x1c9) [0x42c3d9]
12: /usr/bin/X(InitOutput+0x241) [0x462dd1]
13: /usr/bin/X(main+0x286) [0x42cb76]
14: /lib64/libc.so.6(__libc_start_main+0xe6) [0x344b01e576]
15: /usr/bin/X [0x42c129]

Fatal server error:
Caught signal 8.  Server aborting

(II) NOUVEAU(0): NVLeaveVT is called.
(II) NOUVEAU(0): NV50DispShutdown is called.
(II) NOUVEAU(0): NV50CrtcBlank is called (blanked) for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetPixelClock is called for CRTC0.
(EE) NOUVEAU(0): PLL limits table revision 0x30 not currently supported
(EE) NOUVEAU(0): Could not find a compatible set of PLL values
(II) NOUVEAU(0): NV50CrtcSetClockMode is called for CRTC0.
(II) NOUVEAU(0): NV50DacSetClockMode is called.
(II) NOUVEAU(0): NV50CrtcBlank is called (blanked) for CRTC1.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

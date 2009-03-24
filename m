From: Brandon Ehle <azverkan-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: nouveau running 2D on a 9800GTX from git master
Date: Tue, 24 Mar 2009 03:12:23 -0700
Message-ID: <3c5a513f0903240312y2b68fa82vdb02cc9e885cc753@mail.gmail.com>
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

Finally got around to testing the git masters of xorg, mesa, drm and
nouveau running together.  The mesa gallium3d driver failed to build
until I manually added dri2 to the GALLIUM_STATE_TRACKERS_DIRS line in
the configs/autoconf file to force libdri2drm.a to build.

I'm not encountering any issues from the testing I've done so far
(except that glxgears just draws black).

On startup I do see some warnings about "unknown reg" in the log below.


This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.6.99.1
Release Date: (unreleased)
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.29 x86_64
Current Operating System: Linux azverkan 2.6.29 #7 SMP PREEMPT Mon Mar
23 17:50:39 PDT 2009 x86_64
Build Date: 24 March 2009  01:38:52AM

	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/opt/bleeding/var/log/Xorg.0.log", Time: Tue Mar 24
02:53:27 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) No Layout section.  Using the first Screen section.
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "Configured Monitor"
(**) |   |-->Device "Configured Video Device"
(==) Not automatically adding devices
(==) Not automatically enabling devices
(WW) The directory "/opt/bleeding/lib/X11/fonts/misc/" does not exist.
	Entry deleted from font path.
(WW) The directory "/opt/bleeding/lib/X11/fonts/TTF/" does not exist.
	Entry deleted from font path.
(WW) The directory "/opt/bleeding/lib/X11/fonts/OTF" does not exist.
	Entry deleted from font path.
(WW) The directory "/opt/bleeding/lib/X11/fonts/Type1/" does not exist.
	Entry deleted from font path.
(WW) The directory "/opt/bleeding/lib/X11/fonts/100dpi/" does not exist.
	Entry deleted from font path.
(WW) The directory "/opt/bleeding/lib/X11/fonts/75dpi/" does not exist.
	Entry deleted from font path.
(==) FontPath set to:
	built-ins
(==) ModulePath set to "/opt/bleeding/lib/xorg/modules"
(==) |-->Input Device "<default pointer>"
(==) |-->Input Device "<default keyboard>"
(==) No Layout section. Using the default mouse configuration.
(==) No Layout section. Using the default keyboard configuration.
(II) Loader magic: 0x7be340
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 5.0
	X.Org XInput driver : 5.0
	X.Org Server Extension : 2.0
(--) using VT number 7

(!!) More than one possible primary device found
(--) PCI: (0@3:0:0) unknown vendor (0x10de) unknown chipset (0x0612)
rev 162, Mem @ 0xdc000000/16777216, 0xb0000000/268435456,
0xda000000/33554432, I/O @ 0x0000dc00/128, BIOS @ 0x????????/131072
(--) PCI: (0@6:0:0) unknown vendor (0x10de) unknown chipset (0x0091)
rev 161, Mem @ 0xdf000000/16777216, 0xc0000000/268435456,
0xde000000/16777216, I/O @ 0x0000ec00/128, BIOS @ 0x????????/131072
(II) Open ACPI successful (/var/run/acpid.socket)
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
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[21] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) "extmod" will be loaded by default.
(II) "dbe" will be loaded by default.
(II) "glx" will be loaded. This was enabled by default and also
specified in the config file.
(II) "dri" will be loaded by default.
(II) "dri2" will be loaded by default.
(II) LoadModule: "glx"
(II) Loading /opt/bleeding/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "extmod"
(II) Loading /opt/bleeding/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /opt/bleeding/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "dri"
(II) Loading /opt/bleeding/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /opt/bleeding/lib/xorg/modules/extensions/libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /opt/bleeding/lib/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 5.0
(II) LoadModule: "mouse"
(II) Loading /opt/bleeding/lib/xorg/modules/input/mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.4.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 5.0
(II) LoadModule: "kbd"
(II) Loading /opt/bleeding/lib/xorg/modules/input/kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.3.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 5.0
(II) NOUVEAU driver Date:   Mon Mar 23 14:43:22 2009 +1000
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
(II) Primary Device is:
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
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[21] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(--) NOUVEAU(0): Chipset: "NVIDIA NV92"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /opt/bleeding/lib/xorg/modules/libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org Video Driver, version 5.0
(II) NOUVEAU(0): Initializing int10
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenByBusid: Searching for BusID pci:0000:03:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenByBusid: drmOpenMinor returns 12
drmOpenByBusid: drmGetBusid reports pci:0000:03:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] nouveau interface version: 0.0.12
(--) NOUVEAU(0): [drm] kernel modesetting not available
(--) NOUVEAU(0): VESA-HACK: Console VGA mode is 0x0
(II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen" for depth/fbbpp 24/32
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /opt/bleeding/lib/xorg/modules/libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 0.1.0
	ABI class: X.Org Video Driver, version 5.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xB0000000
(--) NOUVEAU(0): MMIO registers at 0xDC000000
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 62.92.3b.00
(WW) NOUVEAU(0): TMDS table revision 2.0 not currently supported
(II) NOUVEAU(0): Found Display Configuration Block version 4.0
(!!) NOUVEAU(0): Raw DCB entry 0: 02000300 00000028
(!!) NOUVEAU(0): Raw DCB entry 1: 01000302 00020030
(!!) NOUVEAU(0): Raw DCB entry 2: 04011310 00000028
(!!) NOUVEAU(0): Raw DCB entry 3: 02011312 00020030
(!!) NOUVEAU(0): Raw DCB entry 4: 010223f1 00c0c080
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xC16D
(EE) NOUVEAU(0): ========== unknown reg 0x00021414 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x000204CC ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0008900C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0008900C ==========
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0xC546
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0xD32A
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0xD44C
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0xD67C
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
(II) NOUVEAU(0): Output DVI-0 using monitor section Configured Monitor
(II) NOUVEAU(0): Output DVI-1 has no monitor section
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DVI-0:DDC control interface" registered
at address 0x6E.
(II) NOUVEAU(0): Detected a Digital output on DVI-0
(II) NOUVEAU(0): Found a suitable output, index 1
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): EDID vendor "DEL", prod id 41002
(II) NOUVEAU(0): Using EDID range info for horizontal sync
(II) NOUVEAU(0): Using EDID range info for vertical refresh
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080
 1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600
601 605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480
481 484 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480
490 492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400
412 414 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688
 1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312
768 769 772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344
768 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600
601 604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688
 1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160
 1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600
864 865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
(II) NOUVEAU(0): EDID vendor "DEL", prod id 41002
(II) NOUVEAU(0): DVI-0: preferred mode is 1920x1200
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
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-1:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Using bios provided load value of 295
(--) NOUVEAU(0): No Load present on DAC-2
(II) NOUVEAU(0): Output DVI-0 connected
(II) NOUVEAU(0): Output DVI-1 disconnected
(II) NOUVEAU(0): Using exact sizes for initial modes
(II) NOUVEAU(0): Output DVI-0 using initial mode 1920x1200
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
(--) NOUVEAU(0): VideoRAM: 262144 kBytes
(--) NOUVEAU(0): Virtual size is 1920x1920 (pitch 1920)
(**) NOUVEAU(0):  Driver mode "1920x1200": 154.0 MHz (scaled from 0.0
MHz), 74.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
(**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0
MHz), 75.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0
MHz), 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0
MHz), 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0
MHz), 67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600
 864 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0
MHz), 60.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312
 768 769 772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0
MHz), 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344
 768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
600 601 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
600 601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480
481 484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480
490 492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400
412 414 449 -hsync +vsync (31.5 kHz)
(**) NOUVEAU(0): Display dimensions: (520, 320) mm
(**) NOUVEAU(0): DPI set to (93, 152)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /opt/bleeding/lib/xorg/modules/libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /opt/bleeding/lib/xorg/modules/libexa.so
(II) Module exa: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 2.4.0
	ABI class: X.Org Video Driver, version 5.0
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"
(II) Loading /opt/bleeding/lib/xorg/modules/libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
	compiled for 1.6.99.1, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
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
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[21] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
(II) NOUVEAU(0): Allocated 128MiB VRAM for framebuffer + offscreen
pixmaps, at offset 0x20000000
(II) NOUVEAU(0): AGPGART: 32MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle = 0xb0000000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle = 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(II) NOUVEAU(0): Opened GPU channel 2
(II) EXA(0): Offscreen pixmap area of 119472128 bytes
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
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC0.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(II) NOUVEAU(0): nv50_output_prepare is called.
(II) NOUVEAU(0): nv50_crtc_prepare is called for CRTC0.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): Disconnecting DAC.
(II) NOUVEAU(0): NV50DacModeSet is called.
(II) NOUVEAU(0): Disconnecting DAC.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): Disconnecting SOR.
(II) NOUVEAU(0): nv50_crtc_mode_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcModeSet is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetDither is called (no update).
(II) NOUVEAU(0): NV50CrtcBlank is called (unblanked) for CRTC0.
(II) NOUVEAU(0): nv50_output_mode_set is called.
(II) NOUVEAU(0): NV50SorModeSet is called.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 0.
(II) NOUVEAU(0): NV50CrtcSetScale is called with mode 2 for CRTC0.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC0.
(II) NOUVEAU(0): nv50_crtc_commit is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcBlank is called (blanked) for CRTC1.
(II) NOUVEAU(0): NV50CrtcSetPixelClock is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcSetClockMode is called for CRTC0.
(II) NOUVEAU(0): NV50SorSetClockMode is called.
(II) NOUVEAU(0): nv50_output_commit is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(==) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
(WW) NOUVEAU(0): Option "NoLogo" is not used
(--) RandR disabled
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) AIGLX: Screen 0 is not DRI2 capable
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: Searching for BusID pci:0000:03:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: drmOpenMinor returns 13
drmOpenByBusid: drmGetBusid reports pci:0000:03:00.0
(II) AIGLX: Loaded and initialized /opt/bleeding/lib/dri/nouveau_dri.so
(II) GLX: Initialized DRI GL provider for screen 0
(II) NOUVEAU(0): Setting screen physical size to 508 x 317
(WW) <default pointer>: No Device specified, looking for one...
(II) <default pointer>: Setting Device option to "/dev/input/mice"
(--) <default pointer>: Device: "/dev/input/mice"
(==) <default pointer>: Protocol: "Auto"
(**) Option "CorePointer"
(**) <default pointer>: always reports core events
(==) <default pointer>: Emulate3Buttons, Emulate3Timeout: 50
(**) <default pointer>: ZAxisMapping: buttons 4 and 5
(**) <default pointer>: Buttons: 9
(**) <default pointer>: Sensitivity: 1
(II) XINPUT: Adding extended input device "<default pointer>" (type: MOUSE)
(**) <default pointer>: (accel) keeping acceleration scheme 1
(**) <default pointer>: (accel) acceleration profile 0
(II) <default pointer>: Setting mouse protocol to "ExplorerPS/2"
(II) <default pointer>: ps2EnableDataReporting: succeeded
(**) Option "CoreKeyboard"
(**) <default keyboard>: always reports core events
(**) Option "Protocol" "standard"
(**) <default keyboard>: Protocol: standard
(**) Option "XkbRules" "base"
(**) <default keyboard>: XkbRules: "base"
(**) Option "XkbModel" "pc105"
(**) <default keyboard>: XkbModel: "pc105"
(**) Option "XkbLayout" "us"
(**) <default keyboard>: XkbLayout: "us"
(**) Option "CustomKeycodes" "off"
(**) <default keyboard>: CustomKeycodes disabled
(II) XINPUT: Adding extended input device "<default keyboard>" (type: KEYBOARD)

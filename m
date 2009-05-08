From: Uwe Dippel <udippel-exbFYIMHk3p4US5VSTT5kQ@public.gmane.org>
Subject: nouveau on 8300 - somwhat, but black content
Date: Fri, 08 May 2009 17:01:17 +0800
Message-ID: <4A03F4DD.8040909@uniten.edu.my>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030105050701010204080506"
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
--------------030105050701010204080506
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Finally, I get the proper resolution, but all black content.

Here is my log file. Anything I could do about this?

Uwe

--------------030105050701010204080506
Content-Type: text/x-log;
 name="Nouveau.ud.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Nouveau.ud.log"


X.Org X Server 1.6.0
Release Date: 2009-2-25
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.24-15-server x86_64 Ubuntu
Current Operating System: Linux ubudippel 2.6.28-11-generic #42-Ubuntu SMP Fri Apr 17 01:58:03 UTC 2009 x86_64
Build Date: 09 April 2009  02:11:54AM
xorg-server 2:1.6.0-0ubuntu14 (buildd-P+3peWXKs3TfZ225f7ozCg@public.gmane.org) 
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri May  8 16:31:58 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "Layout0"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Device0"
(**) |-->Input Device "Keyboard0"
(**) |-->Input Device "Mouse0"
(==) Automatically adding devices
(==) Automatically enabling devices
(WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
	Entry deleted from font path.
(==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
(==) ModulePath set to "/usr/lib/xorg/modules"
(WW) AllowEmptyInput is on, devices using drivers 'kbd', 'mouse' or 'vmmouse' will be disabled.
(WW) Disabling Keyboard0
(WW) Disabling Mouse0
(II) Loader magic: 0xb40
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 5.0
	X.Org XInput driver : 4.0
	X.Org Server Extension : 2.0
(II) Loader running on linux
(++) using VT number 7

(--) PCI:*(0@2:0:0) nVidia Corporation GeForce 8300 rev 162, Mem @ 0xfb000000/16777216, 0xd8000000/134217728, 0xe6000000/33554432, I/O @ 0x0000dc00/128, BIOS @ 0x????????/131072
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
(II) "extmod" will be loaded. This was enabled by default and also specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also specified in the config file.
(II) "glx" will be loaded. This was enabled by default and also specified in the config file.
(II) "record" will be loaded by default.
(II) "dri" will be loaded by default.
(II) "dri2" will be loaded by default.
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "type1"
(WW) Warning, couldn't open module type1
(II) UnloadModule: "type1"
(EE) Failed to load module "type1" (module does not exist, 0)
(II) LoadModule: "freetype"
(WW) Warning, couldn't open module freetype
(II) UnloadModule: "freetype"
(EE) Failed to load module "freetype" (module does not exist, 0)
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="NVIDIA Corporation"
	compiled for 4.0.2, module version = 1.0.0
	Module class: X.Org Server Extension
(II) NVIDIA GLX Module  180.44  Tue Mar 24 06:11:47 PST 2009
(II) Loading extension GLX
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions//librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/lib/xorg/modules/extensions//libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 5.0
(II) NOUVEAU driver Date:   Fri Apr 3 12:22:04 2009 +1000
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
(--) NOUVEAU(0): Chipset: "NVIDIA NVAA"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	ABI class: X.Org Video Driver, version 5.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: node name is /dev/dri/card0
drmOpenByBusid: Searching for BusID pci:0000:02:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 10, (OK)
drmOpenByBusid: drmOpenMinor returns 10
drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
(II) [drm] loaded kernel module for "nouveau" driver.
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
(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 0.1.0
	ABI class: X.Org Video Driver, version 5.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD8000000
(--) NOUVEAU(0): MMIO registers at 0xFB000000
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(!!) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 62.77.1e.00
(WW) NOUVEAU(0): TMDS table revision 2.0 not currently supported
(II) NOUVEAU(0): Found Display Configuration Block version 4.0
(!!) NOUVEAU(0): Raw DCB entry 0: 01000300 0000001e
(!!) NOUVEAU(0): Raw DCB entry 1: 01011332 00020010
(!!) NOUVEAU(0): Raw DCB entry 2: 0000000e 00000000
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xC672
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000C054 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x002FF0A8 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x002FF0A8 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614100 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614900 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614100 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614900 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614280 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614280 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614A80 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614A80 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615280 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615280 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614300 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614300 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614B00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614B00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615300 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615300 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614380 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614380 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615380 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615380 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615B80 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00615B80 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614200 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614200 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614A00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614A00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614108 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614108 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614908 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614908 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009220 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009200 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009210 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614004 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00610184 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00610184 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00619F00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021220 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061A068 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061A868 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061B068 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000E81C ==========
(EE) NOUVEAU(0): Could not find a compatible set of PLL values
(EE) NOUVEAU(0): ========== unknown reg 0x0000E18C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000E824 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000E824 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000C054 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000C054 ==========
(--) NOUVEAU(0): Parsing VBIOS init table 1 at offset 0xC956
(--) NOUVEAU(0): Parsing VBIOS init table 2 at offset 0xC958
(EE) NOUVEAU(0): ========== unknown reg 0x0000E200 ==========
(--) NOUVEAU(0): Parsing VBIOS init table 3 at offset 0xCA3D
(EE) NOUVEAU(0): ========== unknown reg 0x00614120 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614120 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614920 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614920 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614100 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614900 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00612000 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614000 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614110 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614114 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614118 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061411C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061A008 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061C080 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061C084 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020010 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002000C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002000C ==========
(--) NOUVEAU(0): Parsing VBIOS init table 4 at offset 0xCB02
(II) NOUVEAU(0): NV50DispPreInit is called.
(--) NOUVEAU(0): DCB entry 0: type: 0, i2c_index: 0, heads: 3, bus: 0, or: 1
(II) NOUVEAU(0): I2C bus "VGA-0" initialized.
(II) NOUVEAU(0): DAC-0 attached with index 0 to VGA-0
(--) NOUVEAU(0): DCB entry 1: type: 2, i2c_index: 3, heads: 3, bus: 1, or: 1
(II) NOUVEAU(0): I2C bus "DVI-1" initialized.
(II) NOUVEAU(0): SOR-0 attached with index 0 to DVI-1
(II) NOUVEAU(0): Output VGA-0 using monitor section Monitor0
(II) NOUVEAU(0): Output DVI-1 has no monitor section
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "VGA-0:E-EDID segment register" registered at address 0x60.
(II) NOUVEAU(0): I2C device "VGA-0:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Using bios provided load value of 384
(--) NOUVEAU(0): Load present on DAC-0
(II) NOUVEAU(0): Detected a Analog output on VGA-0
(II) NOUVEAU(0): Found a suitable output, index 0
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): NV50ConnectorGetDDCModes is called.
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
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_mode_valid is called.
(II) NOUVEAU(0): nv50_output_detect is called.
(II) NOUVEAU(0): NV50ConnectorDDCDetect is called.
(II) NOUVEAU(0): I2C device "DVI-1:E-EDID segment register" registered at address 0x60.
(II) NOUVEAU(0): I2C device "DVI-1:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): Output VGA-0 connected
(II) NOUVEAU(0): Output DVI-1 disconnected
(II) NOUVEAU(0): Using user preference for initial modes
(II) NOUVEAU(0): Output VGA-0 using initial mode 1600x1200
(--) NOUVEAU(0): VideoRAM: 262144 kBytes
(==) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(--) NOUVEAU(0): Virtual size is 2048x2048 (pitch 2048)
(**) NOUVEAU(0):  Default mode "1600x1200": 229.5 MHz (scaled from 0.0 MHz), 106.2 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x85.0  229.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (106.2 kHz)
(**) NOUVEAU(0):  Default mode "2048x1536": 340.5 MHz (scaled from 0.0 MHz), 120.2 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "2048x1536"x75.0  340.48  2048 2216 2440 2832  1536 1537 1540 1603 -hsync +vsync (120.2 kHz)
(**) NOUVEAU(0):  Default mode "2048x1536": 266.9 MHz (scaled from 0.0 MHz), 95.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz)
(**) NOUVEAU(0):  Default mode "1920x1440": 297.0 MHz (scaled from 0.0 MHz), 112.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1920x1440"x75.0  297.00  1920 2064 2288 2640  1440 1441 1444 1500 -hsync +vsync (112.5 kHz)
(**) NOUVEAU(0):  Default mode "1920x1440": 234.0 MHz (scaled from 0.0 MHz), 90.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1920x1440"x60.0  234.00  1920 2048 2256 2600  1440 1441 1444 1500 -hsync +vsync (90.0 kHz)
(**) NOUVEAU(0):  Default mode "1856x1392": 288.0 MHz (scaled from 0.0 MHz), 112.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz)
(**) NOUVEAU(0):  Default mode "1856x1392": 218.3 MHz (scaled from 0.0 MHz), 86.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz)
(**) NOUVEAU(0):  Default mode "1792x1344": 261.0 MHz (scaled from 0.0 MHz), 106.3 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz)
(**) NOUVEAU(0):  Default mode "1792x1344": 204.8 MHz (scaled from 0.0 MHz), 83.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 202.5 MHz (scaled from 0.0 MHz), 93.8 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 189.0 MHz (scaled from 0.0 MHz), 87.5 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 175.5 MHz (scaled from 0.0 MHz), 81.2 kHz, 65.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz)
(**) NOUVEAU(0):  Default mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Default mode "1680x1050": 214.8 MHz (scaled from 0.0 MHz), 93.9 kHz, 84.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x84.9  214.75  1680 1808 1984 2288  1050 1053 1059 1105 -hsync +vsync (93.9 kHz)
(**) NOUVEAU(0):  Default mode "1680x1050": 187.0 MHz (scaled from 0.0 MHz), 82.3 kHz, 74.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x74.9  187.00  1680 1800 1976 2272  1050 1053 1059 1099 -hsync +vsync (82.3 kHz)
(**) NOUVEAU(0):  Default mode "1680x1050": 174.0 MHz (scaled from 0.0 MHz), 76.6 kHz, 69.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x69.9  174.00  1680 1800 1976 2272  1050 1053 1059 1096 -hsync +vsync (76.6 kHz)
(**) NOUVEAU(0):  Default mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0):  Default mode "1600x1024": 103.1 MHz (scaled from 0.0 MHz), 62.0 kHz, 60.2 Hz
(II) NOUVEAU(0): Modeline "1600x1024"x60.2  103.12  1600 1600 1656 1664  1024 1024 1029 1030 +hsync +vsync (62.0 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 179.3 MHz (scaled from 0.0 MHz), 93.8 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x85.0  179.26  1400 1504 1656 1912  1050 1051 1054 1103 -hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 155.8 MHz (scaled from 0.0 MHz), 81.5 kHz, 74.8 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 145.1 MHz (scaled from 0.0 MHz), 76.5 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x70.0  145.06  1400 1496 1648 1896  1050 1051 1054 1093 -hsync +vsync (76.5 kHz)
(**) NOUVEAU(0):  Default mode "1400x1050": 122.0 MHz (scaled from 0.0 MHz), 64.9 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 157.5 MHz (scaled from 0.0 MHz), 91.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  1024 1025 1028 1072 +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Default mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Default mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 148.5 MHz (scaled from 0.0 MHz), 85.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x85.0  148.50  1280 1344 1504 1728  960 961 964 1011 +hsync +vsync (85.9 kHz)
(**) NOUVEAU(0):  Default mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "1360x768": 84.8 MHz (scaled from 0.0 MHz), 47.7 kHz, 59.8 Hz
(II) NOUVEAU(0): Modeline "1360x768"x59.8   84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync (47.7 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 143.5 MHz (scaled from 0.0 MHz), 91.5 kHz, 100.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x100.0  143.47  1152 1232 1360 1568  864 865 868 915 -hsync +vsync (91.5 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 121.5 MHz (scaled from 0.0 MHz), 77.5 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "1152x864"x85.1  121.50  1152 1216 1344 1568  864 865 868 911 +hsync -vsync (77.5 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 119.7 MHz (scaled from 0.0 MHz), 77.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x85.0  119.65  1152 1224 1352 1552  864 865 868 907 -hsync +vsync (77.1 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 105.0 MHz (scaled from 0.0 MHz), 67.6 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  104.99  1152 1224 1352 1552  864 865 868 902 -hsync +vsync (67.6 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 96.8 MHz (scaled from 0.0 MHz), 63.0 kHz, 70.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x70.0   96.77  1152 1224 1344 1536  864 865 868 900 -hsync +vsync (63.0 kHz)
(**) NOUVEAU(0):  Default mode "1152x864": 81.6 MHz (scaled from 0.0 MHz), 53.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x60.0   81.62  1152 1216 1336 1520  864 865 868 895 -hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 170.2 MHz (scaled from 0.0 MHz), 120.2 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 133.5 MHz (scaled from 0.0 MHz), 95.3 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 94.5 MHz (scaled from 0.0 MHz), 68.7 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376  768 769 772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Default mode "1024x768": 44.9 MHz (scaled from 0.0 MHz), 35.5 kHz, 87.0 Hz (I)
(II) NOUVEAU(0): Modeline "1024x768"x87.0   44.90  1024 1032 1208 1264  768 768 776 817 interlace +hsync +vsync (35.5 kHz)
(**) NOUVEAU(0):  Default mode "960x720": 148.5 MHz (scaled from 0.0 MHz), 112.5 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz)
(**) NOUVEAU(0):  Default mode "960x720": 117.0 MHz (scaled from 0.0 MHz), 90.0 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz)
(**) NOUVEAU(0):  Default mode "928x696": 144.0 MHz (scaled from 0.0 MHz), 112.5 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz)
(**) NOUVEAU(0):  Default mode "928x696": 109.2 MHz (scaled from 0.0 MHz), 86.4 kHz, 60.1 Hz (D)
(II) NOUVEAU(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz)
(**) NOUVEAU(0):  Default mode "896x672": 130.5 MHz (scaled from 0.0 MHz), 106.3 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz)
(**) NOUVEAU(0):  Default mode "896x672": 102.4 MHz (scaled from 0.0 MHz), 83.7 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz)
(**) NOUVEAU(0):  Default mode "960x600": 77.0 MHz (scaled from 0.0 MHz), 74.0 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz)
(**) NOUVEAU(0):  Default mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "960x540": 69.2 MHz (scaled from 0.0 MHz), 66.6 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 114.8 MHz (scaled from 0.0 MHz), 106.2 kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x85.0  114.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (106.2 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 101.2 MHz (scaled from 0.0 MHz), 93.8 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 94.5 MHz (scaled from 0.0 MHz), 87.5 kHz, 70.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 87.8 MHz (scaled from 0.0 MHz), 81.2 kHz, 65.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 81.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 56.3 MHz (scaled from 0.0 MHz), 53.7 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.30  800 832 896 1048  600 601 604 631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0):  Default mode "840x525": 107.4 MHz (scaled from 0.0 MHz), 93.9 kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "840x525"x85.0  107.38  840 904 992 1144  525 526 529 552 doublescan -hsync +vsync (93.9 kHz)
(**) NOUVEAU(0):  Default mode "840x525": 93.5 MHz (scaled from 0.0 MHz), 82.3 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "840x525"x75.0   93.50  840 900 988 1136  525 526 529 549 doublescan -hsync +vsync (82.3 kHz)
(**) NOUVEAU(0):  Default mode "840x525": 87.0 MHz (scaled from 0.0 MHz), 76.6 kHz, 69.9 Hz (D)
(II) NOUVEAU(0): Modeline "840x525"x69.9   87.00  840 900 988 1136  525 526 529 548 doublescan -hsync +vsync (76.6 kHz)
(**) NOUVEAU(0):  Default mode "840x525": 73.1 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0):  Default mode "840x525": 59.5 MHz (scaled from 0.0 MHz), 64.7 kHz, 59.9 Hz (D)
(II) NOUVEAU(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz)
(**) NOUVEAU(0):  Default mode "800x512": 51.6 MHz (scaled from 0.0 MHz), 62.0 kHz, 60.2 Hz (D)
(II) NOUVEAU(0): Modeline "800x512"x60.2   51.56  800 800 828 832  512 512 514 515 doublescan +hsync +vsync (62.0 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 89.6 MHz (scaled from 0.0 MHz), 93.8 kHz, 85.1 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x85.1   89.63  700 752 828 956  525 525 527 551 doublescan -hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 77.9 MHz (scaled from 0.0 MHz), 81.5 kHz, 74.8 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 72.5 MHz (scaled from 0.0 MHz), 76.5 kHz, 70.1 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x70.1   72.53  700 748 824 948  525 525 527 546 doublescan -hsync +vsync (76.5 kHz)
(**) NOUVEAU(0):  Default mode "700x525": 61.0 MHz (scaled from 0.0 MHz), 64.9 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 78.8 MHz (scaled from 0.0 MHz), 91.1 kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x85.0   78.75  640 672 752 864  512 512 514 536 doublescan +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 67.5 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Default mode "640x512": 54.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Default mode "720x450": 53.2 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz (D)
(II) NOUVEAU(0): Modeline "720x450"x59.9   53.25  720 760 836 952  450 451 454 467 doublescan -hsync +vsync (55.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 74.2 MHz (scaled from 0.0 MHz), 85.9 kHz, 85.1 Hz (D)
(II) NOUVEAU(0): Modeline "640x480"x85.1   74.25  640 672 752 864  480 480 482 505 doublescan +hsync +vsync (85.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 54.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 36.0 MHz (scaled from 0.0 MHz), 43.3 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x85.0   36.00  640 696 752 832  480 481 484 509 -hsync -vsync (43.3 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Default mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0):  Default mode "720x400": 35.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "720x400"x85.0   35.50  720 756 828 936  400 401 404 446 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "680x384": 42.4 MHz (scaled from 0.0 MHz), 47.7 kHz, 59.8 Hz (D)
(II) NOUVEAU(0): Modeline "680x384"x59.8   42.38  680 716 784 888  384 385 390 399 doublescan -hsync +vsync (47.7 kHz)
(**) NOUVEAU(0):  Default mode "680x384": 36.0 MHz (scaled from 0.0 MHz), 47.4 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "680x384"x60.0   36.00  680 704 720 760  384 385 390 395 doublescan +hsync -vsync (47.4 kHz)
(**) NOUVEAU(0):  Default mode "640x400": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x400"x85.1   31.50  640 672 736 832  400 401 404 445 -hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 71.7 MHz (scaled from 0.0 MHz), 91.5 kHz, 100.1 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x100.1   71.73  576 616 680 784  432 432 434 457 doublescan -hsync +vsync (91.5 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 60.8 MHz (scaled from 0.0 MHz), 77.5 kHz, 85.2 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x85.2   60.75  576 608 672 784  432 432 434 455 doublescan +hsync -vsync (77.5 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 59.8 MHz (scaled from 0.0 MHz), 77.1 kHz, 85.1 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x85.1   59.83  576 612 676 776  432 432 434 453 doublescan -hsync +vsync (77.1 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 54.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 52.5 MHz (scaled from 0.0 MHz), 67.6 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x75.0   52.49  576 612 676 776  432 432 434 451 doublescan -hsync +vsync (67.6 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 48.4 MHz (scaled from 0.0 MHz), 63.0 kHz, 70.0 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x70.0   48.38  576 612 672 768  432 432 434 450 doublescan -hsync +vsync (63.0 kHz)
(**) NOUVEAU(0):  Default mode "576x432": 40.8 MHz (scaled from 0.0 MHz), 53.7 kHz, 60.1 Hz (D)
(II) NOUVEAU(0): Modeline "576x432"x60.1   40.81  576 608 668 760  432 432 434 447 doublescan -hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "640x350": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "640x350"x85.1   31.50  640 672 736 832  350 382 385 445 +hsync -vsync (37.9 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 47.2 MHz (scaled from 0.0 MHz), 68.7 kHz, 85.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x85.0   47.25  512 536 584 688  384 384 386 404 doublescan +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 39.4 MHz (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 37.5 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz)
(**) NOUVEAU(0):  Default mode "512x384": 32.5 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz (D)
(II) NOUVEAU(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Default mode "416x312": 28.6 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.7 Hz (D)
(II) NOUVEAU(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz)
(**) NOUVEAU(0):  Default mode "400x300": 28.1 MHz (scaled from 0.0 MHz), 53.7 kHz, 85.3 Hz (D)
(II) NOUVEAU(0): Modeline "400x300"x85.3   28.15  400 416 448 524  300 300 302 315 doublescan +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Default mode "400x300": 25.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz (D)
(II) NOUVEAU(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz)
(==) NOUVEAU(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/xorg/modules//libexa.so
(II) Module exa: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 2.4.0
	ABI class: X.Org Video Driver, version 5.0
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"
(II) Loading /usr/lib/xorg/modules//libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 1.0.0
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
(II) NOUVEAU(0): Allocated 128MiB VRAM for framebuffer + offscreen pixmaps, at offset 0x20000000
(II) NOUVEAU(0): AGPGART: 32MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(EE) NOUVEAU(0): [dri] GlxSetVisualConfigs not found.
(EE) NOUVEAU(0):       NVIDIA's glx present, or glx not loaded.
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
(II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): NV50DispInit is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50DacSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC0.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50DacGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_output_get_crtc is called.
(II) NOUVEAU(0): NV50SorGetCurrentCrtc is called.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(II) NOUVEAU(0): nv50_output_prepare is called.
(II) NOUVEAU(0): nv50_crtc_prepare is called for CRTC0.
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
(II) NOUVEAU(0): NV50CrtcSetClockMode is called for CRTC0.
(II) NOUVEAU(0): NV50DacSetClockMode is called.
(II) NOUVEAU(0): nv50_output_commit is called.
(II) NOUVEAU(0): nv50_output_dpms is called with mode 3.
(II) NOUVEAU(0): NV50SorSetPowerMode is called with mode 3.
(II) NOUVEAU(0): nv50_crtc_dpms is called with mode 3 for CRTC1.
(**) Option "dpms"
(**) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC0.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC0.
(II) NOUVEAU(0): nv50_crtc_gamma_set is called for CRTC1.
(II) NOUVEAU(0): NV50CrtcGammaSet is called for CRTC1.
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
(II) Initializing built-in extension SECURITY
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(EE) Failed to initialize GLX extension (Compatible NVIDIA X driver not found)
(II) NOUVEAU(0): Setting screen physical size to 423 x 317
(II) config/hal: Adding input device Logitech Logitech USB Keyboard
(II) LoadModule: "evdev"
(II) Loading /usr/lib/xorg/modules/input//evdev_drv.so
(II) Module evdev: vendor="X.Org Foundation"
	compiled for 1.6.0, module version = 2.1.1
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 4.0
(**) Logitech Logitech USB Keyboard: always reports core events
(**) Logitech Logitech USB Keyboard: Device: "/dev/input/event5"
(II) Logitech Logitech USB Keyboard: Found 32 mouse buttons
(II) Logitech Logitech USB Keyboard: Found x and y relative axes
(II) Logitech Logitech USB Keyboard: Found keys
(II) Logitech Logitech USB Keyboard: Configuring as mouse
(II) Logitech Logitech USB Keyboard: Configuring as keyboard
(**) Logitech Logitech USB Keyboard: YAxisMapping: buttons 4 and 5
(**) Logitech Logitech USB Keyboard: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Logitech Logitech USB Keyboard" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Logitech Logitech USB Keyboard: xkb_rules: "evdev"
(**) Option "xkb_model" "pc105"
(**) Logitech Logitech USB Keyboard: xkb_model: "pc105"
(**) Option "xkb_layout" "us"
(**) Logitech Logitech USB Keyboard: xkb_layout: "us"
(**) Option "xkb_options" "grp:alts_toggle"
(**) Logitech Logitech USB Keyboard: xkb_options: "grp:alts_toggle"
(**) Logitech Logitech USB Keyboard: (accel) keeping acceleration scheme 1
(**) Logitech Logitech USB Keyboard: (accel) filter chain progression: 2.00
(**) Logitech Logitech USB Keyboard: (accel) filter stage 0: 20.00 ms
(**) Logitech Logitech USB Keyboard: (accel) set acceleration profile 0
(II) config/hal: Adding input device Logitech Logitech USB Keyboard
(**) Logitech Logitech USB Keyboard: always reports core events
(**) Logitech Logitech USB Keyboard: Device: "/dev/input/event4"
(II) Logitech Logitech USB Keyboard: Found keys
(II) Logitech Logitech USB Keyboard: Configuring as keyboard
(II) XINPUT: Adding extended input device "Logitech Logitech USB Keyboard" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Logitech Logitech USB Keyboard: xkb_rules: "evdev"
(**) Option "xkb_model" "pc105"
(**) Logitech Logitech USB Keyboard: xkb_model: "pc105"
(**) Option "xkb_layout" "us"
(**) Logitech Logitech USB Keyboard: xkb_layout: "us"
(**) Option "xkb_options" "grp:alts_toggle"
(**) Logitech Logitech USB Keyboard: xkb_options: "grp:alts_toggle"
(II) config/hal: Adding input device Macintosh mouse button emulation
(**) Macintosh mouse button emulation: always reports core events
(**) Macintosh mouse button emulation: Device: "/dev/input/event2"
(II) Macintosh mouse button emulation: Found 3 mouse buttons
(II) Macintosh mouse button emulation: Found x and y relative axes
(II) Macintosh mouse button emulation: Configuring as mouse
(**) Macintosh mouse button emulation: YAxisMapping: buttons 4 and 5
(**) Macintosh mouse button emulation: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Macintosh mouse button emulation" (type: MOUSE)
(**) Macintosh mouse button emulation: (accel) keeping acceleration scheme 1
(**) Macintosh mouse button emulation: (accel) filter chain progression: 2.00
(**) Macintosh mouse button emulation: (accel) filter stage 0: 20.00 ms
(**) Macintosh mouse button emulation: (accel) set acceleration profile 0
(II) config/hal: Adding input device HID 413c:3010
(**) HID 413c:3010: always reports core events
(**) HID 413c:3010: Device: "/dev/input/event3"
(II) HID 413c:3010: Found 3 mouse buttons
(II) HID 413c:3010: Found x and y relative axes
(II) HID 413c:3010: Configuring as mouse
(**) HID 413c:3010: YAxisMapping: buttons 4 and 5
(**) HID 413c:3010: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "HID 413c:3010" (type: MOUSE)
(**) HID 413c:3010: (accel) keeping acceleration scheme 1
(**) HID 413c:3010: (accel) filter chain progression: 2.00
(**) HID 413c:3010: (accel) filter stage 0: 20.00 ms
(**) HID 413c:3010: (accel) set acceleration profile 0

--------------030105050701010204080506
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------030105050701010204080506--

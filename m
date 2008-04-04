From: Richi Plana <richip-phGNbu20FqI6LPSSItiycw@public.gmane.org>
Subject: Driver Problem with 7150M
Date: Thu, 03 Apr 2008 20:54:40 -0600
Message-ID: <1207277680.6962.6.camel@localhost6.localdomain6>
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

Hi,

I tried using the nouveau driver that comes latest with Fedora Rawhide
(xorg-x11-drv-nouveau-0.0.10-1.20080311git460cb26) on my HP Pavilion
dv2000 laptop with a GeForce 7150M (PCI 10de:0531) but couldn't even get
the server up. The server spit out the following log. Could someone tell
me how to get things working? Or even if I should file a bug?

Xorg.0.log:


X.Org X Server 1.4.99.901 (1.5.0 RC 1)
Release Date: 5 September 2007
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-53.1.6.el5xen x86_64 
Current Operating System: Linux duke 2.6.25-0.185.rc7.git6.fc9.x86_64 #1
SMP Tue Apr 1 13:28:16 EDT 2008 x86_64
Build Date: 02 April 2008  01:07:03PM
Build ID: xorg-x11-server 1.4.99.901-16.20080401.fc9 
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Module Loader present
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Thu Apr  3 20:41:37 2008
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "single head configuration"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Videocard0"
(**) |-->Input Device "Synaptics"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) No FontPath specified.  Using compiled-in default.
(==) FontPath set to:
	catalogue:/etc/X11/fontpath.d,
	built-ins
(==) ModulePath set to "/usr/lib64/xorg/modules"
(II) No default mouse found, adding one
(**) |-->Input Device "<default pointer>"
(==) |-->Input Device "<default keyboard>"
(==) The core keyboard device wasn't specified explicitly in the layout.
	Using the default keyboard configuration.
(II) Open ACPI successful (/var/run/acpid.socket)
(II) Loader magic: 0x7b4bc0
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.3
	X.Org Video Driver: 4.0
	X.Org XInput driver : 2.0
	X.Org Server Extension : 1.0
	X.Org Font Renderer : 0.5
(II) Loader running on linux
(--) using VT number 7

(--) PCI: (0@0:1:3) nVidia Corporation MCP67 Co-processor rev 162, Mem @
0xfc200000/524288
(--) PCI:*(0@0:18:0) nVidia Corporation GeForce 7150M rev 162, Mem @
0xf4000000/16777216, 0xd0000000/268435456, 0xf0000000/16777216
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
(II) LoadModule: "extmod"

(II) Loading /usr/lib64/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 1.0
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
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"

(II) Loading /usr/lib64/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(==) AIGLX enabled
(==) Exporting typical set of GLX visuals
(II) Loading extension GLX
(II) LoadModule: "freetype"

(II) Loading /usr/lib64/xorg/modules/fonts//libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
	compiled for 1.4.99.901, module version = 2.1.0
	Module class: X.Org Font Renderer
	ABI class: X.Org Font Renderer, version 0.5
(II) Loading font FreeType
(II) LoadModule: "record"

(WW) Warning, couldn't open module record
(II) UnloadModule: "record"
(EE) Failed to load module "record" (module does not exist, 0)
(II) LoadModule: "dri"

(II) Loading /usr/lib64/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"

(II) Loading /usr/lib64/xorg/modules/extensions//libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	ABI class: X.Org Server Extension, version 1.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"

(II) Loading /usr/lib64/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 0.0.10
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "synaptics"

(II) Loading /usr/lib64/xorg/modules/input//synaptics_drv.so
(II) Module synaptics: vendor="X.Org Foundation"
	compiled for 4.3.99.902, module version = 1.0.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "mouse"

(II) Loading /usr/lib64/xorg/modules/input//mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.3.0
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 2.0
(II) LoadModule: "kbd"

(II) Loading /usr/lib64/xorg/modules/input//kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.3.0
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
(II) Primary Device is: PCI 00@00:12:0
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
(II) Loading sub module "int10"
(II) LoadModule: "int10"

(II) Loading /usr/lib64/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	ABI class: X.Org Video Driver, version 4.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
(--) NOUVEAU(0): Chipset: "NVIDIA NV67"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"

(II) Loading /usr/lib64/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 0.1.0
	ABI class: X.Org Video Driver, version 4.0
(==) NOUVEAU(0): Randr1.2 support disabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD0000000
(--) NOUVEAU(0): MMIO registers at 0xF4000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"

(II) Reloading /usr/lib64/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: Searching for BusID pci:0000:00:12.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: drmOpenMinor returns 13
drmOpenByBusid: drmGetBusid reports pci:0000:00:12.0
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module
version 0.0.10
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to locate BIOS image in PROM
(WW) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to locate BIOS image in PRAMIN
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): 	Read:  Reg: 0x00100200, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 05.67.32.16
(II) NOUVEAU(0): DAC load detection comparison table version 10 found
(II) NOUVEAU(0): 0xE333: Parsing init table 0
(II) NOUVEAU(0): 0xE333: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE333: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE333: Reg: 0x0060081C, Mask: 0xFFFFFCCC, Data:
0x80000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0060081C, Data: 0xA2662555
(II) NOUVEAU(0): 	Write: Reg: 0x0060081C, Data: 0xA2662445
(II) NOUVEAU(0): 0xE340: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE340: Reg: 0x0000C048, Mask: 0xFFFFFFFE, Data:
0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C048, Data: 0x00001A01
(II) NOUVEAU(0): 	Write: Reg: 0x0000C048, Data: 0x00001A01
(II) NOUVEAU(0): 0xE34D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001588, Data: 0x00000000
(II) NOUVEAU(0): 0xE356: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head:
0x00, Data: 0x03
(II) NOUVEAU(0): 0xE359: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE359: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data:
0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head:
0x01, Data: 0x20
(II) NOUVEAU(0): 0xE35F: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 0xE362: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE362: Port: 0x03C4, Index: 0x01, Mask: 0xFF, Data:
0x20
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head:
0x00, Data: 0x20
(II) NOUVEAU(0): 0xE368: [ (0x65) - INIT_RESET ]
(II) NOUVEAU(0): 	Read:  Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x03100000
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x07110111
(II) NOUVEAU(0): 	Write: Reg: 0x0000184C, Data: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001850, Data: 0x00800005
(II) NOUVEAU(0): 	Write: Reg: 0x00001850, Data: 0x00800004
(II) NOUVEAU(0): 0xE375: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE375: Reg: 0x00101000, Mask: 0xFFF0FFFF, Data:
0x800F0000
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): 	Write: Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): 0xE382: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE382: Reg: 0x0010100C, Mask: 0xFFFFFFFF, Data:
0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0010100C, Data: 0x0A140013
(II) NOUVEAU(0): 	Write: Reg: 0x0010100C, Data: 0x0A140013
(II) NOUVEAU(0): 0xE38F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE38F: Reg: 0x000012C0, Mask: 0xFFFFFFFF, Data:
0x00000200
(II) NOUVEAU(0): 	Read:  Reg: 0x000012C0, Data: 0x00000260
(II) NOUVEAU(0): 	Write: Reg: 0x000012C0, Data: 0x00000260
(II) NOUVEAU(0): 0xE39C: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x00000000
(II) NOUVEAU(0): 0xE3A5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004058, Data: 0xC000001C
(II) NOUVEAU(0): 0xE3AE: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0x80000000
(II) NOUVEAU(0): 0xE3B7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004008, Data: 0xC1C00801
(II) NOUVEAU(0): 0xE3C0: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xE3C0: EXECUTING SUB-ROUTINE AT 0xE66A
(II) NOUVEAU(0): 0xE66A: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE66A: Reg: 0x00680524, Mask: 0xFFFFFF0F, Data:
0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680524, Data: 0x00000020
(II) NOUVEAU(0): 	Write: Reg: 0x00680524, Data: 0x00000000
(II) NOUVEAU(0): 0xE677: [ (0x92) - INIT_RESERVED ]
(II) NOUVEAU(0): 0xE678: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE678: Reg: 0x001020FB, Mask: 0xFFFFFF7F, Data:
0x00000080
(EE) NOUVEAU(0): ========== misaligned reg 0x001020FB ==========
(EE) NOUVEAU(0): ========== misaligned reg 0x001020FB ==========
(II) NOUVEAU(0): 0xE685: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE3C0: END OF SUB-ROUTINE AT 0xE66A
(II) NOUVEAU(0): 0xE3C3: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680580, Data: 0x01C0001C
(II) NOUVEAU(0): 0xE3CC: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00004020, Data: 0xE000001C
(II) NOUVEAU(0): 0xE3D5: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680510, Data: 0x01F0001F
(II) NOUVEAU(0): 0xE3DE: [ (0x75) - INIT_CONDITION ]
(II) NOUVEAU(0): 0xE3DE: Cond: 0x00, Reg: 0x00101000, Mask: 0x00000040,
Cmpval: 0x00000040
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): 0xE3DE: Checking if 0x00000000 equals 0x00000040
(II) NOUVEAU(0): 0xE3DE: CONDITION IS NOT FULFILLED
(II) NOUVEAU(0): 0xE3DE: ------ SKIPPING FOLLOWING COMMANDS  ------
(II) NOUVEAU(0): 0xE3E0: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 0xE3E5: [ (0x38) - INIT_NOT ]
(II) NOUVEAU(0): 0xE3E5: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE3E6: [ (0x62) - INIT_ZM_INDEX_IO ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 0xE3EB: [ (0x72) - INIT_RESUME ]
(II) NOUVEAU(0): 0xE3EC: [ (0x37) - INIT_COPY ]
(II) NOUVEAU(0): 0xE3EC: Reg: 0x00101000, Shift: 0xFE, SrcMask: 0xF0,
Port: 0x03D4, Index: 0x3C, Mask: 0x0F
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head:
0x00, Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head:
0x00, Data: 0x0F
(II) NOUVEAU(0): 0xE3F7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001508, Data: 0x00000000
(II) NOUVEAU(0): 0xE400: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680580, Data: 0x01F0001F
(II) NOUVEAU(0): 0xE409: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00000140, Data: 0x00000000
(II) NOUVEAU(0): 0xE412: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE412: Reg: 0x00000200, Mask: 0xFFFFFFFF, Data:
0x02100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00000200, Data: 0x17113113
(II) NOUVEAU(0): 	Write: Reg: 0x00000200, Data: 0x17113113
(II) NOUVEAU(0): 0xE41F: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680608, Data: 0x00100000
(II) NOUVEAU(0): 0xE428: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00682608, Data: 0x00100000
(II) NOUVEAU(0): 0xE431: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100080, Data: 0x47170020
(II) NOUVEAU(0): 0xE43A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001084, Data: 0x00205749
(II) NOUVEAU(0): 0xE443: [ (0x6B) - INIT_SUB ]
(II) NOUVEAU(0): 0xE443: EXECUTING SUB-SCRIPT 6
(II) NOUVEAU(0): 0xE5DA: [ (0x4A) - INIT_IO_RESTRICT_PLL2 ]
(II) NOUVEAU(0): 0xE5DA: Port: 0x03D4, Index: 0x3C, Mask: 0x70, Shift:
0x04, Count: 0x08, Reg: 0x00004004
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x3C, Head:
0x00, Data: 0xFF
(II) NOUVEAU(0): 0xE5DA: Reg: 0x00004004, Config: 0x07, Freq: 350000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): Loading PLL limits for reg 0x00004000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004000, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00004004, Data: 0x00011911
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0x90000000
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0x80000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x340BC00F
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x340BC00C
(II) NOUVEAU(0): 	Write: Reg: 0x00004004, Data: 0x01011C13
(II) NOUVEAU(0): 	Write: Reg: 0x00004000, Data: 0xC0000000
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x340BC00F
(II) NOUVEAU(0): 0xE605: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE443: END OF SUB-SCRIPT 6
(II) NOUVEAU(0): 0xE445: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x340BC003
(II) NOUVEAU(0): 0xE44E: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE44E: Reg: 0x00100874, Mask: 0xFFE1FFFD, Data:
0x00080002
(II) NOUVEAU(0): 	Read:  Reg: 0x00100874, Data: 0x1C09001E
(II) NOUVEAU(0): 	Write: Reg: 0x00100874, Data: 0x1C09001E
(II) NOUVEAU(0): 0xE45B: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100858, Data: 0x00000001
(II) NOUVEAU(0): 0xE464: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680304, Data: 0x00000000
(II) NOUVEAU(0): 0xE46D: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00682304, Data: 0x00000000
(II) NOUVEAU(0): 0xE476: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE476: Reg: 0x0010008C, Mask: 0x80FFFFFF, Data:
0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0010008C, Data: 0x0000002E
(II) NOUVEAU(0): 	Write: Reg: 0x0010008C, Data: 0x0000002E
(II) NOUVEAU(0): 0xE483: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE484: Parsing init table 1
(II) NOUVEAU(0): 0xE484: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE484: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE485: Parsing init table 2
(II) NOUVEAU(0): 0xE485: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE485: [ (0x4B) - INIT_PLL2 ]
(II) NOUVEAU(0): 0xE485: Reg: 0x680508, Freq: 36000kHz
(II) NOUVEAU(0): Found PLL limits table version 0x21
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): Loading PLL limits for reg 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680508, Data: 0x00031E03
(II) NOUVEAU(0): 	Read:  Reg: 0x00680578, Data: 0x80001309
(II) NOUVEAU(0): 	Read:  Reg: 0x0000C040, Data: 0x340BC00F
(II) NOUVEAU(0): 	Write: Reg: 0x0000C040, Data: 0x340BC00F
(II) NOUVEAU(0): 	Read:  Reg: 0x00680580, Data: 0x01F0001F
(II) NOUVEAU(0): 	Write: Reg: 0x00680580, Data: 0x01F0001F
(II) NOUVEAU(0): 	Write: Reg: 0x00680578, Data: 0x8000DEAD
(II) NOUVEAU(0): 	Write: Reg: 0x00680508, Data: 0x0000BEEF
(II) NOUVEAU(0): 0xE48E: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001088, Data: 0x000011F0
(II) NOUVEAU(0): 0xE497: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0000108C, Data: 0x000000D1
(II) NOUVEAU(0): 0xE4A0: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE4A0: Reg: 0x00001530, Mask: 0xFFFFF9F0, Data:
0x00000407
(II) NOUVEAU(0): 	Read:  Reg: 0x00001530, Data: 0x800005F7
(II) NOUVEAU(0): 	Write: Reg: 0x00001530, Data: 0x800005F7
(II) NOUVEAU(0): 0xE4AD: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE4AD: Reg: 0x00680880, Mask: 0xFFFFFFFF, Data:
0x10040000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680880, Data: 0x01141191
(II) NOUVEAU(0): 	Write: Reg: 0x00680880, Data: 0x11141191
(II) NOUVEAU(0): 0xE4BA: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE4BA: Reg: 0x00682880, Mask: 0xFFFFFFFF, Data:
0x10040000
(II) NOUVEAU(0): 	Read:  Reg: 0x00682880, Data: 0x21141111
(II) NOUVEAU(0): 	Write: Reg: 0x00682880, Data: 0x31141111
(II) NOUVEAU(0): 0xE4C7: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680610, Data: 0x00000000
(II) NOUVEAU(0): 0xE4D0: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x38, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x1A, Head:
0x00, Data: 0x3F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x28, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x33, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head:
0x00, Data: 0xFA
(II) NOUVEAU(0): 0xE4DC: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xE4DC: Index: 0x2B, Mask: 0x20, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head:
0x00, Data: 0x20
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head:
0x00, Data: 0x20
(II) NOUVEAU(0): 0xE4E0: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head:
0x00, Data: 0x40
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 0xE4EE: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xE4EE: Index1: 0x57, Index2: 0x58, BaseAddr: 0x00,
Count: 0x10
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x02
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x03
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x05
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x06
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x07
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x08
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x09
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0A
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0B
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0C
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0D
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0E
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x00, Data: 0x04
(II) NOUVEAU(0): 0xE503: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head:
0x00, Data: 0x01
(II) NOUVEAU(0): 0xE506: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE506: Port: 0x03D4, Index: 0x85, Mask: 0x00, Data:
0xFF
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x85, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x85, Head:
0x00, Data: 0xFF
(II) NOUVEAU(0): 0xE50C: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE50C: Port: 0x03D4, Index: 0x86, Mask: 0x00, Data:
0x03
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x86, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x86, Head:
0x00, Data: 0x03
(II) NOUVEAU(0): 0xE512: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head:
0x00, Data: 0x03
(II) NOUVEAU(0): 0xE515: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x21, Head:
0x01, Data: 0xFA
(II) NOUVEAU(0): 0xE518: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE518: Port: 0x03D4, Index: 0x85, Mask: 0x00, Data:
0xFF
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x85, Head:
0x01, Data: 0xFF
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x85, Head:
0x01, Data: 0xFF
(II) NOUVEAU(0): 0xE51E: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE51E: Port: 0x03D4, Index: 0x86, Mask: 0x00, Data:
0x01
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x86, Head:
0x01, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x86, Head:
0x01, Data: 0x01
(II) NOUVEAU(0): 0xE524: [ (0x52) - INIT_CR ]
(II) NOUVEAU(0): 0xE524: Index: 0x2B, Mask: 0x10, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x2B, Head:
0x01, Data: 0x10
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2B, Head:
0x01, Data: 0x10
(II) NOUVEAU(0): 0xE528: [ (0x54) - INIT_ZM_CR_GROUP ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x2C, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3A, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3B, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x3C, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4A, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4B, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x4C, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 0xE538: [ (0x51) - INIT_CR_INDEX_ADDRESS_LATCHED ]
(II) NOUVEAU(0): 0xE538: Index1: 0x57, Index2: 0x58, BaseAddr: 0x00,
Count: 0x10
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x7F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x01
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x02
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x03
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x04
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x05
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x06
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x07
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x08
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x09
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0A
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0B
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0C
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0D
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0E
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x0F
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x58, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x57, Head:
0x01, Data: 0x00
(II) NOUVEAU(0): 0xE54D: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x43, Head:
0x01, Data: 0x01
(II) NOUVEAU(0): 0xE550: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x44, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 0xE553: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x52, Head:
0x00, Data: 0x04
(II) NOUVEAU(0): 0xE556: [ (0x53) - INIT_ZM_CR ]
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03D4, Index: 0x53, Head:
0x00, Data: 0x40
(II) NOUVEAU(0): 0xE559: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE559: Reg: 0x00001584, Mask: 0xFFF00000, Data:
0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001584, Data: 0x00000000
(II) NOUVEAU(0): 0xE566: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xE566: BaseReg: 0x0077FFF4, Count: 0x03
(EE) NOUVEAU(0): ========== unknown reg 0x0077FFF4 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0077FFF8 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0077FFFC ==========
(II) NOUVEAU(0): 0xE578: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0010086C, Data: 0xFFFFFFF3
(II) NOUVEAU(0): 0xE581: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100868, Data: 0xFFFFFFE1
(II) NOUVEAU(0): 0xE58A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100870, Data: 0xFFFFFFD3
(II) NOUVEAU(0): 0xE593: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xE59C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE59C: Reg: 0x0068052C, Mask: 0xFFFFFEFF, Data:
0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 	Write: Reg: 0x0068052C, Data: 0x00000001
(II) NOUVEAU(0): 0xE5A9: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE5A9: Reg: 0x0068252C, Mask: 0xFFFFFFFF, Data:
0x00000101
(II) NOUVEAU(0): 	Read:  Reg: 0x0068252C, Data: 0x00000101
(II) NOUVEAU(0): 	Write: Reg: 0x0068252C, Data: 0x00000101
(II) NOUVEAU(0): 0xE5B6: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE5B6: Reg: 0x00680848, Mask: 0xFFFFFFFF, Data:
0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00680848, Data: 0x14100000
(II) NOUVEAU(0): 	Write: Reg: 0x00680848, Data: 0x14100000
(II) NOUVEAU(0): 0xE5C3: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE5C3: Reg: 0x00682848, Mask: 0xFFFFFFFF, Data:
0x00100000
(II) NOUVEAU(0): 	Read:  Reg: 0x00682848, Data: 0x15100011
(II) NOUVEAU(0): 	Write: Reg: 0x00682848, Data: 0x15100011
(II) NOUVEAU(0): 0xE5D0: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001200, Data: 0x0003103C
(II) NOUVEAU(0): 0xE5D9: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE607: Parsing init table 3
(II) NOUVEAU(0): 0xE607: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE607: [ (0x5B) - INIT_SUB_DIRECT ]
(II) NOUVEAU(0): 0xE607: EXECUTING SUB-ROUTINE AT 0xD982
(II) NOUVEAU(0): 0xD982: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00001304, Data: 0x00000800
(II) NOUVEAU(0): 0xD98B: [ (0x58) - INIT_ZM_REG_SEQUENCE ]
(II) NOUVEAU(0): 0xD98B: BaseReg: 0x00001400, Count: 0x04
(II) NOUVEAU(0): 	Write: Reg: 0x00001400, Data: 0xA9A81DA2
(II) NOUVEAU(0): 	Write: Reg: 0x00001404, Data: 0x7FB71E23
(II) NOUVEAU(0): 	Write: Reg: 0x00001408, Data: 0xC9C825D7
(II) NOUVEAU(0): 	Write: Reg: 0x0000140C, Data: 0x7F27C216
(II) NOUVEAU(0): 0xD9A1: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD9A1: Reg: 0x00001098, Mask: 0xFFFFFFF7, Data:
0x00000018
(II) NOUVEAU(0): 	Read:  Reg: 0x00001098, Data: 0x214A061C
(II) NOUVEAU(0): 	Write: Reg: 0x00001098, Data: 0x214A061C
(II) NOUVEAU(0): 0xD9AE: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xD9AE: Reg: 0x00001310, Mask: 0xFC3FFC3F, Data:
0x03000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001310, Data: 0x03040304
(II) NOUVEAU(0): 	Write: Reg: 0x00001310, Data: 0x03040004
(II) NOUVEAU(0): 0xD9BB: [ (0x4F) - INIT_TMDS ]
(II) NOUVEAU(0): 0xD9BB: MagicLookupValue: 0x00, TMDSAddr: 0x2E, Mask:
0xBF, Data: 0x00
(II) NOUVEAU(0): 	Write: Reg: 0x006808B0, Data: 0x0001002E
(II) NOUVEAU(0): 	Read:  Reg: 0x006808B4, Data: 0x00000081
(II) NOUVEAU(0): 	Write: Reg: 0x006808B4, Data: 0x00000081
(II) NOUVEAU(0): 	Write: Reg: 0x006808B0, Data: 0x0000002E
(II) NOUVEAU(0): 0xD9C0: [ (0x4F) - INIT_TMDS ]
(II) NOUVEAU(0): 0xD9C0: MagicLookupValue: 0x01, TMDSAddr: 0x2E, Mask:
0xBF, Data: 0x00
(II) NOUVEAU(0): 	Write: Reg: 0x006808B8, Data: 0x0001002E
(II) NOUVEAU(0): 	Read:  Reg: 0x006808BC, Data: 0x00000081
(II) NOUVEAU(0): 	Write: Reg: 0x006808BC, Data: 0x00000081
(II) NOUVEAU(0): 	Write: Reg: 0x006808B8, Data: 0x0000002E
(II) NOUVEAU(0): 0xD9C5: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE607: END OF SUB-ROUTINE AT 0xD982
(II) NOUVEAU(0): 0xE60A: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 0xE613: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x0070FFF0, Data: 0x00000000
(II) NOUVEAU(0): 0xE61C: [ (0x63) - INIT_COMPUTE_MEM ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100210, Data: 0x80000000
(II) NOUVEAU(0): 	Write: Reg: 0x00100200, Data: 0x00000000
(II) NOUVEAU(0): 0xE61D: [ (0x5F) - INIT_COPY_NV_REG ]
(II) NOUVEAU(0): 0xE61D: SrcReg: 0x0010020C, Shift: 0x00, SrcMask:
0xFFFFFFFF, Xor: 0x00000000, DstReg: 0x00001700, DstMask: 0x00000000
(II) NOUVEAU(0): 	Read:  Reg: 0x0010020C, Data: 0x08000000
(II) NOUVEAU(0): 	Read:  Reg: 0x00001700, Data: 0x08000000
(II) NOUVEAU(0): 	Write: Reg: 0x00001700, Data: 0x08000000
(II) NOUVEAU(0): 0xE633: [ (0x78) - INIT_INDEX_IO ]
(II) NOUVEAU(0): 0xE633: Port: 0x03C4, Index: 0x01, Mask: 0xDF, Data:
0x00
(II) NOUVEAU(0): 	Indexed IO read:  Port: 0x03C4, Index: 0x01, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 	Indexed IO write: Port: 0x03C4, Index: 0x01, Head:
0x00, Data: 0x00
(II) NOUVEAU(0): 0xE639: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE639: Reg: 0x00011014, Mask: 0xFFFF7FFF, Data:
0x00008000
(II) NOUVEAU(0): 	Read:  Reg: 0x00011014, Data: 0x00000000
(II) NOUVEAU(0): 	Write: Reg: 0x00011014, Data: 0x00008000
(II) NOUVEAU(0): 0xE646: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00100860, Data: 0x8F8F8F00
(II) NOUVEAU(0): 0xE64F: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE64F: Reg: 0x00680628, Mask: 0xFFFFFFFC, Data:
0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x00680628, Data: 0x00004011
(II) NOUVEAU(0): 	Write: Reg: 0x00680628, Data: 0x00004011
(II) NOUVEAU(0): 0xE65C: [ (0x6E) - INIT_NV_REG ]
(II) NOUVEAU(0): 0xE65C: Reg: 0x00682628, Mask: 0xFFFFFFFC, Data:
0x00000001
(II) NOUVEAU(0): 	Read:  Reg: 0x00682628, Data: 0x00004011
(II) NOUVEAU(0): 	Write: Reg: 0x00682628, Data: 0x00004011
(II) NOUVEAU(0): 0xE669: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 0xE687: Parsing init table 4
(II) NOUVEAU(0): 0xE687: ------ EXECUTING FOLLOWING COMMANDS ------
(II) NOUVEAU(0): 0xE687: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680E70, Data: 0x00000000
(II) NOUVEAU(0): 0xE690: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680D38, Data: 0x000BB800
(II) NOUVEAU(0): 0xE699: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680E84, Data: 0x00018000
(II) NOUVEAU(0): 0xE6A2: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680EF0, Data: 0x00000001
(II) NOUVEAU(0): 0xE6AB: [ (0x7A) - INIT_ZM_REG ]
(II) NOUVEAU(0): 	Write: Reg: 0x00680EB0, Data: 0x0004003A
(II) NOUVEAU(0): 0xE6B4: [ (0x71) - INIT_DONE ]
(II) NOUVEAU(0): 	Read:  Reg: 0x00101000, Data: 0x814F0000
(II) NOUVEAU(0): Found LVDS manufacturer table revision 3.0
(II) NOUVEAU(0): Found flat panel mode table revision 2.0
(II) NOUVEAU(0): Ignoring FP table
(II) NOUVEAU(0): Found TMDS table revision 1.1
(WW) NOUVEAU(0): TMDS table script pointers not stubbed
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Setting owner: 0x3.
(II) NOUVEAU(0): Setting owner: 0x0.
(II) NOUVEAU(0): Display Configuration Block version 3.0 found
(II) NOUVEAU(0): DCB header length 25, with 6 possible entries
Raw DCB entry 0: 03015323 00000004
Raw DCB entry 1: 01400310 00000023
Raw DCB entry 2: 024223f1 0040c080
(II) NOUVEAU(0): Found 3 entries in DCB
(II) NOUVEAU(0): Found EDID in BIOS
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
(II) NOUVEAU(0): I2C device "DDC:ddc2" removed.
(II) NOUVEAU(0):   ... none found
(II) NOUVEAU(0): Probing for EDID on I2C bus B...
(II) NOUVEAU(0): I2C device "DDC:ddc2" registered at address 0xA0.
(II) NOUVEAU(0): I2C device "DDC:ddc2" removed.
(II) NOUVEAU(0):   ... none found
(--) NOUVEAU(0): CRTC 0 is currently programmed for DFP
(II) NOUVEAU(0): Using DFP on CRTC 0
(--) NOUVEAU(0): Panel size is 1280 x 800
(II) NOUVEAU(0): Panel is LVDS
(--) NOUVEAU(0): VideoRAM: 131072 kBytes
(==) NOUVEAU(0): Using gamma correction (1.0, 1.0, 1.0)
(II) NOUVEAU(0): Monitor0: Using hsync range of 31.50-50.00 kHz
(II) NOUVEAU(0): Monitor0: Using vrefresh range of 56.00-65.00 Hz
(WW) NOUVEAU(0): Unable to estimate virtual size
(II) NOUVEAU(0): Clock range:  12.00 to 400.00 MHz
(II) NOUVEAU(0): Not using default mode "640x350" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "320x175" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x400" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "320x200" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "720x400" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "360x200" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "320x240" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "800x600" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x960" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x960" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "640x480" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "640x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x1024" (exceeds panel
dimensions)
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
(II) NOUVEAU(0): Not using default mode "832x624" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "416x312" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x768" (vrefresh out of
range)
(II) NOUVEAU(0): Not using default mode "576x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1152x864" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "576x432" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x360" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x360" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x360" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x360" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x400" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x800" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x400" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x800" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x400" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x800" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x400" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "640x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1280x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "640x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1360x768" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "680x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1360x768" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "680x384" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1400x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "700x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1440x900" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "720x450" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1600x1024" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "800x512" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1680x1050" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "840x525" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1080" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "960x540" (bad mode
clock/interlace/doublescan)
(II) NOUVEAU(0): Not using default mode "1920x1200" (exceeds panel
dimensions)
(II) NOUVEAU(0): Not using default mode "960x600" (bad mode
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
(--) NOUVEAU(0): Virtual size is 1280x800 (pitch 1280)
(**) NOUVEAU(0): *Driver mode "1280x800": 71.0 MHz, 49.3 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1280x800"x59.9   71.00  1280 1328 1360 1440
800 803 809 823 +hsync -vsync (49.3 kHz)
(**) NOUVEAU(0): *Default mode "1280x800": 83.5 MHz, 49.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x800"x60.0   83.46  1280 1344 1480 1680
800 801 804 828 -hsync +vsync (49.7 kHz)
(**) NOUVEAU(0): *Default mode "1280x768": 80.1 MHz, 47.7 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x768"x60.0   80.14  1280 1344 1480 1680
768 769 772 795 -hsync +vsync (47.7 kHz)
(**) NOUVEAU(0): *Default mode "1280x720": 74.5 MHz, 44.8 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x720"x60.0   74.48  1280 1336 1472 1664
720 721 724 746 -hsync +vsync (44.8 kHz)
(**) NOUVEAU(0): *Default mode "1024x768": 65.0 MHz, 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344
768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 40.0 MHz, 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600
601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0): *Default mode "800x600": 36.0 MHz, 35.2 kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600
601 603 625 +hsync +vsync (35.2 kHz)
(**) NOUVEAU(0): *Default mode "640x480": 25.2 MHz, 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480
490 492 525 -hsync -vsync (31.5 kHz)
(==) NOUVEAU(0): DPI set to (96, 96)
(II) Loading sub module "fb"
(II) LoadModule: "fb"

(II) Loading /usr/lib64/xorg/modules//libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.3
(II) Loading sub module "exa"
(II) LoadModule: "exa"

(II) Loading /usr/lib64/xorg/modules//libexa.so
(II) Module exa: vendor="X.Org Foundation"
	compiled for 1.4.99.901, module version = 2.4.0
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
	[16] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[17] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[18] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[19] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[20] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[21] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
	[22] -1	0	0x0000ffff - 0x0000ffff (0x1) IX[B]
	[23] -1	0	0x00000000 - 0x00000000 (0x1) IX[B]
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: Searching for BusID pci:0000:00:12.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 13, (OK)
drmOpenByBusid: drmOpenMinor returns 13
drmOpenByBusid: drmGetBusid reports pci:0000:00:12.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] Using the DRM lock SAREA also for drawables.
(II) NOUVEAU(0): [drm] framebuffer handle = 0x2ffff000
(II) NOUVEAU(0): [drm] added 1 reserved context for kernel
(II) NOUVEAU(0): X context handle = 0x1
(II) NOUVEAU(0): [drm] installed DRM signal handler
(II) NOUVEAU(0): Allocated 64MiB VRAM for framebuffer + offscreen
pixmaps
(II) NOUVEAU(0): GART: PCI DMA - using 3840KiB
(II) NOUVEAU(0): GART: Allocated 3MiB as a scratch buffer
(II) NOUVEAU(0): Opened GPU channel 1

Backtrace:
0: X(xf86SigHandler+0x65) [0x492fc5]
1: /lib64/libc.so.6 [0x3ea7032f80]
2: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x7fcbae846e86]
3: /usr/lib64/xorg/modules/drivers//nouveau_drv.so(nv30UpdateArbitrationSettings+0x23) [0x7fcbae8471f3]
4: /usr/lib64/xorg/modules/drivers//nouveau_drv.so(NVCalcStateExt+0x405)
[0x7fcbae8478a5]
5: /usr/lib64/xorg/modules/drivers//nouveau_drv.so(NVDACInit+0x467)
[0x7fcbae83c767]
6: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x7fcbae84249d]
7: /usr/lib64/xorg/modules/drivers//nouveau_drv.so [0x7fcbae84345d]
8: X(AddScreen+0x1c9) [0x42bee9]
9: X(InitOutput+0x216) [0x462316]
10: X(main+0x286) [0x42c686]
11: /lib64/libc.so.6(__libc_start_main+0xfa) [0x3ea701e40a]
12: X(FontFileCompleteXLFD+0x281) [0x42bc39]

Fatal server error:
Caught signal 8.  Server aborting

(II) NOUVEAU(0): Fifo dump (lockup 0x0000,0x0008):
(II) NOUVEAU(0): [0x0000] 0x00000000
(II) NOUVEAU(0): [0x0001] 0x00000000
(II) NOUVEAU(0): [0x0002] 0x00000000
(II) NOUVEAU(0): [0x0003] 0x00000000
(II) NOUVEAU(0): [0x0004] 0x00000000
(II) NOUVEAU(0): [0x0005] 0x00000000
(II) NOUVEAU(0): [0x0006] 0x00000000
(II) NOUVEAU(0): [0x0007] 0x00000000
(II) NOUVEAU(0): [0x0008] 0x00040000
(II) NOUVEAU(0): [0x0009] 0x80000010
(II) NOUVEAU(0): [0x000a] 0x00040180
(II) NOUVEAU(0): [0x000b] 0x00000000
(II) NOUVEAU(0): [0x000c] 0x00080184
(II) NOUVEAU(0): [0x000d] 0xd8000001
(II) NOUVEAU(0): [0x000e] 0xd8000001
(II) NOUVEAU(0): [0x000f] 0x00042000
(II) NOUVEAU(0): [0x0010] 0x8000001b
(II) NOUVEAU(0): [0x0011] 0x00042300
(II) NOUVEAU(0): End of fifo dump

FatalError re-entered, aborting
DMA queue hang: dmaPut=8, current=0, status=0
--

Richi Plana

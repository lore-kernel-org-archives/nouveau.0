From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: 1 Jul 2011 01:16:49 -0400
Message-ID: <20110701051649.22615.qmail@science.horizon.com>
References: <20cf304346f0aae407049e3aa3fa@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20cf304346f0aae407049e3aa3fa-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

I mentioned these problems back in March, but went back to the nv driver
and ignored it.  Since I need to reboot for another reason, I gave nouveau a try again,

This time, I'm using the kernel git tip, off of 3.0-rc5:
181888bfeea73b2ec756b83fd590fd3a62d4171d: drm/nv50/dp: fix hack to work for macbooks booted via EFI

The X server is Debian's xserver-xorg-video-nouveau, version
1:0.0.16+git20110411+8378443-1+b1

The good news is that my screen "tearing" problem during system activity
appears to be fixed!
Hooray.  But I still have two other problems I mentioned at the time:

1) The text console, although connected via DVI, appears to be about
   half a line of text low.  Tall characters (^ and $) on the top line
   have their top row of pixels "stretched" upward, apparently replicated
   quite a few times.
   The bottom row of characters is only partially visible.

2) I can't start X.  The X server fails to initialize with:
[  6151.976] (II) NOUVEAU(0): Opened GPU channel 1
[  6151.976] (II) NOUVEAU(0): [DRI2] Setup complete
[  6151.976] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[  6151.977] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
[  6151.977] 
Fatal server error:
[  6151.977] AddScreen/ScreenInit failed for driver 0
[  6151.977] 

If I can get problem 2 fixed, problem 1 will become less important.

As mentioned in my old email, it's a uniprocessor Athlon XP system, with a
Geforce 4 MX video adapter:
04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)
The display is a 1920x1080 LCD, connected via DVI.  No other outputs are connected.


Here's the full Xorg.0.log, and the full dmesg is appended.  Thanks for any help!

[  6151.483] _XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
[  6151.483] _XSERVTransOpen: transport open failed for inet6/$HOST:0
[  6151.483] _XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6
[  6151.485] 
X.Org X Server 1.10.2
Release Date: 2011-05-28
[  6151.485] X Protocol Version 11, Revision 0
[  6151.485] Build Operating System: Linux 2.6.32-5-amd64 i686 Debian
[  6151.485] Current Operating System: Linux $HOST 3.0.0-rc5+ #28 Thu Jun 30 22:21:23 EDT 2011 i686
[  6151.485] Kernel command line: auto BOOT_IMAGE=2.6 ro root=302
[  6151.485] Build Date: 17 June 2011  05:05:44PM
[  6151.485] xorg-server 2:1.10.2-2 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[  6151.485] Current version of pixman: 0.21.8
[  6151.485] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[  6151.485] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  6151.485] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Jul  1 00:13:47 2011
[  6151.485] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[  6151.486] (==) No Layout section.  Using the first Screen section.
[  6151.486] (==) No screen section available. Using defaults.
[  6151.486] (**) |-->Screen "Default Screen Section" (0)
[  6151.486] (**) |   |-->Monitor "<default monitor>"
[  6151.487] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[  6151.487] (==) Automatically adding devices
[  6151.487] (==) Automatically enabling devices
[  6151.487] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[  6151.487] 	Entry deleted from font path.
[  6151.487] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
[  6151.487] (==) ModulePath set to "/usr/lib/xorg/modules"
[  6151.487] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[  6151.487] (II) Loader magic: 0x8232ae0
[  6151.487] (II) Module ABI versions:
[  6151.487] 	X.Org ANSI C Emulation: 0.4
[  6151.487] 	X.Org Video Driver: 10.0
[  6151.487] 	X.Org XInput driver : 12.2
[  6151.487] 	X.Org Server Extension : 5.0
[  6151.488] (--) PCI:*(0:4:0:0) 10de:01f0:0000:0000 rev 163, Mem @ 0xec000000/16777216, 0xe4000000/67108864, 0xe8000000/524288, BIOS @ 0x????????/131072
[  6151.489] (II) Open ACPI successful (/var/run/acpid.socket)
[  6151.489] (II) LoadModule: "extmod"
[  6151.489] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[  6151.490] (II) Module extmod: vendor="X.Org Foundation"
[  6151.490] 	compiled for 1.10.2, module version = 1.0.0
[  6151.490] 	Module class: X.Org Server Extension
[  6151.490] 	ABI class: X.Org Server Extension, version 5.0
[  6151.490] (II) Loading extension SELinux
[  6151.490] (II) Loading extension MIT-SCREEN-SAVER
[  6151.490] (II) Loading extension XFree86-VidModeExtension
[  6151.490] (II) Loading extension XFree86-DGA
[  6151.490] (II) Loading extension DPMS
[  6151.490] (II) Loading extension XVideo
[  6151.490] (II) Loading extension XVideo-MotionCompensation
[  6151.490] (II) Loading extension X-Resource
[  6151.490] (II) LoadModule: "dbe"
[  6151.490] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[  6151.491] (II) Module dbe: vendor="X.Org Foundation"
[  6151.491] 	compiled for 1.10.2, module version = 1.0.0
[  6151.491] 	Module class: X.Org Server Extension
[  6151.491] 	ABI class: X.Org Server Extension, version 5.0
[  6151.491] (II) Loading extension DOUBLE-BUFFER
[  6151.491] (II) LoadModule: "glx"
[  6151.491] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[  6151.491] (II) Module glx: vendor="X.Org Foundation"
[  6151.491] 	compiled for 1.10.2, module version = 1.0.0
[  6151.491] 	ABI class: X.Org Server Extension, version 5.0
[  6151.491] (==) AIGLX enabled
[  6151.491] (II) Loading extension GLX
[  6151.491] (II) LoadModule: "record"
[  6151.492] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[  6151.492] (II) Module record: vendor="X.Org Foundation"
[  6151.492] 	compiled for 1.10.2, module version = 1.13.0
[  6151.492] 	Module class: X.Org Server Extension
[  6151.492] 	ABI class: X.Org Server Extension, version 5.0
[  6151.492] (II) Loading extension RECORD
[  6151.492] (II) LoadModule: "dri"
[  6151.492] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[  6151.492] (II) Module dri: vendor="X.Org Foundation"
[  6151.492] 	compiled for 1.10.2, module version = 1.0.0
[  6151.492] 	ABI class: X.Org Server Extension, version 5.0
[  6151.493] (II) Loading extension XFree86-DRI
[  6151.493] (II) LoadModule: "dri2"
[  6151.493] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[  6151.493] (II) Module dri2: vendor="X.Org Foundation"
[  6151.493] 	compiled for 1.10.2, module version = 1.2.0
[  6151.493] 	ABI class: X.Org Server Extension, version 5.0
[  6151.493] (II) Loading extension DRI2
[  6151.493] (==) Matched nouveau as autoconfigured driver 0
[  6151.493] (==) Matched nv as autoconfigured driver 1
[  6151.493] (==) Matched vesa as autoconfigured driver 2
[  6151.493] (==) Matched fbdev as autoconfigured driver 3
[  6151.493] (==) Assigned the driver to the xf86ConfigLayout
[  6151.493] (II) LoadModule: "nouveau"
[  6151.493] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  6151.494] (II) Module nouveau: vendor="X.Org Foundation"
[  6151.494] 	compiled for 1.10.1, module version = 0.0.16
[  6151.494] 	Module class: X.Org Video Driver
[  6151.494] 	ABI class: X.Org Video Driver, version 10.0
[  6151.494] (II) LoadModule: "nv"
[  6151.494] (WW) Warning, couldn't open module nv
[  6151.494] (II) UnloadModule: "nv"
[  6151.494] (II) Unloading nv
[  6151.494] (EE) Failed to load module "nv" (module does not exist, 0)
[  6151.494] (II) LoadModule: "vesa"
[  6151.495] (WW) Warning, couldn't open module vesa
[  6151.495] (II) UnloadModule: "vesa"
[  6151.495] (II) Unloading vesa
[  6151.495] (EE) Failed to load module "vesa" (module does not exist, 0)
[  6151.495] (II) LoadModule: "fbdev"
[  6151.495] (WW) Warning, couldn't open module fbdev
[  6151.495] (II) UnloadModule: "fbdev"
[  6151.495] (II) Unloading fbdev
[  6151.495] (EE) Failed to load module "fbdev" (module does not exist, 0)
[  6151.495] (II) NOUVEAU driver Date:   Thu Mar 24 02:13:12 2011 +1000
[  6151.495] (II) NOUVEAU driver for NVIDIA chipset families :
[  6151.495] 	RIVA TNT        (NV04)
[  6151.495] 	RIVA TNT2       (NV05)
[  6151.495] 	GeForce 256     (NV10)
[  6151.495] 	GeForce 2       (NV11, NV15)
[  6151.496] 	GeForce 4MX     (NV17, NV18)
[  6151.496] 	GeForce 3       (NV20)
[  6151.496] 	GeForce 4Ti     (NV25, NV28)
[  6151.496] 	GeForce FX      (NV3x)
[  6151.496] 	GeForce 6       (NV4x)
[  6151.496] 	GeForce 7       (G7x)
[  6151.496] 	GeForce 8       (G8x)
[  6151.496] 	GeForce GTX 200 (NVA0)
[  6151.496] 	GeForce GTX 400 (NVC0)
[  6151.496] (++) using VT number 8

[  6151.499] drmOpenDevice: node name is /dev/dri/card0
[  6151.499] drmOpenDevice: open result is 9, (OK)
[  6151.499] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[  6151.499] drmOpenDevice: node name is /dev/dri/card0
[  6151.499] drmOpenDevice: open result is 9, (OK)
[  6151.499] drmOpenByBusid: drmOpenMinor returns 9
[  6151.499] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[  6151.499] (II) [drm] nouveau interface version: 0.0.16
[  6151.500] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  6151.500] (II) Loading sub module "dri"
[  6151.500] (II) LoadModule: "dri"
[  6151.500] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[  6151.500] (II) Module dri: vendor="X.Org Foundation"
[  6151.500] 	compiled for 1.10.2, module version = 1.0.0
[  6151.500] 	ABI class: X.Org Server Extension, version 5.0
[  6151.500] (II) NOUVEAU(0): Loaded DRI module
[  6151.500] drmOpenDevice: node name is /dev/dri/card0
[  6151.500] drmOpenDevice: open result is 10, (OK)
[  6151.500] drmOpenDevice: node name is /dev/dri/card0
[  6151.501] drmOpenDevice: open result is 10, (OK)
[  6151.501] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[  6151.501] drmOpenDevice: node name is /dev/dri/card0
[  6151.501] drmOpenDevice: open result is 10, (OK)
[  6151.501] drmOpenByBusid: drmOpenMinor returns 10
[  6151.501] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[  6151.501] (II) [drm] DRM interface version 1.4
[  6151.501] (II) [drm] DRM open master succeeded.
[  6151.501] (--) NOUVEAU(0): Chipset: "NVIDIA NV1f"
[  6151.501] (II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[  6151.501] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  6151.501] (==) NOUVEAU(0): RGB weight 888
[  6151.501] (==) NOUVEAU(0): Default visual is TrueColor
[  6151.501] (==) NOUVEAU(0): Using HW cursor
[  6151.501] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  6151.501] (==) NOUVEAU(0): Page flipping enabled
[  6151.562] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[  6151.622] (II) NOUVEAU(0): Output VGA-2 has no monitor section
[  6151.730] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[  6151.730] (II) NOUVEAU(0): Output TV-1 has no monitor section
[  6151.789] (II) NOUVEAU(0): EDID for output VGA-1
[  6151.849] (II) NOUVEAU(0): EDID for output VGA-2
[  6151.970] (II) NOUVEAU(0): EDID for output DVI-D-1
[  6151.970] (II) NOUVEAU(0): Manufacturer: SAM  Model: 4e7  Serial#: 1297691186
[  6151.970] (II) NOUVEAU(0): Year: 2009  Week: 14
[  6151.970] (II) NOUVEAU(0): EDID Version: 1.3
[  6151.970] (II) NOUVEAU(0): Digital Display Input
[  6151.970] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 48  vert.: 27
[  6151.970] (II) NOUVEAU(0): Gamma: 2.20
[  6151.970] (II) NOUVEAU(0): DPMS capabilities: Off
[  6151.970] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[  6151.971] (II) NOUVEAU(0): First detailed timing is preferred mode
[  6151.971] (II) NOUVEAU(0): redX: 0.649 redY: 0.335   greenX: 0.283 greenY: 0.605
[  6151.971] (II) NOUVEAU(0): blueX: 0.151 blueY: 0.073   whiteX: 0.312 whiteY: 0.329
[  6151.971] (II) NOUVEAU(0): Supported established timings:
[  6151.971] (II) NOUVEAU(0): 640x480@60Hz
[  6151.971] (II) NOUVEAU(0): 800x600@56Hz
[  6151.971] (II) NOUVEAU(0): 800x600@60Hz
[  6151.971] (II) NOUVEAU(0): 1024x768@60Hz
[  6151.971] (II) NOUVEAU(0): Manufacturer's mask: 0
[  6151.971] (II) NOUVEAU(0): Supported standard timings:
[  6151.971] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid: 129
[  6151.971] (II) NOUVEAU(0): #1: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[  6151.971] (II) NOUVEAU(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[  6151.971] (II) NOUVEAU(0): #3: hsize: 1440  vsize 900  refresh: 60  vid: 149
[  6151.971] (II) NOUVEAU(0): #4: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[  6151.971] (II) NOUVEAU(0): #5: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[  6151.971] (II) NOUVEAU(0): Supported detailed timing:
[  6151.971] (II) NOUVEAU(0): clock: 138.5 MHz   Image Size:  477 x 268 mm
[  6151.971] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[  6151.971] (II) NOUVEAU(0): v_active: 1080  v_sync: 1083  v_sync_end 1088 v_blanking: 1111 v_border: 0
[  6151.971] (II) NOUVEAU(0): Ranges: V min: 56 V max: 61 Hz, H min: 30 H max: 75 kHz, PixClock max 175 MHz
[  6151.971] (II) NOUVEAU(0): Monitor name: SyncMaster
[  6151.971] (II) NOUVEAU(0): Serial No: H9NS400521
[  6151.971] (II) NOUVEAU(0): EDID (in hex):
[  6151.971] (II) NOUVEAU(0): 	00ffffffffffff004c2de7043232594d
[  6151.971] (II) NOUVEAU(0): 	0e13010380301b782a78f1a655489b26
[  6151.971] (II) NOUVEAU(0): 	1250542308008100814081809500b300
[  6151.971] (II) NOUVEAU(0): 	a940010101011a3680a070381f403020
[  6151.971] (II) NOUVEAU(0): 	3500dd0c1100001a000000fd00383d1e
[  6151.971] (II) NOUVEAU(0): 	4b11000a202020202020000000fc0053
[  6151.971] (II) NOUVEAU(0): 	796e634d61737465720a2020000000ff
[  6151.971] (II) NOUVEAU(0): 	0048394e533430303532310a20200094
[  6151.971] (II) NOUVEAU(0): Printing probed modes for output DVI-D-1
[  6151.971] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[  6151.971] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[  6151.971] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[  6151.972] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[  6151.972] (II) NOUVEAU(0): EDID for output TV-1
[  6151.972] (II) NOUVEAU(0): Output VGA-1 disconnected
[  6151.972] (II) NOUVEAU(0): Output VGA-2 disconnected
[  6151.972] (II) NOUVEAU(0): Output DVI-D-1 connected
[  6151.972] (II) NOUVEAU(0): Output TV-1 disconnected
[  6151.972] (II) NOUVEAU(0): Using exact sizes for initial modes
[  6151.972] (II) NOUVEAU(0): Output DVI-D-1 using initial mode 1920x1080
[  6151.972] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[  6151.972] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1920x1080": 138.5 MHz (scaled from 0.0 MHz), 66.6 kHz, 59.9 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from 0.0 MHz), 49.7 kHz, 59.8 Hz
[  6151.972] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[  6151.972] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[  6151.973] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  6151.973] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[  6151.973] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  6151.973] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[  6151.973] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[  6151.973] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[  6151.973] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[  6151.973] (==) NOUVEAU(0): DPI set to (96, 96)
[  6151.973] (II) Loading sub module "fb"
[  6151.973] (II) LoadModule: "fb"
[  6151.973] (II) Loading /usr/lib/xorg/modules/libfb.so
[  6151.974] (II) Module fb: vendor="X.Org Foundation"
[  6151.974] 	compiled for 1.10.2, module version = 1.0.0
[  6151.974] 	ABI class: X.Org ANSI C Emulation, version 0.4
[  6151.974] (II) Loading sub module "exa"
[  6151.974] (II) LoadModule: "exa"
[  6151.974] (II) Loading /usr/lib/xorg/modules/libexa.so
[  6151.974] (II) Module exa: vendor="X.Org Foundation"
[  6151.974] 	compiled for 1.10.2, module version = 2.5.0
[  6151.974] 	ABI class: X.Org Video Driver, version 10.0
[  6151.974] (II) Loading sub module "shadowfb"
[  6151.974] (II) LoadModule: "shadowfb"
[  6151.974] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[  6151.974] (II) Module shadowfb: vendor="X.Org Foundation"
[  6151.974] 	compiled for 1.10.2, module version = 1.0.0
[  6151.974] 	ABI class: X.Org ANSI C Emulation, version 0.4
[  6151.974] (--) Depth 24 pixmap format is 32 bpp
[  6151.976] (II) NOUVEAU(0): Opened GPU channel 1
[  6151.976] (II) NOUVEAU(0): [DRI2] Setup complete
[  6151.976] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[  6151.977] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
[  6151.977] 
Fatal server error:
[  6151.977] AddScreen/ScreenInit failed for driver 0
[  6151.977] 
[  6151.977] 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
[  6151.977] Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[  6151.977] 



[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 3.0.0-rc5+ ($USER@$HOST) (gcc version 4.6.1 (Debian 4.6.1-1) ) #28 Thu Jun 30 22:21:23 EDT 2011
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
[    0.000000]  BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000007dff0000 (usable)
[    0.000000]  BIOS-e820: 000000007dff0000 - 000000007dff3000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007dff3000 - 000000007e000000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec01000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
[    0.000000] Notice: NX (Execute Disable) protection missing in CPU!
[    0.000000] DMI 2.2 present.
[    0.000000] DMI:    /FN41 , BIOS 6.00 PG 08/23/2004
[    0.000000] e820 update range: 0000000000000000 - 0000000000001000 (usable) ==> (reserved)
[    0.000000] e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
[    0.000000] last_pfn = 0x7dff0 max_arch_pfn = 0x100000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-AFFFF uncachable
[    0.000000]   B0000-BFFFF write-combining
[    0.000000]   C0000-C7FFF write-protect
[    0.000000]   C8000-FFFFF uncachable
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask F80000000 write-back
[    0.000000]   1 base 07E000000 mask FFE000000 uncachable
[    0.000000]   2 base 0E0000000 mask FFC000000 write-combining
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] initial memory mapped : 0 - 01800000
[    0.000000] Base memory trampoline at [c009c000] 9c000 size 12288
[    0.000000] init_memory_mapping: 0000000000000000-00000000377fe000
[    0.000000]  0000000000 - 0000400000 page 4k
[    0.000000]  0000400000 - 0037400000 page 2M
[    0.000000]  0037400000 - 00377fe000 page 4k
[    0.000000] kernel direct mapping tables up to 377fe000 @ 17fb000-1800000
[    0.000000] ACPI: RSDP 000f6e60 00014 (v00 Nvidia)
[    0.000000] ACPI: RSDT 7dff3000 0002C (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] ACPI: FACP 7dff3040 00074 (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] ACPI: DSDT 7dff30c0 04139 (v01 NVIDIA AWRDACPI 00001000 MSFT 0100000D)
[    0.000000] ACPI: FACS 7dff0000 00040
[    0.000000] ACPI: APIC 7dff7200 0005A (v01 Nvidia AWRDACPI 42302E31 AWRD 00000000)
[    0.000000] 1127MB HIGHMEM available.
[    0.000000] 887MB LOWMEM available.
[    0.000000]   mapped low ram: 0 - 377fe000
[    0.000000]   low ram: 0 - 377fe000
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000001 -> 0x00001000
[    0.000000]   Normal   0x00001000 -> 0x000377fe
[    0.000000]   HighMem  0x000377fe -> 0x0007dff0
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[2] active PFN ranges
[    0.000000]     0: 0x00000001 -> 0x000000a0
[    0.000000]     0: 0x00000100 -> 0x0007dff0
[    0.000000] On node 0 totalpages: 515983
[    0.000000] free_area_init_node: node 0, pgdat c137ebfc, node_mem_map f683d020
[    0.000000]   DMA zone: 32 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 3967 pages, LIFO batch:0
[    0.000000]   Normal zone: 1744 pages used for memmap
[    0.000000]   Normal zone: 221486 pages, LIFO batch:31
[    0.000000]   HighMem zone: 2256 pages used for memmap
[    0.000000]   HighMem zone: 286498 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x4008
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000f0000
[    0.000000] PM: Registered nosave memory: 00000000000f0000 - 0000000000100000
[    0.000000] Allocating PCI resources starting at 7e000000 (gap: 7e000000:80c00000)
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 511951
[    0.000000] Kernel command line: auto BOOT_IMAGE=2.6 ro root=302
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] Initializing HighMem for node 0 (000377fe:0007dff0)
[    0.000000] Memory: 2042716k/2064320k available (2377k kernel code, 21216k reserved, 1221k data, 288k init, 1155016k highmem)
[    0.000000] virtual kernel memory layout:
[    0.000000]     fixmap  : 0xfffe4000 - 0xfffff000   ( 108 kB)
[    0.000000]     pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
[    0.000000]     vmalloc : 0xf7ffe000 - 0xff7fe000   ( 120 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf77fe000   ( 887 MB)
[    0.000000]       .init : 0xc1384000 - 0xc13cc000   ( 288 kB)
[    0.000000]       .data : 0xc1252719 - 0xc1383cc0   (1221 kB)
[    0.000000]       .text : 0xc1000000 - 0xc1252719   (2377 kB)
[    0.000000] Checking if this processor honours the WP bit even in supervisor mode...Ok.
[    0.000000] SLUB: Genslabs=15, HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] NR_IRQS:16
[    0.000000] CPU 0 irqstacks, hard=f6008000 soft=f600a000
[    0.000000] Console: colour VGA+ 80x50
[    0.000000] console [tty0] enabled
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 1469.752 MHz processor.
[    0.006670] Calibrating delay loop (skipped), value calculated using timer frequency.. 2940.98 BogoMIPS (lpj=4899173)
[    0.006747] pid_max: default: 32768 minimum: 301
[    0.006838] Mount-cache hash table entries: 512
[    0.010167] Initializing cgroup subsys blkio
[    0.010248] mce: CPU supports 4 MCE banks
[    0.010303] CPU: AMD Athlon(tm) XP 1700+ stepping 02
[    0.010411] ACPI: Core revision 20110413
[    0.013906] ACPI: setting ELCR to 0200 (from 1c28)
[    0.014732] Performance Events: AMD PMU driver.
[    0.014792] ... version:                0
[    0.014828] ... bit width:              48
[    0.014863] ... generic registers:      4
[    0.014899] ... value mask:             0000ffffffffffff
[    0.014936] ... max period:             00007fffffffffff
[    0.014973] ... fixed-purpose events:   0
[    0.015008] ... event mask:             000000000000000f
[    0.015190] NMI watchdog enabled, takes one hw-pmu counter.
[    0.015550] PM: Registering ACPI NVS region at 7dff0000 (12288 bytes)
[    0.015705] xor: automatically using best checksumming function: pIII_sse
[    0.030004]    pIII_sse  :  4162.800 MB/sec
[    0.030041] xor: using function: pIII_sse (4162.800 MB/sec)
[    0.030130] NET: Registered protocol family 16
[    0.030671] ACPI: bus type pci registered
[    0.066450] PCI: PCI BIOS revision 2.10 entry at 0xfb760, last bus=4
[    0.066492] PCI: Using configuration type 1 for base access
[    0.072277] bio: create slab <bio-0> at 0
[    0.126710] raid6: int32x1    530 MB/s
[    0.183440] raid6: int32x2    448 MB/s
[    0.240005] raid6: int32x4    457 MB/s
[    0.296725] raid6: int32x8    379 MB/s
[    0.353355] raid6: mmxx1     1204 MB/s
[    0.409979] raid6: mmxx2     2116 MB/s
[    0.466666] raid6: sse1x1    1151 MB/s
[    0.523318] raid6: sse1x2    1900 MB/s
[    0.523354] raid6: using algorithm sse1x2 (1900 MB/s)
[    0.524838] ACPI: EC: Look up EC in DSDT
[    0.529219] ACPI: Interpreter enabled
[    0.529262] ACPI: (supports S0 S1 S4 S5)
[    0.529390] ACPI: Using PIC for interrupt routing
[    0.540186] PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=use_crs" and report a bug
[    0.540357] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.540609] pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7] (ignored)
[    0.540615] pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff] (ignored)
[    0.540620] pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff] (ignored)
[    0.540625] pci_root PNP0A03:00: host bridge window [mem 0x000c0000-0x000dffff] (ignored)
[    0.540630] pci_root PNP0A03:00: host bridge window [mem 0x7e000000-0xfebfffff] (ignored)
[    0.540651] pci 0000:00:00.0: [10de:01e0] type 0 class 0x000600
[    0.540663] pci 0000:00:00.0: reg 10: [mem 0xe0000000-0xe3ffffff pref]
[    0.540710] pci 0000:00:00.1: [10de:01eb] type 0 class 0x000500
[    0.540751] pci 0000:00:00.2: [10de:01ee] type 0 class 0x000500
[    0.540792] pci 0000:00:00.3: [10de:01ed] type 0 class 0x000500
[    0.540830] pci 0000:00:00.4: [10de:01ec] type 0 class 0x000500
[    0.540870] pci 0000:00:00.5: [10de:01ef] type 0 class 0x000500
[    0.540916] pci 0000:00:01.0: [10de:0060] type 0 class 0x000601
[    0.541001] pci 0000:00:01.1: [10de:0064] type 0 class 0x000c05
[    0.541018] pci 0000:00:01.1: reg 10: [io  0xc400-0xc41f]
[    0.541075] pci 0000:00:01.1: PME# supported from D3hot D3cold
[    0.541082] pci 0000:00:01.1: PME# disabled
[    0.541107] pci 0000:00:02.0: [10de:0067] type 0 class 0x000c03
[    0.541124] pci 0000:00:02.0: reg 10: [mem 0xef080000-0xef080fff]
[    0.541180] pci 0000:00:02.0: supports D1 D2
[    0.541184] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541190] pci 0000:00:02.0: PME# disabled
[    0.541211] pci 0000:00:02.1: [10de:0067] type 0 class 0x000c03
[    0.541228] pci 0000:00:02.1: reg 10: [mem 0xef083000-0xef083fff]
[    0.541284] pci 0000:00:02.1: supports D1 D2
[    0.541288] pci 0000:00:02.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541294] pci 0000:00:02.1: PME# disabled
[    0.541315] pci 0000:00:02.2: [10de:0068] type 0 class 0x000c03
[    0.541334] pci 0000:00:02.2: reg 10: [mem 0xef086000-0xef0860ff]
[    0.541397] pci 0000:00:02.2: supports D1 D2
[    0.541401] pci 0000:00:02.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541408] pci 0000:00:02.2: PME# disabled
[    0.541434] pci 0000:00:04.0: [10de:0066] type 0 class 0x000200
[    0.541451] pci 0000:00:04.0: reg 10: [mem 0xef087000-0xef087fff]
[    0.541462] pci 0000:00:04.0: reg 14: [io  0xb000-0xb007]
[    0.541512] pci 0000:00:04.0: supports D1 D2
[    0.541516] pci 0000:00:04.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541522] pci 0000:00:04.0: PME# disabled
[    0.541541] pci 0000:00:05.0: [10de:006b] type 0 class 0x000401
[    0.541557] pci 0000:00:05.0: reg 10: [mem 0xef000000-0xef07ffff]
[    0.541614] pci 0000:00:05.0: supports D1 D2
[    0.541633] pci 0000:00:06.0: [10de:006a] type 0 class 0x000401
[    0.541649] pci 0000:00:06.0: reg 10: [io  0xb400-0xb4ff]
[    0.541660] pci 0000:00:06.0: reg 14: [io  0xb800-0xb87f]
[    0.541671] pci 0000:00:06.0: reg 18: [mem 0xef081000-0xef081fff]
[    0.541715] pci 0000:00:06.0: supports D1 D2
[    0.541732] pci 0000:00:08.0: [10de:006c] type 1 class 0x000604
[    0.541774] pci 0000:00:09.0: [10de:0065] type 0 class 0x000101
[    0.541816] pci 0000:00:09.0: reg 20: [io  0xf000-0xf00f]
[    0.541865] pci 0000:00:0d.0: [10de:006e] type 0 class 0x000c00
[    0.541882] pci 0000:00:0d.0: reg 10: [mem 0xef084000-0xef0847ff]
[    0.541894] pci 0000:00:0d.0: reg 14: [mem 0xef085000-0xef08503f]
[    0.541944] pci 0000:00:0d.0: supports D1 D2
[    0.541948] pci 0000:00:0d.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.541954] pci 0000:00:0d.0: PME# disabled
[    0.541985] pci 0000:00:1e.0: [10de:01e8] type 1 class 0x000604
[    0.542045] pci 0000:01:06.0: [1180:0476] type 2 class 0x000607
[    0.542067] pci 0000:01:06.0: reg 10: [mem 0xee000000-0xee000fff]
[    0.542090] pci 0000:01:06.0: supports D1 D2
[    0.542094] pci 0000:01:06.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542101] pci 0000:01:06.0: PME# disabled
[    0.542124] pci 0000:01:06.1: [1180:0476] type 2 class 0x000607
[    0.542146] pci 0000:01:06.1: reg 10: [mem 0xee005000-0xee005fff]
[    0.542168] pci 0000:01:06.1: supports D1 D2
[    0.542172] pci 0000:01:06.1: PME# supported from D0 D1 D2 D3hot D3cold
[    0.542179] pci 0000:01:06.1: PME# disabled
[    0.542232] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.542274] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.542280] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.542287] pci 0000:00:08.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
[    0.542371] pci_bus 0000:03: [bus 03-06] partially hidden behind bridge 0000:01 [bus 01-03]
[    0.542448] pci 0000:04:00.0: [10de:01f0] type 0 class 0x000300
[    0.542465] pci 0000:04:00.0: reg 10: [mem 0xec000000-0xecffffff]
[    0.542476] pci 0000:04:00.0: reg 14: [mem 0xe4000000-0xe7ffffff pref]
[    0.542486] pci 0000:04:00.0: reg 18: [mem 0xe8000000-0xe807ffff pref]
[    0.542514] pci 0000:04:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
[    0.542565] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.542605] pci 0000:00:1e.0:   bridge window [io  0xf000-0x0000] (disabled)
[    0.542611] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.542617] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.542630] pci_bus 0000:00: on NUMA node 0
[    0.542636] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.542825] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.HUB0._PRT]
[    0.542893] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGPB._PRT]
[    0.543008]  pci0000:00: Unable to request _OSC control (_OSC support mask: 0x08)
[    0.584692] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.585055] ACPI: PCI Interrupt Link [LNK2] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.585411] ACPI: PCI Interrupt Link [LNK3] (IRQs *3 4 5 6 7 10 11 12 14 15)
[    0.585721] ACPI: PCI Interrupt Link [LNK4] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.586029] ACPI: PCI Interrupt Link [LNK5] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.586336] ACPI: PCI Interrupt Link [LUBA] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.586744] ACPI: PCI Interrupt Link [LUBB] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.587055] ACPI: PCI Interrupt Link [LMAC] (IRQs 3 4 5 6 7 10 *11 12 14 15)
[    0.587364] ACPI: PCI Interrupt Link [LAPU] (IRQs 3 4 *5 6 7 10 11 12 14 15)
[    0.587673] ACPI: PCI Interrupt Link [LACI] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.587980] ACPI: PCI Interrupt Link [LMCI] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588333] ACPI: PCI Interrupt Link [LSMB] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.588689] ACPI: PCI Interrupt Link [LUB2] (IRQs 3 4 5 6 7 10 11 *12 14 15)
[    0.588998] ACPI: PCI Interrupt Link [LFIR] (IRQs 3 4 5 6 7 *10 11 12 14 15)
[    0.589305] ACPI: PCI Interrupt Link [L3CM] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.589658] ACPI: PCI Interrupt Link [LIDE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
[    0.590062] ACPI: PCI Interrupt Link [APC1] (IRQs *16), disabled.
[    0.590232] ACPI: PCI Interrupt Link [APC2] (IRQs *17), disabled.
[    0.590399] ACPI: PCI Interrupt Link [APC3] (IRQs *18)
[    0.590547] ACPI: PCI Interrupt Link [APC4] (IRQs *19)
[    0.590704] ACPI: PCI Interrupt Link [APCE] (IRQs *16)
[    0.590897] ACPI: PCI Interrupt Link [APCF] (IRQs 20 21 22) *0, disabled.
[    0.591154] ACPI: PCI Interrupt Link [APCG] (IRQs 20 21 22) *0
[    0.591391] ACPI: PCI Interrupt Link [APCH] (IRQs 20 21 22) *0
[    0.591627] ACPI: PCI Interrupt Link [APCI] (IRQs 20 21 22) *0
[    0.591875] ACPI: PCI Interrupt Link [APCJ] (IRQs 20 21 22) *0
[    0.592112] ACPI: PCI Interrupt Link [APCK] (IRQs 20 21 22) *0, disabled.
[    0.592332] ACPI: PCI Interrupt Link [APCS] (IRQs *23), disabled.
[    0.592534] ACPI: PCI Interrupt Link [APCL] (IRQs 20 21 22) *0
[    0.592771] ACPI: PCI Interrupt Link [APCM] (IRQs 20 21 22) *0
[    0.593016] ACPI: PCI Interrupt Link [AP3C] (IRQs 20 21 22) *0, disabled.
[    0.593273] ACPI: PCI Interrupt Link [APCZ] (IRQs 20 21 22) *0, disabled.
[    0.593738] vgaarb: device added: PCI:0000:04:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.593793] vgaarb: loaded
[    0.593826] vgaarb: bridge control possible 0000:04:00.0
[    0.594124] SCSI subsystem initialized
[    0.594332] usbcore: registered new interface driver usbfs
[    0.594484] usbcore: registered new interface driver hub
[    0.594596] usbcore: registered new device driver usb
[    0.594984] Advanced Linux Sound Architecture Driver Version 1.0.24.
[    0.595087] PCI: Using ACPI for IRQ routing
[    0.595133] PCI: pci_cache_line_size set to 32 bytes
[    0.595217] reserve RAM buffer: 000000007dff0000 - 000000007fffffff 
[    0.595463] Switching to clocksource pit
[    0.595613] pnp: PnP ACPI init
[    0.595658] ACPI: bus type pnp registered
[    0.596042] pnp 00:00: [io  0x4000-0x407f]
[    0.596047] pnp 00:00: [io  0x4080-0x40ff]
[    0.596051] pnp 00:00: [io  0x4400-0x447f]
[    0.596055] pnp 00:00: [io  0x4480-0x44ff]
[    0.596059] pnp 00:00: [io  0x4200-0x427f]
[    0.596062] pnp 00:00: [io  0x4280-0x42ff]
[    0.596177] system 00:00: [io  0x4000-0x407f] has been reserved
[    0.596220] system 00:00: [io  0x4080-0x40ff] has been reserved
[    0.596261] system 00:00: [io  0x4400-0x447f] has been reserved
[    0.596301] system 00:00: [io  0x4480-0x44ff] has been reserved
[    0.596341] system 00:00: [io  0x4200-0x427f] has been reserved
[    0.596628] system 00:00: [io  0x4280-0x42ff] has been reserved
[    0.596628] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.596628] pnp 00:01: [io  0x5000-0x503f]
[    0.596628] pnp 00:01: [io  0x5100-0x513f]
[    0.596628] system 00:01: [io  0x5000-0x503f] has been reserved
[    0.596628] system 00:01: [io  0x5100-0x513f] has been reserved
[    0.596628] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.596628] system 00:02: Plug and Play ACPI device, IDs PNP0c01 (active)
[    0.596658] pnp 00:03: [bus 00-ff]
[    0.596663] pnp 00:03: [io  0x0cf8-0x0cff]
[    0.596668] pnp 00:03: [io  0x0000-0x0cf7 window]
[    0.596672] pnp 00:03: [io  0x0d00-0xffff window]
[    0.596676] pnp 00:03: [mem 0x000a0000-0x000bffff window]
[    0.596681] pnp 00:03: [mem 0x000c0000-0x000dffff window]
[    0.596685] pnp 00:03: [mem 0x7e000000-0xfebfffff window]
[    0.596814] pnp 00:03: Plug and Play ACPI device, IDs PNP0a03 (active)
[    0.597502] pnp 00:04: [io  0x0010-0x001f]
[    0.597507] pnp 00:04: [io  0x0022-0x003f]
[    0.597511] pnp 00:04: [io  0x0044-0x005f]
[    0.597515] pnp 00:04: [io  0x0062-0x0063]
[    0.597519] pnp 00:04: [io  0x0065-0x006f]
[    0.597522] pnp 00:04: [io  0x0074-0x007f]
[    0.597526] pnp 00:04: [io  0x0091-0x0093]
[    0.597530] pnp 00:04: [io  0x00a2-0x00bf]
[    0.597533] pnp 00:04: [io  0x00e0-0x00ef]
[    0.597537] pnp 00:04: [io  0x04d0-0x04d1]
[    0.597541] pnp 00:04: [io  0x0800-0x0805]
[    0.597545] pnp 00:04: [io  0x0290-0x0297]
[    0.597669] system 00:04: [io  0x04d0-0x04d1] has been reserved
[    0.597713] system 00:04: [io  0x0800-0x0805] has been reserved
[    0.597812] system 00:04: [io  0x0290-0x0297] has been reserved
[    0.597854] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (active)
[    0.597878] pnp 00:05: [dma 4]
[    0.597882] pnp 00:05: [io  0x0000-0x000f]
[    0.597886] pnp 00:05: [io  0x0080-0x0090]
[    0.597890] pnp 00:05: [io  0x0094-0x009f]
[    0.597894] pnp 00:05: [io  0x00c0-0x00df]
[    0.597985] pnp 00:05: Plug and Play ACPI device, IDs PNP0200 (active)
[    0.598007] pnp 00:06: [io  0x0070-0x0073]
[    0.598012] pnp 00:06: [irq 8]
[    0.598101] pnp 00:06: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.598120] pnp 00:07: [io  0x0061]
[    0.598208] pnp 00:07: Plug and Play ACPI device, IDs PNP0800 (active)
[    0.598227] pnp 00:08: [io  0x00f0-0x00ff]
[    0.598232] pnp 00:08: [irq 13]
[    0.598321] pnp 00:08: Plug and Play ACPI device, IDs PNP0c04 (active)
[    0.598573] pnp 00:09: [io  0x03f0-0x03f5]
[    0.598578] pnp 00:09: [io  0x03f7]
[    0.598582] pnp 00:09: [irq 6]
[    0.598586] pnp 00:09: [dma 2]
[    0.598709] pnp 00:09: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.599022] pnp 00:0a: [io  0x03f8-0x03ff]
[    0.599027] pnp 00:0a: [irq 4]
[    0.599176] pnp 00:0a: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.599969] pnp 00:0b: [io  0x0378-0x037f]
[    0.599974] pnp 00:0b: [io  0x0778-0x077b]
[    0.599979] pnp 00:0b: [irq 7]
[    0.599983] pnp 00:0b: [dma 3]
[    0.600143] pnp 00:0b: Plug and Play ACPI device, IDs PNP0401 (active)
[    0.600237] pnp: PnP ACPI: found 12 devices
[    0.600277] ACPI: ACPI bus type pnp unregistered
[    0.640286] Switching to clocksource acpi_pm
[    0.640364] PCI: max bus depth: 2 pci_try_num: 3
[    0.640407] pci 0000:00:08.0: BAR 9: assigned [mem 0x80000000-0x87ffffff pref]
[    0.640463] pci 0000:01:06.0: BAR 9: assigned [mem 0x80000000-0x83ffffff pref]
[    0.640517] pci 0000:01:06.0: BAR 10: can't assign mem (size 0x4000000)
[    0.640560] pci 0000:01:06.1: BAR 9: assigned [mem 0x84000000-0x87ffffff pref]
[    0.640613] pci 0000:01:06.1: BAR 10: can't assign mem (size 0x4000000)
[    0.640655] pci 0000:01:06.0: BAR 7: assigned [io  0x9000-0x90ff]
[    0.640696] pci 0000:01:06.0: BAR 8: assigned [io  0x9400-0x94ff]
[    0.640737] pci 0000:01:06.1: BAR 7: assigned [io  0x9800-0x98ff]
[    0.640777] pci 0000:01:06.1: BAR 8: assigned [io  0x9c00-0x9cff]
[    0.640818] pci 0000:01:06.0: CardBus bridge to [bus 02-02]
[    0.640858] pci 0000:01:06.0:   bridge window [io  0x9000-0x90ff]
[    0.640901] pci 0000:01:06.0:   bridge window [io  0x9400-0x94ff]
[    0.640944] pci 0000:01:06.0:   bridge window [mem 0x80000000-0x83ffffff pref]
[    0.641000] pci 0000:01:06.1: CardBus bridge to [bus 03-06]
[    0.641039] pci 0000:01:06.1:   bridge window [io  0x9800-0x98ff]
[    0.641104] Switched to NOHz mode on CPU #0
[    0.641151] pci 0000:01:06.1:   bridge window [io  0x9c00-0x9cff]
[    0.641194] pci 0000:01:06.1:   bridge window [mem 0x84000000-0x87ffffff pref]
[    0.641249] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.641289] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.641332] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.641376] pci 0000:00:08.0:   bridge window [mem 0x80000000-0x87ffffff pref]
[    0.641445] pci 0000:04:00.0: BAR 6: assigned [mem 0xe8080000-0xe809ffff pref]
[    0.641499] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.641537] pci 0000:00:1e.0:   bridge window [io  disabled]
[    0.641578] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.641621] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.641676] PCI: No. 2 try to assign unassigned res
[    0.641693] pci 0000:01:06.0: BAR 10: can't assign mem (size 0x4000000)
[    0.641736] pci 0000:01:06.1: BAR 10: can't assign mem (size 0x4000000)
[    0.641777] pci 0000:01:06.0: CardBus bridge to [bus 02-02]
[    0.641816] pci 0000:01:06.0:   bridge window [io  0x0000-0x00ff]
[    0.641859] pci 0000:01:06.0:   bridge window [io  0x0000-0x00ff]
[    0.641902] pci 0000:01:06.0:   bridge window [mem 0x00000000-0x03ffffff pref]
[    0.641957] pci 0000:01:06.1: CardBus bridge to [bus 03-06]
[    0.641995] pci 0000:01:06.1:   bridge window [io  0x0000-0x00ff]
[    0.642038] pci 0000:01:06.1:   bridge window [io  0x0000-0x00ff]
[    0.642081] pci 0000:01:06.1:   bridge window [mem 0x00000000-0x03ffffff pref]
[    0.642136] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.642175] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.642218] pci 0000:00:08.0:   bridge window [mem 0xee000000-0xeeffffff]
[    0.642261] pci 0000:00:08.0:   bridge window [mem 0x80000000-0x87ffffff pref]
[    0.642318] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.642356] pci 0000:00:1e.0:   bridge window [io  disabled]
[    0.642397] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.642440] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.642495] PCI: No. 3 try to assign unassigned res
[    0.642499] release child resource [mem 0xee000000-0xee000fff]
[    0.642503] release child resource [mem 0xee005000-0xee005fff]
[    0.642508] pci 0000:00:08.0: resource 8 [mem 0xee000000-0xeeffffff] released
[    0.642513] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.642551] pci 0000:00:08.0:   bridge window [mem disabled]
[    0.642604] pci 0000:00:08.0: BAR 8: assigned [mem 0x88000000-0x91ffffff]
[    0.642648] pci 0000:01:06.0: BAR 10: assigned [mem 0x88000000-0x8bffffff]
[    0.642690] pci 0000:01:06.1: BAR 10: assigned [mem 0x8c000000-0x8fffffff]
[    0.642733] pci 0000:01:06.0: BAR 0: assigned [mem 0x90000000-0x90000fff]
[    0.642779] pci 0000:01:06.0: BAR 0: set to [mem 0x90000000-0x90000fff] (PCI address [0x90000000-0x90000fff])
[    0.642837] pci 0000:01:06.1: BAR 0: assigned [mem 0x90001000-0x90001fff]
[    0.642882] pci 0000:01:06.1: BAR 0: set to [mem 0x90001000-0x90001fff] (PCI address [0x90001000-0x90001fff])
[    0.642940] pci 0000:01:06.0: CardBus bridge to [bus 02-02]
[    0.642979] pci 0000:01:06.0:   bridge window [io  0x0000-0x00ff]
[    0.643021] pci 0000:01:06.0:   bridge window [io  0x0000-0x00ff]
[    0.643064] pci 0000:01:06.0:   bridge window [mem 0x00000000-0x03ffffff pref]
[    0.643119] pci 0000:01:06.0:   bridge window [mem 0x88000000-0x8bffffff]
[    0.643163] pci 0000:01:06.1: CardBus bridge to [bus 03-06]
[    0.643202] pci 0000:01:06.1:   bridge window [io  0x0000-0x00ff]
[    0.643244] pci 0000:01:06.1:   bridge window [io  0x0000-0x00ff]
[    0.643287] pci 0000:01:06.1:   bridge window [mem 0x00000000-0x03ffffff pref]
[    0.643365] pci 0000:01:06.1:   bridge window [mem 0x8c000000-0x8fffffff]
[    0.643409] pci 0000:00:08.0: PCI bridge to [bus 01-03]
[    0.643449] pci 0000:00:08.0:   bridge window [io  0x9000-0xafff]
[    0.643492] pci 0000:00:08.0:   bridge window [mem 0x88000000-0x91ffffff]
[    0.643535] pci 0000:00:08.0:   bridge window [mem 0x80000000-0x87ffffff pref]
[    0.643592] pci 0000:00:1e.0: PCI bridge to [bus 04-04]
[    0.643630] pci 0000:00:1e.0:   bridge window [io  disabled]
[    0.643671] pci 0000:00:1e.0:   bridge window [mem 0xec000000-0xedffffff]
[    0.643714] pci 0000:00:1e.0:   bridge window [mem 0xe4000000-0xebffffff pref]
[    0.643780] pci 0000:00:08.0: setting latency timer to 64
[    0.643986] ACPI: PCI Interrupt Link [LNK3] enabled at IRQ 3
[    0.644027] PCI: setting IRQ 3 as level-triggered
[    0.644036] pci 0000:01:06.0: PCI INT A -> Link[LNK3] -> GSI 3 (level, low) -> IRQ 3
[    0.644197] ACPI: PCI Interrupt Link [LNK4] enabled at IRQ 11
[    0.644237] PCI: setting IRQ 11 as level-triggered
[    0.644245] pci 0000:01:06.1: PCI INT B -> Link[LNK4] -> GSI 11 (level, low) -> IRQ 11
[    0.644307] pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
[    0.644312] pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffff]
[    0.644317] pci_bus 0000:01: resource 0 [io  0x9000-0xafff]
[    0.644322] pci_bus 0000:01: resource 1 [mem 0x88000000-0x91ffffff]
[    0.644327] pci_bus 0000:01: resource 2 [mem 0x80000000-0x87ffffff pref]
[    0.644332] pci_bus 0000:02: resource 0 [io  0x0000-0x00ff]
[    0.644336] pci_bus 0000:02: resource 1 [io  0x0000-0x00ff]
[    0.644341] pci_bus 0000:02: resource 2 [mem 0x00000000-0x03ffffff pref]
[    0.644346] pci_bus 0000:02: resource 3 [mem 0x88000000-0x8bffffff]
[    0.644351] pci_bus 0000:03: resource 0 [io  0x0000-0x00ff]
[    0.644355] pci_bus 0000:03: resource 1 [io  0x0000-0x00ff]
[    0.644360] pci_bus 0000:03: resource 2 [mem 0x00000000-0x03ffffff pref]
[    0.644365] pci_bus 0000:03: resource 3 [mem 0x8c000000-0x8fffffff]
[    0.644370] pci_bus 0000:04: resource 1 [mem 0xec000000-0xedffffff]
[    0.644374] pci_bus 0000:04: resource 2 [mem 0xe4000000-0xebffffff pref]
[    0.644444] NET: Registered protocol family 2
[    0.644553] IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
[    0.645055] TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.646660] TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
[    0.647202] TCP: Hash tables configured (established 131072 bind 65536)
[    0.647243] TCP reno registered
[    0.647283] UDP hash table entries: 512 (order: 1, 8192 bytes)
[    0.647337] UDP-Lite hash table entries: 512 (order: 1, 8192 bytes)
[    0.647577] NET: Registered protocol family 1
[    0.676746] pci 0000:04:00.0: Boot video device
[    0.676751] PCI: CLS 0 bytes, default 32
[    0.677383] Scanning for low memory corruption every 60 seconds
[    0.691571] highmem bounce pool size: 64 pages
[    0.691619] HugeTLB registered 4 MB page size, pre-allocated 0 pages
[    0.724469] msgmni has been set to 1733
[    0.724786] alg: No test for stdrng (krng)
[    0.724834] io scheduler noop registered
[    0.724870] io scheduler deadline registered
[    0.724925] io scheduler cfq registered (default)
[    0.725312] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.996767] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    1.017997] 00:0a: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    1.018489] Linux agpgart interface v0.103
[    1.018559] agpgart: Detected NVIDIA nForce2 chipset
[    1.024341] agpgart-nvidia 0000:00:00.0: AGP aperture is 64M @ 0xe0000000
[    1.024637] Floppy drive(s): fd0 is 1.44M
[    1.040181] FDC 0 is a post-1991 82077
[    1.041449] Uniform Multi-Platform E-IDE driver
[    1.041620] amd74xx 0000:00:09.0: UDMA133 controller
[    1.041662] amd74xx 0000:00:09.0: IDE controller (0x10de:0x0065 rev 0xa2)
[    1.041748] amd74xx 0000:00:09.0: BIOS didn't set cable bits correctly. Enabling workaround.
[    1.041805] amd74xx 0000:00:09.0: not 100% native mode: will probe irqs later
[    1.041851]     ide0: BM-DMA at 0xf000-0xf007
[    1.041895]     ide1: BM-DMA at 0xf008-0xf00f
[    1.041936] Probing IDE interface ide0...
[    1.316827] hda: ST3120022A, ATA DISK drive
[    1.680038] Refined TSC clocksource calibration: 1470.000 MHz.
[    1.680082] Switching to clocksource tsc
[    1.956759] hda: host max PIO5 wanted PIO255(auto-tune) selected PIO4
[    1.957030] hda: UDMA/100 mode selected
[    1.957317] Probing IDE interface ide1...
[    2.496769] ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
[    2.496859] ide1 at 0x170-0x177,0x376 on irq 15
[    2.497127] ide_generic: please use "probe_mask=0x3f" module parameter for probing all legacy ISA IDE ports
[    2.497185] ide-gd driver 1.18
[    2.497236] hda: max request size: 512KiB
[    2.506856] hda: 234441648 sectors (120034 MB) w/2048KiB Cache, CHS=16383/255/63
[    2.507096] hda: cache flushes supported
[    2.513859]  hda: hda1 hda2 hda3 hda4
[    2.514415] ide-cd driver 5.00
[    2.514533] forcedeth: Reverse Engineered nForce ethernet driver. Version 0.64.
[    2.516470] ACPI: PCI Interrupt Link [LMAC] enabled at IRQ 11
[    2.516517] forcedeth 0000:00:04.0: PCI INT A -> Link[LMAC] -> GSI 11 (level, low) -> IRQ 11
[    2.516576] forcedeth 0000:00:04.0: setting latency timer to 64
[    3.040738] forcedeth 0000:00:04.0: ifname eth0, PHY OUI 0x732 @ 1, addr 00:30:1b:ae:62:89
[    3.040800] forcedeth 0000:00:04.0: timirq lnktim desc-v1
[    3.041086] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.041313] ACPI: PCI Interrupt Link [LUB2] enabled at IRQ 12
[    3.041354] PCI: setting IRQ 12 as level-triggered
[    3.041363] ehci_hcd 0000:00:02.2: PCI INT C -> Link[LUB2] -> GSI 12 (level, low) -> IRQ 12
[    3.041436] ehci_hcd 0000:00:02.2: setting latency timer to 64
[    3.041442] ehci_hcd 0000:00:02.2: EHCI Host Controller
[    3.041594] ehci_hcd 0000:00:02.2: new USB bus registered, assigned bus number 1
[    3.041692] ehci_hcd 0000:00:02.2: debug port 1
[    3.041736] ehci_hcd 0000:00:02.2: cache line size of 32 is not supported
[    3.041752] ehci_hcd 0000:00:02.2: irq 12, io mem 0xef086000
[    3.050024] ehci_hcd 0000:00:02.2: USB 2.0 started, EHCI 1.00
[    3.050114] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    3.050156] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.050209] usb usb1: Product: EHCI Host Controller
[    3.050247] usb usb1: Manufacturer: Linux 3.0.0-rc5+ ehci_hcd
[    3.050285] usb usb1: SerialNumber: 0000:00:02.2
[    3.050518] hub 1-0:1.0: USB hub found
[    3.050561] hub 1-0:1.0: 6 ports detected
[    3.050795] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.051015] ACPI: PCI Interrupt Link [LUBA] enabled at IRQ 10
[    3.051056] PCI: setting IRQ 10 as level-triggered
[    3.051064] ohci_hcd 0000:00:02.0: PCI INT A -> Link[LUBA] -> GSI 10 (level, low) -> IRQ 10
[    3.051138] ohci_hcd 0000:00:02.0: setting latency timer to 64
[    3.051143] ohci_hcd 0000:00:02.0: OHCI Host Controller
[    3.051291] ohci_hcd 0000:00:02.0: new USB bus registered, assigned bus number 2
[    3.051372] ohci_hcd 0000:00:02.0: irq 10, io mem 0xef080000
[    3.105383] usb usb2: New USB device found, idVendor=1d6b, idProduct=0001
[    3.105426] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.105478] usb usb2: Product: OHCI Host Controller
[    3.105516] usb usb2: Manufacturer: Linux 3.0.0-rc5+ ohci_hcd
[    3.105555] usb usb2: SerialNumber: 0000:00:02.0
[    3.105785] hub 2-0:1.0: USB hub found
[    3.105828] hub 2-0:1.0: 3 ports detected
[    3.106158] ACPI: PCI Interrupt Link [LUBB] enabled at IRQ 5
[    3.106199] PCI: setting IRQ 5 as level-triggered
[    3.106207] ohci_hcd 0000:00:02.1: PCI INT B -> Link[LUBB] -> GSI 5 (level, low) -> IRQ 5
[    3.106280] ohci_hcd 0000:00:02.1: setting latency timer to 64
[    3.106285] ohci_hcd 0000:00:02.1: OHCI Host Controller
[    3.106421] ohci_hcd 0000:00:02.1: new USB bus registered, assigned bus number 3
[    3.106495] ohci_hcd 0000:00:02.1: irq 5, io mem 0xef083000
[    3.158713] usb usb3: New USB device found, idVendor=1d6b, idProduct=0001
[    3.158755] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.158808] usb usb3: Product: OHCI Host Controller
[    3.158845] usb usb3: Manufacturer: Linux 3.0.0-rc5+ ohci_hcd
[    3.158884] usb usb3: SerialNumber: 0000:00:02.1
[    3.159106] hub 3-0:1.0: USB hub found
[    3.159149] hub 3-0:1.0: 3 ports detected
[    3.159461] usbcore: registered new interface driver libusual
[    3.159730] i8042: PNP: No PS/2 controller found. Probing ports directly.
[    3.304502] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.304547] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.304936] mousedev: PS/2 mouse device common for all mice
[    3.305186] rtc_cmos 00:06: RTC can wake from S4
[    3.305396] rtc_cmos 00:06: rtc core: registered rtc_cmos as rtc0
[    3.305456] rtc0: alarms up to one year, y3k, 242 bytes nvram
[    3.305548] i2c /dev entries driver
[    3.356752] i2c i2c-0: nForce2 SMBus adapter at 0x5000
[    3.410048] i2c i2c-1: nForce2 SMBus adapter at 0x5100
[    3.410177] it87: Found IT8712F chip at 0x290, revision 5
[    3.410672] md: raid1 personality registered for level 1
[    3.410712] md: raid10 personality registered for level 10
[    3.410751] md: raid6 personality registered for level 6
[    3.410789] md: raid5 personality registered for level 5
[    3.410826] md: raid4 personality registered for level 4
[    3.410866] cpuidle: using governor ladder
[    3.410902] cpuidle: using governor menu
[    3.412545] usbcore: registered new interface driver usbhid
[    3.412585] usbhid: USB HID core driver
[    3.412993] ACPI: PCI Interrupt Link [LACI] enabled at IRQ 12
[    3.413040] Intel ICH 0000:00:06.0: PCI INT A -> Link[LACI] -> GSI 12 (level, low) -> IRQ 12
[    3.413137] Intel ICH 0000:00:06.0: setting latency timer to 64
[    3.650024] usb 2-1: new full speed USB device number 2 using ohci_hcd
[    3.730026] intel8x0_measure_ac97_clock: measured 52170 usecs (2536 samples)
[    3.730069] intel8x0: clocking to 47397
[    3.730725] ALSA device list:
[    3.730761]   #0: NVidia nForce2 with ALC650E at irq 12
[    3.731244] TCP cubic registered
[    3.731281] NET: Registered protocol family 17
[    3.731329] Registering the dns_resolver key type
[    3.732132] registered taskstats version 1
[    3.745838] rtc_cmos 00:06: setting system clock to 2011-07-01 02:31:19 UTC (1309487479)
[    3.803356] usb 2-1: New USB device found, idVendor=0430, idProduct=100e
[    3.803400] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    3.806431] hub 2-1:1.0: USB hub found
[    3.809340] hub 2-1:1.0: 4 ports detected
[    4.066693] usb 2-2: new low speed USB device number 3 using ohci_hcd
[    4.150211] md: Waiting for all devices to be available before autodetect
[    4.150253] md: If you don't use raid, use raid=noautodetect
[    4.150530] md: Autodetecting RAID arrays.
[    4.150568] md: Scanned 0 and added 0 devices.
[    4.150604] md: autorun ...
[    4.150637] md: ... autorun DONE.
[    4.162250] EXT3-fs: barriers not enabled
[    4.175774] kjournald starting.  Commit interval 5 seconds
[    4.175834] EXT3-fs (hda2): mounted filesystem with ordered data mode
[    4.175885] VFS: Mounted root (ext3 filesystem) readonly on device 3:2.
[    4.175978] Freeing unused kernel memory: 288k freed
[    4.221329] usb 2-2: New USB device found, idVendor=1241, idProduct=1166
[    4.221375] usb 2-2: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[    4.235892] input: HID 1241:1166 as /devices/pci0000:00/0000:00:02.0/usb2/2-2/2-2:1.0/input/input0
[    4.236141] generic-usb 0003:1241:1166.0001: input,hidraw0: USB HID v1.10 Mouse [HID 1241:1166] on usb-0000:00:02.0-2/input0
[    4.408312] usb 2-1.4: new full speed USB device number 4 using ohci_hcd
[    4.519305] usb 2-1.4: New USB device found, idVendor=0430, idProduct=00a2
[    4.519350] usb 2-1.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    4.519403] usb 2-1.4: Product: Sun USB Keyboard
[    4.528909] input: Sun USB Keyboard as /devices/pci0000:00/0000:00:02.0/usb2/2-1/2-1.4/2-1.4:1.0/input/input1
[    4.529103] generic-usb 0003:0430:00A2.0002: input,hidraw1: USB HID v1.10 Keyboard [Sun USB Keyboard] on usb-0000:00:02.0-1.4/input0
[    8.037422] yenta_cardbus 0000:01:06.0: CardBus bridge found [14ef:0202]
[    8.163688] yenta_cardbus 0000:01:06.0: ISA IRQ mask 0x0000, PCI irq 3
[    8.163738] yenta_cardbus 0000:01:06.0: Socket status: 30000410
[    8.163788] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    8.163845] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0x88000000-0x91ffffff]
[    8.163903] pcmcia_socket pcmcia_socket0: cs: memory probe 0x88000000-0x91ffffff: excluding 0x88000000-0x907fffff
[    8.164025] yenta_cardbus 0000:01:06.0: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    8.164082] pcmcia_socket pcmcia_socket0: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    8.164717] yenta_cardbus 0000:01:06.1: CardBus bridge found [14ef:0202]
[    8.290260] yenta_cardbus 0000:01:06.1: ISA IRQ mask 0x0000, PCI irq 11
[    8.290310] yenta_cardbus 0000:01:06.1: Socket status: 30000410
[    8.290352] pci_bus 0000:03: Upper limit for fixing this bridge's parent bridge: #03
[    8.290415] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [io  0x9000-0xafff]
[    8.290472] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0x88000000-0x91ffffff]
[    8.290530] pcmcia_socket pcmcia_socket1: cs: memory probe 0x88000000-0x91ffffff: excluding 0x88000000-0x907fffff
[    8.290651] yenta_cardbus 0000:01:06.1: pcmcia: parent PCI bridge window: [mem 0x80000000-0x87ffffff pref]
[    8.290708] pcmcia_socket pcmcia_socket1: cs: memory probe 0x80000000-0x87ffffff: excluding 0x80000000-0x87ffffff
[    8.479563] pcmcia_socket pcmcia_socket1: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[    8.481451] pcmcia_socket pcmcia_socket1: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[    8.481595] pcmcia_socket pcmcia_socket1: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[    9.670035] pcmcia_socket pcmcia_socket0: pccard: PCMCIA card inserted into slot 0
[    9.670104] pcmcia_socket pcmcia_socket0: cs: memory probe 0x90800000-0x91ffffff: excluding 0x90f80000-0x910fffff
[    9.674610] pcmcia_socket pcmcia_socket0: cs: memory probe 0x0c0000-0x0fffff: excluding 0xc0000-0xfffff
[    9.674841] pcmcia_socket pcmcia_socket0: cs: memory probe 0xa0000000-0xa0ffffff: excluding 0xa0000000-0xa0ffffff
[    9.674986] pcmcia_socket pcmcia_socket0: cs: memory probe 0x60000000-0x60ffffff: excluding 0x60000000-0x60ffffff
[    9.676929] 
[    9.677152] pcmcia 0.0: pcmcia: registering new device pcmcia0.0 (IRQ: 3)
[   11.243371] pcmcia_socket pcmcia_socket1: pccard: PCMCIA card inserted into slot 1
[   11.243436] pcmcia_socket pcmcia_socket1: cs: memory probe 0x90800000-0x91ffffff: excluding 0x90800000-0x9097ffff 0x90f80000-0x910fffff
[   11.255492] pcmcia 1.0: pcmcia: registering new device pcmcia1.0 (IRQ: 11)
[   11.563753] Adding 1951860k swap on /dev/hda1.  Priority:-1 extents:1 across:1951860k 
[   11.733052] EXT3-fs (hda2): using internal journal
[   12.920725] loop: module loaded
[   13.424609] fuse init (API version 7.16)
[   13.509503] EXT3-fs: barriers not enabled
[   13.525709] kjournald starting.  Commit interval 5 seconds
[   13.525983] EXT3-fs (hda3): using internal journal
[   13.526025] EXT3-fs (hda3): mounted filesystem with ordered data mode
[   17.667461] RPC: Registered named UNIX socket transport module.
[   17.667520] RPC: Registered udp transport module.
[   17.667557] RPC: Registered tcp transport module.
[   17.667594] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   17.918432] Installing knfsd (copyright (C) 1996 okir-pn4DOG8n3UYbFoVRYvo4fw@public.gmane.org).
[   35.284527] input: Power Button as /devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2
[   35.284639] ACPI: Power Button [PWRB]
[   35.284773] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
[   35.284816] ACPI: Power Button [PWRF]
[   35.420787] wmi: Mapper loaded
[   35.558248] [drm] Initialized drm 1.1.0 20060810
[   35.787000] ACPI: PCI Interrupt Link [LNK5] enabled at IRQ 10
[   35.787014] nouveau 0000:04:00.0: PCI INT A -> Link[LNK5] -> GSI 10 (level, low) -> IRQ 10
[   35.792582] [drm] nouveau 0000:04:00.0: Detected an NV10 generation card (0x01f000a5)
[   35.792844] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PRAMIN
[   35.838787] [drm] nouveau 0000:04:00.0: ... BIOS checksum invalid
[   35.838791] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PROM
[   35.838797] [drm] nouveau 0000:04:00.0: ... BIOS signature not found
[   35.838801] [drm] nouveau 0000:04:00.0: Attempting to load BIOS image from PCIROM
[   35.839229] [drm] nouveau 0000:04:00.0: ... appears to be valid
[   35.840727] [drm] nouveau 0000:04:00.0: BMP BIOS found
[   35.840732] [drm] nouveau 0000:04:00.0: BMP version 5.21
[   35.840738] [drm] nouveau 0000:04:00.0: Bios version 04.1f.00.07
[   35.840743] [drm] nouveau 0000:04:00.0: Found Display Configuration Block version 2.0
[   35.840750] [drm] nouveau 0000:04:00.0: Raw DCB entry 0: 01000100 000088b8
[   35.840756] [drm] nouveau 0000:04:00.0: Raw DCB entry 1: 02010210 000088b8
[   35.840760] [drm] nouveau 0000:04:00.0: Raw DCB entry 2: 01120132 00000000
[   35.840765] [drm] nouveau 0000:04:00.0: Raw DCB entry 3: 01120232 00000000
[   35.840770] [drm] nouveau 0000:04:00.0: Raw DCB entry 4: 02010121 00000003
[   35.840774] [drm] nouveau 0000:04:00.0: Raw DCB entry 5: 02010221 00000003
[   35.840779] [drm] nouveau 0000:04:00.0: Merging DCB entries 2 and 3
[   35.840783] [drm] nouveau 0000:04:00.0: Merging DCB entries 4 and 5
[   35.842355] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 0 at offset 0xC284
[   35.842385] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 1 at offset 0xC4E0
[   35.842396] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 2 at offset 0xC2E7
[   35.857448] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 3 at offset 0xC632
[   35.857460] [drm] nouveau 0000:04:00.0: Parsing VBIOS init table 4 at offset 0xC47B
[   35.857469] [drm] nouveau 0000:04:00.0: Unknown memclock table version 0.
[   35.921299] [drm] nouveau 0000:04:00.0: 0 available performance level(s)
[   35.921328] [drm] nouveau 0000:04:00.0: c: core 199MHz memory 200454M
[   35.925040] [TTM] Zone  kernel: Available graphics memory: 443994 kiB.
[   35.925048] [TTM] Zone highmem: Available graphics memory: 1021502 kiB.
[   35.925052] [TTM] Initializing pool allocator.
[   35.925075] [drm] nouveau 0000:04:00.0: Detected 32MiB VRAM
[   35.925209] agpgart-nvidia 0000:00:00.0: AGP 2.0 bridge
[   35.925240] agpgart-nvidia 0000:00:00.0: putting AGP V2 device into 4x mode
[   35.925320] nouveau 0000:04:00.0: putting AGP V2 device into 4x mode
[   35.925326] [drm] nouveau 0000:04:00.0: 64 MiB GART (aperture)
[   35.925376] [drm] nouveau 0000:04:00.0: Saving VGA fonts
[   35.973525] [drm] nouveau 0000:04:00.0: Detected TMDS transmitter: sil164
[   35.987246] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   35.987253] [drm] No driver support for vblank timestamp query.
[   35.988974] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 0)
[   35.988985] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on vga encoder (output 1)
[   35.988992] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on tmds encoder (output 2)
[   35.988999] [drm] nouveau 0000:04:00.0: Setting dpms mode 3 on TV encoder (output 3)
[   36.184988] [drm] nouveau 0000:04:00.0: allocated 1920x1080 fb: 0x49000, bo f597ec00
[   36.186022] fbcon: nouveaufb (fb0) is primary device
[   36.187537] Console: switching to colour frame buffer device 240x67
[   36.187558] fb0: nouveaufb frame buffer device
[   36.187562] drm: registered panic notifier
[   36.187577] [drm] Initialized nouveau 0.0.16 20090420 for 0000:04:00.0 on minor 0
[   37.577824] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)
[   37.577831] [drm] nouveau 0000:04:00.0: Output DVI-D-1 is running on CRTC 0 using output A
[ 1842.826523] [drm] nouveau 0000:04:00.0: Setting dpms mode 1 on tmds encoder (output 2)
[ 4610.949081] [drm] nouveau 0000:04:00.0: Setting dpms mode 0 on tmds encoder (output 2)

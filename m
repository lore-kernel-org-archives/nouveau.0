From: "George Spelvin" <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
Subject: Re: nouveaufb problems with NV18
Date: 1 Jul 2011 15:22:38 -0400
Message-ID: <20110701192238.7169.qmail@science.horizon.com>
References: <20110701163521.GA3162@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110701163521.GA3162-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org, marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> Lowering bpp/resolution for framebuffer and/or X might help. At least temporarily.

Bingo!  Dropping to 16 bpp produced a working display.  Xorg.0.log appensed.

> Screenshot might be useful.

Will be a few days; I don't have a camera handy.  I thought I described it
pretty well: cut off the bttom 8 pixels or so, replicating the top line
of pixels to fill the space.  Actually I just realized that, using 16x8
characters, my screen is 67.5x240; maybe the 0.5 character is causing
some rounding error?

> 2) I can't start X.  The X server fails to initialize with:
> [  6151.976] (II) NOUVEAU(0): Opened GPU channel 1
> [  6151.976] (II) NOUVEAU(0): [DRI2] Setup complete
> [  6151.976] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux

> Can you uninstall 3d driver and check how will it behave?

Forgive me; can you elaborate on what 3d driver you are referring to?  Is it some
kernel module, or a user-space thing?  The modules I have loaded are:
Module                  Size  Used by
nouveau               481474  2 
ttm                    35393  1 nouveau
fbcon                  28587  72 
font                    6928  1 fbcon
bitblit                 3470  1 fbcon
softcursor               841  1 bitblit
drm_kms_helper         18798  1 nouveau,[permanent]
drm                   123051  4 nouveau,ttm,drm_kms_helper
i2c_algo_bit            3601  1 nouveau
cfbcopyarea             2642  1 nouveau
mxm_wmi                 1005  1 nouveau
wmi                     6379  1 mxm_wmi
video                   9565  1 nouveau
thermal_sys             9691  1 video
cfbimgblt               1673  1 nouveau
button                  3377  1 nouveau
cfbfillrect             2434  1 nouveau
sunrpc                136005  1 
fuse                   47032  1 
evdev                   5947  4 

> 1920x1080x4 is almost 8MB and you have only 32MB of VRAM. It might be a problem with memory allocation.
> You could verify it by applying this patch to xf86-video-nouveau and checking xorg.log:

The "lowering bpp" suggestion was faster, soI tried it successfully.  Is this patch still
useful?  I'll try it over the weekend.

Does nouveau leave the text mode console allocated?  Without it, it
actually uses hardware text mode, which is a lot less VRAM.

Thank you very much!




[ 59709.781] _XSERVTransSocketOpenCOTSServer: Unable to open socket for inet6
[ 59709.782] _XSERVTransOpen: transport open failed for inet6/$HOST:0
[ 59709.782] _XSERVTransMakeAllCOTSServerListeners: failed to open listener for inet6
[ 59709.783] 
X.Org X Server 1.10.2
Release Date: 2011-05-28
[ 59709.783] X Protocol Version 11, Revision 0
[ 59709.783] Build Operating System: Linux 2.6.32-5-amd64 i686 Debian
[ 59709.783] Current Operating System: Linux columbia 3.0.0-rc5+ #28 Thu Jun 30 22:21:23 EDT 2011 i686
[ 59709.783] Kernel command line: auto BOOT_IMAGE=2.6 ro root=302
[ 59709.783] Build Date: 17 June 2011  05:05:44PM
[ 59709.783] xorg-server 2:1.10.2-2 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[ 59709.783] Current version of pixman: 0.21.8
[ 59709.783] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[ 59709.783] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[ 59709.783] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Jul  1 15:06:25 2011
[ 59709.784] (==) Using config file: "/etc/X11/xorg.conf"
[ 59709.784] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[ 59709.784] (==) ServerLayout "Default Layout"
[ 59709.784] (**) |-->Screen "Default Screen" (0)
[ 59709.784] (**) |   |-->Monitor "2243SWX"
[ 59709.785] (**) Option "ReducedBlanking"
[ 59709.785] (==) No device specified for screen "Default Screen".
	Using the first device section listed.
[ 59709.785] (**) |   |-->Device "Configured Video Device"
[ 59709.785] (**) Option "DontZap" "off"
[ 59709.785] (**) Option "AllowMouseOpenFail" "off"
[ 59709.785] (==) Automatically adding devices
[ 59709.785] (==) Automatically enabling devices
[ 59709.785] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[ 59709.785] 	Entry deleted from font path.
[ 59709.785] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
[ 59709.785] (==) ModulePath set to "/usr/lib/xorg/modules"
[ 59709.785] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[ 59709.785] (II) Loader magic: 0x8232ae0
[ 59709.785] (II) Module ABI versions:
[ 59709.785] 	X.Org ANSI C Emulation: 0.4
[ 59709.785] 	X.Org Video Driver: 10.0
[ 59709.785] 	X.Org XInput driver : 12.2
[ 59709.785] 	X.Org Server Extension : 5.0
[ 59709.786] (--) PCI:*(0:4:0:0) 10de:01f0:0000:0000 rev 163, Mem @ 0xec000000/16777216, 0xe4000000/67108864, 0xe8000000/524288, BIOS @ 0x????????/131072
[ 59709.787] (II) Open ACPI successful (/var/run/acpid.socket)
[ 59709.787] (II) LoadModule: "extmod"
[ 59709.788] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[ 59709.788] (II) Module extmod: vendor="X.Org Foundation"
[ 59709.788] 	compiled for 1.10.2, module version = 1.0.0
[ 59709.788] 	Module class: X.Org Server Extension
[ 59709.788] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.789] (II) Loading extension SELinux
[ 59709.789] (II) Loading extension MIT-SCREEN-SAVER
[ 59709.789] (II) Loading extension XFree86-VidModeExtension
[ 59709.789] (II) Loading extension XFree86-DGA
[ 59709.789] (II) Loading extension DPMS
[ 59709.789] (II) Loading extension XVideo
[ 59709.789] (II) Loading extension XVideo-MotionCompensation
[ 59709.789] (II) Loading extension X-Resource
[ 59709.789] (II) LoadModule: "dbe"
[ 59709.789] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[ 59709.789] (II) Module dbe: vendor="X.Org Foundation"
[ 59709.789] 	compiled for 1.10.2, module version = 1.0.0
[ 59709.789] 	Module class: X.Org Server Extension
[ 59709.789] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.789] (II) Loading extension DOUBLE-BUFFER
[ 59709.789] (II) LoadModule: "glx"
[ 59709.789] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[ 59709.790] (II) Module glx: vendor="X.Org Foundation"
[ 59709.790] 	compiled for 1.10.2, module version = 1.0.0
[ 59709.790] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.790] (==) AIGLX enabled
[ 59709.790] (II) Loading extension GLX
[ 59709.790] (II) LoadModule: "record"
[ 59709.790] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[ 59709.790] (II) Module record: vendor="X.Org Foundation"
[ 59709.790] 	compiled for 1.10.2, module version = 1.13.0
[ 59709.790] 	Module class: X.Org Server Extension
[ 59709.790] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.790] (II) Loading extension RECORD
[ 59709.790] (II) LoadModule: "dri"
[ 59709.791] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[ 59709.791] (II) Module dri: vendor="X.Org Foundation"
[ 59709.791] 	compiled for 1.10.2, module version = 1.0.0
[ 59709.791] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.791] (II) Loading extension XFree86-DRI
[ 59709.791] (II) LoadModule: "dri2"
[ 59709.791] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[ 59709.791] (II) Module dri2: vendor="X.Org Foundation"
[ 59709.792] 	compiled for 1.10.2, module version = 1.2.0
[ 59709.792] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.792] (II) Loading extension DRI2
[ 59709.792] (II) LoadModule: "nouveau"
[ 59709.792] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[ 59709.792] (II) Module nouveau: vendor="X.Org Foundation"
[ 59709.792] 	compiled for 1.10.1, module version = 0.0.16
[ 59709.792] 	Module class: X.Org Video Driver
[ 59709.792] 	ABI class: X.Org Video Driver, version 10.0
[ 59709.792] (II) NOUVEAU driver Date:   Thu Mar 24 02:13:12 2011 +1000
[ 59709.792] (II) NOUVEAU driver for NVIDIA chipset families :
[ 59709.792] 	RIVA TNT        (NV04)
[ 59709.792] 	RIVA TNT2       (NV05)
[ 59709.792] 	GeForce 256     (NV10)
[ 59709.792] 	GeForce 2       (NV11, NV15)
[ 59709.792] 	GeForce 4MX     (NV17, NV18)
[ 59709.793] 	GeForce 3       (NV20)
[ 59709.793] 	GeForce 4Ti     (NV25, NV28)
[ 59709.793] 	GeForce FX      (NV3x)
[ 59709.793] 	GeForce 6       (NV4x)
[ 59709.793] 	GeForce 7       (G7x)
[ 59709.793] 	GeForce 8       (G8x)
[ 59709.793] 	GeForce GTX 200 (NVA0)
[ 59709.793] 	GeForce GTX 400 (NVC0)
[ 59709.793] (++) using VT number 7

[ 59709.796] drmOpenDevice: node name is /dev/dri/card0
[ 59709.796] drmOpenDevice: open result is 9, (OK)
[ 59709.796] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[ 59709.796] drmOpenDevice: node name is /dev/dri/card0
[ 59709.796] drmOpenDevice: open result is 9, (OK)
[ 59709.796] drmOpenByBusid: drmOpenMinor returns 9
[ 59709.796] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[ 59709.796] (II) [drm] nouveau interface version: 0.0.16
[ 59709.796] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[ 59709.796] (II) Loading sub module "dri"
[ 59709.796] (II) LoadModule: "dri"
[ 59709.797] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[ 59709.797] (II) Module dri: vendor="X.Org Foundation"
[ 59709.797] 	compiled for 1.10.2, module version = 1.0.0
[ 59709.797] 	ABI class: X.Org Server Extension, version 5.0
[ 59709.797] (II) NOUVEAU(0): Loaded DRI module
[ 59709.797] drmOpenDevice: node name is /dev/dri/card0
[ 59709.798] drmOpenDevice: open result is 10, (OK)
[ 59709.798] drmOpenDevice: node name is /dev/dri/card0
[ 59709.798] drmOpenDevice: open result is 10, (OK)
[ 59709.798] drmOpenByBusid: Searching for BusID pci:0000:04:00.0
[ 59709.798] drmOpenDevice: node name is /dev/dri/card0
[ 59709.798] drmOpenDevice: open result is 10, (OK)
[ 59709.798] drmOpenByBusid: drmOpenMinor returns 10
[ 59709.798] drmOpenByBusid: drmGetBusid reports pci:0000:04:00.0
[ 59709.798] (II) [drm] DRM interface version 1.4
[ 59709.798] (II) [drm] DRM open master succeeded.
[ 59709.798] (--) NOUVEAU(0): Chipset: "NVIDIA NV1f"
[ 59709.798] (**) NOUVEAU(0): Depth 16, (--) framebuffer bpp 16
[ 59709.798] (==) NOUVEAU(0): RGB weight 565
[ 59709.798] (==) NOUVEAU(0): Default visual is TrueColor
[ 59709.798] (==) NOUVEAU(0): Using HW cursor
[ 59709.798] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[ 59709.798] (==) NOUVEAU(0): Page flipping enabled
[ 59709.857] (II) NOUVEAU(0): Output VGA-1 using monitor section 2243SWX
[ 59709.917] (II) NOUVEAU(0): Output VGA-2 has no monitor section
[ 59710.024] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[ 59710.024] (II) NOUVEAU(0): Output TV-1 has no monitor section
[ 59710.084] (II) NOUVEAU(0): EDID for output VGA-1
[ 59710.144] (II) NOUVEAU(0): EDID for output VGA-2
[ 59710.251] (II) NOUVEAU(0): EDID for output DVI-D-1
[ 59710.251] (II) NOUVEAU(0): Manufacturer: SAM  Model: 4e7  Serial#: 1297691186
[ 59710.251] (II) NOUVEAU(0): Year: 2009  Week: 14
[ 59710.251] (II) NOUVEAU(0): EDID Version: 1.3
[ 59710.251] (II) NOUVEAU(0): Digital Display Input
[ 59710.251] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 48  vert.: 27
[ 59710.251] (II) NOUVEAU(0): Gamma: 2.20
[ 59710.251] (II) NOUVEAU(0): DPMS capabilities: Off
[ 59710.251] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[ 59710.251] (II) NOUVEAU(0): First detailed timing is preferred mode
[ 59710.251] (II) NOUVEAU(0): redX: 0.649 redY: 0.335   greenX: 0.283 greenY: 0.605
[ 59710.251] (II) NOUVEAU(0): blueX: 0.151 blueY: 0.073   whiteX: 0.312 whiteY: 0.329
[ 59710.251] (II) NOUVEAU(0): Supported established timings:
[ 59710.251] (II) NOUVEAU(0): 640x480@60Hz
[ 59710.251] (II) NOUVEAU(0): 800x600@56Hz
[ 59710.251] (II) NOUVEAU(0): 800x600@60Hz
[ 59710.251] (II) NOUVEAU(0): 1024x768@60Hz
[ 59710.251] (II) NOUVEAU(0): Manufacturer's mask: 0
[ 59710.251] (II) NOUVEAU(0): Supported standard timings:
[ 59710.252] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid: 129
[ 59710.252] (II) NOUVEAU(0): #1: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[ 59710.252] (II) NOUVEAU(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[ 59710.252] (II) NOUVEAU(0): #3: hsize: 1440  vsize 900  refresh: 60  vid: 149
[ 59710.252] (II) NOUVEAU(0): #4: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[ 59710.252] (II) NOUVEAU(0): #5: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[ 59710.252] (II) NOUVEAU(0): Supported detailed timing:
[ 59710.252] (II) NOUVEAU(0): clock: 138.5 MHz   Image Size:  477 x 268 mm
[ 59710.252] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[ 59710.252] (II) NOUVEAU(0): v_active: 1080  v_sync: 1083  v_sync_end 1088 v_blanking: 1111 v_border: 0
[ 59710.252] (II) NOUVEAU(0): Ranges: V min: 56 V max: 61 Hz, H min: 30 H max: 75 kHz, PixClock max 175 MHz
[ 59710.252] (II) NOUVEAU(0): Monitor name: SyncMaster
[ 59710.252] (II) NOUVEAU(0): Serial No: H9NS400521
[ 59710.252] (II) NOUVEAU(0): EDID (in hex):
[ 59710.252] (II) NOUVEAU(0): 	00ffffffffffff004c2de7043232594d
[ 59710.252] (II) NOUVEAU(0): 	0e13010380301b782a78f1a655489b26
[ 59710.252] (II) NOUVEAU(0): 	1250542308008100814081809500b300
[ 59710.252] (II) NOUVEAU(0): 	a940010101011a3680a070381f403020
[ 59710.252] (II) NOUVEAU(0): 	3500dd0c1100001a000000fd00383d1e
[ 59710.252] (II) NOUVEAU(0): 	4b11000a202020202020000000fc0053
[ 59710.252] (II) NOUVEAU(0): 	796e634d61737465720a2020000000ff
[ 59710.252] (II) NOUVEAU(0): 	0048394e533430303532310a20200094
[ 59710.252] (II) NOUVEAU(0): Printing probed modes for output DVI-D-1
[ 59710.252] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 59710.252] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 59710.253] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 59710.253] (II) NOUVEAU(0): EDID for output TV-1
[ 59710.253] (II) NOUVEAU(0): Output VGA-1 disconnected
[ 59710.253] (II) NOUVEAU(0): Output VGA-2 disconnected
[ 59710.253] (II) NOUVEAU(0): Output DVI-D-1 connected
[ 59710.253] (II) NOUVEAU(0): Output TV-1 disconnected
[ 59710.253] (II) NOUVEAU(0): Using user preference for initial modes
[ 59710.253] (II) NOUVEAU(0): Output DVI-D-1 using initial mode 1920x1080
[ 59710.253] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[ 59710.253] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1920x1080": 138.5 MHz (scaled from 0.0 MHz), 66.6 kHz, 59.9 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from 0.0 MHz), 49.7 kHz, 59.8 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 59710.253] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[ 59710.253] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 59710.254] (**) NOUVEAU(0): Display dimensions: (477, 268) mm
[ 59710.254] (**) NOUVEAU(0): DPI set to (102, 102)
[ 59710.254] (II) Loading sub module "fb"
[ 59710.254] (II) LoadModule: "fb"
[ 59710.254] (II) Loading /usr/lib/xorg/modules/libfb.so
[ 59710.254] (II) Module fb: vendor="X.Org Foundation"
[ 59710.254] 	compiled for 1.10.2, module version = 1.0.0
[ 59710.254] 	ABI class: X.Org ANSI C Emulation, version 0.4
[ 59710.254] (II) Loading sub module "exa"
[ 59710.254] (II) LoadModule: "exa"
[ 59710.254] (II) Loading /usr/lib/xorg/modules/libexa.so
[ 59710.255] (II) Module exa: vendor="X.Org Foundation"
[ 59710.255] 	compiled for 1.10.2, module version = 2.5.0
[ 59710.255] 	ABI class: X.Org Video Driver, version 10.0
[ 59710.255] (II) Loading sub module "shadowfb"
[ 59710.255] (II) LoadModule: "shadowfb"
[ 59710.255] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[ 59710.255] (II) Module shadowfb: vendor="X.Org Foundation"
[ 59710.255] 	compiled for 1.10.2, module version = 1.0.0
[ 59710.255] 	ABI class: X.Org ANSI C Emulation, version 0.4
[ 59710.256] (II) NOUVEAU(0): Opened GPU channel 1
[ 59710.257] (II) NOUVEAU(0): [DRI2] Setup complete
[ 59710.257] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[ 59710.257] (II) NOUVEAU(0): GART: 64MiB available
[ 59710.264] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[ 59710.286] (II) EXA(0): Driver allocated offscreen pixmaps
[ 59710.286] (II) EXA(0): Driver registered support for the following operations:
[ 59710.286] (II)         Solid
[ 59710.286] (II)         Copy
[ 59710.286] (II)         Composite (RENDER acceleration)
[ 59710.286] (II)         UploadToScreen
[ 59710.286] (II)         DownloadFromScreen
[ 59710.286] (==) NOUVEAU(0): Backing store disabled
[ 59710.286] (==) NOUVEAU(0): Silken mouse enabled
[ 59710.287] (==) NOUVEAU(0): DPMS enabled
[ 59710.287] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[ 59710.288] (--) RandR disabled
[ 59710.288] (II) Initializing built-in extension Generic Event Extension
[ 59710.288] (II) Initializing built-in extension SHAPE
[ 59710.288] (II) Initializing built-in extension MIT-SHM
[ 59710.288] (II) Initializing built-in extension XInputExtension
[ 59710.288] (II) Initializing built-in extension XTEST
[ 59710.288] (II) Initializing built-in extension BIG-REQUESTS
[ 59710.288] (II) Initializing built-in extension SYNC
[ 59710.288] (II) Initializing built-in extension XKEYBOARD
[ 59710.288] (II) Initializing built-in extension XC-MISC
[ 59710.288] (II) Initializing built-in extension SECURITY
[ 59710.288] (II) Initializing built-in extension XINERAMA
[ 59710.288] (II) Initializing built-in extension XFIXES
[ 59710.288] (II) Initializing built-in extension RENDER
[ 59710.288] (II) Initializing built-in extension RANDR
[ 59710.288] (II) Initializing built-in extension COMPOSITE
[ 59710.288] (II) Initializing built-in extension DAMAGE
[ 59710.288] (II) SELinux: Disabled on system
[ 59710.306] (EE) AIGLX error: dlopen of /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so failed (/usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so: cannot open shared object file: No such file or directory)
[ 59710.306] (EE) AIGLX: reverting to software rendering
[ 59710.306] (II) AIGLX: Screen 0 is not DRI capable
[ 59710.519] (II) AIGLX: Loaded and initialized /usr/lib/i386-linux-gnu/dri/swrast_dri.so
[ 59710.519] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[ 59710.524] (II) NOUVEAU(0): NVEnterVT is called.
[ 59710.535] (II) NOUVEAU(0): Setting screen physical size to 507 x 285
[ 59710.535] resize called 1920 1080
[ 59711.011] (II) config/udev: Adding input device Power Button (/dev/input/event3)
[ 59711.011] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[ 59711.011] (II) LoadModule: "evdev"
[ 59711.011] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[ 59711.035] (II) Module evdev: vendor="X.Org Foundation"
[ 59711.035] 	compiled for 1.10.1, module version = 2.6.0
[ 59711.035] 	Module class: X.Org XInput Driver
[ 59711.035] 	ABI class: X.Org XInput driver, version 12.2
[ 59711.035] (II) Using input driver 'evdev' for 'Power Button'
[ 59711.036] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[ 59711.036] (**) Power Button: always reports core events
[ 59711.036] (**) Power Button: Device: "/dev/input/event3"
[ 59711.036] (--) Power Button: Found keys
[ 59711.036] (II) Power Button: Configuring as keyboard
[ 59711.036] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input3/event3"
[ 59711.036] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
[ 59711.036] (**) Option "xkb_rules" "evdev"
[ 59711.036] (**) Option "xkb_model" "pc104"
[ 59711.036] (**) Option "xkb_layout" "us"
[ 59711.036] (**) Option "xkb_options" "compose:rwin,terminate:ctrl_alt_bksp"
[ 59711.106] (II) config/udev: Adding input device Power Button (/dev/input/event2)
[ 59711.106] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[ 59711.106] (II) Using input driver 'evdev' for 'Power Button'
[ 59711.106] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[ 59711.106] (**) Power Button: always reports core events
[ 59711.106] (**) Power Button: Device: "/dev/input/event2"
[ 59711.107] (--) Power Button: Found keys
[ 59711.107] (II) Power Button: Configuring as keyboard
[ 59711.107] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input2/event2"
[ 59711.107] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
[ 59711.107] (**) Option "xkb_rules" "evdev"
[ 59711.107] (**) Option "xkb_model" "pc104"
[ 59711.107] (**) Option "xkb_layout" "us"
[ 59711.107] (**) Option "xkb_options" "compose:rwin,terminate:ctrl_alt_bksp"
[ 59711.111] (II) config/udev: Adding input device Sun USB Keyboard (/dev/input/event1)
[ 59711.111] (**) Sun USB Keyboard: Applying InputClass "evdev keyboard catchall"
[ 59711.111] (II) Using input driver 'evdev' for 'Sun USB Keyboard'
[ 59711.111] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[ 59711.111] (**) Sun USB Keyboard: always reports core events
[ 59711.111] (**) Sun USB Keyboard: Device: "/dev/input/event1"
[ 59711.111] (--) Sun USB Keyboard: Found keys
[ 59711.111] (II) Sun USB Keyboard: Configuring as keyboard
[ 59711.111] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:02.0/usb2/2-1/2-1.4/2-1.4:1.0/input/input1/event1"
[ 59711.111] (II) XINPUT: Adding extended input device "Sun USB Keyboard" (type: KEYBOARD)
[ 59711.111] (**) Option "xkb_rules" "evdev"
[ 59711.111] (**) Option "xkb_model" "pc104"
[ 59711.111] (**) Option "xkb_layout" "us"
[ 59711.111] (**) Option "xkb_options" "compose:rwin,terminate:ctrl_alt_bksp"
[ 59711.113] (II) config/udev: Adding input device HID 1241:1166 (/dev/input/event0)
[ 59711.113] (**) HID 1241:1166: Applying InputClass "evdev pointer catchall"
[ 59711.113] (II) Using input driver 'evdev' for 'HID 1241:1166'
[ 59711.113] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[ 59711.113] (**) HID 1241:1166: always reports core events
[ 59711.113] (**) HID 1241:1166: Device: "/dev/input/event0"
[ 59711.113] (--) HID 1241:1166: Found 9 mouse buttons
[ 59711.113] (--) HID 1241:1166: Found scroll wheel(s)
[ 59711.113] (--) HID 1241:1166: Found relative axes
[ 59711.113] (--) HID 1241:1166: Found x and y relative axes
[ 59711.113] (II) HID 1241:1166: Configuring as mouse
[ 59711.113] (II) HID 1241:1166: Adding scrollwheel support
[ 59711.113] (**) HID 1241:1166: YAxisMapping: buttons 4 and 5
[ 59711.113] (**) HID 1241:1166: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[ 59711.113] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:02.0/usb2/2-2/2-2:1.0/input/input0/event0"
[ 59711.113] (II) XINPUT: Adding extended input device "HID 1241:1166" (type: MOUSE)
[ 59711.114] (II) HID 1241:1166: initialized for relative axes.
[ 59711.114] (**) HID 1241:1166: (accel) keeping acceleration scheme 1
[ 59711.114] (**) HID 1241:1166: (accel) acceleration profile 0
[ 59711.114] (**) HID 1241:1166: (accel) acceleration factor: 2.000
[ 59711.114] (**) HID 1241:1166: (accel) acceleration threshold: 4
[ 59711.114] (II) config/udev: Adding input device HID 1241:1166 (/dev/input/mouse0)
[ 59711.115] (II) No input driver/identifier specified (ignoring)
[ 59713.248] (II) NOUVEAU(0): EDID vendor "SAM", prod id 1255
[ 59713.248] (II) NOUVEAU(0): Using hsync ranges from config file
[ 59713.248] (II) NOUVEAU(0): Using vrefresh ranges from config file
[ 59713.248] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[ 59713.248] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[ 59713.248] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 59713.591] (II) NOUVEAU(0): EDID vendor "SAM", prod id 1255
[ 59713.591] (II) NOUVEAU(0): Using hsync ranges from config file
[ 59713.591] (II) NOUVEAU(0): Using vrefresh ranges from config file
[ 59713.591] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[ 59713.591] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 59713.591] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 59713.592] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[ 59713.592] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[ 59713.592] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[ 59713.944] (II) NOUVEAU(0): EDID vendor "SAM", prod id 1255
[ 59713.944] (II) NOUVEAU(0): Using hsync ranges from config file
[ 59713.944] (II) NOUVEAU(0): Using vrefresh ranges from config file
[ 59713.945] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[ 59713.945] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360 1440  800 803 809 823 +hsync -vsync (49.3 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[ 59713.945] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)

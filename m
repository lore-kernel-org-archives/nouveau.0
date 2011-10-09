From: Harry Putnam <reader-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Subject: Any known problems using xrandr with Nouveau
Date: Sun, 09 Oct 2011 17:22:44 -0500
Message-ID: <8762jx9557.fsf@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

Running Debian Wheezy
Hardware: Older P4 3.06 GHz
video: Nvidia FX 5700LE
Monitor is 25.5 asus LCD with 1900x1280 native resolution.
(xrander sees it as 1400x900)

(I've included the output of xrandr -q at the end, also following that
output is Xorg.0.log)

I recently made some effort to obtain a large pannable desktop like I
have used for many years.  And since on newer debian they expect to
bring X up with no xorg.conf I hoped to do it with xrandr

I'm not that familiar with xrandr but had some help from the debian
list. Such commands as:

   xrandr --output DVI-I-1  --mode 1440x900 --panning 1680x1050

Seem to produce the larger desktop as I can see an image I'm using for
background grow quite visibly and the fluxbox panel that was at the
bottom of the display moves down out of site.

The trouble comes when trying to move beyond the current viewing size
with the mouse... it simply will not pan... just stops at that border
and thats it.

I've seen several different bugs mentioned that seem like they may be
related to this, but my background ans skil level are such that I am
not able to judge is that is what I'm seeing.

So not sure if to continue or if there is no way to get a pannable
desktop now.

I see Nouveau is being loaded in Xorg.logs and wondered if there might
be some incompatibility between that and xrandr

-------        ---------       ---=---       ---------      -------- 

xrandr -q
Screen 0: minimum 320 x 200, current 1440 x 900, maximum 4096 x 4096
VGA-1 disconnected (normal left inverted right x axis y axis)
DVI-I-1 connected 1440x900+0+0 (normal left inverted right x axis y axis) 550mm x 340mm
   1280x1024      75.0     60.0  
   1440x900       59.9* 
   1280x960       60.0  
   1152x864       75.0  
   1024x768       75.1     70.1     60.0  
   832x624        74.6  
   800x600        72.2     75.0     60.3     56.2  
   640x480        72.8     75.0     66.7     60.0  
   720x400        70.1  
TV-1 disconnected (normal left inverted right x axis y axis)

-------        ---------       ---=---       ---------      -------- 

Xorg.0.log

[    22.131] 
X.Org X Server 1.11.1
Release Date: 2011-09-24
[    22.150] X Protocol Version 11, Revision 0
[    22.150] Build Operating System: Linux 2.6.32-5-amd64 i686 Debian
[    22.150] Current Operating System: Linux reader 3.0.0-1-686-pae #1 SMP Sat Aug 27 16:41:03 UTC 2011 i686
[    22.150] Kernel command line: BOOT_IMAGE=/vmlinuz-3.0.0-1-686-pae root=UUID=83a94f1d-e6e6-432e-86ad-b24754755fff ro quiet splash
[    22.150] Build Date: 24 September 2011  10:02:42AM
[    22.150] xorg-server 2:1.11.1-1 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[    22.150] Current version of pixman: 0.22.2
[    22.150] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    22.150] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    22.151] (==) Log file: "/var/log/Xorg.0.log", Time: Sun Oct  9 11:04:21 2011
[    22.381] (==) Using config file: "/etc/X11/xorg.conf"
[    22.381] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    22.428] (==) ServerLayout "X.org Configured"
[    22.428] (**) |-->Screen "Screen0" (0)
[    22.428] (**) |   |-->Monitor "Monitor0"
[    22.455] (**) |   |-->Device "Card0"
[    22.455] (**) |-->Screen "Screen1" (1)
[    22.455] (**) |   |-->Monitor "Monitor1"
[    22.455] (**) |   |-->Device "Card1"
[    22.455] (**) |-->Screen "Screen2" (2)
[    22.455] (**) |   |-->Monitor "Monitor2"
[    22.455] (**) |   |-->Device "Card2"
[    22.458] (**) |-->Input Device "Mouse0"
[    22.458] (**) |-->Input Device "Keyboard0"
[    22.458] (==) Automatically adding devices
[    22.458] (==) Automatically enabling devices
[    22.458] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    22.458] 	Entry deleted from font path.
[    22.500] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    22.500] 	Entry deleted from font path.
[    22.500] (**) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins,
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
[    22.500] (**) ModulePath set to "/usr/lib/xorg/modules"
[    22.500] (WW) Hotplugging is on, devices using drivers 'kbd', 'mouse' or 'vmmouse' will be disabled.
[    22.500] (WW) Disabling Mouse0
[    22.500] (WW) Disabling Keyboard0
[    22.522] (II) Loader magic: 0x822b800
[    22.522] (II) Module ABI versions:
[    22.522] 	X.Org ANSI C Emulation: 0.4
[    22.522] 	X.Org Video Driver: 11.0
[    22.522] 	X.Org XInput driver : 13.0
[    22.522] 	X.Org Server Extension : 6.0
[    22.523] (--) PCI:*(0:1:0:0) 10de:0343:1462:9590 rev 161, Mem @ 0xfd000000/16777216, 0xc0000000/268435456, BIOS @ 0x????????/131072
[    22.524] (II) Open ACPI successful (/var/run/acpid.socket)
[    22.524] (II) "extmod" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) "dbe" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) "glx" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) "record" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) "dri" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) "dri2" will be loaded. This was enabled by default and also specified in the config file.
[    22.524] (II) LoadModule: "glx"
[    22.541] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    22.565] (II) Module glx: vendor="X.Org Foundation"
[    22.565] 	compiled for 1.11.1, module version = 1.0.0
[    22.565] 	ABI class: X.Org Server Extension, version 6.0
[    22.565] (==) AIGLX enabled
[    22.565] (II) Loading extension GLX
[    22.565] (II) LoadModule: "record"
[    22.565] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    22.577] (II) Module record: vendor="X.Org Foundation"
[    22.577] 	compiled for 1.11.1, module version = 1.13.0
[    22.577] 	Module class: X.Org Server Extension
[    22.577] 	ABI class: X.Org Server Extension, version 6.0
[    22.577] (II) Loading extension RECORD
[    22.577] (II) LoadModule: "dri"
[    22.577] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    22.822] (II) Module dri: vendor="X.Org Foundation"
[    22.822] 	compiled for 1.11.1, module version = 1.0.0
[    22.822] 	ABI class: X.Org Server Extension, version 6.0
[    22.822] (II) Loading extension XFree86-DRI
[    22.822] (II) LoadModule: "dri2"
[    22.823] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    22.834] (II) Module dri2: vendor="X.Org Foundation"
[    22.834] 	compiled for 1.11.1, module version = 1.2.0
[    22.834] 	ABI class: X.Org Server Extension, version 6.0
[    22.834] (II) Loading extension DRI2
[    22.834] (II) LoadModule: "dbe"
[    22.834] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    22.835] (II) Module dbe: vendor="X.Org Foundation"
[    22.835] 	compiled for 1.11.1, module version = 1.0.0
[    22.835] 	Module class: X.Org Server Extension
[    22.835] 	ABI class: X.Org Server Extension, version 6.0
[    22.835] (II) Loading extension DOUBLE-BUFFER
[    22.835] (II) LoadModule: "extmod"
[    22.835] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    22.849] (II) Module extmod: vendor="X.Org Foundation"
[    22.849] 	compiled for 1.11.1, module version = 1.0.0
[    22.849] 	Module class: X.Org Server Extension
[    22.849] 	ABI class: X.Org Server Extension, version 6.0
[    22.849] (II) Loading extension SELinux
[    22.849] (II) Loading extension MIT-SCREEN-SAVER
[    22.849] (II) Loading extension XFree86-VidModeExtension
[    22.849] (II) Loading extension XFree86-DGA
[    22.850] (II) Loading extension DPMS
[    22.850] (II) Loading extension XVideo
[    22.850] (II) Loading extension XVideo-MotionCompensation
[    22.850] (II) Loading extension X-Resource
[    22.850] (II) LoadModule: "nouveau"
[    22.872] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    22.897] (II) Module nouveau: vendor="X.Org Foundation"
[    22.897] 	compiled for 1.11.0, module version = 0.0.16
[    22.897] 	Module class: X.Org Video Driver
[    22.897] 	ABI class: X.Org Video Driver, version 11.0
[    22.898] (II) LoadModule: "fbdev"
[    22.899] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    22.912] (II) Module fbdev: vendor="X.Org Foundation"
[    22.912] 	compiled for 1.11.0, module version = 0.4.2
[    22.912] 	ABI class: X.Org Video Driver, version 11.0
[    22.912] (II) LoadModule: "vesa"
[    22.912] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    22.917] (II) Module vesa: vendor="X.Org Foundation"
[    22.917] 	compiled for 1.11.0, module version = 2.3.0
[    22.917] 	Module class: X.Org Video Driver
[    22.917] 	ABI class: X.Org Video Driver, version 11.0
[    22.917] (II) NOUVEAU driver Date:   Thu Mar 24 02:13:12 2011 +1000
[    22.917] (II) NOUVEAU driver for NVIDIA chipset families :
[    22.917] 	RIVA TNT        (NV04)
[    22.917] 	RIVA TNT2       (NV05)
[    22.917] 	GeForce 256     (NV10)
[    22.917] 	GeForce 2       (NV11, NV15)
[    22.917] 	GeForce 4MX     (NV17, NV18)
[    22.917] 	GeForce 3       (NV20)
[    22.917] 	GeForce 4Ti     (NV25, NV28)
[    22.917] 	GeForce FX      (NV3x)
[    22.917] 	GeForce 6       (NV4x)
[    22.917] 	GeForce 7       (G7x)
[    22.917] 	GeForce 8       (G8x)
[    22.917] 	GeForce GTX 200 (NVA0)
[    22.917] 	GeForce GTX 400 (NVC0)
[    22.917] (II) FBDEV: driver for framebuffer: fbdev
[    22.917] (II) VESA: driver for VESA chipsets: vesa
[    22.917] (++) using VT number 7

[    22.922] drmOpenDevice: node name is /dev/dri/card0
[    22.922] drmOpenDevice: open result is 8, (OK)
[    22.922] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    22.922] drmOpenDevice: node name is /dev/dri/card0
[    22.922] drmOpenDevice: open result is 8, (OK)
[    22.922] drmOpenByBusid: drmOpenMinor returns 8
[    22.922] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    22.922] (II) [drm] nouveau interface version: 0.0.16
[    22.922] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    22.922] (WW) Falling back to old probe method for fbdev
[    22.922] (II) Loading sub module "fbdevhw"
[    22.922] (II) LoadModule: "fbdevhw"
[    22.923] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    22.963] (II) Module fbdevhw: vendor="X.Org Foundation"
[    22.963] 	compiled for 1.11.1, module version = 0.0.2
[    22.963] 	ABI class: X.Org Video Driver, version 11.0
[    22.963] (WW) Falling back to old probe method for vesa
[    22.963] (II) Loading sub module "dri"
[    22.963] (II) LoadModule: "dri"
[    22.963] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    22.963] (II) Module dri: vendor="X.Org Foundation"
[    22.963] 	compiled for 1.11.1, module version = 1.0.0
[    22.963] 	ABI class: X.Org Server Extension, version 6.0
[    22.963] (II) NOUVEAU(0): Loaded DRI module
[    22.964] drmOpenDevice: node name is /dev/dri/card0
[    22.964] drmOpenDevice: open result is 9, (OK)
[    22.964] drmOpenDevice: node name is /dev/dri/card0
[    22.964] drmOpenDevice: open result is 9, (OK)
[    22.964] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    22.964] drmOpenDevice: node name is /dev/dri/card0
[    22.964] drmOpenDevice: open result is 9, (OK)
[    22.964] drmOpenByBusid: drmOpenMinor returns 9
[    22.964] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    22.964] (II) [drm] DRM interface version 1.4
[    22.964] (II) [drm] DRM open master succeeded.
[    22.964] (--) NOUVEAU(0): Chipset: "NVIDIA NV36"
[    22.964] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    22.964] (==) NOUVEAU(0): RGB weight 888
[    22.964] (==) NOUVEAU(0): Default visual is TrueColor
[    22.964] (==) NOUVEAU(0): Using HW cursor
[    22.964] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    22.964] (==) NOUVEAU(0): Page flipping enabled
[    23.024] (II) NOUVEAU(0): Output VGA-1 using monitor section Monitor0
[    23.138] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    23.192] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    23.248] (II) NOUVEAU(0): EDID for output VGA-1
[    23.354] (II) NOUVEAU(0): EDID for output DVI-I-1
[    23.356] (II) NOUVEAU(0): Manufacturer: ACI  Model: 26a4  Serial#: 18746
[    23.356] (II) NOUVEAU(0): Year: 2010  Week: 31
[    23.356] (II) NOUVEAU(0): EDID Version: 1.3
[    23.356] (II) NOUVEAU(0): Digital Display Input
[    23.356] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 55  vert.: 34
[    23.356] (II) NOUVEAU(0): Gamma: 2.20
[    23.356] (II) NOUVEAU(0): DPMS capabilities: Off
[    23.356] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    23.356] (II) NOUVEAU(0): First detailed timing is preferred mode
[    23.356] (II) NOUVEAU(0): redX: 0.640 redY: 0.352   greenX: 0.287 greenY: 0.628
[    23.356] (II) NOUVEAU(0): blueX: 0.144 blueY: 0.075   whiteX: 0.312 whiteY: 0.328
[    23.356] (II) NOUVEAU(0): Supported established timings:
[    23.356] (II) NOUVEAU(0): 720x400@70Hz
[    23.356] (II) NOUVEAU(0): 640x480@60Hz
[    23.356] (II) NOUVEAU(0): 640x480@67Hz
[    23.356] (II) NOUVEAU(0): 640x480@72Hz
[    23.356] (II) NOUVEAU(0): 640x480@75Hz
[    23.356] (II) NOUVEAU(0): 800x600@56Hz
[    23.356] (II) NOUVEAU(0): 800x600@60Hz
[    23.356] (II) NOUVEAU(0): 800x600@72Hz
[    23.356] (II) NOUVEAU(0): 800x600@75Hz
[    23.356] (II) NOUVEAU(0): 832x624@75Hz
[    23.356] (II) NOUVEAU(0): 1024x768@60Hz
[    23.356] (II) NOUVEAU(0): 1024x768@70Hz
[    23.356] (II) NOUVEAU(0): 1024x768@75Hz
[    23.356] (II) NOUVEAU(0): 1280x1024@75Hz
[    23.356] (II) NOUVEAU(0): Manufacturer's mask: 0
[    23.356] (II) NOUVEAU(0): Supported standard timings:
[    23.356] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    23.356] (II) NOUVEAU(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    23.356] (II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    23.356] (II) NOUVEAU(0): #4: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    23.356] (II) NOUVEAU(0): #5: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    23.356] (II) NOUVEAU(0): Supported detailed timing:
[    23.356] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  550 x 340 mm
[    23.356] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    23.356] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: 1235 v_border: 0
[    23.356] (II) NOUVEAU(0): Serial No: A8LMTF018746
[    23.356] (II) NOUVEAU(0): Ranges: V min: 50 V max: 75 Hz, H min: 30 H max: 85 kHz, PixClock max 175 MHz
[    23.356] (II) NOUVEAU(0): Monitor name: ASUS VW266H
[    23.356] (II) NOUVEAU(0): EDID (in hex):
[    23.356] (II) NOUVEAU(0): 	00ffffffffffff000469a4263a490000
[    23.356] (II) NOUVEAU(0): 	1f140103803722782acbd0a35a49a024
[    23.356] (II) NOUVEAU(0): 	135054bfef00714f0101814081809500
[    23.357] (II) NOUVEAU(0): 	b30001010101283c80a070b023403020
[    23.357] (II) NOUVEAU(0): 	360026542100001a000000ff0041384c
[    23.357] (II) NOUVEAU(0): 	4d54463031383734360a000000fd0032
[    23.357] (II) NOUVEAU(0): 	4b1e5511000a202020202020000000fc
[    23.357] (II) NOUVEAU(0): 	0041535553205657323636480a2000b2
[    23.357] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    23.357] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    23.357] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    23.412] (II) NOUVEAU(0): EDID for output TV-1
[    23.412] (II) NOUVEAU(0): Output VGA-1 disconnected
[    23.412] (II) NOUVEAU(0): Output DVI-I-1 connected
[    23.412] (II) NOUVEAU(0): Output TV-1 disconnected
[    23.412] (II) NOUVEAU(0): Using exact sizes for initial modes
[    23.412] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1440x900
[    23.412] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[    23.412] (--) NOUVEAU(0): Virtual size is 2048x1536 (pitch 0)
[    23.412] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[    23.412] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
[    23.412] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
[    23.412] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
[    23.412] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[    23.412] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[    23.412] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    23.412] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
[    23.412] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
[    23.413] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35.0 kHz, 66.7 Hz
[    23.413] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[    23.413] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz
[    23.413] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
[    23.413] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    23.413] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[    23.413] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    23.413] (==) NOUVEAU(0): DPI set to (96, 96)
[    23.413] (II) Loading sub module "fb"
[    23.413] (II) LoadModule: "fb"
[    23.413] (II) Loading /usr/lib/xorg/modules/libfb.so
[    23.494] (II) Module fb: vendor="X.Org Foundation"
[    23.494] 	compiled for 1.11.1, module version = 1.0.0
[    23.494] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    23.494] (II) Loading sub module "exa"
[    23.494] (II) LoadModule: "exa"
[    23.535] (II) Loading /usr/lib/xorg/modules/libexa.so
[    23.548] (II) Module exa: vendor="X.Org Foundation"
[    23.549] 	compiled for 1.11.1, module version = 2.5.0
[    23.549] 	ABI class: X.Org Video Driver, version 11.0
[    23.549] (II) Loading sub module "shadowfb"
[    23.549] (II) LoadModule: "shadowfb"
[    23.549] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    23.563] (II) Module shadowfb: vendor="X.Org Foundation"
[    23.563] 	compiled for 1.11.1, module version = 1.0.0
[    23.563] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    23.563] (II) UnloadModule: "fbdev"
[    23.563] (II) Unloading fbdev
[    23.563] (II) UnloadModule: "fbdevhw"
[    23.563] (II) Unloading fbdevhw
[    23.563] (II) UnloadModule: "vesa"
[    23.563] (II) Unloading vesa
[    23.563] (--) Depth 24 pixmap format is 32 bpp
[    23.564] (II) NOUVEAU(0): Opened GPU channel 1
[    23.565] (II) NOUVEAU(0): [DRI2] Setup complete
[    23.565] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    23.565] (II) NOUVEAU(0): GART: 256MiB available
[    23.573] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    23.607] (II) EXA(0): Driver allocated offscreen pixmaps
[    23.607] (II) EXA(0): Driver registered support for the following operations:
[    23.607] (II)         Solid
[    23.607] (II)         Copy
[    23.607] (II)         Composite (RENDER acceleration)
[    23.607] (II)         UploadToScreen
[    23.607] (II)         DownloadFromScreen
[    23.607] (==) NOUVEAU(0): Backing store disabled
[    23.607] (==) NOUVEAU(0): Silken mouse enabled
[    23.607] (II) NOUVEAU(0): [XvMC] Associated with NV30 texture adapter.
[    23.607] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    23.607] (==) NOUVEAU(0): DPMS enabled
[    23.607] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[    23.608] (--) RandR disabled
[    23.608] (II) Initializing built-in extension Generic Event Extension
[    23.608] (II) Initializing built-in extension SHAPE
[    23.608] (II) Initializing built-in extension MIT-SHM
[    23.608] (II) Initializing built-in extension XInputExtension
[    23.608] (II) Initializing built-in extension XTEST
[    23.608] (II) Initializing built-in extension BIG-REQUESTS
[    23.608] (II) Initializing built-in extension SYNC
[    23.608] (II) Initializing built-in extension XKEYBOARD
[    23.608] (II) Initializing built-in extension XC-MISC
[    23.608] (II) Initializing built-in extension SECURITY
[    23.608] (II) Initializing built-in extension XINERAMA
[    23.608] (II) Initializing built-in extension XFIXES
[    23.608] (II) Initializing built-in extension RENDER
[    23.608] (II) Initializing built-in extension RANDR
[    23.608] (II) Initializing built-in extension COMPOSITE
[    23.608] (II) Initializing built-in extension DAMAGE
[    23.610] (II) SELinux: Disabled on system
[    23.647] (EE) AIGLX error: dlopen of /usr/lib/i386-linux-gnu/dri/nouveau_dri.so failed (/usr/lib/i386-linux-gnu/dri/nouveau_dri.so: cannot open shared object file: No such file or directory)
[    23.647] (EE) AIGLX: reverting to software rendering
[    23.647] (II) AIGLX: Screen 0 is not DRI capable
[    23.707] (II) AIGLX: Loaded and initialized swrast
[    23.707] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[    23.719] (II) NOUVEAU(0): NVEnterVT is called.
[    23.790] (II) NOUVEAU(0): Setting screen physical size to 380 x 238
[    23.790] resize called 1440 900
[    24.642] (II) config/udev: Adding input device Power Button (/dev/input/event4)
[    24.642] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    24.642] (II) LoadModule: "evdev"
[    24.643] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.657] (II) Module evdev: vendor="X.Org Foundation"
[    24.657] 	compiled for 1.11.0, module version = 2.6.0
[    24.657] 	Module class: X.Org XInput Driver
[    24.657] 	ABI class: X.Org XInput driver, version 13.0
[    24.658] (II) Using input driver 'evdev' for 'Power Button'
[    24.658] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.658] (**) Power Button: always reports core events
[    24.658] (**) Power Button: Device: "/dev/input/event4"
[    24.658] (--) Power Button: Found keys
[    24.658] (II) Power Button: Configuring as keyboard
[    24.658] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input4/event4"
[    24.658] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    24.658] (**) Option "xkb_rules" "evdev"
[    24.658] (**) Option "xkb_model" "pc105"
[    24.658] (**) Option "xkb_layout" "us"
[    24.659] (II) config/udev: Adding input device Power Button (/dev/input/event3)
[    24.659] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    24.659] (II) Using input driver 'evdev' for 'Power Button'
[    24.659] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.659] (**) Power Button: always reports core events
[    24.659] (**) Power Button: Device: "/dev/input/event3"
[    24.659] (--) Power Button: Found keys
[    24.659] (II) Power Button: Configuring as keyboard
[    24.659] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input3/event3"
[    24.659] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    24.659] (**) Option "xkb_rules" "evdev"
[    24.659] (**) Option "xkb_model" "pc105"
[    24.659] (**) Option "xkb_layout" "us"
[    24.661] (II) config/udev: Adding input device Razer Razer DeathAdder (/dev/input/event0)
[    24.661] (**) Razer Razer DeathAdder: Applying InputClass "evdev pointer catchall"
[    24.661] (II) Using input driver 'evdev' for 'Razer Razer DeathAdder'
[    24.661] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.661] (**) Razer Razer DeathAdder: always reports core events
[    24.661] (**) Razer Razer DeathAdder: Device: "/dev/input/event0"
[    24.661] (--) Razer Razer DeathAdder: Found 12 mouse buttons
[    24.661] (--) Razer Razer DeathAdder: Found scroll wheel(s)
[    24.661] (--) Razer Razer DeathAdder: Found relative axes
[    24.661] (--) Razer Razer DeathAdder: Found x and y relative axes
[    24.661] (II) Razer Razer DeathAdder: Configuring as mouse
[    24.661] (II) Razer Razer DeathAdder: Adding scrollwheel support
[    24.661] (**) Razer Razer DeathAdder: YAxisMapping: buttons 4 and 5
[    24.661] (**) Razer Razer DeathAdder: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    24.661] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-2/2-2:1.0/input/input0/event0"
[    24.661] (II) XINPUT: Adding extended input device "Razer Razer DeathAdder" (type: MOUSE, id 8)
[    24.661] (II) Razer Razer DeathAdder: initialized for relative axes.
[    24.661] (**) Razer Razer DeathAdder: (accel) keeping acceleration scheme 1
[    24.661] (**) Razer Razer DeathAdder: (accel) acceleration profile 0
[    24.661] (**) Razer Razer DeathAdder: (accel) acceleration factor: 2.000
[    24.661] (**) Razer Razer DeathAdder: (accel) acceleration threshold: 4
[    24.662] (II) config/udev: Adding input device Razer Razer DeathAdder (/dev/input/mouse0)
[    24.662] (II) No input driver/identifier specified (ignoring)
[    24.663] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/event1)
[    24.663] (**) IOGEAR GCS1104 V1.2.113: Applying InputClass "evdev keyboard catchall"
[    24.663] (II) Using input driver 'evdev' for 'IOGEAR GCS1104 V1.2.113'
[    24.663] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.663] (**) IOGEAR GCS1104 V1.2.113: always reports core events
[    24.663] (**) IOGEAR GCS1104 V1.2.113: Device: "/dev/input/event1"
[    24.663] (--) IOGEAR GCS1104 V1.2.113: Found keys
[    24.663] (II) IOGEAR GCS1104 V1.2.113: Configuring as keyboard
[    24.663] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1:1.0/input/input1/event1"
[    24.663] (II) XINPUT: Adding extended input device "IOGEAR GCS1104 V1.2.113" (type: KEYBOARD, id 9)
[    24.663] (**) Option "xkb_rules" "evdev"
[    24.664] (**) Option "xkb_model" "pc105"
[    24.664] (**) Option "xkb_layout" "us"
[    24.665] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/event2)
[    24.665] (**) IOGEAR GCS1104 V1.2.113: Applying InputClass "evdev pointer catchall"
[    24.665] (II) Using input driver 'evdev' for 'IOGEAR GCS1104 V1.2.113'
[    24.665] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    24.665] (**) IOGEAR GCS1104 V1.2.113: always reports core events
[    24.665] (**) IOGEAR GCS1104 V1.2.113: Device: "/dev/input/event2"
[    24.665] (--) IOGEAR GCS1104 V1.2.113: Found 9 mouse buttons
[    24.665] (--) IOGEAR GCS1104 V1.2.113: Found scroll wheel(s)
[    24.665] (--) IOGEAR GCS1104 V1.2.113: Found relative axes
[    24.665] (--) IOGEAR GCS1104 V1.2.113: Found x and y relative axes
[    24.665] (II) IOGEAR GCS1104 V1.2.113: Configuring as mouse
[    24.665] (II) IOGEAR GCS1104 V1.2.113: Adding scrollwheel support
[    24.665] (**) IOGEAR GCS1104 V1.2.113: YAxisMapping: buttons 4 and 5
[    24.665] (**) IOGEAR GCS1104 V1.2.113: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    24.665] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1:1.1/input/input2/event2"
[    24.665] (II) XINPUT: Adding extended input device "IOGEAR GCS1104 V1.2.113" (type: MOUSE, id 10)
[    24.665] (II) IOGEAR GCS1104 V1.2.113: initialized for relative axes.
[    24.666] (**) IOGEAR GCS1104 V1.2.113: (accel) keeping acceleration scheme 1
[    24.666] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration profile 0
[    24.666] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration factor: 2.000
[    24.666] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration threshold: 4
[    24.666] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/mouse1)
[    24.666] (II) No input driver/identifier specified (ignoring)
[    24.667] (II) config/udev: Adding input device PC Speaker (/dev/input/event5)
[    24.667] (II) No input driver/identifier specified (ignoring)
[    60.366] (II) NOUVEAU(0): NVLeaveVT is called.

From: Gabriele Tozzi <gabriele-oFZXMSULZhY@public.gmane.org>
Subject: Nouveau driver fails to resume
Date: Wed, 05 May 2010 04:12:22 +0200
Message-ID: <4BE0D406.4030400@tozzi.eu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000700030008080802010902"
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

This is a multi-part message in MIME format.
--------------000700030008080802010902
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I don't know where to start debugging this issue.

I'm attaching my xorg log.



--------------000700030008080802010902
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Xorg.0.log"


X.Org X Server 1.7.6
Release Date: 2010-03-17
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.24-27-server x86_64 Ubuntu
Current Operating System: Linux hell 2.6.32-21-generic #32-Ubuntu SMP Fri Apr 16 08:09:38 UTC 2010 x86_64
Kernel command line: root=UUID=19d64f2f-df06-432b-a168-d34c143a6f2d ro quiet splash 
Build Date: 23 April 2010  05:11:46PM
xorg-server 2:1.7.6-2ubuntu7 (Bryce Harrington <bryce-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>) 
Current version of pixman: 0.16.4
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Tue May  4 20:47:11 2010
(==) Using config file: "/etc/X11/xorg.conf"
(==) Using config directory: "/usr/lib/X11/xorg.conf.d"
(==) ServerLayout "default"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Card0"
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
(==) ModulePath set to "/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"
(II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
(II) Loader magic: 0x7ca300
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 6.0
	X.Org XInput driver : 7.0
	X.Org Server Extension : 2.0
(++) using VT number 7

(--) PCI:*(0:1:0:0) 10de:00f2:1043:81b1 nVidia Corporation NV43 [GeForce 6600] rev 162, Mem @ 0xfb000000/16777216, 0xe0000000/268435456, 0xfa000000/16777216, BIOS @ 0x????????/131072
(II) Open ACPI successful (/var/run/acpid.socket)
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
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
(II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions/librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.1.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 0.0.15
	Module class: X.Org Video Driver
	ABI class: X.Org Video Driver, version 6.0
(II) NOUVEAU driver Date:   Wed Feb 10 18:43:39 2010 +0100
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
(II) Primary Device is: PCI 01@00:00:0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 8, (OK)
drmOpenByBusid: drmOpenMinor returns 8
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] nouveau interface version: 0.0.15
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: drmOpenMinor returns 9
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(--) NOUVEAU(0): Chipset: "NVIDIA NV43"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(II) NOUVEAU(0): Output VGA-1 using monitor section Monitor1
(**) NOUVEAU(0): Option "PreferredMode" "1280x1024"
(**) NOUVEAU(0): Option "RightOf" "Monitor0"
(II) NOUVEAU(0): Output DVI-I-1 using monitor section Monitor0
(**) NOUVEAU(0): Option "PreferredMode" "1680x1050"
(**) NOUVEAU(0): Option "Position" "0 0"
(**) NOUVEAU(0): Option "Primary" "1"
(II) NOUVEAU(0): Output TV-1 has no monitor section
(II) NOUVEAU(0): EDID for output DVI-I-1
(II) NOUVEAU(0): Manufacturer: HWP  Model: 26a9  Serial#: 16843009
(II) NOUVEAU(0): Year: 2007  Week: 24
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Digital Display Input
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 47  vert.: 30
(II) NOUVEAU(0): Gamma: 2.20
(II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
(II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
(II) NOUVEAU(0): Default color space is primary color space
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): redX: 0.646 redY: 0.339   greenX: 0.290 greenY: 0.603
(II) NOUVEAU(0): blueX: 0.145 blueY: 0.065   whiteX: 0.313 whiteY: 0.329
(II) NOUVEAU(0): Supported established timings:
(II) NOUVEAU(0): 720x400@70Hz
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 832x624@75Hz
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): 1280x1024@75Hz
(II) NOUVEAU(0): 1152x864@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 10
(II) NOUVEAU(0): Supported standard timings:
(II) NOUVEAU(0): #0: hsize: 1152  vsize 720  refresh: 60  vid: 113
(II) NOUVEAU(0): #1: hsize: 1280  vsize 960  refresh: 60  vid: 16513
(II) NOUVEAU(0): #2: hsize: 1440  vsize 900  refresh: 60  vid: 149
(II) NOUVEAU(0): #3: hsize: 1600  vsize 1000  refresh: 60  vid: 169
(II) NOUVEAU(0): #4: hsize: 1680  vsize 1050  refresh: 60  vid: 179
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 146.2 MHz   Image Size:  473 x 296 mm
(II) NOUVEAU(0): h_active: 1680  h_sync: 1784  h_sync_end 1960 h_blank_end 2240 h_border: 0
(II) NOUVEAU(0): v_active: 1050  v_sync: 1053  v_sync_end 1059 v_blanking: 1089 v_border: 0
(II) NOUVEAU(0): Ranges: V min: 48 V max: 76 Hz, H min: 24 H max: 82 kHz, PixClock max 160 MHz
(II) NOUVEAU(0): Monitor name: HP w2207
(II) NOUVEAU(0): Serial No: CZD72402R4
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0): 	00ffffffffffff0022f0a92601010101
(II) NOUVEAU(0): 	18110103802f1e78eeb535a5564a9a25
(II) NOUVEAU(0): 	105054a56b90710081409500a900b300
(II) NOUVEAU(0): 	01010101010121399030621a274068b0
(II) NOUVEAU(0): 	3600d9281100001c000000fd00304c18
(II) NOUVEAU(0): 	5210000a202020202020000000fc0048
(II) NOUVEAU(0): 	502077323230370a20202020000000ff
(II) NOUVEAU(0): 	00435a44373234303252340a202000f1
(II) NOUVEAU(0): EDID vendor "HWP", prod id 9897
(II) NOUVEAU(0): Using EDID range info for horizontal sync
(II) NOUVEAU(0): Using EDID range info for vertical refresh
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1152x720"x60.0   67.32  1152 1208 1328 1504  720 721 724 746 -hsync +vsync (44.8 kHz)
(II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
(II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.14  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
(II) NOUVEAU(0): Printing probed modes for output DVI-I-1
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.16  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1152x720"x60.0   67.28  1152 1208 1328 1504  720 721 724 746 -hsync +vsync (44.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): EDID for output VGA-1
(II) NOUVEAU(0): Not using mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x350" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x175" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x400" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x200" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "720x400" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "360x200" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x480" (unknown reason)
(II) NOUVEAU(0): Not using default mode "320x240" (unknown reason)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x240" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x240" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "320x240" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (unknown reason)
(II) NOUVEAU(0): Not using default mode "400x300" (unknown reason)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "400x300" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (unknown reason)
(II) NOUVEAU(0): Not using default mode "512x384" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "512x384" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1280x960" (unknown reason)
(II) NOUVEAU(0): Not using default mode "640x480" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1280x960" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x480" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1280x1024" (unknown reason)
(II) NOUVEAU(0): Not using default mode "640x512" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1280x1024" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x512" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1280x1024" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "640x512" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1600x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "800x600" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1600x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1600x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1600x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1600x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "800x600" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1792x1344" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "896x672" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1792x1344" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "896x672" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1856x1392" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "928x696" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1856x1392" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "928x696" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "832x624" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "416x312" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (unknown reason)
(II) NOUVEAU(0): Not using default mode "576x432" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1152x864" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "576x432" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1360x768" (monitor doesn't support reduced blanking)
(II) NOUVEAU(0): Not using default mode "680x384" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1360x768" (unknown reason)
(II) NOUVEAU(0): Not using default mode "680x384" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1400x1050" (unknown reason)
(II) NOUVEAU(0): Not using default mode "700x525" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1400x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "700x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1400x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "700x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1400x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "700x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1440x900" (unknown reason)
(II) NOUVEAU(0): Not using default mode "720x450" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1600x1024" (unknown reason)
(II) NOUVEAU(0): Not using default mode "800x512" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1680x1050" (monitor doesn't support reduced blanking)
(II) NOUVEAU(0): Not using default mode "840x525" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1680x1050" (unknown reason)
(II) NOUVEAU(0): Not using default mode "840x525" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1680x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "840x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1680x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "840x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1680x1050" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "840x525" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "1920x1080" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "960x540" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1920x1200" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "960x600" (unknown reason)
(II) NOUVEAU(0): Not using default mode "1920x1440" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "960x720" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "2048x1536" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (hsync out of range)
(II) NOUVEAU(0): Not using default mode "2048x1536" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Not using default mode "2048x1536" (height too large for virtual size)
(II) NOUVEAU(0): Not using default mode "1024x768" (vrefresh out of range)
(II) NOUVEAU(0): Printing probed modes for output VGA-1
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088  480 486 494 517 +hsync +vsync (31.0 kHz)
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 489 492 525 -hsync -vsync (31.5 kHz)
(II) NOUVEAU(0): EDID for output TV-1
(II) NOUVEAU(0): Output DVI-I-1 connected
(II) NOUVEAU(0): Output VGA-1 connected
(II) NOUVEAU(0): Output TV-1 disconnected
(II) NOUVEAU(0): Using user preference for initial modes
(II) NOUVEAU(0): Output DVI-I-1 using initial mode 1680x1050
(II) NOUVEAU(0): Output VGA-1 using initial mode 1280x1024
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
(--) NOUVEAU(0): Virtual size is 2960x1050 (pitch 3008)
(**) NOUVEAU(0):  Mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
(**) NOUVEAU(0):  Driver mode "848x480": 33.8 MHz (scaled from 0.0 MHz), 31.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088  480 486 494 517 +hsync +vsync (31.0 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 489 492 525 -hsync -vsync (31.5 kHz)
(**) NOUVEAU(0): Display dimensions: (470, 300) mm
(**) NOUVEAU(0): DPI set to (159, 88)
(II) Loading sub module "fb"
(II) LoadModule: "fb"
(II) Loading /usr/lib/xorg/modules/libfb.so
(II) Module fb: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(II) Loading sub module "exa"
(II) LoadModule: "exa"
(II) Loading /usr/lib/xorg/modules/libexa.so
(II) Module exa: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 2.5.0
	ABI class: X.Org Video Driver, version 6.0
(II) Loading sub module "shadowfb"
(II) LoadModule: "shadowfb"
(II) Loading /usr/lib/xorg/modules/libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 1.0.0
	ABI class: X.Org ANSI C Emulation, version 0.4
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): Opened GPU channel 1
(II) NOUVEAU(0): [DRI2] Setup complete
(II) NOUVEAU(0): GART: 256MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) EXA(0): Driver allocated offscreen pixmaps
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(II) NOUVEAU(0): NVEnterVT is called.
(**) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
(WW) NOUVEAU(0): Option "Position" is not used
(WW) NOUVEAU(0): Option "Primary" is not used
(WW) NOUVEAU(0): Option "PreferredMode" is not used
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
(II) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed (/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or directory)
(II) AIGLX: reverting to software rendering
(II) AIGLX: Screen 0 is not DRI capable
(II) AIGLX: Loaded and initialized /usr/lib/dri/swrast_dri.so
(II) GLX: Initialized DRISWRAST GL provider for screen 0
(II) NOUVEAU(0): Setting screen physical size to 783 x 277
resize called 2960 1050
(II) XKB: reuse xkmfile /var/lib/xkb/server-B20D7FC79C7F597315E3E501AEF10E0D866E8E92.xkm
(II) config/udev: Adding input device Power Button (/dev/input/event2)
(**) Power Button: Applying InputClass "evdev keyboard catchall"
(II) LoadModule: "evdev"
(II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
(II) Module evdev: vendor="X.Org Foundation"
	compiled for 1.7.6, module version = 2.3.2
	Module class: X.Org XInput Driver
	ABI class: X.Org XInput driver, version 7.0
(**) Power Button: always reports core events
(**) Power Button: Device: "/dev/input/event2"
(II) Power Button: Found keys
(II) Power Button: Configuring as keyboard
(II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "pc105"
(**) Option "xkb_layout" "it"
(**) Option "xkb_options" "lv3:ralt_switch,compose:lwin"
(II) XKB: reuse xkmfile /var/lib/xkb/server-5DEFC18A2695BB03FD3C601C1F084B8653445428.xkm
(II) config/udev: Adding input device Power Button (/dev/input/event0)
(**) Power Button: Applying InputClass "evdev keyboard catchall"
(**) Power Button: always reports core events
(**) Power Button: Device: "/dev/input/event0"
(II) Power Button: Found keys
(II) Power Button: Configuring as keyboard
(II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "pc105"
(**) Option "xkb_layout" "it"
(**) Option "xkb_options" "lv3:ralt_switch,compose:lwin"
(II) config/udev: Adding input device Sleep Button (/dev/input/event1)
(**) Sleep Button: Applying InputClass "evdev keyboard catchall"
(**) Sleep Button: always reports core events
(**) Sleep Button: Device: "/dev/input/event1"
(II) Sleep Button: Found keys
(II) Sleep Button: Configuring as keyboard
(II) XINPUT: Adding extended input device "Sleep Button" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "pc105"
(**) Option "xkb_layout" "it"
(**) Option "xkb_options" "lv3:ralt_switch,compose:lwin"
(II) config/udev: Adding input device Logitech USB Receiver (/dev/input/event5)
(**) Logitech USB Receiver: Applying InputClass "evdev pointer catchall"
(**) Logitech USB Receiver: always reports core events
(**) Logitech USB Receiver: Device: "/dev/input/event5"
(II) Logitech USB Receiver: Found 9 mouse buttons
(II) Logitech USB Receiver: Found scroll wheel(s)
(II) Logitech USB Receiver: Found relative axes
(II) Logitech USB Receiver: Found x and y relative axes
(II) Logitech USB Receiver: Configuring as mouse
(**) Logitech USB Receiver: YAxisMapping: buttons 4 and 5
(**) Logitech USB Receiver: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Logitech USB Receiver" (type: MOUSE)
(II) Logitech USB Receiver: initialized for relative axes.
(II) config/udev: Adding input device Logitech USB Receiver (/dev/input/mouse1)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device USB Gamepad  (/dev/input/event6)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device USB Gamepad  (/dev/input/js0)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device AT Translated Set 2 keyboard (/dev/input/event4)
(**) AT Translated Set 2 keyboard: Applying InputClass "evdev keyboard catchall"
(**) AT Translated Set 2 keyboard: always reports core events
(**) AT Translated Set 2 keyboard: Device: "/dev/input/event4"
(II) AT Translated Set 2 keyboard: Found keys
(II) AT Translated Set 2 keyboard: Configuring as keyboard
(II) XINPUT: Adding extended input device "AT Translated Set 2 keyboard" (type: KEYBOARD)
(**) Option "xkb_rules" "evdev"
(**) Option "xkb_model" "pc105"
(**) Option "xkb_layout" "it"
(**) Option "xkb_options" "lv3:ralt_switch,compose:lwin"
(II) config/udev: Adding input device ImExPS/2 Generic Explorer Mouse (/dev/input/event7)
(**) ImExPS/2 Generic Explorer Mouse: Applying InputClass "evdev pointer catchall"
(**) ImExPS/2 Generic Explorer Mouse: always reports core events
(**) ImExPS/2 Generic Explorer Mouse: Device: "/dev/input/event7"
(II) ImExPS/2 Generic Explorer Mouse: Found 9 mouse buttons
(II) ImExPS/2 Generic Explorer Mouse: Found scroll wheel(s)
(II) ImExPS/2 Generic Explorer Mouse: Found relative axes
(II) ImExPS/2 Generic Explorer Mouse: Found x and y relative axes
(II) ImExPS/2 Generic Explorer Mouse: Configuring as mouse
(**) ImExPS/2 Generic Explorer Mouse: YAxisMapping: buttons 4 and 5
(**) ImExPS/2 Generic Explorer Mouse: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "ImExPS/2 Generic Explorer Mouse" (type: MOUSE)
(II) ImExPS/2 Generic Explorer Mouse: initialized for relative axes.
(II) config/udev: Adding input device ImExPS/2 Generic Explorer Mouse (/dev/input/mouse2)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device Macintosh mouse button emulation (/dev/input/event3)
(**) Macintosh mouse button emulation: Applying InputClass "evdev pointer catchall"
(**) Macintosh mouse button emulation: always reports core events
(**) Macintosh mouse button emulation: Device: "/dev/input/event3"
(II) Macintosh mouse button emulation: Found 3 mouse buttons
(II) Macintosh mouse button emulation: Found relative axes
(II) Macintosh mouse button emulation: Found x and y relative axes
(II) Macintosh mouse button emulation: Configuring as mouse
(**) Macintosh mouse button emulation: YAxisMapping: buttons 4 and 5
(**) Macintosh mouse button emulation: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
(II) XINPUT: Adding extended input device "Macintosh mouse button emulation" (type: MOUSE)
(II) Macintosh mouse button emulation: initialized for relative axes.
(II) config/udev: Adding input device Macintosh mouse button emulation (/dev/input/mouse0)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device USB Gamepad  (/dev/input/event6)
(II) No input driver/identifier specified (ignoring)
(II) config/udev: Adding input device USB Gamepad  (/dev/input/js0)
(II) No input driver/identifier specified (ignoring)

--------------000700030008080802010902
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------000700030008080802010902--

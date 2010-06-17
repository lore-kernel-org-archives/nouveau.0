From: yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org
Subject: nouveau - artefacts and crash with composite enabled
	(kwin4)
Date: Thu, 17 Jun 2010 13:29:02 +0200
Message-ID: <4C1A06FE.60605@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
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

I am using xorg-git,mesa-git and xf86-nouveau-git. I noticed that when I 
turn on compositions (kwin4) there are some problems with screen update, 
windows,menus are flashing.When I leave from kde to console I got 
crash.Here is xorg.0.log with crash and the end.

[  4324.923] 1 XSELINUXs still allocated at reset
[  4324.923] TOTAL: 0 objects, 0 bytes, 0 allocs
[  4324.924] 1 CLIENTs still allocated at reset
[  4324.924] TOTAL: 0 objects, 0 bytes, 0 allocs
[  4324.926]
This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.
[  4324.930]
X.Org X Server 1.8.99.901 (1.9.0 RC 1)
Release Date: 2010-06-15
[  4324.931] X Protocol Version 11, Revision 0
[  4324.932] Build Operating System: Linux 2.6.35-rc3-dirty i686
[  4324.933] Current Operating System: Linux zilog 2.6.35-rc3-dirty #1 
PREEMPT Sat Jun 12 22:58:23 CEST 2010 i686
[  4324.933] Kernel command line: 
root=/dev/disk/by-uuid/40a6e9f3-f5c4-4081-80db-d706b75ee4da ro
[  4324.934] Build Date: 16 June 2010  09:37:36PM
[  4324.934]
[  4324.935] Current version of pixman: 0.19.1
[  4324.936]     Before reporting problems, check http://wiki.x.org
     to make sure that you have the latest version.
[  4324.937] Markers: (--) probed, (**) from config file, (==) default 
setting,
     (++) from command line, (!!) notice, (II) informational,
     (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  4324.939] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Jun 17 
13:13:07 2010
[  4324.939] (==) Using config file: "/etc/X11/xorg.conf"
[  4324.940] (==) Using config directory: "/etc/X11/xorg.conf.d"
[  4324.941] (==) ServerLayout "X.org Configured"
[  4324.941] (**) |-->Screen "Screen0" (0)
[  4324.941] (**) |   |-->Monitor "Monitor0"
[  4324.941] (**) |   |-->Device "Card0"
[  4324.941] (**) |-->Input Device "Mouse0"
[  4324.941] (**) |-->Input Device "Keyboard0"
[  4324.941] (**) Option "AllowEmptyInput" "false"
[  4324.941] (==) Automatically adding devices
[  4324.941] (==) Automatically enabling devices
[  4324.942] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[  4324.942]     Entry deleted from font path.
[  4324.942] (WW) The directory "/usr/share/fonts/Type1/" does not exist.
[  4324.942]     Entry deleted from font path.
[  4324.942] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[  4324.942]     Entry deleted from font path.
[  4324.942] (WW) The directory "/usr/share/fonts/Type1/" does not exist.
[  4324.942]     Entry deleted from font path.
[  4324.942] (**) FontPath set to:
     /usr/share/fonts/misc/,
     /usr/share/fonts/TTF/,
     /usr/share/fonts/100dpi/,
     /usr/share/fonts/75dpi/,
     /usr/share/fonts/misc/,
     /usr/share/fonts/TTF/,
     /usr/share/fonts/100dpi/,
     /usr/share/fonts/75dpi/
[  4324.942] (**) ModulePath set to "/usr/lib/xorg/modules"
[  4324.942] (**) Extension "Composite" is enabled
[  4324.942] (II) Loader magic: 0x81ee800
[  4324.942] (II) Module ABI versions:
[  4324.942]     X.Org ANSI C Emulation: 0.4
[  4324.942]     X.Org Video Driver: 8.0
[  4324.942]     X.Org XInput driver : 11.0
[  4324.942]     X.Org Server Extension : 4.0
[  4324.957] (--) PCI:*(0:1:0:0) 10de:0171:0000:0000 nVidia Corporation 
NV17 [GeForce4 MX 440] rev 163, Mem @ 0xce000000/16777216, 
0xc0000000/134217728, 0xcdb80000/524288, BIOS @ 0x????????/131072
[  4324.957] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file 
or directory)
[  4324.957] (II) "extmod" will be loaded. This was enabled by default 
and also specified in the config file.
[  4324.957] (II) "dbe" will be loaded. This was enabled by default and 
also specified in the config file.
[  4324.957] (II) "glx" will be loaded. This was enabled by default and 
also specified in the config file.
[  4324.957] (II) "dri" will be loaded. This was enabled by default and 
also specified in the config file.
[  4324.957] (II) "dri2" will be loaded. This was enabled by default and 
also specified in the config file.
[  4324.957] (II) LoadModule: "record"
[  4324.958] (WW) Warning, couldn't open module record
[  4324.958] (II) UnloadModule: "record"
[  4324.958] (EE) Failed to load module "record" (module does not exist, 0)
[  4324.958] (II) LoadModule: "extmod"
[  4324.959] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[  4324.959] (II) Module extmod: vendor="X.Org Foundation"
[  4324.959]     compiled for 1.8.99.901, module version = 1.0.0
[  4324.959]     Module class: X.Org Server Extension
[  4324.959]     ABI class: X.Org Server Extension, version 4.0
[  4324.959] (II) Loading extension MIT-SCREEN-SAVER
[  4324.959] (II) Loading extension XFree86-VidModeExtension
[  4324.959] (II) Loading extension XFree86-DGA
[  4324.959] (II) Loading extension DPMS
[  4324.959] (II) Loading extension XVideo
[  4324.959] (II) Loading extension XVideo-MotionCompensation
[  4324.959] (II) Loading extension X-Resource
[  4324.959] (II) LoadModule: "glx"
[  4324.960] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[  4324.960] (II) Module glx: vendor="X.Org Foundation"
[  4324.960]     compiled for 1.8.99.901, module version = 1.0.0
[  4324.960]     ABI class: X.Org Server Extension, version 4.0
[  4324.960] (==) AIGLX enabled
[  4324.960] (II) Loading extension GLX
[  4324.960] (II) LoadModule: "dri2"
[  4324.960] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[  4324.960] (II) Module dri2: vendor="X.Org Foundation"
[  4324.960]     compiled for 1.8.99.901, module version = 1.2.0
[  4324.961]     ABI class: X.Org Server Extension, version 4.0
[  4324.961] (II) Loading extension DRI2
[  4324.961] (II) LoadModule: "dri"
[  4324.961] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[  4324.961] (II) Module dri: vendor="X.Org Foundation"
[  4324.961]     compiled for 1.8.99.901, module version = 1.0.0
[  4324.961]     ABI class: X.Org Server Extension, version 4.0
[  4324.961] (II) Loading extension XFree86-DRI
[  4324.961] (II) LoadModule: "dbe"
[  4324.961] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[  4324.961] (II) Module dbe: vendor="X.Org Foundation"
[  4324.961]     compiled for 1.8.99.901, module version = 1.0.0
[  4324.961]     Module class: X.Org Server Extension
[  4324.961]     ABI class: X.Org Server Extension, version 4.0
[  4324.961] (II) Loading extension DOUBLE-BUFFER
[  4324.962] (II) LoadModule: "nouveau"
[  4324.962] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  4324.962] (II) Module nouveau: vendor="X.Org Foundation"
[  4324.962]     compiled for 1.8.99.901, module version = 0.0.16
[  4324.962]     Module class: X.Org Video Driver
[  4324.962]     ABI class: X.Org Video Driver, version 8.0
[  4324.962] (II) LoadModule: "mouse"
[  4324.962] (II) Loading /usr/lib/xorg/modules/input/mouse_drv.so
[  4324.963] (II) Module mouse: vendor="X.Org Foundation"
[  4324.963]     compiled for 1.8.99.901, module version = 1.5.0
[  4324.963]     Module class: X.Org XInput Driver
[  4324.963]     ABI class: X.Org XInput driver, version 11.0
[  4324.963] (II) LoadModule: "kbd"
[  4324.963] (II) Loading /usr/lib/xorg/modules/input/kbd_drv.so
[  4324.963] (II) Module kbd: vendor="X.Org Foundation"
[  4324.963]     compiled for 1.8.99.901, module version = 1.4.0
[  4324.963]     Module class: X.Org XInput Driver
[  4324.963]     ABI class: X.Org XInput driver, version 11.0
[  4324.963] (II) NOUVEAU driver Date:   Tue Jun 15 15:32:36 2010 +0200
[  4324.963] (II) NOUVEAU driver for NVIDIA chipset families :
[  4324.963]     RIVA TNT    (NV04)
[  4324.963]     RIVA TNT2   (NV05)
[  4324.963]     GeForce 256 (NV10)
[  4324.963]     GeForce 2   (NV11, NV15)
[  4324.963]     GeForce 4MX (NV17, NV18)
[  4324.963]     GeForce 3   (NV20)
[  4324.963]     GeForce 4Ti (NV25, NV28)
[  4324.963]     GeForce FX  (NV3x)
[  4324.963]     GeForce 6   (NV4x)
[  4324.963]     GeForce 7   (G7x)
[  4324.964]     GeForce 8   (G8x)
[  4324.964] (--) using VT number 7

[  4324.965] drmOpenDevice: node name is /dev/dri/card0
[  4324.965] drmOpenDevice: open result is 7, (OK)
[  4324.965] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[  4324.965] drmOpenDevice: node name is /dev/dri/card0
[  4324.965] drmOpenDevice: open result is 7, (OK)
[  4324.965] drmOpenByBusid: drmOpenMinor returns 7
[  4324.966] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[  4324.966] (II) [drm] nouveau interface version: 0.0.16
[  4324.966] (II) Loading sub module "dri"
[  4324.966] (II) LoadModule: "dri"
[  4324.966] (II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
[  4324.966] (II) NOUVEAU(0): Loaded DRI module
[  4324.966] drmOpenDevice: node name is /dev/dri/card0
[  4324.966] drmOpenDevice: open result is 8, (OK)
[  4324.967] drmOpenDevice: node name is /dev/dri/card0
[  4324.967] drmOpenDevice: open result is 8, (OK)
[  4324.967] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[  4324.967] drmOpenDevice: node name is /dev/dri/card0
[  4324.967] drmOpenDevice: open result is 8, (OK)
[  4324.967] drmOpenByBusid: drmOpenMinor returns 8
[  4324.967] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[  4324.967] (II) [drm] DRM interface version 1.3
[  4324.967] (II) [drm] DRM open master succeeded.
[  4324.967] (--) NOUVEAU(0): Chipset: "NVIDIA NV17"
[  4324.967] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  4324.967] (==) NOUVEAU(0): RGB weight 888
[  4324.967] (==) NOUVEAU(0): Default visual is TrueColor
[  4324.967] (==) NOUVEAU(0): Using HW cursor
[  4325.073] (II) NOUVEAU(0): Output VGA-1 using monitor section Monitor0
[  4325.073] (**) NOUVEAU(0): Option "PreferredMode" "1280x1024_60.00"
[  4325.232] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[  4325.339] (II) NOUVEAU(0): EDID for output VGA-1
[  4325.339] (II) NOUVEAU(0): Not using default mode "640x350" (vrefresh 
out of range)
[  4325.339] (II) NOUVEAU(0): Not using default mode "320x175" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x400" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "320x200" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "720x400" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "360x200" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "320x240" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "320x240" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "320x240" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "320x240" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "400x300" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "400x300" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "400x300" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "400x300" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "400x300" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1024x768i" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "512x384i" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1024x768" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "512x384" (unknown 
reason)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1024x768" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "512x384" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1024x768" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "512x384" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1024x768" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "512x384" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1152x864" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "576x432" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1280x960" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1280x960" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x480" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1280x1024" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x512" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1280x1024" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x512" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1280x1024" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "640x512" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1600x1200" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (hsync 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1600x1200" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1600x1200" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1600x1200" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "1600x1200" 
(vrefresh out of range)
[  4325.340] (II) NOUVEAU(0): Not using default mode "800x600" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1792x1344" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "896x672" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1792x1344" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "896x672" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1856x1392" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "928x696" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1856x1392" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "928x696" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1920x1440" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "960x720" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1920x1440" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "960x720" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "832x624" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "416x312" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1400x1050" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "700x525" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1400x1050" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "700x525" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1920x1440" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "960x720" (vrefresh 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "2048x1536" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1024x768" (hsync 
out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "2048x1536" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1024x768" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "2048x1536" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Not using default mode "1024x768" 
(vrefresh out of range)
[  4325.341] (II) NOUVEAU(0): Printing probed modes for output VGA-1
[  4325.341] (II) NOUVEAU(0): Modeline "1280x1024_60.00"x60.0  108.88  
1280 1360 1496 1712  1024 1025 1028 1060 -hsync +vsync (63.6 kHz)
[  4325.341] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 
1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  4325.341] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  4325.341] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 
896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[  4325.341] (II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 
976 1088  480 486 494 517 +hsync +vsync (31.0 kHz)
[  4325.341] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 
752 800  480 489 492 525 -hsync -vsync (31.5 kHz)
[  4325.499] (II) NOUVEAU(0): EDID for output DVI-D-1
[  4325.499] (II) NOUVEAU(0): Output VGA-1 connected
[  4325.499] (II) NOUVEAU(0): Output DVI-D-1 disconnected
[  4325.499] (II) NOUVEAU(0): Using user preference for initial modes
[  4325.499] (II) NOUVEAU(0): Output VGA-1 using initial mode 
1280x1024_60.00
[  4325.499] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) 
unless otherwise stated.
[  4325.499] (--) NOUVEAU(0): Virtual size is 1280x1024 (pitch 1280)
[  4325.499] (**) NOUVEAU(0):  Mode "1280x1024_60.00": 108.9 MHz (scaled 
from 0.0 MHz), 63.6 kHz, 60.0 Hz
[  4325.499] (II) NOUVEAU(0): Modeline "1280x1024_60.00"x60.0  108.88  
1280 1360 1496 1712  1024 1025 1028 1060 -hsync +vsync (63.6 kHz)
[  4325.499] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled 
from 0.0 MHz), 48.4 kHz, 60.0 Hz
[  4325.499] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 
1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[  4325.500] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled 
from 0.0 MHz), 37.9 kHz, 60.3 Hz
[  4325.500] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[  4325.500] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled 
from 0.0 MHz), 35.2 kHz, 56.2 Hz
[  4325.500] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 
896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[  4325.500] (**) NOUVEAU(0):  Driver mode "848x480": 33.8 MHz (scaled 
from 0.0 MHz), 31.0 kHz, 60.0 Hz
[  4325.500] (II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 
976 1088  480 486 494 517 +hsync +vsync (31.0 kHz)
[  4325.500] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled 
from 0.0 MHz), 31.5 kHz, 59.9 Hz
[  4325.500] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656 
752 800  480 489 492 525 -hsync -vsync (31.5 kHz)
[  4325.500] (==) NOUVEAU(0): DPI set to (96, 96)
[  4325.500] (II) Loading sub module "fb"
[  4325.500] (II) LoadModule: "fb"
[  4325.500] (II) Loading /usr/lib/xorg/modules/libfb.so
[  4325.501] (II) Module fb: vendor="X.Org Foundation"
[  4325.501]     compiled for 1.8.99.901, module version = 1.0.0
[  4325.501]     ABI class: X.Org ANSI C Emulation, version 0.4
[  4325.501] (II) Loading sub module "exa"
[  4325.501] (II) LoadModule: "exa"
[  4325.501] (II) Loading /usr/lib/xorg/modules/libexa.so
[  4325.501] (II) Module exa: vendor="X.Org Foundation"
[  4325.501]     compiled for 1.8.99.901, module version = 2.5.0
[  4325.501]     ABI class: X.Org Video Driver, version 8.0
[  4325.501] (II) Loading sub module "shadowfb"
[  4325.501] (II) LoadModule: "shadowfb"
[  4325.501] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[  4325.501] (II) Module shadowfb: vendor="X.Org Foundation"
[  4325.501]     compiled for 1.8.99.901, module version = 1.0.0
[  4325.501]     ABI class: X.Org ANSI C Emulation, version 0.4
[  4325.501] (--) Depth 24 pixmap format is 32 bpp
[  4325.503] (II) NOUVEAU(0): Opened GPU channel 1
[  4325.503] (II) NOUVEAU(0): [DRI2] Setup complete
[  4325.503] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[  4325.503] (II) NOUVEAU(0): GART: 64MiB available
[  4325.506] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[  4325.506] (**) NOUVEAU(0): Option "MigrationHeuristic" "always"
[  4325.506] (**) NOUVEAU(0): Option "EXANoComposite" "false"
[  4325.506] (**) NOUVEAU(0): Option "EXAOptimizeMigration" "true"
[  4325.507] (II) EXA(0): Driver allocated offscreen pixmaps
[  4325.507] (II) EXA(0): Driver registered support for the following 
operations:
[  4325.507] (II)         Solid
[  4325.507] (II)         Copy
[  4325.507] (II)         Composite (RENDER acceleration)
[  4325.507] (II)         UploadToScreen
[  4325.507] (II)         DownloadFromScreen
[  4325.507] (==) NOUVEAU(0): Backing store disabled
[  4325.507] (==) NOUVEAU(0): Silken mouse enabled
[  4325.507] (**) NOUVEAU(0): DPMS enabled
[  4325.507] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following 
RandR disabled message.
[  4325.507] (WW) NOUVEAU(0): Option "PreferredMode" is not used
[  4325.508] (--) RandR disabled
[  4325.508] (II) Initializing built-in extension Generic Event Extension
[  4325.508] (II) Initializing built-in extension SHAPE
[  4325.508] (II) Initializing built-in extension MIT-SHM
[  4325.508] (II) Initializing built-in extension XInputExtension
[  4325.508] (II) Initializing built-in extension XTEST
[  4325.508] (II) Initializing built-in extension BIG-REQUESTS
[  4325.508] (II) Initializing built-in extension SYNC
[  4325.508] (II) Initializing built-in extension XKEYBOARD
[  4325.508] (II) Initializing built-in extension XC-MISC
[  4325.508] (II) Initializing built-in extension XINERAMA
[  4325.508] (II) Initializing built-in extension XFIXES
[  4325.508] (II) Initializing built-in extension RENDER
[  4325.508] (II) Initializing built-in extension RANDR
[  4325.508] (II) Initializing built-in extension COMPOSITE
[  4325.508] (II) Initializing built-in extension DAMAGE
[  4325.526] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[  4325.526] (II) AIGLX: enabled GLX_INTEL_swap_event
[  4325.526] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer 
objects
[  4325.527] (II) AIGLX: Loaded and initialized 
/usr/lib/xorg/modules/dri/nouveau_vieux_dri.so
[  4325.527] (II) GLX: Initialized DRI2 GL provider for screen 0
[  4325.530] (II) NOUVEAU(0): NVEnterVT is called.
[  4325.569] (II) NOUVEAU(0): Setting screen physical size to 338 x 270
[  4325.569] resize called 1280 1024
[  4326.112] (**) Option "Protocol" "auto"
[  4326.112] (**) Option "Device" "/dev/input/mice"
[  4326.112] (II) Mouse0: Setting mouse protocol to "ExplorerPS/2"
[  4326.112] (**) Mouse0: Device: "/dev/input/mice"
[  4326.112] (**) Mouse0: Protocol: "auto"
[  4326.112] (**) Option "CorePointer"
[  4326.112] (**) Mouse0: always reports core events
[  4326.112] (**) Option "Device" "/dev/input/mice"
[  4326.112] (==) Mouse0: Emulate3Buttons, Emulate3Timeout: 50
[  4326.112] (**) Option "ZAxisMapping" "4 5 6 7"
[  4326.112] (**) Mouse0: ZAxisMapping: buttons 4, 5, 6 and 7
[  4326.112] (**) Mouse0: Buttons: 11
[  4326.112] (**) Mouse0: Sensitivity: 1
[  4326.112] (II) XINPUT: Adding extended input device "Mouse0" (type: 
MOUSE)
[  4326.112] (**) Mouse0: (accel) keeping acceleration scheme 1
[  4326.113] (**) Mouse0: (accel) acceleration profile 0
[  4326.113] (**) Mouse0: (accel) acceleration factor: 2.000
[  4326.113] (**) Mouse0: (accel) acceleration threshold: 4
[  4326.113] (II) Mouse0: Setting mouse protocol to "ExplorerPS/2"
[  4326.404] (II) Mouse0: ps2EnableDataReporting: succeeded
[  4326.404] (**) Option "CoreKeyboard"
[  4326.404] (**) Keyboard0: always reports core events
[  4326.404] (**) Option "Protocol" "standard"
[  4326.404] (**) Keyboard0: Protocol: standard
[  4326.404] (**) Option "XkbRules" "base"
[  4326.404] (**) Keyboard0: XkbRules: "base"
[  4326.404] (**) Option "XkbModel" "pc105"
[  4326.404] (**) Keyboard0: XkbModel: "pc105"
[  4326.404] (**) Option "XkbLayout" "us"
[  4326.404] (**) Keyboard0: XkbLayout: "us"
[  4326.404] (**) Option "CustomKeycodes" "off"
[  4326.404] (**) Keyboard0: CustomKeycodes disabled
[  4326.405] (II) XINPUT: Adding extended input device "Keyboard0" 
(type: KEYBOARD)
[  4326.416] (II) config/udev: Adding input device Power Button 
(/dev/input/event2)
[  4326.416] (**) Power Button: Applying InputClass "evdev keyboard 
catchall"
[  4326.416] (II) LoadModule: "evdev"
[  4326.417] (WW) Warning, couldn't open module evdev
[  4326.417] (II) UnloadModule: "evdev"
[  4326.417] (EE) Failed to load module "evdev" (module does not exist, 0)
[  4326.417] (EE) No input driver matching `evdev'
[  4326.418] (II) config/udev: Adding input device Power Button 
(/dev/input/event1)
[  4326.418] (**) Power Button: Applying InputClass "evdev keyboard 
catchall"
[  4326.418] (II) LoadModule: "evdev"
[  4326.419] (WW) Warning, couldn't open module evdev
[  4326.419] (II) UnloadModule: "evdev"
[  4326.419] (EE) Failed to load module "evdev" (module does not exist, 0)
[  4326.419] (EE) No input driver matching `evdev'
[  4326.424] (II) config/udev: Adding input device AT Translated Set 2 
keyboard (/dev/input/event0)
[  4326.424] (**) AT Translated Set 2 keyboard: Applying InputClass 
"evdev keyboard catchall"
[  4326.424] (II) LoadModule: "evdev"
[  4326.425] (WW) Warning, couldn't open module evdev
[  4326.425] (II) UnloadModule: "evdev"
[  4326.425] (EE) Failed to load module "evdev" (module does not exist, 0)
[  4326.425] (EE) No input driver matching `evdev'
[  4326.425] (II) config/udev: Adding input device ImPS/2 Logitech Wheel 
Mouse (/dev/input/event4)
[  4326.425] (**) ImPS/2 Logitech Wheel Mouse: Applying InputClass 
"evdev pointer catchall"
[  4326.425] (II) LoadModule: "evdev"
[  4326.426] (WW) Warning, couldn't open module evdev
[  4326.426] (II) UnloadModule: "evdev"
[  4326.426] (EE) Failed to load module "evdev" (module does not exist, 0)
[  4326.426] (EE) No input driver matching `evdev'
[  4326.426] (II) config/udev: Adding input device ImPS/2 Logitech Wheel 
Mouse (/dev/input/mouse0)
[  4326.426] (II) No input driver/identifier specified (ignoring)
[  4326.427] (II) config/udev: Adding input device PC Speaker 
(/dev/input/event3)
[  4326.427] (II) No input driver/identifier specified (ignoring)
[  4411.078]
Backtrace:
[  4411.078] 0: /usr/bin/X (xorg_backtrace+0x3b) [0x80e49db]
[  4411.078] 1: /usr/bin/X (0x8048000+0x5c665) [0x80a4665]
[  4411.078] 2: (vdso) (__kernel_rt_sigreturn+0x0) [0xb770540c]
[  4411.078] 3: /usr/bin/X (FreeClientResources+0xdf) [0x808d68f]
[  4411.079] 4: /usr/bin/X (FreeAllResources+0x56) [0x808d746]
[  4411.079] 5: /usr/bin/X (0x8048000+0x1a101) [0x8062101]
[  4411.079] 6: /lib/libc.so.6 (__libc_start_main+0xe6) [0xb743cc76]
[  4411.079] 7: /usr/bin/X (0x8048000+0x19cb1) [0x8061cb1]
[  4411.079] Segmentation fault at address 0xff696969
[  4411.079]
Fatal server error:
[  4411.079] Caught signal 11 (Segmentation fault). Server aborting
[  4411.079]
[  4411.079]
Please consult the The X.Org Foundation support
      at http://wiki.x.org
  for help.
[  4411.079] Please also check the log file at "/var/log/Xorg.0.log" for 
additional information.
[  4411.079]
[  4411.083] (II) UnloadModule: "mouse"
[  4411.083] (II) UnloadModule: "kbd"
[  4411.083] (II) AIGLX: Suspending AIGLX clients for VT switch
[  4411.083] (II) NOUVEAU(0): NVLeaveVT is called.


----------------------------------------------------------------------
Mistrzowski konkurs - wygraj nowoczesny telefon komorkowy!
Sprawdz >>> http://linkint.pl/f2745

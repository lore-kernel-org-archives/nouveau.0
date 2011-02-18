From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Fri, 18 Feb 2011 13:00:09 -0800 (PST)
Message-ID: <20110218210048.4E413130009@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #46 from freedesktop-Dyxmr6A1vCaHHO0UwmCGxA@public.gmane.org 2011-02-18 12:59:56 PST ---
My Xorg was also blocking - only the mouse pointer keeps moving, but no other
thing happends.

I solved the problem (for now), by removing the comment for the option NoAccel
and setting the value to true. I'm using the xorg.conf generated with Xorg
-configure with just that change, and everything seem to be working. I'm even
using the composite from xfce4 (for the real transparent xfce4-terminal), and
it's working ok - maybe not as fast as with accelaration.

For me it was very simple to reproduce the error. As soon as gdm was active
(the default theme on debian - the one with the stars and the star rocket), a
click on any menu would block everything but the mouse movement.

Here is the log for my X when it was blocking.

Anything else I can do to help solve this?

X.Org X Server 1.9.4
Release Date: 2011-02-04
[   147.356] X Protocol Version 11, Revision 0
[   147.356] Build Operating System: Linux 2.6.32.28-dsa-ia32 i686 Debian
[   147.356] Current Operating System: Linux voyager 2.6.37-1-686 #1 SMP Tue
Feb 15 18:21:50 UTC 2011 i686
[   147.356] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.37-1-686
root=UUID=b69dfdff-c215-473f-9f91-1680b2773ef1 ro single
[   147.356] Build Date: 17 February 2011  01:25:01AM
[   147.356] xorg-server 2:1.9.4-2 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[   147.356] Current version of pixman: 0.21.4
[   147.356]     Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[   147.356] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   147.356] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 18 03:17:25
2011
[   147.356] (==) Using config file: "/etc/X11/xorg.conf"
[   147.356] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[   147.373] (==) ServerLayout "X.org Configured"
[   147.373] (**) |-->Screen "Screen0" (0)
[   147.373] (**) |   |-->Monitor "Monitor0"
[   147.374] (**) |   |-->Device "Card0"
[   147.374] (**) |-->Input Device "Mouse0"
[   147.374] (**) |-->Input Device "Keyboard0"
[   147.374] (==) Automatically adding devices
[   147.374] (==) Automatically enabling devices
[   147.452] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[   147.452]     Entry deleted from font path.
[   147.541] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[   147.541]     Entry deleted from font path.
[   147.541] (**) FontPath set to:
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
[   147.541] (**) ModulePath set to "/usr/lib/xorg/modules"
[   147.541] (WW) AllowEmptyInput is on, devices using drivers 'kbd', 'mouse'
or 'vmmouse' will be disabled.
[   147.541] (WW) Disabling Mouse0
[   147.541] (II) Loader magic: 0x81f7140
[   147.541] (II) Module ABI versions:
[   147.541]     X.Org ANSI C Emulation: 0.4
[   147.541]     X.Org Video Driver: 8.0
[   147.541]     X.Org XInput driver : 11.0
[   147.541]     X.Org Server Extension : 4.0
[   147.542] (--) PCI:*(0:2:0:0) 10de:086f:1043:16b2 rev 177, Mem @
0xfd000000/16777216, 0xe0000000/268435456, 0xde000000/33554432, I/O @
0x0000dc00/128, BIOS @ 0x????????/131072
[   147.542] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or
directory)
[   147.542] (II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) "glx" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) "record" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) "dri" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) "dri2" will be loaded. This was enabled by default and also
specified in the config file.
[   147.542] (II) LoadModule: "dri"
[   147.592] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[   147.624] (II) Module dri: vendor="X.Org Foundation"
[   147.624]     compiled for 1.9.4, module version = 1.0.0
[   147.624]     ABI class: X.Org Server Extension, version 4.0
[   147.624] (II) Loading extension XFree86-DRI
[   147.624] (II) LoadModule: "dri2"
[   147.624] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[   147.631] (II) Module dri2: vendor="X.Org Foundation"
[   147.631]     compiled for 1.9.4, module version = 1.2.0
[   147.631]     ABI class: X.Org Server Extension, version 4.0
[   147.631] (II) Loading extension DRI2
[   147.631] (II) LoadModule: "dbe"
[   147.631] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[   147.632] (II) Module dbe: vendor="X.Org Foundation"
[   147.632]     compiled for 1.9.4, module version = 1.0.0
[   147.632]     Module class: X.Org Server Extension
[   147.632]     ABI class: X.Org Server Extension, version 4.0
[   147.632] (II) Loading extension DOUBLE-BUFFER
[   147.632] (II) LoadModule: "extmod"
[   147.632] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[   147.634] (II) Module extmod: vendor="X.Org Foundation"
[   147.634]     compiled for 1.9.4, module version = 1.0.0
[   147.634]     Module class: X.Org Server Extension
[   147.634]     ABI class: X.Org Server Extension, version 4.0
[   147.634] (II) Loading extension SELinux
[   147.634] (II) Loading extension MIT-SCREEN-SAVER
[   147.634] (II) Loading extension XFree86-VidModeExtension
[   147.634] (II) Loading extension XFree86-DGA
[   147.634] (II) Loading extension DPMS
[   147.634] (II) Loading extension XVideo
[   147.634] (II) Loading extension XVideo-MotionCompensation
[   147.634] (II) Loading extension X-Resource
[   147.634] (II) LoadModule: "record"
[   147.634] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[   147.635] (II) Module record: vendor="X.Org Foundation"
[   147.635]     compiled for 1.9.4, module version = 1.13.0
[   147.635]     Module class: X.Org Server Extension
[   147.635]     ABI class: X.Org Server Extension, version 4.0
[   147.635] (II) Loading extension RECORD
[   147.635] (II) LoadModule: "glx"
[   147.653] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[   147.688] (II) Module glx: vendor="X.Org Foundation"
[   147.688]     compiled for 1.9.4, module version = 1.0.0
[   147.688]     ABI class: X.Org Server Extension, version 4.0
[   147.690] (==) AIGLX enabled
[   147.690] (II) Loading extension GLX
[   147.690] (II) LoadModule: "nouveau"
[   147.690] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[   147.717] (II) Module nouveau: vendor="X.Org Foundation"
[   147.717]     compiled for 1.9.4, module version = 0.0.16
[   147.717]     Module class: X.Org Video Driver
[   147.717]     ABI class: X.Org Video Driver, version 8.0
[   147.718] (II) LoadModule: "evdev"
[   147.718] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[   147.727] (II) Module evdev: vendor="X.Org Foundation"
[   147.727]     compiled for 1.9.4, module version = 2.6.0
[   147.728]     Module class: X.Org XInput Driver
[   147.728]     ABI class: X.Org XInput driver, version 11.0
[   147.728] (II) NOUVEAU driver Date:   Tue Nov 30 15:27:36 2010 +1000
[   147.728] (II) NOUVEAU driver for NVIDIA chipset families :
[   147.728]     RIVA TNT    (NV04)
[   147.728]     RIVA TNT2   (NV05)
[   147.728]     GeForce 256 (NV10)
[   147.728]     GeForce 2   (NV11, NV15)
[   147.728]     GeForce 4MX (NV17, NV18)
[   147.728]     GeForce 3   (NV20)
[   147.728]     GeForce 4Ti (NV25, NV28)
[   147.728]     GeForce FX  (NV3x)
[   147.728]     GeForce 6   (NV4x)
[   147.728]     GeForce 7   (G7x)
[   147.728]     GeForce 8   (G8x)
[   147.728] (++) using VT number 7

[   147.729] drmOpenDevice: node name is /dev/dri/card0
[   147.729] drmOpenDevice: open result is 7, (OK)
[   147.729] drmOpenByBusid: Searching for BusID pci:0000:02:00.0
[   147.729] drmOpenDevice: node name is /dev/dri/card0
[   147.729] drmOpenDevice: open result is 7, (OK)
[   147.729] drmOpenByBusid: drmOpenMinor returns 7
[   147.729] drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
[   147.729] (II) [drm] nouveau interface version: 0.0.16
[   147.729] (II) Loading sub module "dri"
[   147.729] (II) LoadModule: "dri"
[   147.730] (II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
[   147.730] (II) NOUVEAU(0): Loaded DRI module
[   147.730] drmOpenDevice: node name is /dev/dri/card0
[   147.730] drmOpenDevice: open result is 8, (OK)
[   147.730] drmOpenDevice: node name is /dev/dri/card0
[   147.730] drmOpenDevice: open result is 8, (OK)
[   147.730] drmOpenByBusid: Searching for BusID pci:0000:02:00.0
[   147.730] drmOpenDevice: node name is /dev/dri/card0
[   147.730] drmOpenDevice: open result is 8, (OK)
[   147.730] drmOpenByBusid: drmOpenMinor returns 8
[   147.730] drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
[   147.730] (II) [drm] DRM interface version 1.4
[   147.730] (II) [drm] DRM open master succeeded.
[   147.730] (--) NOUVEAU(0): Chipset: "NVIDIA NVac"
[   147.730] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[   147.730] (==) NOUVEAU(0): RGB weight 888
[   147.730] (==) NOUVEAU(0): Default visual is TrueColor
[   147.730] (==) NOUVEAU(0): Using HW cursor
[   147.730] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[   147.880] (II) NOUVEAU(0): Output LVDS-1 using monitor section Monitor0
[   147.976] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[   147.984] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[   148.132] (II) NOUVEAU(0): EDID for output LVDS-1
[   148.132] (II) NOUVEAU(0): Manufacturer: CPT  Model: 1401  Serial#: 0
[   148.132] (II) NOUVEAU(0): Year: 2008  Week: 39
[   148.132] (II) NOUVEAU(0): EDID Version: 1.3
[   148.132] (II) NOUVEAU(0): Digital Display Input
[   148.132] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 33  vert.: 21
[   148.132] (II) NOUVEAU(0): Gamma: 2.20
[   148.132] (II) NOUVEAU(0): No DPMS capabilities specified
[   148.132] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[   148.132] (II) NOUVEAU(0): First detailed timing is preferred mode
[   148.132] (II) NOUVEAU(0): redX: 0.595 redY: 0.343   greenX: 0.317 greenY:
0.559
[   148.132] (II) NOUVEAU(0): blueX: 0.156 blueY: 0.132   whiteX: 0.315 whiteY:
0.329
[   148.132] (II) NOUVEAU(0): Manufacturer's mask: 0
[   148.132] (II) NOUVEAU(0): Supported detailed timing:
[   148.132] (II) NOUVEAU(0): clock: 68.9 MHz   Image Size:  331 x 207 mm
[   148.132] (II) NOUVEAU(0): h_active: 1280  h_sync: 1312  h_sync_end 1344
h_blank_end 1408 h_border: 0
[   148.132] (II) NOUVEAU(0): v_active: 800  v_sync: 801  v_sync_end 804
v_blanking: 816 v_border: 0
[   148.132] (II) NOUVEAU(0): Unknown vendor-specific block f
[   148.132] (II) NOUVEAU(0):  CPT
[   148.132] (II) NOUVEAU(0):  CLAA154WB03A
[   148.132] (II) NOUVEAU(0): EDID (in hex):
[   148.132] (II) NOUVEAU(0):     00ffffffffffff000e14011400000000
[   148.132] (II) NOUVEAU(0):     27120103802115780a743d9857518f28
[   148.132] (II) NOUVEAU(0):     21505400000001010101010101010101
[   148.132] (II) NOUVEAU(0):     010101010101ea1a0080502010302020
[   148.132] (II) NOUVEAU(0):     13004bcf100000190000000f00202020
[   148.132] (II) NOUVEAU(0):     2020202020206e050f00000000fe0043
[   148.132] (II) NOUVEAU(0):     50540a202020202020202020000000fe
[   148.132] (II) NOUVEAU(0):     00434c4141313534574230334120004d
[   148.132] (II) NOUVEAU(0): EDID vendor "CPT", prod id 5121
[   148.132] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   148.132] (II) NOUVEAU(0): Modeline "1280x800"x0.0   68.90  1280 1312 1344
1408  800 801 804 816 -hsync -vsync (48.9 kHz)
[   148.132] (II) NOUVEAU(0): Printing probed modes for output LVDS-1
[   148.132] (II) NOUVEAU(0): Modeline "1280x800"x60.0   68.90  1280 1312 1344
1408  800 801 804 816 -hsync -vsync (48.9 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800 
480 483 487 500 -hsync +vsync (29.7 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896 
400 403 413 417 -hsync +vsync (24.8 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800 
400 403 409 417 -hsync +vsync (25.0 kHz)
[   148.132] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800 
350 353 363 366 -hsync +vsync (21.9 kHz)
[   148.229] (II) NOUVEAU(0): EDID for output VGA-1
[   148.236] (II) NOUVEAU(0): EDID for output HDMI-1
[   148.236] (II) NOUVEAU(0): Output LVDS-1 connected
[   148.236] (II) NOUVEAU(0): Output VGA-1 disconnected
[   148.236] (II) NOUVEAU(0): Output HDMI-1 disconnected
[   148.237] (II) NOUVEAU(0): Using exact sizes for initial modes
[   148.237] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1280x800
[   148.237] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[   148.237] (--) NOUVEAU(0): Virtual size is 1280x800 (pitch 0)
[   148.237] (**) NOUVEAU(0):  Driver mode "1280x800": 68.9 MHz (scaled from
0.0 MHz), 48.9 kHz, 60.0 Hz
[   148.237] (II) NOUVEAU(0): Modeline "1280x800"x60.0   68.90  1280 1312 1344
1408  800 801 804 816 -hsync -vsync (48.9 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "1024x768": 63.5 MHz (scaled from
0.0 MHz), 47.8 kHz, 59.9 Hz
[   148.237] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "800x600": 38.2 MHz (scaled from 0.0
MHz), 37.4 kHz, 59.9 Hz
[   148.237] (II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024
 600 603 607 624 -hsync +vsync (37.4 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "640x480": 23.8 MHz (scaled from 0.0
MHz), 29.7 kHz, 59.4 Hz
[   148.237] (II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800 
480 483 487 500 -hsync +vsync (29.7 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "720x400": 22.2 MHz (scaled from 0.0
MHz), 24.8 kHz, 59.6 Hz
[   148.237] (II) NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896 
400 403 413 417 -hsync +vsync (24.8 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "640x400": 20.0 MHz (scaled from 0.0
MHz), 25.0 kHz, 60.0 Hz
[   148.237] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800 
400 403 409 417 -hsync +vsync (25.0 kHz)
[   148.237] (**) NOUVEAU(0):  Driver mode "640x350": 17.5 MHz (scaled from 0.0
MHz), 21.9 kHz, 59.8 Hz
[   148.237] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800 
350 353 363 366 -hsync +vsync (21.9 kHz)
[   148.237] (**) NOUVEAU(0): Display dimensions: (330, 210) mm
[   148.237] (**) NOUVEAU(0): DPI set to (98, 96)
[   148.237] (II) Loading sub module "fb"
[   148.237] (II) LoadModule: "fb"
[   148.237] (II) Loading /usr/lib/xorg/modules/libfb.so
[   148.270] (II) Module fb: vendor="X.Org Foundation"
[   148.270]     compiled for 1.9.4, module version = 1.0.0
[   148.270]     ABI class: X.Org ANSI C Emulation, version 0.4
[   148.270] (II) Loading sub module "exa"
[   148.270] (II) LoadModule: "exa"
[   148.270] (II) Loading /usr/lib/xorg/modules/libexa.so
[   148.283] (II) Module exa: vendor="X.Org Foundation"
[   148.283]     compiled for 1.9.4, module version = 2.5.0
[   148.283]     ABI class: X.Org Video Driver, version 8.0
[   148.283] (II) Loading sub module "shadowfb"
[   148.283] (II) LoadModule: "shadowfb"
[   148.283] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[   148.284] (II) Module shadowfb: vendor="X.Org Foundation"
[   148.284]     compiled for 1.9.4, module version = 1.0.0
[   148.284]     ABI class: X.Org ANSI C Emulation, version 0.4
[   148.284] (--) Depth 24 pixmap format is 32 bpp
[   148.287] (II) NOUVEAU(0): Opened GPU channel 2
[   148.288] (II) NOUVEAU(0): [DRI2] Setup complete
[   148.288] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[   148.288] (II) NOUVEAU(0): GART: 512MiB available
[   148.289] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[   148.331] (II) EXA(0): Driver allocated offscreen pixmaps
[   148.332] (II) EXA(0): Driver registered support for the following
operations:
[   148.332] (II)         Solid
[   148.332] (II)         Copy
[   148.332] (II)         Composite (RENDER acceleration)
[   148.332] (II)         UploadToScreen
[   148.332] (II)         DownloadFromScreen
[   148.332] (==) NOUVEAU(0): Backing store disabled
[   148.332] (==) NOUVEAU(0): Silken mouse enabled
[   148.349] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[   148.349] (II) NOUVEAU(0): [XvMC] Extension initialized.
[   148.349] (==) NOUVEAU(0): DPMS enabled
[   148.349] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[   148.349] (--) RandR disabled
[   148.349] (II) Initializing built-in extension Generic Event Extension
[   148.349] (II) Initializing built-in extension SHAPE
[   148.349] (II) Initializing built-in extension MIT-SHM
[   148.349] (II) Initializing built-in extension XInputExtension
[   148.349] (II) Initializing built-in extension XTEST
[   148.349] (II) Initializing built-in extension BIG-REQUESTS
[   148.349] (II) Initializing built-in extension SYNC
[   148.349] (II) Initializing built-in extension XKEYBOARD
[   148.349] (II) Initializing built-in extension XC-MISC
[   148.349] (II) Initializing built-in extension XINERAMA
[   148.349] (II) Initializing built-in extension XFIXES
[   148.349] (II) Initializing built-in extension RENDER
[   148.349] (II) Initializing built-in extension RANDR
[   148.349] (II) Initializing built-in extension COMPOSITE
[   148.349] (II) Initializing built-in extension DAMAGE
[   148.350] (II) SELinux: Disabled on system
[   148.387] (II) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
[   148.387] (II) AIGLX: reverting to software rendering
[   148.387] (II) AIGLX: Screen 0 is not DRI capable
[   148.508] (II) AIGLX: Loaded and initialized /usr/lib/dri/swrast_dri.so
[   148.508] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[   148.511] (II) NOUVEAU(0): NVEnterVT is called.
[   148.511] (II) NOUVEAU(0): Setting screen physical size to 338 x 211
[   148.511] resize called 1280 800
[   149.108] (**) Option "CoreKeyboard"
[   149.108] (**) Keyboard0: always reports core events
[   149.108] (EE) Keyboard0: No device specified.
[   149.108] (II) UnloadModule: "evdev"
[   149.108] (EE) PreInit returned NULL for "Keyboard0"
[   149.116] (II) config/udev: Adding input device Power Button
(/dev/input/event5)
[   149.116] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[   149.116] (**) Power Button: always reports core events
[   149.116] (**) Power Button: Device: "/dev/input/event5"
[   149.132] (--) Power Button: Found keys
[   149.132] (II) Power Button: Configuring as keyboard
[   149.132] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD)
[   149.132] (**) Option "xkb_rules" "evdev"
[   149.132] (**) Option "xkb_model" "pc105"
[   149.132] (**) Option "xkb_layout" "pt"
[   149.254] (II) config/udev: Adding input device Video Bus
(/dev/input/event8)
[   149.254] (**) Video Bus: Applying InputClass "evdev keyboard catchall"
[   149.254] (**) Video Bus: always reports core events
[   149.254] (**) Video Bus: Device: "/dev/input/event8"
[   149.256] (--) Video Bus: Found keys
[   149.256] (II) Video Bus: Configuring as keyboard
[   149.256] (II) XINPUT: Adding extended input device "Video Bus" (type:
KEYBOARD)
[   149.256] (**) Option "xkb_rules" "evdev"
[   149.256] (**) Option "xkb_model" "pc105"
[   149.256] (**) Option "xkb_layout" "pt"
[   149.257] (II) config/udev: Adding input device Power Button
(/dev/input/event2)
[   149.257] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[   149.257] (**) Power Button: always reports core events
[   149.257] (**) Power Button: Device: "/dev/input/event2"
[   149.257] (--) Power Button: Found keys
[   149.257] (II) Power Button: Configuring as keyboard
[   149.257] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD)
[   149.257] (**) Option "xkb_rules" "evdev"
[   149.257] (**) Option "xkb_model" "pc105"
[   149.257] (**) Option "xkb_layout" "pt"
[   149.258] (II) config/udev: Adding input device Lid Switch
(/dev/input/event4)
[   149.258] (II) No input driver/identifier specified (ignoring)
[   149.258] (II) config/udev: Adding input device Sleep Button
(/dev/input/event3)
[   149.258] (**) Sleep Button: Applying InputClass "evdev keyboard catchall"
[   149.258] (**) Sleep Button: always reports core events
[   149.258] (**) Sleep Button: Device: "/dev/input/event3"
[   149.260] (--) Sleep Button: Found keys
[   149.260] (II) Sleep Button: Configuring as keyboard
[   149.260] (II) XINPUT: Adding extended input device "Sleep Button" (type:
KEYBOARD)
[   149.260] (**) Option "xkb_rules" "evdev"
[   149.260] (**) Option "xkb_model" "pc105"
[   149.260] (**) Option "xkb_layout" "pt"
[   149.264] (II) config/udev: Adding input device HID 04d9:048e
(/dev/input/event1)
[   149.264] (**) HID 04d9:048e: Applying InputClass "evdev pointer catchall"
[   149.264] (**) HID 04d9:048e: always reports core events
[   149.264] (**) HID 04d9:048e: Device: "/dev/input/event1"
[   149.264] (--) HID 04d9:048e: Found 9 mouse buttons
[   149.264] (--) HID 04d9:048e: Found scroll wheel(s)
[   149.264] (--) HID 04d9:048e: Found relative axes
[   149.264] (--) HID 04d9:048e: Found x and y relative axes
[   149.264] (II) HID 04d9:048e: Configuring as mouse
[   149.264] (II) HID 04d9:048e: Adding scrollwheel support
[   149.264] (**) HID 04d9:048e: YAxisMapping: buttons 4 and 5
[   149.264] (**) HID 04d9:048e: EmulateWheelButton: 4, EmulateWheelInertia:
10, EmulateWheelTimeout: 200
[   149.264] (II) XINPUT: Adding extended input device "HID 04d9:048e" (type:
MOUSE)
[   149.264] (**) HID 04d9:048e: (accel) keeping acceleration scheme 1
[   149.264] (**) HID 04d9:048e: (accel) acceleration profile 0
[   149.264] (**) HID 04d9:048e: (accel) acceleration factor: 2.000
[   149.264] (**) HID 04d9:048e: (accel) acceleration threshold: 4
[   149.264] (II) HID 04d9:048e: initialized for relative axes.
[   149.264] (II) config/udev: Adding input device HID 04d9:048e
(/dev/input/mouse0)
[   149.264] (II) No input driver/identifier specified (ignoring)
[   149.265] (II) config/udev: Adding input device HDA Digital PCBeep
(/dev/input/event10)
[   149.265] (II) No input driver/identifier specified (ignoring)
[   149.266] (II) config/udev: Adding input device HDA NVidia Mic
(/dev/input/event11)
[   149.266] (II) No input driver/identifier specified (ignoring)
[   149.270] (II) config/udev: Adding input device Asus Laptop extra buttons
(/dev/input/event9)
[   149.270] (**) Asus Laptop extra buttons: Applying InputClass "evdev
keyboard catchall"
[   149.270] (**) Asus Laptop extra buttons: always reports core events
[   149.270] (**) Asus Laptop extra buttons: Device: "/dev/input/event9"
[   149.270] (--) Asus Laptop extra buttons: Found keys
[   149.270] (II) Asus Laptop extra buttons: Configuring as keyboard
[   149.270] (II) XINPUT: Adding extended input device "Asus Laptop extra
buttons" (type: KEYBOARD)
[   149.270] (**) Option "xkb_rules" "evdev"
[   149.270] (**) Option "xkb_model" "pc105"
[   149.270] (**) Option "xkb_layout" "pt"
[   149.271] (II) config/udev: Adding input device AT Translated Set 2 keyboard
(/dev/input/event0)
[   149.271] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev
keyboard catchall"
[   149.271] (**) AT Translated Set 2 keyboard: always reports core events
[   149.271] (**) AT Translated Set 2 keyboard: Device: "/dev/input/event0"
[   149.271] (--) AT Translated Set 2 keyboard: Found keys
[   149.271] (II) AT Translated Set 2 keyboard: Configuring as keyboard
[   149.271] (II) XINPUT: Adding extended input device "AT Translated Set 2
keyboard" (type: KEYBOARD)
[   149.271] (**) Option "xkb_rules" "evdev"
[   149.271] (**) Option "xkb_model" "pc105"
[   149.271] (**) Option "xkb_layout" "pt"
[   149.272] (II) config/udev: Adding input device SynPS/2 Synaptics TouchPad
(/dev/input/event7)
[   149.272] (**) SynPS/2 Synaptics TouchPad: Applying InputClass "evdev
touchpad catchall"
[   149.272] (**) SynPS/2 Synaptics TouchPad: always reports core events
[   149.272] (**) SynPS/2 Synaptics TouchPad: Device: "/dev/input/event7"
[   149.272] (--) SynPS/2 Synaptics TouchPad: Found 3 mouse buttons
[   149.272] (--) SynPS/2 Synaptics TouchPad: Found absolute axes
[   149.272] (--) SynPS/2 Synaptics TouchPad: Found x and y absolute axes
[   149.272] (--) SynPS/2 Synaptics TouchPad: Found absolute touchpad.
[   149.272] (II) SynPS/2 Synaptics TouchPad: Configuring as touchpad
[   149.272] (**) SynPS/2 Synaptics TouchPad: YAxisMapping: buttons 4 and 5
[   149.272] (**) SynPS/2 Synaptics TouchPad: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[   149.272] (II) XINPUT: Adding extended input device "SynPS/2 Synaptics
TouchPad" (type: TOUCHPAD)
[   149.272] (II) SynPS/2 Synaptics TouchPad: initialized for absolute axes.
[   149.272] (II) config/udev: Adding input device SynPS/2 Synaptics TouchPad
(/dev/input/mouse1)
[   149.272] (II) No input driver/identifier specified (ignoring)
[   149.273] (II) config/udev: Adding input device PC Speaker
(/dev/input/event6)
[   149.273] (II) No input driver/identifier specified (ignoring)
[   164.125] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[   164.125] 
Backtrace:
[   164.125] 0: /usr/bin/X (xorg_backtrace+0x3b) [0x80adddb]
[   164.125] 1: /usr/bin/X (mieqEnqueue+0x1ab) [0x80a036b]
[   164.126] 2: /usr/bin/X (xf86PostMotionEventP+0xd2) [0x80b31f2]
[   164.126] 3: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7410000+0x462d)
[0xb741462d]
[   164.126] 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xb7410000+0x48c8)
[0xb74148c8]
[   164.126] 5: /usr/bin/X (0x8048000+0x6962f) [0x80b162f]
[   164.126] 6: /usr/bin/X (0x8048000+0x1133a4) [0x815b3a4]
[   164.126] 7: (vdso) (__kernel_sigreturn+0x0) [0xb7817400]
[   164.126] 8: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3b) [0xb780308b]
[   164.126] 9: /usr/lib/libdrm_nouveau.so.1 (0xb741a000+0x2cfa) [0xb741ccfa]
[   164.126] 10: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xf1)
[0xb741cf01]
[   164.126] 11: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map+0x33)
[0xb741cfd3]
[   164.126] 12: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0xb7375000+0x499a) [0xb737999a]
[   164.126] 13: /usr/lib/xorg/modules/libexa.so (0xb733f000+0x57e8)
[0xb73447e8]
[   164.126] 14: /usr/lib/xorg/modules/libexa.so (0xb733f000+0x5be5)
[0xb7344be5]
[   164.126] 15: /usr/lib/xorg/modules/libexa.so (0xb733f000+0x839b)
[0xb734739b]
[   164.126] 16: /usr/lib/xorg/modules/libexa.so (0xb733f000+0x13909)
[0xb7352909]
[   164.126] 17: /usr/lib/xorg/modules/libexa.so (0xb733f000+0xf387)
[0xb734e387]
[   164.126] 18: /usr/bin/X (0x8048000+0xd611d) [0x811e11d]
[   164.126] 19: /usr/bin/X (CompositePicture+0x200) [0x810f3c0]
[   164.126] 20: /usr/lib/xorg/modules/libexa.so (0xb733f000+0xe924)
[0xb734d924]
[   164.126] 21: /usr/bin/X (CompositeTrapezoids+0xa8) [0x810f0a8]
[   164.126] 22: /usr/bin/X (0x8048000+0xd1d7a) [0x8119d7a]
[   164.126] 23: /usr/bin/X (0x8048000+0xcbb03) [0x8113b03]
[   164.126] 24: /usr/bin/X (0x8048000+0x2bfb7) [0x8073fb7]
[   164.126] 25: /usr/bin/X (0x8048000+0x1e63a) [0x806663a]
[   164.126] 26: /lib/i686/cmov/libc.so.6 (__libc_start_main+0xe6) [0xb752cc76]
[   164.126] 27: /usr/bin/X (0x8048000+0x1e211) [0x8066211]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

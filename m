From: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: NV46 disconnected VGA
Date: Tue, 26 Apr 2011 01:58:01 -0700 (PDT)
Message-ID: <951193.71954.qm@web161608.mail.bf1.yahoo.com>
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

Hi,

I have an unexpected problem: the chip recognized as NV46 does not 
connnect/display VGA on LCD.
Using mesa/gallium and xorg-server/xf86-video-nouveau from git, kernel 2.6.38, 
device in /etc/X11/xorg.conf:

Section "Device"
    Identifier    "NVIDIA NV46"
    VendorName    "NVIDIA Corp"
    Driver        "nouveau"

    Option        "Monitor-LVDS-1"    "LCD 15.4'' WXGA"
    Option        "Monitor-VGA-1"        "LCD"
    Option        "Monitor-TV-1"        "<Missing>"

    Option        "HW_cursor"        "true"
    Option        "ModeDebug"        "On"
EndSection

command line = /usr/bin/Xorg -audit 0 -logverbose 9 -c r -layout Default -dpi 75

user@localhost $ cat /var/log/Xorg.0.log:

[  1751.351] 
This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.
[  1751.352] 
X.Org X Server 1.10.99.1
Release Date: unreleased
[  1751.352] X Protocol Version 11, Revision 0
[  1751.352] Build Operating System: Linux 2.6.38-pf6 x86_64 Gentoo
[  1751.352] Current Operating System: Linux localhost 2.6.38-pf6 #1 SMP PREEMPT 

Sat Apr 23 21:49:39 EEST 2011 x86_64
[  1751.352] Kernel command line: auto BOOT_IMAGE=Gentoo2.6 [...]
[  1751.352] Build Date: 25 April 2011  11:54:55PM
[  1751.352]  
[  1751.352] Current version of pixman: 0.21.9
[  1751.352]     Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[  1751.352] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[  1751.352] (==) Log file: "/var/log/Xorg.0.log", Time: Tue Apr 26 00:04:02 
2011
[  1751.352] (==) Using config file: "/etc/X11/xorg.conf"
[  1751.352] (==) Using config directory: "/etc/X11/xorg.conf.d"
[  1751.352] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[  1751.354] (**) Option "defaultserverlayout" "SV"
[  1751.354] (++) ServerLayout "Default"
[  1751.354] (**) |-->Screen "Console1" (0)
[  1751.354] (**) |   |-->Monitor "LCD 15.4'' WXGA"
[  1751.354] (**) |   |-->Device "NVIDIA NV46"
[  1751.354] (**) |-->Screen "LCD2" (1)
[  1751.354] (**) |   |-->Monitor "LCD"
[  1751.355] (**) |   |-->Device "NVIDIA NV46"
[  1751.355] (**) Option "DontVTSwitch" "false"
[  1751.355] (**) Option "DontZap" "true"
[  1751.355] (**) Option "DontZoom" "true"
[  1751.355] (**) Option "AllowNonLocalXvidtune" "off"
[  1751.355] (**) Option "AllowMouseOpenFail"
[  1751.355] (**) Option "AIGLX" "on"
[  1751.355] (**) Option "UseDefaultFontPath" "false"
[  1751.355] (**) Option "AutoAddDevices" "true"
[  1751.355] (**) Option "AutoEnableDevices" "true"
[  1751.355] (**) Automatically adding devices
[  1751.355] (**) Automatically enabling devices
[  1751.355] (**) FontPath set to:
    /usr/share/fonts/misc,
    /usr/share/fonts/75dpi,
    /usr/share/fonts/100dpi,
ModulePath set to "/usr/lib/xorg/modules"
[  1751.355] (**) Extension "RANDR" is enabled
[  1751.355] (**) Extension "RENDER" is enabled
[  1751.355] (**) Extension "DAMAGE" is enabled
[  1751.355] (**) Extension "XTEST" is enabled
[  1751.355] (**) Extension "XVideo" is enabled
[  1751.355] (**) Extension "Composite" is enabled
[  1751.356] (II) The server relies on udev to provide the list of input 
devices.
    If no devices become available, reconfigure udev or disable AutoAddDevices.
[  1751.356] (II) Loader magic: 0x7d4140
[  1751.356] (II) Module ABI versions:
[  1751.356]     X.Org ANSI C Emulation: 0.4
[  1751.356]     X.Org Video Driver: 10.0
[  1751.356]     X.Org XInput driver : 12.2
[  1751.356]     X.Org Server Extension : 5.0
[  1751.357] (--) PCI:*(0:1:0:0) 10de:01d7:1179:ff02 rev 161, Mem @ 
0xdd000000/16777216, 0xc0000000/268435456, 0xdc000000/16777216
[  1751.357] (II) "extmod" will be loaded. This was enabled by default and also 
specified in the config file.
[  1751.357] (II) "dbe" will be loaded by default.
[  1751.357] (II) "glx" will be loaded by default.
[  1751.357] (II) "record" will be loaded by default.
[  1751.357] (II) "dri" will be loaded by default.
[  1751.357] (II) "dri2" will be loaded by default.
[  1751.357] (II) LoadModule: "extmod"
[  1751.357] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[  1751.358] (II) Module extmod: vendor="X.Org Foundation"
[  1751.358]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.358]     Module class: X.Org Server Extension
[  1751.358]     ABI class: X.Org Server Extension, version 5.0
[  1751.358] (II) Loading extension MIT-SCREEN-SAVER
[  1751.358] (II) Loading extension XFree86-VidModeExtension
[  1751.358] (II) Loading extension DPMS
[  1751.358] (II) Loading extension XVideo
[  1751.358] (II) Loading extension XVideo-MotionCompensation
[  1751.358] (II) Loading extension X-Resource
[  1751.358] (II) LoadModule: "dbe"
[  1751.358] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[  1751.358] (II) Module dbe: vendor="X.Org Foundation"
[  1751.358]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.358]     Module class: X.Org Server Extension
[  1751.358]     ABI class: X.Org Server Extension, version 5.0
[  1751.358] (II) Loading extension DOUBLE-BUFFER
[  1751.358] (II) LoadModule: "glx"
[  1751.358] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[  1751.358] (II) Module glx: vendor="X.Org Foundation"
[  1751.358]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.358]     ABI class: X.Org Server Extension, version 5.0
[  1751.358] (**) AIGLX enabled
[  1751.358] (II) Loading extension GLX
[  1751.359] (II) LoadModule: "record"
[  1751.359] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[  1751.359] (II) Module record: vendor="X.Org Foundation"
[  1751.359]     compiled for 1.10.99.1, module version = 1.13.0
[  1751.359]     Module class: X.Org Server Extension
[  1751.359]     ABI class: X.Org Server Extension, version 5.0
[  1751.359] (II) Loading extension RECORD
[  1751.359] (II) LoadModule: "dri"
[  1751.359] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[  1751.359] (II) Module dri: vendor="X.Org Foundation"
[  1751.359]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.359]     ABI class: X.Org Server Extension, version 5.0
[  1751.359] (II) Loading extension XFree86-DRI
[  1751.359] (II) LoadModule: "dri2"
[  1751.359] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[  1751.360] (II) Module dri2: vendor="X.Org Foundation"
[  1751.360]     compiled for 1.10.99.1, module version = 1.2.0
[  1751.360]     ABI class: X.Org Server Extension, version 5.0
[  1751.360] (II) Loading extension DRI2
[  1751.360] (II) LoadModule: "nouveau"
[  1751.360] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  1751.360] (II) Module nouveau: vendor="X.Org Foundation"
[  1751.360]     compiled for 1.10.99.1, module version = 0.0.16
[  1751.360]     Module class: X.Org Video Driver
[  1751.360]     ABI class: X.Org Video Driver, version 10.0
[  1751.360] (II) NOUVEAU driver 
[  1751.360] (II) NOUVEAU driver for NVIDIA chipset families :
[  1751.360]     RIVA TNT        (NV04)
[  1751.360]     RIVA TNT2       (NV05)
[  1751.360]     GeForce 256     (NV10)
[  1751.360]     GeForce 2       (NV11, NV15)
[  1751.360]     GeForce 4MX     (NV17, NV18)
[  1751.360]     GeForce 3       (NV20)
[  1751.360]     GeForce 4Ti     (NV25, NV28)
[  1751.360]     GeForce FX      (NV3x)
[  1751.361]     GeForce 6       (NV4x)
[  1751.361]     GeForce 7       (G7x)
[  1751.361]     GeForce 8       (G8x)
[  1751.361]     GeForce GTX 200 (NVA0)
[  1751.361]     GeForce GTX 400 (NVC0)
[  1751.361] (++) using VT number 7

[  1751.364] drmOpenDevice: node name is /dev/dri/card0
[  1751.364] drmOpenDevice: open result is 8, (OK)
[  1751.364] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[  1751.364] drmOpenDevice: node name is /dev/dri/card0
[  1751.364] drmOpenDevice: open result is 8, (OK)
[  1751.364] drmOpenByBusid: drmOpenMinor returns 8
[  1751.364] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[  1751.364] (II) [drm] nouveau interface version: 0.0.16
[  1751.364] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[  1751.364] (WW) VGA arbiter: cannot open kernel arbiter, no multi-card support
[  1751.364] (II) Loading sub module "dri"
[  1751.364] (II) LoadModule: "dri"
[  1751.364] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[  1751.364] (II) Module dri: vendor="X.Org Foundation"
[  1751.364]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.364]     ABI class: X.Org Server Extension, version 5.0
[  1751.365] (II) NOUVEAU(0): Loaded DRI module
[  1751.365] drmOpenDevice: node name is /dev/dri/card0
[  1751.365] drmOpenDevice: open result is 8, (OK)
[  1751.365] drmOpenDevice: node name is /dev/dri/card0
[  1751.365] drmOpenDevice: open result is 8, (OK)
[  1751.365] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[  1751.365] drmOpenDevice: node name is /dev/dri/card0
[  1751.365] drmOpenDevice: open result is 8, (OK)
[  1751.365] drmOpenByBusid: drmOpenMinor returns 8
[  1751.365] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[  1751.365] (II) [drm] DRM interface version 1.4
[  1751.365] (II) [drm] DRM open master succeeded.
[  1751.365] (--) NOUVEAU(0): Chipset: "NVIDIA NV46"
[  1751.365] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[  1751.365] (==) NOUVEAU(0): RGB weight 888
[  1751.365] (**) NOUVEAU(0): Default visual is TrueColor
[  1751.365] (**) NOUVEAU(0): Option "HWcursor" "true"
[  1751.365] (**) NOUVEAU(0): Using HW cursor
[  1751.365] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[  1751.365] (==) NOUVEAU(0): Page flipping enabled
[  1751.480] (II) NOUVEAU(0): Output LVDS-1 using monitor section LCD 15.4'' 
WXGA
[  1751.515] (II) NOUVEAU(0): Output VGA-1 using monitor section LCD
[  1751.515] (**) NOUVEAU(0): Option "RightOf" "LVDS-1"
[  1751.515] (**) NOUVEAU(0): Option "Ignore" "false"
[  1751.541] (II) NOUVEAU(0): Output TV-1 using monitor section <Missing>
[  1751.541] (**) NOUVEAU(0): Option "Ignore" "false"
[  1751.541] (**) NOUVEAU(0): Option "ModeDebug" "On"
[  1751.656] (II) NOUVEAU(0): EDID for output LVDS-1
[...]
[  1751.657] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  1751.657] (II) NOUVEAU(0): Modeline "1280x800"x0.0   68.94  1280 1296 1344 
1408  800 801 804 816 -hsync -vsync (49.0 kHz)
[  1751.657] (II) NOUVEAU(0): Printing probed modes for output LVDS-1
[  1751.657] (II) NOUVEAU(0): Modeline "1280x800"x60.0   68.94  1280 1296 1344 
1408  800 801 804 816 -hsync -vsync (49.0 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  

600 603 607 624 -hsync +vsync (37.4 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  
480 483 487 500 -hsync +vsync (29.7 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896  
400 403 413 417 -hsync +vsync (24.8 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800  
400 403 409 417 -hsync +vsync (25.0 kHz)
[  1751.657] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800  
350 353 363 366 -hsync +vsync (21.9 kHz)
[  1751.691] (II) NOUVEAU(0): EDID for output VGA-1
[  1751.717] (II) NOUVEAU(0): EDID for output TV-1
[  1751.717] (II) NOUVEAU(0): Output LVDS-1 disconnected
[  1751.717] (II) NOUVEAU(0): Output VGA-1 disconnected
[  1751.717] (II) NOUVEAU(0): Output TV-1 disconnected
[  1751.717] (WW) NOUVEAU(0): No outputs definitely connected, trying again...
[  1751.717] (II) NOUVEAU(0): Output LVDS-1 connected
[  1751.717] (II) NOUVEAU(0): Output VGA-1 disconnected
[  1751.717] (II) NOUVEAU(0): Output TV-1 disconnected
[  1751.717] (II) NOUVEAU(0): Using user preference for initial modes
[  1751.717] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1280x800
[  1751.717] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless 
otherwise stated.
[  1751.717] (--) NOUVEAU(0): Virtual size is 1280x800 (pitch 0)
[  1751.717] (**) NOUVEAU(0):  Driver mode "1280x800": 68.9 MHz (scaled from 0.0 

MHz), 49.0 kHz, 60.0 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "1280x800"x60.0   68.94  1280 1296 1344 
1408  800 801 804 816 -hsync -vsync (49.0 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "1024x768": 63.5 MHz (scaled from 0.0 

MHz), 47.8 kHz, 59.9 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "800x600": 38.2 MHz (scaled from 0.0 
MHz), 37.4 kHz, 59.9 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  

600 603 607 624 -hsync +vsync (37.4 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "640x480": 23.8 MHz (scaled from 0.0 
MHz), 29.7 kHz, 59.4 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  
480 483 487 500 -hsync +vsync (29.7 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "720x400": 22.2 MHz (scaled from 0.0 
MHz), 24.8 kHz, 59.6 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896  
400 403 413 417 -hsync +vsync (24.8 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "640x400": 20.0 MHz (scaled from 0.0 
MHz), 25.0 kHz, 60.0 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800  
400 403 409 417 -hsync +vsync (25.0 kHz)
[  1751.717] (**) NOUVEAU(0):  Driver mode "640x350": 17.5 MHz (scaled from 0.0 
MHz), 21.9 kHz, 59.8 Hz
[  1751.717] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800  
350 353 363 366 -hsync +vsync (21.9 kHz)
[  1751.717] (++) NOUVEAU(0): DPI set to (75, 75)
[  1751.717] (II) Loading sub module "fb"
[  1751.717] (II) LoadModule: "fb"
[  1751.717] (II) Loading /usr/lib/xorg/modules/libfb.so
[  1751.718] (II) Module fb: vendor="X.Org Foundation"
[  1751.718]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.718]     ABI class: X.Org ANSI C Emulation, version 0.4
[  1751.718] (II) Loading sub module "exa"
[  1751.718] (II) LoadModule: "exa"
[  1751.718] (II) Loading /usr/lib/xorg/modules/libexa.so
[  1751.718] (II) Module exa: vendor="X.Org Foundation"
[  1751.718]     compiled for 1.10.99.1, module version = 2.5.0
[  1751.718]     ABI class: X.Org Video Driver, version 10.0
[  1751.718] (II) Loading sub module "shadowfb"
[  1751.718] (II) LoadModule: "shadowfb"
[  1751.718] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[  1751.718] (II) Module shadowfb: vendor="X.Org Foundation"
[  1751.718]     compiled for 1.10.99.1, module version = 1.0.0
[  1751.718]     ABI class: X.Org ANSI C Emulation, version 0.4
[  1751.718] (--) Depth 24 pixmap format is 32 bpp
[  1751.719] (II) NOUVEAU(0): Opened GPU channel 1
[  1751.720] (II) NOUVEAU(0): [DRI2] Setup complete
[  1751.720] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[  1751.720] (II) NOUVEAU(0): GART: 64MiB available
[  1751.721] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[  1751.721] (II) EXA(0): Driver allocated offscreen pixmaps
[  1751.721] (II) EXA(0): Driver registered support for the following 
operations:
[  1751.721] (II)         Solid
[  1751.721] (II)         Copy
[  1751.721] (II)         Composite (RENDER acceleration)
[  1751.721] (II)         UploadToScreen
[  1751.721] (II)         DownloadFromScreen
[  1751.721] (==) NOUVEAU(0): Backing store disabled
[  1751.721] (==) NOUVEAU(0): Silken mouse enabled
[  1751.722] (II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
[  1751.722] (II) NOUVEAU(0): [XvMC] Extension initialized.
[  1751.722] (==) NOUVEAU(0): DPMS enabled
[  1751.722] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR 
disabled message.
[  1751.722] (--) RandR disabled
[  1751.722] (II) Initializing built-in extension Generic Event Extension
[  1751.722] (II) Initializing built-in extension SHAPE
[  1751.722] (II) Initializing built-in extension MIT-SHM
[  1751.722] (II) Initializing built-in extension XInputExtension
[  1751.722] (II) Initializing built-in extension XTEST
[  1751.722] (II) Initializing built-in extension BIG-REQUESTS
[  1751.722] (II) Initializing built-in extension SYNC
[  1751.722] (II) Initializing built-in extension XKEYBOARD
[  1751.722] (II) Initializing built-in extension XC-MISC
[  1751.722] (II) Initializing built-in extension XINERAMA
[  1751.722] (II) Initializing built-in extension XFIXES
[  1751.722] (II) Initializing built-in extension RENDER
[  1751.722] (II) Initializing built-in extension RANDR
[  1751.722] (II) Initializing built-in extension COMPOSITE
[  1751.722] (II) Initializing built-in extension DAMAGE
[  1752.623] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[  1752.623] (II) AIGLX: enabled GLX_INTEL_swap_event
[  1752.623] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[  1752.623] (II) AIGLX: enabled GLX_SGI_make_current_read
[  1752.623] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[  1752.623] (II) AIGLX: Loaded and initialized nouveau
[  1752.623] (II) GLX: Initialized DRI2 GL provider for screen 0
[  1752.630] (II) NOUVEAU(0): NVEnterVT is called.
[  1752.776] (II) NOUVEAU(0): Setting screen physical size to 433 x 270
[  1752.776] resize called 1280 800
[  1754.012] (II) XKB: Reusing cached keymap
[  1754.033] (II) config/udev: Adding input device Power Button 
(/dev/input/event2)
[  1754.033] (**) Power Button: Ignoring device from InputClass "Power Button"
[  1754.034] (II) config/udev: Adding input device Video Bus (/dev/input/event3)
[  1754.034] (**) Video Bus: Ignoring device from InputClass "Video Bus"
[  1754.117] (II) config/udev: Adding input device Power Button 
(/dev/input/event1)
[  1754.117] (**) Power Button: Ignoring device from InputClass "Power Button"
[  1754.117] (II) config/udev: Adding input device Lid Switch 
(/dev/input/event0)
[  1754.117] (**) Lid Switch: Ignoring device from InputClass "Lid Switch"
[  1754.119] (II) config/udev: Adding input device HDA Digital PCBeep 
(/dev/input/event8)
[  1754.119] (II) No input driver/identifier specified (ignoring)
[  1754.124] (II) config/udev: Adding input device AT Translated Set 2 keyboard 
(/dev/input/event4)
[  1754.124] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev 
keyboard catchall"
[  1754.124] (**) AT Translated Set 2 keyboard: Applying InputClass "AT 
Keyboard"
[...]

user@localhost $ DISPLAY=:0.0 xrandr --verbose

Screen 0: minimum 320 x 200, current 800 x 1280, maximum 4096 x 4096
LVDS-1 unknown connection 800x1280+0+0 (0x94) left (normal left inverted right x 

axis y axis) 331mm x 207mm
    Identifier: 0x91
    Timestamp:  1756222
    Subpixel:   unknown
    Gamma:      1.0:1.0:1.0
    Brightness: 1.0
    Clones:    
    CRTC:       0
    CRTCs:      0 1
    Transform:  1.000000 0.000000 0.000000
                0.000000 1.000000 0.000000
                0.000000 0.000000 1.000000
               filter: 
    EDID:
        0...
        0...
        2...
        0...
        1...
        0...
        4...
        0...
    dithering:    On
        supported: Off          On           Automatic  
    scaling mode:    Full
        supported: None         Full         Center       Full aspect 
  1280x800 (0x94)   68.9MHz -HSync -VSync *current +preferred
        h: width  1280 start 1296 end 1344 total 1408 skew    0 clock   49.0KHz
        v: height  800 start  801 end  804 total  816           clock   60.0Hz
  1024x768 (0x95)   63.5MHz -HSync +VSync
        h: width  1024 start 1072 end 1176 total 1328 skew    0 clock   47.8KHz
        v: height  768 start  771 end  775 total  798           clock   59.9Hz
  800x600 (0x96)   38.2MHz -HSync +VSync
        h: width   800 start  832 end  912 total 1024 skew    0 clock   37.4KHz
        v: height  600 start  603 end  607 total  624           clock   59.9Hz
  640x480 (0x97)   23.8MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   29.7KHz
        v: height  480 start  483 end  487 total  500           clock   59.4Hz
  720x400 (0x98)   22.2MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock   24.8KHz
        v: height  400 start  403 end  413 total  417           clock   59.6Hz
  640x400 (0x99)   20.0MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   25.0KHz
        v: height  400 start  403 end  409 total  417           clock   60.0Hz
  640x350 (0x9a)   17.5MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock   21.9KHz
        v: height  350 start  353 end  363 total  366           clock   59.8Hz
VGA-1 disconnected (normal left inverted right x axis y axis)
    Identifier: 0x92
    Timestamp:  1756222
    Subpixel:   unknown
    Clones:    
    CRTCs:      0 1
    Transform:  1.000000 0.000000 0.000000
                0.000000 1.000000 0.000000
                0.000000 0.000000 1.000000
               filter: 
TV-1 disconnected (normal left inverted right x axis y axis)
    Identifier: 0x93
    Timestamp:  1756222
    Subpixel:   unknown
    Clones:    
    CRTCs:      0 1
    Transform:  1.000000 0.000000 0.000000
                0.000000 1.000000 0.000000
                0.000000 0.000000 1.000000
               filter: 
    overscan: 50 (0x00000032)    range:  (0,100)
    hue: 0 (0x00000000)    range:  (0,100)
    saturation: 50 (0x00000032)    range:  (0,100)
    flicker reduction: 50 (0x00000032)    range:  (0,100)
    mode:    PAL
        supported: PAL          PAL-M        PAL-N        PAL-Nc      
                   NTSC-M       NTSC-J      
    subconnector:    Unknown
        supported: Unknown      Composite    SVIDEO       Component  
                   SCART      
    select subconnector:    Automatic
        supported: Automatic    Composite    SVIDEO       Component  
                   SCART      

Thanks in advance
Sebastian

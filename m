From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37851] New: X freezes with GeForce FX5500
Date: Thu,  2 Jun 2011 04:10:27 -0700 (PDT)
Message-ID: <bug-37851-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37851

           Summary: X freezes with GeForce FX5500
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debianflo-RbZlAiThDcE@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=47450)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47450)
dmesg output

I am running Debian on a seven year old PC. I got a HD Monitor and had to buy a
new graphic card:

256 MB GeForce FX5500, Inno3D, AGP 8x/4x

Working fine, unfortunately it produces crashes:

.) Can happen anytime, even when screen saver is on. Happens more
frequently if 'complicated' websites at browser windows are opened.
.) Mouse is still moving most of the times but everything else on the display
is frozen.
.) I cannot switch to a console but I can login via network (i.e. to
reboot

I filed a bug at the Debian bug system but was adviced to file a bug here.

Package: xserver-xorg-video-nouveau
Version: 1:0.0.16+git20110411+8378443-1+b1
Linux version 2.6.39-1-686-pae (Debian 2.6.39-1) (maks-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org) (gcc version
4.4.6 (Debian 4.4.6-3)

Xorg.0.log:

[    82.910] 
X.Org X Server 1.10.1
Release Date: 2011-04-15
[    82.912] X Protocol Version 11, Revision 0
[    82.912] Build Operating System: Linux 2.6.32-5-686-bigmem i686 Debian
[    82.913] Current Operating System: Linux arvak 2.6.39-1-686-pae #1 SMP Fri
May 20 20:40:05 UTC 2011 i686
[    82.914] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.39-1-686-pae
root=UUID=75ecb266-c80c-424d-be90-db2d1c08b2f5 ro quiet
[    82.915] Build Date: 01 May 2011  10:14:44AM
[    82.916] xorg-server 2:1.10.1-2 (Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[    82.917] Current version of pixman: 0.21.8
[    82.917]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[    82.919] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    82.922] (==) Log file: "/var/log/Xorg.0.log", Time: Tue May 31 21:06:12
2011
[    82.967] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    83.019] (==) ServerLayout "Default Layout"
[    83.020] (**) |-->Screen "Default Screen" (0)
[    83.020] (**) |   |-->Monitor "Generic Monitor"
[    83.020] (**) |   |-->Device "Generic Video Card"
[    83.020] (**) |-->Input Device "Generic Keyboard"
[    83.020] (**) |-->Input Device "Configured Mouse"
[    83.020] (**) Option "BlankTime" "1"
[    83.020] (**) Option "StandbyTime" "45"
[    83.020] (**) Option "SuspendTime" "60"
[    83.020] (**) Option "OffTime" "120"
[    83.020] (==) Automatically adding devices
[    83.020] (==) Automatically enabling devices
[    83.020] (WW) The directory "/usr/X11R6/lib/X11/fonts/misc" does not exist.
[    83.020]    Entry deleted from font path.
[    83.020] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    83.020]    Entry deleted from font path.
[    83.020] (WW) The directory "/usr/X11R6/lib/X11/fonts/cyrillic" does not
exist.
[    83.020]    Entry deleted from font path.
[    83.020] (WW) The directory "/usr/X11R6/lib/X11/fonts/100dpi/" does not
exist.
[    83.021]    Entry deleted from font path.
[    83.021] (WW) The directory "/usr/X11R6/lib/X11/fonts/75dpi/" does not
exist.
[    83.021]    Entry deleted from font path.
[    83.021] (WW) The directory "/usr/X11R6/lib/X11/fonts/Type1" does not
exist.
[    83.021]    Entry deleted from font path.
[    83.021] (WW) The directory "/usr/X11R6/lib/X11/fonts/100dpi" does not
exist.
[    83.021]    Entry deleted from font path.
[    83.021] (WW) The directory "/usr/X11R6/lib/X11/fonts/75dpi" does not
exist.
[    83.021]    Entry deleted from font path.
[    83.038] (WW) The directory
"/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType" does not exist.
[    83.038]    Entry deleted from font path.
[    83.038] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    83.038]    Entry deleted from font path.
[    83.038] (WW) The directory
"/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType" does not exist.
[    83.038]    Entry deleted from font path.
[    83.038] (**) FontPath set to:
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        built-ins
[    83.038] (==) ModulePath set to "/usr/lib/xorg/modules"
[    83.038] (WW) Hotplugging is on, devices using drivers 'kbd', 'mouse' or
'vmmouse' will be disabled.
[    83.038] (WW) Disabling Generic Keyboard
[    83.038] (WW) Disabling Configured Mouse
[    83.038] (II) Loader magic: 0x8232ac0
[    83.038] (II) Module ABI versions:
[    83.038]    X.Org ANSI C Emulation: 0.4
[    83.038]    X.Org Video Driver: 10.0
[    83.038]    X.Org XInput driver : 12.2
[    83.038]    X.Org Server Extension : 5.0
[    83.039] (--) PCI:*(0:1:0:0) 10de:0326:0000:0000 rev 161, Mem @
0xe8000000/16777216, 0xd0000000/268435456, BIOS @ 0x????????/131072
[    83.039] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or
directory)
[    83.039] (II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.
[    83.039] (II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.
[    83.039] (II) "glx" will be loaded. This was enabled by default and also
specified in the config file.
[    83.039] (II) "record" will be loaded. This was enabled by default and also
specified in the config file.
[    83.039] (II) "dri" will be loaded. This was enabled by default and also
specified in the config file.
[    83.039] (II) "dri2" will be loaded by default.
[    83.039] (II) LoadModule: "dbe"
[    83.040] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    83.050] (II) Module dbe: vendor="X.Org Foundation"
[    83.050]    compiled for 1.10.1, module version = 1.0.0
[    83.050]    Module class: X.Org Server Extension
[    83.050]    ABI class: X.Org Server Extension, version 5.0
[    83.050] (II) Loading extension DOUBLE-BUFFER
[    83.050] (II) LoadModule: "ddc"
[    83.050] (II) Module "ddc" already built-in
[    83.050] (II) LoadModule: "dri"
[    83.050] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    83.057] (II) Module dri: vendor="X.Org Foundation"
[    83.057]    compiled for 1.10.1, module version = 1.0.0
[    83.057]    ABI class: X.Org Server Extension, version 5.0
[    83.057] (II) Loading extension XFree86-DRI
[    83.057] (II) LoadModule: "extmod"
[    83.057] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    83.071] (II) Module extmod: vendor="X.Org Foundation"
[    83.071]    compiled for 1.10.1, module version = 1.0.0
[    83.071]    Module class: X.Org Server Extension
[    83.071]    ABI class: X.Org Server Extension, version 5.0
[    83.071] (II) Loading extension SELinux
[    83.071] (II) Loading extension MIT-SCREEN-SAVER
[    83.071] (II) Loading extension XFree86-VidModeExtension
[    83.071] (II) Loading extension XFree86-DGA
[    83.071] (II) Loading extension DPMS
[    83.071] (II) Loading extension XVideo
[    83.071] (II) Loading extension XVideo-MotionCompensation
[    83.071] (II) Loading extension X-Resource
[    83.071] (II) LoadModule: "glx"
[    83.071] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    83.195] (II) Module glx: vendor="X.Org Foundation"
[    83.195]    compiled for 1.10.1, module version = 1.0.0
[    83.195]    ABI class: X.Org Server Extension, version 5.0
[    83.195] (==) AIGLX enabled
[    83.195] (II) Loading extension GLX
[    83.195] (II) LoadModule: "int10"
[    83.196] (II) Loading /usr/lib/xorg/modules/libint10.so
[    83.197] (II) Module int10: vendor="X.Org Foundation"
[    83.197]    compiled for 1.10.1, module version = 1.0.0
[    83.197]    ABI class: X.Org Video Driver, version 10.0
[    83.197] (II) LoadModule: "record"
[    83.198] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    83.198] (II) Module record: vendor="X.Org Foundation"
[    83.198]    compiled for 1.10.1, module version = 1.13.0
[    83.198]    Module class: X.Org Server Extension
[    83.199]    ABI class: X.Org Server Extension, version 5.0
[    83.199] (II) Loading extension RECORD
[    83.199] (II) LoadModule: "vbe"
[    83.199] (II) Loading /usr/lib/xorg/modules/libvbe.so
[    83.200] (II) Module vbe: vendor="X.Org Foundation"
[    83.200]    compiled for 1.10.1, module version = 1.1.0
[    83.200]    ABI class: X.Org Video Driver, version 10.0
[    83.200] (II) LoadModule: "dri2"
[    83.200] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    83.201] (II) Module dri2: vendor="X.Org Foundation"
[    83.201]    compiled for 1.10.1, module version = 1.2.0
[    83.201]    ABI class: X.Org Server Extension, version 5.0
[    83.201] (II) Loading extension DRI2
[    83.201] (II) LoadModule: "nouveau"
[    83.201] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    83.215] (II) Module nouveau: vendor="X.Org Foundation"
[    83.215]    compiled for 1.10.1, module version = 0.0.16
[    83.215]    Module class: X.Org Video Driver
[    83.215]    ABI class: X.Org Video Driver, version 10.0
[    83.216] (II) NOUVEAU driver Date:   Thu Mar 24 02:13:12 2011 +1000
[    83.216] (II) NOUVEAU driver for NVIDIA chipset families :
[    83.216]    RIVA TNT        (NV04)
[    83.216]    RIVA TNT2       (NV05)
[    83.216]    GeForce 256     (NV10)
[    83.216]    GeForce 2       (NV11, NV15)
[    83.216]    GeForce 4MX     (NV17, NV18)
[    83.216]    GeForce 3       (NV20)
[    83.216]    GeForce 4Ti     (NV25, NV28)
[    83.216]    GeForce FX      (NV3x)
[    83.216]    GeForce 6       (NV4x)
[    83.216]    GeForce 7       (G7x)
[    83.217]    GeForce 8       (G8x)
[    83.217]    GeForce GTX 200 (NVA0)
[    83.217]    GeForce GTX 400 (NVC0)
[    83.217] (--) using VT number 7

[    83.221] drmOpenDevice: node name is /dev/dri/card0
[    83.221] drmOpenDevice: open result is 7, (OK)
[    83.222] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    83.222] drmOpenDevice: node name is /dev/dri/card0
[    83.222] drmOpenDevice: open result is 7, (OK)
[    83.222] drmOpenByBusid: drmOpenMinor returns 7
[    83.222] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    83.222] (II) [drm] nouveau interface version: 0.0.16
[    83.222] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    83.222] (II) Loading sub module "dri"
[    83.222] (II) LoadModule: "dri"
[    83.222] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    83.222] (II) Module dri: vendor="X.Org Foundation"
[    83.222]    compiled for 1.10.1, module version = 1.0.0
[    83.222]    ABI class: X.Org Server Extension, version 5.0
[    83.222] (II) NOUVEAU(0): Loaded DRI module
[    83.222] drmOpenDevice: node name is /dev/dri/card0
[    83.223] drmOpenDevice: open result is 8, (OK)
[    83.223] drmOpenDevice: node name is /dev/dri/card0
[    83.223] drmOpenDevice: open result is 8, (OK)
[    83.223] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    83.223] drmOpenDevice: node name is /dev/dri/card0
[    83.223] drmOpenDevice: open result is 8, (OK)
[    83.223] drmOpenByBusid: drmOpenMinor returns 8
[    83.223] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    83.223] (II) [drm] DRM interface version 1.4
[    83.223] (II) [drm] DRM open master succeeded.
[    83.223] (--) NOUVEAU(0): Chipset: "NVIDIA NV34"
[    83.223] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    83.223] (==) NOUVEAU(0): RGB weight 888
[    83.223] (==) NOUVEAU(0): Default visual is TrueColor
[    83.223] (==) NOUVEAU(0): Using HW cursor
[    83.223] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    83.223] (==) NOUVEAU(0): Page flipping enabled
[    83.328] (II) NOUVEAU(0): Output VGA-1 using monitor section Generic
Monitor
[    83.392] (II) NOUVEAU(0): Output DVI-I-1 using monitor section Generic
Monitor
[    83.448] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    83.552] (II) NOUVEAU(0): EDID for output VGA-1
[    83.552] (II) NOUVEAU(0): Manufacturer: GSM  Model: 56f9  Serial#: 176962
[    83.552] (II) NOUVEAU(0): Year: 2011  Week: 1
[    83.552] (II) NOUVEAU(0): EDID Version: 1.3
[    83.552] (II) NOUVEAU(0): Analog Display Input,  Input Voltage Level:
0.700/0.700 V
[    83.552] (II) NOUVEAU(0): Sync:  Separate  SyncOnGreen
[    83.552] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
[    83.552] (II) NOUVEAU(0): Gamma: 2.20
[    83.552] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off; RGB/Color
Display
[    83.552] (II) NOUVEAU(0): First detailed timing is preferred mode
[    83.552] (II) NOUVEAU(0): redX: 0.635 redY: 0.342   greenX: 0.292 greenY:
0.611
[    83.552] (II) NOUVEAU(0): blueX: 0.147 blueY: 0.070   whiteX: 0.313 whiteY:
0.329
[    83.552] (II) NOUVEAU(0): Supported established timings:
[    83.553] (II) NOUVEAU(0): 720x400@70Hz
[    83.553] (II) NOUVEAU(0): 640x480@60Hz
[    83.553] (II) NOUVEAU(0): 640x480@75Hz
[    83.553] (II) NOUVEAU(0): 800x600@56Hz
[    83.553] (II) NOUVEAU(0): 800x600@60Hz
[    83.553] (II) NOUVEAU(0): 800x600@75Hz
[    83.553] (II) NOUVEAU(0): 832x624@75Hz
[    83.553] (II) NOUVEAU(0): 1024x768@60Hz
[    83.553] (II) NOUVEAU(0): 1024x768@75Hz
[    83.553] (II) NOUVEAU(0): 1280x1024@75Hz
[    83.553] (II) NOUVEAU(0): 1152x864@75Hz
[    83.553] (II) NOUVEAU(0): Manufacturer's mask: 0
[    83.553] (II) NOUVEAU(0): Supported standard timings:
[    83.553] (II) NOUVEAU(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[    83.553] (II) NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 75  vid:
36737
[    83.553] (II) NOUVEAU(0): #2: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    83.553] (II) NOUVEAU(0): #3: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    83.553] (II) NOUVEAU(0): Supported detailed timing:
[    83.553] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  510 x 290 mm
[    83.553] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end 2052
h_blank_end 2200 h_border: 0
[    83.553] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end 1089
v_blanking: 1125 v_border: 0
[    83.553] (II) NOUVEAU(0): Supported detailed timing:
[    83.553] (II) NOUVEAU(0): clock: 146.2 MHz   Image Size:  474 x 296 mm
[    83.553] (II) NOUVEAU(0): h_active: 1680  h_sync: 1784  h_sync_end 1960
h_blank_end 2240 h_border: 0
[    83.553] (II) NOUVEAU(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1089 v_border: 0
[    83.553] (II) NOUVEAU(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H max:
83 kHz, PixClock max 155 MHz
[    83.553] (II) NOUVEAU(0): Monitor name: W2361
[    83.553] (II) NOUVEAU(0): EDID (in hex):
[    83.553] (II) NOUVEAU(0):   00ffffffffffff001e6df95642b30200
[    83.553] (II) NOUVEAU(0):   011501036a331d78eaaec5a2574a9c25
[    83.553] (II) NOUVEAU(0):   125054a76b80b300818f8180714f0101
[    83.553] (II) NOUVEAU(0):   010101010101023a801871382d40582c
[    83.553] (II) NOUVEAU(0):   4500fe221100001e21399030621a2740
[    83.553] (II) NOUVEAU(0):   68b03600da281100001c000000fd0038
[    83.553] (II) NOUVEAU(0):   4b1e530f000a202020202020000000fc
[    83.553] (II) NOUVEAU(0):   0057323336310a202020202020200065
[    83.553] (II) NOUVEAU(0): EDID vendor "GSM", prod id 22265
[    83.553] (II) NOUVEAU(0): Using hsync ranges from config file
[    83.553] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    83.554] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    83.554] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    83.554] (II) NOUVEAU(0): Printing probed modes for output VGA-1
[    83.554] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz)
[    83.554] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz)
[    83.620] (II) NOUVEAU(0): EDID for output DVI-I-1
[    83.676] (II) NOUVEAU(0): EDID for output TV-1
[    83.676] (II) NOUVEAU(0): Output VGA-1 connected
[    83.676] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[    83.676] (II) NOUVEAU(0): Output TV-1 disconnected
[    83.676] (II) NOUVEAU(0): Using user preference for initial modes
[    83.676] (II) NOUVEAU(0): Output VGA-1 using initial mode 1920x1080
[    83.676] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    83.676] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[    83.676] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.5 MHz (scaled from
0.0 MHz), 67.5 kHz, 60.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from
0.0 MHz), 65.3 kHz, 60.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0
MHz), 49.7 kHz, 74.6 Hz
[    83.676] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    83.676] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0
MHz), 35.2 kHz, 56.2 Hz
[    83.676] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    83.676] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz)
[    83.676] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    83.676] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz)
[    83.676] (**) NOUVEAU(0): Display dimensions: (510, 290) mm
[    83.676] (**) NOUVEAU(0): DPI set to (95, 94)
[    83.676] (II) Loading sub module "fb"
[    83.676] (II) LoadModule: "fb"
[    83.677] (II) Loading /usr/lib/xorg/modules/libfb.so
[    83.679] (II) Module fb: vendor="X.Org Foundation"
[    83.679]    compiled for 1.10.1, module version = 1.0.0
[    83.679]    ABI class: X.Org ANSI C Emulation, version 0.4
[    83.679] (II) Loading sub module "exa"
[    83.679] (II) LoadModule: "exa"
[    83.679] (II) Loading /usr/lib/xorg/modules/libexa.so
[    83.691] (II) Module exa: vendor="X.Org Foundation"
[    83.691]    compiled for 1.10.1, module version = 2.5.0
[    83.691]    ABI class: X.Org Video Driver, version 10.0
[    83.691] (II) Loading sub module "shadowfb"
[    83.691] (II) LoadModule: "shadowfb"
[    83.692] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    83.694] (II) Module shadowfb: vendor="X.Org Foundation"
[    83.694]    compiled for 1.10.1, module version = 1.0.0
[    83.694]    ABI class: X.Org ANSI C Emulation, version 0.4
[    83.694] (--) Depth 24 pixmap format is 32 bpp
[    83.695] (II) NOUVEAU(0): Opened GPU channel 1
[    83.695] (II) NOUVEAU(0): [DRI2] Setup complete
[    83.695] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    83.695] (II) NOUVEAU(0): GART: 128MiB available
[    83.702] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    83.706] (II) EXA(0): Driver allocated offscreen pixmaps
[    83.706] (II) EXA(0): Driver registered support for the following
operations:
[    83.706] (II)         Solid
[    83.706] (II)         Copy
[    83.706] (II)         Composite (RENDER acceleration)
[    83.706] (II)         UploadToScreen
[    83.706] (II)         DownloadFromScreen
[    83.706] (==) NOUVEAU(0): Backing store disabled
[    83.706] (==) NOUVEAU(0): Silken mouse enabled
[    83.707] (II) NOUVEAU(0): [XvMC] Associated with NV30 texture adapter.
[    83.707] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    83.707] (**) NOUVEAU(0): DPMS enabled
[    83.707] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    83.707] (--) RandR disabled
[    83.708] (II) Initializing built-in extension Generic Event Extension
[    83.708] (II) Initializing built-in extension SHAPE
[    83.708] (II) Initializing built-in extension MIT-SHM
[    83.708] (II) Initializing built-in extension XInputExtension
[    83.708] (II) Initializing built-in extension XTEST
[    83.708] (II) Initializing built-in extension BIG-REQUESTS
[    83.708] (II) Initializing built-in extension SYNC
[    83.708] (II) Initializing built-in extension XKEYBOARD
[    83.708] (II) Initializing built-in extension XC-MISC
[    83.708] (II) Initializing built-in extension SECURITY
[    83.708] (II) Initializing built-in extension XINERAMA
[    83.708] (II) Initializing built-in extension XFIXES
[    83.708] (II) Initializing built-in extension RENDER
[    83.708] (II) Initializing built-in extension RANDR
[    83.708] (II) Initializing built-in extension COMPOSITE
[    83.708] (II) Initializing built-in extension DAMAGE
[    83.708] (II) SELinux: Disabled on system
[    83.720] (II) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed
(/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
[    83.720] (II) AIGLX: reverting to software rendering
[    83.720] (II) AIGLX: Screen 0 is not DRI capable
[    83.773] (II) AIGLX: Loaded and initialized /usr/lib/dri/swrast_dri.so
[    83.773] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[    83.780] (II) NOUVEAU(0): NVEnterVT is called.
[    83.781] (II) NOUVEAU(0): Setting screen physical size to 507 x 285
[    83.781] resize called 1920 1080
[    84.067] (II) config/udev: Adding input device Power Button
(/dev/input/event2)
[    84.067] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    84.067] (II) LoadModule: "evdev"
[    84.067] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    84.079] (II) Module evdev: vendor="X.Org Foundation"
[    84.079]    compiled for 1.10.1, module version = 2.6.0
[    84.079]    Module class: X.Org XInput Driver
[    84.079]    ABI class: X.Org XInput driver, version 12.2
[    84.079] (II) Using input driver 'evdev' for 'Power Button'
[    84.080] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    84.080] (**) Power Button: always reports core events
[    84.080] (**) Power Button: Device: "/dev/input/event2"
[    84.080] (--) Power Button: Found keys
[    84.080] (II) Power Button: Configuring as keyboard
[    84.080] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input2/event2"
[    84.080] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD)
[    84.080] (**) Option "xkb_rules" "evdev"
[    84.080] (**) Option "xkb_model" "pc104"
[    84.080] (**) Option "xkb_layout" "us"
[    84.121] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[    84.121] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    84.121] (II) Using input driver 'evdev' for 'Power Button'
[    84.121] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    84.121] (**) Power Button: always reports core events
[    84.121] (**) Power Button: Device: "/dev/input/event1"
[    84.121] (--) Power Button: Found keys
[    84.121] (II) Power Button: Configuring as keyboard
[    84.121] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input1/event1"
[    84.121] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD)
[    84.121] (**) Option "xkb_rules" "evdev"
[    84.121] (**) Option "xkb_model" "pc104"
[    84.121] (**) Option "xkb_layout" "us"
[    84.132] (II) config/udev: Adding input device AT Translated Set 2 keyboard
(/dev/input/event0)
[    84.132] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev
keyboard catchall"
[    84.132] (II) Using input driver 'evdev' for 'AT Translated Set 2 keyboard'
[    84.132] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    84.132] (**) AT Translated Set 2 keyboard: always reports core events
[    84.132] (**) AT Translated Set 2 keyboard: Device: "/dev/input/event0"
[    84.132] (--) AT Translated Set 2 keyboard: Found keys
[    84.132] (II) AT Translated Set 2 keyboard: Configuring as keyboard
[    84.132] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio0/input/input0/event0"
[    84.132] (II) XINPUT: Adding extended input device "AT Translated Set 2
keyboard" (type: KEYBOARD)
[    84.132] (**) Option "xkb_rules" "evdev"
[    84.132] (**) Option "xkb_model" "pc104"
[    84.132] (**) Option "xkb_layout" "us"
[    84.133] (II) config/udev: Adding input device ImPS/2 Logitech Wheel Mouse
(/dev/input/event4)
[    84.133] (**) ImPS/2 Logitech Wheel Mouse: Applying InputClass "evdev
pointer catchall"
[    84.133] (II) Using input driver 'evdev' for 'ImPS/2 Logitech Wheel Mouse'
[    84.133] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: always reports core events
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: Device: "/dev/input/event4"
[    84.134] (--) ImPS/2 Logitech Wheel Mouse: Found 3 mouse buttons
[    84.134] (--) ImPS/2 Logitech Wheel Mouse: Found scroll wheel(s)
[    84.134] (--) ImPS/2 Logitech Wheel Mouse: Found relative axes
[    84.134] (--) ImPS/2 Logitech Wheel Mouse: Found x and y relative axes
[    84.134] (II) ImPS/2 Logitech Wheel Mouse: Configuring as mouse
[    84.134] (II) ImPS/2 Logitech Wheel Mouse: Adding scrollwheel support
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: YAxisMapping: buttons 4 and 5
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    84.134] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio1/input/input4/event4"
[    84.134] (II) XINPUT: Adding extended input device "ImPS/2 Logitech Wheel
Mouse" (type: MOUSE)
[    84.134] (II) ImPS/2 Logitech Wheel Mouse: initialized for relative axes.
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: (accel) keeping acceleration
scheme 1
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration profile 0
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration factor:
2.000
[    84.134] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration threshold:
4
[    84.134] (II) config/udev: Adding input device ImPS/2 Logitech Wheel Mouse
(/dev/input/mouse0)
[    84.135] (II) No input driver/identifier specified (ignoring)
[    84.135] (II) config/udev: Adding input device PC Speaker
(/dev/input/event3)
[    84.135] (II) No input driver/identifier specified (ignoring)
[136950.215] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[136950.617] 
Backtrace:
[136950.774] 0: /usr/bin/X (xorg_backtrace+0x37) [0x80ed307]
[136950.775] 1: /usr/bin/X (mieqEnqueue+0x1d1) [0x80ec691]
[136950.775] 2: /usr/bin/X (xf86PostMotionEventM+0xb0) [0x80c8410]
[136950.775] 3: /usr/bin/X (xf86PostMotionEventP+0x6f) [0x80c855f]
[136950.775] 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xb6f55000+0x2cfe)
[0xb6f57cfe]
[136950.775] 5: /usr/lib/xorg/modules/input/evdev_drv.so (0xb6f55000+0x3e1d)
[0xb6f58e1d]
[136950.775] 6: /usr/bin/X (0x8048000+0x6d391) [0x80b5391]
[136950.775] 7: /usr/bin/X (0x8048000+0x127eaf) [0x816feaf]
[136950.775] 8: (vdso) (__kernel_sigreturn+0x0) [0xb77ce400]
[136950.775] 9: (vdso) (__kernel_vsyscall+0x10) [0xb77ce424]
[136950.775] 10: /lib/i686/cmov/libc.so.6 (ioctl+0x19) [0xb7577c09]
[136950.775] 11: /usr/lib/libdrm.so.2 (drmIoctl+0x34) [0xb73b9de4]
[136950.775] 12: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3c) [0xb73bc91c]
[136950.775] 13: /usr/lib/libdrm_nouveau.so.1 (0xb73cb000+0x2ddf) [0xb73cdddf]
[136950.775] 14: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x10a)
[0xb73ce4ca]
[136950.775] 15: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map+0x32)
[0xb73ce5c2]
[136950.775] 16: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0xb72ab000+0x435f) [0xb72af35f]
[136950.775] 17: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x5a38)
[0xb7273a38]
[136950.775] 18: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x6036)
[0xb7274036]
[136950.775] 19: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x83a9)
[0xb72763a9]
[136950.775] 20: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x425b)
[0xb727225b]
[136950.775] 21: /usr/lib/xorg/modules/libexa.so (0xb726e000+0xf6c9)
[0xb727d6c9]
[136950.776] 22: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x102da)
[0xb727e2da]
[136950.776] 23: /usr/bin/X (0x8048000+0xe2d4b) [0x812ad4b]
[136950.776] 24: /usr/bin/X (CompositePicture+0x21e) [0x811f65e]
[136950.776] 25: /usr/lib/xorg/modules/libexa.so (0xb726e000+0x11464)
[0xb727f464]
[136950.776] 26: /usr/bin/X (CompositeTrapezoids+0xb5) [0x811f9d5]
[136950.776] 27: /usr/bin/X (0x8048000+0xde558) [0x8126558]
[136950.776] 28: /usr/bin/X (0x8048000+0xd7f51) [0x811ff51]
[136950.776] 29: /usr/bin/X (0x8048000+0x2d527) [0x8075527]
[136950.776] 30: /usr/bin/X (0x8048000+0x205ac) [0x80685ac]
[136950.776] 31: /lib/i686/cmov/libc.so.6 (__libc_start_main+0xe6) [0xb74c9e46]
[136950.776] 32: /usr/bin/X (0x8048000+0x208c1) [0x80688c1]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

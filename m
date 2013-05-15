From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64645] New: Massive corruption
Date: Wed, 15 May 2013 17:58:32 +0000
Message-ID: <bug-64645-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1195005209=="
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


--===============1195005209==
Content-Type: multipart/alternative; boundary="1368640713.64dB1.16950"; charset="us-ascii"


--1368640713.64dB1.16950
Date: Wed, 15 May 2013 17:58:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64645

          Priority: medium
            Bug ID: 64645
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Massive corruption
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: roucaries.bastien+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 79357
  --> https://bugs.freedesktop.org/attachment.cgi?id=79357&action=edit
Corrupt one

Dear nouveau coder I am affected by a nouveau bug. Massive corruption (see
attachment). How can I help?

Package: xserver-xorg-video-nouveau
Version: 1:1.0.7-1
Severity: important

Dear Maintainer,

Try to reproduce #699534 I get a new bug a massive graphics corruption, that I 
could reproduce quickly.

How can I help this time ?



-- Package-specific info:
X server symlink status:
------------------------
lrwxrwxrwx 1 root root 13 Jan  9  2012 /etc/X11/X -> /usr/bin/Xorg
-rwxr-xr-x 1 root root 2044664 Apr 17 12:40 /usr/bin/Xorg

VGA-compatible devices on PCI bus:
----------------------------------
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GL [Quadro 
600] [10de:0df8] (rev a1)

/etc/X11/xorg.conf does not exist.

/etc/X11/xorg.conf.d does not exist.

KMS configuration files:
------------------------
/etc/modprobe.d/i915-kms.conf:
  options i915 modeset=1
/etc/modprobe.d/radeon-kms.conf:
  options radeon modeset=1

Kernel version (/proc/version):
-------------------------------
Linux version 3.8-trunk-amd64 (debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org) (gcc version 
4.7.2 (Debian 4.7.2-5) ) #1 SMP Debian 3.8.5-1~experimental.1

Xorg X server log files on system:
----------------------------------
-rw-r--r-- 1 root root 38191 May  6 15:18 /var/log/Xorg.0.log

Contents of most recent Xorg X server log file (/var/log/Xorg.0.log):
---------------------------------------------------------------------
[    85.947] 
X.Org X Server 1.12.4
Release Date: 2012-08-27
[    85.947] X Protocol Version 11, Revision 0
[    85.947] Build Operating System: Linux 3.2.0-4-amd64 x86_64 Debian
[    85.947] Current Operating System: Linux no56 3.8-trunk-amd64 #1 SMP 
Debian 3.8.5-1~experimental.1 x86_64
[    85.947] Kernel command line: BOOT_IMAGE=/vmlinuz-3.8-trunk-amd64 
root=/dev/mapper/VOL-ROOT ro quiet
[    85.947] Build Date: 17 April 2013  10:22:47AM
[    85.947] xorg-server 2:1.12.4-6 (Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[    85.947] Current version of pixman: 0.26.0
[    85.947]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[    85.947] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    85.947] (==) Log file: "/var/log/Xorg.0.log", Time: Mon May  6 15:00:57 
2013
[    85.974] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    86.027] (==) No Layout section.  Using the first Screen section.
[    86.027] (==) No screen section available. Using defaults.
[    86.027] (**) |-->Screen "Default Screen Section" (0)
[    86.028] (**) |   |-->Monitor "<default monitor>"
[    86.028] (==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
[    86.028] (==) Automatically adding devices
[    86.028] (==) Automatically enabling devices
[    86.081] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not 
exist.
[    86.081]    Entry deleted from font path.
[    86.141] (WW) `fonts.dir' not found (or not valid) in "/var/lib/defoma/x-
ttcidfont-conf.d/dirs/TrueType".
[    86.141]    Entry deleted from font path.
[    86.141]    (Run 'mkfontdir' on "/var/lib/defoma/x-ttcidfont-
conf.d/dirs/TrueType").
[    86.141] (==) FontPath set to:
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        built-ins
[    86.141] (==) ModulePath set to "/usr/lib/xorg/modules"
[    86.141] (II) The server relies on udev to provide the list of input 
devices.
        If no devices become available, reconfigure udev or disable 
AutoAddDevices.
[    86.141] (II) Loader magic: 0x7f1313c06ae0
[    86.141] (II) Module ABI versions:
[    86.141]    X.Org ANSI C Emulation: 0.4
[    86.141]    X.Org Video Driver: 12.1
[    86.141]    X.Org XInput driver : 16.0
[    86.141]    X.Org Server Extension : 6.0
[    86.142] (--) PCI:*(0:1:0:0) 10de:0df8:10de:0835 rev 161, Mem @ 
0xdb000000/16777216, 0xd0000000/134217728, 0xd8000000/33554432, I/O @ 
0x00003000/128, BIOS @ 0x????????/524288
[    86.142] (II) Open ACPI successful (/var/run/acpid.socket)
[    86.142] (II) LoadModule: "extmod"
[    86.360] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    86.435] (II) Module extmod: vendor="X.Org Foundation"
[    86.435]    compiled for 1.12.4, module version = 1.0.0
[    86.435]    Module class: X.Org Server Extension
[    86.435]    ABI class: X.Org Server Extension, version 6.0
[    86.435] (II) Loading extension SELinux
[    86.435] (II) Loading extension MIT-SCREEN-SAVER
[    86.435] (II) Loading extension XFree86-VidModeExtension
[    86.435] (II) Loading extension XFree86-DGA
[    86.435] (II) Loading extension DPMS
[    86.435] (II) Loading extension XVideo
[    86.435] (II) Loading extension XVideo-MotionCompensation
[    86.435] (II) Loading extension X-Resource
[    86.435] (II) LoadModule: "dbe"
[    86.448] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    86.455] (II) Module dbe: vendor="X.Org Foundation"
[    86.455]    compiled for 1.12.4, module version = 1.0.0
[    86.455]    Module class: X.Org Server Extension
[    86.455]    ABI class: X.Org Server Extension, version 6.0
[    86.455] (II) Loading extension DOUBLE-BUFFER
[    86.455] (II) LoadModule: "glx"
[    86.455] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    86.514] (II) Module glx: vendor="X.Org Foundation"
[    86.514]    compiled for 1.12.4, module version = 1.0.0
[    86.514]    ABI class: X.Org Server Extension, version 6.0
[    86.514] (==) AIGLX enabled
[    86.514] (II) Loading extension GLX
[    86.514] (II) LoadModule: "record"
[    86.515] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    86.527] (II) Module record: vendor="X.Org Foundation"
[    86.527]    compiled for 1.12.4, module version = 1.13.0
[    86.527]    Module class: X.Org Server Extension
[    86.527]    ABI class: X.Org Server Extension, version 6.0
[    86.527] (II) Loading extension RECORD
[    86.527] (II) LoadModule: "dri"
[    86.528] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    86.563] (II) Module dri: vendor="X.Org Foundation"
[    86.563]    compiled for 1.12.4, module version = 1.0.0
[    86.563]    ABI class: X.Org Server Extension, version 6.0
[    86.563] (II) Loading extension XFree86-DRI
[    86.563] (II) LoadModule: "dri2"
[    86.564] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    86.564] (II) Module dri2: vendor="X.Org Foundation"
[    86.564]    compiled for 1.12.4, module version = 1.2.0
[    86.564]    ABI class: X.Org Server Extension, version 6.0
[    86.564] (II) Loading extension DRI2
[    86.564] (==) Matched nouveau as autoconfigured driver 0
[    86.564] (==) Matched nv as autoconfigured driver 1
[    86.564] (==) Matched vesa as autoconfigured driver 2
[    86.564] (==) Matched fbdev as autoconfigured driver 3
[    86.564] (==) Assigned the driver to the xf86ConfigLayout
[    86.564] (II) LoadModule: "nouveau"
[    86.564] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    86.656] (II) Module nouveau: vendor="X.Org Foundation"
[    86.656]    compiled for 1.12.4, module version = 1.0.7
[    86.656]    Module class: X.Org Video Driver
[    86.656]    ABI class: X.Org Video Driver, version 12.1
[    86.656] (II) LoadModule: "nv"
[    86.672] (WW) Warning, couldn't open module nv
[    86.672] (II) UnloadModule: "nv"
[    86.672] (II) Unloading nv
[    86.672] (EE) Failed to load module "nv" (module does not exist, 0)
[    86.672] (II) LoadModule: "vesa"
[    86.672] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    86.706] (II) Module vesa: vendor="X.Org Foundation"
[    86.706]    compiled for 1.12.1, module version = 2.3.1
[    86.706]    Module class: X.Org Video Driver
[    86.706]    ABI class: X.Org Video Driver, version 12.0
[    86.706] (II) LoadModule: "fbdev"
[    86.706] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    86.715] (II) Module fbdev: vendor="X.Org Foundation"
[    86.715]    compiled for 1.12.1, module version = 0.4.2
[    86.715]    ABI class: X.Org Video Driver, version 12.0
[    86.715] (II) NOUVEAU driver Date:   Wed Mar 27 09:50:03 2013 +0100
[    86.715] (II) NOUVEAU driver for NVIDIA chipset families :
[    86.715]    RIVA TNT        (NV04)
[    86.715]    RIVA TNT2       (NV05)
[    86.715]    GeForce 256     (NV10)
[    86.715]    GeForce 2       (NV11, NV15)
[    86.715]    GeForce 4MX     (NV17, NV18)
[    86.715]    GeForce 3       (NV20)
[    86.715]    GeForce 4Ti     (NV25, NV28)
[    86.715]    GeForce FX      (NV3x)
[    86.715]    GeForce 6       (NV4x)
[    86.715]    GeForce 7       (G7x)
[    86.715]    GeForce 8       (G8x)
[    86.715]    GeForce GTX 200 (NVA0)
[    86.715]    GeForce GTX 400 (NVC0)
[    86.715] (II) VESA: driver for VESA chipsets: vesa
[    86.715] (II) FBDEV: driver for framebuffer: fbdev
[    86.715] (++) using VT number 7

[    86.717] drmOpenDevice: node name is /dev/dri/card0
[    86.717] drmOpenDevice: open result is 8, (OK)
[    86.717] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    86.717] drmOpenDevice: node name is /dev/dri/card0
[    86.718] drmOpenDevice: open result is 8, (OK)
[    86.718] drmOpenByBusid: drmOpenMinor returns 8
[    86.718] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    86.718] (II) [drm] nouveau interface version: 1.1.0
[    86.718] (WW) Falling back to old probe method for vesa
[    86.718] (WW) Falling back to old probe method for fbdev
[    86.718] (II) Loading sub module "fbdevhw"
[    86.718] (II) LoadModule: "fbdevhw"
[    86.718] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    86.718] (II) Module fbdevhw: vendor="X.Org Foundation"
[    86.718]    compiled for 1.12.4, module version = 0.0.2
[    86.718]    ABI class: X.Org Video Driver, version 12.1
[    86.718] (II) Loading sub module "dri"
[    86.718] (II) LoadModule: "dri"
[    86.718] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    86.718] (II) Module dri: vendor="X.Org Foundation"
[    86.718]    compiled for 1.12.4, module version = 1.0.0
[    86.718]    ABI class: X.Org Server Extension, version 6.0
[    86.718] (II) NOUVEAU(0): Loaded DRI module
[    86.718] drmOpenDevice: node name is /dev/dri/card0
[    86.718] drmOpenDevice: open result is 9, (OK)
[    86.718] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    86.718] drmOpenDevice: node name is /dev/dri/card0
[    86.719] drmOpenDevice: open result is 9, (OK)
[    86.719] drmOpenByBusid: drmOpenMinor returns 9
[    86.719] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    86.719] (--) NOUVEAU(0): Chipset: "NVIDIA NVc1"
[    86.719] (II) NOUVEAU(0): Creating default Display subsection in Screen 
section
        "Default Screen Section" for depth/fbbpp 24/32
[    86.719] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    86.719] (==) NOUVEAU(0): RGB weight 888
[    86.719] (==) NOUVEAU(0): Default visual is TrueColor
[    86.719] (==) NOUVEAU(0): Using HW cursor
[    86.719] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    86.719] (==) NOUVEAU(0): Page flipping enabled
[    86.719] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    86.757] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    86.884] (II) NOUVEAU(0): Output DP-1 has no monitor section
[    86.919] (II) NOUVEAU(0): EDID for output DVI-I-1
[    86.919] (II) NOUVEAU(0): Manufacturer: DEL  Model: 4077  Serial#: 
1144018259
[    86.919] (II) NOUVEAU(0): Year: 2011  Week: 41
[    86.919] (II) NOUVEAU(0): EDID Version: 1.3
[    86.919] (II) NOUVEAU(0): Digital Display Input
[    86.919] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
[    86.919] (II) NOUVEAU(0): Gamma: 2.20
[    86.919] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    86.919] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    86.919] (II) NOUVEAU(0): First detailed timing is preferred mode
[    86.919] (II) NOUVEAU(0): redX: 0.635 redY: 0.351   greenX: 0.311 greenY: 
0.630
[    86.919] (II) NOUVEAU(0): blueX: 0.149 blueY: 0.053   whiteX: 0.313 
whiteY: 0.329
[    86.919] (II) NOUVEAU(0): Supported established timings:
[    86.919] (II) NOUVEAU(0): 720x400@70Hz
[    86.919] (II) NOUVEAU(0): 640x480@60Hz
[    86.919] (II) NOUVEAU(0): 640x480@75Hz
[    86.919] (II) NOUVEAU(0): 800x600@60Hz
[    86.919] (II) NOUVEAU(0): 800x600@75Hz
[    86.919] (II) NOUVEAU(0): 1024x768@60Hz
[    86.919] (II) NOUVEAU(0): 1024x768@75Hz
[    86.919] (II) NOUVEAU(0): 1280x1024@75Hz
[    86.919] (II) NOUVEAU(0): Manufacturer's mask: 0
[    86.919] (II) NOUVEAU(0): Supported standard timings:
[    86.919] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 
20337
[    86.919] (II) NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 
32897
[    86.919] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1080  refresh: 60  vid: 
49361
[    86.919] (II) NOUVEAU(0): Supported detailed timing:
[    86.919] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  510 x 287 mm
[    86.919] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end 2052 
h_blank_end 2200 h_border: 0
[    86.919] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end 1089 
v_blanking: 1125 v_border: 0
[    86.919] (II) NOUVEAU(0): Serial No: D7C741ABD0US
[    86.919] (II) NOUVEAU(0): Monitor name: DELL P2312H
[    86.919] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 
83 kHz, PixClock max 175 MHz
[    86.919] (II) NOUVEAU(0): EDID (in hex):
[    86.919] (II) NOUVEAU(0):   00ffffffffffff0010ac774053553044
[    86.919] (II) NOUVEAU(0):   2915010380331d78eab965a2594fa126
[    86.919] (II) NOUVEAU(0):   0d5054a54b00714f8180d1c001010101
[    86.919] (II) NOUVEAU(0):   010101010101023a801871382d40582c
[    86.919] (II) NOUVEAU(0):   4500fe1f1100001e000000ff00443743
[    86.919] (II) NOUVEAU(0):   3734314142443055530a000000fc0044
[    86.919] (II) NOUVEAU(0):   454c4c205032333132480a20000000fd
[    86.919] (II) NOUVEAU(0):   00384c1e5311000a2020202020200042
[    86.919] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16503
[    86.919] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    86.919] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    86.919] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    86.919] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    86.919] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[    86.919] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    86.919] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 
2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    86.919] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 
1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 
1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    87.044] (II) NOUVEAU(0): EDID for output DP-1
[    87.044] (II) NOUVEAU(0): Output DVI-I-1 connected
[    87.044] (II) NOUVEAU(0): Output DP-1 disconnected
[    87.044] (II) NOUVEAU(0): Using exact sizes for initial modes
[    87.044] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1920x1080
[    87.044] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless 
otherwise stated.
[    87.044] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[    87.044] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.5 MHz (scaled from 
0.0 MHz), 67.5 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 
2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    87.044] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 
0.0 MHz), 80.0 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 
0.0 MHz), 64.0 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 
0.0 MHz), 67.5 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 
0.0 MHz), 60.1 kHz, 75.1 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 
0.0 MHz), 48.4 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 
0.0 MHz), 46.9 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 
1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 
0.0 MHz), 37.9 kHz, 60.3 Hz
[    87.044] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 
1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 
0.0 MHz), 37.5 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 
0.0 MHz), 31.5 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 
0.0 MHz), 31.5 kHz, 70.1 Hz
[    87.044] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    87.044] (**) NOUVEAU(0): Display dimensions: (510, 290) mm
[    87.044] (**) NOUVEAU(0): DPI set to (95, 94)
[    87.044] (II) Loading sub module "fb"
[    87.044] (II) LoadModule: "fb"
[    87.044] (II) Loading /usr/lib/xorg/modules/libfb.so
[    87.051] (II) Module fb: vendor="X.Org Foundation"
[    87.051]    compiled for 1.12.4, module version = 1.0.0
[    87.051]    ABI class: X.Org ANSI C Emulation, version 0.4
[    87.051] (II) Loading sub module "exa"
[    87.051] (II) LoadModule: "exa"
[    87.051] (II) Loading /usr/lib/xorg/modules/libexa.so
[    87.056] (II) Module exa: vendor="X.Org Foundation"
[    87.056]    compiled for 1.12.4, module version = 2.5.0
[    87.056]    ABI class: X.Org Video Driver, version 12.1
[    87.056] (II) Loading sub module "shadowfb"
[    87.056] (II) LoadModule: "shadowfb"
[    87.056] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    87.070] (II) Module shadowfb: vendor="X.Org Foundation"
[    87.070]    compiled for 1.12.4, module version = 1.0.0
[    87.070]    ABI class: X.Org ANSI C Emulation, version 0.4
[    87.070] (II) UnloadModule: "vesa"
[    87.070] (II) Unloading vesa
[    87.070] (II) UnloadModule: "fbdev"
[    87.070] (II) Unloading fbdev
[    87.070] (II) UnloadSubModule: "fbdevhw"
[    87.070] (II) Unloading fbdevhw
[    87.070] (--) Depth 24 pixmap format is 32 bpp
[    87.071] (II) NOUVEAU(0): Opened GPU channel 0
[    87.073] (II) NOUVEAU(0): [DRI2] Setup complete
[    87.073] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    87.073] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    87.073] (II) EXA(0): Driver allocated offscreen pixmaps
[    87.073] (II) EXA(0): Driver registered support for the following 
operations:
[    87.073] (II)         Solid
[    87.073] (II)         Copy
[    87.073] (II)         Composite (RENDER acceleration)
[    87.073] (II)         UploadToScreen
[    87.073] (II)         DownloadFromScreen
[    87.073] (==) NOUVEAU(0): Backing store disabled
[    87.073] (==) NOUVEAU(0): Silken mouse enabled
[    87.073] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 
Textured Video.
[    87.073] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    87.073] (==) NOUVEAU(0): DPMS enabled
[    87.074] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR 
disabled message.
[    87.074] (--) RandR disabled
[    87.074] (II) Initializing built-in extension Generic Event Extension
[    87.074] (II) Initializing built-in extension SHAPE
[    87.074] (II) Initializing built-in extension MIT-SHM
[    87.074] (II) Initializing built-in extension XInputExtension
[    87.074] (II) Initializing built-in extension XTEST
[    87.074] (II) Initializing built-in extension BIG-REQUESTS
[    87.074] (II) Initializing built-in extension SYNC
[    87.074] (II) Initializing built-in extension XKEYBOARD
[    87.074] (II) Initializing built-in extension XC-MISC
[    87.074] (II) Initializing built-in extension SECURITY
[    87.074] (II) Initializing built-in extension XINERAMA
[    87.074] (II) Initializing built-in extension XFIXES
[    87.074] (II) Initializing built-in extension RENDER
[    87.074] (II) Initializing built-in extension RANDR
[    87.074] (II) Initializing built-in extension COMPOSITE
[    87.074] (II) Initializing built-in extension DAMAGE
[    87.074] (II) SELinux: Disabled on system
[    87.238] (EE) AIGLX error: Calling driver entry point failed
[    87.238] (EE) AIGLX: reverting to software rendering
[    87.238] (II) AIGLX: Screen 0 is not DRI capable
[    87.339] (II) AIGLX: Loaded and initialized swrast
[    87.339] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[    87.341] (II) NOUVEAU(0): NVEnterVT is called.
[    87.349] (II) NOUVEAU(0): Setting screen physical size to 508 x 285
[    87.349] resize called 1920 1080
[    87.644] (II) config/udev: Adding input device Power Button 
(/dev/input/event1)
[    87.644] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    87.644] (II) LoadModule: "evdev"
[    87.644] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    87.648] (II) Module evdev: vendor="X.Org Foundation"
[    87.648]    compiled for 1.12.1, module version = 2.7.0
[    87.648]    Module class: X.Org XInput Driver
[    87.648]    ABI class: X.Org XInput driver, version 16.0
[    87.648] (II) Using input driver 'evdev' for 'Power Button'
[    87.648] (**) Power Button: always reports core events
[    87.648] (**) evdev: Power Button: Device: "/dev/input/event1"
[    87.648] (--) evdev: Power Button: Vendor 0 Product 0x1
[    87.648] (--) evdev: Power Button: Found keys
[    87.648] (II) evdev: Power Button: Configuring as keyboard
[    87.648] (**) Option "config_info" 
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[    87.648] (II) XINPUT: Adding extended input device "Power Button" (type: 
KEYBOARD, id 6)
[    87.648] (**) Option "xkb_rules" "evdev"
[    87.648] (**) Option "xkb_model" "pc105"
[    87.648] (**) Option "xkb_layout" "fr"
[    87.648] (**) Option "xkb_variant" "latin9"
[    87.681] (II) config/udev: Adding input device Power Button 
(/dev/input/event0)
[    87.681] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    87.681] (II) Using input driver 'evdev' for 'Power Button'
[    87.681] (**) Power Button: always reports core events
[    87.681] (**) evdev: Power Button: Device: "/dev/input/event0"
[    87.681] (--) evdev: Power Button: Vendor 0 Product 0x1
[    87.681] (--) evdev: Power Button: Found keys
[    87.682] (II) evdev: Power Button: Configuring as keyboard
[    87.682] (**) Option "config_info" 
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0"
[    87.682] (II) XINPUT: Adding extended input device "Power Button" (type: 
KEYBOARD, id 7)
[    87.682] (**) Option "xkb_rules" "evdev"
[    87.682] (**) Option "xkb_model" "pc105"
[    87.682] (**) Option "xkb_layout" "fr"
[    87.682] (**) Option "xkb_variant" "latin9"
[    87.682] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 
(/dev/input/event10)
[    87.682] (II) No input driver specified, ignoring this device.
[    87.682] (II) This device may have been added with another device file.
[    87.682] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 
(/dev/input/event11)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 
(/dev/input/event8)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 
(/dev/input/event9)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA Digital PCBeep 
(/dev/input/event3)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Front Mic 
(/dev/input/event4)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Rear Mic 
(/dev/input/event5)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Front 
Headphone (/dev/input/event6)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.685] (II) config/udev: Adding input device HDA Intel PCH Line Out 
(/dev/input/event7)
[    87.685] (II) No input driver specified, ignoring this device.
[    87.685] (II) This device may have been added with another device file.
[    87.685] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/event12)
[    87.685] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: Applying 
InputClass "evdev keyboard catchall"
[    87.685] (II) Using input driver 'evdev' for 'ATEN Advance Tech Inc. HDMI 
KVM V1.1.101'
[    87.685] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: always reports 
core events
[    87.685] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Device: 
"/dev/input/event12"
[    87.685] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Vendor 
0x557 Product 0x2213
[    87.685] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found keys
[    87.685] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Configuring 
as keyboard
[    87.685] (**) Option "config_info" 
"udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12"
[    87.685] (II) XINPUT: Adding extended input device "ATEN Advance Tech Inc. 
HDMI KVM V1.1.101" (type: KEYBOARD, id 8)
[    87.685] (**) Option "xkb_rules" "evdev"
[    87.685] (**) Option "xkb_model" "pc105"
[    87.685] (**) Option "xkb_layout" "fr"
[    87.685] (**) Option "xkb_variant" "latin9"
[    87.686] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/event13)
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: Applying 
InputClass "evdev pointer catchall"
[    87.686] (II) Using input driver 'evdev' for 'ATEN Advance Tech Inc. HDMI 
KVM V1.1.101'
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: always reports 
core events
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Device: 
"/dev/input/event13"
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Vendor 
0x557 Product 0x2213
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 9 
mouse buttons
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 
scroll wheel(s)
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 
relative axes
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found x and 
y relative axes
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Configuring 
as mouse
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Adding 
scrollwheel support
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: 
YAxisMapping: buttons 4 and 5
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: 
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    87.686] (**) Option "config_info" 
"udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13"
[    87.686] (II) XINPUT: Adding extended input device "ATEN Advance Tech Inc. 
HDMI KVM V1.1.101" (type: MOUSE, id 9)
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: initialized 
for relative axes.
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) keeping 
acceleration scheme 1
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration profile 0
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration factor: 2.000
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration threshold: 4
[    87.687] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/mouse0)
[    87.687] (II) No input driver specified, ignoring this device.
[    87.687] (II) This device may have been added with another device file.
[    87.687] (II) config/udev: Adding input device PC Speaker 
(/dev/input/event2)
[    87.687] (II) No input driver specified, ignoring this device.
[    87.687] (II) This device may have been added with another device file.
[   100.995] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16503
[   100.995] (II) NOUVEAU(0): Using hsync ranges from config file
[   100.995] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   100.995] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   100.995] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   100.995] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   110.262] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16503
[   110.262] (II) NOUVEAU(0): Using hsync ranges from config file
[   110.262] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   110.262] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   110.263] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   110.263] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   110.426] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16503
[   110.426] (II) NOUVEAU(0): Using hsync ranges from config file
[   110.426] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   110.426] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   110.426] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   110.426] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   116.223] (II) NOUVEAU(0): EDID vendor "DEL", prod id 16503
[   116.223] (II) NOUVEAU(0): Using hsync ranges from config file
[   116.223] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   116.223] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   116.223] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   116.223] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   837.547] (WW) Open ACPI failed (/var/run/acpid.socket) (Connection 
refused)
[  1141.679] (II) Open ACPI successful (/var/run/acpid.socket)
[  1142.691] (WW) Open ACPI failed (/var/run/acpid.socket) (Connection 
refused)
[  1143.691] (II) Open ACPI successful (/var/run/acpid.socket)

udev information:
-----------------
P: /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
E: DEVPATH=/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
E: EV=3
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-LNXPWRBN:00
E: ID_PATH_TAG=acpi-LNXPWRBN_00
E: KEY=10000000000000 0
E: MODALIAS=input:b0019v0000p0001e0000-e0,1,k74,ramlsfw
E: NAME="Power Button"
E: PHYS="LNXPWRBN/button/input0"
E: PRODUCT=19/0/1/0
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3821882

P: /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1
N: input/event1
E: BACKSPACE=guess
E: DEVNAME=/dev/input/event1
E: DEVPATH=/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1
E: DMI_VENDOR=Dell Inc.
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-LNXPWRBN:00
E: ID_PATH_TAG=acpi-LNXPWRBN_00
E: MAJOR=13
E: MINOR=65
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=4115021
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
E: EV=3
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-PNP0C0C:00
E: ID_PATH_TAG=acpi-PNP0C0C_00
E: KEY=10000000000000 0
E: MODALIAS=input:b0019v0000p0001e0000-e0,1,k74,ramlsfw
E: NAME="Power Button"
E: PHYS="PNP0C0C/button/input0"
E: PRODUCT=19/0/1/0
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3821868

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0
N: input/event0
E: BACKSPACE=guess
E: DEVNAME=/dev/input/event0
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0
E: DMI_VENDOR=Dell Inc.
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-PNP0C0C:00
E: ID_PATH_TAG=acpi-PNP0C0C_00
E: MAJOR=13
E: MINOR=64
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=4115022
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME="HDA NVidia HDMI/DP,pcm=7"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5440984

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10/event10
N: input/event10
E: DEVNAME=/dev/input/event10
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10/event10
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=74
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444747

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME="HDA NVidia HDMI/DP,pcm=3"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5441813

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11/event11
N: input/event11
E: DEVNAME=/dev/input/event11
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11/event11
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=75
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444645

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME="HDA NVidia HDMI/DP,pcm=9"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5441220

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8/event8
N: input/event8
E: DEVNAME=/dev/input/event8
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8/event8
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=72
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444883

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME="HDA NVidia HDMI/DP,pcm=8"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5443309

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9/event9
N: input/event9
E: DEVNAME=/dev/input/event9
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9/event9
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=73
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5445669

P: /devices/pci0000:00/0000:00:1b.0/input/input3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/input/input3
E: EV=40001
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0001v10ECp0269e0001-e0,12,kramls1,2,fw
E: NAME="HDA Digital PCBeep"
E: PHYS="card0/codec#0/beep0"
E: PRODUCT=1/10ec/269/1
E: PROP=0
E: SND=6
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5438569

P: /devices/pci0000:00/0000:00:1b.0/input/input3/event3
N: input/event3
E: DEVNAME=/dev/input/event3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/input/input3/event3
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=67
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5442525

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input4
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input4
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw4,
E: NAME="HDA Intel PCH Front Mic"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=10
E: UDEV_LOG=3
E: USEC_INITIALIZED=5438893

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input4/event4
N: input/event4
E: DEVNAME=/dev/input/event4
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input4/event4
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=68
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5442658

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input5
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input5
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw4,
E: NAME="HDA Intel PCH Rear Mic"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=10
E: UDEV_LOG=3
E: USEC_INITIALIZED=5439596

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input5/event5
N: input/event5
E: DEVNAME=/dev/input/event5
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input5/event5
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=69
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444148

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input6
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input6
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw2,
E: NAME="HDA Intel PCH Front Headphone"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=4
E: UDEV_LOG=3
E: USEC_INITIALIZED=5439786

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input6/event6
N: input/event6
E: DEVNAME=/dev/input/event6
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input6/event6
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=70
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444256

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input7
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input7
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,
E: NAME="HDA Intel PCH Line Out"
E: PHYS="ALSA"
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=40
E: UDEV_LOG=3
E: USEC_INITIALIZED=5440141

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input7/event7
N: input/event7
E: DEVNAME=/dev/input/event7
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input7/event7
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=71
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5443124

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12
E: EV=120013
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.0
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_0
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=00
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: KEY=1000000000007 ff9f207ac14057ff febeffdfffefffff fffffffffffffffe
E: LED=1f
E: MODALIAS=input:b0003v0557p2213e0100-
e0,1,4,11,14,k71,72,73,74,75,77,79,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8C,8E,96,98,9E,9F,A1,A3,A4,A5,A6,AD,B0,B1,B2,B3,B4,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,F0,ram4,l0,1,2,3,4,sfw
E: MSC=10
E: NAME="ATEN Advance Tech Inc. HDMI KVM V1.1.101"
E: PHYS="usb-0000:00:1d.0-1.1.1/input0"
E: PRODUCT=3/557/2213/100
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: UNIQ=""
E: USEC_INITIALIZED=12225587

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12
N: input/event12
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-event-kbd
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.0-event-kbd
E: BACKSPACE=guess
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
event-kbd /dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.0-event-kbd
E: DEVNAME=/dev/input/event12
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.0
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_0
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=00
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=76
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12228322
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13
E: EV=17
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: KEY=1f0000 0 0 0 0
E: MODALIAS=input:b0003v0557p2213e0100-
e0,1,2,4,k110,111,112,113,114,r0,1,8,am4,lsfw
E: MSC=10
E: NAME="ATEN Advance Tech Inc. HDMI KVM V1.1.101"
E: PHYS="usb-0000:00:1d.0-1.1.1/input1"
E: PRODUCT=3/557/2213/100
E: PROP=0
E: REL=103
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: UNIQ=""
E: USEC_INITIALIZED=12226179

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13
N: input/event13
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-event-mouse
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-if01-event-mouse
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-event-mouse
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
event-mouse /dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
if01-event-mouse /dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-event-
mouse
E: DEVNAME=/dev/input/event13
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=77
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12229085

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/mouse0
N: input/mouse0
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-if01-mouse
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-mouse
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-mouse
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
if01-mouse /dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-mouse 
/dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-mouse
E: DEVNAME=/dev/input/mouse0
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/mouse0
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=32
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12229036

P: /devices/platform/pcspkr/input/input2
E: DEVPATH=/devices/platform/pcspkr/input/input2
E: EV=40001
E: ID_INPUT=1
E: ID_PATH=platform-pcspkr
E: ID_PATH_TAG=platform-pcspkr
E: ID_SERIAL=noserial
E: MODALIAS=input:b0010v001Fp0001e0100-e0,12,kramls1,2,fw
E: NAME="PC Speaker"
E: PHYS="isa0061/input0"
E: PRODUCT=10/1f/1/100
E: PROP=0
E: SND=6
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3989502

P: /devices/platform/pcspkr/input/input2/event2
N: input/event2
S: input/by-path/platform-pcspkr-event-spkr
E: DEVLINKS=/dev/input/by-path/platform-pcspkr-event-spkr
E: DEVNAME=/dev/input/event2
E: DEVPATH=/devices/platform/pcspkr/input/input2/event2
E: ID_INPUT=1
E: ID_PATH=platform-pcspkr
E: ID_PATH_TAG=platform-pcspkr
E: ID_SERIAL=noserial
E: MAJOR=13
E: MINOR=66
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3992209


DRM Information from dmesg:
---------------------------
[    0.000000] No AGP bridge found
[    0.000000] No AGP bridge found
[    0.411719] Linux agpgart interface v0.103
[    4.078602] [drm] Initialized drm 1.1.0 20060810
[    4.379374] nouveau  [     DRM] VRAM: 512 MiB
[    4.379377] nouveau  [     DRM] GART: 512 MiB
[    4.379381] nouveau  [     DRM] BIT BIOS found
[    4.379384] nouveau  [     DRM] Bios version 70.08.37.00
[    4.379386] nouveau  [     DRM] TMDS table version 2.0
[    4.379388] nouveau  [     DRM] DCB version 4.0
[    4.379390] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    4.379392] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    4.379393] nouveau  [     DRM] DCB outp 02: 028113a6 0f220010
[    4.379395] nouveau  [     DRM] DCB outp 03: 02011362 00020010
[    4.379396] nouveau  [     DRM] DCB conn 00: 00001030
[    4.379398] nouveau  [     DRM] DCB conn 01: 00002146
[    4.380198] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.380200] [drm] No driver support for vblank timestamp query.
[    4.411429] nouveau  [     DRM] 3 available performance level(s)
[    4.411432] nouveau  [     DRM] 0: core 50MHz shader 101MHz memory 135MHz 
voltage 880mV
[    4.411434] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 324MHz 
voltage 900mV
[    4.411436] nouveau  [     DRM] 3: core 640MHz shader 1280MHz memory 800MHz 
voltage 990mV
[    4.411438] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 324MHz 
voltage 930mV fanspeed 30%
[    4.442553] nouveau  [     DRM] MM: using COPY1 for buffer copies
[    4.570333] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo 
ffff88041bbad800
[    4.618072] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on 
minor 0


-- System Information:
Debian Release: 7.0
  APT prefers testing
  APT policy: (900, 'testing')
Architecture: amd64 (x86_64)
Foreign Architectures: i386
armhf

Kernel: Linux 3.8-trunk-amd64 (SMP w/8 CPU cores)
Locale: LANG=fr_FR.UTF-8, LC_CTYPE=fr_FR.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash

Versions of packages xserver-xorg-video-nouveau depends on:
ii  libc6                                  2.13-38
ii  libdrm-nouveau2                        2.4.40-1
ii  libudev0                               175-7.2
ii  xserver-xorg-core [xorg-video-abi-12]  2:1.12.4-6

Versions of packages xserver-xorg-video-nouveau recommends:
ii  libgl1-mesa-dri  8.0.5-4

xserver-xorg-video-nouveau suggests no packages.

-- no debconf information

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368640713.64dB1.16950
Date: Wed, 15 May 2013 17:58:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Massive corruption"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64645">64645</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Massive corruption
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>roucaries.bastien+bugs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=79357" name="attach_79357" title="Corrupt one">attachment 79357</a> <a href="attachment.cgi?id=79357&amp;action=edit" title="Corrupt one">[details]</a></span>
Corrupt one

Dear nouveau coder I am affected by a nouveau bug. Massive corruption (see
attachment). How can I help?

Package: xserver-xorg-video-nouveau
Version: 1:1.0.7-1
Severity: important

Dear Maintainer,

Try to reproduce #699534 I get a new bug a massive graphics corruption, that I 
could reproduce quickly.

How can I help this time ?



-- Package-specific info:
X server symlink status:
------------------------
lrwxrwxrwx 1 root root 13 Jan  9  2012 /etc/X11/X -&gt; /usr/bin/Xorg
-rwxr-xr-x 1 root root 2044664 Apr 17 12:40 /usr/bin/Xorg

VGA-compatible devices on PCI bus:
----------------------------------
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108GL [Quadro 
600] [10de:0df8] (rev a1)

/etc/X11/xorg.conf does not exist.

/etc/X11/xorg.conf.d does not exist.

KMS configuration files:
------------------------
/etc/modprobe.d/i915-kms.conf:
  options i915 modeset=1
/etc/modprobe.d/radeon-kms.conf:
  options radeon modeset=1

Kernel version (/proc/version):
-------------------------------
Linux version 3.8-trunk-amd64 (<a href="mailto:debian-kernel&#64;lists.debian.org">debian-kernel&#64;lists.debian.org</a>) (gcc version 
4.7.2 (Debian 4.7.2-5) ) #1 SMP Debian 3.8.5-1~experimental.1

Xorg X server log files on system:
----------------------------------
-rw-r--r-- 1 root root 38191 May  6 15:18 /var/log/Xorg.0.log

Contents of most recent Xorg X server log file (/var/log/Xorg.0.log):
---------------------------------------------------------------------
[    85.947] 
X.Org X Server 1.12.4
Release Date: 2012-08-27
[    85.947] X Protocol Version 11, Revision 0
[    85.947] Build Operating System: Linux 3.2.0-4-amd64 x86_64 Debian
[    85.947] Current Operating System: Linux no56 3.8-trunk-amd64 #1 SMP 
Debian 3.8.5-1~experimental.1 x86_64
[    85.947] Kernel command line: BOOT_IMAGE=/vmlinuz-3.8-trunk-amd64 
root=/dev/mapper/VOL-ROOT ro quiet
[    85.947] Build Date: 17 April 2013  10:22:47AM
[    85.947] xorg-server 2:1.12.4-6 (Julien Cristau &lt;<a href="mailto:jcristau&#64;debian.org">jcristau&#64;debian.org</a>&gt;) 
[    85.947] Current version of pixman: 0.26.0
[    85.947]    Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
        to make sure that you have the latest version.
[    85.947] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    85.947] (==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Mon May  6 15:00:57 
2013
[    85.974] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[    86.027] (==) No Layout section.  Using the first Screen section.
[    86.027] (==) No screen section available. Using defaults.
[    86.027] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[    86.028] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[    86.028] (==) No monitor specified for screen &quot;Default Screen Section&quot;.
        Using a default monitor configuration.
[    86.028] (==) Automatically adding devices
[    86.028] (==) Automatically enabling devices
[    86.081] (WW) The directory &quot;/usr/share/fonts/X11/cyrillic&quot; does not 
exist.
[    86.081]    Entry deleted from font path.
[    86.141] (WW) `fonts.dir' not found (or not valid) in &quot;/var/lib/defoma/x-
ttcidfont-conf.d/dirs/TrueType&quot;.
[    86.141]    Entry deleted from font path.
[    86.141]    (Run 'mkfontdir' on &quot;/var/lib/defoma/x-ttcidfont-
conf.d/dirs/TrueType&quot;).
[    86.141] (==) FontPath set to:
        /usr/share/fonts/X11/misc,
        /usr/share/fonts/X11/100dpi/:unscaled,
        /usr/share/fonts/X11/75dpi/:unscaled,
        /usr/share/fonts/X11/Type1,
        /usr/share/fonts/X11/100dpi,
        /usr/share/fonts/X11/75dpi,
        built-ins
[    86.141] (==) ModulePath set to &quot;/usr/lib/xorg/modules&quot;
[    86.141] (II) The server relies on udev to provide the list of input 
devices.
        If no devices become available, reconfigure udev or disable 
AutoAddDevices.
[    86.141] (II) Loader magic: 0x7f1313c06ae0
[    86.141] (II) Module ABI versions:
[    86.141]    X.Org ANSI C Emulation: 0.4
[    86.141]    X.Org Video Driver: 12.1
[    86.141]    X.Org XInput driver : 16.0
[    86.141]    X.Org Server Extension : 6.0
[    86.142] (--) PCI:*(0:1:0:0) 10de:0df8:10de:0835 rev 161, Mem &#64; 
0xdb000000/16777216, 0xd0000000/134217728, 0xd8000000/33554432, I/O &#64; 
0x00003000/128, BIOS &#64; 0x????????/524288
[    86.142] (II) Open ACPI successful (/var/run/acpid.socket)
[    86.142] (II) LoadModule: &quot;extmod&quot;
[    86.360] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    86.435] (II) Module extmod: vendor=&quot;X.Org Foundation&quot;
[    86.435]    compiled for 1.12.4, module version = 1.0.0
[    86.435]    Module class: X.Org Server Extension
[    86.435]    ABI class: X.Org Server Extension, version 6.0
[    86.435] (II) Loading extension SELinux
[    86.435] (II) Loading extension MIT-SCREEN-SAVER
[    86.435] (II) Loading extension XFree86-VidModeExtension
[    86.435] (II) Loading extension XFree86-DGA
[    86.435] (II) Loading extension DPMS
[    86.435] (II) Loading extension XVideo
[    86.435] (II) Loading extension XVideo-MotionCompensation
[    86.435] (II) Loading extension X-Resource
[    86.435] (II) LoadModule: &quot;dbe&quot;
[    86.448] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    86.455] (II) Module dbe: vendor=&quot;X.Org Foundation&quot;
[    86.455]    compiled for 1.12.4, module version = 1.0.0
[    86.455]    Module class: X.Org Server Extension
[    86.455]    ABI class: X.Org Server Extension, version 6.0
[    86.455] (II) Loading extension DOUBLE-BUFFER
[    86.455] (II) LoadModule: &quot;glx&quot;
[    86.455] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    86.514] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[    86.514]    compiled for 1.12.4, module version = 1.0.0
[    86.514]    ABI class: X.Org Server Extension, version 6.0
[    86.514] (==) AIGLX enabled
[    86.514] (II) Loading extension GLX
[    86.514] (II) LoadModule: &quot;record&quot;
[    86.515] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    86.527] (II) Module record: vendor=&quot;X.Org Foundation&quot;
[    86.527]    compiled for 1.12.4, module version = 1.13.0
[    86.527]    Module class: X.Org Server Extension
[    86.527]    ABI class: X.Org Server Extension, version 6.0
[    86.527] (II) Loading extension RECORD
[    86.527] (II) LoadModule: &quot;dri&quot;
[    86.528] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    86.563] (II) Module dri: vendor=&quot;X.Org Foundation&quot;
[    86.563]    compiled for 1.12.4, module version = 1.0.0
[    86.563]    ABI class: X.Org Server Extension, version 6.0
[    86.563] (II) Loading extension XFree86-DRI
[    86.563] (II) LoadModule: &quot;dri2&quot;
[    86.564] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    86.564] (II) Module dri2: vendor=&quot;X.Org Foundation&quot;
[    86.564]    compiled for 1.12.4, module version = 1.2.0
[    86.564]    ABI class: X.Org Server Extension, version 6.0
[    86.564] (II) Loading extension DRI2
[    86.564] (==) Matched nouveau as autoconfigured driver 0
[    86.564] (==) Matched nv as autoconfigured driver 1
[    86.564] (==) Matched vesa as autoconfigured driver 2
[    86.564] (==) Matched fbdev as autoconfigured driver 3
[    86.564] (==) Assigned the driver to the xf86ConfigLayout
[    86.564] (II) LoadModule: &quot;nouveau&quot;
[    86.564] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    86.656] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[    86.656]    compiled for 1.12.4, module version = 1.0.7
[    86.656]    Module class: X.Org Video Driver
[    86.656]    ABI class: X.Org Video Driver, version 12.1
[    86.656] (II) LoadModule: &quot;nv&quot;
[    86.672] (WW) Warning, couldn't open module nv
[    86.672] (II) UnloadModule: &quot;nv&quot;
[    86.672] (II) Unloading nv
[    86.672] (EE) Failed to load module &quot;nv&quot; (module does not exist, 0)
[    86.672] (II) LoadModule: &quot;vesa&quot;
[    86.672] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    86.706] (II) Module vesa: vendor=&quot;X.Org Foundation&quot;
[    86.706]    compiled for 1.12.1, module version = 2.3.1
[    86.706]    Module class: X.Org Video Driver
[    86.706]    ABI class: X.Org Video Driver, version 12.0
[    86.706] (II) LoadModule: &quot;fbdev&quot;
[    86.706] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    86.715] (II) Module fbdev: vendor=&quot;X.Org Foundation&quot;
[    86.715]    compiled for 1.12.1, module version = 0.4.2
[    86.715]    ABI class: X.Org Video Driver, version 12.0
[    86.715] (II) NOUVEAU driver Date:   Wed Mar 27 09:50:03 2013 +0100
[    86.715] (II) NOUVEAU driver for NVIDIA chipset families :
[    86.715]    RIVA TNT        (NV04)
[    86.715]    RIVA TNT2       (NV05)
[    86.715]    GeForce 256     (NV10)
[    86.715]    GeForce 2       (NV11, NV15)
[    86.715]    GeForce 4MX     (NV17, NV18)
[    86.715]    GeForce 3       (NV20)
[    86.715]    GeForce 4Ti     (NV25, NV28)
[    86.715]    GeForce FX      (NV3x)
[    86.715]    GeForce 6       (NV4x)
[    86.715]    GeForce 7       (G7x)
[    86.715]    GeForce 8       (G8x)
[    86.715]    GeForce GTX 200 (NVA0)
[    86.715]    GeForce GTX 400 (NVC0)
[    86.715] (II) VESA: driver for VESA chipsets: vesa
[    86.715] (II) FBDEV: driver for framebuffer: fbdev
[    86.715] (++) using VT number 7

[    86.717] drmOpenDevice: node name is /dev/dri/card0
[    86.717] drmOpenDevice: open result is 8, (OK)
[    86.717] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    86.717] drmOpenDevice: node name is /dev/dri/card0
[    86.718] drmOpenDevice: open result is 8, (OK)
[    86.718] drmOpenByBusid: drmOpenMinor returns 8
[    86.718] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    86.718] (II) [drm] nouveau interface version: 1.1.0
[    86.718] (WW) Falling back to old probe method for vesa
[    86.718] (WW) Falling back to old probe method for fbdev
[    86.718] (II) Loading sub module &quot;fbdevhw&quot;
[    86.718] (II) LoadModule: &quot;fbdevhw&quot;
[    86.718] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    86.718] (II) Module fbdevhw: vendor=&quot;X.Org Foundation&quot;
[    86.718]    compiled for 1.12.4, module version = 0.0.2
[    86.718]    ABI class: X.Org Video Driver, version 12.1
[    86.718] (II) Loading sub module &quot;dri&quot;
[    86.718] (II) LoadModule: &quot;dri&quot;
[    86.718] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    86.718] (II) Module dri: vendor=&quot;X.Org Foundation&quot;
[    86.718]    compiled for 1.12.4, module version = 1.0.0
[    86.718]    ABI class: X.Org Server Extension, version 6.0
[    86.718] (II) NOUVEAU(0): Loaded DRI module
[    86.718] drmOpenDevice: node name is /dev/dri/card0
[    86.718] drmOpenDevice: open result is 9, (OK)
[    86.718] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    86.718] drmOpenDevice: node name is /dev/dri/card0
[    86.719] drmOpenDevice: open result is 9, (OK)
[    86.719] drmOpenByBusid: drmOpenMinor returns 9
[    86.719] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    86.719] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NVc1&quot;
[    86.719] (II) NOUVEAU(0): Creating default Display subsection in Screen 
section
        &quot;Default Screen Section&quot; for depth/fbbpp 24/32
[    86.719] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    86.719] (==) NOUVEAU(0): RGB weight 888
[    86.719] (==) NOUVEAU(0): Default visual is TrueColor
[    86.719] (==) NOUVEAU(0): Using HW cursor
[    86.719] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    86.719] (==) NOUVEAU(0): Page flipping enabled
[    86.719] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    86.757] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    86.884] (II) NOUVEAU(0): Output DP-1 has no monitor section
[    86.919] (II) NOUVEAU(0): EDID for output DVI-I-1
[    86.919] (II) NOUVEAU(0): Manufacturer: DEL  Model: 4077  Serial#: 
1144018259
[    86.919] (II) NOUVEAU(0): Year: 2011  Week: 41
[    86.919] (II) NOUVEAU(0): EDID Version: 1.3
[    86.919] (II) NOUVEAU(0): Digital Display Input
[    86.919] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
[    86.919] (II) NOUVEAU(0): Gamma: 2.20
[    86.919] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    86.919] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    86.919] (II) NOUVEAU(0): First detailed timing is preferred mode
[    86.919] (II) NOUVEAU(0): redX: 0.635 redY: 0.351   greenX: 0.311 greenY: 
0.630
[    86.919] (II) NOUVEAU(0): blueX: 0.149 blueY: 0.053   whiteX: 0.313 
whiteY: 0.329
[    86.919] (II) NOUVEAU(0): Supported established timings:
[    86.919] (II) NOUVEAU(0): 720x400&#64;70Hz
[    86.919] (II) NOUVEAU(0): 640x480&#64;60Hz
[    86.919] (II) NOUVEAU(0): 640x480&#64;75Hz
[    86.919] (II) NOUVEAU(0): 800x600&#64;60Hz
[    86.919] (II) NOUVEAU(0): 800x600&#64;75Hz
[    86.919] (II) NOUVEAU(0): 1024x768&#64;60Hz
[    86.919] (II) NOUVEAU(0): 1024x768&#64;75Hz
[    86.919] (II) NOUVEAU(0): 1280x1024&#64;75Hz
[    86.919] (II) NOUVEAU(0): Manufacturer's mask: 0
[    86.919] (II) NOUVEAU(0): Supported standard timings:
[    86.919] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 
20337
[    86.919] (II) NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 
32897
[    86.919] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1080  refresh: 60  vid: 
49361
[    86.919] (II) NOUVEAU(0): Supported detailed timing:
[    86.919] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  510 x 287 mm
[    86.919] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end 2052 
h_blank_end 2200 h_border: 0
[    86.919] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end 1089 
v_blanking: 1125 v_border: 0
[    86.919] (II) NOUVEAU(0): Serial No: D7C741ABD0US
[    86.919] (II) NOUVEAU(0): Monitor name: DELL P2312H
[    86.919] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max: 
83 kHz, PixClock max 175 MHz
[    86.919] (II) NOUVEAU(0): EDID (in hex):
[    86.919] (II) NOUVEAU(0):   00ffffffffffff0010ac774053553044
[    86.919] (II) NOUVEAU(0):   2915010380331d78eab965a2594fa126
[    86.919] (II) NOUVEAU(0):   0d5054a54b00714f8180d1c001010101
[    86.919] (II) NOUVEAU(0):   010101010101023a801871382d40582c
[    86.919] (II) NOUVEAU(0):   4500fe1f1100001e000000ff00443743
[    86.919] (II) NOUVEAU(0):   3734314142443055530a000000fc0044
[    86.919] (II) NOUVEAU(0):   454c4c205032333132480a20000000fd
[    86.919] (II) NOUVEAU(0):   00384c1e5311000a2020202020200042
[    86.919] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16503
[    86.919] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    86.919] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    86.919] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    86.919] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    86.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[    86.919] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    86.919] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  148.50  1920 2008 
2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 
1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 
1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    86.919] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    87.044] (II) NOUVEAU(0): EDID for output DP-1
[    87.044] (II) NOUVEAU(0): Output DVI-I-1 connected
[    87.044] (II) NOUVEAU(0): Output DP-1 disconnected
[    87.044] (II) NOUVEAU(0): Using exact sizes for initial modes
[    87.044] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1920x1080
[    87.044] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless 
otherwise stated.
[    87.044] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1920x1080&quot;: 148.5 MHz (scaled from 
0.0 MHz), 67.5 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  148.50  1920 2008 
2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz (scaled from 
0.0 MHz), 80.0 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz (scaled from 
0.0 MHz), 64.0 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1152x864&quot;: 108.0 MHz (scaled from 
0.0 MHz), 67.5 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (scaled from 
0.0 MHz), 60.1 kHz, 75.1 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (scaled from 
0.0 MHz), 48.4 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 49.5 MHz (scaled from 
0.0 MHz), 46.9 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 
1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (scaled from 
0.0 MHz), 37.9 kHz, 60.3 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 
1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 
0.0 MHz), 37.5 kHz, 75.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (scaled from 
0.0 MHz), 31.5 kHz, 60.0 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    87.044] (**) NOUVEAU(0):  Driver mode &quot;720x400&quot;: 28.3 MHz (scaled from 
0.0 MHz), 31.5 kHz, 70.1 Hz
[    87.044] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    87.044] (**) NOUVEAU(0): Display dimensions: (510, 290) mm
[    87.044] (**) NOUVEAU(0): DPI set to (95, 94)
[    87.044] (II) Loading sub module &quot;fb&quot;
[    87.044] (II) LoadModule: &quot;fb&quot;
[    87.044] (II) Loading /usr/lib/xorg/modules/libfb.so
[    87.051] (II) Module fb: vendor=&quot;X.Org Foundation&quot;
[    87.051]    compiled for 1.12.4, module version = 1.0.0
[    87.051]    ABI class: X.Org ANSI C Emulation, version 0.4
[    87.051] (II) Loading sub module &quot;exa&quot;
[    87.051] (II) LoadModule: &quot;exa&quot;
[    87.051] (II) Loading /usr/lib/xorg/modules/libexa.so
[    87.056] (II) Module exa: vendor=&quot;X.Org Foundation&quot;
[    87.056]    compiled for 1.12.4, module version = 2.5.0
[    87.056]    ABI class: X.Org Video Driver, version 12.1
[    87.056] (II) Loading sub module &quot;shadowfb&quot;
[    87.056] (II) LoadModule: &quot;shadowfb&quot;
[    87.056] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    87.070] (II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
[    87.070]    compiled for 1.12.4, module version = 1.0.0
[    87.070]    ABI class: X.Org ANSI C Emulation, version 0.4
[    87.070] (II) UnloadModule: &quot;vesa&quot;
[    87.070] (II) Unloading vesa
[    87.070] (II) UnloadModule: &quot;fbdev&quot;
[    87.070] (II) Unloading fbdev
[    87.070] (II) UnloadSubModule: &quot;fbdevhw&quot;
[    87.070] (II) Unloading fbdevhw
[    87.070] (--) Depth 24 pixmap format is 32 bpp
[    87.071] (II) NOUVEAU(0): Opened GPU channel 0
[    87.073] (II) NOUVEAU(0): [DRI2] Setup complete
[    87.073] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    87.073] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    87.073] (II) EXA(0): Driver allocated offscreen pixmaps
[    87.073] (II) EXA(0): Driver registered support for the following 
operations:
[    87.073] (II)         Solid
[    87.073] (II)         Copy
[    87.073] (II)         Composite (RENDER acceleration)
[    87.073] (II)         UploadToScreen
[    87.073] (II)         DownloadFromScreen
[    87.073] (==) NOUVEAU(0): Backing store disabled
[    87.073] (==) NOUVEAU(0): Silken mouse enabled
[    87.073] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 
Textured Video.
[    87.073] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    87.073] (==) NOUVEAU(0): DPMS enabled
[    87.074] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR 
disabled message.
[    87.074] (--) RandR disabled
[    87.074] (II) Initializing built-in extension Generic Event Extension
[    87.074] (II) Initializing built-in extension SHAPE
[    87.074] (II) Initializing built-in extension MIT-SHM
[    87.074] (II) Initializing built-in extension XInputExtension
[    87.074] (II) Initializing built-in extension XTEST
[    87.074] (II) Initializing built-in extension BIG-REQUESTS
[    87.074] (II) Initializing built-in extension SYNC
[    87.074] (II) Initializing built-in extension XKEYBOARD
[    87.074] (II) Initializing built-in extension XC-MISC
[    87.074] (II) Initializing built-in extension SECURITY
[    87.074] (II) Initializing built-in extension XINERAMA
[    87.074] (II) Initializing built-in extension XFIXES
[    87.074] (II) Initializing built-in extension RENDER
[    87.074] (II) Initializing built-in extension RANDR
[    87.074] (II) Initializing built-in extension COMPOSITE
[    87.074] (II) Initializing built-in extension DAMAGE
[    87.074] (II) SELinux: Disabled on system
[    87.238] (EE) AIGLX error: Calling driver entry point failed
[    87.238] (EE) AIGLX: reverting to software rendering
[    87.238] (II) AIGLX: Screen 0 is not DRI capable
[    87.339] (II) AIGLX: Loaded and initialized swrast
[    87.339] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[    87.341] (II) NOUVEAU(0): NVEnterVT is called.
[    87.349] (II) NOUVEAU(0): Setting screen physical size to 508 x 285
[    87.349] resize called 1920 1080
[    87.644] (II) config/udev: Adding input device Power Button 
(/dev/input/event1)
[    87.644] (**) Power Button: Applying InputClass &quot;evdev keyboard catchall&quot;
[    87.644] (II) LoadModule: &quot;evdev&quot;
[    87.644] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    87.648] (II) Module evdev: vendor=&quot;X.Org Foundation&quot;
[    87.648]    compiled for 1.12.1, module version = 2.7.0
[    87.648]    Module class: X.Org XInput Driver
[    87.648]    ABI class: X.Org XInput driver, version 16.0
[    87.648] (II) Using input driver 'evdev' for 'Power Button'
[    87.648] (**) Power Button: always reports core events
[    87.648] (**) evdev: Power Button: Device: &quot;/dev/input/event1&quot;
[    87.648] (--) evdev: Power Button: Vendor 0 Product 0x1
[    87.648] (--) evdev: Power Button: Found keys
[    87.648] (II) evdev: Power Button: Configuring as keyboard
[    87.648] (**) Option &quot;config_info&quot; 
&quot;udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1&quot;
[    87.648] (II) XINPUT: Adding extended input device &quot;Power Button&quot; (type: 
KEYBOARD, id 6)
[    87.648] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    87.648] (**) Option &quot;xkb_model&quot; &quot;pc105&quot;
[    87.648] (**) Option &quot;xkb_layout&quot; &quot;fr&quot;
[    87.648] (**) Option &quot;xkb_variant&quot; &quot;latin9&quot;
[    87.681] (II) config/udev: Adding input device Power Button 
(/dev/input/event0)
[    87.681] (**) Power Button: Applying InputClass &quot;evdev keyboard catchall&quot;
[    87.681] (II) Using input driver 'evdev' for 'Power Button'
[    87.681] (**) Power Button: always reports core events
[    87.681] (**) evdev: Power Button: Device: &quot;/dev/input/event0&quot;
[    87.681] (--) evdev: Power Button: Vendor 0 Product 0x1
[    87.681] (--) evdev: Power Button: Found keys
[    87.682] (II) evdev: Power Button: Configuring as keyboard
[    87.682] (**) Option &quot;config_info&quot; 
&quot;udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0&quot;
[    87.682] (II) XINPUT: Adding extended input device &quot;Power Button&quot; (type: 
KEYBOARD, id 7)
[    87.682] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    87.682] (**) Option &quot;xkb_model&quot; &quot;pc105&quot;
[    87.682] (**) Option &quot;xkb_layout&quot; &quot;fr&quot;
[    87.682] (**) Option &quot;xkb_variant&quot; &quot;latin9&quot;
[    87.682] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 
(/dev/input/event10)
[    87.682] (II) No input driver specified, ignoring this device.
[    87.682] (II) This device may have been added with another device file.
[    87.682] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 
(/dev/input/event11)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 
(/dev/input/event8)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 
(/dev/input/event9)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.683] (II) config/udev: Adding input device HDA Digital PCBeep 
(/dev/input/event3)
[    87.683] (II) No input driver specified, ignoring this device.
[    87.683] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Front Mic 
(/dev/input/event4)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Rear Mic 
(/dev/input/event5)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.684] (II) config/udev: Adding input device HDA Intel PCH Front 
Headphone (/dev/input/event6)
[    87.684] (II) No input driver specified, ignoring this device.
[    87.684] (II) This device may have been added with another device file.
[    87.685] (II) config/udev: Adding input device HDA Intel PCH Line Out 
(/dev/input/event7)
[    87.685] (II) No input driver specified, ignoring this device.
[    87.685] (II) This device may have been added with another device file.
[    87.685] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/event12)
[    87.685] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: Applying 
InputClass &quot;evdev keyboard catchall&quot;
[    87.685] (II) Using input driver 'evdev' for 'ATEN Advance Tech Inc. HDMI 
KVM V1.1.101'
[    87.685] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: always reports 
core events
[    87.685] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Device: 
&quot;/dev/input/event12&quot;
[    87.685] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Vendor 
0x557 Product 0x2213
[    87.685] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found keys
[    87.685] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Configuring 
as keyboard
[    87.685] (**) Option &quot;config_info&quot; 
&quot;udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12&quot;
[    87.685] (II) XINPUT: Adding extended input device &quot;ATEN Advance Tech Inc. 
HDMI KVM V1.1.101&quot; (type: KEYBOARD, id 8)
[    87.685] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    87.685] (**) Option &quot;xkb_model&quot; &quot;pc105&quot;
[    87.685] (**) Option &quot;xkb_layout&quot; &quot;fr&quot;
[    87.685] (**) Option &quot;xkb_variant&quot; &quot;latin9&quot;
[    87.686] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/event13)
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: Applying 
InputClass &quot;evdev pointer catchall&quot;
[    87.686] (II) Using input driver 'evdev' for 'ATEN Advance Tech Inc. HDMI 
KVM V1.1.101'
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: always reports 
core events
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Device: 
&quot;/dev/input/event13&quot;
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Vendor 
0x557 Product 0x2213
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 9 
mouse buttons
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 
scroll wheel(s)
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found 
relative axes
[    87.686] (--) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Found x and 
y relative axes
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Configuring 
as mouse
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: Adding 
scrollwheel support
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: 
YAxisMapping: buttons 4 and 5
[    87.686] (**) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: 
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    87.686] (**) Option &quot;config_info&quot; 
&quot;udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13&quot;
[    87.686] (II) XINPUT: Adding extended input device &quot;ATEN Advance Tech Inc. 
HDMI KVM V1.1.101&quot; (type: MOUSE, id 9)
[    87.686] (II) evdev: ATEN Advance Tech Inc. HDMI KVM V1.1.101: initialized 
for relative axes.
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) keeping 
acceleration scheme 1
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration profile 0
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration factor: 2.000
[    87.686] (**) ATEN Advance Tech Inc. HDMI KVM V1.1.101: (accel) 
acceleration threshold: 4
[    87.687] (II) config/udev: Adding input device ATEN Advance Tech Inc. HDMI 
KVM V1.1.101 (/dev/input/mouse0)
[    87.687] (II) No input driver specified, ignoring this device.
[    87.687] (II) This device may have been added with another device file.
[    87.687] (II) config/udev: Adding input device PC Speaker 
(/dev/input/event2)
[    87.687] (II) No input driver specified, ignoring this device.
[    87.687] (II) This device may have been added with another device file.
[   100.995] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16503
[   100.995] (II) NOUVEAU(0): Using hsync ranges from config file
[   100.995] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   100.995] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   100.995] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   100.995] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   100.995] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   100.996] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   110.262] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16503
[   110.262] (II) NOUVEAU(0): Using hsync ranges from config file
[   110.262] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   110.262] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   110.263] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   110.263] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   110.263] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   110.426] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16503
[   110.426] (II) NOUVEAU(0): Using hsync ranges from config file
[   110.426] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   110.426] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   110.426] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   110.426] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   110.426] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   116.223] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 16503
[   116.223] (II) NOUVEAU(0): Using hsync ranges from config file
[   116.223] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   116.223] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   116.223] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x0.0  148.50  1920 2008 2052 
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[   116.223] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056  
600 601 605 628 +hsync +vsync (37.9 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840  
480 481 484 500 -hsync -vsync (37.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800  
480 490 492 525 -hsync -vsync (31.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900  
400 412 414 449 -hsync +vsync (31.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440 
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136 
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184 
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056  
600 601 604 625 +hsync +vsync (46.9 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344 
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440 
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[   116.223] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  172.80  1920 2040 
2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz e)
[   837.547] (WW) Open ACPI failed (/var/run/acpid.socket) (Connection 
refused)
[  1141.679] (II) Open ACPI successful (/var/run/acpid.socket)
[  1142.691] (WW) Open ACPI failed (/var/run/acpid.socket) (Connection 
refused)
[  1143.691] (II) Open ACPI successful (/var/run/acpid.socket)

udev information:
-----------------
P: /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
E: DEVPATH=/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
E: EV=3
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-LNXPWRBN:00
E: ID_PATH_TAG=acpi-LNXPWRBN_00
E: KEY=10000000000000 0
E: MODALIAS=input:b0019v0000p0001e0000-e0,1,k74,ramlsfw
E: NAME=&quot;Power Button&quot;
E: PHYS=&quot;LNXPWRBN/button/input0&quot;
E: PRODUCT=19/0/1/0
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3821882

P: /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1
N: input/event1
E: BACKSPACE=guess
E: DEVNAME=/dev/input/event1
E: DEVPATH=/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1
E: DMI_VENDOR=Dell Inc.
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-LNXPWRBN:00
E: ID_PATH_TAG=acpi-LNXPWRBN_00
E: MAJOR=13
E: MINOR=65
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=4115021
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
E: EV=3
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-PNP0C0C:00
E: ID_PATH_TAG=acpi-PNP0C0C_00
E: KEY=10000000000000 0
E: MODALIAS=input:b0019v0000p0001e0000-e0,1,k74,ramlsfw
E: NAME=&quot;Power Button&quot;
E: PHYS=&quot;PNP0C0C/button/input0&quot;
E: PRODUCT=19/0/1/0
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3821868

P: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0
N: input/event0
E: BACKSPACE=guess
E: DEVNAME=/dev/input/event0
E: DEVPATH=/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0
E: DMI_VENDOR=Dell Inc.
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_PATH=acpi-PNP0C0C:00
E: ID_PATH_TAG=acpi-PNP0C0C_00
E: MAJOR=13
E: MINOR=64
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=4115022
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME=&quot;HDA NVidia HDMI/DP,pcm=7&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5440984

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10/event10
N: input/event10
E: DEVNAME=/dev/input/event10
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input10/event10
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=74
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444747

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME=&quot;HDA NVidia HDMI/DP,pcm=3&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5441813

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11/event11
N: input/event11
E: DEVNAME=/dev/input/event11
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input11/event11
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=75
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444645

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME=&quot;HDA NVidia HDMI/DP,pcm=9&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5441220

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8/event8
N: input/event8
E: DEVNAME=/dev/input/event8
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input8/event8
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=72
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444883

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9
E: DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,8,
E: NAME=&quot;HDA NVidia HDMI/DP,pcm=8&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=140
E: UDEV_LOG=3
E: USEC_INITIALIZED=5443309

P: /devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9/event9
N: input/event9
E: DEVNAME=/dev/input/event9
E: 
DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input9/event9
E: ID_INPUT=1
E: ID_PATH=pci-0000:01:00.1
E: ID_PATH_TAG=pci-0000_01_00_1
E: MAJOR=13
E: MINOR=73
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5445669

P: /devices/pci0000:00/0000:00:1b.0/input/input3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/input/input3
E: EV=40001
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0001v10ECp0269e0001-e0,12,kramls1,2,fw
E: NAME=&quot;HDA Digital PCBeep&quot;
E: PHYS=&quot;card0/codec#0/beep0&quot;
E: PRODUCT=1/10ec/269/1
E: PROP=0
E: SND=6
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5438569

P: /devices/pci0000:00/0000:00:1b.0/input/input3/event3
N: input/event3
E: DEVNAME=/dev/input/event3
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/input/input3/event3
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=67
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5442525

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input4
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input4
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw4,
E: NAME=&quot;HDA Intel PCH Front Mic&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=10
E: UDEV_LOG=3
E: USEC_INITIALIZED=5438893

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input4/event4
N: input/event4
E: DEVNAME=/dev/input/event4
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input4/event4
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=68
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5442658

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input5
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input5
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw4,
E: NAME=&quot;HDA Intel PCH Rear Mic&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=10
E: UDEV_LOG=3
E: USEC_INITIALIZED=5439596

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input5/event5
N: input/event5
E: DEVNAME=/dev/input/event5
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input5/event5
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=69
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444148

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input6
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input6
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw2,
E: NAME=&quot;HDA Intel PCH Front Headphone&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=4
E: UDEV_LOG=3
E: USEC_INITIALIZED=5439786

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input6/event6
N: input/event6
E: DEVNAME=/dev/input/event6
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input6/event6
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=70
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5444256

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input7
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input7
E: EV=21
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MODALIAS=input:b0000v0000p0000e0000-e0,5,kramlsfw6,
E: NAME=&quot;HDA Intel PCH Line Out&quot;
E: PHYS=&quot;ALSA&quot;
E: PRODUCT=0/0/0/0
E: PROP=0
E: SUBSYSTEM=input
E: SW=40
E: UDEV_LOG=3
E: USEC_INITIALIZED=5440141

P: /devices/pci0000:00/0000:00:1b.0/sound/card0/input7/event7
N: input/event7
E: DEVNAME=/dev/input/event7
E: DEVPATH=/devices/pci0000:00/0000:00:1b.0/sound/card0/input7/event7
E: ID_INPUT=1
E: ID_PATH=pci-0000:00:1b.0
E: ID_PATH_TAG=pci-0000_00_1b_0
E: MAJOR=13
E: MINOR=71
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=5443124

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12
E: EV=120013
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.0
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_0
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=00
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: KEY=1000000000007 ff9f207ac14057ff febeffdfffefffff fffffffffffffffe
E: LED=1f
E: MODALIAS=input:b0003v0557p2213e0100-
e0,1,4,11,14,k71,72,73,74,75,77,79,7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8C,8E,96,98,9E,9F,A1,A3,A4,A5,A6,AD,B0,B1,B2,B3,B4,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,F0,ram4,l0,1,2,3,4,sfw
E: MSC=10
E: NAME=&quot;ATEN Advance Tech Inc. HDMI KVM V1.1.101&quot;
E: PHYS=&quot;usb-0000:00:1d.0-1.1.1/input0&quot;
E: PRODUCT=3/557/2213/100
E: PROP=0
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: UNIQ=&quot;&quot;
E: USEC_INITIALIZED=12225587

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12
N: input/event12
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-event-kbd
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.0-event-kbd
E: BACKSPACE=guess
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
event-kbd /dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.0-event-kbd
E: DEVNAME=/dev/input/event12
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.0/input/input12/event12
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_KEY=1
E: ID_INPUT_KEYBOARD=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.0
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_0
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=00
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=76
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12228322
E: XKBLAYOUT=fr
E: XKBMODEL=pc105
E: XKBVARIANT=latin9

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13
E: EV=17
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: KEY=1f0000 0 0 0 0
E: MODALIAS=input:b0003v0557p2213e0100-
e0,1,2,4,k110,111,112,113,114,r0,1,8,am4,lsfw
E: MSC=10
E: NAME=&quot;ATEN Advance Tech Inc. HDMI KVM V1.1.101&quot;
E: PHYS=&quot;usb-0000:00:1d.0-1.1.1/input1&quot;
E: PRODUCT=3/557/2213/100
E: PROP=0
E: REL=103
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: UNIQ=&quot;&quot;
E: USEC_INITIALIZED=12226179

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13
N: input/event13
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-event-mouse
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-if01-event-mouse
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-event-mouse
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
event-mouse /dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
if01-event-mouse /dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-event-
mouse
E: DEVNAME=/dev/input/event13
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/event13
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=77
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12229085

P: 
/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/mouse0
N: input/mouse0
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-if01-mouse
S: input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-mouse
S: input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-mouse
E: DEVLINKS=/dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-
if01-mouse /dev/input/by-id/usb-ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101-mouse 
/dev/input/by-path/pci-0000:00:1d.0-usb-0:1.1.1:1.1-mouse
E: DEVNAME=/dev/input/mouse0
E: 
DEVPATH=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1.1/2-1.1.1:1.1/input/input13/mouse0
E: ID_BUS=usb
E: ID_INPUT=1
E: ID_INPUT_MOUSE=1
E: ID_MODEL=HDMI_KVM_V1.1.101
E: ID_MODEL_ENC=HDMI\x20KVM\x20V1.1.101
E: ID_MODEL_ID=2213
E: ID_PATH=pci-0000:00:1d.0-usb-0:1.1.1:1.1
E: ID_PATH_TAG=pci-0000_00_1d_0-usb-0_1_1_1_1_1
E: ID_REVISION=0100
E: ID_SERIAL=ATEN_Advance_Tech_Inc._HDMI_KVM_V1.1.101
E: ID_TYPE=hid
E: ID_USB_DRIVER=usbhid
E: ID_USB_INTERFACES=:030101:030102:
E: ID_USB_INTERFACE_NUM=01
E: ID_VENDOR=ATEN_Advance_Tech_Inc.
E: ID_VENDOR_ENC=ATEN\x20Advance\x20Tech\x20Inc.
E: ID_VENDOR_ID=0557
E: MAJOR=13
E: MINOR=32
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=12229036

P: /devices/platform/pcspkr/input/input2
E: DEVPATH=/devices/platform/pcspkr/input/input2
E: EV=40001
E: ID_INPUT=1
E: ID_PATH=platform-pcspkr
E: ID_PATH_TAG=platform-pcspkr
E: ID_SERIAL=noserial
E: MODALIAS=input:b0010v001Fp0001e0100-e0,12,kramls1,2,fw
E: NAME=&quot;PC Speaker&quot;
E: PHYS=&quot;isa0061/input0&quot;
E: PRODUCT=10/1f/1/100
E: PROP=0
E: SND=6
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3989502

P: /devices/platform/pcspkr/input/input2/event2
N: input/event2
S: input/by-path/platform-pcspkr-event-spkr
E: DEVLINKS=/dev/input/by-path/platform-pcspkr-event-spkr
E: DEVNAME=/dev/input/event2
E: DEVPATH=/devices/platform/pcspkr/input/input2/event2
E: ID_INPUT=1
E: ID_PATH=platform-pcspkr
E: ID_PATH_TAG=platform-pcspkr
E: ID_SERIAL=noserial
E: MAJOR=13
E: MINOR=66
E: SUBSYSTEM=input
E: UDEV_LOG=3
E: USEC_INITIALIZED=3992209


DRM Information from dmesg:
---------------------------
[    0.000000] No AGP bridge found
[    0.000000] No AGP bridge found
[    0.411719] Linux agpgart interface v0.103
[    4.078602] [drm] Initialized drm 1.1.0 20060810
[    4.379374] nouveau  [     DRM] VRAM: 512 MiB
[    4.379377] nouveau  [     DRM] GART: 512 MiB
[    4.379381] nouveau  [     DRM] BIT BIOS found
[    4.379384] nouveau  [     DRM] Bios version 70.08.37.00
[    4.379386] nouveau  [     DRM] TMDS table version 2.0
[    4.379388] nouveau  [     DRM] DCB version 4.0
[    4.379390] nouveau  [     DRM] DCB outp 00: 02000300 00000000
[    4.379392] nouveau  [     DRM] DCB outp 01: 01000302 00020030
[    4.379393] nouveau  [     DRM] DCB outp 02: 028113a6 0f220010
[    4.379395] nouveau  [     DRM] DCB outp 03: 02011362 00020010
[    4.379396] nouveau  [     DRM] DCB conn 00: 00001030
[    4.379398] nouveau  [     DRM] DCB conn 01: 00002146
[    4.380198] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    4.380200] [drm] No driver support for vblank timestamp query.
[    4.411429] nouveau  [     DRM] 3 available performance level(s)
[    4.411432] nouveau  [     DRM] 0: core 50MHz shader 101MHz memory 135MHz 
voltage 880mV
[    4.411434] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 324MHz 
voltage 900mV
[    4.411436] nouveau  [     DRM] 3: core 640MHz shader 1280MHz memory 800MHz 
voltage 990mV
[    4.411438] nouveau  [     DRM] c: core 405MHz shader 810MHz memory 324MHz 
voltage 930mV fanspeed 30%
[    4.442553] nouveau  [     DRM] MM: using COPY1 for buffer copies
[    4.570333] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo 
ffff88041bbad800
[    4.618072] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on 
minor 0


-- System Information:
Debian Release: 7.0
  APT prefers testing
  APT policy: (900, 'testing')
Architecture: amd64 (x86_64)
Foreign Architectures: i386
armhf

Kernel: Linux 3.8-trunk-amd64 (SMP w/8 CPU cores)
Locale: LANG=fr_FR.UTF-8, LC_CTYPE=fr_FR.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/dash

Versions of packages xserver-xorg-video-nouveau depends on:
ii  libc6                                  2.13-38
ii  libdrm-nouveau2                        2.4.40-1
ii  libudev0                               175-7.2
ii  xserver-xorg-core [xorg-video-abi-12]  2:1.12.4-6

Versions of packages xserver-xorg-video-nouveau recommends:
ii  libgl1-mesa-dri  8.0.5-4

xserver-xorg-video-nouveau suggests no packages.

-- no debconf information</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368640713.64dB1.16950--

--===============1195005209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1195005209==--

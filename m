From: Harry Putnam <reader-kFrNdAxtuftBDgjK7y7TUQ@public.gmane.org>
Subject: xrandr or xorg.conf... help with virtual size desktop
Date: Thu, 13 Oct 2011 08:57:21 -0500
Message-ID: <87botluh8e.fsf@newsguy.com>
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

I've come at this a few different ways on this list and others.  But not
really getting a solution.  Possibly there is none until some changes
are made upstream.

Setup: Debian Wheezy (testing) 3.0.0-1-686-pae
Video card: Nvidia XF 5700LE
Older P4 intel cpu 3.06 (single core)
(Using Nouveau driver)

My aim is to create a large pannable desktop either with use of
xorg.conf or xrandr.

In the past, on a Gentoo linux OS using the same hardware:
(Cpu and video card the same as now and shown above in `Setup')

It worked to have this in xorg.conf inside a screen subsection.

    [...]
    Subsection "Display"
        Depth       24
        Modes       "1280x1024" #"1024x768" "800x600" "640x480"
        Virtual     2048 1536 
        ViewPort    0 0
    EndSubsection
    [...]

Note the `Virtual' line.

The end result was a pannable desktop at size 2048x1536

I haven't been able to figure out how to get that to work in a current
xorg.conf created by: `Xorg -configure' (in console mode).

I have inlined an attempted xorg.conf, that seems to work so far as X
being usable but fails to provide the virtual size.
(the xorg.conf is inlined following Xorg.0.log)

-------        ---------       ---=---       ---------      -------- 

So I turned to xrandr, hoping to set something similar.

And I believe xrandr commands such as:

 xrandr --output DVI-I-1  --mode 1440x900 \
                 --fb 1440x900 --panning 1680x105

or even the full previously available size:

 xrandr --output DVI-I-1  --mode 1440x900 \
                --fb 2048x1536 --panning 2048x1536

Do set the size.

Either of those appears to set the larger virtual size as I see an
image I use as background grow very noticably... and a panel set at
the bottom of my screen is pushed down out of site.

All well and good, except the mouse cannot pan into the newly created
space and is still confined to the visible borders.

It appears to be because of this bug:
   https://bugs.freedesktop.org/show_bug.cgi?id=39994
reported 2011-08-08

Reading the comments, there have been a few patches submitted but
apparently no actions taken as yet.

Can any of you help me figure out how to get a large panning desktop?
Is anyone here using or able to set a large panning desktop?

I've inlined both a fresh Xorg.0.log and the current xorg.conf.
(NOTE: xorg.conf was NOT in use when Xorg.0.log was created)
-------        ---------       ---=---       ---------      -------- 
-------        ---------       ---=---       ---------      --------
This Xorg.0.log created following a reboot, and with no xorg.conf

[    25.396] 
X.Org X Server 1.11.1
Release Date: 2011-09-24
[    25.417] X Protocol Version 11, Revision 0
[    25.417] Build Operating System: Linux 2.6.32-5-amd64 i686 Debian
[    25.417] Current Operating System: Linux reader 3.0.0-1-686-pae #1 SMP Sat Aug 27 16:41:03 UTC 2011 i686
[    25.418] Kernel command line: BOOT_IMAGE=/vmlinuz-3.0.0-1-686-pae root=UUID=83a94f1d-e6e6-432e-86ad-b24754755fff ro quiet splash
[    25.418] Build Date: 24 September 2011  10:02:42AM
[    25.418] xorg-server 2:1.11.1-1 (Cyril Brulebois <kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
[    25.418] Current version of pixman: 0.22.2
[    25.418] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    25.418] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    25.418] (==) Log file: "/var/log/Xorg.0.log", Time: Thu Oct 13 08:29:19 2011
[    25.792] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    25.816] (==) No Layout section.  Using the first Screen section.
[    25.816] (==) No screen section available. Using defaults.
[    25.816] (**) |-->Screen "Default Screen Section" (0)
[    25.816] (**) |   |-->Monitor "<default monitor>"
[    25.827] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    25.827] (==) Automatically adding devices
[    25.827] (==) Automatically enabling devices
[    25.827] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    25.827] 	Entry deleted from font path.
[    25.964] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
[    25.964] (==) ModulePath set to "/usr/lib/xorg/modules"
[    25.964] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    25.986] (II) Loader magic: 0x822b800
[    25.987] (II) Module ABI versions:
[    25.987] 	X.Org ANSI C Emulation: 0.4
[    25.987] 	X.Org Video Driver: 11.0
[    25.987] 	X.Org XInput driver : 13.0
[    25.987] 	X.Org Server Extension : 6.0
[    25.988] (--) PCI:*(0:1:0:0) 10de:0343:1462:9590 rev 161, Mem @ 0xfd000000/16777216, 0xc0000000/268435456, BIOS @ 0x????????/131072
[    25.988] (II) Open ACPI successful (/var/run/acpid.socket)
[    25.988] (II) LoadModule: "extmod"
[    26.005] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    26.022] (II) Module extmod: vendor="X.Org Foundation"
[    26.022] 	compiled for 1.11.1, module version = 1.0.0
[    26.022] 	Module class: X.Org Server Extension
[    26.022] 	ABI class: X.Org Server Extension, version 6.0
[    26.023] (II) Loading extension SELinux
[    26.023] (II) Loading extension MIT-SCREEN-SAVER
[    26.023] (II) Loading extension XFree86-VidModeExtension
[    26.023] (II) Loading extension XFree86-DGA
[    26.023] (II) Loading extension DPMS
[    26.023] (II) Loading extension XVideo
[    26.023] (II) Loading extension XVideo-MotionCompensation
[    26.023] (II) Loading extension X-Resource
[    26.023] (II) LoadModule: "dbe"
[    26.023] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    26.033] (II) Module dbe: vendor="X.Org Foundation"
[    26.033] 	compiled for 1.11.1, module version = 1.0.0
[    26.033] 	Module class: X.Org Server Extension
[    26.033] 	ABI class: X.Org Server Extension, version 6.0
[    26.033] (II) Loading extension DOUBLE-BUFFER
[    26.033] (II) LoadModule: "glx"
[    26.033] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    26.062] (II) Module glx: vendor="X.Org Foundation"
[    26.062] 	compiled for 1.11.1, module version = 1.0.0
[    26.063] 	ABI class: X.Org Server Extension, version 6.0
[    26.063] (==) AIGLX enabled
[    26.063] (II) Loading extension GLX
[    26.063] (II) LoadModule: "record"
[    26.063] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    26.064] (II) Module record: vendor="X.Org Foundation"
[    26.064] 	compiled for 1.11.1, module version = 1.13.0
[    26.064] 	Module class: X.Org Server Extension
[    26.064] 	ABI class: X.Org Server Extension, version 6.0
[    26.064] (II) Loading extension RECORD
[    26.064] (II) LoadModule: "dri"
[    26.064] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    26.095] (II) Module dri: vendor="X.Org Foundation"
[    26.096] 	compiled for 1.11.1, module version = 1.0.0
[    26.096] 	ABI class: X.Org Server Extension, version 6.0
[    26.096] (II) Loading extension XFree86-DRI
[    26.096] (II) LoadModule: "dri2"
[    26.096] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    26.107] (II) Module dri2: vendor="X.Org Foundation"
[    26.107] 	compiled for 1.11.1, module version = 1.2.0
[    26.107] 	ABI class: X.Org Server Extension, version 6.0
[    26.107] (II) Loading extension DRI2
[    26.107] (==) Matched nouveau as autoconfigured driver 0
[    26.107] (==) Matched nv as autoconfigured driver 1
[    26.107] (==) Matched vesa as autoconfigured driver 2
[    26.107] (==) Matched fbdev as autoconfigured driver 3
[    26.107] (==) Assigned the driver to the xf86ConfigLayout
[    26.107] (II) LoadModule: "nouveau"
[    26.120] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    26.145] (II) Module nouveau: vendor="X.Org Foundation"
[    26.145] 	compiled for 1.11.0, module version = 0.0.16
[    26.145] 	Module class: X.Org Video Driver
[    26.145] 	ABI class: X.Org Video Driver, version 11.0
[    26.157] (II) LoadModule: "nv"
[    26.168] (WW) Warning, couldn't open module nv
[    26.168] (II) UnloadModule: "nv"
[    26.168] (II) Unloading nv
[    26.168] (EE) Failed to load module "nv" (module does not exist, 0)
[    26.168] (II) LoadModule: "vesa"
[    26.168] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    26.173] (II) Module vesa: vendor="X.Org Foundation"
[    26.173] 	compiled for 1.11.0, module version = 2.3.0
[    26.173] 	Module class: X.Org Video Driver
[    26.173] 	ABI class: X.Org Video Driver, version 11.0
[    26.173] (II) LoadModule: "fbdev"
[    26.173] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    26.177] (II) Module fbdev: vendor="X.Org Foundation"
[    26.177] 	compiled for 1.11.0, module version = 0.4.2
[    26.177] 	ABI class: X.Org Video Driver, version 11.0
[    26.177] (II) NOUVEAU driver Date:   Thu Mar 24 02:13:12 2011 +1000
[    26.177] (II) NOUVEAU driver for NVIDIA chipset families :
[    26.177] 	RIVA TNT        (NV04)
[    26.177] 	RIVA TNT2       (NV05)
[    26.177] 	GeForce 256     (NV10)
[    26.177] 	GeForce 2       (NV11, NV15)
[    26.177] 	GeForce 4MX     (NV17, NV18)
[    26.177] 	GeForce 3       (NV20)
[    26.177] 	GeForce 4Ti     (NV25, NV28)
[    26.177] 	GeForce FX      (NV3x)
[    26.177] 	GeForce 6       (NV4x)
[    26.177] 	GeForce 7       (G7x)
[    26.177] 	GeForce 8       (G8x)
[    26.177] 	GeForce GTX 200 (NVA0)
[    26.177] 	GeForce GTX 400 (NVC0)
[    26.177] (II) VESA: driver for VESA chipsets: vesa
[    26.177] (II) FBDEV: driver for framebuffer: fbdev
[    26.177] (++) using VT number 7

[    26.230] drmOpenDevice: node name is /dev/dri/card0
[    26.230] drmOpenDevice: open result is 8, (OK)
[    26.230] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    26.230] drmOpenDevice: node name is /dev/dri/card0
[    26.230] drmOpenDevice: open result is 8, (OK)
[    26.230] drmOpenByBusid: drmOpenMinor returns 8
[    26.230] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    26.231] (II) [drm] nouveau interface version: 0.0.16
[    26.231] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    26.231] (WW) Falling back to old probe method for vesa
[    26.231] (WW) Falling back to old probe method for fbdev
[    26.231] (II) Loading sub module "fbdevhw"
[    26.231] (II) LoadModule: "fbdevhw"
[    26.231] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    26.244] (II) Module fbdevhw: vendor="X.Org Foundation"
[    26.244] 	compiled for 1.11.1, module version = 0.0.2
[    26.244] 	ABI class: X.Org Video Driver, version 11.0
[    26.244] (II) Loading sub module "dri"
[    26.244] (II) LoadModule: "dri"
[    26.245] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    26.245] (II) Module dri: vendor="X.Org Foundation"
[    26.245] 	compiled for 1.11.1, module version = 1.0.0
[    26.245] 	ABI class: X.Org Server Extension, version 6.0
[    26.245] (II) NOUVEAU(0): Loaded DRI module
[    26.245] drmOpenDevice: node name is /dev/dri/card0
[    26.245] drmOpenDevice: open result is 9, (OK)
[    26.245] drmOpenDevice: node name is /dev/dri/card0
[    26.245] drmOpenDevice: open result is 9, (OK)
[    26.245] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    26.245] drmOpenDevice: node name is /dev/dri/card0
[    26.245] drmOpenDevice: open result is 9, (OK)
[    26.245] drmOpenByBusid: drmOpenMinor returns 9
[    26.245] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    26.245] (II) [drm] DRM interface version 1.4
[    26.245] (II) [drm] DRM open master succeeded.
[    26.245] (--) NOUVEAU(0): Chipset: "NVIDIA NV36"
[    26.245] (II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    26.245] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    26.245] (==) NOUVEAU(0): RGB weight 888
[    26.245] (==) NOUVEAU(0): Default visual is TrueColor
[    26.246] (==) NOUVEAU(0): Using HW cursor
[    26.246] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    26.246] (==) NOUVEAU(0): Page flipping enabled
[    26.304] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[    26.416] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    26.472] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    26.532] (II) NOUVEAU(0): EDID for output VGA-1
[    26.641] (II) NOUVEAU(0): EDID for output DVI-I-1
[    26.641] (II) NOUVEAU(0): Manufacturer: ACI  Model: 26a4  Serial#: 18746
[    26.641] (II) NOUVEAU(0): Year: 2010  Week: 31
[    26.641] (II) NOUVEAU(0): EDID Version: 1.3
[    26.641] (II) NOUVEAU(0): Digital Display Input
[    26.641] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 55  vert.: 34
[    26.641] (II) NOUVEAU(0): Gamma: 2.20
[    26.641] (II) NOUVEAU(0): DPMS capabilities: Off
[    26.641] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    26.641] (II) NOUVEAU(0): First detailed timing is preferred mode
[    26.641] (II) NOUVEAU(0): redX: 0.640 redY: 0.352   greenX: 0.287 greenY: 0.628
[    26.641] (II) NOUVEAU(0): blueX: 0.144 blueY: 0.075   whiteX: 0.312 whiteY: 0.328
[    26.641] (II) NOUVEAU(0): Supported established timings:
[    26.641] (II) NOUVEAU(0): 720x400@70Hz
[    26.641] (II) NOUVEAU(0): 640x480@60Hz
[    26.641] (II) NOUVEAU(0): 640x480@67Hz
[    26.641] (II) NOUVEAU(0): 640x480@72Hz
[    26.641] (II) NOUVEAU(0): 640x480@75Hz
[    26.641] (II) NOUVEAU(0): 800x600@56Hz
[    26.641] (II) NOUVEAU(0): 800x600@60Hz
[    26.641] (II) NOUVEAU(0): 800x600@72Hz
[    26.641] (II) NOUVEAU(0): 800x600@75Hz
[    26.641] (II) NOUVEAU(0): 832x624@75Hz
[    26.641] (II) NOUVEAU(0): 1024x768@60Hz
[    26.641] (II) NOUVEAU(0): 1024x768@70Hz
[    26.641] (II) NOUVEAU(0): 1024x768@75Hz
[    26.641] (II) NOUVEAU(0): 1280x1024@75Hz
[    26.641] (II) NOUVEAU(0): Manufacturer's mask: 0
[    26.641] (II) NOUVEAU(0): Supported standard timings:
[    26.641] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    26.641] (II) NOUVEAU(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    26.641] (II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    26.641] (II) NOUVEAU(0): #4: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    26.641] (II) NOUVEAU(0): #5: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    26.641] (II) NOUVEAU(0): Supported detailed timing:
[    26.642] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  550 x 340 mm
[    26.642] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    26.642] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: 1235 v_border: 0
[    26.642] (II) NOUVEAU(0): Serial No: A8LMTF018746
[    26.642] (II) NOUVEAU(0): Ranges: V min: 50 V max: 75 Hz, H min: 30 H max: 85 kHz, PixClock max 175 MHz
[    26.642] (II) NOUVEAU(0): Monitor name: ASUS VW266H
[    26.642] (II) NOUVEAU(0): EDID (in hex):
[    26.642] (II) NOUVEAU(0): 	00ffffffffffff000469a4263a490000
[    26.642] (II) NOUVEAU(0): 	1f140103803722782acbd0a35a49a024
[    26.642] (II) NOUVEAU(0): 	135054bfef00714f0101814081809500
[    26.642] (II) NOUVEAU(0): 	b30001010101283c80a070b023403020
[    26.642] (II) NOUVEAU(0): 	360026542100001a000000ff0041384c
[    26.642] (II) NOUVEAU(0): 	4d54463031383734360a000000fd0032
[    26.642] (II) NOUVEAU(0): 	4b1e5511000a202020202020000000fc
[    26.642] (II) NOUVEAU(0): 	0041535553205657323636480a2000b2
[    26.642] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    26.642] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    26.642] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    26.696] (II) NOUVEAU(0): EDID for output TV-1
[    26.696] (II) NOUVEAU(0): Output VGA-1 disconnected
[    26.696] (II) NOUVEAU(0): Output DVI-I-1 connected
[    26.696] (II) NOUVEAU(0): Output TV-1 disconnected
[    26.696] (II) NOUVEAU(0): Using exact sizes for initial modes
[    26.696] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1440x900
[    26.696] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[    26.696] (--) NOUVEAU(0): Virtual size is 1440x900 (pitch 0)
[    26.696] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[    26.696] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
[    26.696] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
[    26.696] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
[    26.696] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[    26.696] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[    26.696] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
[    26.696] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz)
[    26.696] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
[    26.697] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    26.697] (**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35.0 kHz, 66.7 Hz
[    26.697] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    26.697] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[    26.697] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    26.697] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz
[    26.697] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    26.697] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
[    26.697] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    26.697] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[    26.697] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    26.697] (==) NOUVEAU(0): DPI set to (96, 96)
[    26.697] (II) Loading sub module "fb"
[    26.697] (II) LoadModule: "fb"
[    26.697] (II) Loading /usr/lib/xorg/modules/libfb.so
[    26.794] (II) Module fb: vendor="X.Org Foundation"
[    26.794] 	compiled for 1.11.1, module version = 1.0.0
[    26.794] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    26.794] (II) Loading sub module "exa"
[    26.794] (II) LoadModule: "exa"
[    26.795] (II) Loading /usr/lib/xorg/modules/libexa.so
[    26.797] (II) Module exa: vendor="X.Org Foundation"
[    26.797] 	compiled for 1.11.1, module version = 2.5.0
[    26.797] 	ABI class: X.Org Video Driver, version 11.0
[    26.797] (II) Loading sub module "shadowfb"
[    26.797] (II) LoadModule: "shadowfb"
[    26.797] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    26.811] (II) Module shadowfb: vendor="X.Org Foundation"
[    26.811] 	compiled for 1.11.1, module version = 1.0.0
[    26.811] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    26.811] (II) UnloadModule: "vesa"
[    26.811] (II) Unloading vesa
[    26.811] (II) UnloadModule: "fbdev"
[    26.811] (II) Unloading fbdev
[    26.811] (II) UnloadModule: "fbdevhw"
[    26.811] (II) Unloading fbdevhw
[    26.811] (--) Depth 24 pixmap format is 32 bpp
[    26.812] (II) NOUVEAU(0): Opened GPU channel 1
[    26.813] (II) NOUVEAU(0): [DRI2] Setup complete
[    26.813] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    26.813] (II) NOUVEAU(0): GART: 256MiB available
[    26.821] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    26.972] (II) EXA(0): Driver allocated offscreen pixmaps
[    26.972] (II) EXA(0): Driver registered support for the following operations:
[    26.972] (II)         Solid
[    26.972] (II)         Copy
[    26.972] (II)         Composite (RENDER acceleration)
[    26.972] (II)         UploadToScreen
[    26.972] (II)         DownloadFromScreen
[    26.972] (==) NOUVEAU(0): Backing store disabled
[    26.972] (==) NOUVEAU(0): Silken mouse enabled
[    26.972] (II) NOUVEAU(0): [XvMC] Associated with NV30 texture adapter.
[    26.972] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    26.972] (==) NOUVEAU(0): DPMS enabled
[    26.972] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[    26.973] (--) RandR disabled
[    26.973] (II) Initializing built-in extension Generic Event Extension
[    26.973] (II) Initializing built-in extension SHAPE
[    26.973] (II) Initializing built-in extension MIT-SHM
[    26.973] (II) Initializing built-in extension XInputExtension
[    26.973] (II) Initializing built-in extension XTEST
[    26.973] (II) Initializing built-in extension BIG-REQUESTS
[    26.973] (II) Initializing built-in extension SYNC
[    26.973] (II) Initializing built-in extension XKEYBOARD
[    26.973] (II) Initializing built-in extension XC-MISC
[    26.973] (II) Initializing built-in extension SECURITY
[    26.973] (II) Initializing built-in extension XINERAMA
[    26.973] (II) Initializing built-in extension XFIXES
[    26.973] (II) Initializing built-in extension RENDER
[    26.973] (II) Initializing built-in extension RANDR
[    26.973] (II) Initializing built-in extension COMPOSITE
[    26.973] (II) Initializing built-in extension DAMAGE
[    26.973] (II) SELinux: Disabled on system
[    28.314] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    28.314] (II) AIGLX: enabled GLX_INTEL_swap_event
[    28.314] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    28.314] (II) AIGLX: enabled GLX_SGI_make_current_read
[    28.314] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    28.315] (II) AIGLX: Loaded and initialized nouveau
[    28.315] (II) GLX: Initialized DRI2 GL provider for screen 0
[    28.321] (II) NOUVEAU(0): NVEnterVT is called.
[    28.397] (II) NOUVEAU(0): Setting screen physical size to 380 x 238
[    28.397] resize called 1440 900
[    29.039] (II) config/udev: Adding input device Power Button (/dev/input/event4)
[    29.039] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    29.039] (II) LoadModule: "evdev"
[    29.040] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.088] (II) Module evdev: vendor="X.Org Foundation"
[    29.088] 	compiled for 1.11.0, module version = 2.6.0
[    29.088] 	Module class: X.Org XInput Driver
[    29.088] 	ABI class: X.Org XInput driver, version 13.0
[    29.088] (II) Using input driver 'evdev' for 'Power Button'
[    29.088] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.088] (**) Power Button: always reports core events
[    29.088] (**) Power Button: Device: "/dev/input/event4"
[    29.088] (--) Power Button: Found keys
[    29.088] (II) Power Button: Configuring as keyboard
[    29.088] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input4/event4"
[    29.088] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    29.088] (**) Option "xkb_rules" "evdev"
[    29.088] (**) Option "xkb_model" "pc105"
[    29.088] (**) Option "xkb_layout" "us"
[    29.089] (II) config/udev: Adding input device Power Button (/dev/input/event3)
[    29.089] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    29.089] (II) Using input driver 'evdev' for 'Power Button'
[    29.089] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.089] (**) Power Button: always reports core events
[    29.089] (**) Power Button: Device: "/dev/input/event3"
[    29.090] (--) Power Button: Found keys
[    29.090] (II) Power Button: Configuring as keyboard
[    29.090] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input3/event3"
[    29.090] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    29.090] (**) Option "xkb_rules" "evdev"
[    29.090] (**) Option "xkb_model" "pc105"
[    29.090] (**) Option "xkb_layout" "us"
[    29.091] (II) config/udev: Adding input device Razer Razer DeathAdder (/dev/input/event0)
[    29.091] (**) Razer Razer DeathAdder: Applying InputClass "evdev pointer catchall"
[    29.091] (II) Using input driver 'evdev' for 'Razer Razer DeathAdder'
[    29.091] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.091] (**) Razer Razer DeathAdder: always reports core events
[    29.091] (**) Razer Razer DeathAdder: Device: "/dev/input/event0"
[    29.091] (--) Razer Razer DeathAdder: Found 12 mouse buttons
[    29.091] (--) Razer Razer DeathAdder: Found scroll wheel(s)
[    29.091] (--) Razer Razer DeathAdder: Found relative axes
[    29.091] (--) Razer Razer DeathAdder: Found x and y relative axes
[    29.091] (II) Razer Razer DeathAdder: Configuring as mouse
[    29.091] (II) Razer Razer DeathAdder: Adding scrollwheel support
[    29.091] (**) Razer Razer DeathAdder: YAxisMapping: buttons 4 and 5
[    29.091] (**) Razer Razer DeathAdder: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    29.091] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb2/2-2/2-2:1.0/input/input0/event0"
[    29.091] (II) XINPUT: Adding extended input device "Razer Razer DeathAdder" (type: MOUSE, id 8)
[    29.091] (II) Razer Razer DeathAdder: initialized for relative axes.
[    29.092] (**) Razer Razer DeathAdder: (accel) keeping acceleration scheme 1
[    29.092] (**) Razer Razer DeathAdder: (accel) acceleration profile 0
[    29.092] (**) Razer Razer DeathAdder: (accel) acceleration factor: 2.000
[    29.092] (**) Razer Razer DeathAdder: (accel) acceleration threshold: 4
[    29.092] (II) config/udev: Adding input device Razer Razer DeathAdder (/dev/input/mouse0)
[    29.093] (II) No input driver/identifier specified (ignoring)
[    29.093] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/event1)
[    29.094] (**) IOGEAR GCS1104 V1.2.113: Applying InputClass "evdev keyboard catchall"
[    29.094] (II) Using input driver 'evdev' for 'IOGEAR GCS1104 V1.2.113'
[    29.094] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.094] (**) IOGEAR GCS1104 V1.2.113: always reports core events
[    29.094] (**) IOGEAR GCS1104 V1.2.113: Device: "/dev/input/event1"
[    29.094] (--) IOGEAR GCS1104 V1.2.113: Found keys
[    29.094] (II) IOGEAR GCS1104 V1.2.113: Configuring as keyboard
[    29.094] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1:1.0/input/input1/event1"
[    29.094] (II) XINPUT: Adding extended input device "IOGEAR GCS1104 V1.2.113" (type: KEYBOARD, id 9)
[    29.094] (**) Option "xkb_rules" "evdev"
[    29.094] (**) Option "xkb_model" "pc105"
[    29.094] (**) Option "xkb_layout" "us"
[    29.095] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/event2)
[    29.095] (**) IOGEAR GCS1104 V1.2.113: Applying InputClass "evdev pointer catchall"
[    29.095] (II) Using input driver 'evdev' for 'IOGEAR GCS1104 V1.2.113'
[    29.095] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    29.095] (**) IOGEAR GCS1104 V1.2.113: always reports core events
[    29.095] (**) IOGEAR GCS1104 V1.2.113: Device: "/dev/input/event2"
[    29.095] (--) IOGEAR GCS1104 V1.2.113: Found 9 mouse buttons
[    29.095] (--) IOGEAR GCS1104 V1.2.113: Found scroll wheel(s)
[    29.095] (--) IOGEAR GCS1104 V1.2.113: Found relative axes
[    29.095] (--) IOGEAR GCS1104 V1.2.113: Found x and y relative axes
[    29.096] (II) IOGEAR GCS1104 V1.2.113: Configuring as mouse
[    29.096] (II) IOGEAR GCS1104 V1.2.113: Adding scrollwheel support
[    29.096] (**) IOGEAR GCS1104 V1.2.113: YAxisMapping: buttons 4 and 5
[    29.096] (**) IOGEAR GCS1104 V1.2.113: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    29.096] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1.4/1-1.4.1/1-1.4.1:1.1/input/input2/event2"
[    29.096] (II) XINPUT: Adding extended input device "IOGEAR GCS1104 V1.2.113" (type: MOUSE, id 10)
[    29.096] (II) IOGEAR GCS1104 V1.2.113: initialized for relative axes.
[    29.096] (**) IOGEAR GCS1104 V1.2.113: (accel) keeping acceleration scheme 1
[    29.096] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration profile 0
[    29.096] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration factor: 2.000
[    29.096] (**) IOGEAR GCS1104 V1.2.113: (accel) acceleration threshold: 4
[    29.097] (II) config/udev: Adding input device IOGEAR GCS1104 V1.2.113 (/dev/input/mouse1)
[    29.097] (II) No input driver/identifier specified (ignoring)
[    29.097] (II) config/udev: Adding input device PC Speaker (/dev/input/event5)
[    29.097] (II) No input driver/identifier specified (ignoring)
[    85.298] (II) NOUVEAU(0): EDID vendor "ACI", prod id 9892
[    85.298] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    85.298] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    85.298] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    85.298] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    85.298] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[    85.299] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[    85.521] (II) NOUVEAU(0): EDID vendor "ACI", prod id 9892
[    85.524] (II) NOUVEAU(0): Using hsync ranges from config file
[    85.524] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    85.524] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    85.524] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[    85.524] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[    95.937] (II) NOUVEAU(0): EDID vendor "ACI", prod id 9892
[    95.937] (II) NOUVEAU(0): Using hsync ranges from config file
[    95.937] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    95.937] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    95.937] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[    95.938] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   112.213] (II) NOUVEAU(0): EDID vendor "ACI", prod id 9892
[   112.213] (II) NOUVEAU(0): Using hsync ranges from config file
[   112.213] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   112.213] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   112.213] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   112.213] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz)
[   112.214] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)


-------        ---------       ---=---       ---------      --------

xorg.conf (not in use in above xorg.0.log)  but has been tested 
Since there seem to be 3 screens found I have inserted the virtual 
line:  `Virtual     2048 1536'  in all 3.  But hasn't worked.


   
Section "ServerLayout"
	Identifier     "X.org Configured"
	Screen      0  "Screen0" 0 0
	Screen      1  "Screen1" RightOf "Screen0"
	Screen      2  "Screen2" RightOf "Screen1"
	InputDevice    "Mouse0" "CorePointer"
	InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
	ModulePath   "/usr/lib/xorg/modules"
	FontPath     "/usr/share/fonts/X11/misc"
	FontPath     "/usr/share/fonts/X11/cyrillic"
	FontPath     "/usr/share/fonts/X11/100dpi/:unscaled"
	FontPath     "/usr/share/fonts/X11/75dpi/:unscaled"
	FontPath     "/usr/share/fonts/X11/Type1"
	FontPath     "/usr/share/fonts/X11/100dpi"
	FontPath     "/usr/share/fonts/X11/75dpi"
	FontPath     "/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType"
	FontPath     "built-ins"
EndSection

Section "Module"
	Load  "glx"
	Load  "record"
	Load  "dri"
	Load  "dri2"
	Load  "dbe"
	Load  "extmod"
EndSection

Section "InputDevice"
	Identifier  "Keyboard0"
	Driver      "kbd"
EndSection

Section "InputDevice"
	Identifier  "Mouse0"
	Driver      "mouse"
	Option	    "Protocol" "auto"
	Option	    "Device" "/dev/input/mice"
	Option	    "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
	Identifier   "Monitor0"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
EndSection

Section "Monitor"
	Identifier   "Monitor1"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
EndSection

Section "Monitor"
	Identifier   "Monitor2"
	VendorName   "Monitor Vendor"
	ModelName    "Monitor Model"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "SWcursor"           	# [<bool>]
        #Option     "HWcursor"           	# [<bool>]
        #Option     "NoAccel"            	# [<bool>]
        #Option     "ShadowFB"           	# [<bool>]
        #Option     "VideoKey"           	# <i>
        #Option     "WrappedFB"          	# [<bool>]
        #Option     "GLXVBlank"          	# [<bool>]
        #Option     "ZaphodHeads"        	# <str>
        #Option     "PageFlip"           	# [<bool>]
	Identifier  "Card0"
	Driver      "nouveau"
	BusID       "PCI:1:0:0"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "ShadowFB"           	# [<bool>]
        #Option     "Rotate"             	# <str>
        #Option     "fbdev"              	# <str>
        #Option     "debug"              	# [<bool>]
	Identifier  "Card1"
	Driver      "fbdev"
	BusID       "PCI:1:0:0"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz",
        ### <percent>: "<f>%"
        ### [arg]: arg optional
        #Option     "ShadowFB"           	# [<bool>]
        #Option     "DefaultRefresh"     	# [<bool>]
        #Option     "ModeSetClearScreen" 	# [<bool>]
	Identifier  "Card2"
	Driver      "vesa"
	BusID       "PCI:1:0:0"
EndSection

Section "Screen"
	Identifier "Screen0"
	Device     "Card0"
	Monitor    "Monitor0"
   DefaultDepth 24
	SubSection "Display"
		Viewport   0 0
		Depth     1
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     4
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     8
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     15
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     16
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     24
      Virtual     2048 1536
	EndSubSection
EndSection

Section "Screen"
	Identifier "Screen1"
	Device     "Card1"
	Monitor    "Monitor1"
	SubSection "Display"
		Viewport   0 0
		Depth     1
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     4
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     8
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     15
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     16
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     24
      Virtual     2048 1536
	EndSubSection
EndSection

Section "Screen"
	Identifier "Screen2"
	Device     "Card2"
	Monitor    "Monitor2"
	SubSection "Display"
		Viewport   0 0
		Depth     1
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     4
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     8
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     15
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     16
	EndSubSection
	SubSection "Display"
		Viewport   0 0
		Depth     24
      Virtual     2048 1536
	EndSubSection
EndSection

## 
##     Subsection "Display"
##         Depth       24
##  
## Modes       "1280x1024" #"1024x768" "800x600" "640x480"
##         Virtual     2048 1536 
##         ViewPort    0 0
##     EndSubsection

# **********************************************************************
# ServerLayout sections.
# **********************************************************************

# Any number of ServerLayout sections may be present.  Each describes
# the way multiple screens are organised.  A specific ServerLayout

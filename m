From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48464] Crash when GLXVBlank set to true
Date: Mon, 09 Apr 2012 12:37:02 +0000
Message-ID: <bug-48464-8800-Y0duMljm46@http.bugs.freedesktop.org/>
References: <bug-48464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48464

--- Comment #2 from Marcel Dopita <mdop-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org> 2012-04-09 05:37:02 PDT ---
Comment on attachment 59674
  --> https://bugs.freedesktop.org/attachment.cgi?id=59674
xorg log

[    30.310] 
This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.
[    30.310] 
X.Org X Server 1.12.0.901 (1.12.1 RC 1)
Release Date: 2012-03-30
[    30.310] X Protocol Version 11, Revision 0
[    30.310] Build Operating System: Linux 3.3.0-1-ARCH x86_64 
[    30.310] Current Operating System: Linux Marcel-PC 3.3.1-1-ARCH #1 SMP
PREEMPT Tue Apr 3 06:46:17 UTC 2012 x86_64
[    30.310] Kernel command line:
root=/dev/disk/by-uuid/d1689699-9cc3-4761-a2d6-c196ede8a473 ro vga=0x0361
log_buf_len=1M 3
[    30.310] Build Date: 31 March 2012  09:42:10AM
[    30.311]  
[    30.311] Current version of pixman: 0.24.4
[    30.311]     Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.
[    30.311] Markers: (--) probed, (**) from config file, (==) default setting,
    (++) from command line, (!!) notice, (II) informational,
    (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    30.311] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Apr  9 13:33:40
2012
[    30.348] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    30.366] (==) ServerLayout "X.org Configured"
[    30.366] (**) |-->Screen "Screen0" (0)
[    30.366] (**) |   |-->Monitor "Monitor0"
[    30.366] (**) |   |-->Device "Card0"
[    30.366] (**) |-->Input Device "Mouse0"
[    30.366] (**) |-->Input Device "Keyboard0"
[    30.366] (==) Automatically adding devices
[    30.366] (==) Automatically enabling devices
[    30.422] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[    30.422]     Entry deleted from font path.
[    30.422] (WW) The directory "/usr/share/fonts/Type1/" does not exist.
[    30.422]     Entry deleted from font path.
[    30.425] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/100dpi/".
[    30.425]     Entry deleted from font path.
[    30.425]     (Run 'mkfontdir' on "/usr/share/fonts/100dpi/").
[    30.425] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/75dpi/".
[    30.425]     Entry deleted from font path.
[    30.425]     (Run 'mkfontdir' on "/usr/share/fonts/75dpi/").
[    30.425] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[    30.426]     Entry deleted from font path.
[    30.426] (WW) The directory "/usr/share/fonts/Type1/" does not exist.
[    30.426]     Entry deleted from font path.
[    30.426] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/100dpi/".
[    30.426]     Entry deleted from font path.
[    30.426]     (Run 'mkfontdir' on "/usr/share/fonts/100dpi/").
[    30.426] (WW) `fonts.dir' not found (or not valid) in
"/usr/share/fonts/75dpi/".
[    30.426]     Entry deleted from font path.
[    30.426]     (Run 'mkfontdir' on "/usr/share/fonts/75dpi/").
[    30.426] (**) FontPath set to:
    /usr/share/fonts/misc/,
    /usr/share/fonts/TTF/,
    /usr/share/fonts/misc/,
    /usr/share/fonts/TTF/
[    30.426] (**) ModulePath set to "/usr/lib/xorg/modules"
[    30.426] (WW) Hotplugging is on, devices using drivers 'kbd', 'mouse' or
'vmmouse' will be disabled.
[    30.426] (WW) Disabling Mouse0
[    30.426] (WW) Disabling Keyboard0
[    30.426] (II) Loader magic: 0x7c5160
[    30.426] (II) Module ABI versions:
[    30.426]     X.Org ANSI C Emulation: 0.4
[    30.426]     X.Org Video Driver: 12.0
[    30.426]     X.Org XInput driver : 16.0
[    30.426]     X.Org Server Extension : 6.0
[    30.427] (--) PCI:*(0:1:0:0) 10de:1200:1458:3515 rev 161, Mem @
0xfc000000/33554432, 0xd8000000/134217728, 0xd4000000/67108864, I/O @
0x0000cc00/128, BIOS @ 0x????????/524288
[    30.427] (WW) Open ACPI failed (/var/run/acpid.socket) (No such file or
directory)
[    30.427] (II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) "glx" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) "record" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) "dri" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) "dri2" will be loaded. This was enabled by default and also
specified in the config file.
[    30.427] (II) LoadModule: "dbe"
[    30.446] (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
[    30.451] (II) Module dbe: vendor="X.Org Foundation"
[    30.451]     compiled for 1.12.0.901, module version = 1.0.0
[    30.451]     Module class: X.Org Server Extension
[    30.451]     ABI class: X.Org Server Extension, version 6.0
[    30.451] (II) Loading extension DOUBLE-BUFFER
[    30.451] (II) LoadModule: "glx"
[    30.451] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    30.458] (II) Module glx: vendor="X.Org Foundation"
[    30.459]     compiled for 1.12.0.901, module version = 1.0.0
[    30.459]     ABI class: X.Org Server Extension, version 6.0
[    30.459] (==) AIGLX enabled
[    30.459] (II) Loading extension GLX
[    30.459] (II) LoadModule: "dri"
[    30.459] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    30.465] (II) Module dri: vendor="X.Org Foundation"
[    30.465]     compiled for 1.12.0.901, module version = 1.0.0
[    30.465]     ABI class: X.Org Server Extension, version 6.0
[    30.465] (II) Loading extension XFree86-DRI
[    30.465] (II) LoadModule: "dri2"
[    30.466] (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
[    30.466] (II) Module dri2: vendor="X.Org Foundation"
[    30.466]     compiled for 1.12.0.901, module version = 1.2.0
[    30.466]     ABI class: X.Org Server Extension, version 6.0
[    30.466] (II) Loading extension DRI2
[    30.466] (II) LoadModule: "record"
[    30.466] (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
[    30.467] (II) Module record: vendor="X.Org Foundation"
[    30.467]     compiled for 1.12.0.901, module version = 1.13.0
[    30.467]     Module class: X.Org Server Extension
[    30.467]     ABI class: X.Org Server Extension, version 6.0
[    30.467] (II) Loading extension RECORD
[    30.467] (II) LoadModule: "extmod"
[    30.467] (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
[    30.468] (II) Module extmod: vendor="X.Org Foundation"
[    30.468]     compiled for 1.12.0.901, module version = 1.0.0
[    30.468]     Module class: X.Org Server Extension
[    30.468]     ABI class: X.Org Server Extension, version 6.0
[    30.468] (II) Loading extension MIT-SCREEN-SAVER
[    30.468] (II) Loading extension XFree86-VidModeExtension
[    30.468] (II) Loading extension XFree86-DGA
[    30.468] (II) Loading extension DPMS
[    30.468] (II) Loading extension XVideo
[    30.468] (II) Loading extension XVideo-MotionCompensation
[    30.468] (II) Loading extension X-Resource
[    30.468] (II) LoadModule: "nouveau"
[    30.468] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    30.485] (II) Module nouveau: vendor="X.Org Foundation"
[    30.485]     compiled for 1.11.99.902, module version = 0.0.16
[    30.485]     Module class: X.Org Video Driver
[    30.485]     ABI class: X.Org Video Driver, version 12.0
[    30.485] (II) NOUVEAU driver 
[    30.485] (II) NOUVEAU driver for NVIDIA chipset families :
[    30.485]     RIVA TNT        (NV04)
[    30.485]     RIVA TNT2       (NV05)
[    30.485]     GeForce 256     (NV10)
[    30.485]     GeForce 2       (NV11, NV15)
[    30.485]     GeForce 4MX     (NV17, NV18)
[    30.485]     GeForce 3       (NV20)
[    30.485]     GeForce 4Ti     (NV25, NV28)
[    30.485]     GeForce FX      (NV3x)
[    30.485]     GeForce 6       (NV4x)
[    30.485]     GeForce 7       (G7x)
[    30.485]     GeForce 8       (G8x)
[    30.485]     GeForce GTX 200 (NVA0)
[    30.485]     GeForce GTX 400 (NVC0)
[    30.485] (--) using VT number 7

[    30.511] drmOpenDevice: node name is /dev/dri/card0
[    30.512] drmOpenDevice: open result is 7, (OK)
[    30.512] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    30.512] drmOpenDevice: node name is /dev/dri/card0
[    30.512] drmOpenDevice: open result is 7, (OK)
[    30.512] drmOpenByBusid: drmOpenMinor returns 7
[    30.512] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    30.512] (II) [drm] nouveau interface version: 0.0.16
[    30.512] (II) Loading sub module "dri"
[    30.512] (II) LoadModule: "dri"
[    30.512] (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
[    30.512] (II) Module dri: vendor="X.Org Foundation"
[    30.512]     compiled for 1.12.0.901, module version = 1.0.0
[    30.512]     ABI class: X.Org Server Extension, version 6.0
[    30.512] (II) NOUVEAU(0): Loaded DRI module
[    30.512] drmOpenDevice: node name is /dev/dri/card0
[    30.512] drmOpenDevice: open result is 8, (OK)
[    30.512] drmOpenDevice: node name is /dev/dri/card0
[    30.512] drmOpenDevice: open result is 8, (OK)
[    30.512] drmOpenByBusid: Searching for BusID pci:0000:01:00.0
[    30.512] drmOpenDevice: node name is /dev/dri/card0
[    30.512] drmOpenDevice: open result is 8, (OK)
[    30.512] drmOpenByBusid: drmOpenMinor returns 8
[    30.512] drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
[    30.512] (II) [drm] DRM interface version 1.4
[    30.512] (II) [drm] DRM open master succeeded.
[    30.512] (--) NOUVEAU(0): Chipset: "NVIDIA NVce"
[    30.512] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    30.512] (==) NOUVEAU(0): RGB weight 888
[    30.512] (==) NOUVEAU(0): Default visual is TrueColor
[    30.512] (**) NOUVEAU(0): Option "GLXVBlank" "True"
[    30.512] (==) NOUVEAU(0): Using HW cursor
[    30.512] (**) NOUVEAU(0): GLX sync to VBlank enabled.
[    30.512] (==) NOUVEAU(0): Page flipping enabled
[    30.533] (II) NOUVEAU(0): Output DVI-I-1 using monitor section Monitor0
[    30.623] (II) NOUVEAU(0): Output DVI-I-2 has no monitor section
[    30.624] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[    30.642] (II) NOUVEAU(0): EDID for output DVI-I-1
[    30.642] (II) NOUVEAU(0): Manufacturer: DEL  Model: a055  Serial#:
809977164
[    30.642] (II) NOUVEAU(0): Year: 2011  Week: 29
[    30.642] (II) NOUVEAU(0): EDID Version: 1.3
[    30.642] (II) NOUVEAU(0): Digital Display Input
[    30.642] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 60  vert.: 34
[    30.642] (II) NOUVEAU(0): Gamma: 2.20
[    30.642] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    30.642] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    30.642] (II) NOUVEAU(0): First detailed timing is preferred mode
[    30.642] (II) NOUVEAU(0): redX: 0.678 redY: 0.309   greenX: 0.202 greenY:
0.689
[    30.642] (II) NOUVEAU(0): blueX: 0.148 blueY: 0.051   whiteX: 0.313 whiteY:
0.329
[    30.642] (II) NOUVEAU(0): Supported established timings:
[    30.642] (II) NOUVEAU(0): 720x400@70Hz
[    30.642] (II) NOUVEAU(0): 640x480@60Hz
[    30.642] (II) NOUVEAU(0): 640x480@75Hz
[    30.642] (II) NOUVEAU(0): 800x600@60Hz
[    30.642] (II) NOUVEAU(0): 800x600@75Hz
[    30.642] (II) NOUVEAU(0): 1024x768@60Hz
[    30.642] (II) NOUVEAU(0): 1024x768@75Hz
[    30.642] (II) NOUVEAU(0): 1280x1024@75Hz
[    30.642] (II) NOUVEAU(0): Manufacturer's mask: 0
[    30.642] (II) NOUVEAU(0): Supported standard timings:
[    30.642] (II) NOUVEAU(0): #0: hsize: 1280  vsize 800  refresh: 60  vid: 129
[    30.642] (II) NOUVEAU(0): #1: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[    30.642] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1200  refresh: 60  vid:
209
[    30.642] (II) NOUVEAU(0): #3: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    30.642] (II) NOUVEAU(0): #4: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[    30.642] (II) NOUVEAU(0): #5: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    30.642] (II) NOUVEAU(0): Supported detailed timing:
[    30.642] (II) NOUVEAU(0): clock: 241.5 MHz   Image Size:  597 x 336 mm
[    30.642] (II) NOUVEAU(0): h_active: 2560  h_sync: 2608  h_sync_end 2640
h_blank_end 2720 h_border: 0
[    30.642] (II) NOUVEAU(0): v_active: 1440  v_sync: 1443  v_sync_end 1448
v_blanking: 1481 v_border: 0
[    30.642] (II) NOUVEAU(0): Serial No: G606T17G0GEL
[    30.642] (II) NOUVEAU(0): Monitor name: DELL U2711
[    30.642] (II) NOUVEAU(0): Ranges: V min: 49 V max: 86 Hz, H min: 29 H max:
113 kHz, PixClock max 285 MHz
[    30.642] (II) NOUVEAU(0): EDID (in hex):
[    30.642] (II) NOUVEAU(0):     00ffffffffffff0010ac55a04c454730
[    30.642] (II) NOUVEAU(0):     1d150103803c2278ea8e05ad4f33b026
[    30.642] (II) NOUVEAU(0):     0d5054a54b008100b300d100714fa940
[    30.642] (II) NOUVEAU(0):     818001010101565e00a0a0a029503020
[    30.642] (II) NOUVEAU(0):     350055502100001a000000ff00473630
[    30.642] (II) NOUVEAU(0):     36543137473047454c0a000000fc0044
[    30.642] (II) NOUVEAU(0):     454c4c2055323731310a2020000000fd
[    30.642] (II) NOUVEAU(0):     0031561d711c000a20202020202000e3
[    30.642] (II) NOUVEAU(0): EDID vendor "DEL", prod id 41045
[    30.642] (II) NOUVEAU(0): Using hsync ranges from config file
[    30.642] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    30.642] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    30.642] (II) NOUVEAU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    30.642] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    30.642] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    30.642] (II) NOUVEAU(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    30.642] (II) NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480
1680  800 803 809 831 +hsync -vsync (49.7 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    30.642] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    30.643] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    30.643] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    30.643] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    30.733] (II) NOUVEAU(0): EDID for output DVI-I-2
[    30.733] (II) NOUVEAU(0): EDID for output HDMI-1
[    30.733] (II) NOUVEAU(0): Output DVI-I-1 connected
[    30.733] (II) NOUVEAU(0): Output DVI-I-2 disconnected
[    30.733] (II) NOUVEAU(0): Output HDMI-1 disconnected
[    30.734] (II) NOUVEAU(0): Using exact sizes for initial modes
[    30.734] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 2560x1440
[    30.734] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    30.734] (--) NOUVEAU(0): Virtual size is 2560x1440 (pitch 0)
[    30.734] (**) NOUVEAU(0):  Driver mode "2560x1440": 241.5 MHz (scaled from
0.0 MHz), 88.8 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "2560x1440"x60.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    30.734] (**) NOUVEAU(0):  Driver mode "1920x1200": 193.2 MHz (scaled from
0.0 MHz), 74.6 kHz, 59.9 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256
2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from
0.0 MHz), 75.0 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from
0.0 MHz), 65.3 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960
2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from
0.0 MHz), 49.7 kHz, 59.8 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480
1680  800 803 809 831 +hsync -vsync (49.7 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    30.734] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    30.734] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    30.734] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    30.734] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    30.734] (**) NOUVEAU(0): Display dimensions: (600, 340) mm
[    30.734] (**) NOUVEAU(0): DPI set to (108, 107)
[    30.734] (II) Loading sub module "fb"
[    30.734] (II) LoadModule: "fb"
[    30.734] (II) Loading /usr/lib/xorg/modules/libfb.so
[    30.743] (II) Module fb: vendor="X.Org Foundation"
[    30.743]     compiled for 1.12.0.901, module version = 1.0.0
[    30.743]     ABI class: X.Org ANSI C Emulation, version 0.4
[    30.743] (II) Loading sub module "exa"
[    30.743] (II) LoadModule: "exa"
[    30.743] (II) Loading /usr/lib/xorg/modules/libexa.so
[    30.751] (II) Module exa: vendor="X.Org Foundation"
[    30.751]     compiled for 1.12.0.901, module version = 2.5.0
[    30.751]     ABI class: X.Org Video Driver, version 12.0
[    30.751] (II) Loading sub module "shadowfb"
[    30.751] (II) LoadModule: "shadowfb"
[    30.751] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    30.757] (II) Module shadowfb: vendor="X.Org Foundation"
[    30.757]     compiled for 1.12.0.901, module version = 1.0.0
[    30.757]     ABI class: X.Org ANSI C Emulation, version 0.4
[    30.757] (--) Depth 24 pixmap format is 32 bpp
[    30.762] (II) NOUVEAU(0): Opened GPU channel 1
[    30.762] (II) NOUVEAU(0): [DRI2] Setup complete
[    30.762] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    30.762] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    30.762] (II) NOUVEAU(0): GART: 511MiB available
[    30.769] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    30.771] (II) EXA(0): Driver allocated offscreen pixmaps
[    30.771] (II) EXA(0): Driver registered support for the following
operations:
[    30.771] (II)         Solid
[    30.771] (II)         Copy
[    30.771] (II)         Composite (RENDER acceleration)
[    30.771] (II)         UploadToScreen
[    30.771] (II)         DownloadFromScreen
[    30.771] (==) NOUVEAU(0): Backing store disabled
[    30.771] (==) NOUVEAU(0): Silken mouse enabled
[    30.771] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[    30.771] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    30.771] (==) NOUVEAU(0): DPMS enabled
[    30.771] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    30.771] (--) RandR disabled
[    30.771] (II) Initializing built-in extension Generic Event Extension
[    30.771] (II) Initializing built-in extension SHAPE
[    30.771] (II) Initializing built-in extension MIT-SHM
[    30.771] (II) Initializing built-in extension XInputExtension
[    30.771] (II) Initializing built-in extension XTEST
[    30.771] (II) Initializing built-in extension BIG-REQUESTS
[    30.772] (II) Initializing built-in extension SYNC
[    30.772] (II) Initializing built-in extension XKEYBOARD
[    30.772] (II) Initializing built-in extension XC-MISC
[    30.772] (II) Initializing built-in extension SECURITY
[    30.772] (II) Initializing built-in extension XINERAMA
[    30.772] (II) Initializing built-in extension XFIXES
[    30.772] (II) Initializing built-in extension RENDER
[    30.772] (II) Initializing built-in extension RANDR
[    30.772] (II) Initializing built-in extension COMPOSITE
[    30.772] (II) Initializing built-in extension DAMAGE
[    31.014] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    31.014] (II) AIGLX: enabled GLX_INTEL_swap_event
[    31.014] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    31.014] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    31.015] (II) AIGLX: Loaded and initialized nouveau
[    31.015] (II) GLX: Initialized DRI2 GL provider for screen 0
[    31.021] (II) NOUVEAU(0): NVEnterVT is called.
[    31.047] (II) NOUVEAU(0): Setting screen physical size to 677 x 381
[    31.047] resize called 2560 1440
[    31.229] (II) config/udev: Adding input device Power Button
(/dev/input/event4)
[    31.229] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    31.229] (II) LoadModule: "evdev"
[    31.240] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    31.250] (II) Module evdev: vendor="X.Org Foundation"
[    31.250]     compiled for 1.12.0, module version = 2.7.0
[    31.250]     Module class: X.Org XInput Driver
[    31.250]     ABI class: X.Org XInput driver, version 16.0
[    31.250] (II) Using input driver 'evdev' for 'Power Button'
[    31.250] (**) Power Button: always reports core events
[    31.250] (**) evdev: Power Button: Device: "/dev/input/event4"
[    31.250] (--) evdev: Power Button: Vendor 0 Product 0x1
[    31.250] (--) evdev: Power Button: Found keys
[    31.250] (II) evdev: Power Button: Configuring as keyboard
[    31.250] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input4/event4"
[    31.250] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD, id 6)
[    31.250] (**) Option "xkb_rules" "evdev"
[    31.250] (**) Option "xkb_model" "evdev"
[    31.250] (**) Option "xkb_layout" "cz"
[    31.270] (II) config/udev: Adding input device Power Button
(/dev/input/event3)
[    31.270] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    31.270] (II) Using input driver 'evdev' for 'Power Button'
[    31.270] (**) Power Button: always reports core events
[    31.270] (**) evdev: Power Button: Device: "/dev/input/event3"
[    31.270] (--) evdev: Power Button: Vendor 0 Product 0x1
[    31.270] (--) evdev: Power Button: Found keys
[    31.270] (II) evdev: Power Button: Configuring as keyboard
[    31.270] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input3/event3"
[    31.270] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD, id 7)
[    31.270] (**) Option "xkb_rules" "evdev"
[    31.270] (**) Option "xkb_model" "evdev"
[    31.270] (**) Option "xkb_layout" "cz"
[    31.271] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9
(/dev/input/event15)
[    31.271] (II) No input driver specified, ignoring this device.
[    31.271] (II) This device may have been added with another device file.
[    31.271] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8
(/dev/input/event16)
[    31.271] (II) No input driver specified, ignoring this device.
[    31.271] (II) This device may have been added with another device file.
[    31.271] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7
(/dev/input/event17)
[    31.271] (II) No input driver specified, ignoring this device.
[    31.271] (II) This device may have been added with another device file.
[    31.272] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3
(/dev/input/event18)
[    31.272] (II) No input driver specified, ignoring this device.
[    31.272] (II) This device may have been added with another device file.
[    31.272] (II) config/udev: Adding input device HDA Digital PCBeep
(/dev/input/event6)
[    31.272] (II) No input driver specified, ignoring this device.
[    31.272] (II) This device may have been added with another device file.
[    31.272] (II) config/udev: Adding input device HDA Intel Front Headphone
(/dev/input/event10)
[    31.272] (II) No input driver specified, ignoring this device.
[    31.272] (II) This device may have been added with another device file.
[    31.272] (II) config/udev: Adding input device HDA Intel Line Out Side
(/dev/input/event11)
[    31.272] (II) No input driver specified, ignoring this device.
[    31.272] (II) This device may have been added with another device file.
[    31.273] (II) config/udev: Adding input device HDA Intel Line Out CLFE
(/dev/input/event12)
[    31.273] (II) No input driver specified, ignoring this device.
[    31.273] (II) This device may have been added with another device file.
[    31.273] (II) config/udev: Adding input device HDA Intel Line Out Surround
(/dev/input/event13)
[    31.273] (II) No input driver specified, ignoring this device.
[    31.273] (II) This device may have been added with another device file.
[    31.273] (II) config/udev: Adding input device HDA Intel Line Out Front
(/dev/input/event14)
[    31.273] (II) No input driver specified, ignoring this device.
[    31.273] (II) This device may have been added with another device file.
[    31.273] (II) config/udev: Adding input device HDA Intel Line
(/dev/input/event7)
[    31.273] (II) No input driver specified, ignoring this device.
[    31.273] (II) This device may have been added with another device file.
[    31.274] (II) config/udev: Adding input device HDA Intel Front Mic
(/dev/input/event8)
[    31.274] (II) No input driver specified, ignoring this device.
[    31.274] (II) This device may have been added with another device file.
[    31.274] (II) config/udev: Adding input device HDA Intel Rear Mic
(/dev/input/event9)
[    31.274] (II) No input driver specified, ignoring this device.
[    31.274] (II) This device may have been added with another device file.
[    31.274] (II) config/udev: Adding input device A4Tech RF USB Receiver
(/dev/input/event1)
[    31.274] (**) A4Tech RF USB Receiver: Applying InputClass "evdev keyboard
catchall"
[    31.274] (II) Using input driver 'evdev' for 'A4Tech RF USB Receiver'
[    31.274] (**) A4Tech RF USB Receiver: always reports core events
[    31.274] (**) evdev: A4Tech RF USB Receiver: Device: "/dev/input/event1"
[    31.274] (--) evdev: A4Tech RF USB Receiver: Vendor 0x9da Product 0x24f
[    31.274] (--) evdev: A4Tech RF USB Receiver: Found keys
[    31.274] (II) evdev: A4Tech RF USB Receiver: Configuring as keyboard
[    31.274] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:1d.7/usb2/2-3/2-3.2/2-3.2:1.0/input/input1/event1"
[    31.274] (II) XINPUT: Adding extended input device "A4Tech RF USB Receiver"
(type: KEYBOARD, id 8)
[    31.274] (**) Option "xkb_rules" "evdev"
[    31.274] (**) Option "xkb_model" "evdev"
[    31.274] (**) Option "xkb_layout" "cz"
[    31.275] (II) config/udev: Adding input device A4Tech RF USB Receiver
(/dev/input/event2)
[    31.275] (**) A4Tech RF USB Receiver: Applying InputClass "evdev pointer
catchall"
[    31.275] (**) A4Tech RF USB Receiver: Applying InputClass "evdev keyboard
catchall"
[    31.275] (II) Using input driver 'evdev' for 'A4Tech RF USB Receiver'
[    31.275] (**) A4Tech RF USB Receiver: always reports core events
[    31.275] (**) evdev: A4Tech RF USB Receiver: Device: "/dev/input/event2"
[    31.275] (--) evdev: A4Tech RF USB Receiver: Vendor 0x9da Product 0x24f
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found 12 mouse buttons
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found scroll wheel(s)
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found relative axes
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found x and y relative axes
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found absolute axes
[    31.275] (II) evdev: A4Tech RF USB Receiver: Forcing absolute x/y axes to
exist.
[    31.275] (--) evdev: A4Tech RF USB Receiver: Found keys
[    31.275] (II) evdev: A4Tech RF USB Receiver: Configuring as mouse
[    31.275] (II) evdev: A4Tech RF USB Receiver: Configuring as keyboard
[    31.275] (II) evdev: A4Tech RF USB Receiver: Adding scrollwheel support
[    31.275] (**) evdev: A4Tech RF USB Receiver: YAxisMapping: buttons 4 and 5
[    31.275] (**) evdev: A4Tech RF USB Receiver: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    31.275] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:1d.7/usb2/2-3/2-3.2/2-3.2:1.1/input/input2/event2"
[    31.275] (II) XINPUT: Adding extended input device "A4Tech RF USB Receiver"
(type: KEYBOARD, id 9)
[    31.275] (**) Option "xkb_rules" "evdev"
[    31.275] (**) Option "xkb_model" "evdev"
[    31.275] (**) Option "xkb_layout" "cz"
[    31.275] (II) evdev: A4Tech RF USB Receiver: initialized for relative axes.
[    31.275] (WW) evdev: A4Tech RF USB Receiver: ignoring absolute axes.
[    31.275] (**) A4Tech RF USB Receiver: (accel) keeping acceleration scheme 1
[    31.275] (**) A4Tech RF USB Receiver: (accel) acceleration profile 0
[    31.275] (**) A4Tech RF USB Receiver: (accel) acceleration factor: 2.000
[    31.275] (**) A4Tech RF USB Receiver: (accel) acceleration threshold: 4
[    31.276] (II) config/udev: Adding input device A4Tech RF USB Receiver
(/dev/input/mouse0)
[    31.276] (II) No input driver specified, ignoring this device.
[    31.276] (II) This device may have been added with another device file.
[    31.276] (II) config/udev: Adding input device AT Translated Set 2 keyboard
(/dev/input/event0)
[    31.276] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev
keyboard catchall"
[    31.276] (II) Using input driver 'evdev' for 'AT Translated Set 2 keyboard'
[    31.276] (**) AT Translated Set 2 keyboard: always reports core events
[    31.276] (**) evdev: AT Translated Set 2 keyboard: Device:
"/dev/input/event0"
[    31.276] (--) evdev: AT Translated Set 2 keyboard: Vendor 0x1 Product 0x1
[    31.276] (--) evdev: AT Translated Set 2 keyboard: Found keys
[    31.276] (II) evdev: AT Translated Set 2 keyboard: Configuring as keyboard
[    31.276] (**) Option "config_info"
"udev:/sys/devices/platform/i8042/serio0/input/input0/event0"
[    31.276] (II) XINPUT: Adding extended input device "AT Translated Set 2
keyboard" (type: KEYBOARD, id 10)
[    31.276] (**) Option "xkb_rules" "evdev"
[    31.276] (**) Option "xkb_model" "evdev"
[    31.276] (**) Option "xkb_layout" "cz"
[    31.276] (II) config/udev: Adding input device PC Speaker
(/dev/input/event5)
[    31.276] (II) No input driver specified, ignoring this device.
[    31.276] (II) This device may have been added with another device file.
[    31.720] (II) NOUVEAU(0): EDID vendor "DEL", prod id 41045
[    31.720] (II) NOUVEAU(0): Using hsync ranges from config file
[    31.720] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    31.720] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    31.720] (II) NOUVEAU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    31.720] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    31.720] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    31.831] (II) NOUVEAU(0): EDID vendor "DEL", prod id 41045
[    31.831] (II) NOUVEAU(0): Using hsync ranges from config file
[    31.831] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    31.831] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    31.831] (II) NOUVEAU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    31.831] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    31.831] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    39.332] (II) NOUVEAU(0): EDID vendor "DEL", prod id 41045
[    39.332] (II) NOUVEAU(0): Using hsync ranges from config file
[    39.332] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    39.332] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    39.332] (II) NOUVEAU(0): Modeline "2560x1440"x0.0  241.50  2560 2608 2640
2720  1440 1443 1448 1481 +hsync -vsync (88.8 kHz eP)
[    39.332] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1280x800"x0.0   71.00  1280 1328 1360
1440  800 803 809 823 +hsync -vsync (49.3 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    39.332] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    39.954] 
[    39.954] Backtrace:
[    39.954] 0: /usr/bin/X (xorg_backtrace+0x36) [0x55d2c6]
[    39.955] 1: /usr/bin/X (0x400000+0x160cf9) [0x560cf9]
[    39.955] 2: /lib/libpthread.so.0 (0x7f5410934000+0xf140) [0x7f5410943140]
[    39.955] 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f540d9f6000+0x19f9e) [0x7f540da0ff9e]
[    39.955] 4: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f540d9f6000+0xa785) [0x7f540da00785]
[    39.955] 5: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f540d9f6000+0xaf05) [0x7f540da00f05]
[    39.955] 6: /usr/lib/libdrm.so.2 (drmHandleEvent+0xa3) [0x7f540e257bc3]
[    39.955] 7: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f540d9f6000+0x27823) [0x7f540da1d823]
[    39.955] 8: /usr/bin/X (WakeupHandler+0x6b) [0x437e3b]
[    39.955] 9: /usr/bin/X (WaitForSomething+0x1ac) [0x55a7dc]
[    39.955] 10: /usr/bin/X (0x400000+0x33c91) [0x433c91]
[    39.955] 11: /usr/bin/X (0x400000+0x23165) [0x423165]
[    39.955] 12: /lib/libc.so.6 (__libc_start_main+0xf5) [0x7f540f7e9455]
[    39.955] 13: /usr/bin/X (0x400000+0x2343d) [0x42343d]
[    39.955] 
[    39.955] Segmentation fault at address 0x8
[    39.955] 
Fatal server error:
[    39.955] Caught signal 11 (Segmentation fault). Server aborting
[    39.955] 
[    39.955] 
Please consult the The X.Org Foundation support 
     at http://wiki.x.org
 for help. 
[    39.955] Please also check the log file at "/var/log/Xorg.0.log" for
additional information.
[    39.955] 
[    39.986] (II) evdev: Power Button: Close
[    39.986] (II) UnloadModule: "evdev"
[    39.986] (II) evdev: Power Button: Close
[    39.987] (II) UnloadModule: "evdev"
[    39.987] (II) evdev: A4Tech RF USB Receiver: Close
[    39.987] (II) UnloadModule: "evdev"
[    39.987] (II) evdev: A4Tech RF USB Receiver: Close
[    39.987] (II) UnloadModule: "evdev"
[    39.987] (II) evdev: AT Translated Set 2 keyboard: Close
[    39.987] (II) UnloadModule: "evdev"
[    39.987] (II) AIGLX: Suspending AIGLX clients for VT switch
[    39.987] (II) NOUVEAU(0): NVLeaveVT is called.
[    40.041] Server terminated with error (1). Closing log file.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

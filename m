From: abcd <abcdeluxe-S0/GAf8tV78@public.gmane.org>
Subject: Re: Help with nouveau driver
Date: Fri, 8 Jul 2016 20:39:51 +0200
Message-ID: <d03601fd-7fa3-e081-1688-cabde5b812d5@web.de>
References: <3b5775d4-bc1e-2acc-fd6d-5cef3cccee7f@web.de>
 <0e606d08-611f-cf69-f815-f50d762d3493@web.de>
 <CAKb7Uvj7ie0ajRSKw4AvmstNjdNupchFc68iLn8rRg4PyMa=JA@mail.gmail.com>
 <cda9dcf9-87a2-d929-6791-e38124f980bd@web.de>
 <CAKb7Uvh02EPgOuqju_agwvJVd+dCko-=zHiMyoWwO+DXP+jLXA@mail.gmail.com>
 <d1ac86f3-7a54-a0dd-5871-600683714316@web.de>
 <CAKb7UvheQkeYAFWT0ieU-JJx+GF+ok-s51mZkK-hmTe+hOcM4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0198498761=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvheQkeYAFWT0ieU-JJx+GF+ok-s51mZkK-hmTe+hOcM4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0198498761==
Content-Type: multipart/alternative;
 boundary="------------992086A31E20AFD41BF99297"

This is a multi-part message in MIME format.
--------------992086A31E20AFD41BF99297
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the help so far, I have already solved the main problem,

but sadly it seems I can't find out the last step. I hope you can help
me there...

Here ist the important part: It is trying to load some nvidia module,
although i have already done apt-get purge nvidia*

[     4.636] (II) LoadModule: "glx"
[     4.638] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[     4.639] (EE) Failed to load
/usr/lib/xorg/modules/extensions/libglx.so: libnvidia-tls.so.352.79:
cannot open shared object file: No such file or directory
[     4.639] (II) UnloadModule: "glx"
[     4.639] (II) Unloading glx
[     4.639] (EE) Failed to load module "glx" (loader failed, 7)


Full log:

[     4.394]
X.Org X Server 1.16.4
Release Date: 2014-12-20
[     4.394] X Protocol Version 11, Revision 0
[     4.394] Build Operating System: Linux 3.16.0-4-amd64 x86_64 Debian
[     4.394] Current Operating System: Linux NOMAC 4.6.0-0.bpo.1-amd64
#1 SMP Debian 4.6.1-1~bpo8+1 (2016-06-14) x86_64
[     4.394] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-4.6.0-0.bpo.1-amd64
root=3DUUID=3D2c330f07-0904-46a0-a554-16ec45d06fdf ro quiet
[     4.394] Build Date: 11 February 2015  12:32:02AM
[     4.394] xorg-server 2:1.16.4-1 (http://www.debian.org/support)
[     4.394] Current version of pixman: 0.32.6
[     4.394]    Before reporting problems, check http://wiki.x.org
   to make sure that you have the latest version.
[     4.394] Markers: (--) probed, (**) from config file, (=3D=3D) defaul=
t
setting,
   (++) from command line, (!!) notice, (II) informational,
   (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[     4.394] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri Jul  8
10:40:35 2016
[     4.397] (=3D=3D) Using system config directory "/usr/share/X11/xorg.=
conf.d"
[     4.399] (=3D=3D) No Layout section.  Using the first Screen section.
[     4.399] (=3D=3D) No screen section available. Using defaults.
[     4.399] (**) |-->Screen "Default Screen Section" (0)
[     4.399] (**) |   |-->Monitor "<default monitor>"
[     4.399] (=3D=3D) No monitor specified for screen "Default Screen Sec=
tion".
   Using a default monitor configuration.
[     4.399] (=3D=3D) Automatically adding devices
[     4.399] (=3D=3D) Automatically enabling devices
[     4.399] (=3D=3D) Automatically adding GPU devices
[     4.401] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not
exist.
[     4.401]    Entry deleted from font path.
[     4.403] (=3D=3D) FontPath set to:
   /usr/share/fonts/X11/misc,
   /usr/share/fonts/X11/100dpi/:unscaled,
   /usr/share/fonts/X11/75dpi/:unscaled,
   /usr/share/fonts/X11/Type1,
   /usr/share/fonts/X11/100dpi,
   /usr/share/fonts/X11/75dpi,
   built-ins
[     4.403] (**) ModulePath set to "/usr/lib/xorg/modules/"
[     4.403] (II) The server relies on udev to provide the list of input
devices.
   If no devices become available, reconfigure udev or disable
AutoAddDevices.
[     4.403] (II) Loader magic: 0x55db3d382d80
[     4.403] (II) Module ABI versions:
[     4.403]    X.Org ANSI C Emulation: 0.4
[     4.403]    X.Org Video Driver: 18.0
[     4.403]    X.Org XInput driver : 21.0
[     4.403]    X.Org Server Extension : 8.0
[     4.403] (II) xfree86: Adding drm device (/dev/dri/card0)
[     4.404] (--) PCI:*(0:1:0:0) 10de:1183:1043:841e rev 161, Mem @
0xee000000/16777216, 0xe0000000/134217728, 0xe8000000/33554432, I/O @
0x0000e000/128, BIOS @ 0x????????/131072
[     4.404] (II) LoadModule: "glx"
[     4.406] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[     4.408] (EE) Failed to load
/usr/lib/xorg/modules/extensions/libglx.so: libnvidia-tls.so.352.79:
cannot open shared object file: No such file or directory
[     4.408] (II) UnloadModule: "glx"
[     4.408] (II) Unloading glx
[     4.408] (EE) Failed to load module "glx" (loader failed, 7)
[     4.408] (=3D=3D) Matched nouveau as autoconfigured driver 0
[     4.408] (=3D=3D) Matched nv as autoconfigured driver 1
[     4.408] (=3D=3D) Matched nouveau as autoconfigured driver 2
[     4.408] (=3D=3D) Matched nv as autoconfigured driver 3
[     4.408] (=3D=3D) Matched modesetting as autoconfigured driver 4
[     4.408] (=3D=3D) Matched fbdev as autoconfigured driver 5
[     4.408] (=3D=3D) Matched vesa as autoconfigured driver 6
[     4.408] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[     4.408] (II) LoadModule: "nouveau"
[     4.408] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[     4.410] (II) Module nouveau: vendor=3D"X.Org Foundation"
[     4.410]    compiled for 1.16.0, module version =3D 1.0.11
[     4.410]    Module class: X.Org Video Driver
[     4.410]    ABI class: X.Org Video Driver, version 18.0
[     4.410] (II) LoadModule: "nv"
[     4.410] (WW) Warning, couldn't open module nv
[     4.410] (II) UnloadModule: "nv"
[     4.410] (II) Unloading nv
[     4.410] (EE) Failed to load module "nv" (module does not exist, 0)
[     4.410] (II) LoadModule: "modesetting"
[     4.410] (WW) Warning, couldn't open module modesetting
[     4.410] (II) UnloadModule: "modesetting"
[     4.410] (II) Unloading modesetting
[     4.410] (EE) Failed to load module "modesetting" (module does not
exist, 0)
[     4.410] (II) LoadModule: "fbdev"
[     4.410] (WW) Warning, couldn't open module fbdev
[     4.410] (II) UnloadModule: "fbdev"
[     4.410] (II) Unloading fbdev
[     4.410] (EE) Failed to load module "fbdev" (module does not exist, 0=
)
[     4.410] (II) LoadModule: "vesa"
[     4.410] (WW) Warning, couldn't open module vesa
[     4.410] (II) UnloadModule: "vesa"
[     4.410] (II) Unloading vesa
[     4.410] (EE) Failed to load module "vesa" (module does not exist, 0)
[     4.410] (II) NOUVEAU driver Date:   Thu Aug 28 03:57:48 2014 +0200
[     4.410] (II) NOUVEAU driver for NVIDIA chipset families :
[     4.410]    RIVA TNT        (NV04)
[     4.410]    RIVA TNT2       (NV05)
[     4.410]    GeForce 256     (NV10)
[     4.410]    GeForce 2       (NV11, NV15)
[     4.410]    GeForce 4MX     (NV17, NV18)
[     4.410]    GeForce 3       (NV20)
[     4.410]    GeForce 4Ti     (NV25, NV28)
[     4.410]    GeForce FX      (NV3x)
[     4.410]    GeForce 6       (NV4x)
[     4.410]    GeForce 7       (G7x)
[     4.410]    GeForce 8       (G8x)
[     4.410]    GeForce GTX 200 (NVA0)
[     4.410]    GeForce GTX 400 (NVC0)
[     4.410] (++) using VT number 7

[     4.412] (II) [drm] nouveau interface version: 1.3.1
[     4.412] (II) Loading sub module "dri2"
[     4.412] (II) LoadModule: "dri2"
[     4.412] (II) Module "dri2" already built-in
[     4.412] (--) NOUVEAU(0): Chipset: "NVIDIA NVE4"
[     4.412] (II) NOUVEAU(0): Creating default Display subsection in
Screen section
   "Default Screen Section" for depth/fbbpp 24/32
[     4.412] (=3D=3D) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[     4.412] (=3D=3D) NOUVEAU(0): RGB weight 888
[     4.412] (=3D=3D) NOUVEAU(0): Default visual is TrueColor
[     4.412] (=3D=3D) NOUVEAU(0): Using HW cursor
[     4.412] (=3D=3D) NOUVEAU(0): GLX sync to VBlank enabled.
[     4.412] (=3D=3D) NOUVEAU(0): Page flipping enabled
[     4.412] (=3D=3D) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[     4.412] (=3D=3D) NOUVEAU(0): Page flipping synced to vblank by kerne=
l.
[     4.412] (II) NOUVEAU(0): Initializing outputs ...
[     4.478] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[     4.479] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[     4.545] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[     4.608] (II) NOUVEAU(0): Output DP-1 has no monitor section
[     4.608] (II) NOUVEAU(0): 4 crtcs needed for screen.
[     4.622] (II) NOUVEAU(0): Allocated crtc nr. 0 to this screen.
[     4.622] (II) NOUVEAU(0): Allocated crtc nr. 1 to this screen.
[     4.622] (II) NOUVEAU(0): Allocated crtc nr. 2 to this screen.
[     4.622] (II) NOUVEAU(0): Allocated crtc nr. 3 to this screen.
[     4.689] (II) NOUVEAU(0): EDID for output DVI-I-1
[     4.689] (II) NOUVEAU(0): Manufacturer: ####  Model: 2369  Serial#: 3=
73
[     4.689] (II) NOUVEAU(0): Year: 2013  Week: 24
[     4.689] (II) NOUVEAU(0): EDID Version: 1.3
[     4.689] (II) NOUVEAU(0): Digital Display Input
[     4.689] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
[     4.689] (II) NOUVEAU(0): Gamma: 2.20
[     4.689] (II) NOUVEAU(0): DPMS capabilities: Off
[     4.689] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb
4:4:4
[     4.689] (II) NOUVEAU(0): First detailed timing is preferred mode
[     4.689] (II) NOUVEAU(0): redX: 0.651 redY: 0.338   greenX: 0.321
greenY: 0.614
[     4.689] (II) NOUVEAU(0): blueX: 0.154 blueY: 0.063   whiteX: 0.313
whiteY: 0.329
[     4.689] (II) NOUVEAU(0): Supported established timings:
[     4.689] (II) NOUVEAU(0): 720x400@70Hz
[     4.689] (II) NOUVEAU(0): 640x480@60Hz

[     4.689] (II) NOUVEAU(0): 1024x768@70Hz
[     4.689] (II) NOUVEAU(0): 1024x768@75Hz
[     4.689] (II) NOUVEAU(0): 1280x1024@75Hz
[     4.689] (II) NOUVEAU(0): Manufacturer's mask: 0
[     4.689] (II) NOUVEAU(0): Supported standard timings:
[     4.689] (II) NOUVEAU(0): #0: hsize: 1920  vsize 1080  refresh: 60=20
vid: 49361
[     4.689] (II) NOUVEAU(0): #5: hsize: 1280  vsize 720  refresh: 60=20
vid: 49281
[     4.689] (II) NOUVEAU(0): Supported detailed timing:
[     4.689] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  509 x 286 m=
m
[     4.689] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end
2052 h_blank_end 2200 h_border: 0
[     4.689] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end
1089 v_blanking: 1125 v_border: 0
[     4.689] (II) NOUVEAU(0): Ranges: V min: 50 V max: 76 Hz, H min: 30
H max: 83 kHz, PixClock max 175 MHz
[     4.689] (II) NOUVEAU(0): Monitor name: 2369M
[     4.689] (II) NOUVEAU(0): Serial No: BCOD69A000373
[     4.689] (II) NOUVEAU(0): Supported detailed timing:
[     4.689] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.689] (II) NOUVEAU(0): h_active: 720  h_sync: 736  h_sync_end 798
h_blank_end 858 h_border: 0
[     4.689] (II) NOUVEAU(0): v_active: 480  v_sync: 489  v_sync_end 495
v_blanking: 525 v_border: 0
[     4.689] (II) NOUVEAU(0): Supported detailed timing:
[     4.689] (II) NOUVEAU(0): clock: 74.2 MHz   Image Size:  509 x 286 mm
[     4.689] (II) NOUVEAU(0): h_active: 1280  h_sync: 1390  h_sync_end
1430 h_blank_end 1650 h_border: 0
[     4.689] (II) NOUVEAU(0): v_active: 720  v_sync: 725  v_sync_end 730
v_blanking: 750 v_border: 0
[     4.689] (II) NOUVEAU(0): Supported detailed timing:
[     4.689] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.689] (II) NOUVEAU(0): h_active: 720  h_sync: 736  h_sync_end 798
h_blank_end 858 h_border: 0
[     4.689] (II) NOUVEAU(0): v_active: 480  v_sync: 489  v_sync_end 495
v_blanking: 525 v_border: 0
[     4.689] (II) NOUVEAU(0): Supported detailed timing:
[     4.689] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.689] (II) NOUVEAU(0): h_active: 720  h_sync: 732  h_sync_end 796
h_blank_end 864 h_border: 0
[     4.689] (II) NOUVEAU(0): v_active: 576  v_sync: 581  v_sync_end 586
v_blanking: 625 v_border: 0
[     4.689] (II) NOUVEAU(0): Number of EDID sections to follow: 1
[     4.689] (II) NOUVEAU(0): EDID (in hex):
[     4.689] (II) NOUVEAU(0):    00ffffffffffff0005e3692375010000
[     4.689] (II) NOUVEAU(0):    1817010380331d782ae595a656529d27
[     4.689] (II) NOUVEAU(0):    105054bfef00d1c0b300950081808140
[     4.689] (II) NOUVEAU(0):    81c001010101023a801871382d40582c
[     4.689] (II) NOUVEAU(0):    4500fd1e1100001e000000fd00324c1e
[     4.689] (II) NOUVEAU(0):    5311000a202020202020000000fc0032
[     4.689] (II) NOUVEAU(0):    3336394d0a20202020202020000000ff
[     4.689] (II) NOUVEAU(0):    00000000000000000000000000000059
[     4.689] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[     4.689] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[     4.689] (II) NOUVEAU(0): Modeline "1920x1080"x50.0  148.50  1920
2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  148.35  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)

[     4.689] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280
1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280
1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "1440x900"x59.9   88.75  1440
1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280
1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "1280x720"x60.0   74.25  1280
1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     4.689] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738
846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[     4.690] (II) NOUVEAU(0): EDID for output DVI-D-1
[     4.756] (II) NOUVEAU(0): EDID for output HDMI-1
[     4.756] (II) NOUVEAU(0): Manufacturer: ####  Model: 2369  Serial#: 1=
428
[     4.756] (II) NOUVEAU(0): Year: 2013  Week: 19
[     4.756] (II) NOUVEAU(0): EDID Version: 1.3
[     4.756] (II) NOUVEAU(0): Digital Display Input
[     4.756] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 51  vert.: 29
[     4.756] (II) NOUVEAU(0): Gamma: 2.20
[     4.756] (II) NOUVEAU(0): DPMS capabilities: Off
[     4.756] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb
4:4:4
[     4.756] (II) NOUVEAU(0): First detailed timing is preferred mode
[     4.756] (II) NOUVEAU(0): redX: 0.651 redY: 0.338   greenX: 0.321
greenY: 0.614
[     4.756] (II) NOUVEAU(0): blueX: 0.154 blueY: 0.063   whiteX: 0.313
whiteY: 0.329
[     4.756] (II) NOUVEAU(0): Supported established timings:
[     4.756] (II) NOUVEAU(0): 720x400@70Hz
[     4.756] (II) NOUVEAU(0): 640x480@60Hz
[     4.756] (II) NOUVEAU(0): 640x480@67Hz
[     4.756] (II) NOUVEAU(0): 640x480@72Hz
[     4.756] (II) NOUVEAU(0): 640x480@75Hz
[     4.756] (II) NOUVEAU(0): 800x600@56Hz
[     4.756] (II) NOUVEAU(0): 800x600@60Hz
[     4.756] (II) NOUVEAU(0): 800x600@72Hz
[     4.756] (II) NOUVEAU(0): 800x600@75Hz
[     4.756] (II) NOUVEAU(0): 832x624@75Hz
[     4.756] (II) NOUVEAU(0): 1024x768@60Hz
[     4.756] (II) NOUVEAU(0): 1024x768@70Hz
[     4.756] (II) NOUVEAU(0): 1024x768@75Hz
[     4.756] (II) NOUVEAU(0): 1280x1024@75Hz
[     4.756] (II) NOUVEAU(0): Manufacturer's mask: 0
[     4.756] (II) NOUVEAU(0): Supported standard timings:
[     4.756] (II) NOUVEAU(0): #0: hsize: 1920  vsize 1080  refresh: 60=20
vid: 49361
[     4.756] (II) NOUVEAU(0): #1: hsize: 1680  vsize 1050  refresh: 60=20
vid: 179
[     4.756] (II) NOUVEAU(0): #2: hsize: 1440  vsize 900  refresh: 60=20
vid: 149
[     4.756] (II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 60=20
vid: 32897
[     4.756] (II) NOUVEAU(0): #4: hsize: 1280  vsize 960  refresh: 60=20
vid: 16513
[     4.756] (II) NOUVEAU(0): #5: hsize: 1280  vsize 720  refresh: 60=20
vid: 49281
[     4.756] (II) NOUVEAU(0): Supported detailed timing:
[     4.756] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  509 x 286 m=
m
[     4.756] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end
2052 h_blank_end 2200 h_border: 0
[     4.756] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end
1089 v_blanking: 1125 v_border: 0
[     4.756] (II) NOUVEAU(0): Ranges: V min: 50 V max: 76 Hz, H min: 30
H max: 83 kHz, PixClock max 175 MHz
[     4.756] (II) NOUVEAU(0): Monitor name: 2369M
[     4.757] (II) NOUVEAU(0): Serial No: BCOD59A001428
[     4.757] (II) NOUVEAU(0): Supported detailed timing:
[     4.757] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.757] (II) NOUVEAU(0): h_active: 720  h_sync: 736  h_sync_end 798
h_blank_end 858 h_border: 0
[     4.757] (II) NOUVEAU(0): v_active: 480  v_sync: 489  v_sync_end 495
v_blanking: 525 v_border: 0
[     4.757] (II) NOUVEAU(0): Supported detailed timing:
[     4.757] (II) NOUVEAU(0): clock: 74.2 MHz   Image Size:  509 x 286 mm
[     4.757] (II) NOUVEAU(0): h_active: 1280  h_sync: 1390  h_sync_end
1430 h_blank_end 1650 h_border: 0
[     4.757] (II) NOUVEAU(0): v_active: 720  v_sync: 725  v_sync_end 730
v_blanking: 750 v_border: 0
[     4.757] (II) NOUVEAU(0): Supported detailed timing:
[     4.757] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.757] (II) NOUVEAU(0): h_active: 720  h_sync: 736  h_sync_end 798
h_blank_end 858 h_border: 0
[     4.757] (II) NOUVEAU(0): v_active: 480  v_sync: 489  v_sync_end 495
v_blanking: 525 v_border: 0
[     4.757] (II) NOUVEAU(0): Supported detailed timing:
[     4.757] (II) NOUVEAU(0): clock: 27.0 MHz   Image Size:  509 x 286 mm
[     4.757] (II) NOUVEAU(0): h_active: 720  h_sync: 732  h_sync_end 796
h_blank_end 864 h_border: 0
[     4.757] (II) NOUVEAU(0): v_active: 576  v_sync: 581  v_sync_end 586
v_blanking: 625 v_border: 0
[     4.757] (II) NOUVEAU(0): Number of EDID sections to follow: 1
[     4.757] (II) NOUVEAU(0): EDID (in hex):
[     4.757] (II) NOUVEAU(0):    00ffffffffffff0005e3692394050000
[     4.757] (II) NOUVEAU(0):    1317010380331d782ae595a656529d27
[     4.757] (II) NOUVEAU(0):    105054bfef00d1c0b300950081808140
[     4.757] (II) NOUVEAU(0):    81c001010101023a801871382d40582c
[     4.757] (II) NOUVEAU(0):    4500fd1e1100001e000000fd00324c1e
[     4.757] (II) NOUVEAU(0):    5311000a202020202020000000fc0032
[     4.757] (II) NOUVEAU(0):    3336394d0a20202020202020000000ff
[     4.757] (II) NOUVEAU(0):    0042434f4435394130303134323801ca
[     4.757] (II) NOUVEAU(0):    02031ff14c101f051404130312021101
[     4.757] (II) NOUVEAU(0):    22230907078301000065030c0010008c
[     4.757] (II) NOUVEAU(0):    0ad08a20e02d10103e9600fd1e110000
[     4.757] (II) NOUVEAU(0):    18011d007251d01e206e285500fd1e11
[     4.757] (II) NOUVEAU(0):    00001e8c0ad08a20e02d10103e9600fd
[     4.757] (II) NOUVEAU(0):    1e110000188c0ad090204031200c4055
[     4.757] (II) NOUVEAU(0):    00fd1e11000018000000000000000000
[     4.757] (II) NOUVEAU(0):    00000000000000000000000000000059
[     4.757] (II) NOUVEAU(0): Printing probed modes for output HDMI-1
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080"x50.0  148.50  1920
2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  148.35  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080i"x60.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080i"x50.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080"x30.0   74.25  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.8 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080i"x59.9   74.18  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.7 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1920x1080"x30.0   74.18  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.7 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680
1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280
1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280
1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1440x900"x59.9   88.75  1440
1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280
1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x720"x60.0   74.25  1280
1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x720"x50.0   74.25  1280
1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1280x720"x59.9   74.18  1280
1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024
1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024
1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024
1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864
928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856
976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816
896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824
896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "720x576"x50.0   27.00  720 732
796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "720x480"x60.0   27.03  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "720x480"x59.9   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656
720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664
704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704
768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     4.757] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738
846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[     4.820] (II) NOUVEAU(0): EDID for output DP-1
[     4.820] (II) NOUVEAU(0): Output DVI-I-1 connected
[     4.820] (II) NOUVEAU(0): Output DVI-D-1 disconnected
[     4.820] (II) NOUVEAU(0): Output HDMI-1 connected
[     4.820] (II) NOUVEAU(0): Output DP-1 disconnected
[     4.820] (II) NOUVEAU(0): Using exact sizes for initial modes
[     4.820] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1920x1080
[     4.820] (II) NOUVEAU(0): Output HDMI-1 using initial mode 1920x1080
[     4.820] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0)
unless otherwise stated.
[     4.820] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.5 MHz
(scaled from 0.0 MHz), 67.5 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.5 MHz
(scaled from 0.0 MHz), 56.2 kHz, 50.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080"x50.0  148.50  1920
2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.4 MHz
(scaled from 0.0 MHz), 67.4 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080"x59.9  148.35  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080i": 74.2 MHz
(scaled from 0.0 MHz), 33.8 kHz, 60.0 Hz (I)
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080i"x60.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080i": 74.2 MHz
(scaled from 0.0 MHz), 28.1 kHz, 50.0 Hz (I)
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080i"x50.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080": 74.2 MHz (scaled
from 0.0 MHz), 33.8 kHz, 30.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080"x30.0   74.25  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.8 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080i": 74.2 MHz
(scaled from 0.0 MHz), 33.7 kHz, 59.9 Hz (I)
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080i"x59.9   74.18  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.7 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1920x1080": 74.2 MHz (scaled
from 0.0 MHz), 33.7 kHz, 30.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1920x1080"x30.0   74.18  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.7 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1680x1050": 119.0 MHz
(scaled from 0.0 MHz), 64.7 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680
1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz
(scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280
1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz
(scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280
1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1440x900": 88.8 MHz (scaled
from 0.0 MHz), 55.5 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1440x900"x59.9   88.75  1440
1488 1520 1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled
from 0.0 MHz), 60.0 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280
1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x720": 74.2 MHz (scaled
from 0.0 MHz), 45.0 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x720"x60.0   74.25  1280
1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x720": 74.2 MHz (scaled
from 0.0 MHz), 37.5 kHz, 50.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x720"x50.0   74.25  1280
1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1280x720": 74.2 MHz (scaled
from 0.0 MHz), 45.0 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1280x720"x59.9   74.18  1280
1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled
from 0.0 MHz), 60.0 kHz, 75.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024
1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled
from 0.0 MHz), 56.5 kHz, 70.1 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024
1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled
from 0.0 MHz), 48.4 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024
1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled
from 0.0 MHz), 49.7 kHz, 74.6 Hz
[     4.820] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864
928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled
from 0.0 MHz), 48.1 kHz, 72.2 Hz
[     4.820] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856
976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled
from 0.0 MHz), 46.9 kHz, 75.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816
896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled
from 0.0 MHz), 37.9 kHz, 60.3 Hz
[     4.820] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled
from 0.0 MHz), 35.2 kHz, 56.2 Hz
[     4.820] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824
896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "720x576": 27.0 MHz (scaled
from 0.0 MHz), 31.2 kHz, 50.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "720x576"x50.0   27.00  720 732
796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "720x480": 27.0 MHz (scaled
from 0.0 MHz), 31.5 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "720x480"x60.0   27.03  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "720x480": 27.0 MHz (scaled
from 0.0 MHz), 31.5 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "720x480"x59.9   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled
from 0.0 MHz), 37.5 kHz, 75.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656
720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled
from 0.0 MHz), 37.9 kHz, 72.8 Hz
[     4.820] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664
704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled
from 0.0 MHz), 35.0 kHz, 66.7 Hz
[     4.820] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704
768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled
from 0.0 MHz), 31.5 kHz, 60.0 Hz
[     4.820] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled
from 0.0 MHz), 31.5 kHz, 59.9 Hz
[     4.820] (II) NOUVEAU(0): Modeline "640x480"x59.9   25.18  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[     4.820] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled
from 0.0 MHz), 31.5 kHz, 70.1 Hz
[     4.820] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738
846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[     4.820] (=3D=3D) NOUVEAU(0): DPI set to (96, 96)
[     4.820] (II) Loading sub module "fb"
[     4.820] (II) LoadModule: "fb"
[     4.820] (II) Loading /usr/lib/xorg/modules/libfb.so
[     4.821] (II) Module fb: vendor=3D"X.Org Foundation"
[     4.821]    compiled for 1.16.4, module version =3D 1.0.0
[     4.821]    ABI class: X.Org ANSI C Emulation, version 0.4
[     4.821] (II) Loading sub module "shadowfb"
[     4.821] (II) LoadModule: "shadowfb"
[     4.821] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[     4.821] (II) Module shadowfb: vendor=3D"X.Org Foundation"
[     4.821]    compiled for 1.16.4, module version =3D 1.0.0
[     4.821]    ABI class: X.Org ANSI C Emulation, version 0.4
[     4.821] (--) Depth 24 pixmap format is 32 bpp
[     4.847] (II) NOUVEAU(0): Channel setup complete.
[     4.871] (II) NOUVEAU(0): [COPY] async initialised.
[     4.872] (II) NOUVEAU(0): [DRI2] Setup complete
[     4.872] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[     4.872] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[     4.873] (II) Loading sub module "exa"
[     4.873] (II) LoadModule: "exa"
[     4.873] (II) Loading /usr/lib/xorg/modules/libexa.so
[     4.873] (II) Module exa: vendor=3D"X.Org Foundation"
[     4.873]    compiled for 1.16.4, module version =3D 2.6.0
[     4.873]    ABI class: X.Org Video Driver, version 18.0
[     4.874] (II) EXA(0): Driver allocated offscreen pixmaps
[     4.874] (II) EXA(0): Driver registered support for the following
operations:
[     4.874] (II)         Solid
[     4.874] (II)         Copy
[     4.874] (II)         Composite (RENDER acceleration)
[     4.874] (II)         UploadToScreen
[     4.874] (II)         DownloadFromScreen
[     4.874] (=3D=3D) NOUVEAU(0): Backing store enabled
[     4.874] (=3D=3D) NOUVEAU(0): Silken mouse enabled
[     4.874] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[     4.874] (II) NOUVEAU(0): [XvMC] Extension initialized.
[     4.874] (=3D=3D) NOUVEAU(0): DPMS enabled
[     4.874] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following
RandR disabled message.
[     4.874] (--) RandR disabled
[     4.877] (II) SELinux: Disabled on system
[     4.880] (II) NOUVEAU(0): NVEnterVT is called.
[     4.930] (II) NOUVEAU(0): Setting screen physical size to 508 x 285
[     4.930] resize called 1920 1080
[     4.954] (II) config/udev: Adding input device Power Button
(/dev/input/event4)
[     4.954] (**) Power Button: Applying InputClass "evdev keyboard
catchall"
[     4.954] (II) LoadModule: "evdev"
[     4.954] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[     4.955] (II) Module evdev: vendor=3D"X.Org Foundation"
[     4.955]    compiled for 1.16.0, module version =3D 2.9.0
[     4.955]    Module class: X.Org XInput Driver
[     4.955]    ABI class: X.Org XInput driver, version 21.0
[     4.955] (II) Using input driver 'evdev' for 'Power Button'
[     4.955] (**) Power Button: always reports core events
[     4.955] (**) evdev: Power Button: Device: "/dev/input/event4"
[     4.955] (--) evdev: Power Button: Vendor 0 Product 0x1
[     4.955] (--) evdev: Power Button: Found keys
[     4.955] (II) evdev: Power Button: Configuring as keyboard
[     4.955] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7/event4"
[     4.955] (II) XINPUT: Adding extended input device "Power Button"
(type: KEYBOARD, id 6)
[     4.955] (**) Option "xkb_rules" "evdev"
[     4.955] (**) Option "xkb_model" "pc105"
[     4.955] (**) Option "xkb_layout" "de"
[     4.964] (II) config/udev: Adding input device Power Button
(/dev/input/event3)
[     4.964] (**) Power Button: Applying InputClass "evdev keyboard
catchall"
[     4.964] (II) Using input driver 'evdev' for 'Power Button'
[     4.964] (**) Power Button: always reports core events
[     4.964] (**) evdev: Power Button: Device: "/dev/input/event3"
[     4.964] (--) evdev: Power Button: Vendor 0 Product 0x1
[     4.964] (--) evdev: Power Button: Found keys
[     4.964] (II) evdev: Power Button: Configuring as keyboard
[     4.964] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input6/event3=
"
[     4.964] (II) XINPUT: Adding extended input device "Power Button"
(type: KEYBOARD, id 7)
[     4.964] (**) Option "xkb_rules" "evdev"
[     4.964] (**) Option "xkb_model" "pc105"
[     4.964] (**) Option "xkb_layout" "de"
[     4.964] (II) config/udev: Adding input device #### (/dev/input/event=
0)
[     4.964] (**) ####: Applying InputClass "evdev pointer catchall"
[     4.964] (II) Using input driver 'evdev' for '####'
[     4.964] (**) ####: always reports core events
[     4.964] (**) evdev: ####: Device: "/dev/input/event0"
[     5.020] (--) evdev: ####: Vendor 0x22d4 Product 0x130c
[     5.020] (--) evdev: ####: Found 12 mouse buttons
[     5.020] (--) evdev: ####: Found scroll wheel(s)
[     5.020] (--) evdev: ####: Found relative axes
[     5.020] (--) evdev: ####: Found x and y relative axes
[     5.020] (II) evdev: ####: Configuring as mouse
[     5.020] (II) evdev: ####: Adding scrollwheel support
[     5.020] (**) evdev: ####: YAxisMapping: buttons 4 and 5
[     5.020] (**) evdev: ####: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[     5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/0003:22D4:130=
C.0001/input/input3/event0"
[     5.020] (II) XINPUT: Adding extended input device "####" (type:
MOUSE, id 8)
[     5.020] (II) evdev: ####: initialized for relative axes.
[     5.020] (**) ####: (accel) keeping acceleration scheme 1
[     5.020] (**) ####: (accel) acceleration profile 0
[     5.020] (**) ####: (accel) acceleration factor: 2.000
[     5.020] (**) ####: (accel) acceleration threshold: 4
[     5.020] (II) config/udev: Adding input device #### (/dev/input/mouse=
0)
[     5.020] (II) No input driver specified, ignoring this device.
[     5.020] (II) This device may have been added with another device fil=
e.
[     5.020] (II) config/udev: Adding input device #### (/dev/input/event=
1)
[     5.020] (**) ####: Applying InputClass "evdev keyboard catchall"
[     5.020] (II) Using input driver 'evdev' for '####'
[     5.020] (**) ####: always reports core events
[     5.020] (**) evdev: ####: Device: "/dev/input/event1"
[     5.020] (--) evdev: ####: Vendor 0x22d4 Product 0x130c
[     5.020] (--) evdev: ####: Found keys
[     5.020] (II) evdev: ####: Configuring as keyboard
[     5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.1/0003:22D4:130=
C.0002/input/input4/event1"
[     5.020] (II) XINPUT: Adding extended input device "####" (type:
KEYBOARD, id 9)
[     5.020] (**) Option "xkb_rules" "evdev"
[     5.020] (**) Option "xkb_model" "pc105"
[     5.020] (**) Option "xkb_layout" "de"
[     5.020] (II) config/udev: Adding input device #### (/dev/input/event=
2)
[     5.020] (**) ####: Applying InputClass "evdev keyboard catchall"
[     5.020] (II) Using input driver 'evdev' for '####'
[     5.020] (**) ####: always reports core events
[     5.020] (**) evdev: ####: Device: "/dev/input/event2"
[     5.020] (--) evdev: ####: Vendor 0x46a Product 0x1
[     5.020] (--) evdev: ####: Found keys
[     5.020] (II) evdev: ####: Configuring as keyboard
[     5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-6/3-6:1.0/0003:046A:000=
1.0003/input/input5/event2"
[     5.020] (II) XINPUT: Adding extended input device "####" (type:
KEYBOARD, id 10)
[     5.020] (**) Option "xkb_rules" "evdev"
[     5.020] (**) Option "xkb_model" "pc105"
[     5.020] (**) Option "xkb_layout" "de"
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Front
Mic (/dev/input/event7)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Rear
Mic (/dev/input/event8)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Line
(/dev/input/event9)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Line
Out Front (/dev/input/event10)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Line
Out Surround (/dev/input/event11)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Line
Out CLFE (/dev/input/event12)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Line
Out Side (/dev/input/event13)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Intel PCH Front
Headphone (/dev/input/event14)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device HDA Digital PCBeep
(/dev/input/event6)
[     5.021] (II) No input driver specified, ignoring this device.
[     5.021] (II) This device may have been added with another device fil=
e.
[     5.021] (II) config/udev: Adding input device Eee PC WMI hotkeys
(/dev/input/event5)
[     5.021] (**) Eee PC WMI hotkeys: Applying InputClass "evdev
keyboard catchall"
[     5.022] (II) Using input driver 'evdev' for 'Eee PC WMI hotkeys'
[     5.022] (**) Eee PC WMI hotkeys: always reports core events
[     5.022] (**) evdev: Eee PC WMI hotkeys: Device: "/dev/input/event5"
[     5.022] (--) evdev: Eee PC WMI hotkeys: Vendor 0 Product 0
[     5.022] (--) evdev: Eee PC WMI hotkeys: Found keys
[     5.022] (II) evdev: Eee PC WMI hotkeys: Configuring as keyboard
[     5.022] (**) Option "config_info"
"udev:/sys/devices/platform/eeepc-wmi/input/input8/event5"
[     5.022] (II) XINPUT: Adding extended input device "Eee PC WMI
hotkeys" (type: KEYBOARD, id 11)
[     5.022] (**) Option "xkb_rules" "evdev"
[     5.022] (**) Option "xkb_model" "pc105"
[     5.022] (**) Option "xkb_layout" "de"
[     5.799] (II) config/udev: Adding input device HDA NVidia
HDMI/DP,pcm=3D3 (/dev/input/event15)
[     5.799] (II) No input driver specified, ignoring this device.
[     5.799] (II) This device may have been added with another device fil=
e.
[     5.799] (II) config/udev: Adding input device HDA NVidia
HDMI/DP,pcm=3D7 (/dev/input/event16)
[     5.799] (II) No input driver specified, ignoring this device.
[     5.799] (II) This device may have been added with another device fil=
e.
[     5.799] (II) config/udev: Adding input device HDA NVidia
HDMI/DP,pcm=3D8 (/dev/input/event17)
[     5.799] (II) No input driver specified, ignoring this device.
[     5.799] (II) This device may have been added with another device fil=
e.
[     5.799] (II) config/udev: Adding input device HDA NVidia
HDMI/DP,pcm=3D9 (/dev/input/event18)
[     5.799] (II) No input driver specified, ignoring this device.
[     5.799] (II) This device may have been added with another device fil=
e.
[    14.017] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    14.017] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    14.017] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    14.017] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    14.017] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    14.017] (II) NOUVEAU(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1390
1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "720x576"x0.0   27.00  720 732
796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840
968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824
896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656
720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664
704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704
768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656
752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738
846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    14.017] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    14.114] resize called 3840 1080
[    22.316] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    22.316] (II) NOUVEAU(0): Using hsync ranges from config file
[    22.316] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    22.316] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    22.316] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    22.316] (II) NOUVEAU(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.316] (II) NOUVEAU(0): Modeline "1440x576i"x0.0   27.00  1440
1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    22.316] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    22.316] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    22.316] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    22.316] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.533] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    22.533] (II) NOUVEAU(0): Using hsync ranges from config file
[    22.533] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    22.533] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    22.533] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    22.533] (II) NOUVEAU(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.533] (II) NOUVEAU(0): Modeline "1440x576i"x0.0   27.00  1440
1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    22.533] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    22.533] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    22.533] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    22.533] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.729] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    22.729] (II) NOUVEAU(0): Using hsync ranges from config file
[    22.729] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    22.729] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    22.729] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    22.729] (II) NOUVEAU(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "1440x480i"x0.0   27.00  1440
1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "1440x576i"x0.0   27.00  1440
1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    22.729] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.934] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    22.934] (II) NOUVEAU(0): Using hsync ranges from config file
[    22.934] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    22.934] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    22.934] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    22.934] (II) NOUVEAU(0): Modeline "720x480"x0.0   27.00  720 736
798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "1440x480i"x0.0   27.00  1440
1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "1440x576i"x0.0   27.00  1440
1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    22.934] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    23.128] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[    23.128] (II) NOUVEAU(0): Using hsync ranges from config file
[    23.128] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    23.128] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    23.128] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP) e)
[    23.129] (II) NOUVEAU(0): Modeline "1920x1080i"x0.0   74.25  1920
2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    23.129] (II) NOUVEAU(0): Modeline "1280x720"x0.0   74.25  1280 1720
1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    23.129] (II) NOUVEAU(0): Modeline "2880x480"x0.0  108.00  2880 2944
3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[   188.724] (II) NOUVEAU(0): EDID vendor "####", prod id 9065
[   188.724] (II) NOUVEAU(0): Using hsync ranges from config file
[   188.724] (II) NOUVEAU(0): Using vrefresh ranges from config file
[   188.724] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   188.724] (II) NOUVEAU(0): Modeline "1920x1080"x0.0  148.50  1920
2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)


Am 07.07.2016 um 20:35 schrieb abcdeluxe-S0/GAf8tV78@public.gmane.org:
> Ok, nevermind the problem was ofcourse some idiot, who specified a
> wrong path for said fb module. (obviously me)
> Startx works now, my gnome crashes with =E2=80=9COh no! Something has g=
one
> wrong.=E2=80=9D, but I guess this has nothing to do with nouveau so you=
 can
> take this case as solved!
> Installing the new kernel solved all issues, but I really don=E2=80=99t=
 know,
> why Debian ships such an old kernel=E2=80=A6
>
> *Von:* Ilia Mirkin <mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
> *Gesendet:* =E2=80=8EDonnerstag=E2=80=8E, =E2=80=8E7=E2=80=8E. =E2=80=8E=
Juli=E2=80=8E =E2=80=8E2016 =E2=80=8E20=E2=80=8E:=E2=80=8E21
> *An:* abcd <mailto:abcdeluxe-S0/GAf8tV78@public.gmane.org>
> *Cc:* nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org <mailto:nouveau-PD4FTy7X32lNgt0PjOBp93rCq3LdnpKM@public.gmane.org=
rg>
>
> Please provide the full log, along with dmesg.
>
> On Thu, Jul 7, 2016 at 2:14 PM, abcd <abcdeluxe-S0/GAf8tV78@public.gmane.org> wrote:
> > Well I cannot use X -config or startx, they fail.
> >
> > In the Xorg.0.log the only errors are not being able to load modestti=
ng,
> > nv and the fb submodule.
> >
> > The Log file says: Loading sub module fb. Couldn't load sub module fb=
.
> > Unloading module nouveau.
> >
> > This sounds like it fails nouveaum, I am not sure though.
> >
> > Am 07.07.2016 um 20:11 schrieb Ilia Mirkin:
> >> Is that an error that prevents anything from working? It's probably
> expected...
> >>
> >> On Thu, Jul 7, 2016 at 2:07 PM, abcd <abcdeluxe-S0/GAf8tV78@public.gmane.org> wrote:
> >>> Thanks for the quick help!
> >>>
> >>> Indeed a kernel update resolved the issue, there one problem left
> >>> though: I get an error:
> >>>
> >>> Xorg.0.log: Couldn't load sub module "fb".
> >>>
> >>> I can't find out what package this module is part of. Maybe you kno=
w?
> >>>
> >>> I already purged and reinstalled xserver-xorg and
> xserver-xorg-core with
> >>> no effect.
> >>>
> >>> Cheers
> >>>
> >>>
> >>> Am 06.07.2016 um 23:06 schrieb Ilia Mirkin:
> >>>> For some reason it seems to fail somewhere in either
> >>>> nouveau_display_create or nouveau_display_init. Kernel 3.16 is nea=
rly
> >>>> 2 years old though, and countless changes and fixes have gone
> into the
> >>>> nouveau kernel driver since then. Does this still happen with a
> recent
> >>>> kernel?
> >>>>
> >>>> You can try a livecd from https://nouveau.pmoreau.org/ which has a=
ll
> >>>> the very latest nouveau-related software.
> >>>>
> >>>> On Wed, Jul 6, 2016 at 2:50 PM, abcd <abcdeluxe-S0/GAf8tV78@public.gmane.org> wrote:
> >>>>> Hello again,
> >>>>>
> >>>>> I would be very glad if you could help me:
> >>>>>
> >>>>> I have a blank screen on my Debian jessie system and on the curre=
nt
> >>>>> Debian live cd.
> >>>>>
> >>>>> When i use the nomodeset param I can get a console but startx fai=
ls.
> >>>>> (obviously since then nouveau wont work)
> >>>>>
> >>>>> The card is a 660Ti with UEFI VBIOS.
> >>>>>
> >>>>>
> >>>>> Error in Xorg: "[drm] KMS not enabled [drm] Couldn't open
> device.... and
> >>>>> so on"
> >>>>>
> >>>>> I quote the kernel log: "[    0.818189] nouveau: probe of
> 0000:01:00.0
> >>>>> failed with error -12"
> >>>>>
> >>>>>
> >>>>> Here is the kernel log:
> >>>>>...
> >>>>>
> >>>>> Every help appreciated!
> >>>>>
> >>>>> Cheers
> >>>>>
> >>>>>
> >>>>> Am 05.07.2016 um 22:17 schrieb abcd:
> >>>>>> Hi, I am having problems with the nouveau driver from Debian.
> >>>>>> Can I get help here?
> >>>>>> Cheers
> >>>>>> _______________________________________________
> >>>>>> Nouveau mailing list
> >>>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>>>> _______________________________________________
> >>>>> Nouveau mailing list
> >>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>> _______________________________________________
> >>> Nouveau mailing list
> >>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> >>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >


--------------992086A31E20AFD41BF99297
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Thanks for the help so far, I have already solved the main
      problem,</p>
    <p>but sadly it seems I can't find out the last step. I hope you can
      help me there...<br>
    </p>
    <p>Here ist the important part: It is trying to load some nvidia
      module, although i have already done apt-get purge nvidia*<br>
    </p>
    <p>[=C2=A0=C2=A0=C2=A0=C2=A0 4.636] (II) LoadModule: "glx"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.638] (II) Loading
      /usr/lib/xorg/modules/extensions/libglx.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.639] (EE) Failed to load
      /usr/lib/xorg/modules/extensions/libglx.so:
      libnvidia-tls.so.352.79: cannot open shared object file: No such
      file or directory<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.639] (II) UnloadModule: "glx"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.639] (II) Unloading glx<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.639] (EE) Failed to load module "glx" (=
loader failed, 7)</p>
    <p><br>
    </p>
    <p>Full log:</p>
    <p>[=C2=A0=C2=A0=C2=A0=C2=A0 4.394] <br>
      X.Org X Server 1.16.4<br>
      Release Date: 2014-12-20<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] X Protocol Version 11, Revision 0<=
br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Build Operating System: Linux 3.16=
.0-4-amd64 x86_64
      Debian<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Current Operating System: Linux NO=
MAC
      4.6.0-0.bpo.1-amd64 #1 SMP Debian 4.6.1-1~bpo8+1 (2016-06-14)
      x86_64<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Kernel command line:
      BOOT_IMAGE=3D/boot/vmlinuz-4.6.0-0.bpo.1-amd64
      root=3DUUID=3D2c330f07-0904-46a0-a554-16ec45d06fdf ro quiet<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Build Date: 11 February 2015=C2=A0=
 12:32:02AM<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] xorg-server 2:1.16.4-1
      (<a class=3D"moz-txt-link-freetext" href=3D"http://www.debian.org/s=
upport">http://www.debian.org/support</a>) <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Current version of pixman: 0.32.6<=
br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394]=C2=A0=C2=A0=C2=A0 Before reporting=
 problems, check <a class=3D"moz-txt-link-freetext" href=3D"http://wiki.x=
.org">http://wiki.x.org</a><br>
      =C2=A0=C2=A0 to make sure that you have the latest version.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] Markers: (--) probed, (**) from co=
nfig file, (=3D=3D)
      default setting,<br>
      =C2=A0=C2=A0 (++) from command line, (!!) notice, (II) informationa=
l,<br>
      =C2=A0=C2=A0 (WW) warning, (EE) error, (NI) not implemented, (??) u=
nknown.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.394] (=3D=3D) Log file: "/var/log/Xorg.=
0.log", Time: Fri Jul=C2=A0
      8 10:40:35 2016<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.397] (=3D=3D) Using system config direc=
tory
      "/usr/share/X11/xorg.conf.d"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) No Layout section.=C2=A0 =
Using the first Screen
      section.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) No screen section availab=
le. Using defaults.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (**) |--&gt;Screen "Default Screen=
 Section" (0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (**) |=C2=A0=C2=A0 |--&gt;Monitor =
"&lt;default monitor&gt;"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) No monitor specified for =
screen "Default Screen
      Section".<br>
      =C2=A0=C2=A0 Using a default monitor configuration.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) Automatically adding devi=
ces<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) Automatically enabling de=
vices<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.399] (=3D=3D) Automatically adding GPU =
devices<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.401] (WW) The directory "/usr/share/fon=
ts/X11/cyrillic"
      does not exist.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.401]=C2=A0=C2=A0=C2=A0 Entry deleted fr=
om font path.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (=3D=3D) FontPath set to:<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/misc,<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/100dpi/:unscaled,<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/75dpi/:unscaled,<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/Type1,<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/100dpi,<br>
      =C2=A0=C2=A0 /usr/share/fonts/X11/75dpi,<br>
      =C2=A0=C2=A0 built-ins<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (**) ModulePath set to "/usr/lib/x=
org/modules/"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (II) The server relies on udev to =
provide the list of
      input devices.<br>
      =C2=A0=C2=A0 If no devices become available, reconfigure udev or di=
sable
      AutoAddDevices.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (II) Loader magic: 0x55db3d382d80<=
br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (II) Module ABI versions:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403]=C2=A0=C2=A0=C2=A0 X.Org ANSI C Emu=
lation: 0.4<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403]=C2=A0=C2=A0=C2=A0 X.Org Video Driv=
er: 18.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403]=C2=A0=C2=A0=C2=A0 X.Org XInput dri=
ver : 21.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403]=C2=A0=C2=A0=C2=A0 X.Org Server Ext=
ension : 8.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.403] (II) xfree86: Adding drm device (/=
dev/dri/card0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.404] (--) PCI:*(0:1:0:0) 10de:1183:1043=
:841e rev 161, Mem
      @ 0xee000000/16777216, 0xe0000000/134217728, 0xe8000000/33554432,
      I/O @ 0x0000e000/128, BIOS @ 0x????????/131072<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.404] (II) LoadModule: "glx"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.406] (II) Loading
      /usr/lib/xorg/modules/extensions/libglx.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (EE) Failed to load
      /usr/lib/xorg/modules/extensions/libglx.so:
      libnvidia-tls.so.352.79: cannot open shared object file: No such
      file or directory<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (II) UnloadModule: "glx"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (II) Unloading glx<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (EE) Failed to load module "glx" (=
loader failed, 7)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched nouveau as autoco=
nfigured driver 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched nv as autoconfigu=
red driver 1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched nouveau as autoco=
nfigured driver 2<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched nv as autoconfigu=
red driver 3<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched modesetting as au=
toconfigured driver 4<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched fbdev as autoconf=
igured driver 5<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Matched vesa as autoconfi=
gured driver 6<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (=3D=3D) Assigned the driver to th=
e xf86ConfigLayout<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (II) LoadModule: "nouveau"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.408] (II) Loading
      /usr/lib/xorg/modules/drivers/nouveau_drv.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) Module nouveau: vendor=3D"X.O=
rg Foundation"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 compiled for 1.1=
6.0, module version =3D 1.0.11<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 Module class: X.=
Org Video Driver<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 ABI class: X.Org=
 Video Driver, version 18.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) LoadModule: "nv"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (WW) Warning, couldn't open module=
 nv<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) UnloadModule: "nv"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) Unloading nv<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (EE) Failed to load module "nv" (m=
odule does not
      exist, 0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) LoadModule: "modesetting"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (WW) Warning, couldn't open module=
 modesetting<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) UnloadModule: "modesetting"<b=
r>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) Unloading modesetting<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (EE) Failed to load module "modese=
tting" (module does
      not exist, 0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) LoadModule: "fbdev"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (WW) Warning, couldn't open module=
 fbdev<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) UnloadModule: "fbdev"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) Unloading fbdev<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (EE) Failed to load module "fbdev"=
 (module does not
      exist, 0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) LoadModule: "vesa"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (WW) Warning, couldn't open module=
 vesa<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) UnloadModule: "vesa"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) Unloading vesa<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (EE) Failed to load module "vesa" =
(module does not
      exist, 0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) NOUVEAU driver Date:=C2=A0=C2=
=A0 Thu Aug 28 03:57:48 2014
      +0200<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (II) NOUVEAU driver for NVIDIA chi=
pset families :<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 RIVA TNT=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (NV04)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 RIVA TNT2=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (NV05)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 256=C2=A0=
=C2=A0=C2=A0=C2=A0 (NV10)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 2=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (NV11, NV15)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 4MX=C2=A0=
=C2=A0=C2=A0=C2=A0 (NV17, NV18)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 3=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (NV20)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 4Ti=C2=A0=
=C2=A0=C2=A0=C2=A0 (NV25, NV28)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce FX=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (NV3x)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 6=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (NV4x)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 7=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (G7x)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce 8=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (G8x)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce GTX 200 =
(NVA0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410]=C2=A0=C2=A0=C2=A0 GeForce GTX 400 =
(NVC0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.410] (++) using VT number 7<br>
      <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) [drm] nouveau interface versi=
on: 1.3.1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) Loading sub module "dri2"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) LoadModule: "dri2"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) Module "dri2" already built-i=
n<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (--) NOUVEAU(0): Chipset: "NVIDIA =
NVE4"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) NOUVEAU(0): Creating default =
Display subsection
      in Screen section<br>
      =C2=A0=C2=A0 "Default Screen Section" for depth/fbbpp 24/32<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Depth 24, (--=
) framebuffer bpp 32<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): RGB weight 88=
8<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Default visua=
l is TrueColor<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Using HW curs=
or<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): GLX sync to V=
Blank enabled.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Page flipping=
 enabled<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Swap limit se=
t to 1 [Max allowed 2]<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (=3D=3D) NOUVEAU(0): Page flipping=
 synced to vblank by
      kernel.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.412] (II) NOUVEAU(0): Initializing outp=
uts ...<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.478] (II) NOUVEAU(0): Output DVI-I-1 ha=
s no monitor
      section<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.479] (II) NOUVEAU(0): Output DVI-D-1 ha=
s no monitor
      section<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.545] (II) NOUVEAU(0): Output HDMI-1 has=
 no monitor section<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.608] (II) NOUVEAU(0): Output DP-1 has n=
o monitor section<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.608] (II) NOUVEAU(0): 4 crtcs needed fo=
r screen.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.622] (II) NOUVEAU(0): Allocated crtc nr=
. 0 to this screen.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.622] (II) NOUVEAU(0): Allocated crtc nr=
. 1 to this screen.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.622] (II) NOUVEAU(0): Allocated crtc nr=
. 2 to this screen.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.622] (II) NOUVEAU(0): Allocated crtc nr=
. 3 to this screen.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): EDID for output D=
VI-I-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Manufacturer: ###=
#=C2=A0 Model: 2369=C2=A0
      Serial#: 373<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Year: 2013=C2=A0 =
Week: 24<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): EDID Version: 1.3=
<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Digital Display I=
nput<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Max Image Size [c=
m]: horiz.: 51=C2=A0
      vert.: 29<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Gamma: 2.20<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): DPMS capabilities=
: Off<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported color e=
ncodings: RGB 4:4:4
      YCrCb 4:4:4 <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): First detailed ti=
ming is preferred
      mode<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): redX: 0.651 redY:=
 0.338=C2=A0=C2=A0 greenX:
      0.321 greenY: 0.614<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): blueX: 0.154 blue=
Y: 0.063=C2=A0=C2=A0 whiteX:
      0.313 whiteY: 0.329<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported establi=
shed timings:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): 720x400@70Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): 640x480@60Hz<br>
      <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): 1024x768@70Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): 1024x768@75Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): 1280x1024@75Hz<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Manufacturer's ma=
sk: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported standar=
d timings:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): #0: hsize: 1920=C2=
=A0 vsize 1080=C2=A0
      refresh: 60=C2=A0 vid: 49361<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): #5: hsize: 1280=C2=
=A0 vsize 720=C2=A0 refresh:
      60=C2=A0 vid: 49281<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): clock: 148.5 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509
      x 286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): h_active: 1920=C2=
=A0 h_sync: 2008=C2=A0
      h_sync_end 2052 h_blank_end 2200 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): v_active: 1080=C2=
=A0 v_sync: 1084=C2=A0
      v_sync_end 1089 v_blanking: 1125 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Ranges: V min: 50=
 V max: 76 Hz, H
      min: 30 H max: 83 kHz, PixClock max 175 MHz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Monitor name: 236=
9M<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Serial No: BCOD69=
A000373<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 736=C2=A0
      h_sync_end 798 h_blank_end 858 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): v_active: 480=C2=A0=
 v_sync: 489=C2=A0
      v_sync_end 495 v_blanking: 525 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): clock: 74.2 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): h_active: 1280=C2=
=A0 h_sync: 1390=C2=A0
      h_sync_end 1430 h_blank_end 1650 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): v_active: 720=C2=A0=
 v_sync: 725=C2=A0
      v_sync_end 730 v_blanking: 750 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 736=C2=A0
      h_sync_end 798 h_blank_end 858 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): v_active: 480=C2=A0=
 v_sync: 489=C2=A0
      v_sync_end 495 v_blanking: 525 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 732=C2=A0
      h_sync_end 796 h_blank_end 864 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): v_active: 576=C2=A0=
 v_sync: 581=C2=A0
      v_sync_end 586 v_blanking: 625 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Number of EDID se=
ctions to follow: 1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): EDID (in hex):<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00ffffffffffff0005e3692375010000<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 1817010380331d782ae595a656529d27<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 105054bfef00d1c0b300950081808140<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 81c001010101023a801871382d40582c<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 4500fd1e1100001e000000fd00324c1e<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 5311000a202020202020000000fc0032<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 3336394d0a20202020202020000000ff<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00000000000000000000000000000059<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Printing probed m=
odes for output
      DVI-I-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1920x10=
80"x60.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1920x10=
80"x50.0=C2=A0 148.50=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1089 1125 +hsync +vsync (56.2 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1920x10=
80"x59.9=C2=A0 148.35=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.4 k=
Hz
      e)<br>
      <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1280x10=
24"x75.0=C2=A0 135.00=C2=A0
      1280 1296 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (80.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1280x10=
24"x60.0=C2=A0 108.00=C2=A0
      1280 1328 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (64.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1440x90=
0"x59.9=C2=A0=C2=A0 88.75=C2=A0
      1440 1488 1520 1600=C2=A0 900 903 909 926 +hsync -vsync (55.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1280x96=
0"x60.0=C2=A0 108.00=C2=A0
      1280 1376 1488 1800=C2=A0 960 961 964 1000 +hsync +vsync (60.0 kHz =
e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "1280x72=
0"x60.0=C2=A0=C2=A0 74.25=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "640x480=
"x59.9=C2=A0=C2=A0 25.18=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.689] (II) NOUVEAU(0): Modeline "720x400=
"x70.1=C2=A0=C2=A0 28.32=C2=A0 720
      738 846 900=C2=A0 400 412 414 449 -hsync +vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.690] (II) NOUVEAU(0): EDID for output D=
VI-D-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): EDID for output H=
DMI-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Manufacturer: ###=
#=C2=A0 Model: 2369=C2=A0
      Serial#: 1428<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Year: 2013=C2=A0 =
Week: 19<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): EDID Version: 1.3=
<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Digital Display I=
nput<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Max Image Size [c=
m]: horiz.: 51=C2=A0
      vert.: 29<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Gamma: 2.20<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): DPMS capabilities=
: Off<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Supported color e=
ncodings: RGB 4:4:4
      YCrCb 4:4:4 <br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): First detailed ti=
ming is preferred
      mode<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): redX: 0.651 redY:=
 0.338=C2=A0=C2=A0 greenX:
      0.321 greenY: 0.614<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): blueX: 0.154 blue=
Y: 0.063=C2=A0=C2=A0 whiteX:
      0.313 whiteY: 0.329<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Supported establi=
shed timings:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 720x400@70Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 640x480@60Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 640x480@67Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 640x480@72Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 640x480@75Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 800x600@56Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 800x600@60Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 800x600@72Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 800x600@75Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 832x624@75Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 1024x768@60Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 1024x768@70Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 1024x768@75Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): 1280x1024@75Hz<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Manufacturer's ma=
sk: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Supported standar=
d timings:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #0: hsize: 1920=C2=
=A0 vsize 1080=C2=A0
      refresh: 60=C2=A0 vid: 49361<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #1: hsize: 1680=C2=
=A0 vsize 1050=C2=A0
      refresh: 60=C2=A0 vid: 179<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #2: hsize: 1440=C2=
=A0 vsize 900=C2=A0 refresh:
      60=C2=A0 vid: 149<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #3: hsize: 1280=C2=
=A0 vsize 1024=C2=A0
      refresh: 60=C2=A0 vid: 32897<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #4: hsize: 1280=C2=
=A0 vsize 960=C2=A0 refresh:
      60=C2=A0 vid: 16513<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): #5: hsize: 1280=C2=
=A0 vsize 720=C2=A0 refresh:
      60=C2=A0 vid: 49281<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): clock: 148.5 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509
      x 286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): h_active: 1920=C2=
=A0 h_sync: 2008=C2=A0
      h_sync_end 2052 h_blank_end 2200 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): v_active: 1080=C2=
=A0 v_sync: 1084=C2=A0
      v_sync_end 1089 v_blanking: 1125 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Ranges: V min: 50=
 V max: 76 Hz, H
      min: 30 H max: 83 kHz, PixClock max 175 MHz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.756] (II) NOUVEAU(0): Monitor name: 236=
9M<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Serial No: BCOD59=
A001428<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 736=C2=A0
      h_sync_end 798 h_blank_end 858 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): v_active: 480=C2=A0=
 v_sync: 489=C2=A0
      v_sync_end 495 v_blanking: 525 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): clock: 74.2 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): h_active: 1280=C2=
=A0 h_sync: 1390=C2=A0
      h_sync_end 1430 h_blank_end 1650 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): v_active: 720=C2=A0=
 v_sync: 725=C2=A0
      v_sync_end 730 v_blanking: 750 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 736=C2=A0
      h_sync_end 798 h_blank_end 858 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): v_active: 480=C2=A0=
 v_sync: 489=C2=A0
      v_sync_end 495 v_blanking: 525 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Supported detaile=
d timing:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): clock: 27.0 MHz=C2=
=A0=C2=A0 Image Size:=C2=A0 509 x
      286 mm<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): h_active: 720=C2=A0=
 h_sync: 732=C2=A0
      h_sync_end 796 h_blank_end 864 h_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): v_active: 576=C2=A0=
 v_sync: 581=C2=A0
      v_sync_end 586 v_blanking: 625 v_border: 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Number of EDID se=
ctions to follow: 1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): EDID (in hex):<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00ffffffffffff0005e3692394050000<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 1317010380331d782ae595a656529d27<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 105054bfef00d1c0b300950081808140<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 81c001010101023a801871382d40582c<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 4500fd1e1100001e000000fd00324c1e<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 5311000a202020202020000000fc0032<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 3336394d0a20202020202020000000ff<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 0042434f4435394130303134323801ca<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 02031ff14c101f051404130312021101<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 22230907078301000065030c0010008c<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 0ad08a20e02d10103e9600fd1e110000<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 18011d007251d01e206e285500fd1e11<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00001e8c0ad08a20e02d10103e9600fd<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 1e110000188c0ad090204031200c4055<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00fd1e11000018000000000000000000<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0):=C2=A0=C2=A0=C2=A0=
 00000000000000000000000000000059<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Printing probed m=
odes for output
      HDMI-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80"x60.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80"x50.0=C2=A0 148.50=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1089 1125 +hsync +vsync (56.2 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80"x59.9=C2=A0 148.35=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.4 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80i"x60.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80i"x50.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80"x30.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (33.8 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80i"x59.9=C2=A0=C2=A0 74.18=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.7 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1920x10=
80"x30.0=C2=A0=C2=A0 74.18=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (33.7 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1680x10=
50"x59.9=C2=A0 119.00=C2=A0
      1680 1728 1760 1840=C2=A0 1050 1053 1059 1080 +hsync -vsync (64.7 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x10=
24"x75.0=C2=A0 135.00=C2=A0
      1280 1296 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (80.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x10=
24"x60.0=C2=A0 108.00=C2=A0
      1280 1328 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (64.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1440x90=
0"x59.9=C2=A0=C2=A0 88.75=C2=A0
      1440 1488 1520 1600=C2=A0 900 903 909 926 +hsync -vsync (55.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x96=
0"x60.0=C2=A0 108.00=C2=A0
      1280 1376 1488 1800=C2=A0 960 961 964 1000 +hsync +vsync (60.0 kHz =
e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x72=
0"x60.0=C2=A0=C2=A0 74.25=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x72=
0"x50.0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1280x72=
0"x59.9=C2=A0=C2=A0 74.18=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1024x76=
8"x75.0=C2=A0=C2=A0 78.75=C2=A0
      1024 1040 1136 1312=C2=A0 768 769 772 800 +hsync +vsync (60.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1024x76=
8"x70.1=C2=A0=C2=A0 75.00=C2=A0
      1024 1048 1184 1328=C2=A0 768 771 777 806 -hsync -vsync (56.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "1024x76=
8"x60.0=C2=A0=C2=A0 65.00=C2=A0
      1024 1048 1184 1344=C2=A0 768 771 777 806 -hsync -vsync (48.4 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "832x624=
"x74.6=C2=A0=C2=A0 57.28=C2=A0 832
      864 928 1152=C2=A0 624 625 628 667 -hsync -vsync (49.7 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "800x600=
"x72.2=C2=A0=C2=A0 50.00=C2=A0 800
      856 976 1040=C2=A0 600 637 643 666 +hsync +vsync (48.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "800x600=
"x75.0=C2=A0=C2=A0 49.50=C2=A0 800
      816 896 1056=C2=A0 600 601 604 625 +hsync +vsync (46.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "800x600=
"x60.3=C2=A0=C2=A0 40.00=C2=A0 800
      840 968 1056=C2=A0 600 601 605 628 +hsync +vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "800x600=
"x56.2=C2=A0=C2=A0 36.00=C2=A0 800
      824 896 1024=C2=A0 600 601 603 625 +hsync +vsync (35.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "720x576=
"x50.0=C2=A0=C2=A0 27.00=C2=A0 720
      732 796 864=C2=A0 576 581 586 625 -hsync -vsync (31.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "720x480=
"x60.0=C2=A0=C2=A0 27.03=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "720x480=
"x59.9=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "640x480=
"x75.0=C2=A0=C2=A0 31.50=C2=A0 640
      656 720 840=C2=A0 480 481 484 500 -hsync -vsync (37.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "640x480=
"x72.8=C2=A0=C2=A0 31.50=C2=A0 640
      664 704 832=C2=A0 480 489 492 520 -hsync -vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "640x480=
"x66.7=C2=A0=C2=A0 30.24=C2=A0 640
      704 768 864=C2=A0 480 483 486 525 -hsync -vsync (35.0 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "640x480=
"x60.0=C2=A0=C2=A0 25.20=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "640x480=
"x59.9=C2=A0=C2=A0 25.18=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.757] (II) NOUVEAU(0): Modeline "720x400=
"x70.1=C2=A0=C2=A0 28.32=C2=A0 720
      738 846 900=C2=A0 400 412 414 449 -hsync +vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): EDID for output D=
P-1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output DVI-I-1 co=
nnected<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output DVI-D-1 di=
sconnected<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output HDMI-1 con=
nected<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output DP-1 disco=
nnected<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Using exact sizes=
 for initial modes<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output DVI-I-1 us=
ing initial mode
      1920x1080<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Output HDMI-1 usi=
ng initial mode
      1920x1080<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Using default gam=
ma of (1.0, 1.0,
      1.0) unless otherwise stated.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (--) NOUVEAU(0): Virtual size is 1=
920x1080 (pitch 0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080": 148.5 MHz
      (scaled from 0.0 MHz), 67.5 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80"x60.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080": 148.5 MHz
      (scaled from 0.0 MHz), 56.2 kHz, 50.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80"x50.0=C2=A0 148.50=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1089 1125 +hsync +vsync (56.2 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080": 148.4 MHz
      (scaled from 0.0 MHz), 67.4 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80"x59.9=C2=A0 148.35=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.4 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080i": 74.2 MHz
      (scaled from 0.0 MHz), 33.8 kHz, 60.0 Hz (I)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80i"x60.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080i": 74.2 MHz
      (scaled from 0.0 MHz), 28.1 kHz, 50.0 Hz (I)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80i"x50.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080": 74.2 MHz
      (scaled from 0.0 MHz), 33.8 kHz, 30.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80"x30.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (33.8 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080i": 74.2 MHz
      (scaled from 0.0 MHz), 33.7 kHz, 59.9 Hz (I)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80i"x59.9=C2=A0=C2=A0 74.18=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.7 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1920x1080": 74.2 MHz
      (scaled from 0.0 MHz), 33.7 kHz, 30.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1920x10=
80"x30.0=C2=A0=C2=A0 74.18=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (33.7 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1680x1050": 119.0 MHz
      (scaled from 0.0 MHz), 64.7 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1680x10=
50"x59.9=C2=A0 119.00=C2=A0
      1680 1728 1760 1840=C2=A0 1050 1053 1059 1080 +hsync -vsync (64.7 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x1024": 135.0 MHz
      (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x10=
24"x75.0=C2=A0 135.00=C2=A0
      1280 1296 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (80.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x1024": 108.0 MHz
      (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x10=
24"x60.0=C2=A0 108.00=C2=A0
      1280 1328 1440 1688=C2=A0 1024 1025 1028 1066 +hsync +vsync (64.0 k=
Hz
      e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1440x900": 88.8 MHz
      (scaled from 0.0 MHz), 55.5 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1440x90=
0"x59.9=C2=A0=C2=A0 88.75=C2=A0
      1440 1488 1520 1600=C2=A0 900 903 909 926 +hsync -vsync (55.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x960": 108.0 MHz
      (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x96=
0"x60.0=C2=A0 108.00=C2=A0
      1280 1376 1488 1800=C2=A0 960 961 964 1000 +hsync +vsync (60.0 kHz =
e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x720": 74.2 MHz
      (scaled from 0.0 MHz), 45.0 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x72=
0"x60.0=C2=A0=C2=A0 74.25=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x720": 74.2 MHz
      (scaled from 0.0 MHz), 37.5 kHz, 50.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x72=
0"x50.0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1280x720": 74.2 MHz
      (scaled from 0.0 MHz), 45.0 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1280x72=
0"x59.9=C2=A0=C2=A0 74.18=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1024x768": 78.8 MHz
      (scaled from 0.0 MHz), 60.0 kHz, 75.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1024x76=
8"x75.0=C2=A0=C2=A0 78.75=C2=A0
      1024 1040 1136 1312=C2=A0 768 769 772 800 +hsync +vsync (60.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1024x768": 75.0 MHz
      (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1024x76=
8"x70.1=C2=A0=C2=A0 75.00=C2=A0
      1024 1048 1184 1328=C2=A0 768 771 777 806 -hsync -vsync (56.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "1024x768": 65.0 MHz
      (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "1024x76=
8"x60.0=C2=A0=C2=A0 65.00=C2=A0
      1024 1048 1184 1344=C2=A0 768 771 777 806 -hsync -vsync (48.4 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "832x624": 57.3 MHz
      (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "832x624=
"x74.6=C2=A0=C2=A0 57.28=C2=A0 832
      864 928 1152=C2=A0 624 625 628 667 -hsync -vsync (49.7 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "800x600": 50.0 MHz
      (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "800x600=
"x72.2=C2=A0=C2=A0 50.00=C2=A0 800
      856 976 1040=C2=A0 600 637 643 666 +hsync +vsync (48.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "800x600": 49.5 MHz
      (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "800x600=
"x75.0=C2=A0=C2=A0 49.50=C2=A0 800
      816 896 1056=C2=A0 600 601 604 625 +hsync +vsync (46.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "800x600": 40.0 MHz
      (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "800x600=
"x60.3=C2=A0=C2=A0 40.00=C2=A0 800
      840 968 1056=C2=A0 600 601 605 628 +hsync +vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "800x600": 36.0 MHz
      (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "800x600=
"x56.2=C2=A0=C2=A0 36.00=C2=A0 800
      824 896 1024=C2=A0 600 601 603 625 +hsync +vsync (35.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "720x576": 27.0 MHz
      (scaled from 0.0 MHz), 31.2 kHz, 50.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "720x576=
"x50.0=C2=A0=C2=A0 27.00=C2=A0 720
      732 796 864=C2=A0 576 581 586 625 -hsync -vsync (31.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "720x480": 27.0 MHz
      (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "720x480=
"x60.0=C2=A0=C2=A0 27.03=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "720x480": 27.0 MHz
      (scaled from 0.0 MHz), 31.5 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "720x480=
"x59.9=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "640x480": 31.5 MHz
      (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "640x480=
"x75.0=C2=A0=C2=A0 31.50=C2=A0 640
      656 720 840=C2=A0 480 481 484 500 -hsync -vsync (37.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "640x480": 31.5 MHz
      (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "640x480=
"x72.8=C2=A0=C2=A0 31.50=C2=A0 640
      664 704 832=C2=A0 480 489 492 520 -hsync -vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "640x480": 30.2 MHz
      (scaled from 0.0 MHz), 35.0 kHz, 66.7 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "640x480=
"x66.7=C2=A0=C2=A0 30.24=C2=A0 640
      704 768 864=C2=A0 480 483 486 525 -hsync -vsync (35.0 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "640x480": 25.2 MHz
      (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "640x480=
"x60.0=C2=A0=C2=A0 25.20=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "640x480": 25.2 MHz
      (scaled from 0.0 MHz), 31.5 kHz, 59.9 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "640x480=
"x59.9=C2=A0=C2=A0 25.18=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (**) NOUVEAU(0):=C2=A0 Driver mode=
 "720x400": 28.3 MHz
      (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) NOUVEAU(0): Modeline "720x400=
"x70.1=C2=A0=C2=A0 28.32=C2=A0 720
      738 846 900=C2=A0 400 412 414 449 -hsync +vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (=3D=3D) NOUVEAU(0): DPI set to (9=
6, 96)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) Loading sub module "fb"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) LoadModule: "fb"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.820] (II) Loading /usr/lib/xorg/modules=
/libfb.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (II) Module fb: vendor=3D"X.Org Fo=
undation"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821]=C2=A0=C2=A0=C2=A0 compiled for 1.1=
6.4, module version =3D 1.0.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821]=C2=A0=C2=A0=C2=A0 ABI class: X.Org=
 ANSI C Emulation, version 0.4<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (II) Loading sub module "shadowfb"=
<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (II) LoadModule: "shadowfb"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (II) Loading /usr/lib/xorg/modules=
/libshadowfb.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (II) Module shadowfb: vendor=3D"X.=
Org Foundation"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821]=C2=A0=C2=A0=C2=A0 compiled for 1.1=
6.4, module version =3D 1.0.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821]=C2=A0=C2=A0=C2=A0 ABI class: X.Org=
 ANSI C Emulation, version 0.4<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.821] (--) Depth 24 pixmap format is 32 =
bpp<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.847] (II) NOUVEAU(0): Channel setup com=
plete.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.871] (II) NOUVEAU(0): [COPY] async init=
ialised.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.872] (II) NOUVEAU(0): [DRI2] Setup comp=
lete<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.872] (II) NOUVEAU(0): [DRI2]=C2=A0=C2=A0=
 DRI driver: nouveau<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.872] (II) NOUVEAU(0): [DRI2]=C2=A0=C2=A0=
 VDPAU driver: nouveau<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873] (II) Loading sub module "exa"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873] (II) LoadModule: "exa"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873] (II) Loading /usr/lib/xorg/modules=
/libexa.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873] (II) Module exa: vendor=3D"X.Org F=
oundation"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873]=C2=A0=C2=A0=C2=A0 compiled for 1.1=
6.4, module version =3D 2.6.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.873]=C2=A0=C2=A0=C2=A0 ABI class: X.Org=
 Video Driver, version 18.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II) EXA(0): Driver allocated offs=
creen pixmaps<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II) EXA(0): Driver registered sup=
port for the
      following operations:<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Solid<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Copy<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 Composite (RENDER acceleration)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 UploadToScreen<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 DownloadFromScreen<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (=3D=3D) NOUVEAU(0): Backing store=
 enabled<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (=3D=3D) NOUVEAU(0): Silken mouse =
enabled<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II) NOUVEAU(0): [XvMC] Associated=
 with Nouveau
      GeForce 8/9 Textured Video.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II) NOUVEAU(0): [XvMC] Extension =
initialized.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (=3D=3D) NOUVEAU(0): DPMS enabled<=
br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (II) NOUVEAU(0): RandR 1.2 enabled=
, ignore the
      following RandR disabled message.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.874] (--) RandR disabled<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.877] (II) SELinux: Disabled on system<b=
r>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.880] (II) NOUVEAU(0): NVEnterVT is call=
ed.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.930] (II) NOUVEAU(0): Setting screen ph=
ysical size to 508
      x 285<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.930] resize called 1920 1080<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.954] (II) config/udev: Adding input dev=
ice Power Button
      (/dev/input/event4)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.954] (**) Power Button: Applying InputC=
lass "evdev
      keyboard catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.954] (II) LoadModule: "evdev"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.954] (II) Loading /usr/lib/xorg/modules=
/input/evdev_drv.so<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (II) Module evdev: vendor=3D"X.Org=
 Foundation"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955]=C2=A0=C2=A0=C2=A0 compiled for 1.1=
6.0, module version =3D 2.9.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955]=C2=A0=C2=A0=C2=A0 Module class: X.=
Org XInput Driver<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955]=C2=A0=C2=A0=C2=A0 ABI class: X.Org=
 XInput driver, version 21.0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (II) Using input driver 'evdev' fo=
r 'Power Button'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) Power Button: always reports =
core events<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) evdev: Power Button: Device: =
"/dev/input/event4"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (--) evdev: Power Button: Vendor 0=
 Product 0x1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (--) evdev: Power Button: Found ke=
ys<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (II) evdev: Power Button: Configur=
ing as keyboard<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) Option "config_info"
      "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input7/event4"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (II) XINPUT: Adding extended input=
 device "Power
      Button" (type: KEYBOARD, id 6)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) Option "xkb_rules" "evdev"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) Option "xkb_model" "pc105"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.955] (**) Option "xkb_layout" "de"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) config/udev: Adding input dev=
ice Power Button
      (/dev/input/event3)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Power Button: Applying InputC=
lass "evdev
      keyboard catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) Using input driver 'evdev' fo=
r 'Power Button'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Power Button: always reports =
core events<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) evdev: Power Button: Device: =
"/dev/input/event3"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (--) evdev: Power Button: Vendor 0=
 Product 0x1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (--) evdev: Power Button: Found ke=
ys<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) evdev: Power Button: Configur=
ing as keyboard<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input6/event3=
"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) XINPUT: Adding extended input=
 device "Power
      Button" (type: KEYBOARD, id 7)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Option "xkb_rules" "evdev"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Option "xkb_model" "pc105"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) Option "xkb_layout" "de"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) config/udev: Adding input dev=
ice ####
      (/dev/input/event0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) ####: Applying InputClass "ev=
dev pointer
      catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (II) Using input driver 'evdev' fo=
r '####'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) ####: always reports core eve=
nts<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 4.964] (**) evdev: ####: Device: "/dev/in=
put/event0"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Vendor 0x22d4 Pr=
oduct 0x130c<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found 12 mouse b=
uttons<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found scroll whe=
el(s)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found relative a=
xes<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found x and y re=
lative axes<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) evdev: ####: Configuring as m=
ouse<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) evdev: ####: Adding scrollwhe=
el support<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) evdev: ####: YAxisMapping: bu=
ttons 4 and 5<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) evdev: ####: EmulateWheelButt=
on: 4,
      EmulateWheelInertia: 10, EmulateWheelTimeout: 200<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.0/0003:22D4:130=
C.0001/input/input3/event0"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) XINPUT: Adding extended input=
 device "####"
      (type: MOUSE, id 8)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) evdev: ####: initialized for =
relative axes.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: (accel) keeping acceler=
ation scheme 1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: (accel) acceleration pr=
ofile 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: (accel) acceleration fa=
ctor: 2.000<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: (accel) acceleration th=
reshold: 4<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) config/udev: Adding input dev=
ice ####
      (/dev/input/mouse0)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) config/udev: Adding input dev=
ice ####
      (/dev/input/event1)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: Applying InputClass "ev=
dev keyboard
      catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) Using input driver 'evdev' fo=
r '####'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: always reports core eve=
nts<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) evdev: ####: Device: "/dev/in=
put/event1"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Vendor 0x22d4 Pr=
oduct 0x130c<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found keys<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) evdev: ####: Configuring as k=
eyboard<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-5/3-5:1.1/0003:22D4:130=
C.0002/input/input4/event1"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) XINPUT: Adding extended input=
 device "####"
      (type: KEYBOARD, id 9)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_rules" "evdev"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_model" "pc105"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_layout" "de"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) config/udev: Adding input dev=
ice ####
      (/dev/input/event2)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: Applying InputClass "ev=
dev keyboard
      catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) Using input driver 'evdev' fo=
r '####'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) ####: always reports core eve=
nts<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) evdev: ####: Device: "/dev/in=
put/event2"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Vendor 0x46a Pro=
duct 0x1<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (--) evdev: ####: Found keys<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) evdev: ####: Configuring as k=
eyboard<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:14.0/usb3/3-6/3-6:1.0/0003:046A:000=
1.0003/input/input5/event2"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (II) XINPUT: Adding extended input=
 device "####"
      (type: KEYBOARD, id 10)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_rules" "evdev"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_model" "pc105"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.020] (**) Option "xkb_layout" "de"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Front Mic (/dev/input/event7)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Rear Mic (/dev/input/event8)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Line (/dev/input/event9)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Line Out Front (/dev/input/event10)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Line Out Surround (/dev/input/event11)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Line Out CLFE (/dev/input/event12)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Line Out Side (/dev/input/event13)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Intel PCH
      Front Headphone (/dev/input/event14)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice HDA Digital
      PCBeep (/dev/input/event6)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (II) config/udev: Adding input dev=
ice Eee PC WMI
      hotkeys (/dev/input/event5)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.021] (**) Eee PC WMI hotkeys: Applying =
InputClass "evdev
      keyboard catchall"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (II) Using input driver 'evdev' fo=
r 'Eee PC WMI
      hotkeys'<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) Eee PC WMI hotkeys: always re=
ports core events<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) evdev: Eee PC WMI hotkeys: De=
vice:
      "/dev/input/event5"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (--) evdev: Eee PC WMI hotkeys: Ve=
ndor 0 Product 0<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (--) evdev: Eee PC WMI hotkeys: Fo=
und keys<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (II) evdev: Eee PC WMI hotkeys: Co=
nfiguring as
      keyboard<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) Option "config_info"
      "udev:/sys/devices/platform/eeepc-wmi/input/input8/event5"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (II) XINPUT: Adding extended input=
 device "Eee PC WMI
      hotkeys" (type: KEYBOARD, id 11)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) Option "xkb_rules" "evdev"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) Option "xkb_model" "pc105"<br=
>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.022] (**) Option "xkb_layout" "de"<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) config/udev: Adding input dev=
ice HDA NVidia
      HDMI/DP,pcm=3D3 (/dev/input/event15)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) config/udev: Adding input dev=
ice HDA NVidia
      HDMI/DP,pcm=3D7 (/dev/input/event16)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) config/udev: Adding input dev=
ice HDA NVidia
      HDMI/DP,pcm=3D8 (/dev/input/event17)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) config/udev: Adding input dev=
ice HDA NVidia
      HDMI/DP,pcm=3D9 (/dev/input/event18)<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) No input driver specified, ig=
noring this device.<br>
      [=C2=A0=C2=A0=C2=A0=C2=A0 5.799] (II) This device may have been add=
ed with another
      device file.<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Using EDID range info =
for horizontal
      sync<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Using EDID range info =
for vertical
      refresh<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "720x480"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1390 1430 1650=C2=A0 720 725 730 750 +hsync +vsync (45.0 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "720x576"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      732 796 864=C2=A0 576 581 586 625 -hsync -vsync (31.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "800x600"x0.0=
=C2=A0=C2=A0 40.00=C2=A0 800
      840 968 1056=C2=A0 600 601 605 628 +hsync +vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "800x600"x0.0=
=C2=A0=C2=A0 36.00=C2=A0 800
      824 896 1024=C2=A0 600 601 603 625 +hsync +vsync (35.2 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0=
=C2=A0=C2=A0 31.50=C2=A0 640
      656 720 840=C2=A0 480 481 484 500 -hsync -vsync (37.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0=
=C2=A0=C2=A0 31.50=C2=A0 640
      664 704 832=C2=A0 480 489 492 520 -hsync -vsync (37.9 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0=
=C2=A0=C2=A0 30.24=C2=A0 640
      704 768 864=C2=A0 480 483 486 525 -hsync -vsync (35.0 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "640x480"x0.0=
=C2=A0=C2=A0 25.18=C2=A0 640
      656 752 800=C2=A0 480 490 492 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "720x400"x0.0=
=C2=A0=C2=A0 28.32=C2=A0 720
      738 846 900=C2=A0 400 412 414 449 -hsync +vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 14.017] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 14.114] resize called 3840 1080<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Using hsync ranges fro=
m config file<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Using vrefresh ranges =
from config
      file<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "720x480"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "1440x576i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1464 1590 1728=C2=A0 576 580 586 625 interlace -hsync -vsync (=
15.6
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.316] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Using hsync ranges fro=
m config file<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Using vrefresh ranges =
from config
      file<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "720x480"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "1440x576i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1464 1590 1728=C2=A0 576 580 586 625 interlace -hsync -vsync (=
15.6
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.533] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Using hsync ranges fro=
m config file<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Using vrefresh ranges =
from config
      file<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "720x480"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1440x480i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1478 1602 1716=C2=A0 480 488 494 525 interlace -hsync -vsync (=
15.7
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1440x576i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1464 1590 1728=C2=A0 576 580 586 625 interlace -hsync -vsync (=
15.6
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.729] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Using hsync ranges fro=
m config file<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Using vrefresh ranges =
from config
      file<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "720x480"x0.0=
=C2=A0=C2=A0 27.00=C2=A0 720
      736 798 858=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1440x480i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1478 1602 1716=C2=A0 480 488 494 525 interlace -hsync -vsync (=
15.7
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1440x576i"x0=
.0=C2=A0=C2=A0 27.00=C2=A0
      1440 1464 1590 1728=C2=A0 576 580 586 625 interlace -hsync -vsync (=
15.6
      kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (33.8 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 22.934] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 23.128] (II) NOUVEAU(0): EDID vendor "####", pr=
od id 9065<br>
      [=C2=A0=C2=A0=C2=A0 23.128] (II) NOUVEAU(0): Using hsync ranges fro=
m config file<br>
      [=C2=A0=C2=A0=C2=A0 23.128] (II) NOUVEAU(0): Using vrefresh ranges =
from config
      file<br>
      [=C2=A0=C2=A0=C2=A0 23.128] (II) NOUVEAU(0): Printing DDC gathered =
Modelines:<br>
      [=C2=A0=C2=A0=C2=A0 23.128] (II) NOUVEAU(0): Modeline "1920x1080"x0=
.0=C2=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP) e)<br>
      [=C2=A0=C2=A0=C2=A0 23.129] (II) NOUVEAU(0): Modeline "1920x1080i"x=
0.0=C2=A0=C2=A0 74.25=C2=A0
      1920 2448 2492 2640=C2=A0 1080 1084 1094 1125 interlace +hsync +vsy=
nc
      (28.1 kHz e)<br>
      [=C2=A0=C2=A0=C2=A0 23.129] (II) NOUVEAU(0): Modeline "1280x720"x0.=
0=C2=A0=C2=A0 74.25=C2=A0
      1280 1720 1760 1980=C2=A0 720 725 730 750 +hsync +vsync (37.5 kHz e=
)<br>
      [=C2=A0=C2=A0=C2=A0 23.129] (II) NOUVEAU(0): Modeline "2880x480"x0.=
0=C2=A0 108.00=C2=A0
      2880 2944 3192 3432=C2=A0 480 489 495 525 -hsync -vsync (31.5 kHz e=
)<br>
      [=C2=A0=C2=A0 188.724] (II) NOUVEAU(0): EDID vendor "####", prod id=
 9065<br>
      [=C2=A0=C2=A0 188.724] (II) NOUVEAU(0): Using hsync ranges from con=
fig file<br>
      [=C2=A0=C2=A0 188.724] (II) NOUVEAU(0): Using vrefresh ranges from =
config
      file<br>
      [=C2=A0=C2=A0 188.724] (II) NOUVEAU(0): Printing DDC gathered Model=
ines:<br>
      [=C2=A0=C2=A0 188.724] (II) NOUVEAU(0): Modeline "1920x1080"x0.0=C2=
=A0 148.50=C2=A0
      1920 2008 2052 2200=C2=A0 1080 1084 1089 1125 +hsync +vsync (67.5 k=
Hz
      eP)<br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">Am 07.07.2016 um 20:35 schrieb
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:abcdeluxe@web.=
de">abcdeluxe-S0/GAf8tV78@public.gmane.org</a>:<br>
    </div>
    <blockquote cite=3D"mid:md5:wtg7K7bLY8rMTDpnAhqXug=3D=3D" type=3D"cit=
e">
      <meta name=3D"generator" content=3D"Windows Mail 17.5.9600.20911">
      <style type=3D"text/css"><!--html { font-family: "Color Emoji", "Ca=
libri", "Segoe UI", "Meiryo", "Microsoft YaHei UI", "Microsoft JhengHei U=
I", "Malgun Gothic", "sans-serif"; }--></style>
      <style data-externalstyle=3D"true"><!--
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph {
margin-top:0in;
margin-right:0in;
margin-bottom:0in;
margin-left:.5in;
margin-bottom:.0001pt;
}
p.MsoNormal, li.MsoNormal, div.MsoNormal {
margin:0in;
margin-bottom:.0001pt;
}
p.MsoListParagraphCxSpFirst, li.MsoListParagraphCxSpFirst, div.MsoListPar=
agraphCxSpFirst,=20
p.MsoListParagraphCxSpMiddle, li.MsoListParagraphCxSpMiddle, div.MsoListP=
aragraphCxSpMiddle,=20
p.MsoListParagraphCxSpLast, li.MsoListParagraphCxSpLast, div.MsoListParag=
raphCxSpLast {
margin-top:0in;
margin-right:0in;
margin-bottom:0in;
margin-left:.5in;
margin-bottom:.0001pt;
line-height:115%;
}
--></style>
      <div data-externalstyle=3D"false" dir=3D"ltr" style=3D"font-family:
        'Calibri', 'Segoe UI', 'Meiryo', 'Microsoft YaHei UI',
        'Microsoft JhengHei UI', 'Malgun Gothic',
        'sans-serif';font-size:12pt;">
        <div>Ok, nevermind the problem was ofcourse some idiot, who
          specified a wrong path=C2=A0for said=C2=A0fb module. (obviously=
 me)</div>
        <div>Startx works now, my gnome crashes with=C2=A0=E2=80=9COh no!=
 Something
          has gone wrong.=E2=80=9D, but I guess this has nothing to do wi=
th
          nouveau so you can take this case as solved!</div>
        <div>Installing the new kernel solved all issues, but=C2=A0I real=
ly
          don=E2=80=99t know, why Debian ships such an old kernel=E2=80=A6=
</div>
        <div><br>
        </div>
        <div style=3D"padding-top: 5px; border-top-color: rgb(229, 229,
          229); border-top-width: 1px; border-top-style: solid;">
          <div><font style=3D"line-height: 15pt; letter-spacing: 0.02em;
              font-family: &quot;Calibri&quot;, &quot;Segoe UI&quot;,
              &quot;Meiryo&quot;, &quot;Microsoft YaHei UI&quot;,
              &quot;Microsoft JhengHei UI&quot;, &quot;Malgun
              Gothic&quot;, &quot;sans-serif&quot;; font-size: 12pt;"
              face=3D" 'Calibri', 'Segoe UI', 'Meiryo', 'Microsoft YaHei
              UI', 'Microsoft JhengHei UI', 'Malgun Gothic',
              'sans-serif'"><b>Von:</b>=C2=A0<a moz-do-not-send=3D"true"
                href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_parent">I=
lia
                Mirkin</a><br>
              <b>Gesendet:</b>=C2=A0=E2=80=8EDonnerstag=E2=80=8E, =E2=80=8E=
7=E2=80=8E. =E2=80=8EJuli=E2=80=8E =E2=80=8E2016 =E2=80=8E20=E2=80=8E:=E2=
=80=8E21<br>
              <b>An:</b>=C2=A0<a moz-do-not-send=3D"true"
                href=3D"mailto:abcdeluxe-S0/GAf8tV78@public.gmane.org" target=3D"_parent">abcd<=
/a><br>
              <b>Cc:</b>=C2=A0<a moz-do-not-send=3D"true"
                href=3D"mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org"
                target=3D"_parent">nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a></fon=
t></div>
        </div>
        <div><br>
        </div>
        <div dir=3D"">
          <div id=3D"readingPaneBodyContent">Please provide the full log,
            along with dmesg.<br>
            <br>
            On Thu, Jul 7, 2016 at 2:14 PM, abcd
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:abcdeluxe@w=
eb.de">&lt;abcdeluxe-S0/GAf8tV78@public.gmane.org&gt;</a> wrote:<br>
            &gt; Well I cannot use X -config or startx, they fail.<br>
            &gt;<br>
            &gt; In the Xorg.0.log the only errors are not being able to
            load modestting,<br>
            &gt; nv and the fb submodule.<br>
            &gt;<br>
            &gt; The Log file says: Loading sub module fb. Couldn't load
            sub module fb.<br>
            &gt; Unloading module nouveau.<br>
            &gt;<br>
            &gt; This sounds like it fails nouveaum, I am not sure
            though.<br>
            &gt;<br>
            &gt; Am 07.07.2016 um 20:11 schrieb Ilia Mirkin:<br>
            &gt;&gt; Is that an error that prevents anything from
            working? It's probably expected...<br>
            &gt;&gt;<br>
            &gt;&gt; On Thu, Jul 7, 2016 at 2:07 PM, abcd
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:abcdeluxe@w=
eb.de">&lt;abcdeluxe-S0/GAf8tV78@public.gmane.org&gt;</a> wrote:<br>
            &gt;&gt;&gt; Thanks for the quick help!<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Indeed a kernel update resolved the issue,
            there one problem left<br>
            &gt;&gt;&gt; though: I get an error:<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Xorg.0.log: Couldn't load sub module "fb".<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; I can't find out what package this module is
            part of. Maybe you know?<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; I already purged and reinstalled xserver-xorg
            and xserver-xorg-core with<br>
            &gt;&gt;&gt; no effect.<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Cheers<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt;<br>
            &gt;&gt;&gt; Am 06.07.2016 um 23:06 schrieb Ilia Mirkin:<br>
            &gt;&gt;&gt;&gt; For some reason it seems to fail somewhere
            in either<br>
            &gt;&gt;&gt;&gt; nouveau_display_create or
            nouveau_display_init. Kernel 3.16 is nearly<br>
            &gt;&gt;&gt;&gt; 2 years old though, and countless changes
            and fixes have gone into the<br>
            &gt;&gt;&gt;&gt; nouveau kernel driver since then. Does this
            still happen with a recent<br>
            &gt;&gt;&gt;&gt; kernel?<br>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; You can try a livecd from
            <a class=3D"moz-txt-link-freetext" href=3D"https://nouveau.pm=
oreau.org/">https://nouveau.pmoreau.org/</a> which has all<br>
            &gt;&gt;&gt;&gt; the very latest nouveau-related software.<br=
>
            &gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt; On Wed, Jul 6, 2016 at 2:50 PM, abcd
            <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:abcdeluxe@w=
eb.de">&lt;abcdeluxe-S0/GAf8tV78@public.gmane.org&gt;</a> wrote:<br>
            &gt;&gt;&gt;&gt;&gt; Hello again,<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; I would be very glad if you could help
            me:<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; I have a blank screen on my Debian
            jessie system and on the current<br>
            &gt;&gt;&gt;&gt;&gt; Debian live cd.<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; When i use the nomodeset param I can
            get a console but startx fails.<br>
            &gt;&gt;&gt;&gt;&gt; (obviously since then nouveau wont
            work)<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; The card is a 660Ti with UEFI VBIOS.<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; Error in Xorg: "[drm] KMS not enabled
            [drm] Couldn't open device.... and<br>
            &gt;&gt;&gt;&gt;&gt; so on"<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; I quote the kernel log: "[=C2=A0=C2=A0=C2=
=A0 0.818189]
            nouveau: probe of 0000:01:00.0<br>
            &gt;&gt;&gt;&gt;&gt; failed with error -12"<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; Here is the kernel log:<br>
            &gt;&gt;&gt;&gt;&gt;...<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; Every help appreciated!<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; Cheers<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt;<br>
            &gt;&gt;&gt;&gt;&gt; Am 05.07.2016 um 22:17 schrieb abcd:<br>
            &gt;&gt;&gt;&gt;&gt;&gt; Hi, I am having problems with the
            nouveau driver from Debian.<br>
            &gt;&gt;&gt;&gt;&gt;&gt; Can I get help here?<br>
            &gt;&gt;&gt;&gt;&gt;&gt; Cheers<br>
            &gt;&gt;&gt;&gt;&gt;&gt;
            _______________________________________________<br>
            &gt;&gt;&gt;&gt;&gt;&gt; Nouveau mailing list<br>
            &gt;&gt;&gt;&gt;&gt;&gt; <a class=3D"moz-txt-link-abbreviated=
" href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp93gSJqDPrsil@public.gmane.org=
.org</a><br>
            &gt;&gt;&gt;&gt;&gt;&gt;
            <a class=3D"moz-txt-link-freetext" href=3D"https://lists.free=
desktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
            &gt;&gt;&gt;&gt;&gt;
            _______________________________________________<br>
            &gt;&gt;&gt;&gt;&gt; Nouveau mailing list<br>
            &gt;&gt;&gt;&gt;&gt; <a class=3D"moz-txt-link-abbreviated" hr=
ef=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org=
</a><br>
            &gt;&gt;&gt;&gt;&gt;
            <a class=3D"moz-txt-link-freetext" href=3D"https://lists.free=
desktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
            &gt;&gt;&gt; _______________________________________________<=
br>
            &gt;&gt;&gt; Nouveau mailing list<br>
            &gt;&gt;&gt; <a class=3D"moz-txt-link-abbreviated" href=3D"ma=
ilto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
            &gt;&gt;&gt;
            <a class=3D"moz-txt-link-freetext" href=3D"https://lists.free=
desktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailm=
an/listinfo/nouveau</a><br>
            &gt;<br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------992086A31E20AFD41BF99297--

--===============0198498761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0198498761==--

From: Karl Schmidt <karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
Subject: GM206 [GeForce GTX 960] with 4k display
Date: Mon, 8 May 2017 22:52:22 -0500
Message-ID: <9bd59053-0d6c-40ea-263b-787057ffa5aa@xtronics.com>
References: <160646ee-8f7f-7a5d-b703-dd951b1d815b@xtronics.com>
 <20170504090040.xnlpegbhp6jbwalp@pmoreau.org>
 <4e019d05-4e63-cde0-aa89-8b8eb1ea94bc@xtronics.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------868851F69CA24BA48A87892F"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4e019d05-4e63-cde0-aa89-8b8eb1ea94bc-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------868851F69CA24BA48A87892F
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I was getting a glicthy checkerboard mess at the cursor in some programs (konsol+) with
# cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-4.9.0-2-amd64 root=UUID=4107d1db-62a3-427c-8515-c954a103ce25 ro text quiet


changed the command line in a blind attempt to:

$ cat /proc/cmdline
BOOT_IMAGE=/boot/vmlinuz-4.9.0-2-amd64 root=UUID=4107d1db-62a3-427c-8515-c954a103ce25 ro 
nouveau.config=NvForcePost=1 acpi_osi=Linux text quiet

The cursor bug disappeared. <grin>


My understanding of the command-line bits is not perfect - but I think that acpi_osi=Linux tells 
acpi to get along with linux - not understanding what nouveau.config=NvForcePost=1 does - google 
failed me.

If someone can explain what I did - you will make an old man smile..

nouveau still complains a bit - not sure it is important.


May  8 22:26:51 singapore kernel: [    6.410185] nouveau 0000:08:00.0: DRM: Pointer to flat panel 
table invalid
May  8 22:26:51 singapore kernel: [    6.418002] nouveau 0000:08:00.0: DRM: unknown connector type 70
May  8 22:26:51 singapore kernel: [    6.418054] nouveau 0000:08:00.0: DRM: failed to create encoder 
1/8/0: -19
May  8 22:26:51 singapore kernel: [    6.418056] nouveau 0000:08:00.0: DRM: Unknown-1 has no 
encoders, removing
May  8 22:26:51 singapore kernel: [    6.418098] [drm] Supports vblank timestamp caching Rev 2 
(21.10.2013).
May  8 22:26:51 singapore kernel: [    6.418099] [drm] Driver supports precise vblank timestamp query.
May  8 22:26:51 singapore kernel: [    6.448895] iTCO_vendor_support: vendor-support=0
May  8 22:26:51 singapore kernel: [    6.452446] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
May  8 22:26:51 singapore kernel: [    6.452499] iTCO_wdt: unable to reset NO_REBOOT flag, device 
disabled by hardware/BIOS
May  8 22:26:51 singapore kernel: [    6.464947] kvm: VM_EXIT_LOAD_IA32_PERF_GLOBAL_CTRL does not 
work properly. Using workaround
May  8 22:26:51 singapore kernel: [    6.528616] nouveau 0000:08:00.0: DRM: MM: using COPY for 
buffer copies

I've attached bits if it might be of use.

Can dig up more if anyone needs it.

$ xrandr -q
Screen 0: minimum 320 x 200, current 3840 x 2160, maximum 16384 x 16384
DVI-I-1 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 disconnected (normal left inverted right x axis y axis)
HDMI-1 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 1085mm x 610mm
    1920x1080     60.00 +  50.00    59.94    59.93    30.00    24.00    29.97    23.98
    4096x2160     24.00    23.98
    3840x2160     30.00*   25.00    24.00    29.97    23.98
<snip>



--------------------------------------------------------------------------------
Karl Schmidt                                  EMail Karl-WH+jy8H4ZDlWk0Htik3J/w@public.gmane.org
Transtronics, Inc.                              WEB https://secure.transtronics.com
3209 West 9th Street                             Ph (785) 841-3089
Lawrence, KS 66049                              FAX (785) 841-3089

--------------------------------------------------------------------------------

--------------868851F69CA24BA48A87892F
Content-Type: text/plain; charset=UTF-8;
 name="edid.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="edid.txt"

Extracted contents:
header:          00 ff ff ff ff ff ff 00
serial number:   4d d9 03 f3 01 01 01 01 01 1a
version:         01 03
basic params:    80 6c 3d 78 0a
chroma info:     0d c9 a0 57 47 98 27 12 48 4c
established:     21 08 00
standard:        81 80 a9 c0 71 4f b3 00 01 01 01 01 01 01 01 01
descriptor 1:    02 3a 80 18 71 38 2d 40 58 2c 45 00 3d 62 42 00 00 1e
descriptor 2:    01 1d 00 72 51 d0 1e 20 6e 28 55 00 3d 62 42 00 00 1e
descriptor 3:    00 00 00 fc 00 53 4f 4e 59 20 54 56 20 20 2a 30 30 0a
descriptor 4:    00 00 00 fd 00 30 3e 0e 46 1e 00 0a 20 20 20 20 20 20
extensions:      01
checksum:        7f

Manufacturer: SNY Model f303 Serial Number 16843009
Made week 1 of 2016
EDID version: 1.3
Digital display
Maximum image size: 108 cm x 61 cm
Gamma: 2.20
Supported color formats: RGB 4:4:4, YCrCb 4:4:4
First detailed timing is preferred timing
Established timings supported:
  640x480@60Hz
  800x600@60Hz
  1024x768@60Hz
Standard timings supported:
  1280x1024@60Hz
  1600x900@60Hz
  1152x864@75Hz
  1680x1050@60Hz
Detailed mode: Clock 148.500 MHz, 1085 mm x 610 mm
               1920 2008 2052 2200 hborder 0
               1080 1084 1089 1125 vborder 0
               +hsync +vsync 
Detailed mode: Clock 74.250 MHz, 1085 mm x 610 mm
               1280 1390 1430 1650 hborder 0
                720  725  730  750 vborder 0
               +hsync +vsync 
Monitor name: SONY
Monitor ranges (GTF): 48-62Hz V, 14-70kHz H, max dotclock 300MHz
Has 1 extension blocks
Checksum: 0x7f (valid)

CEA extension block
Extension version: 3
73 bytes of CEA data
  Video data block
    VIC  93 3840x2160@24Hz 
    VIC  94 3840x2160@25Hz 
    VIC  95 3840x2160@30Hz 
    VIC  98 4096x2160@24Hz 
    VIC  31 1920x1080@50Hz 
    VIC  16 1920x1080@60Hz 
    VIC  20 1920x1080i@50Hz 
    VIC   5 1920x1080i@60Hz 
    VIC  19 1280x720@50Hz 
    VIC   4 1280x720@60Hz 
    VIC  32 1920x1080@24Hz 
    VIC  34 1920x1080@30Hz 
    VIC  60 1280x720@24Hz 
    VIC  62 1280x720@30Hz 
    VIC  18 720x576@50Hz 
    VIC  22 1440x576i@50Hz 
    VIC   3 720x480@60Hz 
    VIC   7 1440x480i@60Hz 
    VIC  17 720x576@50Hz 
    VIC  21 1440x576i@50Hz 
    VIC   2 720x480@60Hz 
    VIC   6 1440x480i@60Hz 
    VIC   1 640x480@60Hz 
  Audio data block
    Linear PCM, max channels 6
    Supported sample rates (kHz): 192 176.4 96 88.2 48 44.1 32
    Supported sample sizes (bits): 24 20 16
    AC-3, max channels 6
    Supported sample rates (kHz): 48 44.1 32
    Maximum bit rate: 640 kHz
    DTS, max channels 6
    Supported sample rates (kHz): 48 44.1 32
    Maximum bit rate: 1504 kHz
    Dolby Digital+, max channels 8
    Supported sample rates (kHz): 48 44.1
  Speaker allocation data block
    Speaker map: FL/FR LFE FC RL/RR
  Vendor-specific data block, OUI 000c03 (HDMI)
    Source physical address 1.0.0.0
    Supports_AI
    DC_36bit
    DC_30bit
    DC_Y444
    Maximum TMDS clock: 300MHz
    Extended HDMI video details:
      HDMI VIC 0 3840x2160@30Hz
      HDMI VIC 1 3840x2160@25Hz
      HDMI VIC 2 3840x2160@24Hz
      HDMI VIC 3 4096x2160@24Hz
  Extended tag: video capability data block
    YCbCr quantization: Selectable (via AVI YQ) (1)
    RGB quantization: Selectable (via AVI Q) (1)
    PT scan behaviour: Support both over- and underscan (3)
    IT scan behaviour: Always Underscanned (2)
    CE scan behaviour: Always Overscannned (1)
  Extended tag: Colorimetry data block
    xvYCC601
    xvYCC709
    sYCC601
    AdobeYCC601
    AdobeRGB
    BT2020cYCC
    BT2020YCC
    BT2020RGB
  Extended tag: YCbCr 4:2:0 video data block
    VIC  96 3840x2160@50Hz 
    VIC  97 3840x2160@60Hz 
    VIC 101 4096x2160@50Hz 
    VIC 102 4096x2160@60Hz 
  Extended tag: HDR static metadata data block
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      Traditional gamma - HDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1
Underscans PC formats by default
Basic audio support
Supports YCbCr 4:4:4
Supports YCbCr 4:2:2
0 native detailed modes
Detailed mode: Clock 74.250 MHz, 1085 mm x 610 mm
               1920 2008 2052 2200 hborder 0
                540  542  547  562 vborder 0
               +hsync +vsync interlaced 
Checksum: 0x49 (valid)

EDID block does NOT conform to EDID 1.3!
	Detailed block string not properly terminated

--------------868851F69CA24BA48A87892F
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="Xorg.0.log"

[    19.382] 
X.Org X Server 1.19.2
Release Date: 2017-03-02
[    19.382] X Protocol Version 11, Revision 0
[    19.382] Build Operating System: Linux 3.16.0-4-amd64 x86_64 Debian
[    19.382] Current Operating System: Linux singapore 4.9.0-2-amd64 #1 SMP Debian 4.9.18-1 (2017-03-30) x86_64
[    19.382] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.9.0-2-amd64 root=UUID=4107d1db-62a3-427c-8515-c954a103ce25 ro nouveau.config=NvForcePost=1 acpi_osi=Linux text quiet
[    19.382] Build Date: 03 March 2017  03:14:41PM
[    19.382] xorg-server 2:1.19.2-1 (https://www.debian.org/support) 
[    19.382] Current version of pixman: 0.34.0
[    19.382] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    19.383] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    19.383] (==) Log file: "/var/log/Xorg.0.log", Time: Mon May  8 22:27:01 2017
[    19.383] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    19.385] (==) No Layout section.  Using the first Screen section.
[    19.385] (==) No screen section available. Using defaults.
[    19.385] (**) |-->Screen "Default Screen Section" (0)
[    19.385] (**) |   |-->Monitor "<default monitor>"
[    19.386] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    19.386] (==) Automatically adding devices
[    19.386] (==) Automatically enabling devices
[    19.386] (==) Automatically adding GPU devices
[    19.386] (==) Max clients allowed: 256, resource mask: 0x1fffff
[    19.388] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    19.388] 	Entry deleted from font path.
[    19.391] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	built-ins
[    19.391] (==) ModulePath set to "/usr/lib/xorg/modules"
[    19.391] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    19.391] (II) Loader magic: 0x56070ed62e00
[    19.391] (II) Module ABI versions:
[    19.391] 	X.Org ANSI C Emulation: 0.4
[    19.391] 	X.Org Video Driver: 23.0
[    19.391] 	X.Org XInput driver : 24.1
[    19.391] 	X.Org Server Extension : 10.0
[    19.392] (++) using VT number 7

[    19.392] (II) systemd-logind: logind integration requires -keeptty and -keeptty was not provided, disabling logind integration
[    19.393] (II) xfree86: Adding drm device (/dev/dri/card0)
[    19.397] (--) PCI:*(0:8:0:0) 10de:1401:1462:3205 rev 161, Mem @ 0xfa000000/16777216, 0xd0000000/268435456, 0xce000000/33554432, I/O @ 0x0000ec00/128, BIOS @ 0x????????/131072
[    19.397] (II) LoadModule: "glx"
[    19.398] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    19.414] (II) Module glx: vendor="X.Org Foundation"
[    19.414] 	compiled for 1.19.2, module version = 1.0.0
[    19.414] 	ABI class: X.Org Server Extension, version 10.0
[    19.414] (==) Matched nouveau as autoconfigured driver 0
[    19.414] (==) Matched nv as autoconfigured driver 1
[    19.414] (==) Matched nouveau as autoconfigured driver 2
[    19.414] (==) Matched nv as autoconfigured driver 3
[    19.414] (==) Matched modesetting as autoconfigured driver 4
[    19.414] (==) Matched fbdev as autoconfigured driver 5
[    19.414] (==) Matched vesa as autoconfigured driver 6
[    19.414] (==) Assigned the driver to the xf86ConfigLayout
[    19.414] (II) LoadModule: "nouveau"
[    19.415] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    19.419] (II) Module nouveau: vendor="X.Org Foundation"
[    19.419] 	compiled for 1.19.3, module version = 1.0.13
[    19.419] 	Module class: X.Org Video Driver
[    19.419] 	ABI class: X.Org Video Driver, version 23.0
[    19.419] (II) LoadModule: "nv"
[    19.419] (WW) Warning, couldn't open module nv
[    19.419] (II) UnloadModule: "nv"
[    19.419] (II) Unloading nv
[    19.419] (EE) Failed to load module "nv" (module does not exist, 0)
[    19.419] (II) LoadModule: "modesetting"
[    19.420] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    19.421] (II) Module modesetting: vendor="X.Org Foundation"
[    19.421] 	compiled for 1.19.2, module version = 1.19.2
[    19.421] 	Module class: X.Org Video Driver
[    19.421] 	ABI class: X.Org Video Driver, version 23.0
[    19.421] (II) LoadModule: "fbdev"
[    19.421] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    19.422] (II) Module fbdev: vendor="X.Org Foundation"
[    19.422] 	compiled for 1.19.0, module version = 0.4.4
[    19.422] 	Module class: X.Org Video Driver
[    19.422] 	ABI class: X.Org Video Driver, version 23.0
[    19.422] (II) LoadModule: "vesa"
[    19.422] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    19.423] (II) Module vesa: vendor="X.Org Foundation"
[    19.423] 	compiled for 1.19.0, module version = 2.3.4
[    19.423] 	Module class: X.Org Video Driver
[    19.423] 	ABI class: X.Org Video Driver, version 23.0
[    19.423] (II) NOUVEAU driver Date:   Tue Sep 20 00:31:06 2016 -0400
[    19.423] (II) NOUVEAU driver for NVIDIA chipset families :
[    19.423] 	RIVA TNT        (NV04)
[    19.424] 	RIVA TNT2       (NV05)
[    19.424] 	GeForce 256     (NV10)
[    19.424] 	GeForce 2       (NV11, NV15)
[    19.424] 	GeForce 4MX     (NV17, NV18)
[    19.424] 	GeForce 3       (NV20)
[    19.424] 	GeForce 4Ti     (NV25, NV28)
[    19.424] 	GeForce FX      (NV3x)
[    19.424] 	GeForce 6       (NV4x)
[    19.424] 	GeForce 7       (G7x)
[    19.424] 	GeForce 8       (G8x)
[    19.424] 	GeForce GTX 200 (NVA0)
[    19.424] 	GeForce GTX 400 (NVC0)
[    19.424] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    19.424] (II) FBDEV: driver for framebuffer: fbdev
[    19.424] (II) VESA: driver for VESA chipsets: vesa
[    19.426] (II) [drm] nouveau interface version: 1.3.1
[    19.426] (EE) Unknown chipset: NV126
[    19.426] (II) [drm] nouveau interface version: 1.3.1
[    19.426] (EE) Unknown chipset: NV126
[    19.426] (II) [drm] nouveau interface version: 1.3.1
[    19.426] (EE) Unknown chipset: NV126
[    19.426] (II) [drm] nouveau interface version: 1.3.1
[    19.426] (EE) Unknown chipset: NV126
[    19.426] (II) [drm] nouveau interface version: 1.3.1
[    19.426] (EE) Unknown chipset: NV126
[    19.427] (II) modeset(0): using drv /dev/dri/card0
[    19.427] (WW) Falling back to old probe method for fbdev
[    19.427] (II) Loading sub module "fbdevhw"
[    19.427] (II) LoadModule: "fbdevhw"
[    19.427] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    19.428] (II) Module fbdevhw: vendor="X.Org Foundation"
[    19.428] 	compiled for 1.19.2, module version = 0.0.2
[    19.428] 	ABI class: X.Org Video Driver, version 23.0
[    19.428] (WW) Falling back to old probe method for vesa
[    19.434] (II) modeset(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    19.434] (==) modeset(0): Depth 24, (==) framebuffer bpp 32
[    19.434] (==) modeset(0): RGB weight 888
[    19.434] (==) modeset(0): Default visual is TrueColor
[    19.434] (II) Loading sub module "glamoregl"
[    19.434] (II) LoadModule: "glamoregl"
[    19.434] (II) Loading /usr/lib/xorg/modules/libglamoregl.so
[    19.450] (II) Module glamoregl: vendor="X.Org Foundation"
[    19.450] 	compiled for 1.19.2, module version = 1.0.0
[    19.450] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    19.450] (II) glamor: OpenGL accelerated X.org driver based.
[    19.763] (II) glamor: EGL version 1.4 (DRI2):
[    19.783] (II) modeset(0): glamor initialized
[    19.795] (II) modeset(0): Output DVI-I-1 has no monitor section
[    19.856] (II) modeset(0): Output DP-1 has no monitor section
[    19.920] (II) modeset(0): Output DP-2 has no monitor section
[    19.984] (II) modeset(0): Output DP-3 has no monitor section
[    20.055] (II) modeset(0): Output HDMI-1 has no monitor section
[    20.067] (II) modeset(0): EDID for output DVI-I-1
[    20.128] (II) modeset(0): EDID for output DP-1
[    20.192] (II) modeset(0): EDID for output DP-2
[    20.256] (II) modeset(0): EDID for output DP-3
[    20.327] (II) modeset(0): EDID for output HDMI-1
[    20.327] (II) modeset(0): Manufacturer: SNY  Model: f303  Serial#: 16843009
[    20.327] (II) modeset(0): Year: 2016  Week: 1
[    20.327] (II) modeset(0): EDID Version: 1.3
[    20.327] (II) modeset(0): Digital Display Input
[    20.327] (II) modeset(0): Max Image Size [cm]: horiz.: 108  vert.: 61
[    20.327] (II) modeset(0): Gamma: 2.20
[    20.327] (II) modeset(0): No DPMS capabilities specified
[    20.327] (II) modeset(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    20.327] (II) modeset(0): First detailed timing is preferred mode
[    20.327] (II) modeset(0): redX: 0.625 redY: 0.340   greenX: 0.280 greenY: 0.595
[    20.327] (II) modeset(0): blueX: 0.155 blueY: 0.070   whiteX: 0.283 whiteY: 0.298
[    20.327] (II) modeset(0): Supported established timings:
[    20.327] (II) modeset(0): 640x480@60Hz
[    20.327] (II) modeset(0): 800x600@60Hz
[    20.327] (II) modeset(0): 1024x768@60Hz
[    20.327] (II) modeset(0): Manufacturer's mask: 0
[    20.327] (II) modeset(0): Supported standard timings:
[    20.327] (II) modeset(0): #0: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    20.327] (II) modeset(0): #1: hsize: 1600  vsize 900  refresh: 60  vid: 49321
[    20.327] (II) modeset(0): #2: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    20.327] (II) modeset(0): #3: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    20.327] (II) modeset(0): Supported detailed timing:
[    20.327] (II) modeset(0): clock: 148.5 MHz   Image Size:  1085 x 610 mm
[    20.327] (II) modeset(0): h_active: 1920  h_sync: 2008  h_sync_end 2052 h_blank_end 2200 h_border: 0
[    20.327] (II) modeset(0): v_active: 1080  v_sync: 1084  v_sync_end 1089 v_blanking: 1125 v_border: 0
[    20.327] (II) modeset(0): Supported detailed timing:
[    20.327] (II) modeset(0): clock: 74.2 MHz   Image Size:  1085 x 610 mm
[    20.327] (II) modeset(0): h_active: 1280  h_sync: 1390  h_sync_end 1430 h_blank_end 1650 h_border: 0
[    20.327] (II) modeset(0): v_active: 720  v_sync: 725  v_sync_end 730 v_blanking: 750 v_border: 0
[    20.327] (II) modeset(0): Monitor name: SONY TV  *00
[    20.327] (II) modeset(0): Ranges: V min: 48 V max: 62 Hz, H min: 14 H max: 70 kHz, PixClock max 305 MHz
[    20.327] (II) modeset(0): Supported detailed timing:
[    20.327] (II) modeset(0): clock: 74.2 MHz   Image Size:  1085 x 610 mm
[    20.327] (II) modeset(0): h_active: 1920  h_sync: 2008  h_sync_end 2052 h_blank_end 2200 h_border: 0
[    20.327] (II) modeset(0): v_active: 540  v_sync: 542  v_sync_end 547 v_blanking: 562 v_border: 0
[    20.327] (II) modeset(0): Number of EDID sections to follow: 1
[    20.327] (II) modeset(0): EDID (in hex):
[    20.327] (II) modeset(0): 	00ffffffffffff004dd903f301010101
[    20.327] (II) modeset(0): 	011a0103806c3d780a0dc9a057479827
[    20.327] (II) modeset(0): 	12484c2108008180a9c0714fb3000101
[    20.327] (II) modeset(0): 	010101010101023a801871382d40582c
[    20.327] (II) modeset(0): 	45003d624200001e011d007251d01e20
[    20.327] (II) modeset(0): 	6e2855003d624200001e000000fc0053
[    20.327] (II) modeset(0): 	4f4e5920545620202a30300a000000fd
[    20.327] (II) modeset(0): 	00303e0e461e000a202020202020017f
[    20.327] (II) modeset(0): 	02034df0575d5e5f621f101405130420
[    20.327] (II) modeset(0): 	223c3e1216030711150206012c0d7f07
[    20.327] (II) modeset(0): 	1507503d07bc570600830f00006e030c
[    20.327] (II) modeset(0): 	001000b83c2f008001020304e200f9e3
[    20.327] (II) modeset(0): 	05ff01e50e60616566e3060501011d80
[    20.327] (II) modeset(0): 	18711c1620582c25003d624200009e00
[    20.327] (II) modeset(0): 	00000000000000000000000000000000
[    20.327] (II) modeset(0): 	00000000000000000000000000000049
[    20.327] (--) modeset(0): HDMI max TMDS frequency 300000KHz
[    20.327] (II) modeset(0): Printing probed modes for output HDMI-1
[    20.327] (II) modeset(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    20.327] (II) modeset(0): Modeline "4096x2160"x24.0  297.00  4096 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (54.0 kHz e)
[    20.327] (II) modeset(0): Modeline "4096x2160"x24.0  296.70  4096 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (53.9 kHz e)
[    20.327] (II) modeset(0): Modeline "3840x2160"x30.0  297.00  3840 4016 4104 4400  2160 2168 2178 2250 +hsync +vsync (67.5 kHz e)
[    20.327] (II) modeset(0): Modeline "3840x2160"x25.0  297.00  3840 4896 4984 5280  2160 2168 2178 2250 +hsync +vsync (56.2 kHz e)
[    20.327] (II) modeset(0): Modeline "3840x2160"x24.0  297.00  3840 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (54.0 kHz e)
[    20.327] (II) modeset(0): Modeline "3840x2160"x30.0  296.70  3840 4016 4104 4400  2160 2168 2178 2250 +hsync +vsync (67.4 kHz e)
[    20.328] (II) modeset(0): Modeline "3840x2160"x24.0  296.70  3840 5116 5204 5500  2160 2168 2178 2250 +hsync +vsync (53.9 kHz e)
[    20.328] (II) modeset(0): Modeline "2048x1536"x60.0  266.95  2048 2200 2424 2800  1536 1537 1540 1589 -hsync +vsync (95.3 kHz d)
[    20.328] (II) modeset(0): Modeline "1856x1392"x75.0  288.00  1856 1984 2208 2560  1392 1393 1396 1500 -hsync +vsync (112.5 kHz d)
[    20.328] (II) modeset(0): Modeline "1856x1392"x60.0  218.30  1856 1952 2176 2528  1392 1393 1396 1439 -hsync +vsync (86.4 kHz d)
[    20.328] (II) modeset(0): Modeline "1792x1344"x75.0  261.00  1792 1888 2104 2456  1344 1345 1348 1417 -hsync +vsync (106.3 kHz d)
[    20.328] (II) modeset(0): Modeline "1792x1344"x60.0  204.80  1792 1920 2120 2448  1344 1345 1348 1394 -hsync +vsync (83.7 kHz d)
[    20.328] (II) modeset(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1920x1080"x50.0  148.50  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (56.2 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x59.9  148.35  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.4 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x59.9  138.50  1920 1968 2000 2080  1080 1083 1088 1111 +hsync -vsync (66.6 kHz d)
[    20.328] (II) modeset(0): Modeline "1920x1080i"x60.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080i"x50.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x30.0   74.25  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.8 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x24.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080i"x59.9   74.18  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.7 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x30.0   74.18  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (33.7 kHz e)
[    20.328] (II) modeset(0): Modeline "1920x1080"x24.0   74.18  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (93.8 kHz d)
[    20.328] (II) modeset(0): Modeline "1600x1200"x70.0  189.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (87.5 kHz d)
[    20.328] (II) modeset(0): Modeline "1600x1200"x65.0  175.50  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (81.2 kHz d)
[    20.328] (II) modeset(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1680x1050"x74.9  187.00  1680 1800 1976 2272  1050 1053 1059 1099 -hsync +vsync (82.3 kHz d)
[    20.328] (II) modeset(0): Modeline "1680x1050"x69.9  174.00  1680 1800 1976 2272  1050 1053 1059 1096 -hsync +vsync (76.6 kHz d)
[    20.328] (II) modeset(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz d)
[    20.328] (II) modeset(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    20.328] (II) modeset(0): Modeline "1600x1024"x60.2  103.12  1600 1600 1656 1664  1024 1024 1029 1030 +hsync +vsync (62.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1400x1050"x74.8  155.80  1400 1464 1784 1912  1050 1052 1064 1090 +hsync +vsync (81.5 kHz d)
[    20.328] (II) modeset(0): Modeline "1400x1050"x70.0  145.06  1400 1496 1648 1896  1050 1051 1054 1093 -hsync +vsync (76.5 kHz d)
[    20.328] (II) modeset(0): Modeline "1400x1050"x60.0  122.00  1400 1488 1640 1880  1050 1052 1064 1082 +hsync +vsync (64.9 kHz d)
[    20.328] (II) modeset(0): Modeline "1600x900"x60.0  108.00  1600 1624 1704 1800  900 901 904 1000 +hsync +vsync (60.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz d)
[    20.328] (II) modeset(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1360x768"x59.8   84.75  1360 1432 1568 1776  768 771 781 798 -hsync +vsync (47.7 kHz d)
[    20.328] (II) modeset(0): Modeline "1360x768"x60.0   72.00  1360 1408 1440 1520  768 771 781 790 +hsync -vsync (47.4 kHz d)
[    20.328] (II) modeset(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    20.328] (II) modeset(0): Modeline "1152x864"x75.0  104.99  1152 1224 1352 1552  864 865 868 902 -hsync +vsync (67.6 kHz d)
[    20.328] (II) modeset(0): Modeline "1152x864"x70.0   96.77  1152 1224 1344 1536  864 865 868 900 -hsync +vsync (63.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1152x864"x60.0   81.62  1152 1216 1336 1520  864 865 868 895 -hsync +vsync (53.7 kHz d)
[    20.328] (II) modeset(0): Modeline "1280x720"x60.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x50.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x30.0   74.25  1280 3040 3080 3300  720 725 730 750 +hsync +vsync (22.5 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x59.9   74.18  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x30.0   74.18  1280 3040 3080 3300  720 725 730 750 +hsync +vsync (22.5 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x24.0   59.40  1280 3040 3080 3300  720 725 730 750 +hsync +vsync (18.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1280x720"x24.0   59.34  1280 3040 3080 3300  720 725 730 750 +hsync +vsync (18.0 kHz e)
[    20.328] (II) modeset(0): Modeline "1024x768"x75.0  170.24  1024 1108 1220 1416  768 768 770 801 doublescan -hsync +vsync (120.2 kHz d)
[    20.328] (II) modeset(0): Modeline "1024x768"x60.0  133.47  1024 1100 1212 1400  768 768 770 794 doublescan -hsync +vsync (95.3 kHz d)
[    20.328] (II) modeset(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz d)
[    20.328] (II) modeset(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz d)
[    20.328] (II) modeset(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    20.328] (II) modeset(0): Modeline "960x720"x75.0  148.50  960 1032 1144 1320  720 720 722 750 doublescan -hsync +vsync (112.5 kHz d)
[    20.328] (II) modeset(0): Modeline "960x720"x60.0  117.00  960 1024 1128 1300  720 720 722 750 doublescan -hsync +vsync (90.0 kHz d)
[    20.328] (II) modeset(0): Modeline "928x696"x75.0  144.00  928 992 1104 1280  696 696 698 750 doublescan -hsync +vsync (112.5 kHz d)
[    20.328] (II) modeset(0): Modeline "928x696"x60.1  109.15  928 976 1088 1264  696 696 698 719 doublescan -hsync +vsync (86.4 kHz d)
[    20.328] (II) modeset(0): Modeline "896x672"x75.0  130.50  896 944 1052 1228  672 672 674 708 doublescan -hsync +vsync (106.3 kHz d)
[    20.328] (II) modeset(0): Modeline "896x672"x60.0  102.40  896 960 1060 1224  672 672 674 697 doublescan -hsync +vsync (83.7 kHz d)
[    20.328] (II) modeset(0): Modeline "960x600"x60.0   77.00  960 984 1000 1040  600 601 604 617 doublescan +hsync -vsync (74.0 kHz d)
[    20.328] (II) modeset(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz d)
[    20.328] (II) modeset(0): Modeline "960x540"x60.0   69.25  960 984 1000 1040  540 541 544 555 doublescan +hsync -vsync (66.6 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x75.0  101.25  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (93.8 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x70.0   94.50  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (87.5 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x65.0   87.75  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (81.2 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x60.0   81.00  800 832 928 1080  600 600 602 625 doublescan +hsync +vsync (75.0 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz d)
[    20.328] (II) modeset(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    20.328] (II) modeset(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz d)
[    20.328] (II) modeset(0): Modeline "840x525"x75.0   93.50  840 900 988 1136  525 526 529 549 doublescan -hsync +vsync (82.3 kHz d)
[    20.328] (II) modeset(0): Modeline "840x525"x69.9   87.00  840 900 988 1136  525 526 529 548 doublescan -hsync +vsync (76.6 kHz d)
[    20.328] (II) modeset(0): Modeline "840x525"x60.0   73.12  840 892 980 1120  525 526 529 544 doublescan -hsync +vsync (65.3 kHz d)
[    20.328] (II) modeset(0): Modeline "840x525"x59.9   59.50  840 864 880 920  525 526 529 540 doublescan +hsync -vsync (64.7 kHz d)
[    20.328] (II) modeset(0): Modeline "720x576"x50.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    20.328] (II) modeset(0): Modeline "800x512"x60.2   51.56  800 800 828 832  512 512 514 515 doublescan +hsync +vsync (62.0 kHz d)
[    20.328] (II) modeset(0): Modeline "700x525"x74.8   77.90  700 732 892 956  525 526 532 545 doublescan +hsync +vsync (81.5 kHz d)
[    20.328] (II) modeset(0): Modeline "700x525"x70.1   72.53  700 748 824 948  525 525 527 546 doublescan -hsync +vsync (76.5 kHz d)
[    20.328] (II) modeset(0): Modeline "700x525"x60.0   61.00  700 744 820 940  525 526 532 541 doublescan +hsync +vsync (64.9 kHz d)
[    20.329] (II) modeset(0): Modeline "720x480"x60.0   27.03  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    20.329] (II) modeset(0): Modeline "720x480"x59.9   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    20.329] (II) modeset(0): Modeline "640x512"x75.0   67.50  640 648 720 844  512 512 514 533 doublescan +hsync +vsync (80.0 kHz d)
[    20.329] (II) modeset(0): Modeline "640x512"x60.0   54.00  640 664 720 844  512 512 514 533 doublescan +hsync +vsync (64.0 kHz d)
[    20.329] (II) modeset(0): Modeline "720x450"x59.9   53.25  720 760 836 952  450 451 454 467 doublescan -hsync +vsync (55.9 kHz d)
[    20.329] (II) modeset(0): Modeline "640x480"x60.0   54.00  640 688 744 900  480 480 482 500 doublescan +hsync +vsync (60.0 kHz d)
[    20.329] (II) modeset(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz d)
[    20.329] (II) modeset(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz d)
[    20.329] (II) modeset(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    20.329] (II) modeset(0): Modeline "640x480"x59.9   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    20.329] (II) modeset(0): Modeline "680x384"x59.8   42.38  680 716 784 888  384 385 390 399 doublescan -hsync +vsync (47.7 kHz d)
[    20.329] (II) modeset(0): Modeline "680x384"x60.0   36.00  680 704 720 760  384 385 390 395 doublescan +hsync -vsync (47.4 kHz d)
[    20.329] (II) modeset(0): Modeline "576x432"x75.0   54.00  576 608 672 800  432 432 434 450 doublescan +hsync +vsync (67.5 kHz d)
[    20.329] (II) modeset(0): Modeline "576x432"x75.0   52.49  576 612 676 776  432 432 434 451 doublescan -hsync +vsync (67.6 kHz d)
[    20.329] (II) modeset(0): Modeline "576x432"x70.0   48.38  576 612 672 768  432 432 434 450 doublescan -hsync +vsync (63.0 kHz d)
[    20.329] (II) modeset(0): Modeline "576x432"x60.1   40.81  576 608 668 760  432 432 434 447 doublescan -hsync +vsync (53.7 kHz d)
[    20.329] (II) modeset(0): Modeline "512x384"x75.0   39.38  512 520 568 656  384 384 386 400 doublescan +hsync +vsync (60.0 kHz d)
[    20.329] (II) modeset(0): Modeline "512x384"x70.1   37.50  512 524 592 664  384 385 388 403 doublescan -hsync -vsync (56.5 kHz d)
[    20.329] (II) modeset(0): Modeline "512x384"x60.0   32.50  512 524 592 672  384 385 388 403 doublescan -hsync -vsync (48.4 kHz d)
[    20.329] (II) modeset(0): Modeline "416x312"x74.7   28.64  416 432 464 576  312 312 314 333 doublescan -hsync -vsync (49.7 kHz d)
[    20.329] (II) modeset(0): Modeline "400x300"x72.2   25.00  400 428 488 520  300 318 321 333 doublescan +hsync +vsync (48.1 kHz d)
[    20.329] (II) modeset(0): Modeline "400x300"x75.1   24.75  400 408 448 528  300 300 302 312 doublescan +hsync +vsync (46.9 kHz d)
[    20.329] (II) modeset(0): Modeline "400x300"x60.3   20.00  400 420 484 528  300 300 302 314 doublescan +hsync +vsync (37.9 kHz d)
[    20.329] (II) modeset(0): Modeline "400x300"x56.3   18.00  400 412 448 512  300 300 301 312 doublescan +hsync +vsync (35.2 kHz d)
[    20.329] (II) modeset(0): Modeline "320x240"x72.8   15.75  320 332 352 416  240 244 246 260 doublescan -hsync -vsync (37.9 kHz d)
[    20.329] (II) modeset(0): Modeline "320x240"x75.0   15.75  320 328 360 420  240 240 242 250 doublescan -hsync -vsync (37.5 kHz d)
[    20.329] (II) modeset(0): Modeline "320x240"x60.1   12.59  320 328 376 400  240 245 246 262 doublescan -hsync -vsync (31.5 kHz d)
[    20.329] (II) modeset(0): Output DVI-I-1 disconnected
[    20.329] (II) modeset(0): Output DP-1 disconnected
[    20.329] (II) modeset(0): Output DP-2 disconnected
[    20.329] (II) modeset(0): Output DP-3 disconnected
[    20.329] (II) modeset(0): Output HDMI-1 connected
[    20.329] (II) modeset(0): Using exact sizes for initial modes
[    20.329] (II) modeset(0): Output HDMI-1 using initial mode 1920x1080 +0+0
[    20.329] (==) modeset(0): Using gamma correction (1.0, 1.0, 1.0)
[    20.329] (==) modeset(0): DPI set to (96, 96)
[    20.329] (II) Loading sub module "fb"
[    20.329] (II) LoadModule: "fb"
[    20.329] (II) Loading /usr/lib/xorg/modules/libfb.so
[    20.331] (II) Module fb: vendor="X.Org Foundation"
[    20.331] 	compiled for 1.19.2, module version = 1.0.0
[    20.332] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    20.332] (II) UnloadModule: "fbdev"
[    20.332] (II) Unloading fbdev
[    20.332] (II) UnloadSubModule: "fbdevhw"
[    20.332] (II) Unloading fbdevhw
[    20.332] (II) UnloadModule: "vesa"
[    20.332] (II) Unloading vesa
[    20.332] (==) Depth 24 pixmap format is 32 bpp
[    20.404] (==) modeset(0): Backing store enabled
[    20.404] (==) modeset(0): Silken mouse enabled
[    20.405] (II) modeset(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[    20.434] (==) modeset(0): DPMS enabled
[    20.434] (II) modeset(0): [DRI2] Setup complete
[    20.434] (II) modeset(0): [DRI2]   DRI driver: nouveau
[    20.434] (II) modeset(0): [DRI2]   VDPAU driver: nouveau
[    20.434] (--) RandR disabled
[    20.438] (II) SELinux: Disabled on system
[    20.440] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    20.440] (II) AIGLX: enabled GLX_ARB_create_context
[    20.440] (II) AIGLX: enabled GLX_ARB_create_context_profile
[    20.440] (II) AIGLX: enabled GLX_EXT_create_context_es{,2}_profile
[    20.440] (II) AIGLX: enabled GLX_INTEL_swap_event
[    20.440] (II) AIGLX: enabled GLX_SGI_swap_control
[    20.440] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
[    20.440] (II) AIGLX: enabled GLX_ARB_fbconfig_float
[    20.440] (II) AIGLX: enabled GLX_EXT_fbconfig_packed_float
[    20.440] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    20.442] (II) AIGLX: Loaded and initialized nouveau
[    20.442] (II) GLX: Initialized DRI2 GL provider for screen 0
[    20.445] (II) modeset(0): Damage tracking initialized
[    20.445] (II) modeset(0): Setting screen physical size to 508 x 285
[    20.530] (II) config/udev: Adding input device Power Button (/dev/input/event9)
[    20.530] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    20.530] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    20.530] (II) LoadModule: "libinput"
[    20.530] (II) Loading /usr/lib/xorg/modules/input/libinput_drv.so
[    20.538] (II) Module libinput: vendor="X.Org Foundation"
[    20.538] 	compiled for 1.19.0, module version = 0.23.0
[    20.538] 	Module class: X.Org XInput Driver
[    20.538] 	ABI class: X.Org XInput driver, version 24.1
[    20.538] (II) Using input driver 'libinput' for 'Power Button'
[    20.538] (**) Power Button: always reports core events
[    20.538] (**) Option "Device" "/dev/input/event9"
[    20.538] (**) Option "_source" "server/udev"
[    20.539] (II) input device 'Power Button', /dev/input/event9 is tagged by udev as: Keyboard
[    20.539] (II) input device 'Power Button', /dev/input/event9 is a keyboard
[    20.560] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input12/event9"
[    20.560] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    20.560] (**) Option "xkb_model" "microsoft4000"
[    20.560] (**) Option "xkb_layout" "us"
[    20.560] (**) Option "xkb_variant" "altgr-intl"
[    20.560] (**) Option "xkb_options" "compose:caps"
[    20.588] (II) input device 'Power Button', /dev/input/event9 is tagged by udev as: Keyboard
[    20.588] (II) input device 'Power Button', /dev/input/event9 is a keyboard
[    20.588] (II) config/udev: Adding input device Power Button (/dev/input/event8)
[    20.588] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    20.588] (**) Power Button: Applying InputClass "libinput keyboard catchall"
[    20.588] (II) Using input driver 'libinput' for 'Power Button'
[    20.588] (**) Power Button: always reports core events
[    20.588] (**) Option "Device" "/dev/input/event8"
[    20.589] (**) Option "_source" "server/udev"
[    20.589] (II) input device 'Power Button', /dev/input/event8 is tagged by udev as: Keyboard
[    20.589] (II) input device 'Power Button', /dev/input/event8 is a keyboard
[    20.616] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input11/event8"
[    20.616] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    20.616] (**) Option "xkb_model" "microsoft4000"
[    20.616] (**) Option "xkb_layout" "us"
[    20.616] (**) Option "xkb_variant" "altgr-intl"
[    20.616] (**) Option "xkb_options" "compose:caps"
[    20.616] (II) input device 'Power Button', /dev/input/event8 is tagged by udev as: Keyboard
[    20.616] (II) input device 'Power Button', /dev/input/event8 is a keyboard
[    20.617] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=3 (/dev/input/event12)
[    20.617] (II) No input driver specified, ignoring this device.
[    20.617] (II) This device may have been added with another device file.
[    20.618] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=7 (/dev/input/event13)
[    20.618] (II) No input driver specified, ignoring this device.
[    20.618] (II) This device may have been added with another device file.
[    20.618] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=8 (/dev/input/event14)
[    20.618] (II) No input driver specified, ignoring this device.
[    20.618] (II) This device may have been added with another device file.
[    20.618] (II) config/udev: Adding input device HDA NVidia HDMI/DP,pcm=9 (/dev/input/event15)
[    20.618] (II) No input driver specified, ignoring this device.
[    20.619] (II) This device may have been added with another device file.
[    20.619] (II) config/udev: Adding input device Microsoft Microsoft® 2.4GHz Transceiver v7.0 (/dev/input/event2)
[    20.619] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev keyboard catchall"
[    20.619] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput keyboard catchall"
[    20.619] (II) Using input driver 'libinput' for 'Microsoft Microsoft® 2.4GHz Transceiver v7.0'
[    20.619] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: always reports core events
[    20.619] (**) Option "Device" "/dev/input/event2"
[    20.619] (**) Option "_source" "server/udev"
[    20.620] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event2 is tagged by udev as: Keyboard
[    20.620] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event2 is a keyboard
[    20.636] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.1/6-1.1:1.0/0003:045E:0745.0003/input/input5/event2"
[    20.636] (II) XINPUT: Adding extended input device "Microsoft Microsoft® 2.4GHz Transceiver v7.0" (type: KEYBOARD, id 8)
[    20.636] (**) Option "xkb_model" "microsoft4000"
[    20.636] (**) Option "xkb_layout" "us"
[    20.636] (**) Option "xkb_variant" "altgr-intl"
[    20.636] (**) Option "xkb_options" "compose:caps"
[    20.636] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event2 is tagged by udev as: Keyboard
[    20.637] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event2 is a keyboard
[    20.637] (II) config/udev: Adding input device Microsoft Microsoft® 2.4GHz Transceiver v7.0 (/dev/input/event3)
[    20.637] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev pointer catchall"
[    20.637] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev keyboard catchall"
[    20.637] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput pointer catchall"
[    20.637] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput keyboard catchall"
[    20.637] (II) Using input driver 'libinput' for 'Microsoft Microsoft® 2.4GHz Transceiver v7.0'
[    20.637] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: always reports core events
[    20.637] (**) Option "Device" "/dev/input/event3"
[    20.637] (**) Option "_source" "server/udev"
[    20.638] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is tagged by udev as: Keyboard Mouse
[    20.638] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is a pointer caps
[    20.638] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is a keyboard
[    20.652] (II) libinput: Microsoft Microsoft® 2.4GHz Transceiver v7.0: needs a virtual subdevice
[    20.652] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.1/6-1.1:1.1/0003:045E:0745.0004/input/input6/event3"
[    20.652] (II) XINPUT: Adding extended input device "Microsoft Microsoft® 2.4GHz Transceiver v7.0" (type: MOUSE, id 9)
[    20.652] (**) Option "AccelerationScheme" "none"
[    20.652] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) selected scheme none/0
[    20.652] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) acceleration factor: 2.000
[    20.652] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) acceleration threshold: 4
[    20.653] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is tagged by udev as: Keyboard Mouse
[    20.653] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is a pointer caps
[    20.653] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event3 is a keyboard
[    20.653] (II) config/udev: Adding input device Microsoft Microsoft® 2.4GHz Transceiver v7.0 (/dev/input/mouse0)
[    20.653] (II) No input driver specified, ignoring this device.
[    20.653] (II) This device may have been added with another device file.
[    20.654] (II) config/udev: Adding input device Microsoft Microsoft® 2.4GHz Transceiver v7.0 (/dev/input/event4)
[    20.654] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev keyboard catchall"
[    20.654] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput keyboard catchall"
[    20.654] (II) Using input driver 'libinput' for 'Microsoft Microsoft® 2.4GHz Transceiver v7.0'
[    20.654] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: always reports core events
[    20.654] (**) Option "Device" "/dev/input/event4"
[    20.654] (**) Option "_source" "server/udev"
[    20.655] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event4 is tagged by udev as: Keyboard
[    20.655] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event4 is a keyboard
[    20.668] (II) libinput: Microsoft Microsoft® 2.4GHz Transceiver v7.0: needs a virtual subdevice
[    20.668] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.1/6-1.1:1.2/0003:045E:0745.0005/input/input7/event4"
[    20.668] (II) XINPUT: Adding extended input device "Microsoft Microsoft® 2.4GHz Transceiver v7.0" (type: MOUSE, id 10)
[    20.668] (**) Option "AccelerationScheme" "none"
[    20.668] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) selected scheme none/0
[    20.668] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) acceleration factor: 2.000
[    20.668] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: (accel) acceleration threshold: 4
[    20.668] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event4 is tagged by udev as: Keyboard
[    20.668] (II) input device 'Microsoft Microsoft® 2.4GHz Transceiver v7.0', /dev/input/event4 is a keyboard
[    20.669] (II) config/udev: Adding input device FV TouchCam N1 (/dev/input/event11)
[    20.669] (**) FV TouchCam N1: Applying InputClass "evdev keyboard catchall"
[    20.669] (**) FV TouchCam N1: Applying InputClass "libinput keyboard catchall"
[    20.669] (II) Using input driver 'libinput' for 'FV TouchCam N1'
[    20.669] (**) FV TouchCam N1: always reports core events
[    20.669] (**) Option "Device" "/dev/input/event11"
[    20.669] (**) Option "_source" "server/udev"
[    20.670] (II) input device 'FV TouchCam N1', /dev/input/event11 is tagged by udev as: Keyboard
[    20.670] (II) input device 'FV TouchCam N1', /dev/input/event11 is a keyboard
[    20.708] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.3/6-1.3.2/6-1.3.2:1.0/input/input14/event11"
[    20.708] (II) XINPUT: Adding extended input device "FV TouchCam N1" (type: KEYBOARD, id 11)
[    20.708] (**) Option "xkb_model" "microsoft4000"
[    20.708] (**) Option "xkb_layout" "us"
[    20.708] (**) Option "xkb_variant" "altgr-intl"
[    20.708] (**) Option "xkb_options" "compose:caps"
[    20.708] (II) input device 'FV TouchCam N1', /dev/input/event11 is tagged by udev as: Keyboard
[    20.708] (II) input device 'FV TouchCam N1', /dev/input/event11 is a keyboard
[    20.709] (II) config/udev: Adding input device faceVsion FV Audio (/dev/input/event7)
[    20.709] (II) No input driver specified, ignoring this device.
[    20.709] (II) This device may have been added with another device file.
[    20.710] (II) config/udev: Adding input device Microsoft Natural® Ergonomic Keyboard 4000 (/dev/input/event0)
[    20.710] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "evdev keyboard catchall"
[    20.710] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "libinput keyboard catchall"
[    20.710] (II) Using input driver 'libinput' for 'Microsoft Natural® Ergonomic Keyboard 4000'
[    20.710] (**) Microsoft Natural® Ergonomic Keyboard 4000: always reports core events
[    20.710] (**) Option "Device" "/dev/input/event0"
[    20.710] (**) Option "_source" "server/udev"
[    20.710] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event0 is tagged by udev as: Keyboard
[    20.710] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event0 is a keyboard
[    20.728] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb4/4-2/4-2:1.0/0003:045E:00DB.0001/input/input3/event0"
[    20.728] (II) XINPUT: Adding extended input device "Microsoft Natural® Ergonomic Keyboard 4000" (type: KEYBOARD, id 12)
[    20.728] (**) Option "xkb_model" "microsoft4000"
[    20.728] (**) Option "xkb_layout" "us"
[    20.728] (**) Option "xkb_variant" "altgr-intl"
[    20.728] (**) Option "xkb_options" "compose:caps"
[    20.728] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event0 is tagged by udev as: Keyboard
[    20.728] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event0 is a keyboard
[    20.729] (II) config/udev: Adding input device Microsoft Natural® Ergonomic Keyboard 4000 (/dev/input/event1)
[    20.729] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "evdev keyboard catchall"
[    20.729] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "libinput keyboard catchall"
[    20.729] (II) Using input driver 'libinput' for 'Microsoft Natural® Ergonomic Keyboard 4000'
[    20.729] (**) Microsoft Natural® Ergonomic Keyboard 4000: always reports core events
[    20.729] (**) Option "Device" "/dev/input/event1"
[    20.729] (**) Option "_source" "server/udev"
[    20.730] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event1 is tagged by udev as: Keyboard
[    20.730] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event1 is a keyboard
[    20.752] (II) libinput: Microsoft Natural® Ergonomic Keyboard 4000: needs a virtual subdevice
[    20.752] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb4/4-2/4-2:1.1/0003:045E:00DB.0002/input/input4/event1"
[    20.752] (II) XINPUT: Adding extended input device "Microsoft Natural® Ergonomic Keyboard 4000" (type: MOUSE, id 13)
[    20.752] (**) Option "AccelerationScheme" "none"
[    20.752] (**) Microsoft Natural® Ergonomic Keyboard 4000: (accel) selected scheme none/0
[    20.752] (**) Microsoft Natural® Ergonomic Keyboard 4000: (accel) acceleration factor: 2.000
[    20.752] (**) Microsoft Natural® Ergonomic Keyboard 4000: (accel) acceleration threshold: 4
[    20.752] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event1 is tagged by udev as: Keyboard
[    20.752] (II) input device 'Microsoft Natural® Ergonomic Keyboard 4000', /dev/input/event1 is a keyboard
[    20.753] (II) config/udev: Adding input device American Megatrends Inc. Virtual Keyboard and Mouse (/dev/input/event5)
[    20.753] (**) American Megatrends Inc. Virtual Keyboard and Mouse: Applying InputClass "evdev keyboard catchall"
[    20.753] (**) American Megatrends Inc. Virtual Keyboard and Mouse: Applying InputClass "libinput keyboard catchall"
[    20.753] (II) Using input driver 'libinput' for 'American Megatrends Inc. Virtual Keyboard and Mouse'
[    20.753] (**) American Megatrends Inc. Virtual Keyboard and Mouse: always reports core events
[    20.753] (**) Option "Device" "/dev/input/event5"
[    20.753] (**) Option "_source" "server/udev"
[    20.754] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event5 is tagged by udev as: Keyboard
[    20.754] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event5 is a keyboard
[    20.788] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb7/7-5/7-5.1/7-5.1:1.0/0003:046B:FF10.0006/input/input8/event5"
[    20.788] (II) XINPUT: Adding extended input device "American Megatrends Inc. Virtual Keyboard and Mouse" (type: KEYBOARD, id 14)
[    20.788] (**) Option "xkb_model" "microsoft4000"
[    20.788] (**) Option "xkb_layout" "us"
[    20.788] (**) Option "xkb_variant" "altgr-intl"
[    20.788] (**) Option "xkb_options" "compose:caps"
[    20.789] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event5 is tagged by udev as: Keyboard
[    20.789] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event5 is a keyboard
[    20.789] (II) config/udev: Adding input device American Megatrends Inc. Virtual Keyboard and Mouse (/dev/input/event6)
[    20.789] (**) American Megatrends Inc. Virtual Keyboard and Mouse: Applying InputClass "evdev pointer catchall"
[    20.789] (**) American Megatrends Inc. Virtual Keyboard and Mouse: Applying InputClass "libinput pointer catchall"
[    20.789] (II) Using input driver 'libinput' for 'American Megatrends Inc. Virtual Keyboard and Mouse'
[    20.789] (**) American Megatrends Inc. Virtual Keyboard and Mouse: always reports core events
[    20.789] (**) Option "Device" "/dev/input/event6"
[    20.789] (**) Option "_source" "server/udev"
[    20.790] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event6 is tagged by udev as: Mouse
[    20.790] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event6 is a pointer caps
[    20.820] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.7/usb7/7-5/7-5.1/7-5.1:1.1/0003:046B:FF10.0007/input/input9/event6"
[    20.820] (II) XINPUT: Adding extended input device "American Megatrends Inc. Virtual Keyboard and Mouse" (type: MOUSE, id 15)
[    20.820] (**) Option "AccelerationScheme" "none"
[    20.820] (**) American Megatrends Inc. Virtual Keyboard and Mouse: (accel) selected scheme none/0
[    20.820] (**) American Megatrends Inc. Virtual Keyboard and Mouse: (accel) acceleration factor: 2.000
[    20.820] (**) American Megatrends Inc. Virtual Keyboard and Mouse: (accel) acceleration threshold: 4
[    20.820] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event6 is tagged by udev as: Mouse
[    20.820] (II) input device 'American Megatrends Inc. Virtual Keyboard and Mouse', /dev/input/event6 is a pointer caps
[    20.821] (II) config/udev: Adding input device American Megatrends Inc. Virtual Keyboard and Mouse (/dev/input/js0)
[    20.821] (II) No input driver specified, ignoring this device.
[    20.821] (II) This device may have been added with another device file.
[    20.822] (II) config/udev: Adding input device American Megatrends Inc. Virtual Keyboard and Mouse (/dev/input/mouse1)
[    20.822] (II) No input driver specified, ignoring this device.
[    20.822] (II) This device may have been added with another device file.
[    20.822] (II) config/udev: Adding input device PC Speaker (/dev/input/event10)
[    20.822] (II) No input driver specified, ignoring this device.
[    20.822] (II) This device may have been added with another device file.
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev pointer catchall"
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev keyboard catchall"
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput pointer catchall"
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput keyboard catchall"
[    20.827] (II) Using input driver 'libinput' for 'Microsoft Microsoft® 2.4GHz Transceiver v7.0'
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: always reports core events
[    20.827] (**) Option "Device" "/dev/input/event3"
[    20.827] (**) Option "_source" "_driver/libinput"
[    20.827] (II) libinput: Microsoft Microsoft® 2.4GHz Transceiver v7.0: is a virtual subdevice
[    20.827] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.1/6-1.1:1.1/0003:045E:0745.0004/input/input6/event3"
[    20.827] (II) XINPUT: Adding extended input device "Microsoft Microsoft® 2.4GHz Transceiver v7.0" (type: KEYBOARD, id 16)
[    20.827] (**) Option "xkb_model" "microsoft4000"
[    20.827] (**) Option "xkb_layout" "us"
[    20.827] (**) Option "xkb_variant" "altgr-intl"
[    20.827] (**) Option "xkb_options" "compose:caps"
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "evdev keyboard catchall"
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: Applying InputClass "libinput keyboard catchall"
[    20.827] (II) Using input driver 'libinput' for 'Microsoft Microsoft® 2.4GHz Transceiver v7.0'
[    20.827] (**) Microsoft Microsoft® 2.4GHz Transceiver v7.0: always reports core events
[    20.827] (**) Option "Device" "/dev/input/event4"
[    20.827] (**) Option "_source" "_driver/libinput"
[    20.827] (II) libinput: Microsoft Microsoft® 2.4GHz Transceiver v7.0: is a virtual subdevice
[    20.828] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1a.7/usb6/6-1/6-1.1/6-1.1:1.2/0003:045E:0745.0005/input/input7/event4"
[    20.828] (II) XINPUT: Adding extended input device "Microsoft Microsoft® 2.4GHz Transceiver v7.0" (type: KEYBOARD, id 17)
[    20.828] (**) Option "xkb_model" "microsoft4000"
[    20.828] (**) Option "xkb_layout" "us"
[    20.828] (**) Option "xkb_variant" "altgr-intl"
[    20.828] (**) Option "xkb_options" "compose:caps"
[    20.828] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "evdev keyboard catchall"
[    20.828] (**) Microsoft Natural® Ergonomic Keyboard 4000: Applying InputClass "libinput keyboard catchall"
[    20.828] (II) Using input driver 'libinput' for 'Microsoft Natural® Ergonomic Keyboard 4000'
[    20.828] (**) Microsoft Natural® Ergonomic Keyboard 4000: always reports core events
[    20.828] (**) Option "Device" "/dev/input/event1"
[    20.828] (**) Option "_source" "_driver/libinput"
[    20.828] (II) libinput: Microsoft Natural® Ergonomic Keyboard 4000: is a virtual subdevice
[    20.828] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb4/4-2/4-2:1.1/0003:045E:00DB.0002/input/input4/event1"
[    20.828] (II) XINPUT: Adding extended input device "Microsoft Natural® Ergonomic Keyboard 4000" (type: KEYBOARD, id 18)
[    20.828] (**) Option "xkb_model" "microsoft4000"
[    20.828] (**) Option "xkb_layout" "us"
[    20.828] (**) Option "xkb_variant" "altgr-intl"
[    20.828] (**) Option "xkb_options" "compose:caps"
[    24.122] (II) modeset(0): Disabling kernel dirty updates, not required.
[    33.311] (II) modeset(0): EDID vendor "SNY", prod id 62211
[    33.311] (II) modeset(0): Using EDID range info for horizontal sync
[    33.311] (II) modeset(0): Using EDID range info for vertical refresh
[    33.311] (II) modeset(0): Printing DDC gathered Modelines:
[    33.311] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    33.311] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    33.311] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    33.311] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    33.311] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    33.311] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    33.311] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    33.311] (II) modeset(0): Modeline "1600x900"x60.0  119.00  1600 1696 1864 2128  900 901 904 932 -hsync +vsync (55.9 kHz e)
[    33.311] (II) modeset(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    33.311] (II) modeset(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    33.311] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    33.311] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    33.311] (II) modeset(0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    33.311] (II) modeset(0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[    33.311] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    33.311] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (28.1 kHz e)
[    33.311] (II) modeset(0): Modeline "2880x480"x0.0  108.00  2880 2944 3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    33.311] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 3700 3740 3960  720 725 730 750 +hsync +vsync (18.8 kHz e)
[    33.311] (II) modeset(0): Modeline "1920x1080"x0.0  297.00  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (135.0 kHz e)
[    33.311] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    33.311] (II) modeset(0): Modeline "1440x288"x0.0   27.00  1440 1464 1590 1728  288 290 293 312 -hsync -vsync (15.6 kHz e)
[    33.311] (II) modeset(0): Modeline "1440x240"x0.0   27.00  1440 1478 1602 1716  240 244 247 262 -hsync -vsync (15.7 kHz e)
[    33.311] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    33.312] (--) modeset(0): HDMI max TMDS frequency 300000KHz
[    33.404] (II) modeset(0): Allocate new frame buffer 3840x2160 stride
[    34.591] (II) modeset(0): EDID vendor "SNY", prod id 62211
[    34.591] (II) modeset(0): Using hsync ranges from config file
[    34.591] (II) modeset(0): Using vrefresh ranges from config file
[    34.591] (II) modeset(0): Printing DDC gathered Modelines:
[    34.591] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    34.591] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[    34.591] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[    34.591] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    34.591] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    34.591] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    34.591] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    34.591] (II) modeset(0): Modeline "1600x900"x60.0  119.00  1600 1696 1864 2128  900 901 904 932 -hsync +vsync (55.9 kHz e)
[    34.591] (II) modeset(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    34.591] (II) modeset(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    34.591] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[    34.591] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[    34.591] (II) modeset(0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[    34.591] (II) modeset(0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[    34.591] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[    34.591] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (28.1 kHz e)
[    34.591] (II) modeset(0): Modeline "2880x480"x0.0  108.00  2880 2944 3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    34.591] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 3700 3740 3960  720 725 730 750 +hsync +vsync (18.8 kHz e)
[    34.591] (II) modeset(0): Modeline "1920x1080"x0.0  297.00  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (135.0 kHz e)
[    34.591] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[    34.591] (II) modeset(0): Modeline "1440x288"x0.0   27.00  1440 1464 1590 1728  288 290 293 312 -hsync -vsync (15.6 kHz e)
[    34.591] (II) modeset(0): Modeline "1440x240"x0.0   27.00  1440 1478 1602 1716  240 244 247 262 -hsync -vsync (15.7 kHz e)
[    34.591] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[    34.591] (--) modeset(0): HDMI max TMDS frequency 300000KHz
[  1159.067] (II) modeset(0): EDID vendor "SNY", prod id 62211
[  1159.067] (II) modeset(0): Using hsync ranges from config file
[  1159.067] (II) modeset(0): Using vrefresh ranges from config file
[  1159.067] (II) modeset(0): Printing DDC gathered Modelines:
[  1159.067] (II) modeset(0): Modeline "1920x1080"x0.0  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[  1159.067] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1390 1430 1650  720 725 730 750 +hsync +vsync (45.0 kHz e)
[  1159.067] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2008 2052 2200  1080 1084 1094 1125 interlace +hsync +vsync (33.8 kHz e)
[  1159.067] (II) modeset(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[  1159.067] (II) modeset(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[  1159.067] (II) modeset(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[  1159.067] (II) modeset(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[  1159.067] (II) modeset(0): Modeline "1600x900"x60.0  119.00  1600 1696 1864 2128  900 901 904 932 -hsync +vsync (55.9 kHz e)
[  1159.067] (II) modeset(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[  1159.067] (II) modeset(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[  1159.067] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2558 2602 2750  1080 1084 1089 1125 +hsync +vsync (27.0 kHz e)
[  1159.067] (II) modeset(0): Modeline "720x576"x0.0   27.00  720 732 796 864  576 581 586 625 -hsync -vsync (31.2 kHz e)
[  1159.067] (II) modeset(0): Modeline "1440x576i"x0.0   27.00  1440 1464 1590 1728  576 580 586 625 interlace -hsync -vsync (15.6 kHz e)
[  1159.067] (II) modeset(0): Modeline "1440x480i"x0.0   27.00  1440 1478 1602 1716  480 488 494 525 interlace -hsync -vsync (15.7 kHz e)
[  1159.067] (II) modeset(0): Modeline "1920x1080i"x0.0   74.25  1920 2448 2492 2640  1080 1084 1094 1125 interlace +hsync +vsync (28.1 kHz e)
[  1159.067] (II) modeset(0): Modeline "1920x1080"x0.0   74.25  1920 2448 2492 2640  1080 1084 1089 1125 +hsync +vsync (28.1 kHz e)
[  1159.067] (II) modeset(0): Modeline "2880x480"x0.0  108.00  2880 2944 3192 3432  480 489 495 525 -hsync -vsync (31.5 kHz e)
[  1159.067] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 3700 3740 3960  720 725 730 750 +hsync +vsync (18.8 kHz e)
[  1159.067] (II) modeset(0): Modeline "1920x1080"x0.0  297.00  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync (135.0 kHz e)
[  1159.067] (II) modeset(0): Modeline "1280x720"x0.0   74.25  1280 1720 1760 1980  720 725 730 750 +hsync +vsync (37.5 kHz e)
[  1159.067] (II) modeset(0): Modeline "1440x288"x0.0   27.00  1440 1464 1590 1728  288 290 293 312 -hsync -vsync (15.6 kHz e)
[  1159.067] (II) modeset(0): Modeline "1440x240"x0.0   27.00  1440 1478 1602 1716  240 244 247 262 -hsync -vsync (15.7 kHz e)
[  1159.067] (II) modeset(0): Modeline "720x480"x0.0   27.00  720 736 798 858  480 489 495 525 -hsync -vsync (31.5 kHz e)
[  1159.067] (--) modeset(0): HDMI max TMDS frequency 300000KHz

--------------868851F69CA24BA48A87892F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--------------868851F69CA24BA48A87892F--

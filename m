From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Sat, 13 Dec 2014 18:04:13 +0000
Message-ID: <bug-82714-8800-nZeTC942Tn@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1728639059=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1728639059==
Content-Type: multipart/alternative; boundary="1418493853.B417B1.15571"; charset="UTF-8"


--1418493853.B417B1.15571
Date: Sat, 13 Dec 2014 18:04:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #5 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
After fresh boot:
echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/reset


Kernel log for modprobe nouveau debug=0xff:
2014-12-13 18:55:58.978720 +0100 [  108.870465] nouveau 0000:01:00.0: enabling
device (0004 -> 0007)
2014-12-13 18:55:58.981262 +0100 [  108.873035] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x084000a2
2014-12-13 18:55:58.982499 +0100 [  108.874310] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G84 (NV84)
2014-12-13 18:55:58.983988 +0100 [  108.875563] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
2014-12-13 18:55:58.985544 +0100 [  108.877111] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
2014-12-13 18:55:58.988741 +0100 [  108.878603] nouveau  [  
VBIOS][0000:01:00.0] ... signature not found
2014-12-13 18:55:58.991752 +0100 [  108.878605] nouveau  [  
VBIOS][0000:01:00.0] checking PROM for image...
2014-12-13 18:55:59.087159 +0100 [  108.978689] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
2014-12-13 18:55:59.088639 +0100 [  108.980177] nouveau  [  
VBIOS][0000:01:00.0] using image from PROM
2014-12-13 18:55:59.090312 +0100 [  108.981855] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
2014-12-13 18:55:59.091785 +0100 [  108.983331] nouveau  [  
VBIOS][0000:01:00.0] version 60.84.32.00.00
2014-12-13 18:55:59.094152 +0100 [  108.985929] nouveau  [
DEVINIT][0000:01:00.0] adaptor not initialised
2014-12-13 18:55:59.095419 +0100 [  108.987214] nouveau  [  
VBIOS][0000:01:00.0] running init tables
2014-12-13 18:55:59.158069 +0100 [  109.049842] nouveau 0000:01:00.0: irq 38
for MSI/MSI-X
2014-12-13 18:55:59.159330 +0100 [  109.051094] nouveau  [    
PMC][0000:01:00.0] MSI interrupts enabled
2014-12-13 18:55:59.160647 +0100 [  109.052409] nouveau  [    
PFB][0000:01:00.0] RAM type: GDDR3
2014-12-13 18:55:59.161877 +0100 [  109.053646] nouveau  [    
PFB][0000:01:00.0] RAM size: 512 MiB
2014-12-13 18:55:59.163115 +0100 [  109.054884] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 1892 tags
2014-12-13 18:55:59.168203 +0100 [  109.058900] nouveau  [   
VOLT][0000:01:00.0] GPU voltage: 1300000uv
2014-12-13 18:55:59.200094 +0100 [  109.089940] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: PWM
2014-12-13 18:55:59.203197 +0100 [  109.093119] nouveau  [ 
PTHERM][0000:01:00.0] fan management: automatic
2014-12-13 18:55:59.206283 +0100 [  109.096221] nouveau  [ 
PTHERM][0000:01:00.0] internal sensor: yes
2014-12-13 18:55:59.229500 +0100 [  109.119368] nouveau  [    
CLK][0000:01:00.0] 20: core 675 MHz shader 1450 MHz memory 1008 MHz
2014-12-13 18:55:59.232628 +0100 [  109.122527] nouveau  [    
CLK][0000:01:00.0] --: core 675 MHz shader 1458 MHz memory 900 MHz
2014-12-13 18:55:59.236536 +0100 [  109.126342] nouveau E[   
PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
2014-12-13 18:55:59.238046 +0100 [  109.129998] nouveau E[   
PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94
2014-12-13 18:55:59.239145 +0100 [  109.130208] nouveau  [     DRM] VRAM: 512
MiB
2014-12-13 18:55:59.239932 +0100 [  109.130210] nouveau  [     DRM] GART:
1048576 MiB
2014-12-13 18:55:59.240840 +0100 [  109.130215] nouveau  [     DRM] TMDS table
version 2.0
2014-12-13 18:55:59.241762 +0100 [  109.130216] nouveau  [     DRM] DCB version
4.0
2014-12-13 18:55:59.242703 +0100 [  109.130219] nouveau  [     DRM] DCB outp
00: 01000302 00020030
2014-12-13 18:55:59.243647 +0100 [  109.130222] nouveau  [     DRM] DCB outp
01: 02000300 00000028
2014-12-13 18:55:59.244579 +0100 [  109.130223] nouveau  [     DRM] DCB outp
02: 04012310 00000028
2014-12-13 18:55:59.245498 +0100 [  109.130225] nouveau  [     DRM] DCB outp
03: 02021322 00020010
2014-12-13 18:55:59.246404 +0100 [  109.130228] nouveau  [     DRM] DCB conn
00: 1030
2014-12-13 18:55:59.247372 +0100 [  109.130230] nouveau  [     DRM] DCB conn
01: 2161
2014-12-13 18:55:59.248262 +0100 [  109.130232] nouveau  [     DRM] DCB conn
02: 0200
2014-12-13 18:55:59.249077 +0100 [  109.130233] nouveau  [     DRM] DCB conn
03: 0362
2014-12-13 18:55:59.676841 +0100 [  109.568760] Clocksource tsc unstable (delta
= -209683361 ns)
2014-12-13 18:56:02.441389 +0100 [  112.331833] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
2014-12-13 18:56:02.443054 +0100 [  112.333514] [drm] Driver supports precise
vblank timestamp query.
2014-12-13 18:56:02.465236 +0100 [  112.355653] nouveau  [     DRM] MM: using
CRYPT for buffer copies
2014-12-13 18:56:02.466331 +0100 [  112.357576] Switched to clocksource hpet
2014-12-13 18:56:04.057120 +0100 [  113.947900] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 127
2014-12-13 18:56:04.105137 +0100 [  113.995905] nouveau  [     DRM] allocated
1280x1024 fb: 0x70000, bo ffff880213fe51e0
2014-12-13 18:56:04.106399 +0100 [  113.997151] nouveau 0000:01:00.0: fb1:
nouveaufb frame buffer device
2014-12-13 18:56:04.107311 +0100 [  113.998096] [drm] Initialized nouveau 1.2.1
20120801 for 0000:01:00.0 on minor 1

starting Xorg here

2014-12-13 18:57:13.724675 +0100 [  183.597870] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=io+mem,decodes=none:owns=none
2014-12-13 18:57:13.724735 +0100 [  183.597895] vgaarb: device changed decodes:
PCI:0000:00:01.0,olddecodes=io+mem,decodes=none:owns=io+mem
2014-12-13 18:57:15.469354 +0100 [  185.342086] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:17.474564 +0100 [  187.346760] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:19.547083 +0100 [  189.418737] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:21.547125 +0100 [  191.418262] nouveau E[     
VM][0000:01:00.0] vm flush timeout: engine 6
2014-12-13 18:57:23.548308 +0100 [  193.418911] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:25.548260 +0100 [  195.418337] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:27.548232 +0100 [  197.417778] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:29.548328 +0100 [  199.417341] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:31.548318 +0100 [  201.416804] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:33.549819 +0100 [  203.417748] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:35.550309 +0100 [  205.417730] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:37.550646 +0100 [  207.417540] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:39.551014 +0100 [  209.417377] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:41.555729 +0100 [  211.421537] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:43.555982 +0100 [  213.421276] nouveau E[     
VM][0000:01:00.0] vm flush timeout: engine 6
2014-12-13 18:57:45.156695 +0100 [  215.021538] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:46.747471 +0100 [  216.611900] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:48.747555 +0100 [  218.611475] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:50.747571 +0100 [  220.610958] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:52.747572 +0100 [  222.610437] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:54.747576 +0100 [  224.609909] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:56.747582 +0100 [  226.609387] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout


Xorg log (stderr, started as /usr/bin/Xorg -noreset -nolisten tcp -verbose
vt7):
X.Org X Server 1.15.0
Release Date: 2013-12-27
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.17.0-kvm x86_64 Gentoo
Current Operating System: Linux sisyphe 3.18.0-kvm #1 SMP Mon Dec 8 19:05:52
CET 2014 x86_64
Kernel command line: slub_debug=FZP root=/dev/sda2 iommu=1 
Build Date: 26 October 2014  07:21:14PM

Current version of pixman: 0.32.4
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Sat Dec 13 18:56:58 2014
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
(==) No Layout section.  Using the first Screen section.
(==) No screen section available. Using defaults.
(**) |-->Screen "Default Screen Section" (0)
(**) |   |-->Monitor "<default monitor>"
(==) No device specified for screen "Default Screen Section".
        Using the first device section listed.
(**) |   |-->Device "nvidia"
(==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
(==) Automatically adding devices
(==) Automatically enabling devices
(==) Automatically adding GPU devices
(WW) The directory "/usr/share/fonts/TTF/" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/share/fonts/OTF/" does not exist.
        Entry deleted from font path.
(WW) The directory "/usr/share/fonts/Type1/" does not exist.
        Entry deleted from font path.
(WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/100dpi/".
        Entry deleted from font path.
        (Run 'mkfontdir' on "/usr/share/fonts/100dpi/").
(WW) `fonts.dir' not found (or not valid) in "/usr/share/fonts/75dpi/".
        Entry deleted from font path.
        (Run 'mkfontdir' on "/usr/share/fonts/75dpi/").
(==) FontPath set to:
        /usr/share/fonts/misc/
(==) ModulePath set to "/usr/lib64/xorg/modules"
(II) The server relies on udev to provide the list of input devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
(II) xfree86: Adding drm device (/dev/dri/card0)
(II) xfree86: Adding drm device (/dev/dri/card1)
(--) PCI:*(0:0:1:0) 1002:9640:1458:d000 rev 0, Mem @ 0xc0000000/268435456,
0xfdfc0000/262144, I/O @ 0x0000f800/256
(--) PCI: (0:1:0:0) 10de:0400:0000:0000 rev 161, Mem @ 0xfa000000/16777216,
0xd0000000/268435456, 0xf8000000/33554432, I/O @ 0x0000df00/128, BIOS @
0x????????/131072
Initializing built-in extension Generic Event Extension
Initializing built-in extension SHAPE
Initializing built-in extension MIT-SHM
Initializing built-in extension XInputExtension
Initializing built-in extension XTEST
Initializing built-in extension BIG-REQUESTS
Initializing built-in extension SYNC
Initializing built-in extension XKEYBOARD
Initializing built-in extension XC-MISC
Initializing built-in extension XINERAMA
Initializing built-in extension XFIXES
Initializing built-in extension RENDER
Initializing built-in extension RANDR
Initializing built-in extension COMPOSITE
Initializing built-in extension DAMAGE
Initializing built-in extension MIT-SCREEN-SAVER
Initializing built-in extension DOUBLE-BUFFER
Initializing built-in extension RECORD
Initializing built-in extension DPMS
Initializing built-in extension Present
Initializing built-in extension DRI3
Initializing built-in extension X-Resource
Initializing built-in extension XVideo
Initializing built-in extension XVideo-MotionCompensation
Initializing built-in extension XFree86-VidModeExtension
Initializing built-in extension XFree86-DGA
Initializing built-in extension XFree86-DRI
Initializing built-in extension DRI2
(II) "glx" will be loaded by default.
(II) Loading /usr/lib64/xorg/modules/libglamoregl.so
(II) Module glamoregl: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 0.6.0
(II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 1.0.0
(==) AIGLX enabled
Loading extension GLX
(II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 1.0.10
(II) NOUVEAU driver 
(II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT        (NV04)
        RIVA TNT2       (NV05)
        GeForce 256     (NV10)
        GeForce 2       (NV11, NV15)
        GeForce 4MX     (NV17, NV18)
        GeForce 3       (NV20)
        GeForce 4Ti     (NV25, NV28)
        GeForce FX      (NV3x)
        GeForce 6       (NV4x)
        GeForce 7       (G7x)
        GeForce 8       (G8x)
        GeForce GTX 200 (NVA0)
        GeForce GTX 400 (NVC0)
(++) using VT number 7
(II) [drm] nouveau interface version: 1.2.1
(--) NOUVEAU(0): Chipset: "NVIDIA NV84"
(II) NOUVEAU(0): Creating default Display subsection in Screen section
        "Default Screen Section" for depth/fbbpp 24/32
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(==) NOUVEAU(0): GLX sync to VBlank disabled.
(==) NOUVEAU(0): Page flipping enabled
(==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
(II) NOUVEAU(0): Output DVI-I-1 has no monitor section
(II) NOUVEAU(0): Output VGA-1 has no monitor section
(II) NOUVEAU(0): Output HDMI-1 has no monitor section
(II) NOUVEAU(0): EDID for output DVI-I-1
(II) NOUVEAU(0): EDID for output VGA-1
(II) NOUVEAU(0): Manufacturer: CNA  Model: 1701  Serial#: 0
(II) NOUVEAU(0): Year: 2001  Week: 11
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Analog Display Input,  Input Voltage Level: 0.700/0.300 V
(II) NOUVEAU(0): Sync:  Separate
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 36  vert.: 29
(II) NOUVEAU(0): Gamma: 2.50
(II) NOUVEAU(0): DPMS capabilities: Off; RGB/Color Display
(II) NOUVEAU(0): Default color space is primary color space
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): GTF timings supported
(II) NOUVEAU(0): redX: 0.624 redY: 0.353   greenX: 0.307 greenY: 0.600
(II) NOUVEAU(0): blueX: 0.151 blueY: 0.136   whiteX: 0.312 whiteY: 0.343
(II) NOUVEAU(0): Supported established timings:
(II) NOUVEAU(0): 720x400@70Hz
(II) NOUVEAU(0): 640x480@60Hz
(II) NOUVEAU(0): 640x480@75Hz
(II) NOUVEAU(0): 800x600@60Hz
(II) NOUVEAU(0): 800x600@75Hz
(II) NOUVEAU(0): 832x624@75Hz
(II) NOUVEAU(0): 1024x768@60Hz
(II) NOUVEAU(0): 1024x768@70Hz
(II) NOUVEAU(0): 1024x768@75Hz
(II) NOUVEAU(0): 1280x1024@75Hz
(II) NOUVEAU(0): 1152x864@75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported standard timings:
(II) NOUVEAU(0): #0: hsize: 640  vsize 480  refresh: 75  vid: 20273
(II) NOUVEAU(0): #1: hsize: 800  vsize 600  refresh: 75  vid: 20293
(II) NOUVEAU(0): #2: hsize: 1024  vsize 768  refresh: 75  vid: 20321
(II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 75  vid: 36737
(II) NOUVEAU(0): #4: hsize: 1280  vsize 960  refresh: 60  vid: 16513
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 108.0 MHz   Image Size:  360 x 290 mm
(II) NOUVEAU(0): h_active: 1280  h_sync: 1328  h_sync_end 1440 h_blank_end 1688
h_border: 0
(II) NOUVEAU(0): v_active: 1024  v_sync: 1025  v_sync_end 1028 v_blanking: 1066
v_border: 0
(II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 31 H max: 80 kHz,
PixClock max 145 MHz
(II) NOUVEAU(0): Monitor name: 17TFT LCD MNT
(II) NOUVEAU(0):  20020513
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0):        00ffffffffffff000dc1011700000000
(II) NOUVEAU(0):        0b0b010308241d962fdaf39f5a4e9926
(II) NOUVEAU(0):        225057a56f80314f454f614f818f8140
(II) NOUVEAU(0):        010101010101302a009851002a403070
(II) NOUVEAU(0):        1300682211000018000000fd00384c1f
(II) NOUVEAU(0):        500e000a202020202020000000fc0031
(II) NOUVEAU(0):        37544654204c4344204d4e54000000fe
(II) NOUVEAU(0):        003230303230353133202020202000d3
(II) NOUVEAU(0): Printing probed modes for output VGA-1
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 -hsync -vsync (64.0 kHz eP)
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz e)
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz e)
(II) NOUVEAU(0): Modeline "1280x800"x74.9  106.50  1280 1360 1488 1696  800 803
809 838 -hsync +vsync (62.8 kHz e)
(II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803
809 831 +hsync -vsync (49.7 kHz e)
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz e)
(II) NOUVEAU(0): Modeline "1280x768"x74.9  102.25  1280 1360 1488 1696  768 771
778 805 +hsync -vsync (60.3 kHz e)
(II) NOUVEAU(0): Modeline "1280x768"x59.9   79.50  1280 1344 1472 1664  768 771
778 798 -hsync +vsync (47.8 kHz e)
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.1 kHz e)
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz e)
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz e)
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz e)
(II) NOUVEAU(0): Modeline "1024x576"x60.0   46.97  1024 1064 1168 1312  576 577
580 597 -hsync +vsync (35.8 kHz)
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz e)
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz e)
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz e)
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz e)
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz e)
(II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088  480 486 494
517 +hsync +vsync (31.0 kHz e)
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz e)
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz e)
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz e)
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz e)
(II) NOUVEAU(0): EDID for output HDMI-1
(II) NOUVEAU(0): Output DVI-I-1 disconnected
(II) NOUVEAU(0): Output VGA-1 connected
(II) NOUVEAU(0): Output HDMI-1 disconnected
(II) NOUVEAU(0): Using exact sizes for initial modes
(II) NOUVEAU(0): Output VGA-1 using initial mode 1280x1024
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise
stated.
(--) NOUVEAU(0): Virtual size is 1280x1024 (pitch 0)
(**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz),
64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 -hsync -vsync (64.0 kHz eP)
(**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz),
80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz e)
(**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz e)
(**) NOUVEAU(0):  Driver mode "1280x800": 106.5 MHz (scaled from 0.0 MHz), 62.8
kHz, 74.9 Hz
(II) NOUVEAU(0): Modeline "1280x800"x74.9  106.50  1280 1360 1488 1696  800 803
809 838 -hsync +vsync (62.8 kHz e)
(**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from 0.0 MHz), 49.7
kHz, 59.8 Hz
(II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803
809 831 +hsync -vsync (49.7 kHz e)
(**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz e)
(**) NOUVEAU(0):  Driver mode "1280x768": 102.2 MHz (scaled from 0.0 MHz), 60.3
kHz, 74.9 Hz
(II) NOUVEAU(0): Modeline "1280x768"x74.9  102.25  1280 1360 1488 1696  768 771
778 805 +hsync -vsync (60.3 kHz e)
(**) NOUVEAU(0):  Driver mode "1280x768": 79.5 MHz (scaled from 0.0 MHz), 47.8
kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1280x768"x59.9   79.50  1280 1344 1472 1664  768 771
778 798 -hsync +vsync (47.8 kHz e)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1
kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.1 kHz e)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.0
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz e)
(**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz e)
(**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz e)
(**) NOUVEAU(0):  Mode "1024x576": 47.0 MHz (scaled from 0.0 MHz), 35.8 kHz,
60.0 Hz
(II) NOUVEAU(0): Modeline "1024x576"x60.0   46.97  1024 1064 1168 1312  576 577
580 597 -hsync +vsync (35.8 kHz)
(**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7
kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz e)
(**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1
kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz e)
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz e)
(**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9
kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz e)
(**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2
kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz e)
(**) NOUVEAU(0):  Driver mode "848x480": 33.8 MHz (scaled from 0.0 MHz), 31.0
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "848x480"x60.0   33.75  848 864 976 1088  480 486 494
517 +hsync +vsync (31.0 kHz e)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz e)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz e)
(**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz e)
(**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz e)
(==) NOUVEAU(0): DPI set to (96, 96)
(II) Loading /usr/lib64/xorg/modules/libfb.so
(II) Module fb: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 1.0.0
(II) Loading /usr/lib64/xorg/modules/libexa.so
(II) Module exa: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 2.6.0
(II) Loading /usr/lib64/xorg/modules/libshadowfb.so
(II) Module shadowfb: vendor="X.Org Foundation"
        compiled for 1.15.0, module version = 1.0.0
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): Opened GPU channel 0
(II) NOUVEAU(0): [DRI2] Setup complete
(II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
(II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
(II) EXA(0): Driver allocated offscreen pixmaps
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(==) NOUVEAU(0): Backing store enabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(==) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
(--) RandR disabled
(II) AIGLX: enabled GLX_MESA_copy_sub_buffer
(II) AIGLX: enabled GLX_ARB_create_context
(II) AIGLX: enabled GLX_ARB_create_context_profile
(II) AIGLX: enabled GLX_EXT_create_context_es2_profile
(II) AIGLX: enabled GLX_INTEL_swap_event
(II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
(II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
(II) AIGLX: enabled GLX_ARB_fbconfig_float
(II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
(II) AIGLX: Loaded and initialized nouveau
(II) GLX: Initialized DRI2 GL provider for screen 0

<system hung>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418493853.B417B1.15571
Date: Sat, 13 Dec 2014 18:04:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons67&#64;internet.lu" title="Bruno &lt;bonbons67&#64;internet.lu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>After fresh boot:
echo 1 &gt; /sys/bus/pci/devices/0000\:01\:00.0/reset


Kernel log for modprobe nouveau debug=0xff:
2014-12-13 18:55:58.978720 +0100 [  108.870465] nouveau 0000:01:00.0: enabling
device (0004 -&gt; 0007)
2014-12-13 18:55:58.981262 +0100 [  108.873035] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x084000a2
2014-12-13 18:55:58.982499 +0100 [  108.874310] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G84 (NV84)
2014-12-13 18:55:58.983988 +0100 [  108.875563] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
2014-12-13 18:55:58.985544 +0100 [  108.877111] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
2014-12-13 18:55:58.988741 +0100 [  108.878603] nouveau  [  
VBIOS][0000:01:00.0] ... signature not found
2014-12-13 18:55:58.991752 +0100 [  108.878605] nouveau  [  
VBIOS][0000:01:00.0] checking PROM for image...
2014-12-13 18:55:59.087159 +0100 [  108.978689] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
2014-12-13 18:55:59.088639 +0100 [  108.980177] nouveau  [  
VBIOS][0000:01:00.0] using image from PROM
2014-12-13 18:55:59.090312 +0100 [  108.981855] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
2014-12-13 18:55:59.091785 +0100 [  108.983331] nouveau  [  
VBIOS][0000:01:00.0] version 60.84.32.00.00
2014-12-13 18:55:59.094152 +0100 [  108.985929] nouveau  [
DEVINIT][0000:01:00.0] adaptor not initialised
2014-12-13 18:55:59.095419 +0100 [  108.987214] nouveau  [  
VBIOS][0000:01:00.0] running init tables
2014-12-13 18:55:59.158069 +0100 [  109.049842] nouveau 0000:01:00.0: irq 38
for MSI/MSI-X
2014-12-13 18:55:59.159330 +0100 [  109.051094] nouveau  [    
PMC][0000:01:00.0] MSI interrupts enabled
2014-12-13 18:55:59.160647 +0100 [  109.052409] nouveau  [    
PFB][0000:01:00.0] RAM type: GDDR3
2014-12-13 18:55:59.161877 +0100 [  109.053646] nouveau  [    
PFB][0000:01:00.0] RAM size: 512 MiB
2014-12-13 18:55:59.163115 +0100 [  109.054884] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 1892 tags
2014-12-13 18:55:59.168203 +0100 [  109.058900] nouveau  [   
VOLT][0000:01:00.0] GPU voltage: 1300000uv
2014-12-13 18:55:59.200094 +0100 [  109.089940] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: PWM
2014-12-13 18:55:59.203197 +0100 [  109.093119] nouveau  [ 
PTHERM][0000:01:00.0] fan management: automatic
2014-12-13 18:55:59.206283 +0100 [  109.096221] nouveau  [ 
PTHERM][0000:01:00.0] internal sensor: yes
2014-12-13 18:55:59.229500 +0100 [  109.119368] nouveau  [    
CLK][0000:01:00.0] 20: core 675 MHz shader 1450 MHz memory 1008 MHz
2014-12-13 18:55:59.232628 +0100 [  109.122527] nouveau  [    
CLK][0000:01:00.0] --: core 675 MHz shader 1458 MHz memory 900 MHz
2014-12-13 18:55:59.236536 +0100 [  109.126342] nouveau E[   
PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
2014-12-13 18:55:59.238046 +0100 [  109.129998] nouveau E[   
PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94
2014-12-13 18:55:59.239145 +0100 [  109.130208] nouveau  [     DRM] VRAM: 512
MiB
2014-12-13 18:55:59.239932 +0100 [  109.130210] nouveau  [     DRM] GART:
1048576 MiB
2014-12-13 18:55:59.240840 +0100 [  109.130215] nouveau  [     DRM] TMDS table
version 2.0
2014-12-13 18:55:59.241762 +0100 [  109.130216] nouveau  [     DRM] DCB version
4.0
2014-12-13 18:55:59.242703 +0100 [  109.130219] nouveau  [     DRM] DCB outp
00: 01000302 00020030
2014-12-13 18:55:59.243647 +0100 [  109.130222] nouveau  [     DRM] DCB outp
01: 02000300 00000028
2014-12-13 18:55:59.244579 +0100 [  109.130223] nouveau  [     DRM] DCB outp
02: 04012310 00000028
2014-12-13 18:55:59.245498 +0100 [  109.130225] nouveau  [     DRM] DCB outp
03: 02021322 00020010
2014-12-13 18:55:59.246404 +0100 [  109.130228] nouveau  [     DRM] DCB conn
00: 1030
2014-12-13 18:55:59.247372 +0100 [  109.130230] nouveau  [     DRM] DCB conn
01: 2161
2014-12-13 18:55:59.248262 +0100 [  109.130232] nouveau  [     DRM] DCB conn
02: 0200
2014-12-13 18:55:59.249077 +0100 [  109.130233] nouveau  [     DRM] DCB conn
03: 0362
2014-12-13 18:55:59.676841 +0100 [  109.568760] Clocksource tsc unstable (delta
= -209683361 ns)
2014-12-13 18:56:02.441389 +0100 [  112.331833] [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
2014-12-13 18:56:02.443054 +0100 [  112.333514] [drm] Driver supports precise
vblank timestamp query.
2014-12-13 18:56:02.465236 +0100 [  112.355653] nouveau  [     DRM] MM: using
CRYPT for buffer copies
2014-12-13 18:56:02.466331 +0100 [  112.357576] Switched to clocksource hpet
2014-12-13 18:56:04.057120 +0100 [  113.947900] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 127
2014-12-13 18:56:04.105137 +0100 [  113.995905] nouveau  [     DRM] allocated
1280x1024 fb: 0x70000, bo ffff880213fe51e0
2014-12-13 18:56:04.106399 +0100 [  113.997151] nouveau 0000:01:00.0: fb1:
nouveaufb frame buffer device
2014-12-13 18:56:04.107311 +0100 [  113.998096] [drm] Initialized nouveau 1.2.1
20120801 for 0000:01:00.0 on minor 1

starting Xorg here

2014-12-13 18:57:13.724675 +0100 [  183.597870] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=io+mem,decodes=none:owns=none
2014-12-13 18:57:13.724735 +0100 [  183.597895] vgaarb: device changed decodes:
PCI:0000:00:01.0,olddecodes=io+mem,decodes=none:owns=io+mem
2014-12-13 18:57:15.469354 +0100 [  185.342086] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:17.474564 +0100 [  187.346760] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:19.547083 +0100 [  189.418737] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:21.547125 +0100 [  191.418262] nouveau E[     
VM][0000:01:00.0] vm flush timeout: engine 6
2014-12-13 18:57:23.548308 +0100 [  193.418911] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:25.548260 +0100 [  195.418337] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:27.548232 +0100 [  197.417778] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:29.548328 +0100 [  199.417341] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:31.548318 +0100 [  201.416804] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:33.549819 +0100 [  203.417748] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:35.550309 +0100 [  205.417730] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:37.550646 +0100 [  207.417540] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:39.551014 +0100 [  209.417377] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:41.555729 +0100 [  211.421537] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:43.555982 +0100 [  213.421276] nouveau E[     
VM][0000:01:00.0] vm flush timeout: engine 6
2014-12-13 18:57:45.156695 +0100 [  215.021538] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:46.747471 +0100 [  216.611900] nouveau W[  
PFIFO][0000:01:00.0] unknown intr 0x00200000, ch 1
2014-12-13 18:57:48.747555 +0100 [  218.611475] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:50.747571 +0100 [  220.610958] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:52.747572 +0100 [  222.610437] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:54.747576 +0100 [  224.609909] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout
2014-12-13 18:57:56.747582 +0100 [  226.609387] nouveau E[ 
PGRAPH][0000:01:00.0] vm flush timeout


Xorg log (stderr, started as /usr/bin/Xorg -noreset -nolisten tcp -verbose
vt7):
X.Org X Server 1.15.0
Release Date: 2013-12-27
X Protocol Version 11, Revision 0
Build Operating System: Linux 3.17.0-kvm x86_64 Gentoo
Current Operating System: Linux sisyphe 3.18.0-kvm #1 SMP Mon Dec 8 19:05:52
CET 2014 x86_64
Kernel command line: slub_debug=FZP root=/dev/sda2 iommu=1 
Build Date: 26 October 2014  07:21:14PM

Current version of pixman: 0.32.4
        Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Sat Dec 13 18:56:58 2014
(==) Using config directory: &quot;/etc/X11/xorg.conf.d&quot;
(==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
(==) No Layout section.  Using the first Screen section.
(==) No screen section available. Using defaults.
(**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
(**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
(==) No device specified for screen &quot;Default Screen Section&quot;.
        Using the first device section listed.
(**) |   |--&gt;Device &quot;nvidia&quot;
(==) No monitor specified for screen &quot;Default Screen Section&quot;.
        Using a default monitor configuration.
(==) Automatically adding devices
(==) Automatically enabling devices
(==) Automatically adding GPU devices
(WW) The directory &quot;/usr/share/fonts/TTF/&quot; does not exist.
        Entry deleted from font path.
(WW) The directory &quot;/usr/share/fonts/OTF/&quot; does not exist.
        Entry deleted from font path.
(WW) The directory &quot;/usr/share/fonts/Type1/&quot; does not exist.
        Entry deleted from font path.
(WW) `fonts.dir' not found (or not valid) in &quot;/usr/share/fonts/100dpi/&quot;.
        Entry deleted from font path.
        (Run 'mkfontdir' on &quot;/usr/share/fonts/100dpi/&quot;).
(WW) `fonts.dir' not found (or not valid) in &quot;/usr/share/fonts/75dpi/&quot;.
        Entry deleted from font path.
        (Run 'mkfontdir' on &quot;/usr/share/fonts/75dpi/&quot;).
(==) FontPath set to:
        /usr/share/fonts/misc/
(==) ModulePath set to &quot;/usr/lib64/xorg/modules&quot;
(II) The server relies on udev to provide the list of input devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
(II) xfree86: Adding drm device (/dev/dri/card0)
(II) xfree86: Adding drm device (/dev/dri/card1)
(--) PCI:*(0:0:1:0) 1002:9640:1458:d000 rev 0, Mem &#64; 0xc0000000/268435456,
0xfdfc0000/262144, I/O &#64; 0x0000f800/256
(--) PCI: (0:1:0:0) 10de:0400:0000:0000 rev 161, Mem &#64; 0xfa000000/16777216,
0xd0000000/268435456, 0xf8000000/33554432, I/O &#64; 0x0000df00/128, BIOS &#64;
0x????????/131072
Initializing built-in extension Generic Event Extension
Initializing built-in extension SHAPE
Initializing built-in extension MIT-SHM
Initializing built-in extension XInputExtension
Initializing built-in extension XTEST
Initializing built-in extension BIG-REQUESTS
Initializing built-in extension SYNC
Initializing built-in extension XKEYBOARD
Initializing built-in extension XC-MISC
Initializing built-in extension XINERAMA
Initializing built-in extension XFIXES
Initializing built-in extension RENDER
Initializing built-in extension RANDR
Initializing built-in extension COMPOSITE
Initializing built-in extension DAMAGE
Initializing built-in extension MIT-SCREEN-SAVER
Initializing built-in extension DOUBLE-BUFFER
Initializing built-in extension RECORD
Initializing built-in extension DPMS
Initializing built-in extension Present
Initializing built-in extension DRI3
Initializing built-in extension X-Resource
Initializing built-in extension XVideo
Initializing built-in extension XVideo-MotionCompensation
Initializing built-in extension XFree86-VidModeExtension
Initializing built-in extension XFree86-DGA
Initializing built-in extension XFree86-DRI
Initializing built-in extension DRI2
(II) &quot;glx&quot; will be loaded by default.
(II) Loading /usr/lib64/xorg/modules/libglamoregl.so
(II) Module glamoregl: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 0.6.0
(II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
(II) Module glx: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 1.0.0
(==) AIGLX enabled
Loading extension GLX
(II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 1.0.10
(II) NOUVEAU driver 
(II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT        (NV04)
        RIVA TNT2       (NV05)
        GeForce 256     (NV10)
        GeForce 2       (NV11, NV15)
        GeForce 4MX     (NV17, NV18)
        GeForce 3       (NV20)
        GeForce 4Ti     (NV25, NV28)
        GeForce FX      (NV3x)
        GeForce 6       (NV4x)
        GeForce 7       (G7x)
        GeForce 8       (G8x)
        GeForce GTX 200 (NVA0)
        GeForce GTX 400 (NVC0)
(++) using VT number 7
(II) [drm] nouveau interface version: 1.2.1
(--) NOUVEAU(0): Chipset: &quot;NVIDIA NV84&quot;
(II) NOUVEAU(0): Creating default Display subsection in Screen section
        &quot;Default Screen Section&quot; for depth/fbbpp 24/32
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(==) NOUVEAU(0): GLX sync to VBlank disabled.
(==) NOUVEAU(0): Page flipping enabled
(==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
(II) NOUVEAU(0): Output DVI-I-1 has no monitor section
(II) NOUVEAU(0): Output VGA-1 has no monitor section
(II) NOUVEAU(0): Output HDMI-1 has no monitor section
(II) NOUVEAU(0): EDID for output DVI-I-1
(II) NOUVEAU(0): EDID for output VGA-1
(II) NOUVEAU(0): Manufacturer: CNA  Model: 1701  Serial#: 0
(II) NOUVEAU(0): Year: 2001  Week: 11
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Analog Display Input,  Input Voltage Level: 0.700/0.300 V
(II) NOUVEAU(0): Sync:  Separate
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 36  vert.: 29
(II) NOUVEAU(0): Gamma: 2.50
(II) NOUVEAU(0): DPMS capabilities: Off; RGB/Color Display
(II) NOUVEAU(0): Default color space is primary color space
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): GTF timings supported
(II) NOUVEAU(0): redX: 0.624 redY: 0.353   greenX: 0.307 greenY: 0.600
(II) NOUVEAU(0): blueX: 0.151 blueY: 0.136   whiteX: 0.312 whiteY: 0.343
(II) NOUVEAU(0): Supported established timings:
(II) NOUVEAU(0): 720x400&#64;70Hz
(II) NOUVEAU(0): 640x480&#64;60Hz
(II) NOUVEAU(0): 640x480&#64;75Hz
(II) NOUVEAU(0): 800x600&#64;60Hz
(II) NOUVEAU(0): 800x600&#64;75Hz
(II) NOUVEAU(0): 832x624&#64;75Hz
(II) NOUVEAU(0): 1024x768&#64;60Hz
(II) NOUVEAU(0): 1024x768&#64;70Hz
(II) NOUVEAU(0): 1024x768&#64;75Hz
(II) NOUVEAU(0): 1280x1024&#64;75Hz
(II) NOUVEAU(0): 1152x864&#64;75Hz
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported standard timings:
(II) NOUVEAU(0): #0: hsize: 640  vsize 480  refresh: 75  vid: 20273
(II) NOUVEAU(0): #1: hsize: 800  vsize 600  refresh: 75  vid: 20293
(II) NOUVEAU(0): #2: hsize: 1024  vsize 768  refresh: 75  vid: 20321
(II) NOUVEAU(0): #3: hsize: 1280  vsize 1024  refresh: 75  vid: 36737
(II) NOUVEAU(0): #4: hsize: 1280  vsize 960  refresh: 60  vid: 16513
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 108.0 MHz   Image Size:  360 x 290 mm
(II) NOUVEAU(0): h_active: 1280  h_sync: 1328  h_sync_end 1440 h_blank_end 1688
h_border: 0
(II) NOUVEAU(0): v_active: 1024  v_sync: 1025  v_sync_end 1028 v_blanking: 1066
v_border: 0
(II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 31 H max: 80 kHz,
PixClock max 145 MHz
(II) NOUVEAU(0): Monitor name: 17TFT LCD MNT
(II) NOUVEAU(0):  20020513
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0):        00ffffffffffff000dc1011700000000
(II) NOUVEAU(0):        0b0b010308241d962fdaf39f5a4e9926
(II) NOUVEAU(0):        225057a56f80314f454f614f818f8140
(II) NOUVEAU(0):        010101010101302a009851002a403070
(II) NOUVEAU(0):        1300682211000018000000fd00384c1f
(II) NOUVEAU(0):        500e000a202020202020000000fc0031
(II) NOUVEAU(0):        37544654204c4344204d4e54000000fe
(II) NOUVEAU(0):        003230303230353133202020202000d3
(II) NOUVEAU(0): Printing probed modes for output VGA-1
(II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 -hsync -vsync (64.0 kHz eP)
(II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz e)
(II) NOUVEAU(0): Modeline &quot;1280x960&quot;x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz e)
(II) NOUVEAU(0): Modeline &quot;1280x800&quot;x74.9  106.50  1280 1360 1488 1696  800 803
809 838 -hsync +vsync (62.8 kHz e)
(II) NOUVEAU(0): Modeline &quot;1280x800&quot;x59.8   83.50  1280 1352 1480 1680  800 803
809 831 +hsync -vsync (49.7 kHz e)
(II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz e)
(II) NOUVEAU(0): Modeline &quot;1280x768&quot;x74.9  102.25  1280 1360 1488 1696  768 771
778 805 +hsync -vsync (60.3 kHz e)
(II) NOUVEAU(0): Modeline &quot;1280x768&quot;x59.9   79.50  1280 1344 1472 1664  768 771
778 798 -hsync +vsync (47.8 kHz e)
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.1 kHz e)
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz e)
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz e)
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz e)
(II) NOUVEAU(0): Modeline &quot;1024x576&quot;x60.0   46.97  1024 1064 1168 1312  576 577
580 597 -hsync +vsync (35.8 kHz)
(II) NOUVEAU(0): Modeline &quot;832x624&quot;x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz e)
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz e)
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz e)
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz e)
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz e)
(II) NOUVEAU(0): Modeline &quot;848x480&quot;x60.0   33.75  848 864 976 1088  480 486 494
517 +hsync +vsync (31.0 kHz e)
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz e)
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz e)
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz e)
(II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz e)
(II) NOUVEAU(0): EDID for output HDMI-1
(II) NOUVEAU(0): Output DVI-I-1 disconnected
(II) NOUVEAU(0): Output VGA-1 connected
(II) NOUVEAU(0): Output HDMI-1 disconnected
(II) NOUVEAU(0): Using exact sizes for initial modes
(II) NOUVEAU(0): Output VGA-1 using initial mode 1280x1024
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise
stated.
(--) NOUVEAU(0): Virtual size is 1280x1024 (pitch 0)
(**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz (scaled from 0.0 MHz),
64.0 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440 1688  1024
1025 1028 1066 -hsync -vsync (64.0 kHz eP)
(**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz (scaled from 0.0 MHz),
80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1280x960&quot;: 108.0 MHz (scaled from 0.0 MHz), 60.0
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline &quot;1280x960&quot;x60.0  108.00  1280 1376 1488 1800  960 961
964 1000 +hsync +vsync (60.0 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1280x800&quot;: 106.5 MHz (scaled from 0.0 MHz), 62.8
kHz, 74.9 Hz
(II) NOUVEAU(0): Modeline &quot;1280x800&quot;x74.9  106.50  1280 1360 1488 1696  800 803
809 838 -hsync +vsync (62.8 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1280x800&quot;: 83.5 MHz (scaled from 0.0 MHz), 49.7
kHz, 59.8 Hz
(II) NOUVEAU(0): Modeline &quot;1280x800&quot;x59.8   83.50  1280 1352 1480 1680  800 803
809 831 +hsync -vsync (49.7 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1152x864&quot;: 108.0 MHz (scaled from 0.0 MHz), 67.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1280x768&quot;: 102.2 MHz (scaled from 0.0 MHz), 60.3
kHz, 74.9 Hz
(II) NOUVEAU(0): Modeline &quot;1280x768&quot;x74.9  102.25  1280 1360 1488 1696  768 771
778 805 +hsync -vsync (60.3 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1280x768&quot;: 79.5 MHz (scaled from 0.0 MHz), 47.8
kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline &quot;1280x768&quot;x59.9   79.50  1280 1344 1472 1664  768 771
778 798 -hsync +vsync (47.8 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (scaled from 0.0 MHz), 60.1
kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.1 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (scaled from 0.0 MHz), 60.0
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 75.0 MHz (scaled from 0.0 MHz), 56.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x70.1   75.00  1024 1048 1184 1328  768 771
777 806 -hsync -vsync (56.5 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (scaled from 0.0 MHz), 48.4
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 1344  768 771
777 806 -hsync -vsync (48.4 kHz e)
(**) NOUVEAU(0):  Mode &quot;1024x576&quot;: 47.0 MHz (scaled from 0.0 MHz), 35.8 kHz,
60.0 Hz
(II) NOUVEAU(0): Modeline &quot;1024x576&quot;x60.0   46.97  1024 1064 1168 1312  576 577
580 597 -hsync +vsync (35.8 kHz)
(**) NOUVEAU(0):  Driver mode &quot;832x624&quot;: 57.3 MHz (scaled from 0.0 MHz), 49.7
kHz, 74.6 Hz
(II) NOUVEAU(0): Modeline &quot;832x624&quot;x74.6   57.28  832 864 928 1152  624 625 628
667 -hsync -vsync (49.7 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 50.0 MHz (scaled from 0.0 MHz), 48.1
kHz, 72.2 Hz
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x72.2   50.00  800 856 976 1040  600 637 643
666 +hsync +vsync (48.1 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 49.5 MHz (scaled from 0.0 MHz), 46.9
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (scaled from 0.0 MHz), 37.9
kHz, 60.3 Hz
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056  600 601 605
628 +hsync +vsync (37.9 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 36.0 MHz (scaled from 0.0 MHz), 35.2
kHz, 56.2 Hz
(II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024  600 601 603
625 +hsync +vsync (35.2 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;848x480&quot;: 33.8 MHz (scaled from 0.0 MHz), 31.0
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline &quot;848x480&quot;x60.0   33.75  848 864 976 1088  480 486 494
517 +hsync +vsync (31.0 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 0.0 MHz), 37.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 0.0 MHz), 37.9
kHz, 72.8 Hz
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x72.8   31.50  640 664 704 832  480 489 492
520 -hsync -vsync (37.9 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (scaled from 0.0 MHz), 31.5
kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800  480 490 492
525 -hsync -vsync (31.5 kHz e)
(**) NOUVEAU(0):  Driver mode &quot;720x400&quot;: 28.3 MHz (scaled from 0.0 MHz), 31.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz e)
(==) NOUVEAU(0): DPI set to (96, 96)
(II) Loading /usr/lib64/xorg/modules/libfb.so
(II) Module fb: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 1.0.0
(II) Loading /usr/lib64/xorg/modules/libexa.so
(II) Module exa: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 2.6.0
(II) Loading /usr/lib64/xorg/modules/libshadowfb.so
(II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
        compiled for 1.15.0, module version = 1.0.0
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): Opened GPU channel 0
(II) NOUVEAU(0): [DRI2] Setup complete
(II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
(II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
(II) EXA(0): Driver allocated offscreen pixmaps
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(==) NOUVEAU(0): Backing store enabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(==) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
(--) RandR disabled
(II) AIGLX: enabled GLX_MESA_copy_sub_buffer
(II) AIGLX: enabled GLX_ARB_create_context
(II) AIGLX: enabled GLX_ARB_create_context_profile
(II) AIGLX: enabled GLX_EXT_create_context_es2_profile
(II) AIGLX: enabled GLX_INTEL_swap_event
(II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
(II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
(II) AIGLX: enabled GLX_ARB_fbconfig_float
(II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
(II) AIGLX: Loaded and initialized nouveau
(II) GLX: Initialized DRI2 GL provider for screen 0

&lt;system hung&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418493853.B417B1.15571--

--===============1728639059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1728639059==--

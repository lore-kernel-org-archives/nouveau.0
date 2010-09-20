From: Stefan Mathe <mstefan-26n5VD7DAF2Tm46uYYfjYg@public.gmane.org>
Subject: Problems with dual head on NVidia Quadro NVS 295
Date: Mon, 20 Sep 2010 18:21:26 +0300
Message-ID: <4C977BF6.20505@cs.toronto.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050401020803000504020401"
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

This is a multi-part message in MIME format.
--------------050401020803000504020401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I'm having problems configuring the dual-head display using an NVidia
Quadro NVS 295 display card. It uses two identical LCD monitors (model
HP LP2475w), connected using DP cables. If I connect one single monitor
(either to the DP-1 or to the DP-2 output), the desktop shows up
correctly. If I connect both monitors, only the left monitor shows the
image, and the desktop is extended as if the second monitor were showing
something. But the right monitor remains blank.

I am using OpenSUSE 11.3, with the nouveau drivers included in its
kernel (kernel version 2.6.34). The relevant parts of xorg.conf.d are:

Section "Device"
  Identifier "Default Device"
  Option "SWcursor" "true"
  Option "monitor-DP-1" "LeftMonitor"
  Option "monitor-DP-2" "RightMonitor"
EndSection

Section "Monitor"
  Identifier "LeftMonitor"
  Option "PreferredMode" "1920x1200"
EndSection

Section "Monitor"
  Identifier "RightMonitor"
  Option     "RightOf" "LeftMonitor"
  Option     "PreferredMode" "1920x1200"
EndSection

Section "Screen"
  Identifier "Default Screen"
  Device "Default Device"
  Monitor "LeftMonitor"
  DefaultDepth 24
  SubSection "Display"
     Depth 24
     Virtual 3840 1200
  EndSubSection
EndSection

Section "ServerLayout"
  Identifier "Layout0"
  Screen 0 "Default Screen" 0 0
EndSection

Note that I had to set the mouse cursor to software rendering because it
was not showing up at all when using hardware rendering (cursor was
entirely invisible but the mouse was operational).

The output of the "xrandr" command is:

Screen 0: minimum 320 x 200, current 3840 x 1200, maximum 8192 x 8192
DP-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis)
546mm x 352mm
   1920x1200      60.0*+   59.9 
   1920x1080      60.0 
   1600x1200      60.0 
   1680x1050      60.0 
   1600x1000      60.0 
   1280x1024      75.0 
   1280x960       60.0 
   1152x864       75.0 
   1024x768       75.1     60.0 
   832x624        74.6 
   800x600        75.0     60.3 
   640x480        75.0     60.0 
   720x400        70.1 
DP-2 connected 1920x1200+1920+0 (normal left inverted right x axis y
axis) 546mm x 352mm
   1920x1200      60.0*+   59.9 
   1600x1200      60.0 
   1680x1050      60.0 
   1600x1000      60.0 
   1280x1024      75.0 
   1280x960       60.0 
   1152x864       75.0 
   1024x768       75.1     60.0 
   832x624        74.6 
   800x600        75.0     60.3 
   640x480        75.0     60.0 
   720x400        70.1 

I have also attached my Xorg.0.log file.

Many thanks in advance for the help,
Stefan.

--------------050401020803000504020401
Content-Type: text/x-log;
 name="Xorg.0.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Xorg.0.log"

[    11.632] 
X.Org X Server 1.8.0
Release Date: 2010-04-02
[    11.643] X Protocol Version 11, Revision 0
[    11.643] Build Operating System: openSUSE SUSE LINUX
[    11.643] Current Operating System: Linux arrakeen 2.6.34.7-0.2-desktop #1 SMP PREEMPT 2010-09-14 14:21:06 +0200 x86_64
[    11.643] Kernel command line: root=/dev/disk/by-id/ata-ST3500418AS_9VM5VZRD-part6 resume=/dev/disk/by-id/ata-ST3500418AS_9VM5VZRD-part5 splash=silent quiet vga=0x314
[    11.643] Build Date: 19 August 2010  03:34:22PM
[    11.643]  
[    11.643] Current version of pixman: 0.18.0
[    11.643] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    11.643] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    11.643] (==) Log file: "/var/log/Xorg.0.log", Time: Mon Sep 20 18:11:20 2010
[    11.644] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    11.651] (==) ServerLayout "Layout0"
[    11.651] (**) |-->Screen "Default Screen" (0)
[    11.651] (**) |   |-->Monitor "LeftMonitor"
[    11.652] (**) |   |-->Device "Default Device"
[    11.652] (==) Automatically adding devices
[    11.652] (==) Automatically enabling devices
[    11.652] (WW) The directory "/usr/share/fonts/TTF/" does not exist.
[    11.652] 	Entry deleted from font path.
[    11.652] (WW) The directory "/usr/share/fonts/OTF/" does not exist.
[    11.652] 	Entry deleted from font path.
[    11.652] (WW) The directory "/usr/share/fonts/misc/sgi" does not exist.
[    11.652] 	Entry deleted from font path.
[    11.652] (==) FontPath set to:
	/usr/share/fonts/misc:unscaled,
	/usr/share/fonts/Type1/,
	/usr/share/fonts/100dpi:unscaled,
	/usr/share/fonts/75dpi:unscaled,
	/usr/share/fonts/URW/,
	/usr/share/fonts/cyrillic:unscaled,
	/usr/share/fonts/truetype/
[    11.652] (==) ModulePath set to "/usr/lib64/xorg/modules/updates,/usr/lib64/xorg/modules"
[    11.652] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    11.652] (II) Loader magic: 0x7d5ba0
[    11.652] (II) Module ABI versions:
[    11.652] 	X.Org ANSI C Emulation: 0.4
[    11.652] 	X.Org Video Driver: 7.0
[    11.652] 	X.Org XInput driver : 9.0
[    11.652] 	X.Org Server Extension : 3.0
[    11.659] (--) PCI:*(0:15:0:0) 10de:06fd:10de:062e nVidia Corporation G98 [Quadro NVS 295] rev 161, Mem @ 0xe2000000/16777216, 0xd0000000/268435456, 0xe0000000/33554432, I/O @ 0x0000e000/128
[    11.659] (II) Open ACPI successful (/var/run/acpid.socket)
[    11.659] (II) LoadModule: "extmod"
[    11.672] (II) Loading /usr/lib64/xorg/modules/extensions/libextmod.so
[    11.673] (II) Module extmod: vendor="X.Org Foundation"
[    11.673] 	compiled for 1.8.0, module version = 1.0.0
[    11.673] 	Module class: X.Org Server Extension
[    11.673] 	ABI class: X.Org Server Extension, version 3.0
[    11.673] (II) Loading extension MIT-SCREEN-SAVER
[    11.673] (II) Loading extension XFree86-VidModeExtension
[    11.673] (II) Loading extension XFree86-DGA
[    11.673] (II) Loading extension DPMS
[    11.673] (II) Loading extension XVideo
[    11.673] (II) Loading extension XVideo-MotionCompensation
[    11.673] (II) Loading extension X-Resource
[    11.673] (II) LoadModule: "dbe"
[    11.673] (II) Loading /usr/lib64/xorg/modules/extensions/libdbe.so
[    11.673] (II) Module dbe: vendor="X.Org Foundation"
[    11.673] 	compiled for 1.8.0, module version = 1.0.0
[    11.673] 	Module class: X.Org Server Extension
[    11.673] 	ABI class: X.Org Server Extension, version 3.0
[    11.673] (II) Loading extension DOUBLE-BUFFER
[    11.673] (II) LoadModule: "glx"
[    11.673] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    11.673] (II) Module glx: vendor="X.Org Foundation"
[    11.673] 	compiled for 1.8.0, module version = 1.0.0
[    11.673] 	ABI class: X.Org Server Extension, version 3.0
[    11.674] (==) AIGLX enabled
[    11.674] (II) Loading extension GLX
[    11.674] (II) LoadModule: "record"
[    11.674] (II) Loading /usr/lib64/xorg/modules/extensions/librecord.so
[    11.674] (II) Module record: vendor="X.Org Foundation"
[    11.674] 	compiled for 1.8.0, module version = 1.13.0
[    11.674] 	Module class: X.Org Server Extension
[    11.674] 	ABI class: X.Org Server Extension, version 3.0
[    11.674] (II) Loading extension RECORD
[    11.674] (II) LoadModule: "dri"
[    11.675] (II) Loading /usr/lib64/xorg/modules/extensions/libdri.so
[    11.685] (II) Module dri: vendor="X.Org Foundation"
[    11.685] 	compiled for 1.8.0, module version = 1.0.0
[    11.685] 	ABI class: X.Org Server Extension, version 3.0
[    11.685] (II) Loading extension XFree86-DRI
[    11.685] (II) LoadModule: "dri2"
[    11.686] (II) Loading /usr/lib64/xorg/modules/extensions/libdri2.so
[    11.686] (II) Module dri2: vendor="X.Org Foundation"
[    11.686] 	compiled for 1.8.0, module version = 1.2.0
[    11.686] 	ABI class: X.Org Server Extension, version 3.0
[    11.686] (II) Loading extension DRI2
[    11.686] (==) Matched nvidia as autoconfigured driver 0
[    11.686] (==) Matched nouveau as autoconfigured driver 1
[    11.686] (==) Matched nv as autoconfigured driver 2
[    11.686] (==) Matched fbdev as autoconfigured driver 3
[    11.686] (==) Matched vesa as autoconfigured driver 4
[    11.686] (==) Assigned the driver to the xf86ConfigLayout
[    11.686] (II) LoadModule: "nvidia"
[    11.690] (WW) Warning, couldn't open module nvidia
[    11.690] (II) UnloadModule: "nvidia"
[    11.690] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    11.690] (II) LoadModule: "nouveau"
[    11.691] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    11.691] (II) Module nouveau: vendor="X.Org Foundation"
[    11.691] 	compiled for 1.8.0, module version = 0.0.15
[    11.691] 	Module class: X.Org Video Driver
[    11.691] 	ABI class: X.Org Video Driver, version 7.0
[    11.691] (II) LoadModule: "nv"
[    11.692] (II) Loading /usr/lib64/xorg/modules/drivers/nv_drv.so
[    11.692] (II) Module nv: vendor="X.Org Foundation"
[    11.692] 	compiled for 1.8.0, module version = 2.1.17
[    11.692] 	Module class: X.Org Video Driver
[    11.692] 	ABI class: X.Org Video Driver, version 7.0
[    11.692] (II) LoadModule: "fbdev"
[    11.694] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    11.694] (II) Module fbdev: vendor="X.Org Foundation"
[    11.694] 	compiled for 1.8.0, module version = 0.4.1
[    11.694] 	ABI class: X.Org Video Driver, version 7.0
[    11.694] (II) LoadModule: "vesa"
[    11.694] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    11.694] (II) Module vesa: vendor="X.Org Foundation"
[    11.694] 	compiled for 1.8.0, module version = 2.2.1
[    11.694] 	Module class: X.Org Video Driver
[    11.694] 	ABI class: X.Org Video Driver, version 7.0
[    11.694] (II) NOUVEAU driver 
[    11.694] (II) NOUVEAU driver for NVIDIA chipset families :
[    11.694] 	RIVA TNT    (NV04)
[    11.694] 	RIVA TNT2   (NV05)
[    11.694] 	GeForce 256 (NV10)
[    11.694] 	GeForce 2   (NV11, NV15)
[    11.694] 	GeForce 4MX (NV17, NV18)
[    11.694] 	GeForce 3   (NV20)
[    11.695] 	GeForce 4Ti (NV25, NV28)
[    11.695] 	GeForce FX  (NV3x)
[    11.695] 	GeForce 6   (NV4x)
[    11.695] 	GeForce 7   (G7x)
[    11.695] 	GeForce 8   (G8x)
[    11.695] (II) NV: driver for NVIDIA chipsets: RIVA 128, RIVA TNT, RIVA TNT2,
	Unknown TNT2, Vanta, RIVA TNT2 Ultra, RIVA TNT2 Model 64,
	Aladdin TNT2, GeForce 256, GeForce DDR, Quadro, GeForce2 MX/MX 400,
	GeForce2 MX 100/200, GeForce2 Go, Quadro2 MXR/EX/Go,
	GeForce2 Integrated GPU, GeForce2 GTS, GeForce2 Ti, GeForce2 Ultra,
	Quadro2 Pro, GeForce4 MX 460, GeForce4 MX 440, GeForce4 MX 420,
	GeForce4 MX 440-SE, GeForce4 440 Go, GeForce4 420 Go,
	GeForce4 420 Go 32M, GeForce4 460 Go, Quadro4 550 XGL,
	GeForce4 440 Go 64M, Quadro NVS, Quadro4 500 GoGL,
	GeForce4 410 Go 16M, GeForce4 MX 440 with AGP8X,
	GeForce4 MX 440SE with AGP8X, GeForce4 MX 420 with AGP8X,
	GeForce4 MX 4000, GeForce4 448 Go, GeForce4 488 Go, Quadro4 580 XGL,
	Quadro4 NVS 280 SD, Quadro4 380 XGL, Quadro NVS 50 PCI,
	GeForce4 448 Go, GeForce4 MX Integrated GPU, GeForce3,
	GeForce3 Ti 200, GeForce3 Ti 500, Quadro DCC, GeForce4 Ti 4600,
	GeForce4 Ti 4400, GeForce4 Ti 4200, Quadro4 900 XGL, Quadro4 750 XGL,
	Quadro4 700 XGL, GeForce4 Ti 4800, GeForce4 Ti 4200 with AGP8X,
	GeForce4 Ti 4800 SE, GeForce4 4200 Go, Quadro4 700 GoGL,
	Quadro4 980 XGL, Quadro4 780 XGL, GeForce FX 5800 Ultra,
	GeForce FX 5800, Quadro FX 2000, Quadro FX 1000,
	GeForce FX 5600 Ultra, GeForce FX 5600, GeForce FX 5600XT,
	GeForce FX Go5600, GeForce FX Go5650, Quadro FX Go700,
	GeForce FX 5200, GeForce FX 5200 Ultra, GeForce FX 5200,
	GeForce FX 5200LE, GeForce FX Go5200, GeForce FX Go5250,
	GeForce FX 5500, GeForce FX 5100, GeForce FX Go5200 32M/64M,
	Quadro NVS 55/280 PCI, Quadro FX 500/600 PCI,
	GeForce FX Go53xx Series, GeForce FX Go5100, GeForce FX 5900 Ultra,
	GeForce FX 5900, GeForce FX 5900XT, GeForce FX 5950 Ultra,
	GeForce FX 5900ZT, Quadro FX 3000, Quadro FX 700,
	GeForce FX 5700 Ultra, GeForce FX 5700, GeForce FX 5700LE,
	GeForce FX 5700VE, GeForce FX Go5700, GeForce FX Go5700,
	Quadro FX Go1000, Quadro FX 1100, GeForce 6800 Ultra, GeForce 6800,
	GeForce 6800 LE, GeForce 6800 XE, GeForce 6800 XT, GeForce 6800 GT,
	GeForce 6800 GT, GeForce 6800 GS, GeForce 6800 XT, Quadro FX 4000,
	GeForce 6800 GS, GeForce 6800, GeForce 6800 LE, GeForce 6800 XT,
	GeForce Go 6800, GeForce Go 6800 Ultra, Quadro FX Go1400,
	Quadro FX 3450/4000 SDI, Quadro FX 1400, GeForce 6600 GT,
	GeForce 6600, GeForce 6600 LE, GeForce 6600 VE, GeForce Go 6600,
	GeForce 6610 XL, GeForce Go 6600 TE/6200 TE, GeForce 6700 XL,
	GeForce Go 6600, GeForce Go 6600 GT, Quadro NVS 440, Quadro FX 550,
	Quadro FX 550, Quadro FX 540, GeForce 6200, GeForce 6500,
	GeForce 6200 TurboCache(TM), GeForce 6200SE TurboCache(TM),
	GeForce 6200 LE, GeForce Go 6200, Quadro NVS 285, GeForce Go 6400,
	GeForce Go 6200, GeForce Go 6400, GeForce 6250, GeForce 7100 GS,
	GeForce 6800, GeForce 6800 LE, GeForce 6800 GT, GeForce 6800 XT,
	GeForce 6200, GeForce 6200 A-LE, GeForce 7800 GTX, GeForce 7800 GTX,
	GeForce 7800 GT, GeForce 7800 GS, GeForce 7800 SLI, GeForce Go 7800,
	GeForce Go 7800 GTX, Quadro FX 4500, GeForce 7350 LE,
	GeForce 7300 LE, GeForce 7300 SE, GeForce Go 7200, GeForce Go 7300,
	GeForce Go 7400, GeForce Go 7400 GS, Quadro NVS 110M,
	Quadro NVS 120M, Quadro FX 350M, GeForce 7500 LE, Quadro FX 350,
	GeForce 7300 GS, GeForce 7650 GS, GeForce 7600 GT, GeForce 7600 GS,
	GeForce 7300 GT, GeForce 7600 LE, GeForce 7300 GT, GeForce Go 7700,
	GeForce Go 7600, GeForce Go 7600 GT, Quadro NVS 300M,
	GeForce Go 7900 SE, Quadro FX 550M, Quadro FX 560, GeForce 7900 GTX,
	GeForce 7900 GT, GeForce 7900 GS, GeForce 7950 GX2, GeForce 7950 GX2,
	GeForce 7950 GT, GeForce Go 7950 GTX, GeForce Go 7900 GS,
	GeForce Go 7900 GTX, Quadro FX 2500M, Quadro FX 1500M,
	Quadro FX 5500, Quadro FX 3500, Quadro FX 1500, Quadro FX 4500 X2,
	GeForce 6150, GeForce 6150 LE, GeForce 6100, GeForce Go 6150,
	Quadro NVS 210S / NVIDIA GeForce 6150LE, GeForce Go 6100,
	GeForce 6150SE, GeForce 6100 nForce 405, GeForce 6100 nForce 400,
	GeForce 6100 nForce 420, GeForce 7150M / nForce 630M,
	GeForce 7000M / nForce 610M, GeForce 7050 PV / nForce 630a,
	GeForce 7050 PV / nForce 630a, GeForce 7025 / nForce 630a,
	GeForce 8800 GTX, GeForce 8800 GTS, GeForce 8800 Ultra,
	Quadro FX 5600, Quadro FX 4600, GeForce 8600 GTS, GeForce 8600 GT,
	GeForce 8600 GT, GeForce 8600 GS, GeForce 8400 GS, GeForce 9500M GS,
	GeForce 8600M GT, GeForce 9650M GS, GeForce 8700M GT, Quadro FX 370,
	Quadro NVS 320M, Quadro FX 570M, Quadro FX 1600M, Quadro FX 570,
	Quadro FX 1700, GeForce 8400 SE, GeForce 8500 GT, GeForce 8400 GS,
	GeForce 8300 GS, GeForce 8400 GS, GeForce 8600M GS, GeForce 8400M GT,
	GeForce 8400M GS, GeForce 8400M G, Quadro NVS 140M, Quadro NVS 130M,
	Quadro NVS 135M, GeForce 9400 GT, Quadro FX 360M, GeForce 9300M G,
	Quadro NVS 290, GeForce GTX 295, GeForce GTX 280, GeForce GTX 260,
	GeForce GTX 285, GeForce GTX 275, GeForce GTX 295, Quadro CX,
	Quadro FX 5800, Quadro FX 4800, Quadro FX 3800, GeForce 8800 GTS 512,
	GeForce 9800 GT, GeForce 8800 GT, GeForce 9800 GX2, GeForce 9800 GT,
	GeForce 8800 GS, GeForce GTS 240, GeForce 9800M GTX,
	GeForce 8800M GTS, GeForce GTX 280M, GeForce 9800M GT,
	GeForce 8800M GTX, GeForce 8800 GS, GeForce 9600 GSO,
	GeForce 8800 GT, GeForce 9800 GTX, GeForce 9800 GTX+,
	GeForce 9800 GT, GeForce GTS 250, GeForce 9800M GTX,
	GeForce GTX 260M, Quadro FX 3700, Quadro FX 3600M, Quadro FX 2800M,
	Quadro FX 3700M, Quadro FX 3800M, GeForce 9600 GT, GeForce 9600 GS,
	GeForce 9600 GSO 512, GeForce GT 130, GeForce GT 140,
	GeForce 9800M GTS, GeForce 9700M GTS, GeForce 9800M GS,
	GeForce 9800M GTS, Quadro FX 1800, Quadro FX 2700M, GeForce 9500 GT,
	GeForce 9400 GT, GeForce 9500 GT, GeForce 9500 GS, GeForce GT 120,
	GeForce 9600M GT, GeForce 9600M GS, GeForce 9600M GT,
	GeForce 9700M GT, GeForce 9500M G, GeForce 9650M GT, GeForce GT 130M,
	GeForce 9500 GT, Quadro FX 380, Quadro FX 580, Quadro FX 1700M,
	Quadro FX 770M, GeForce 9300 GE, GeForce 9300 GS, GeForce 8400 GS,
	GeForce 9300M GS, GeForce G100, GeForce 9200M GS, GeForce 9300M GS,
	Quadro NVS 150M, Quadro NVS 160M, GeForce G 105M, GeForce G 103M,
	Quadro NVS 420, Quadro FX 370 LP, Quadro NVS 450, Quadro NVS 295,
	GeForce 9100, GeForce 8300, GeForce 8200, nForce 730a, GeForce 9200,
	nForce 980a/780a SLI, nForce 750a SLI, GeForce 8100 / nForce 720a,
	GeForce 9100M G, GeForce 8200M G, GeForce 9400, GeForce 9400M G,
	GeForce 9400M, GeForce 9300 / nForce 730i, GeForce G102M,
	GeForce G102M, GeForce 9400, ION, ION LE, GeForce GT 220,
	GeForce 210, GeForce GT 230M, GeForce GT 240M, GeForce G210,
	GeForce 205, GeForce 310, GeForce 210, GeForce 310, GeForce G210M,
	Quadro FX 380 LP, GeForce GT 240, GeForce GTS 260M, GeForce GTS 250M
[    11.696] (II) FBDEV: driver for framebuffer: fbdev
[    11.696] (II) VESA: driver for VESA chipsets: vesa
[    11.696] (++) using VT number 7

[    11.732] (II) Primary Device is: PCI 0f@00:00:0
[    11.733] drmOpenDevice: node name is /dev/dri/card0
[    12.448] drmOpenByBusid: Searching for BusID pci:0000:0f:00.0
[    12.448] drmOpenDevice: node name is /dev/dri/card0
[    12.448] drmOpenDevice: open result is 9, (OK)
[    12.448] drmOpenByBusid: drmOpenMinor returns 9
[    12.448] drmOpenByBusid: drmGetBusid reports pci:0000:0f:00.0
[    12.448] (II) [drm] nouveau interface version: 0.0.16
[    12.448] (WW) Falling back to old probe method for fbdev
[    12.448] (II) Loading sub module "fbdevhw"
[    12.448] (II) LoadModule: "fbdevhw"
[    12.448] (II) Loading /usr/lib64/xorg/modules/linux/libfbdevhw.so
[    12.449] (II) Module fbdevhw: vendor="X.Org Foundation"
[    12.449] 	compiled for 1.8.0, module version = 0.0.2
[    12.449] 	ABI class: X.Org Video Driver, version 7.0
[    12.449] (WW) Falling back to old probe method for vesa
[    12.449] (II) Loading sub module "dri"
[    12.449] (II) LoadModule: "dri"
[    12.449] (II) Reloading /usr/lib64/xorg/modules/extensions/libdri.so
[    12.449] (II) NOUVEAU(0): Loaded DRI module
[    12.449] drmOpenDevice: node name is /dev/dri/card0
[    12.449] drmOpenDevice: open result is 10, (OK)
[    12.449] drmOpenDevice: node name is /dev/dri/card0
[    12.449] drmOpenDevice: open result is 10, (OK)
[    12.449] drmOpenByBusid: Searching for BusID pci:0000:0f:00.0
[    12.449] drmOpenDevice: node name is /dev/dri/card0
[    12.449] drmOpenDevice: open result is 10, (OK)
[    12.449] drmOpenByBusid: drmOpenMinor returns 10
[    12.449] drmOpenByBusid: drmGetBusid reports pci:0000:0f:00.0
[    12.449] (II) [drm] DRM interface version 1.3
[    12.449] (II) [drm] DRM open master succeeded.
[    12.449] (--) NOUVEAU(0): Chipset: "NVIDIA NV98"
[    12.449] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    12.449] (==) NOUVEAU(0): RGB weight 888
[    12.449] (==) NOUVEAU(0): Default visual is TrueColor
[    12.449] (**) NOUVEAU(0): Option "SWcursor" "true"
[    12.449] (**) NOUVEAU(0): Using SW cursor
[    12.590] (II) NOUVEAU(0): Output DP-1 using monitor section LeftMonitor
[    12.590] (**) NOUVEAU(0): Option "PreferredMode" "1920x1200"
[    12.731] (II) NOUVEAU(0): Output DP-2 using monitor section RightMonitor
[    12.731] (**) NOUVEAU(0): Option "PreferredMode" "1920x1200"
[    12.731] (**) NOUVEAU(0): Option "RightOf" "LeftMonitor"
[    12.872] (II) NOUVEAU(0): EDID for output DP-1
[    12.872] (II) NOUVEAU(0): Manufacturer: HWP  Model: 26f9  Serial#: 16843009
[    12.872] (II) NOUVEAU(0): Year: 2010  Week: 1
[    12.872] (II) NOUVEAU(0): EDID Version: 1.4
[    12.872] (II) NOUVEAU(0): Digital Display Input
[    12.872] (II) NOUVEAU(0): 8 bits per channel
[    12.872] (II) NOUVEAU(0): Digital interface is DisplayPort
[    12.872] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 54  vert.: 35
[    12.872] (II) NOUVEAU(0): Gamma: 2.20
[    12.872] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    12.872] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    12.872] (II) NOUVEAU(0): Default color space is primary color space
[    12.872] (II) NOUVEAU(0): First detailed timing is preferred mode
[    12.872] (II) NOUVEAU(0): Preferred mode is native pixel format and refresh rate
[    12.872] (II) NOUVEAU(0): redX: 0.640 redY: 0.328   greenX: 0.300 greenY: 0.600
[    12.872] (II) NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
[    12.872] (II) NOUVEAU(0): Supported established timings:
[    12.872] (II) NOUVEAU(0): 720x400@70Hz
[    12.872] (II) NOUVEAU(0): 640x480@60Hz
[    12.872] (II) NOUVEAU(0): 640x480@75Hz
[    12.872] (II) NOUVEAU(0): 800x600@60Hz
[    12.872] (II) NOUVEAU(0): 800x600@75Hz
[    12.872] (II) NOUVEAU(0): 832x624@75Hz
[    12.872] (II) NOUVEAU(0): 1024x768@60Hz
[    12.872] (II) NOUVEAU(0): 1024x768@75Hz
[    12.872] (II) NOUVEAU(0): 1280x1024@75Hz
[    12.872] (II) NOUVEAU(0): 1152x864@75Hz
[    12.872] (II) NOUVEAU(0): Manufacturer's mask: 0
[    12.872] (II) NOUVEAU(0): Supported standard timings:
[    12.872] (II) NOUVEAU(0): #0: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    12.872] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1000  refresh: 60  vid: 169
[    12.872] (II) NOUVEAU(0): #2: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[    12.872] (II) NOUVEAU(0): #3: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    12.872] (II) NOUVEAU(0): #4: hsize: 1920  vsize 1200  refresh: 60  vid: 209
[    12.872] (II) NOUVEAU(0): #5: hsize: 1920  vsize 1080  refresh: 60  vid: 49361
[    12.872] (II) NOUVEAU(0): Supported detailed timing:
[    12.872] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  546 x 352 mm
[    12.872] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    12.872] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: 1235 v_border: 0
[    12.873] (II) NOUVEAU(0): Monitor name: HP LP2475w
[    12.873] (II) NOUVEAU(0): Ranges: V min: 48 V max: 85 Hz, H min: 30 H max: 94 kHz, PixClock max 205000 kHz
[    12.873] (II) NOUVEAU(0): Maximum pixel width: 1680
[    12.873] (II) NOUVEAU(0): Supported aspect ratios: 4:3 16:9 16:10* 5:4 15:9
[    12.873] (II) NOUVEAU(0): Supported blankings: standard reduced
[    12.873] (II) NOUVEAU(0): Supported scalings: hshrink hstretch vshrink vstretch
[    12.873] (II) NOUVEAU(0): Buggy monitor, no preferred refresh rate given
[    12.873] (II) NOUVEAU(0): Serial No: PLC00102Y2
[    12.873] (II) NOUVEAU(0): EDID (in hex):
[    12.873] (II) NOUVEAU(0): 	00ffffffffffff0022f0f92601010101
[    12.873] (II) NOUVEAU(0): 	01140104a5362378eece50a3544c9926
[    12.873] (II) NOUVEAU(0): 	0f5054a56b808140a900a940b300d100
[    12.873] (II) NOUVEAU(0): 	d1c001010101283c80a070b023403020
[    12.873] (II) NOUVEAU(0): 	360022602100001a000000fc00485020
[    12.873] (II) NOUVEAU(0): 	4c5032343735770a2020000000fd0030
[    12.873] (II) NOUVEAU(0): 	551e5e15041150d2f858f000000000ff
[    12.873] (II) NOUVEAU(0): 	00504c43303031303259320a20200027
[    12.873] (II) NOUVEAU(0): EDID vendor "HWP", prod id 9977
[    12.873] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    12.873] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    12.873] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    12.873] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.14  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.80  1920 2040 2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[    12.873] (II) NOUVEAU(0): Printing probed modes for output DP-1
[    12.873] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  172.78  1920 2040 2248 2576  1080 1081 1084 1118 -hsync +vsync (67.1 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.16  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    12.873] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    13.014] (II) NOUVEAU(0): EDID for output DP-2
[    13.014] (II) NOUVEAU(0): Manufacturer: HWP  Model: 26f9  Serial#: 16843009
[    13.014] (II) NOUVEAU(0): Year: 2009  Week: 14
[    13.014] (II) NOUVEAU(0): EDID Version: 1.4
[    13.014] (II) NOUVEAU(0): Digital Display Input
[    13.014] (II) NOUVEAU(0): 8 bits per channel
[    13.014] (II) NOUVEAU(0): Digital interface is DisplayPort
[    13.014] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 54  vert.: 35
[    13.014] (II) NOUVEAU(0): Gamma: 2.20
[    13.014] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    13.014] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    13.014] (II) NOUVEAU(0): Default color space is primary color space
[    13.014] (II) NOUVEAU(0): First detailed timing is preferred mode
[    13.014] (II) NOUVEAU(0): Preferred mode is native pixel format and refresh rate
[    13.014] (II) NOUVEAU(0): redX: 0.640 redY: 0.328   greenX: 0.300 greenY: 0.600
[    13.014] (II) NOUVEAU(0): blueX: 0.149 blueY: 0.060   whiteX: 0.312 whiteY: 0.328
[    13.014] (II) NOUVEAU(0): Supported established timings:
[    13.014] (II) NOUVEAU(0): 720x400@70Hz
[    13.014] (II) NOUVEAU(0): 640x480@60Hz
[    13.014] (II) NOUVEAU(0): 640x480@75Hz
[    13.014] (II) NOUVEAU(0): 800x600@60Hz
[    13.014] (II) NOUVEAU(0): 800x600@75Hz
[    13.014] (II) NOUVEAU(0): 832x624@75Hz
[    13.014] (II) NOUVEAU(0): 1024x768@60Hz
[    13.014] (II) NOUVEAU(0): 1024x768@75Hz
[    13.014] (II) NOUVEAU(0): 1280x1024@75Hz
[    13.014] (II) NOUVEAU(0): 1152x864@75Hz
[    13.014] (II) NOUVEAU(0): Manufacturer's mask: 0
[    13.014] (II) NOUVEAU(0): Supported standard timings:
[    13.014] (II) NOUVEAU(0): #0: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    13.014] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1000  refresh: 60  vid: 169
[    13.014] (II) NOUVEAU(0): #2: hsize: 1600  vsize 1200  refresh: 60  vid: 16553
[    13.014] (II) NOUVEAU(0): #3: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[    13.014] (II) NOUVEAU(0): #4: hsize: 1920  vsize 1200  refresh: 60  vid: 209
[    13.014] (II) NOUVEAU(0): Supported detailed timing:
[    13.014] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  546 x 352 mm
[    13.014] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080 h_border: 0
[    13.014] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: 1235 v_border: 0
[    13.014] (II) NOUVEAU(0): Monitor name: HP LP2475w
[    13.014] (II) NOUVEAU(0): Ranges: V min: 48 V max: 85 Hz, H min: 30 H max: 94 kHz, PixClock max 205000 kHz
[    13.014] (II) NOUVEAU(0): Maximum pixel width: 1680
[    13.014] (II) NOUVEAU(0): Supported aspect ratios: 4:3 16:9 16:10* 5:4 15:9
[    13.014] (II) NOUVEAU(0): Supported blankings: standard reduced
[    13.014] (II) NOUVEAU(0): Supported scalings: hshrink hstretch vshrink vstretch
[    13.014] (II) NOUVEAU(0): Buggy monitor, no preferred refresh rate given
[    13.014] (II) NOUVEAU(0): Serial No: CZC91402FZ
[    13.014] (II) NOUVEAU(0): EDID (in hex):
[    13.014] (II) NOUVEAU(0): 	00ffffffffffff0022f0f92601010101
[    13.014] (II) NOUVEAU(0): 	0e130104a5362378eece50a3544c9926
[    13.014] (II) NOUVEAU(0): 	0f5054a56b808140a900a940b300d100
[    13.014] (II) NOUVEAU(0): 	010101010101283c80a070b023403020
[    13.014] (II) NOUVEAU(0): 	360022602100001a000000fc00485020
[    13.014] (II) NOUVEAU(0): 	4c5032343735770a2020000000fd0030
[    13.014] (II) NOUVEAU(0): 	551e5e15041150d2f858f000000000ff
[    13.014] (II) NOUVEAU(0): 	00435a433931343032465a0a20200087
[    13.014] (II) NOUVEAU(0): Printing probed modes for output DP-2
[    13.014] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.16  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    13.014] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    13.014] (II) NOUVEAU(0): Output DP-1 connected
[    13.014] (II) NOUVEAU(0): Output DP-2 connected
[    13.014] (II) NOUVEAU(0): Using user preference for initial modes
[    13.014] (II) NOUVEAU(0): Output DP-1 using initial mode 1920x1200
[    13.014] (II) NOUVEAU(0): Output DP-2 using initial mode 1920x1200
[    13.014] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[    13.014] (--) NOUVEAU(0): Virtual size is 3840x1200 (pitch 3840)
[    13.014] (**) NOUVEAU(0):  Driver mode "1920x1200": 154.0 MHz (scaled from 0.0 MHz), 74.0 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1920x1200": 193.2 MHz (scaled from 0.0 MHz), 74.6 kHz, 59.9 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1920x1200"x59.9  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync (74.6 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from 0.0 MHz), 75.0 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[    13.014] (**) NOUVEAU(0):  Mode "1600x1000": 133.2 MHz (scaled from 0.0 MHz), 62.1 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.16  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
[    13.014] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[    13.014] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[    13.014] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    13.014] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz
[    13.014] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    13.014] (**) NOUVEAU(0): Display dimensions: (540, 350) mm
[    13.014] (**) NOUVEAU(0): DPI set to (90, 87)
[    13.014] (II) Loading sub module "wfb"
[    13.014] (II) LoadModule: "wfb"
[    13.015] (II) Loading /usr/lib64/xorg/modules/libwfb.so
[    13.015] (II) Module wfb: vendor="X.Org Foundation"
[    13.015] 	compiled for 1.8.0, module version = 1.0.0
[    13.015] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    13.015] (II) Loading sub module "fb"
[    13.015] (II) LoadModule: "fb"
[    13.016] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    13.016] (II) Module fb: vendor="X.Org Foundation"
[    13.016] 	compiled for 1.8.0, module version = 1.0.0
[    13.016] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    13.016] (II) Loading sub module "exa"
[    13.016] (II) LoadModule: "exa"
[    13.016] (II) Loading /usr/lib64/xorg/modules/libexa.so
[    13.016] (II) Module exa: vendor="X.Org Foundation"
[    13.016] 	compiled for 1.8.0, module version = 2.5.0
[    13.016] 	ABI class: X.Org Video Driver, version 7.0
[    13.016] (II) Loading sub module "shadowfb"
[    13.016] (II) LoadModule: "shadowfb"
[    13.017] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[    13.017] (II) Module shadowfb: vendor="X.Org Foundation"
[    13.017] 	compiled for 1.8.0, module version = 1.0.0
[    13.017] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    13.017] (II) UnloadModule: "nv"
[    13.017] (II) Unloading /usr/lib64/xorg/modules/drivers/nv_drv.so
[    13.017] (II) UnloadModule: "fbdev"
[    13.017] (II) Unloading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    13.017] (II) UnloadModule: "fbdevhw"
[    13.017] (II) Unloading /usr/lib64/xorg/modules/linux/libfbdevhw.so
[    13.017] (II) UnloadModule: "vesa"
[    13.017] (II) Unloading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    13.017] (--) Depth 24 pixmap format is 32 bpp
[    13.033] (II) NOUVEAU(0): Opened GPU channel 2
[    13.034] (II) NOUVEAU(0): [DRI2] Setup complete
[    13.034] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    13.034] (II) NOUVEAU(0): GART: 512MiB available
[    13.037] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    13.037] (II) EXA(0): Driver allocated offscreen pixmaps
[    13.037] (II) EXA(0): Driver registered support for the following operations:
[    13.037] (II)         Solid
[    13.037] (II)         Copy
[    13.037] (II)         Composite (RENDER acceleration)
[    13.037] (II)         UploadToScreen
[    13.037] (II)         DownloadFromScreen
[    13.037] (==) NOUVEAU(0): Backing store disabled
[    13.037] (==) NOUVEAU(0): Silken mouse enabled
[    13.037] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
[    13.037] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    13.037] (II) NOUVEAU(0): NVEnterVT is called.
[    13.126] (==) NOUVEAU(0): DPMS enabled
[    13.126] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[    13.126] (WW) NOUVEAU(0): Option "PreferredMode" is not used
[    13.126] (--) RandR disabled
[    13.126] (II) Initializing built-in extension Generic Event Extension
[    13.126] (II) Initializing built-in extension SHAPE
[    13.126] (II) Initializing built-in extension MIT-SHM
[    13.126] (II) Initializing built-in extension XInputExtension
[    13.126] (II) Initializing built-in extension XTEST
[    13.126] (II) Initializing built-in extension BIG-REQUESTS
[    13.126] (II) Initializing built-in extension SYNC
[    13.126] (II) Initializing built-in extension XKEYBOARD
[    13.126] (II) Initializing built-in extension XC-MISC
[    13.126] (II) Initializing built-in extension SECURITY
[    13.126] (II) Initializing built-in extension XINERAMA
[    13.126] (II) Initializing built-in extension XFIXES
[    13.126] (II) Initializing built-in extension RENDER
[    13.126] (II) Initializing built-in extension RANDR
[    13.126] (II) Initializing built-in extension COMPOSITE
[    13.126] (II) Initializing built-in extension DAMAGE
[    13.149] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    13.149] (II) AIGLX: enabled GLX_INTEL_swap_event
[    13.149] (II) AIGLX: enabled GLX_SGI_make_current_read
[    13.149] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    13.149] (II) AIGLX: Loaded and initialized /usr/lib64/dri/nouveau_dri.so
[    13.149] (II) GLX: Initialized DRI2 GL provider for screen 0
[    13.150] (II) NOUVEAU(0): Setting screen physical size to 1016 x 317
[    13.150] resize called 3840 1200
[    13.167] (II) XKB: reuse xkmfile /var/lib/xkb/compiled/server-8AA988DD479FAABEC4FC3CCCF4CC29B4948840B4.xkm
[    13.176] (II) config/udev: Adding input device Power Button (/dev/input/event3)
[    13.176] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    13.176] (**) Power Button: Applying InputClass "LocalKeyboard"
[    13.176] (II) LoadModule: "evdev"
[    13.177] (II) Loading /usr/lib64/xorg/modules/input/evdev_drv.so
[    13.177] (II) Module evdev: vendor="X.Org Foundation"
[    13.177] 	compiled for 1.8.0, module version = 2.4.0
[    13.177] 	Module class: X.Org XInput Driver
[    13.177] 	ABI class: X.Org XInput driver, version 9.0
[    13.177] (**) Power Button: always reports core events
[    13.177] (**) Power Button: Device: "/dev/input/event3"
[    13.180] (II) Power Button: Found keys
[    13.180] (II) Power Button: Configuring as keyboard
[    13.180] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
[    13.180] (**) Option "xkb_rules" "evdev"
[    13.180] (**) Option "xkb_model" "evdev"
[    13.180] (**) Option "xkb_layout" "us"
[    13.181] (II) XKB: reuse xkmfile /var/lib/xkb/compiled/server-73AC8D4822B76BE375830D90D9DD145B2CBC4E27.xkm
[    13.182] (II) config/udev: Adding input device Power Button (/dev/input/event2)
[    13.182] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    13.182] (**) Power Button: Applying InputClass "LocalKeyboard"
[    13.182] (**) Power Button: always reports core events
[    13.182] (**) Power Button: Device: "/dev/input/event2"
[    13.186] (II) Power Button: Found keys
[    13.186] (II) Power Button: Configuring as keyboard
[    13.186] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD)
[    13.186] (**) Option "xkb_rules" "evdev"
[    13.186] (**) Option "xkb_model" "evdev"
[    13.186] (**) Option "xkb_layout" "us"
[    13.189] (II) config/udev: Adding input device AT Translated Set 2 keyboard (/dev/input/event0)
[    13.189] (**) AT Translated Set 2 keyboard: Applying InputClass "evdev keyboard catchall"
[    13.189] (**) AT Translated Set 2 keyboard: Applying InputClass "LocalKeyboard"
[    13.189] (**) AT Translated Set 2 keyboard: always reports core events
[    13.189] (**) AT Translated Set 2 keyboard: Device: "/dev/input/event0"
[    13.192] (II) AT Translated Set 2 keyboard: Found keys
[    13.192] (II) AT Translated Set 2 keyboard: Configuring as keyboard
[    13.192] (II) XINPUT: Adding extended input device "AT Translated Set 2 keyboard" (type: KEYBOARD)
[    13.192] (**) Option "xkb_rules" "evdev"
[    13.192] (**) Option "xkb_model" "evdev"
[    13.192] (**) Option "xkb_layout" "us"
[    13.192] (II) config/udev: Adding input device ImPS/2 Logitech Wheel Mouse (/dev/input/event1)
[    13.192] (**) ImPS/2 Logitech Wheel Mouse: Applying InputClass "evdev pointer catchall"
[    13.192] (**) ImPS/2 Logitech Wheel Mouse: always reports core events
[    13.192] (**) ImPS/2 Logitech Wheel Mouse: Device: "/dev/input/event1"
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: Found 3 mouse buttons
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: Found scroll wheel(s)
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: Found relative axes
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: Found x and y relative axes
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: Configuring as mouse
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: YAxisMapping: buttons 4 and 5
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    13.197] (II) XINPUT: Adding extended input device "ImPS/2 Logitech Wheel Mouse" (type: MOUSE)
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: (accel) keeping acceleration scheme 1
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration profile 0
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration factor: 2.000
[    13.197] (**) ImPS/2 Logitech Wheel Mouse: (accel) acceleration threshold: 4
[    13.197] (II) ImPS/2 Logitech Wheel Mouse: initialized for relative axes.
[    13.197] (II) config/udev: Adding input device ImPS/2 Logitech Wheel Mouse (/dev/input/mouse0)
[    13.197] (EE) No input driver/identifier specified (ignoring)
[    13.197] (II) config/udev: Adding input device PC Speaker (/dev/input/event4)
[    13.197] (EE) No input driver/identifier specified (ignoring)
[    13.198] (II) config/udev: Adding input device HP WMI hotkeys (/dev/input/event5)
[    13.198] (**) HP WMI hotkeys: Applying InputClass "evdev keyboard catchall"
[    13.198] (**) HP WMI hotkeys: Applying InputClass "LocalKeyboard"
[    13.198] (**) HP WMI hotkeys: always reports core events
[    13.198] (**) HP WMI hotkeys: Device: "/dev/input/event5"
[    13.202] (II) HP WMI hotkeys: Found keys
[    13.202] (II) HP WMI hotkeys: Configuring as keyboard
[    13.202] (II) XINPUT: Adding extended input device "HP WMI hotkeys" (type: KEYBOARD)
[    13.202] (**) Option "xkb_rules" "evdev"
[    13.202] (**) Option "xkb_model" "evdev"
[    13.202] (**) Option "xkb_layout" "us"
[    17.167] (II) NOUVEAU(0): EDID vendor "HWP", prod id 9977
[    17.167] (II) NOUVEAU(0): Using hsync ranges from config file
[    17.167] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    17.167] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    17.167] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.14  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    17.167] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[    33.044] (II) NOUVEAU(0): EDID vendor "HWP", prod id 9977
[    33.044] (II) NOUVEAU(0): Using hsync ranges from config file
[    33.044] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    33.044] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    33.044] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000 2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1600x1000"x60.0  133.14  1600 1704 1872 2144  1000 1001 1004 1035 -hsync +vsync (62.1 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856 2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz)
[    33.044] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)

--------------050401020803000504020401
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050401020803000504020401--

From: Alexey Kardashevsky <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: running x.org on powerpc64 with nvidia6200
Date: Fri, 13 Feb 2009 18:36:06 +0300
Message-ID: <49959366.2000805@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1894554564=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1894554564==
Content-Type: multipart/alternative;
 boundary="------------070909080503030002060007"

This is a multi-part message in MIME format.
--------------070909080503030002060007
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I am newbie in this topic and I have problems trying to bring x.org up 
on the hardware I have:
IBM QS22 BladeServer (PowerPC64 architecture) with PCI-Express connected 
nVidia 6200 video card.
OS: Fedora 10-ppc: Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue 
Feb 10 14:55:56 EST 2009 ppc64 ppc64 ppc64 GNU/Linux

I downloaded and compiled DRM driver (git clone 
git://anongit.freedesktop.org/git/mesa/drm) and loaded it:

[root@localhost ~]# modprobe drm
[root@localhost ~]# modprobe nouveau
[root@localhost ~]# dmesg | tail -n 3
nouveau 0005:01:00.0: enabling device (0140 -> 0142)
[drm] Detected an NV44 generation card (0x044300b2)
[drm] Initialized nouveau 0.0.12 libdrm-2.4.4-28-geb78c53aa1a980e60 on 
minor 0
[root@localhost ~]# lsmod | grep no
nouveau               351856  0
drm                   249176  1 nouveau
[root@localhost ~]# lspci -v
[...]
0005:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
6200 LE] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 827b
        Flags: bus master, fast devsel, latency 0, IRQ 106
        Memory at 3d080000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 3d0c0000000 (64-bit, prefetchable) [size=512M]
        Memory at 3d081000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at 3d082000000 [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ 
Count=1/1 Enable-
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Kernel driver in use: nouveau

[root@localhost ~]# ls -la /dev/fb*
crw------- 1 root root 29, 0 2009-02-13 10:19 /dev/fb
*

Also I've got 
http://cgit.freedesktop.org/mesa/mesa/snapshot/mesa_7_3.tar.bz2, 
compiled and installed.

Then, I've tried configuring x.org:
*
[root@localhost ~]# X -configure -verbose 255                    
(II) config/hal: initialized
X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-92.1.10.el5 ppc
Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1 SMP 
Tue Feb 10 14:55:56 EST 2009 ppc64
Build Date: 16 November 2008  08:30:07PM
Build ID: xorg-x11-server 1.5.3-5.fc10
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 13 10:25:59 2009
(II) No APM support in BIOS or kernel
(II) Loader magic: 0x101e59a4
(II) Module ABI versions:
        X.Org ANSI C Emulation: 0.4
        X.Org Video Driver: 4.1
        X.Org XInput driver : 2.1
        X.Org Server Extension : 1.1
        X.Org Font Renderer : 0.6
(II) Loader running on linux
(--) using VT number 7

(--) PCI:*(5@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161, 
Mem @ 0x1020bd9c/976, 0x1020bd9c/976, 0x1020bd9c/976, BIOS @ 
0x????????/270581148
List of video drivers:
        nouveau
        mga
        i740
        sis
        savage
        i128
        mach64
        trident
        tdfx
        s3virge
        dummy
        r128
        cirrus
        siliconmotion
        ati
        glint
        v4l
        sisusb
        rendition
        radeon
        apm
        ast
        voodoo
        fbdev
        vesa
(II) LoadModule: "nouveau"

(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.4.99.906, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) LoadModule: "mga"

(II) Loading /usr/lib/xorg/modules/drivers//mga_drv.so
(II) Module mga: vendor="X.Org Foundation"
        compiled for 1.4.99.902, module version = 1.4.9
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "i740"

(II) Loading /usr/lib/xorg/modules/drivers//i740_drv.so
(II) Module i740: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "sis"

(II) Loading /usr/lib/xorg/modules/drivers//sis_drv.so
(II) Module sis: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 0.10.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "savage"

(II) Loading /usr/lib/xorg/modules/drivers//savage_drv.so
(II) Module savage: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 2.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "i128"

(II) Loading /usr/lib/xorg/modules/drivers//i128_drv.so
(II) Module i128: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.3.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "mach64"

(II) Loading /usr/lib/xorg/modules/drivers//mach64_drv.so
(II) Module mach64: vendor="X.Org Foundation"
        compiled for 1.4.99.906, module version = 6.8.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) LoadModule: "trident"

(II) Loading /usr/lib/xorg/modules/drivers//trident_drv.so
(II) Module trident: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.3.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "tdfx"

(II) Loading /usr/lib/xorg/modules/drivers//tdfx_drv.so
(II) Module tdfx: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.4.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "s3virge"

(II) Loading /usr/lib/xorg/modules/drivers//s3virge_drv.so
(II) Module s3virge: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.10.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "dummy"

(II) Loading /usr/lib/xorg/modules/drivers//dummy_drv.so
(II) Module dummy: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 0.3.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "r128"

(II) Loading /usr/lib/xorg/modules/drivers//r128_drv.so
(II) Module r128: vendor="X.Org Foundation"
        compiled for 1.4.99.906, module version = 6.8.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) LoadModule: "cirrus"

(II) Loading /usr/lib/xorg/modules/drivers//cirrus_drv.so
(II) Module cirrus: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "siliconmotion"

(II) Loading /usr/lib/xorg/modules/drivers//siliconmotion_drv.so
(II) Module siliconmotion: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.6.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "ati"

(II) Loading /usr/lib/xorg/modules/drivers//ati_drv.so
(II) Module ati: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 6.9.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) LoadModule: "glint"

(II) Loading /usr/lib/xorg/modules/drivers//glint_drv.so
(II) Module glint: vendor="X.Org Foundation"
        compiled for 1.4.99.902, module version = 1.2.1
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "v4l"

(II) Loading /usr/lib/xorg/modules/drivers//v4l_drv.so
(II) Module v4l: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 0.1.1
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "sisusb"

(II) Loading /usr/lib/xorg/modules/drivers//sisusb_drv.so
(II) Module sisusb: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 0.9.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "rendition"

(II) Loading /usr/lib/xorg/modules/drivers//rendition_drv.so
(II) Module rendition: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 4.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "radeon"

(II) Loading /usr/lib/xorg/modules/drivers//radeon_drv.so
(II) Module radeon: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 6.9.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) LoadModule: "apm"

(II) Loading /usr/lib/xorg/modules/drivers//apm_drv.so
(II) Module apm: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.2.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "ast"

(II) Loading /usr/lib/xorg/modules/drivers//ast_drv.so
(II) Module ast: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 0.85.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "voodoo"

(II) Loading /usr/lib/xorg/modules/drivers//voodoo_drv.so
(II) Module voodoo: vendor="X.Org Foundation"
        compiled for 4.3.99.902, module version = 1.1.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "fbdev"

(II) Loading /usr/lib/xorg/modules/drivers//fbdev_drv.so
(II) Module fbdev: vendor="X.Org Foundation"
        compiled for 1.4.99.2, module version = 0.3.1
        ABI class: X.Org Video Driver, version 4.0
(II) LoadModule: "vesa"

(II) Loading /usr/lib/xorg/modules/drivers//vesa_drv.so
(II) Module vesa: vendor="X.Org Foundation"
        compiled for 1.4.99.905, module version = 1.3.0
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) System resource ranges:
(II) Primary Device is: PCI 01@05:00:0
(II) NOUVEAU driver
(II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT    (NV04)
        RIVA TNT2   (NV05)
        GeForce 256 (NV10)
        GeForce 2   (NV11, NV15)
        GeForce 4MX (NV17, NV18)
        GeForce 3   (NV20)
        GeForce 4Ti (NV25, NV28)
        GeForce FX  (NV3x)
        GeForce 6   (NV4x)
        GeForce 7   (G7x)
        GeForce 8   (G8x)
(WW) Falling back to old probe method for i740
(WW) Falling back to old probe method for sis
(WW) Falling back to old probe method for i128
(WW) Falling back to old probe method for trident
(WW) Falling back to old probe method for s3virge
        S3VProbe begin
(WW) Falling back to old probe method for dummy
(WW) Falling back to old probe method for cirrus
(II) Loading sub module "cirrus_laguna"
(II) LoadModule: "cirrus_laguna"

(II) Loading /usr/lib/xorg/modules/drivers//cirrus_laguna.so
(II) Module cirrus_laguna: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.0.0
        ABI class: X.Org Video Driver, version 4.0
(II) Loading sub module "cirrus_alpine"
(II) LoadModule: "cirrus_alpine"

(II) Loading /usr/lib/xorg/modules/drivers//cirrus_alpine.so
(II) Module cirrus_alpine: vendor="X.Org Foundation"
        compiled for 1.4.99.901, module version = 1.0.0
        ABI class: X.Org Video Driver, version 4.0
(WW) Falling back to old probe method for siliconmotion
(WW) Falling back to old probe method for glint
(WW) Falling back to old probe method for v4l
(II) v4l driver for Video4Linux
(WW) Falling back to old probe method for sisusb
(WW) Falling back to old probe method for apm
(WW) Falling back to old probe method for ast
(WW) Falling back to old probe method for voodoo
(II) FBDEV: driver for framebuffer: fbdev
(II) VESA: driver for VESA chipsets: vesa
(++) Using config file: "/root/xorg.conf.new"
(==) ServerLayout "X.org Configured"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Card0"
(**) |-->Input Device "Mouse0"
(**) |-->Input Device "Keyboard0"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) Including the default font path 
catalogue:/etc/X11/fontpath.d,built-ins.
(**) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins,
        catalogue:/etc/X11/fontpath.d,
        built-ins
(**) ModulePath set to "/usr/lib/xorg/modules"
(WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will 
be disabled.
(WW) Disabling Mouse0
(WW) Disabling Keyboard0
Number of created screens does not match number of detected devices.
  Configuration failed.

*As I understand, the configurator has detected my card and started 
configuring it but something (what?) has failed.




Ok, with no hope, I'm trying to start the X:
*
[root@localhost ~]# X -config xorg.conf.new -verbose 
255                            
(II) config/hal: initialized
X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-92.1.10.el5 ppc
Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1 SMP 
Tue Feb 10 14:55:56 EST 2009 ppc64
Build Date: 16 November 2008  08:30:07PM
Build ID: xorg-x11-server 1.5.3-5.fc10
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 13 10:26:48 2009
(++) Using config file: "xorg.conf.new"
(==) ServerLayout "X.org Configured"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Monitor0"
(**) |   |-->Device "Card0"
(**) |-->Input Device "Mouse0"
(**) |-->Input Device "Keyboard0"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) Including the default font path 
catalogue:/etc/X11/fontpath.d,built-ins.
(**) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins,
        catalogue:/etc/X11/fontpath.d,
        built-ins
(**) ModulePath set to "/usr/lib/xorg/modules"
(WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will 
be disabled.
(WW) Disabling Mouse0
(WW) Disabling Keyboard0
(II) No APM support in BIOS or kernel
(II) Loader magic: 0x101e59a4
(II) Module ABI versions:
        X.Org ANSI C Emulation: 0.4
        X.Org Video Driver: 4.1
        X.Org XInput driver : 2.1
        X.Org Server Extension : 1.1
        X.Org Font Renderer : 0.6
(II) Loader running on linux
(--) using VT number 7

(--) PCI:*(5@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161, 
Mem @ 0x1020bd9c/976, 0x1020bd9c/976, 0x1020bd9c/976, BIOS @ 
0x????????/270581148
(II) System resource ranges:
(II) "extmod" will be loaded. This was enabled by default and also 
specified in the config file.
(II) "dbe" will be loaded. This was enabled by default and also 
specified in the config file.
(II) "glx" will be loaded. This was enabled by default and also 
specified in the config file.
(II) "freetype" will be loaded by default.
(II) "dri" will be loaded. This was enabled by default and also 
specified in the config file.
(II) LoadModule: "glx"

(II) Loading /usr/lib/xorg/modules/extensions//libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Server Extension, version 1.1
(==) AIGLX enabled
(==) Exporting typical set of GLX visuals
(II) Loading extension GLX
(II) LoadModule: "dbe"

(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 1.1
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "dri"

(II) Loading /usr/lib/xorg/modules/extensions//libdri.so
(II) Module dri: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Server Extension, version 1.1
(II) Loading extension XFree86-DRI
(II) LoadModule: "extmod"

(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 1.1
(II) Loading extension SELinux
(II) Loading extension SHAPE
(II) Loading extension MIT-SUNDRY-NONSTANDARD
(II) Loading extension BIG-REQUESTS
(II) Loading extension SYNC
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XC-MISC
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-Misc
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension TOG-CUP
(II) Loading extension Extended-Visual-Information
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "freetype"

(II) Loading /usr/lib/xorg/modules/fonts//libfreetype.so
(II) Module freetype: vendor="X.Org Foundation & the After X-TT Project"
        compiled for 1.5.3, module version = 2.1.0
        Module class: X.Org Font Renderer
        ABI class: X.Org Font Renderer, version 0.6
(II) Loading font FreeType
(II) LoadModule: "nouveau"

(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.4.99.906, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) NOUVEAU driver
(II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT    (NV04)
        RIVA TNT2   (NV05)
        GeForce 256 (NV10)
        GeForce 2   (NV11, NV15)
        GeForce 4MX (NV17, NV18)
        GeForce 3   (NV20)
        GeForce 4Ti (NV25, NV28)
        GeForce FX  (NV3x)
        GeForce 6   (NV4x)
        GeForce 7   (G7x)
        GeForce 8   (G8x)
(II) Primary Device is: PCI 01@05:00:0
(EE) No devices detected.

Fatal server error:
no screens found

*
It expectantly fails.


The auto-generated config is here:*

[root@localhost ~]# cat /root/xorg.conf.new
Section "ServerLayout"
        Identifier     "X.org Configured"
        Screen      0  "Screen0" 0 0
        InputDevice    "Mouse0" "CorePointer"
        InputDevice    "Keyboard0" "CoreKeyboard"
EndSection

Section "Files"
        ModulePath   "/usr/lib/xorg/modules"
        FontPath     "catalogue:/etc/X11/fontpath.d"
        FontPath     "built-ins"
EndSection

Section "Module"
        Load  "glx"
        Load  "dbe"
        Load  "dri"
        Load  "extmod"
EndSection

Section "InputDevice"
        Identifier  "Keyboard0"
        Driver      "kbd"
EndSection

Section "InputDevice"
        Identifier  "Mouse0"
        Driver      "mouse"
        Option      "Protocol" "auto"
        Option      "Device" "/dev/input/mice"
        Option      "ZAxisMapping" "4 5 6 7"
EndSection

Section "Monitor"
        Identifier   "Monitor0"
        VendorName   "Monitor Vendor"
        ModelName    "Monitor Model"
EndSection

Section "Device"
        ### Available Driver options are:-
        ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
        ### <string>: "String", <freq>: "<f> Hz/kHz/MHz"
        ### [arg]: arg optional
        #Option     "SWcursor"                  # [<bool>]
        #Option     "HWcursor"                  # [<bool>]
        #Option     "NoAccel"                   # [<bool>]
        #Option     "ShadowFB"                  # [<bool>]
        #Option     "VideoKey"                  # <i>
        #Option     "FlatPanel"                 # [<bool>]
        #Option     "FPDither"                  # [<bool>]
        #Option     "FPScale"                   # [<bool>]
        #Option     "FPTweak"                   # <i>
        #Option     "CBLocation"                # <str>
        #Option     "CBSize"                    # <i>
        #Option     "Randr12"                   # [<bool>]
        #Option     "ScalingMode"               # <str>
        #Option     "PrepareFinishAccess"       # [<bool>]
        Identifier  "Card0"
        Driver      "nouveau"
        VendorName  "nVidia Corporation"
        BoardName   "NV44 [GeForce 6200 LE]"
        BusID       "PCI:1:0:0"
EndSection

Section "Screen"
        Identifier "Screen0"
        Device     "Card0"
        Monitor    "Monitor0"
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
        EndSubSection
EndSection


*As I see (but I am not sure that I do understand things right), x.org 
uses vesa_drv.so for configuration but it starts with nouveau_drv.so 
what looks for me as a mess.
So my questions are:
1. is there a simple way to know if /dev/fb is alive?
2. is there any simple way to make x.org working without ANY 
acceleration at the moment?
3. what am I doing wrong in my expirements? I can see 4 types of drivers:
- original drivers coming with the fedora10 kernel (I got rid of them 
before started playing with nouveau because they did not create even 
/dev/fb*);
- drm drivers (which are replacement for the original onesm right?)
- x.org drivers (which I've not changed/replaced)
- mesa drivers - what is their role - I still do not understand.

Thank a lot in advance for the answers/clues on my silly questions :-)


*

--------------070909080503030002060007
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>
<body bgcolor=3D"#ffffff" text=3D"#000000">
I am newbie in this topic and I have problems trying to bring x.org up
on the hardware I have:<br>
IBM QS22 BladeServer (PowerPC64 architecture) with PCI-Express
connected nVidia 6200 video card.<br>
OS: Fedora 10-ppc: Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue
Feb 10 14:55:56 EST 2009 ppc64 ppc64 ppc64 GNU/Linux<br>
<br>
I downloaded and compiled DRM driver (git clone
git://anongit.freedesktop.org/git/mesa/drm) and loaded it:<br>
<br>
<tt>[root@localhost ~]# modprobe drm<br>
[root@localhost ~]# modprobe nouveau<br>
[root@localhost ~]# dmesg | tail -n 3<br>
nouveau 0005:01:00.0: enabling device (0140 -&gt; 0142)<br>
[drm] Detected an NV44 generation card (0x044300b2)<br>
[drm] Initialized nouveau 0.0.12 libdrm-2.4.4-28-geb78c53aa1a980e60 on
minor 0<br>
[root@localhost ~]# lsmod | grep no<br>
nouveau=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 351856=C2=A0 0 <br>
drm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 249176=C2=A0 1 nouveau<br>
[root@localhost ~]# lspci -v<br>
[...]<br>
0005:01:00.0 VGA compatible controller: nVidia Corporation NV44
[GeForce 6200 LE] (rev a1) (prog-if 00 [VGA controller])<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Subsystem: ASUSTeK Computer In=
c. Device 827b<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Flags: bus master, fast devsel=
, latency 0, IRQ 106<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 3d080000000 (32-bit,=
 non-prefetchable) [size=3D16M]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 3d0c0000000 (64-bit,=
 prefetchable) [size=3D512M]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Memory at 3d081000000 (64-bit,=
 non-prefetchable) [size=3D16M]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expansion ROM at 3d082000000 [=
size=3D128K]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [60] Power Manag=
ement version 2<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [68] Message Sig=
nalled Interrupts: Mask- 64bit+
Count=3D1/1 Enable-<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [78] Express End=
point, MSI 00<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [100] Virtual Ch=
annel &lt;?&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Capabilities: [128] Power Budg=
eting &lt;?&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Kernel driver in use: nouveau<=
/tt><br>
<br>
<tt>[root@localhost ~]# ls -la /dev/fb*<br>
crw------- 1 root root 29, 0 2009-02-13 10:19 /dev/fb<br>
</tt><b><br>
<br>
Also I've got
<a class=3D"moz-txt-link-freetext" href=3D"http://cgit.freedesktop.org/me=
sa/mesa/snapshot/mesa_7_3.tar.bz2">http://cgit.freedesktop.org/mesa/mesa/=
snapshot/mesa_7_3.tar.bz2</a>,
compiled and installed.<br>
<br>
Then, I've tried configuring x.org:<br>
</b><br>
<tt>[root@localhost ~]# X -configure -verbose 255=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>
(II) config/hal: initialized<br>
X.Org X Server 1.5.3<br>
Release Date: 5 November 2008<br>
X Protocol Version 11, Revision 0<br>
Build Operating System: Linux 2.6.18-92.1.10.el5 ppc <br>
Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1
SMP Tue Feb 10 14:55:56 EST 2009 ppc64<br>
Build Date: 16 November 2008=C2=A0 08:30:07PM<br>
Build ID: xorg-x11-server 1.5.3-5.fc10 <br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Before reporting problems, che=
ck <a class=3D"moz-txt-link-freetext" href=3D"http://wiki.x.org">http://w=
iki.x.org</a><br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sure that you have the=
 latest version.<br>
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (++) from command line, (!!) n=
otice, (II) informational,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (WW) warning, (EE) error, (NI)=
 not implemented, (??) unknown.<br>
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 13 10:25:59 2009<=
br>
(II) No APM support in BIOS or kernel<br>
(II) Loader magic: 0x101e59a4<br>
(II) Module ABI versions:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org ANSI C Emulation: 0.4<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Video Driver: 4.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org XInput driver : 2.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Server Extension : 1.1<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Font Renderer : 0.6<br>
(II) Loader running on linux<br>
(--) using VT number 7<br>
<br>
(--) PCI:*(5@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161,
Mem @ 0x1020bd9c/976, 0x1020bd9c/976, 0x1020bd9c/976, BIOS @
0x????????/270581148<br>
List of video drivers:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nouveau<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mga<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i740<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sis<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 savage<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i128<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mach64<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 trident<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tdfx<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s3virge<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dummy<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r128<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cirrus<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 siliconmotion<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ati<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 glint<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sisusb<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rendition<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 radeon<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apm<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ast<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 voodoo<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vesa<br>
(II) LoadModule: "nouveau"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so<br>
(II) Module nouveau: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.906, modul=
e version =3D 0.0.10<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) LoadModule: "mga"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//mga_drv.so<br>
(II) Module mga: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.902, modul=
e version =3D 1.4.9<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "i740"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//i740_drv.so<br>
(II) Module i740: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.2.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "sis"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//sis_drv.so<br>
(II) Module sis: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 0.10.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "savage"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//savage_drv.so<br>
(II) Module savage: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 2.2.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "i128"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//i128_drv.so<br>
(II) Module i128: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.3.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "mach64"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//mach64_drv.so<br>
(II) Module mach64: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.906, modul=
e version =3D 6.8.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) LoadModule: "trident"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//trident_drv.so<br>
(II) Module trident: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.3.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "tdfx"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//tdfx_drv.so<br>
(II) Module tdfx: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.4.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "s3virge"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//s3virge_drv.so<br>
(II) Module s3virge: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.10.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "dummy"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//dummy_drv.so<br>
(II) Module dummy: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 0.3.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "r128"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//r128_drv.so<br>
(II) Module r128: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.906, modul=
e version =3D 6.8.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) LoadModule: "cirrus"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//cirrus_drv.so<br>
(II) Module cirrus: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.2.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "siliconmotion"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//siliconmotion_drv.so<br>
(II) Module siliconmotion: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.6.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "ati"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//ati_drv.so<br>
(II) Module ati: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 6.9.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) LoadModule: "glint"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//glint_drv.so<br>
(II) Module glint: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.902, modul=
e version =3D 1.2.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "v4l"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//v4l_drv.so<br>
(II) Module v4l: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 0.1.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "sisusb"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//sisusb_drv.so<br>
(II) Module sisusb: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 0.9.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "rendition"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//rendition_drv.so<br>
(II) Module rendition: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 4.2.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "radeon"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//radeon_drv.so<br>
(II) Module radeon: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 6.9.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) LoadModule: "apm"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//apm_drv.so<br>
(II) Module apm: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.2.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "ast"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//ast_drv.so<br>
(II) Module ast: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 0.85.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "voodoo"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//voodoo_drv.so<br>
(II) Module voodoo: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 4.3.99.902, modul=
e version =3D 1.1.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "fbdev"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//fbdev_drv.so<br>
(II) Module fbdev: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.2, module =
version =3D 0.3.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) LoadModule: "vesa"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//vesa_drv.so<br>
(II) Module vesa: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.905, modul=
e version =3D 1.3.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) System resource ranges:<br>
(II) Primary Device is: PCI 01@05:00:0<br>
(II) NOUVEAU driver <br>
(II) NOUVEAU driver for NVIDIA chipset families :<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIVA TNT=C2=A0=C2=A0=C2=A0 (NV=
04)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIVA TNT2=C2=A0=C2=A0 (NV05)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 256 (NV10)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 2=C2=A0=C2=A0 (NV11, N=
V15)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 4MX (NV17, NV18)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 3=C2=A0=C2=A0 (NV20)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 4Ti (NV25, NV28)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce FX=C2=A0 (NV3x)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 6=C2=A0=C2=A0 (NV4x)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 7=C2=A0=C2=A0 (G7x)<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 8=C2=A0=C2=A0 (G8x)<br=
>
(WW) Falling back to old probe method for i740<br>
(WW) Falling back to old probe method for sis<br>
(WW) Falling back to old probe method for i128<br>
(WW) Falling back to old probe method for trident<br>
(WW) Falling back to old probe method for s3virge<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 S3VProbe begin<br>
(WW) Falling back to old probe method for dummy<br>
(WW) Falling back to old probe method for cirrus<br>
(II) Loading sub module "cirrus_laguna"<br>
(II) LoadModule: "cirrus_laguna"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//cirrus_laguna.so<br>
(II) Module cirrus_laguna: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(II) Loading sub module "cirrus_alpine"<br>
(II) LoadModule: "cirrus_alpine"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//cirrus_alpine.so<br>
(II) Module cirrus_alpine: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.901, modul=
e version =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.0<br>
(WW) Falling back to old probe method for siliconmotion<br>
(WW) Falling back to old probe method for glint<br>
(WW) Falling back to old probe method for v4l<br>
(II) v4l driver for Video4Linux<br>
(WW) Falling back to old probe method for sisusb<br>
(WW) Falling back to old probe method for apm<br>
(WW) Falling back to old probe method for ast<br>
(WW) Falling back to old probe method for voodoo<br>
(II) FBDEV: driver for framebuffer: fbdev<br>
(II) VESA: driver for VESA chipsets: vesa<br>
(++) Using config file: "/root/xorg.conf.new"<br>
(=3D=3D) ServerLayout "X.org Configured"<br>
(**) |--&gt;Screen "Screen0" (0)<br>
(**) |=C2=A0=C2=A0 |--&gt;Monitor "Monitor0"<br>
(**) |=C2=A0=C2=A0 |--&gt;Device "Card0"<br>
(**) |--&gt;Input Device "Mouse0"<br>
(**) |--&gt;Input Device "Keyboard0"<br>
(=3D=3D) Automatically adding devices<br>
(=3D=3D) Automatically enabling devices<br>
(=3D=3D) Including the default font path
catalogue:/etc/X11/fontpath.d,built-ins.<br>
(**) FontPath set to:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catalogue:/etc/X11/fontpath.d,=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-ins,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catalogue:/etc/X11/fontpath.d,=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-ins<br>
(**) ModulePath set to "/usr/lib/xorg/modules"<br>
(WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will
be disabled.<br>
(WW) Disabling Mouse0<br>
(WW) Disabling Keyboard0<br>
Number of created screens does not match number of detected devices.<br>
=C2=A0 Configuration failed.</tt><br>
<br>
<b>As I understand, the configurator has detected my card and started
configuring it but something (what?) has failed.<br>
<br>
<br>
<br>
<br>
Ok, with no hope, I'm trying to start the X:<br>
</b><tt><br>
[root@localhost ~]# X -config xorg.conf.new -verbose
255=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <br>
(II) config/hal: initialized<br>
X.Org X Server 1.5.3<br>
Release Date: 5 November 2008<br>
X Protocol Version 11, Revision 0<br>
Build Operating System: Linux 2.6.18-92.1.10.el5 ppc <br>
Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1
SMP Tue Feb 10 14:55:56 EST 2009 ppc64<br>
Build Date: 16 November 2008=C2=A0 08:30:07PM<br>
Build ID: xorg-x11-server 1.5.3-5.fc10 <br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Before reporting problems, che=
ck <a class=3D"moz-txt-link-freetext" href=3D"http://wiki.x.org">http://w=
iki.x.org</a><br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to make sure that you have the=
 latest version.<br>
Markers: (--) probed, (**) from config file, (=3D=3D) default setting,<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (++) from command line, (!!) n=
otice, (II) informational,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (WW) warning, (EE) error, (NI)=
 not implemented, (??) unknown.<br>
(=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 13 10:26:48 2009<=
br>
(++) Using config file: "xorg.conf.new"<br>
(=3D=3D) ServerLayout "X.org Configured"<br>
(**) |--&gt;Screen "Screen0" (0)<br>
(**) |=C2=A0=C2=A0 |--&gt;Monitor "Monitor0"<br>
(**) |=C2=A0=C2=A0 |--&gt;Device "Card0"<br>
(**) |--&gt;Input Device "Mouse0"<br>
(**) |--&gt;Input Device "Keyboard0"<br>
(=3D=3D) Automatically adding devices<br>
(=3D=3D) Automatically enabling devices<br>
(=3D=3D) Including the default font path
catalogue:/etc/X11/fontpath.d,built-ins.<br>
(**) FontPath set to:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catalogue:/etc/X11/fontpath.d,=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-ins,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catalogue:/etc/X11/fontpath.d,=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 built-ins<br>
(**) ModulePath set to "/usr/lib/xorg/modules"<br>
(WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will
be disabled.<br>
(WW) Disabling Mouse0<br>
(WW) Disabling Keyboard0<br>
(II) No APM support in BIOS or kernel<br>
(II) Loader magic: 0x101e59a4<br>
(II) Module ABI versions:<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org ANSI C Emulation: 0.4<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Video Driver: 4.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org XInput driver : 2.1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Server Extension : 1.1<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 X.Org Font Renderer : 0.6<br>
(II) Loader running on linux<br>
(--) using VT number 7<br>
<br>
(--) PCI:*(5@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161,
Mem @ 0x1020bd9c/976, 0x1020bd9c/976, 0x1020bd9c/976, BIOS @
0x????????/270581148<br>
(II) System resource ranges:<br>
(II) "extmod" will be loaded. This was enabled by default and also
specified in the config file.<br>
(II) "dbe" will be loaded. This was enabled by default and also
specified in the config file.<br>
(II) "glx" will be loaded. This was enabled by default and also
specified in the config file.<br>
(II) "freetype" will be loaded by default.<br>
(II) "dri" will be loaded. This was enabled by default and also
specified in the config file.<br>
(II) LoadModule: "glx"<br>
<br>
(II) Loading /usr/lib/xorg/modules/extensions//libglx.so<br>
(II) Module glx: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Server Extens=
ion, version 1.1<br>
(=3D=3D) AIGLX enabled<br>
(=3D=3D) Exporting typical set of GLX visuals<br>
(II) Loading extension GLX<br>
(II) LoadModule: "dbe"<br>
<br>
(II) Loading /usr/lib/xorg/modules/extensions//libdbe.so<br>
(II) Module dbe: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Server Ext=
ension<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Server Extens=
ion, version 1.1<br>
(II) Loading extension DOUBLE-BUFFER<br>
(II) LoadModule: "dri"<br>
<br>
(II) Loading /usr/lib/xorg/modules/extensions//libdri.so<br>
(II) Module dri: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Server Extens=
ion, version 1.1<br>
(II) Loading extension XFree86-DRI<br>
(II) LoadModule: "extmod"<br>
<br>
(II) Loading /usr/lib/xorg/modules/extensions//libextmod.so<br>
(II) Module extmod: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 1.0.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Server Ext=
ension<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Server Extens=
ion, version 1.1<br>
(II) Loading extension SELinux<br>
(II) Loading extension SHAPE<br>
(II) Loading extension MIT-SUNDRY-NONSTANDARD<br>
(II) Loading extension BIG-REQUESTS<br>
(II) Loading extension SYNC<br>
(II) Loading extension MIT-SCREEN-SAVER<br>
(II) Loading extension XC-MISC<br>
(II) Loading extension XFree86-VidModeExtension<br>
(II) Loading extension XFree86-Misc<br>
(II) Loading extension XFree86-DGA<br>
(II) Loading extension DPMS<br>
(II) Loading extension TOG-CUP<br>
(II) Loading extension Extended-Visual-Information<br>
(II) Loading extension XVideo<br>
(II) Loading extension XVideo-MotionCompensation<br>
(II) Loading extension X-Resource<br>
(II) LoadModule: "freetype"<br>
<br>
(II) Loading /usr/lib/xorg/modules/fonts//libfreetype.so<br>
(II) Module freetype: vendor=3D"X.Org Foundation &amp; the After X-TT
Project"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.5.3, module ver=
sion =3D 2.1.0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Font Rende=
rer<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Font Renderer=
, version 0.6<br>
(II) Loading font FreeType<br>
(II) LoadModule: "nouveau"<br>
<br>
(II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so<br>
(II) Module nouveau: vendor=3D"X.Org Foundation"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compiled for 1.4.99.906, modul=
e version =3D 0.0.10<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Module class: X.Org Video Driv=
er<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ABI class: X.Org Video Driver,=
 version 4.1<br>
(II) NOUVEAU driver <br>
(II) NOUVEAU driver for NVIDIA chipset families :<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIVA TNT=C2=A0=C2=A0=C2=A0 (NV=
04)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RIVA TNT2=C2=A0=C2=A0 (NV05)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 256 (NV10)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 2=C2=A0=C2=A0 (NV11, N=
V15)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 4MX (NV17, NV18)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 3=C2=A0=C2=A0 (NV20)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 4Ti (NV25, NV28)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce FX=C2=A0 (NV3x)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 6=C2=A0=C2=A0 (NV4x)<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 7=C2=A0=C2=A0 (G7x)<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GeForce 8=C2=A0=C2=A0 (G8x)<br=
>
(II) Primary Device is: PCI 01@05:00:0<br>
(EE) No devices detected.<br>
<br>
Fatal server error:<br>
no screens found</tt><br>
<br>
<b><br>
It expectantly fails.<br>
<br>
<br>
The auto-generated config is here:</b><br>
<br>
<tt>[root@localhost ~]# cat /root/xorg.conf.new <br>
Section "ServerLayout"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier=C2=A0=C2=A0=C2=A0=C2=
=A0 "X.org Configured"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Screen=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0=C2=A0 "Screen0" 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 InputDevice=C2=A0=C2=A0=C2=A0 =
"Mouse0" "CorePointer"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 InputDevice=C2=A0=C2=A0=C2=A0 =
"Keyboard0" "CoreKeyboard"<br>
EndSection<br>
<br>
Section "Files"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ModulePath=C2=A0=C2=A0 "/usr/l=
ib/xorg/modules"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FontPath=C2=A0=C2=A0=C2=A0=C2=A0=
 "catalogue:/etc/X11/fontpath.d"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FontPath=C2=A0=C2=A0=C2=A0=C2=A0=
 "built-ins"<br>
EndSection<br>
<br>
Section "Module"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=C2=A0 "glx"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=C2=A0 "dbe"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=C2=A0 "dri"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Load=C2=A0 "extmod"<br>
EndSection<br>
<br>
Section "InputDevice"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier=C2=A0 "Keyboard0"<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Driver=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "kbd"<br>
EndSection<br>
<br>
Section "InputDevice"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier=C2=A0 "Mouse0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Driver=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "mouse"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Option=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "Protocol" "auto"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Option=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "Device" "/dev/input/mice"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Option=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "ZAxisMapping" "4 5 6 7"<br>
EndSection<br>
<br>
Section "Monitor"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier=C2=A0=C2=A0 "Monito=
r0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VendorName=C2=A0=C2=A0 "Monito=
r Vendor"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ModelName=C2=A0=C2=A0=C2=A0 "M=
onitor Model"<br>
EndSection<br>
<br>
Section "Device"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ### Available Driver options a=
re:-<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ### Values: &lt;i&gt;: integer=
, &lt;f&gt;: float, &lt;bool&gt;:
"True"/"False",<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ### &lt;string&gt;: "String", =
&lt;freq&gt;: "&lt;f&gt;
Hz/kHz/MHz"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ### [arg]: arg optional<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "SWcursor"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "HWcursor"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "NoAccel"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "ShadowFB"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "VideoKey"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # &lt;i&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "FlatPanel"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "FPDither"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "FPScale"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "FPTweak"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # &lt;i&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "CBLocation"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # &lt;str&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "CBSize"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # &lt;i&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "Randr12"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "ScalingMode"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # &lt;str&gt;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #Option=C2=A0=C2=A0=C2=A0=C2=A0=
 "PrepareFinishAccess"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # [&lt;bool&gt=
;]<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier=C2=A0 "Card0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Driver=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "nouveau"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VendorName=C2=A0 "nVidia Corpo=
ration"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BoardName=C2=A0=C2=A0 "NV44 [G=
eForce 6200 LE]"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BusID=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "PCI:1:0:0"<br>
EndSection<br>
<br>
Section "Screen"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Identifier "Screen0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device=C2=A0=C2=A0=C2=A0=C2=A0=
 "Card0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Monitor=C2=A0=C2=A0=C2=A0 "Mon=
itor0"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 1<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 4<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 8<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 15<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 16<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SubSection "Display"<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Viewport=C2=A0=C2=A0 0 0<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 Depth=C2=A0=C2=A0=C2=A0=C2=A0 24<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EndSubSection<br>
EndSection<br>
</tt><br>
<br>
<b>As I see (but I am not sure that I do understand things right),
x.org uses vesa_drv.so for configuration but it starts with
nouveau_drv.so what looks for me as a mess.<br>
So my questions are:<br>
1. is there a simple way to know if /dev/fb is alive?<br>
2. is there any simple way to make x.org working without ANY
acceleration at the moment?<br>
3. what am I doing wrong in my expirements? I can see 4 types of
drivers:<br>
- original drivers coming with the fedora10 kernel (I got rid of them
before started playing with nouveau because they did not create even
/dev/fb*);<br>
- drm drivers (which are replacement for the original onesm right?)<br>
- x.org drivers (which I've not changed/replaced)<br>
- mesa drivers - what is their role - I still do not understand.<br>
<br>
Thank a lot in advance for the answers/clues on my silly questions :-)<br=
>
<br>
<br>
</b>
</body>
</html>

--------------070909080503030002060007--

--===============1894554564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1894554564==--

From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Mon, 16 Feb 2009 16:32:08 +0300
Message-ID: <49996AD8.2010602@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <21d7e9970902142118u50a56366u2efa5fe0d8aadd72-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thank you all for the help, I got a bit further in my way :-)

First of all, X.org understands domains but something is wrong. I 
managed to change the video card's domain to #1. X.org failed with:

(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: Searching for BusID pci:0001:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: drmOpenMinor returns 9
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card1
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card2
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card3
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card4
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card5
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card6
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card7
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card8
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card9
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card10
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card11
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card12
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card13
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card14
drmOpenByBusid: drmOpenMinor returns -1
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmGetBusid returned ''
(EE) NOUVEAU(0): wrong DRM version
(EE) NOUVEAU(0): 1365:


Maybe it helps somebody who is responsible for multi-domain capable code :-)

Then, I made a try to move the card to domain #0. Having the BIOS source 
code, it was easy.
But it keeps failing with the same error -
(EE) NOUVEAU(0): wrong DRM version
(EE) NOUVEAU(0): 1365:

What does it mean?
I'm also a little confused by a try loading something called "int10h" 
which does not exist in any form on my server.


Linux Fedora 10, DRI/DRM has been taken from GIT less than week ago.

"lspci", config and x.log are below.

[root@localhost linux-core]# uname -a
Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue Feb 10 14:55:56 EST 
2009 ppc64 ppc64 ppc64 GNU/Linux

[root@localhost ~]# lspci -vv
[...]
0000:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
6200 LE] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 827b
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- 
ParErr+ Stepping- SERR+ FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 98
        Region 0: Memory at 1c080000000 (32-bit, non-prefetchable) 
[size=16M]
        Region 1: Memory at 1c0c0000000 (64-bit, prefetchable) [size=512M]
        Region 3: Memory at 1c081000000 (64-bit, non-prefetchable) 
[size=16M]
        Expansion ROM at 1c082000000 [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ 
Count=1/1 Enable-
                Address: 0000000000000000  Data: 0000
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s 
<512ns, L1 <4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal- 
Unsupported-
                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr- 
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, 
Latency L0 <1us, L1 <4us
                        ClockPM- Suprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- Retrain- 
CommClk-
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+ 
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Kernel driver in use: nouveau



[root@localhost ~]# X -config /root/xorg.conf.new -verbose 255
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
(==) Log file: "/var/log/Xorg.0.log", Time: Mon Feb 16 08:12:47 2009
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

(--) PCI:*(0@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161, 
Mem @ 0x1020bd9c/448, 0x1020bd9c/448, 0x1020bd9c/448, BIOS @ 
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
(II) Primary Device is: PCI 01@00:00:0
(II) resource ranges after probing:
(--) NOUVEAU(0): Chipset: "NVIDIA NV20"
(II) Loading sub module "int10"
(II) LoadModule: "int10"

(II) Loading /usr/lib/xorg/modules//libint10.so
(II) Module int10: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 1.0.0
        ABI class: X.Org Video Driver, version 4.1
(==) NOUVEAU(0): Depth 24, (==) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"

(II) Loading /usr/lib/xorg/modules//libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
        compiled for 1.5.3, module version = 0.1.0
        ABI class: X.Org Video Driver, version 4.1
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xC0000000
(--) NOUVEAU(0): MMIO registers at 0x80000000
(II) Loading sub module "dri"
(II) LoadModule: "dri"

(II) Reloading /usr/lib/xorg/modules/extensions//libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 9, (OK)
drmOpenByBusid: drmOpenMinor returns 9
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(EE) NOUVEAU(0): wrong DRM version
(EE) NOUVEAU(0): 1365:
(II) UnloadModule: "nouveau"
(II) UnloadModule: "dri"
(II) UnloadModule: "vgahw"
(II) Unloading /usr/lib/xorg/modules//libvgahw.so
(II) UnloadModule: "int10"
(II) Unloading /usr/lib/xorg/modules//libint10.so
(EE) Screen(s) found, but none have a usable configuration.

Fatal server error:
no screens found




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
        Identifier  "Card0"
        Driver      "nouveau"
        VendorName  "nVidia Corporation"
        BoardName   "NV44 [GeForce 6200 LE]"
        BusID       "PCI:1@0:0:0"
EndSection

Section "Screen"
        Identifier "Screen0"
        Device     "Card0"
        Monitor    "Monitor0"
        SubSection "Display"
                Viewport   0 0
                Depth     24
        EndSubSection
EndSection

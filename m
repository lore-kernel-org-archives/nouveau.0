From: aik <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Tue, 17 Feb 2009 20:56:24 +0300
Message-ID: <499AFA48.3070007@gmail.com>
References: <49959366.2000805@gmail.com>	
	<6a89f9d50902131507h23cf0b50h62c887502d028073@mail.gmail.com>	
	<49968B05.4090701@gmail.com>	
	<6a89f9d50902140232h4b262deby85e7b437067fbc99@mail.gmail.com>	
	<21d7e9970902142118u50a56366u2efa5fe0d8aadd72@mail.gmail.com>	
	<49996AD8.2010602@gmail.com>
	<586c2acd0902160759u535b18dfsb5554f5a2d1a3d21@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <586c2acd0902160759u535b18dfsb5554f5a2d1a3d21-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

So, with the help of the community, I've got all the binaries compiled 
and ready-to-run. But it crashes in the very beginning. So the question 
is - what does nouveau expect from the system BIOS to get started (if it 
does)? I'm asking because I know for sure that the BIOS I have does 
support video very limited and I'm not sure that the support implemented 
at the moment is enough to get X.org up.

Also, I've heard an opinion that X.org cannot work with the cards mapped 
behind 4GB range. My server maps all the PCI devices there (see the 
lspci output). Can anybody comment on that?

And thank you all again!


[root@localhost ~]# lspci -v
[...]
0000:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
6200 LE] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 827b
        Flags: bus master, fast devsel, latency 0, IRQ 98
        Memory at 1c080000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 1c0c0000000 (64-bit, prefetchable) [size=512M]
        Memory at 1c081000000 (64-bit, non-prefetchable) [size=16M]
        Expansion ROM at 1c082000000 [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ 
Count=1/1 Enable-
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel <?>
        Capabilities: [128] Power Budgeting <?>
        Kernel driver in use: nouveau


[root@localhost ~]# X -config /root/xorg.conf.new -verbose 255
(II) config/hal: initialized
X.Org X Server 1.5.3
Release Date: 5 November 2008
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.18-92.1.18.el5 ppc
Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1 SMP 
Tue Feb 10 14:55:56 EST 2009 ppc64
Build Date: 11 December 2008  05:29:05PM
Build ID: xorg-x11-server 1.5.3-6.fc10
        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Tue Feb 17 12:47:22 2009
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
        compiled for 1.5.3, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 4.1
(II) NOUVEAU driver Date:   Mon Feb 16 13:09:39 2009 +1000
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
(II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module 
version 0.0.12

Backtrace:
0: X(xorg_backtrace+0x50) [0x100ffb80]
1: X(xf86SigHandler+0x68) [0x10082eb8]
2: [0x100364]
3: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NVCommonSetup+0x164) 
[0xe63f564]
4: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0xe63b1a8]
5: X(InitOutput+0xd90) [0x10066c40]
6: X(main+0x288) [0x10022468]
7: /lib/libc.so.6 [0xfe0ebc4]
8: /lib/libc.so.6 [0xfe0ed80]

Fatal server error:
Caught signal 11.  Server aborting

Aborted
[root@localhost ~]#

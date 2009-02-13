From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: running x.org on powerpc64 with nvidia6200
Date: Fri, 13 Feb 2009 21:12:43 +0200
Message-ID: <20090213211243.60d6955a@daedalus.pq.iki.fi>
References: <49959366.2000805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49959366.2000805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Alexey Kardashevsky <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, 13 Feb 2009 18:36:06 +0300
Alexey Kardashevsky <aik.rsdn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> I am newbie in this topic and I have problems trying to bring x.org up 
> on the hardware I have:
> IBM QS22 BladeServer (PowerPC64 architecture) with PCI-Express connected 
> nVidia 6200 video card.

Since this is a ppc64, architecture related bugs in Nouveau may occur.
I don't really know the situation here.

> OS: Fedora 10-ppc: Linux localhost.localdomain 2.6.27.5aik #1 SMP Tue 
> Feb 10 14:55:56 EST 2009 ppc64 ppc64 ppc64 GNU/Linux
> 
> I downloaded and compiled DRM driver (git clone 
> git://anongit.freedesktop.org/git/mesa/drm) and loaded it:
> 
> [root@localhost ~]# modprobe drm
> [root@localhost ~]# modprobe nouveau
> [root@localhost ~]# dmesg | tail -n 3
> nouveau 0005:01:00.0: enabling device (0140 -> 0142)
> [drm] Detected an NV44 generation card (0x044300b2)
> [drm] Initialized nouveau 0.0.12 libdrm-2.4.4-28-geb78c53aa1a980e60 on 
> minor 0
> [root@localhost ~]# lsmod | grep no
> nouveau               351856  0
> drm                   249176  1 nouveau
> [root@localhost ~]# lspci -v
> [...]
> 0005:01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 
> 6200 LE] (rev a1) (prog-if 00 [VGA controller])

Hmm, note the bus id.

>         Subsystem: ASUSTeK Computer Inc. Device 827b
>         Flags: bus master, fast devsel, latency 0, IRQ 106
>         Memory at 3d080000000 (32-bit, non-prefetchable) [size=16M]
>         Memory at 3d0c0000000 (64-bit, prefetchable) [size=512M]
>         Memory at 3d081000000 (64-bit, non-prefetchable) [size=16M]
>         Expansion ROM at 3d082000000 [size=128K]
>         Capabilities: [60] Power Management version 2
>         Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ 
> Count=1/1 Enable-
>         Capabilities: [78] Express Endpoint, MSI 00
>         Capabilities: [100] Virtual Channel <?>
>         Capabilities: [128] Power Budgeting <?>
>         Kernel driver in use: nouveau
> 
> [root@localhost ~]# ls -la /dev/fb*
> crw------- 1 root root 29, 0 2009-02-13 10:19 /dev/fb

This is offb, right? If it is nvidiafb, you need to use... can't recall,
see here: http://nouveau.freedesktop.org/wiki/Kernel_Framebuffer_Driver

The device you should get from nouveau DRM is /dev/dri/card0.

> Then, I've tried configuring x.org:
> *
> [root@localhost ~]# X -configure -verbose 255                    

Should this really work? I've no idea.

> Ok, with no hope, I'm trying to start the X:
> *
> [root@localhost ~]# X -config xorg.conf.new -verbose 
> 255                            
> (II) config/hal: initialized
> X.Org X Server 1.5.3
> Release Date: 5 November 2008
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 2.6.18-92.1.10.el5 ppc
> Current Operating System: Linux localhost.localdomain 2.6.27.5aik #1 SMP 
> Tue Feb 10 14:55:56 EST 2009 ppc64
> Build Date: 16 November 2008  08:30:07PM
> Build ID: xorg-x11-server 1.5.3-5.fc10
>         Before reporting problems, check http://wiki.x.org
>         to make sure that you have the latest version.
> Markers: (--) probed, (**) from config file, (==) default setting,
>         (++) from command line, (!!) notice, (II) informational,
>         (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (==) Log file: "/var/log/Xorg.0.log", Time: Fri Feb 13 10:26:48 2009
> (++) Using config file: "xorg.conf.new"
> (==) ServerLayout "X.org Configured"
> (**) |-->Screen "Screen0" (0)
> (**) |   |-->Monitor "Monitor0"
> (**) |   |-->Device "Card0"
> (**) |-->Input Device "Mouse0"
> (**) |-->Input Device "Keyboard0"
> (==) Automatically adding devices
> (==) Automatically enabling devices
> (==) Including the default font path 
> catalogue:/etc/X11/fontpath.d,built-ins.
> (**) FontPath set to:
>         catalogue:/etc/X11/fontpath.d,
>         built-ins,
>         catalogue:/etc/X11/fontpath.d,
>         built-ins
> (**) ModulePath set to "/usr/lib/xorg/modules"
> (WW) AllowEmptyInput is on, devices using drivers 'kbd' or 'mouse' will 
> be disabled.
> (WW) Disabling Mouse0
> (WW) Disabling Keyboard0
> (II) No APM support in BIOS or kernel
> (II) Loader magic: 0x101e59a4
> (II) Module ABI versions:
>         X.Org ANSI C Emulation: 0.4
>         X.Org Video Driver: 4.1
>         X.Org XInput driver : 2.1
>         X.Org Server Extension : 1.1
>         X.Org Font Renderer : 0.6
> (II) Loader running on linux
> (--) using VT number 7
> 
> (--) PCI:*(5@1:0:0) nVidia Corporation NV44 [GeForce 6200 LE] rev 161, 
> Mem @ 0x1020bd9c/976, 0x1020bd9c/976, 0x1020bd9c/976, BIOS @ 
> 0x????????/270581148

> (II) LoadModule: "nouveau"
> 
> (II) Loading /usr/lib/xorg/modules/drivers//nouveau_drv.so
> (II) Module nouveau: vendor="X.Org Foundation"
>         compiled for 1.4.99.906, module version = 0.0.10
>         Module class: X.Org Video Driver
>         ABI class: X.Org Video Driver, version 4.1
> (II) NOUVEAU driver
> (II) NOUVEAU driver for NVIDIA chipset families :
>         RIVA TNT    (NV04)
>         RIVA TNT2   (NV05)
>         GeForce 256 (NV10)
>         GeForce 2   (NV11, NV15)
>         GeForce 4MX (NV17, NV18)
>         GeForce 3   (NV20)
>         GeForce 4Ti (NV25, NV28)
>         GeForce FX  (NV3x)
>         GeForce 6   (NV4x)
>         GeForce 7   (G7x)
>         GeForce 8   (G8x)
> (II) Primary Device is: PCI 01@05:00:0

Above it says bus id (5@1:0:0) and here 01@05:00:0...
could that be the problem?

> (EE) No devices detected.
> 
> Fatal server error:
> no screens found

> The auto-generated config is here:*
> 
> [root@localhost ~]# cat /root/xorg.conf.new
> Section "ServerLayout"
>         Identifier     "X.org Configured"
>         Screen      0  "Screen0" 0 0
>         InputDevice    "Mouse0" "CorePointer"
>         InputDevice    "Keyboard0" "CoreKeyboard"
> EndSection
> 
> Section "Files"
>         ModulePath   "/usr/lib/xorg/modules"
>         FontPath     "catalogue:/etc/X11/fontpath.d"
>         FontPath     "built-ins"
> EndSection
> 
> Section "Module"
>         Load  "glx"
>         Load  "dbe"
>         Load  "dri"
>         Load  "extmod"
> EndSection
> 
> Section "InputDevice"
>         Identifier  "Keyboard0"
>         Driver      "kbd"
> EndSection
> 
> Section "InputDevice"
>         Identifier  "Mouse0"
>         Driver      "mouse"
>         Option      "Protocol" "auto"
>         Option      "Device" "/dev/input/mice"
>         Option      "ZAxisMapping" "4 5 6 7"
> EndSection
> 
> Section "Monitor"
>         Identifier   "Monitor0"
>         VendorName   "Monitor Vendor"
>         ModelName    "Monitor Model"
> EndSection
> 
> Section "Device"
>         ### Available Driver options are:-
>         ### Values: <i>: integer, <f>: float, <bool>: "True"/"False",
>         ### <string>: "String", <freq>: "<f> Hz/kHz/MHz"
>         ### [arg]: arg optional
>         #Option     "SWcursor"                  # [<bool>]
>         #Option     "HWcursor"                  # [<bool>]
>         #Option     "NoAccel"                   # [<bool>]
>         #Option     "ShadowFB"                  # [<bool>]
>         #Option     "VideoKey"                  # <i>
>         #Option     "FlatPanel"                 # [<bool>]
>         #Option     "FPDither"                  # [<bool>]
>         #Option     "FPScale"                   # [<bool>]
>         #Option     "FPTweak"                   # <i>
>         #Option     "CBLocation"                # <str>
>         #Option     "CBSize"                    # <i>
>         #Option     "Randr12"                   # [<bool>]
>         #Option     "ScalingMode"               # <str>
>         #Option     "PrepareFinishAccess"       # [<bool>]
>         Identifier  "Card0"
>         Driver      "nouveau"
>         VendorName  "nVidia Corporation"
>         BoardName   "NV44 [GeForce 6200 LE]"
>         BusID       "PCI:1:0:0"

And this is a third bus id, different from the two above?
It's confusing at least. Try without any BusID in config?

> EndSection
> 
> Section "Screen"
>         Identifier "Screen0"
>         Device     "Card0"
>         Monitor    "Monitor0"
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     1
>         EndSubSection
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     4
>         EndSubSection
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     8
>         EndSubSection
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     15
>         EndSubSection
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     16
>         EndSubSection
>         SubSection "Display"
>                 Viewport   0 0
>                 Depth     24
>         EndSubSection
> EndSection

The config could be cleaned somewhat, but I don't see any other very odd
things.

> *As I see (but I am not sure that I do understand things right), x.org 
> uses vesa_drv.so for configuration but it starts with nouveau_drv.so 
> what looks for me as a mess.
> So my questions are:
> 1. is there a simple way to know if /dev/fb is alive?

That's the wrong device, AFAIK.

> 2. is there any simple way to make x.org working without ANY 
> acceleration at the moment?

Enable NoAccel and ShadowFB in nouveau's Device section in xorg.conf...
but I don't see any reason for that, since DRM is not complaining.

> 3. what am I doing wrong in my expirements? I can see 4 types of drivers:
> - original drivers coming with the fedora10 kernel (I got rid of them 
> before started playing with nouveau because they did not create even 
> /dev/fb*);

That's the kernel framebuffer driver device, which is usually harmful
to accelerated X.org drivers, but since you have ppc, you probably
need something. The offb driver in kernel should work.

> - drm drivers (which are replacement for the original onesm right?)

Original what?
DRM modules are the kernel part of the Nouveau driver. Without them you
don't get any acceleration. These are not kernel framebuffer drivers (yet,
at least).

> - x.org drivers (which I've not changed/replaced)

nouveau_drv.so, required, from git.

> - mesa drivers - what is their role - I still do not understand.

3D acceleration. Not in any usable state at this time, and not
included in any Mesa release yet. You can just forget it and enjoy
software OpenGL rendering.

-- 
Pekka Paalanen
http://www.iki.fi/pq/

From: =?UTF-8?B?VmljdG9yIExlZsOodnJl?= <victorlefevre-GANU6spQydw@public.gmane.org>
Subject: Re: Nouveau doesn't use the maximal resolution of my
 screen and GPU
Date: Wed, 29 Oct 2014 08:22:47 +0100
Message-ID: <545095C7.2070507@free.fr>
References: <544D0A58.30409@free.fr>	<CAKb7Uvi4vF6aHwJMC7zSey3V9M1PAKBp-3YLkMhrRZjLwpO7Dg@mail.gmail.com>	<544FFF5A.3070408@free.fr>	<CAKb7Uvi-H1DUh37=cH19dXxadsZLEJx3YsmzO1z9-NgOXpvG=w@mail.gmail.com>	<5450076F.3020503@free.fr>
 <CAKb7UvgHxqu5PxFoeSfz81pneVAwXrbJACbhZwxN7zMKgDS69Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060503010107010603070801"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvgHxqu5PxFoeSfz81pneVAwXrbJACbhZwxN7zMKgDS69Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------060503010107010603070801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

You're right, fbdev managed the graphic interface...

I correct the boot options, Now, Nouveau works !

Cf the new Xorg.log

xrandr give this output :

Screen 0: minimum 320 x 200, current 1440 x 900, maximum 4096 x 4096
DVI-I-1 connected 1440x900+0+0 (normal left inverted right x axis y=20
axis) 408mm x 255mm
    1440x900       59.9*+   75.0
    1280x1024      75.0     60.0
    1280x960       60.0
    1280x800       74.9     59.8
    1152x864       75.0
    1024x768       75.1     70.1     60.0
    832x624        74.6
    800x600        72.2     75.0     60.3     56.2
    640x480        75.0     72.8     66.7     60.0
    720x400        70.1

Thank you a lot.

I have only a little problem now. In all applications, the displayed=20
color for the text is not correct. It's green khaki instead of black.=20
(cf the screenshoot)

Can it come from Nouveau?

Le 28/10/2014 22:24, Ilia Mirkin a =C3=A9crit :
> There is no sign of the nouveau kernel module being loaded. Make sure
> it's loaded, otherwise it won't work. Some distributions blacklist it
> in modprobe.conf or a related file. I believe the nvidia blob
> installer might as well.
>
> Actually, looks like you've explicitly disabled it --
>
> Oct 28 21:57:22 victorlefevre-MS-7235 kernel: [    0.000000] Kernel
> command line: BOOT_IMAGE=3D/boot/vmlinuz-3.13.0-38-generic
> root=3DUUID=3D7b0559d9-fbbe-4635-b244-bda94aa0a640 ro quiet splash
> nomodeset vt.handoff=3D7
>
> "nomodeset" turns off all modesetting, which disables nouveau from
> being loaded. Remove that, and you'll get further.
>
> On Tue, Oct 28, 2014 at 5:15 PM, Victor Lef=C3=A8vre<victorlefevre@free=
.fr>  wrote:
>> Yes. I attached the logs.
>>
>> (There is several error messages.)
>>
>> Le 28/10/2014 21:43, Ilia Mirkin a =C3=A9crit :
>>
>>> Output name 'default' is not the name of an output nouveau can produc=
e
>>> (or nvidia for that matter, afaik). This is the vesa driver or...
>>> something. Can you supply xorg log + dmesg?
>>>
>>> On Tue, Oct 28, 2014 at 4:40 PM, Victor Lef=C3=A8vre<victorlefevre@fr=
ee.fr>
>>> wrote:
>>>> Hi Illia,
>>>>
>>>>
>>>> With Nouveau :
>>>> xrandr: Failed to get size of gamma for output default
>>>> Screen 0: minimum 1024 x 768, current 1024 x 768, maximum 1024 x 768
>>>> default connected 1024x768+0+0 0mm x 0mm
>>>>      1024x768       76.0*
>>>>
>>>>
>>>> With the Nvidia Driver :
>>>>
>>>> xrandr: Failed to get size of gamma for output default
>>>> Screen 0: minimum 640 x 480, current 1280 x 1024, maximum 1280 x 102=
4
>>>> default connected 1280x1024+0+0 0mm x 0mm
>>>>      1280x1024       0.0*
>>>>      1024x768        0.0
>>>>      800x600         0.0
>>>>      640x480         0.0
>>>>
>>>>
>>>> Le 27/10/2014 05:19, Ilia Mirkin a =C3=A9crit :
>>>>
>>>>> What does 'xrandr' output?
>>>>>
>>>>> On Sun, Oct 26, 2014 at 10:51 AM, Victor Lef=C3=A8vre<victorlefevre=
@free.fr>
>>>>> wrote:
>>>>>> Hi everybody,
>>>>>>
>>>>>> I'm using Lubuntu 14.04 on an old desktop PC with a NVIDIA GeForce=
 7600
>>>>>> GS
>>>>>> and a screen of 19 inches.
>>>>>>
>>>>>> The maximal resolution of my screen with Nvidia drivers is 1280x10=
24.
>>>>>> (In
>>>>>> particular, I use the Nvidia 331.89 driver)
>>>>>>
>>>>>> With Nouveau driver, the maximal resolution falls to 1024x768.
>>>>>>
>>>>>> Is there a solution for increasing the maximum resolution with Nou=
veau
>>>>>> ?
>>>>>>
>>>>>> Best regards,
>>>>>>
>>>>>> Victor Lef=C3=A8vre
>>>>>> _______________________________________________
>>>>>> Nouveau mailing list
>>>>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>>>>> http://lists.freedesktop.org/mailman/listinfo/nouveau


--------------060503010107010603070801
Content-Type: text/x-log;
 name="Xorg.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Xorg.log"

[    17.750] 
X.Org X Server 1.15.1
Release Date: 2014-04-13
[    17.750] X Protocol Version 11, Revision 0
[    17.750] Build Operating System: Linux 3.2.0-37-generic i686 Ubuntu
[    17.750] Current Operating System: Linux victorlefevre-MS-7235 3.13.0-38-generic #65-Ubuntu SMP Thu Oct 9 11:39:01 UTC 2014 i686
[    17.750] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.13.0-38-generic root=UUID=7b0559d9-fbbe-4635-b244-bda94aa0a640 ro quiet splash vt.handoff=7
[    17.750] Build Date: 30 July 2014  12:19:53AM
[    17.750] xorg-server 2:1.15.1-0ubuntu2.1 (For technical support please see http://www.ubuntu.com/support) 
[    17.750] Current version of pixman: 0.30.2
[    17.751] 	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
[    17.751] Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    17.751] (==) Log file: "/var/log/Xorg.0.log", Time: Wed Oct 29 07:56:32 2014
[    17.768] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    17.769] (==) No Layout section.  Using the first Screen section.
[    17.769] (==) No screen section available. Using defaults.
[    17.769] (**) |-->Screen "Default Screen Section" (0)
[    17.769] (**) |   |-->Monitor "<default monitor>"
[    17.770] (==) No monitor specified for screen "Default Screen Section".
	Using a default monitor configuration.
[    17.770] (==) Automatically adding devices
[    17.770] (==) Automatically enabling devices
[    17.770] (==) Automatically adding GPU devices
[    17.770] (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
[    17.770] 	Entry deleted from font path.
[    17.770] (WW) The directory "/usr/share/fonts/X11/100dpi/" does not exist.
[    17.770] 	Entry deleted from font path.
[    17.770] (WW) The directory "/usr/share/fonts/X11/75dpi/" does not exist.
[    17.770] 	Entry deleted from font path.
[    17.770] (WW) The directory "/usr/share/fonts/X11/100dpi" does not exist.
[    17.770] 	Entry deleted from font path.
[    17.770] (WW) The directory "/usr/share/fonts/X11/75dpi" does not exist.
[    17.770] 	Entry deleted from font path.
[    17.770] (==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/Type1,
	built-ins
[    17.770] (==) ModulePath set to "/usr/lib/i386-linux-gnu/xorg/extra-modules,/usr/lib/xorg/extra-modules,/usr/lib/xorg/modules"
[    17.770] (II) The server relies on udev to provide the list of input devices.
	If no devices become available, reconfigure udev or disable AutoAddDevices.
[    17.770] (II) Loader magic: 0xb77876c0
[    17.770] (II) Module ABI versions:
[    17.770] 	X.Org ANSI C Emulation: 0.4
[    17.770] 	X.Org Video Driver: 15.0
[    17.770] 	X.Org XInput driver : 20.0
[    17.770] 	X.Org Server Extension : 8.0
[    17.770] (II) xfree86: Adding drm device (/dev/dri/card0)
[    17.772] (--) PCI:*(0:1:0:0) 10de:0392:1043:8202 rev 161, Mem @ 0xfa000000/16777216, 0xd0000000/268435456, 0xfb000000/16777216, I/O @ 0x0000df00/128, BIOS @ 0x????????/131072
[    17.772] Initializing built-in extension Generic Event Extension
[    17.772] Initializing built-in extension SHAPE
[    17.772] Initializing built-in extension MIT-SHM
[    17.772] Initializing built-in extension XInputExtension
[    17.772] Initializing built-in extension XTEST
[    17.772] Initializing built-in extension BIG-REQUESTS
[    17.772] Initializing built-in extension SYNC
[    17.772] Initializing built-in extension XKEYBOARD
[    17.772] Initializing built-in extension XC-MISC
[    17.772] Initializing built-in extension SECURITY
[    17.772] Initializing built-in extension XINERAMA
[    17.772] Initializing built-in extension XFIXES
[    17.772] Initializing built-in extension RENDER
[    17.772] Initializing built-in extension RANDR
[    17.773] Initializing built-in extension COMPOSITE
[    17.773] Initializing built-in extension DAMAGE
[    17.773] Initializing built-in extension MIT-SCREEN-SAVER
[    17.773] Initializing built-in extension DOUBLE-BUFFER
[    17.773] Initializing built-in extension RECORD
[    17.773] Initializing built-in extension DPMS
[    17.773] Initializing built-in extension Present
[    17.773] Initializing built-in extension DRI3
[    17.773] Initializing built-in extension X-Resource
[    17.773] Initializing built-in extension XVideo
[    17.773] Initializing built-in extension XVideo-MotionCompensation
[    17.773] Initializing built-in extension SELinux
[    17.773] Initializing built-in extension XFree86-VidModeExtension
[    17.773] Initializing built-in extension XFree86-DGA
[    17.773] Initializing built-in extension XFree86-DRI
[    17.773] Initializing built-in extension DRI2
[    17.773] (II) LoadModule: "glx"
[    17.791] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[    17.882] (II) Module glx: vendor="X.Org Foundation"
[    17.882] 	compiled for 1.15.1, module version = 1.0.0
[    17.882] 	ABI class: X.Org Server Extension, version 8.0
[    17.883] (==) AIGLX enabled
[    17.883] Loading extension GLX
[    17.883] (==) Matched nvidia as autoconfigured driver 0
[    17.883] (==) Matched nouveau as autoconfigured driver 1
[    17.883] (==) Matched nvidia as autoconfigured driver 2
[    17.883] (==) Matched nouveau as autoconfigured driver 3
[    17.883] (==) Matched modesetting as autoconfigured driver 4
[    17.883] (==) Matched fbdev as autoconfigured driver 5
[    17.883] (==) Matched vesa as autoconfigured driver 6
[    17.883] (==) Assigned the driver to the xf86ConfigLayout
[    17.883] (II) LoadModule: "nvidia"
[    17.886] (WW) Warning, couldn't open module nvidia
[    17.886] (II) UnloadModule: "nvidia"
[    17.886] (II) Unloading nvidia
[    17.886] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    17.886] (II) LoadModule: "nouveau"
[    17.886] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    17.895] (II) Module nouveau: vendor="X.Org Foundation"
[    17.896] 	compiled for 1.15.1, module version = 1.0.11
[    17.896] 	Module class: X.Org Video Driver
[    17.896] 	ABI class: X.Org Video Driver, version 15.0
[    17.896] (II) LoadModule: "modesetting"
[    17.896] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    17.896] (II) Module modesetting: vendor="X.Org Foundation"
[    17.896] 	compiled for 1.15.0, module version = 0.8.1
[    17.896] 	Module class: X.Org Video Driver
[    17.896] 	ABI class: X.Org Video Driver, version 15.0
[    17.896] (II) LoadModule: "fbdev"
[    17.896] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    17.896] (II) Module fbdev: vendor="X.Org Foundation"
[    17.896] 	compiled for 1.15.0, module version = 0.4.4
[    17.897] 	Module class: X.Org Video Driver
[    17.897] 	ABI class: X.Org Video Driver, version 15.0
[    17.897] (II) LoadModule: "vesa"
[    17.897] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    17.897] (II) Module vesa: vendor="X.Org Foundation"
[    17.897] 	compiled for 1.15.0, module version = 2.3.3
[    17.897] 	Module class: X.Org Video Driver
[    17.897] 	ABI class: X.Org Video Driver, version 15.0
[    17.897] (==) Matched nvidia as autoconfigured driver 0
[    17.897] (==) Matched nouveau as autoconfigured driver 1
[    17.897] (==) Matched nvidia as autoconfigured driver 2
[    17.897] (==) Matched nouveau as autoconfigured driver 3
[    17.897] (==) Matched modesetting as autoconfigured driver 4
[    17.897] (==) Matched fbdev as autoconfigured driver 5
[    17.897] (==) Matched vesa as autoconfigured driver 6
[    17.897] (==) Assigned the driver to the xf86ConfigLayout
[    17.897] (II) LoadModule: "nvidia"
[    17.898] (WW) Warning, couldn't open module nvidia
[    17.898] (II) UnloadModule: "nvidia"
[    17.898] (II) Unloading nvidia
[    17.898] (EE) Failed to load module "nvidia" (module does not exist, 0)
[    17.898] (II) LoadModule: "nouveau"
[    17.898] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    17.898] (II) Module nouveau: vendor="X.Org Foundation"
[    17.898] 	compiled for 1.15.1, module version = 1.0.11
[    17.898] 	Module class: X.Org Video Driver
[    17.898] 	ABI class: X.Org Video Driver, version 15.0
[    17.898] (II) UnloadModule: "nouveau"
[    17.898] (II) Unloading nouveau
[    17.898] (II) Failed to load module "nouveau" (already loaded, 0)
[    17.898] (II) LoadModule: "modesetting"
[    17.898] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[    17.898] (II) Module modesetting: vendor="X.Org Foundation"
[    17.898] 	compiled for 1.15.0, module version = 0.8.1
[    17.898] 	Module class: X.Org Video Driver
[    17.899] 	ABI class: X.Org Video Driver, version 15.0
[    17.899] (II) UnloadModule: "modesetting"
[    17.899] (II) Unloading modesetting
[    17.899] (II) Failed to load module "modesetting" (already loaded, 0)
[    17.899] (II) LoadModule: "fbdev"
[    17.899] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[    17.899] (II) Module fbdev: vendor="X.Org Foundation"
[    17.899] 	compiled for 1.15.0, module version = 0.4.4
[    17.899] 	Module class: X.Org Video Driver
[    17.899] 	ABI class: X.Org Video Driver, version 15.0
[    17.899] (II) UnloadModule: "fbdev"
[    17.899] (II) Unloading fbdev
[    17.899] (II) Failed to load module "fbdev" (already loaded, 0)
[    17.899] (II) LoadModule: "vesa"
[    17.899] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[    17.899] (II) Module vesa: vendor="X.Org Foundation"
[    17.899] 	compiled for 1.15.0, module version = 2.3.3
[    17.899] 	Module class: X.Org Video Driver
[    17.899] 	ABI class: X.Org Video Driver, version 15.0
[    17.899] (II) UnloadModule: "vesa"
[    17.899] (II) Unloading vesa
[    17.899] (II) Failed to load module "vesa" (already loaded, 0)
[    17.899] (II) NOUVEAU driver 
[    17.899] (II) NOUVEAU driver for NVIDIA chipset families :
[    17.899] 	RIVA TNT        (NV04)
[    17.899] 	RIVA TNT2       (NV05)
[    17.900] 	GeForce 256     (NV10)
[    17.900] 	GeForce 2       (NV11, NV15)
[    17.900] 	GeForce 4MX     (NV17, NV18)
[    17.900] 	GeForce 3       (NV20)
[    17.900] 	GeForce 4Ti     (NV25, NV28)
[    17.900] 	GeForce FX      (NV3x)
[    17.900] 	GeForce 6       (NV4x)
[    17.900] 	GeForce 7       (G7x)
[    17.900] 	GeForce 8       (G8x)
[    17.900] 	GeForce GTX 200 (NVA0)
[    17.900] 	GeForce GTX 400 (NVC0)
[    17.900] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    17.900] (II) FBDEV: driver for framebuffer: fbdev
[    17.900] (II) VESA: driver for VESA chipsets: vesa
[    17.900] (++) using VT number 7

[    17.900] (II) [drm] nouveau interface version: 1.1.2
[    17.900] (WW) Falling back to old probe method for modesetting
[    17.900] (WW) Falling back to old probe method for fbdev
[    17.901] (II) Loading sub module "fbdevhw"
[    17.901] (II) LoadModule: "fbdevhw"
[    17.901] (II) Loading /usr/lib/xorg/modules/libfbdevhw.so
[    17.901] (II) Module fbdevhw: vendor="X.Org Foundation"
[    17.901] 	compiled for 1.15.1, module version = 0.0.2
[    17.901] 	ABI class: X.Org Video Driver, version 15.0
[    17.901] (WW) Falling back to old probe method for vesa
[    17.901] (II) Loading sub module "dri2"
[    17.901] (II) LoadModule: "dri2"
[    17.901] (II) Module "dri2" already built-in
[    17.901] (--) NOUVEAU(0): Chipset: "NVIDIA NV4B"
[    17.901] (II) NOUVEAU(0): Creating default Display subsection in Screen section
	"Default Screen Section" for depth/fbbpp 24/32
[    17.901] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    17.901] (==) NOUVEAU(0): RGB weight 888
[    17.901] (==) NOUVEAU(0): Default visual is TrueColor
[    17.901] (==) NOUVEAU(0): Using HW cursor
[    17.901] (==) NOUVEAU(0): GLX sync to VBlank enabled.
[    17.901] (==) NOUVEAU(0): Page flipping enabled
[    17.901] (==) NOUVEAU(0): Swap limit set to 1 [Max allowed 2]
[    17.901] (==) NOUVEAU(0): Page flipping synced to vblank by kernel.
[    17.901] (II) NOUVEAU(0): Initializing outputs ...
[    17.930] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    17.988] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[    18.044] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    18.044] (II) NOUVEAU(0): 3 crtcs needed for screen.
[    18.044] (II) NOUVEAU(0): Allocated crtc nr. 0 to this screen.
[    18.044] (II) NOUVEAU(0): Allocated crtc nr. 1 to this screen.
[    18.072] (II) NOUVEAU(0): EDID for output DVI-I-1
[    18.072] (II) NOUVEAU(0): Manufacturer: ACI  Model: 19d5  Serial#: 205636
[    18.072] (II) NOUVEAU(0): Year: 2008  Week: 22
[    18.072] (II) NOUVEAU(0): EDID Version: 1.3
[    18.072] (II) NOUVEAU(0): Analog Display Input,  Input Voltage Level: 0.700/0.300 V
[    18.072] (II) NOUVEAU(0): Sync:  Separate
[    18.073] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 41  vert.: 26
[    18.073] (II) NOUVEAU(0): Gamma: 2.20
[    18.073] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off; RGB/Color Display
[    18.073] (II) NOUVEAU(0): First detailed timing is preferred mode
[    18.073] (II) NOUVEAU(0): redX: 0.650 redY: 0.340   greenX: 0.290 greenY: 0.610
[    18.073] (II) NOUVEAU(0): blueX: 0.150 blueY: 0.070   whiteX: 0.313 whiteY: 0.329
[    18.073] (II) NOUVEAU(0): Supported established timings:
[    18.073] (II) NOUVEAU(0): 720x400@70Hz
[    18.073] (II) NOUVEAU(0): 640x480@60Hz
[    18.073] (II) NOUVEAU(0): 640x480@67Hz
[    18.073] (II) NOUVEAU(0): 640x480@72Hz
[    18.073] (II) NOUVEAU(0): 640x480@75Hz
[    18.073] (II) NOUVEAU(0): 800x600@56Hz
[    18.073] (II) NOUVEAU(0): 800x600@60Hz
[    18.073] (II) NOUVEAU(0): 800x600@72Hz
[    18.073] (II) NOUVEAU(0): 800x600@75Hz
[    18.073] (II) NOUVEAU(0): 832x624@75Hz
[    18.073] (II) NOUVEAU(0): 1024x768@60Hz
[    18.073] (II) NOUVEAU(0): 1024x768@70Hz
[    18.073] (II) NOUVEAU(0): 1024x768@75Hz
[    18.073] (II) NOUVEAU(0): 1280x1024@75Hz
[    18.073] (II) NOUVEAU(0): 1152x864@75Hz
[    18.073] (II) NOUVEAU(0): Manufacturer's mask: 0
[    18.073] (II) NOUVEAU(0): Supported standard timings:
[    18.073] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[    18.073] (II) NOUVEAU(0): #1: hsize: 1280  vsize 800  refresh: 60  vid: 129
[    18.073] (II) NOUVEAU(0): #2: hsize: 1280  vsize 800  refresh: 75  vid: 3969
[    18.073] (II) NOUVEAU(0): #3: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[    18.073] (II) NOUVEAU(0): #4: hsize: 1280  vsize 1024  refresh: 60  vid: 32897
[    18.073] (II) NOUVEAU(0): #5: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    18.073] (II) NOUVEAU(0): #6: hsize: 1440  vsize 900  refresh: 75  vid: 3989
[    18.073] (II) NOUVEAU(0): Supported detailed timing:
[    18.073] (II) NOUVEAU(0): clock: 106.5 MHz   Image Size:  408 x 255 mm
[    18.073] (II) NOUVEAU(0): h_active: 1440  h_sync: 1520  h_sync_end 1672 h_blank_end 1904 h_border: 0
[    18.073] (II) NOUVEAU(0): v_active: 900  v_sync: 903  v_sync_end 909 v_blanking: 934 v_border: 0
[    18.073] (II) NOUVEAU(0): Ranges: V min: 55 V max: 75 Hz, H min: 30 H max: 83 kHz, PixClock max 155 MHz
[    18.073] (II) NOUVEAU(0): Monitor name: ASUS VW193D
[    18.073] (II) NOUVEAU(0): Serial No: 85LMTF205636
[    18.073] (II) NOUVEAU(0): EDID (in hex):
[    18.073] (II) NOUVEAU(0): 	00ffffffffffff000469d51944230300
[    18.073] (II) NOUVEAU(0): 	1612010308291a78ea8585a6574a9c26
[    18.073] (II) NOUVEAU(0): 	125054bfef80714f8100810f81408180
[    18.073] (II) NOUVEAU(0): 	9500950f01019a29a0d0518422305098
[    18.073] (II) NOUVEAU(0): 	360098ff1000001c000000fd00374b1e
[    18.073] (II) NOUVEAU(0): 	530f000a202020202020000000fc0041
[    18.073] (II) NOUVEAU(0): 	535553205657313933440a20000000ff
[    18.073] (II) NOUVEAU(0): 	0038354c4d54463230353633360a00b0
[    18.073] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    18.073] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    18.073] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1440x900"x75.0  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync (70.6 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1280x800"x74.9  106.50  1280 1360 1488 1696  800 803 809 838 -hsync +vsync (62.8 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    18.073] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    18.074] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    18.132] (II) NOUVEAU(0): EDID for output VGA-1
[    18.188] (II) NOUVEAU(0): EDID for output TV-1
[    18.188] (II) NOUVEAU(0): Output DVI-I-1 connected
[    18.188] (II) NOUVEAU(0): Output VGA-1 disconnected
[    18.188] (II) NOUVEAU(0): Output TV-1 disconnected
[    18.188] (II) NOUVEAU(0): Using exact sizes for initial modes
[    18.188] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1440x900
[    18.188] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
[    18.188] (--) NOUVEAU(0): Virtual size is 1440x900 (pitch 0)
[    18.188] (**) NOUVEAU(0):  Driver mode "1440x900": 106.5 MHz (scaled from 0.0 MHz), 55.9 kHz, 59.9 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    18.188] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz), 80.0 kHz, 75.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from 0.0 MHz), 64.0 kHz, 60.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1440x900": 136.8 MHz (scaled from 0.0 MHz), 70.6 kHz, 75.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1440x900"x75.0  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync (70.6 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from 0.0 MHz), 60.0 kHz, 60.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1280x800": 106.5 MHz (scaled from 0.0 MHz), 62.8 kHz, 74.9 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1280x800"x74.9  106.50  1280 1360 1488 1696  800 803 809 838 -hsync +vsync (62.8 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1280x800": 83.5 MHz (scaled from 0.0 MHz), 49.7 kHz, 59.8 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1280x800"x59.8   83.50  1280 1352 1480 1680  800 803 809 831 +hsync -vsync (49.7 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5 kHz, 75.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1 kHz, 75.1 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from 0.0 MHz), 56.5 kHz, 70.1 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from 0.0 MHz), 48.4 kHz, 60.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0 MHz), 49.7 kHz, 74.6 Hz
[    18.188] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0 MHz), 48.1 kHz, 72.2 Hz
[    18.188] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9 kHz, 75.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0 MHz), 37.9 kHz, 60.3 Hz
[    18.188] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0 MHz), 35.2 kHz, 56.2 Hz
[    18.188] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5 kHz, 75.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.9 kHz, 72.8 Hz
[    18.188] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832  480 489 491 520 -hsync -vsync (37.9 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0 MHz), 35.0 kHz, 66.7 Hz
[    18.188] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    18.188] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0 MHz), 31.5 kHz, 60.0 Hz
[    18.188] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    18.189] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5 kHz, 70.1 Hz
[    18.189] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    18.189] (==) NOUVEAU(0): DPI set to (96, 96)
[    18.189] (II) Loading sub module "fb"
[    18.189] (II) LoadModule: "fb"
[    18.189] (II) Loading /usr/lib/xorg/modules/libfb.so
[    18.189] (II) Module fb: vendor="X.Org Foundation"
[    18.189] 	compiled for 1.15.1, module version = 1.0.0
[    18.189] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    18.189] (II) Loading sub module "shadowfb"
[    18.189] (II) LoadModule: "shadowfb"
[    18.189] (II) Loading /usr/lib/xorg/modules/libshadowfb.so
[    18.196] (II) Module shadowfb: vendor="X.Org Foundation"
[    18.196] 	compiled for 1.15.1, module version = 1.0.0
[    18.196] 	ABI class: X.Org ANSI C Emulation, version 0.4
[    18.196] (II) UnloadModule: "modesetting"
[    18.196] (II) Unloading modesetting
[    18.196] (II) UnloadModule: "fbdev"
[    18.196] (II) Unloading fbdev
[    18.196] (II) UnloadSubModule: "fbdevhw"
[    18.196] (II) Unloading fbdevhw
[    18.196] (II) UnloadModule: "vesa"
[    18.196] (II) Unloading vesa
[    18.196] (--) Depth 24 pixmap format is 32 bpp
[    18.199] (II) NOUVEAU(0): Channel setup complete.
[    18.199] (II) NOUVEAU(0): [DRI2] Setup complete
[    18.199] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    18.199] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    18.199] (II) Loading sub module "exa"
[    18.199] (II) LoadModule: "exa"
[    18.200] (II) Loading /usr/lib/xorg/modules/libexa.so
[    18.213] (II) Module exa: vendor="X.Org Foundation"
[    18.213] 	compiled for 1.15.1, module version = 2.6.0
[    18.213] 	ABI class: X.Org Video Driver, version 15.0
[    18.213] (II) EXA(0): Driver allocated offscreen pixmaps
[    18.213] (II) EXA(0): Driver registered support for the following operations:
[    18.213] (II)         Solid
[    18.213] (II)         Copy
[    18.213] (II)         Composite (RENDER acceleration)
[    18.213] (II)         UploadToScreen
[    18.213] (II)         DownloadFromScreen
[    18.213] (==) NOUVEAU(0): Backing store enabled
[    18.213] (==) NOUVEAU(0): Silken mouse enabled
[    18.213] (II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
[    18.213] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    18.213] (==) NOUVEAU(0): DPMS enabled
[    18.213] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
[    18.213] (--) RandR disabled
[    18.224] (II) SELinux: Disabled on system
[    18.293] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    18.293] (II) AIGLX: enabled GLX_ARB_create_context
[    18.293] (II) AIGLX: enabled GLX_ARB_create_context_profile
[    18.293] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[    18.293] (II) AIGLX: enabled GLX_INTEL_swap_event
[    18.293] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    18.293] (II) AIGLX: enabled GLX_EXT_framebuffer_sRGB
[    18.293] (II) AIGLX: enabled GLX_ARB_fbconfig_float
[    18.293] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    18.294] (II) AIGLX: Loaded and initialized nouveau
[    18.294] (II) GLX: Initialized DRI2 GL provider for screen 0
[    18.296] (II) NOUVEAU(0): NVEnterVT is called.
[    18.297] (II) NOUVEAU(0): Setting screen physical size to 380 x 238
[    18.297] resize called 1440 900
[    18.309] (II) XKB: reuse xkmfile /var/lib/xkb/server-B20D7FC79C7F597315E3E501AEF10E0D866E8E92.xkm
[    18.313] (II) config/udev: Adding input device Power Button (/dev/input/event1)
[    18.313] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    18.313] (II) LoadModule: "evdev"
[    18.314] (II) Loading /usr/lib/xorg/modules/input/evdev_drv.so
[    18.324] (II) Module evdev: vendor="X.Org Foundation"
[    18.324] 	compiled for 1.15.0, module version = 2.8.2
[    18.324] 	Module class: X.Org XInput Driver
[    18.324] 	ABI class: X.Org XInput driver, version 20.0
[    18.324] (II) Using input driver 'evdev' for 'Power Button'
[    18.324] (**) Power Button: always reports core events
[    18.324] (**) evdev: Power Button: Device: "/dev/input/event1"
[    18.324] (--) evdev: Power Button: Vendor 0 Product 0x1
[    18.324] (--) evdev: Power Button: Found keys
[    18.325] (II) evdev: Power Button: Configuring as keyboard
[    18.325] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[    18.325] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 6)
[    18.325] (**) Option "xkb_rules" "evdev"
[    18.325] (**) Option "xkb_model" "pc105"
[    18.325] (**) Option "xkb_layout" "fr"
[    18.325] (**) Option "xkb_variant" "oss"
[    18.328] (II) XKB: reuse xkmfile /var/lib/xkb/server-6CCE7350BC740BB33D520367F4A10E64192A358C.xkm
[    18.329] (II) config/udev: Adding input device Power Button (/dev/input/event0)
[    18.329] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    18.329] (II) Using input driver 'evdev' for 'Power Button'
[    18.329] (**) Power Button: always reports core events
[    18.329] (**) evdev: Power Button: Device: "/dev/input/event0"
[    18.329] (--) evdev: Power Button: Vendor 0 Product 0x1
[    18.329] (--) evdev: Power Button: Found keys
[    18.329] (II) evdev: Power Button: Configuring as keyboard
[    18.329] (**) Option "config_info" "udev:/sys/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input0/event0"
[    18.329] (II) XINPUT: Adding extended input device "Power Button" (type: KEYBOARD, id 7)
[    18.329] (**) Option "xkb_rules" "evdev"
[    18.329] (**) Option "xkb_model" "pc105"
[    18.329] (**) Option "xkb_layout" "fr"
[    18.329] (**) Option "xkb_variant" "oss"
[    18.329] (II) config/udev: Adding drm device (/dev/dri/card0) card0 /sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0
[    18.329] (II) config/udev: Ignoring already known drm device (/dev/dri/card0)
[    18.330] (II) config/udev: Adding input device HDA Intel Rear Mic (/dev/input/event12)
[    18.330] (II) No input driver specified, ignoring this device.
[    18.330] (II) This device may have been added with another device file.
[    18.330] (II) config/udev: Adding input device HDA Intel Line (/dev/input/event11)
[    18.330] (II) No input driver specified, ignoring this device.
[    18.330] (II) This device may have been added with another device file.
[    18.331] (II) config/udev: Adding input device HDA Intel Line Out Front (/dev/input/event10)
[    18.331] (II) No input driver specified, ignoring this device.
[    18.331] (II) This device may have been added with another device file.
[    18.331] (II) config/udev: Adding input device HDA Intel Line Out Surround (/dev/input/event9)
[    18.331] (II) No input driver specified, ignoring this device.
[    18.331] (II) This device may have been added with another device file.
[    18.331] (II) config/udev: Adding input device HDA Intel Line Out CLFE (/dev/input/event8)
[    18.331] (II) No input driver specified, ignoring this device.
[    18.331] (II) This device may have been added with another device file.
[    18.332] (II) config/udev: Adding input device HDA Intel Line Out Side (/dev/input/event7)
[    18.332] (II) No input driver specified, ignoring this device.
[    18.332] (II) This device may have been added with another device file.
[    18.332] (II) config/udev: Adding input device HDA Intel Front Headphone (/dev/input/event6)
[    18.332] (II) No input driver specified, ignoring this device.
[    18.332] (II) This device may have been added with another device file.
[    18.333] (II) config/udev: Adding input device HDA Intel Front Mic (/dev/input/event13)
[    18.333] (II) No input driver specified, ignoring this device.
[    18.333] (II) This device may have been added with another device file.
[    18.333] (II) config/udev: Adding input device NOVATEK USB Keyboard (/dev/input/event2)
[    18.333] (**) NOVATEK USB Keyboard: Applying InputClass "evdev keyboard catchall"
[    18.333] (II) Using input driver 'evdev' for 'NOVATEK USB Keyboard'
[    18.333] (**) NOVATEK USB Keyboard: always reports core events
[    18.333] (**) evdev: NOVATEK USB Keyboard: Device: "/dev/input/event2"
[    18.333] (--) evdev: NOVATEK USB Keyboard: Vendor 0x603 Product 0xf2
[    18.333] (--) evdev: NOVATEK USB Keyboard: Found keys
[    18.333] (II) evdev: NOVATEK USB Keyboard: Configuring as keyboard
[    18.333] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.0/input/input5/event2"
[    18.333] (II) XINPUT: Adding extended input device "NOVATEK USB Keyboard" (type: KEYBOARD, id 8)
[    18.333] (**) Option "xkb_rules" "evdev"
[    18.333] (**) Option "xkb_model" "pc105"
[    18.333] (**) Option "xkb_layout" "fr"
[    18.333] (**) Option "xkb_variant" "oss"
[    18.334] (II) config/udev: Adding input device NOVATEK USB Keyboard (/dev/input/event3)
[    18.334] (**) NOVATEK USB Keyboard: Applying InputClass "evdev keyboard catchall"
[    18.334] (II) Using input driver 'evdev' for 'NOVATEK USB Keyboard'
[    18.334] (**) NOVATEK USB Keyboard: always reports core events
[    18.334] (**) evdev: NOVATEK USB Keyboard: Device: "/dev/input/event3"
[    18.334] (--) evdev: NOVATEK USB Keyboard: Vendor 0x603 Product 0xf2
[    18.334] (--) evdev: NOVATEK USB Keyboard: Found 20 mouse buttons
[    18.334] (--) evdev: NOVATEK USB Keyboard: Found keys
[    18.334] (II) evdev: NOVATEK USB Keyboard: Forcing relative x/y axes to exist.
[    18.334] (II) evdev: NOVATEK USB Keyboard: Configuring as mouse
[    18.334] (II) evdev: NOVATEK USB Keyboard: Configuring as keyboard
[    18.334] (**) evdev: NOVATEK USB Keyboard: YAxisMapping: buttons 4 and 5
[    18.334] (**) evdev: NOVATEK USB Keyboard: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.334] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.0/usb5/5-2/5-2:1.1/input/input6/event3"
[    18.334] (II) XINPUT: Adding extended input device "NOVATEK USB Keyboard" (type: KEYBOARD, id 9)
[    18.334] (**) Option "xkb_rules" "evdev"
[    18.335] (**) Option "xkb_model" "pc105"
[    18.335] (**) Option "xkb_layout" "fr"
[    18.335] (**) Option "xkb_variant" "oss"
[    18.335] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/event4)
[    18.335] (**) Logitech USB Receiver: Applying InputClass "evdev pointer catchall"
[    18.335] (II) Using input driver 'evdev' for 'Logitech USB Receiver'
[    18.335] (**) Logitech USB Receiver: always reports core events
[    18.335] (**) evdev: Logitech USB Receiver: Device: "/dev/input/event4"
[    18.335] (--) evdev: Logitech USB Receiver: Vendor 0x46d Product 0xc52f
[    18.335] (--) evdev: Logitech USB Receiver: Found 20 mouse buttons
[    18.336] (--) evdev: Logitech USB Receiver: Found scroll wheel(s)
[    18.336] (--) evdev: Logitech USB Receiver: Found relative axes
[    18.336] (--) evdev: Logitech USB Receiver: Found x and y relative axes
[    18.336] (II) evdev: Logitech USB Receiver: Configuring as mouse
[    18.336] (II) evdev: Logitech USB Receiver: Adding scrollwheel support
[    18.336] (**) evdev: Logitech USB Receiver: YAxisMapping: buttons 4 and 5
[    18.336] (**) evdev: Logitech USB Receiver: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.336] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.0/input/input7/event4"
[    18.336] (II) XINPUT: Adding extended input device "Logitech USB Receiver" (type: MOUSE, id 10)
[    18.336] (II) evdev: Logitech USB Receiver: initialized for relative axes.
[    18.336] (**) Logitech USB Receiver: (accel) keeping acceleration scheme 1
[    18.336] (**) Logitech USB Receiver: (accel) acceleration profile 0
[    18.336] (**) Logitech USB Receiver: (accel) acceleration factor: 2.000
[    18.336] (**) Logitech USB Receiver: (accel) acceleration threshold: 4
[    18.336] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/mouse0)
[    18.336] (II) No input driver specified, ignoring this device.
[    18.336] (II) This device may have been added with another device file.
[    18.337] (II) config/udev: Adding input device Logitech USB Receiver (/dev/input/event5)
[    18.337] (**) Logitech USB Receiver: Applying InputClass "evdev keyboard catchall"
[    18.337] (II) Using input driver 'evdev' for 'Logitech USB Receiver'
[    18.337] (**) Logitech USB Receiver: always reports core events
[    18.337] (**) evdev: Logitech USB Receiver: Device: "/dev/input/event5"
[    18.337] (--) evdev: Logitech USB Receiver: Vendor 0x46d Product 0xc52f
[    18.337] (--) evdev: Logitech USB Receiver: Found 1 mouse buttons
[    18.337] (--) evdev: Logitech USB Receiver: Found scroll wheel(s)
[    18.337] (--) evdev: Logitech USB Receiver: Found relative axes
[    18.337] (II) evdev: Logitech USB Receiver: Forcing relative x/y axes to exist.
[    18.337] (--) evdev: Logitech USB Receiver: Found absolute axes
[    18.337] (II) evdev: Logitech USB Receiver: Forcing absolute x/y axes to exist.
[    18.337] (--) evdev: Logitech USB Receiver: Found keys
[    18.337] (II) evdev: Logitech USB Receiver: Configuring as mouse
[    18.337] (II) evdev: Logitech USB Receiver: Configuring as keyboard
[    18.337] (II) evdev: Logitech USB Receiver: Adding scrollwheel support
[    18.337] (**) evdev: Logitech USB Receiver: YAxisMapping: buttons 4 and 5
[    18.337] (**) evdev: Logitech USB Receiver: EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    18.337] (**) Option "config_info" "udev:/sys/devices/pci0000:00/0000:00:1d.1/usb6/6-1/6-1:1.1/input/input8/event5"
[    18.337] (II) XINPUT: Adding extended input device "Logitech USB Receiver" (type: KEYBOARD, id 11)
[    18.337] (**) Option "xkb_rules" "evdev"
[    18.337] (**) Option "xkb_model" "pc105"
[    18.337] (**) Option "xkb_layout" "fr"
[    18.337] (**) Option "xkb_variant" "oss"
[    18.338] (II) evdev: Logitech USB Receiver: initialized for relative axes.
[    18.338] (WW) evdev: Logitech USB Receiver: ignoring absolute axes.
[    18.338] (**) Logitech USB Receiver: (accel) keeping acceleration scheme 1
[    18.338] (**) Logitech USB Receiver: (accel) acceleration profile 0
[    18.338] (**) Logitech USB Receiver: (accel) acceleration factor: 2.000
[    18.338] (**) Logitech USB Receiver: (accel) acceleration threshold: 4
[    18.501] (II) XKB: reuse xkmfile /var/lib/xkb/server-34CEB476A3CB596DA76FD7010A029F76732EF824.xkm
[    34.611] (II) XKB: reuse xkmfile /var/lib/xkb/server-54B674C93F06EBC49DA118B07234FD13C705906D.xkm
[    60.851] (II) NOUVEAU(0): EDID vendor "ACI", prod id 6613
[    60.851] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    60.851] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    60.851] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    60.851] (II) NOUVEAU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    60.851] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1280x800"x0.0  106.50  1280 1360 1488 1696  800 803 809 838 -hsync +vsync (62.8 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    60.851] (II) NOUVEAU(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync (70.6 kHz e)
[    72.589] (II) NOUVEAU(0): EDID vendor "ACI", prod id 6613
[    72.590] (II) NOUVEAU(0): Using hsync ranges from config file
[    72.590] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    72.590] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    72.590] (II) NOUVEAU(0): Modeline "1440x900"x0.0  106.50  1440 1520 1672 1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    72.590] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056  600 601 605 628 +hsync +vsync (37.9 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024  600 601 603 625 +hsync +vsync (35.2 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484 500 -hsync -vsync (37.5 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832  480 489 492 520 -hsync -vsync (37.9 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864  480 483 486 525 -hsync -vsync (35.0 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800  480 490 492 525 -hsync -vsync (31.5 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414 449 -hsync +vsync (31.5 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152  624 625 628 667 -hsync -vsync (49.7 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604 625 +hsync +vsync (46.9 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040  600 637 643 666 +hsync +vsync (48.1 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1280x800"x0.0   83.50  1280 1352 1480 1680  800 803 809 831 -hsync +vsync (49.7 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1280x800"x0.0  106.50  1280 1360 1488 1696  800 803 809 838 -hsync +vsync (62.8 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    72.590] (II) NOUVEAU(0): Modeline "1440x900"x0.0  136.75  1440 1536 1688 1936  900 903 909 942 -hsync +vsync (70.6 kHz e)


--------------060503010107010603070801
Content-Type: image/png;
 name="screenshot 2014-10-29 08:12:26.png"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="screenshot 2014-10-29 08:12:26.png"

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
FMX09HTjwrUbvOPfblf+2Wef+Xy+SM7Xulwun883fvx4TdP8jQ92RkQUGxs7bNiw8OvfuHFj
RkYGIoAIRHIE8D2AewARwFOACOApQAQQgRs8AiETHMk/umP2TKPhgpQUY22bgkNVVSIWFZ9E
arVLVjVJI4p32qnK4zLP0qFpGnGuC7n5WQn7yre6aPZlvWHI23DiZ1v3flBZX6mwOFEjUfYR
Y9S6rUZLyR+QrZmmihRdO+p1xbNmyCumzwsej/+1VdM04sGbFNbHuTVqqIOaXb62k+C6bvzF
mvLvY/ut3Pr2qIrBj44Y9qWc5MTIfdntM+PHjz927NjZs2czMjIqKysHDx4cIeO1LBZLTEwM
XUpkqKpaU1trzkeEk48MMTJNU7WW1lbGmEWypKamhDm25Upyu93R0dGX7lZqaG79aOOuqpqG
Xqncbre73K71+8sdjhi7VbxrzqSMlIReqbkX1dfXG1fcCIIRgaYWj3+HHt4DLrdry/EPJEmM
j4tBBBCByIwAvgdwDyACeAoQATwFiAAicINHIGSCwzIwIWGYfw4OXVPp8r7/TLQSuS79btxi
EYjrvOMAAV3XmcCI6/zyzwvN/7v641do2Iu3zRobw07uW/7oKWJExEgnYsQ5mffnnCg2r3jp
xOSLuSLGRKsjhelVYTUpvI/rJBLpFGiMg8IHjb3rSN7Zv+3d9dv1H7yUPHbl/FHDrDfeCiuL
Fy/+5S9/eerUqejo6MWLF1/t5lzk9XplWfYnJs+VlaWkpNj7IK0oK0pZWXlOTna7ST2uOs65
rusWi8Xr9XLOf/vG8gVzpiwq7ue/l3vyRWYuL6us+f0/Vjz91XtiotoKI4ERAaPZ/gj0T08K
Y8RS19Q0tCACiEAkRwDfA7gHEAE8BYgAngJEABG4YSPQtTk4/C6lDMIi0Pmy8/ViwpgYdrEy
ruucSGva1kCjb5n8cLogiyw6yU6njP1jx8Wz18vLy7T4Af6XSCF2bDx7vaaO2bJzLJcuDtfD
HSTS5Y8zq1Ukxef2nyTn3OMVYzIfnXX3g4M3TXr/wP/Vj/zfdNZJ37/rj9Vq/cY3vvH8888/
9thjkdORwW63C4IgiqKqqoqiRNmjLBaLprfdoj3MU/pZrZa4uDi32x0bG9ubJ9BjxheZy+Ui
opr65ux+aQmJ8TtOXuiVys2RSYyy3TxiyLHT58cMy+uVynuL+X/p/BH4vLbtOvbWPZCZEI0I
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
Duax5eHurq6FTjjmnP83xKp+Z+ElL6099syh1bu9j595xQ9KdcdtueOJLurRrOKPTzkyUJQd
W6AVlgycrBIbcyrtVLIvr/WhVdGTZuXM4LBblsTzTikLdj07x2v50wtv7hxzxopx+e+ufvrK
F9856syJVbqIl1zdrI0ZEzQkme0vi9f8uwX7Hnxaefu7Il7Jvk9v30EYne6ucxrgbdnw+n/K
Zt5f6nynm9vbJ0zo1d0NLhhQEtu1zR1ZZnZ5TvcWLVqk6ZppGDknqtZdy65+pe1Tp8+euie1
ybvolEvPbtt689Mv/nD7ebcPDmoibrLu2abmzS/+60lNlGfbpfG42jN7qKu3gnvqNguOLgs+
6SjRrFGV/fTatpZEtIuDNdFERA/PGFbYsj6elvYPpBmunBNYddPLy74yafyZ/dsHjQAAAAAA
fEYLnXpKzhQVe9/unieiabqmiR6ePfHIse+sXZEa0bDp1Zveqav3vKZU6Ni0cr1dT8cGfG1U
SZ4mYppurHNvVMLdfTOum+V5AVMzRg0fN+atNavSQ/ZcTtO1VDf16Hknjh/3fu441bThUa/q
d2X7zEVQoul7G5moX3Lea3l/OG1I5o9uYtfC+ICvjSqO6HLEmCPGr1y9LDWhKqyJchodo7+1
T27Q1cEDci6TenvNPk9POswy6Xx3+6YBvxnQeMc68/On9s+TnV3dXKcwoVd3N9QKh5z6tm4W
BunWokWLRDRDNwzdzAYcTnT9l57fcvScMz5fnJuWaMH8QVcMNa7b3poaXBYSEVHKGvjL8089
PbumiLs72/6Ob3nN2XoChu55SomIpptKeWp/B1uGLpljRfbcnVX23XPOP/XdVb9+5tH7jjr7
7+MKDzTTAQAAAAAcjjp098bkvqfpoqVa3vneSve6cz5+Qajx5gWvKhERpUS09gijUwezR5TX
cWvR3tXzntyaLdvsiuNG5i4vYRYcFY691Jj+dH5IE1Ge2+a4uSuEdN3T1/Q8Xe109+0vd3Vw
9l27dV2np9cT7WlAS3Dr0uiu5xc8eItydiXSLz7z1vAzpk3e2yfvOkw48LvzvLSjW8FO5fuz
aNEiEYlEwqZhmqax52epkgtfX95yxNzvDQztnQ6Uqm5J2iJOsuHf21KDSvMyQYwRGnBCuH7e
+sZWJcpN7naUiFjiNKW9Lt/qTo8O1q0yI7mqJe15TpudbvZC00ZP//VR+Wu2tCQP6J4BAAAA
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
nDFm5ATHTdtO2nZSaTudttPpdNpO2clUes27y4siRYV5BznNPVhBSXflh9qha7/jOMxPAQAA
QA85jtPdt8u7d++uqamprq6eOnVqaWlp5wOam5t/+9vftrS0WJaladof//jHL3/5yyUlJQe9
kX/5y1++8pWvZBv8k5/8ZPTo0RMmTPj617++/xPvXVTzx/9u7OFVPn/6qCvmVL2fdn7AMt20
g87MDZD2H3C8/vgDP/jqZ5RoKWdvOqBpbSl32ZbW9bvimqjTpk3a89be4ONL11958213Tzvj
4wfSpB7dp+M4jQ2763bu6u6AH//pye5elEd06fGiDEqpdDqtlFpVU+fts65HzjF7/18pEaXa
4knTtCsLrMJITszh1W5d83Bq0GdHFYd7eGm8T9mAQ9f11rZWZXu7du40LS0Q0q2wbjmaFdQ3
bl05vKrKcdO2l7K9VNpNpZxUKp1MJJOJeDJgmK2x1vxwvogopXJr7nCt3HcP7mE9fLdzYS8a
3KVej6fo7hL7qZARHAAAAOihHTt2vPTSS5dcckmH8iVLlkyePLmysvKCCy545JFHnnjiiSuv
vLLDMc3NzXfccUdLS0smH8l8zXbHHXd86UtfKi4uPoiNvPfee7Ppxg033HDjjTcWFxc3Nzfb
tn3LLbf88Ic/7O7Ee17Ycs/zWwOBnn5x/tfntrpKv/LEoe99aB9paWl58MEH16xZ88Mf/rCk
pCSbTK1fv/6OO+6YPXv2RRdd9P5TDzOe6tH3pc07t5983LSKsuKUs2dOSCzlLtvSsm5nm7e3
G7N+Z7R//j4NKu1XcOoJ09dvrykaMFDeK0DZq0e3pJT63mXHOY6T2xfqrkfXodw0zVtueaEn
VxER13UTiYTjuDuijhXqWTYRLLJFmuPR3IDDbfnHa2+9OHHY9T28Lt6/TMARCAQikYhlWU7a
8VxnyIgR2+uqNU80peuiNUV3NscaTNNwvFTKSaSdZMpOJuxUykkn7aTnBpWnsgMNDvkaGSqV
jm+yA2PzLCO3+HBbE+TQTZnJrDBKwAEAAID9q62tvfPOO8ePH9+hfPny5Q888EBdXd255547
Z86c559/fuXKlW1tbbmr8jU1Nc2bNy+bbmQ4jtPW1nbbbbddf/31B2uuyqJFi6677rrM69//
/vcTJ04MBALZgRtPP/30fs599PVdgWDgUyeN+Pvz74pIwGyfDJ522pdpyJRfMafq3kU1979S
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
f7vnvlEnnLV6S8OYge1rz4Yikc4xyvsc0ZFMJj+YgEMppWmapmmxtOscyLfT2QVKVOq1tdu9
QXNmBhm/8cHSNM11XcMwEolEtC3aFo2m0tGgMoKi1+/eOf/xO62Q3pra5erxhtYdJWaxMuxU
KtmWTMQSyVTSTSXddNxNpVOeKg4WjJadLzfHZuUZ4iUWR1VVWSiiPKVElOcl4hsbq39cr583
aMS3Q3rS9fpp3mqlFRQN+21lOCiia8mN9TX/06BfMHjkiQFvbfOO36+vzh8//FjLa2xr22IO
+MXwwn7KU0HZqUTE8zzP85wtDZt/1WhePnTUnDx5tnrTbTvy/jCiyFSalTdk3pD8iIgeDNTW
rf9Vo3XlyIlzpW3B1s23bQv+prJgtOx8OeHMyjPES74WyzTVrcm9kKG21O+t3LKf2rr5l+8a
tw8piDZsXxko+3+F6rVtm+9zSr49ctgob/eN1dGdSTm5vGjBloaV/QdPCxaMlp2LY86xBYZ4
8VdjOY9CPM9zt9Rt/PEu7cKB7Y/Cs3o8oiQTSLHIKAAAADrrkEGISHaKSn5+vq7rra2tImJZ
lmmamXHBSqn8/PzsWhgd7CfFMAyjFwGH66mR335Vcv6h2+bJ8f/z1oRBBS/9aPYTTzxxyimn
HHvssZm35syZs7+q9PbLKtNMJpPnTylOON5Db+zUdfnE9IqLppYkEgllmu7e47prpnJaHC1i
7hn4oJvBsNjNjhIxBo+a+eX1C37x0hP3OOl0eOS8kf2CIqKH58742Nwe3K4Tq/n+M8taRs/9
QWVgv9PZlTIMo8OGvldddZWIZH5kGeFwuPOPWLSyqhMeLU00xaNrd27+x7odm2teuzZ/wLPT
S4NijJv28eqj7Lqmzb98dvEjzWu/vXzES2Y80XXU0GGY+JlnnNIvLygiO3fHXlzw6LSZM5ct
Xz3n5LmVFeXZGvqVlEwcP2ZL9cbqkDW4OJIp1DVpiac9xxYRJydSMnMGuzvdRE37kQkpeh1w
HNBA+swaHCnHi+dcLmcVW8lZxba9XNMyr1Sq9h+1+ty55UV02j5gmWFmhYWFIuI6rut4ojRR
IkrsdLp66/pAxAhG9EBEjydiwVjA09KpdCqVtD1Hea4oJa7jOrbjOK4E54S9u5ti0WDETDa/
4QYvCInnuK5SolzHji/cnaworTo/bBoiYuriOp4SpVzlukrEVamFTcny0qpzQoYpxux+Zcua
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
rNJAheN6Cp0AAAAASUVORK5CYII=
--------------060503010107010603070801
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--------------060503010107010603070801--

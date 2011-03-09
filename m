From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: [Bug 35157] New: Black Screen while booting
Date: Wed, 09 Mar 2011 20:02:40 +0100
Message-ID: <4D77CED0.1050402@epsm.fr>
References: <bug-35157-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35157-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

Le 09/03/2011 19:50, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org a =E9crit :
> https://bugs.freedesktop.org/show_bug.cgi?id=3D35157
>
>             Summary: Black Screen while booting
>             Product: xorg
>             Version: unspecified
>            Platform: x86-64 (AMD64)
>          OS/Version: Linux (All)
>              Status: NEW
>            Severity: normal
>            Priority: medium
>           Component: Driver/nouveau
>          AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>          ReportedBy: limaunion-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>           QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
>
>
> Hi! I'm getting a black screen _inmediately_after_booting_ the Linux kern=
el,
> being unable to access any tty console nor X11 (of course ssh is ok).
>
Then, how do you get this Xorg.0.log ?

> I'm running a self-compiled kernel from vanilla (2.6.37.2) and am trying =
to
> switch from the NVIDIA propietary driver to nouveau.
>
> I've followed the following instructions in order to enable the required =
kernel
> settings:
> http://en.gentoo-wiki.com/wiki/Nouveau (the real distro I'm using is Debi=
an
> testing)
>
I'd suggest looking first at the nouveau wiki, especially this page:
http://nouveau.freedesktop.org/wiki/TroubleShooting

> I'm not sure if this is a bug or not but let me know any other information
> required.
> Thanks in advance.
>
>
> $ cat dmesg | egrep -i '(nouveau|drm)'
> [    0.000000] Linux version 2.6.37.2.nouveau (limaunion@debian1) (gcc ve=
rsion
> 4.4.5 (Debian 4.4.5-12) ) #7 SMP Fri Mar 4 22:35:28 2011
> [    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.37.2.nouveau
> root=3D/dev/sda1 ro vga=3D775
> [    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.37.2.n=
ouveau
> root=3D/dev/sda1 ro vga=3D775
> [    3.633513] [drm] Initialized drm 1.1.0 20060810
> [    3.808087] usb usb1: Manufacturer: Linux 2.6.37.2.nouveau ehci_hcd
> [    3.921663] nouveau 0000:02:00.0: PCI INT A ->  Link[APC8] ->  GSI 16 =
(level,
> low) ->  IRQ 16
> [    3.921671] nouveau 0000:02:00.0: setting latency timer to 64
> [    3.924642] [drm] nouveau 0000:02:00.0: Detected an NV40 generation ca=
rd
> (0x044a00a2)
> [    3.925947] [drm] nouveau 0000:02:00.0: Attempting to load BIOS image =
from
> PRAMIN
> [    4.005997] [drm] nouveau 0000:02:00.0: ... appears to be valid
> [    4.006014] [drm] nouveau 0000:02:00.0: BIT BIOS found
> [    4.006019] [drm] nouveau 0000:02:00.0: Bios version 05.44.02.67
> [    4.006024] [drm] nouveau 0000:02:00.0: TMDS table version 1.1
> [    4.006028] [drm] nouveau 0000:02:00.0: BIT table 'd' not found
> [    4.006033] [drm] nouveau 0000:02:00.0: Found Display Configuration Bl=
ock
> version 3.0
> [    4.006039] [drm] nouveau 0000:02:00.0: Raw DCB entry 0: 01000300 0000=
0028
> [    4.006044] [drm] nouveau 0000:02:00.0: Raw DCB entry 1: 02011310 0000=
0028
> [    4.006048] [drm] nouveau 0000:02:00.0: Raw DCB entry 2: 01011312 0000=
0000
> [    4.006052] [drm] nouveau 0000:02:00.0: Raw DCB entry 3: 020223f1 00c0=
c080
> [    4.006058] [drm] nouveau 0000:02:00.0: DCB connector table: VHER 0x30=
 5 7 2
> [    4.006063] [drm] nouveau 0000:02:00.0:   0: 0x00000000: type 0x00 idx=
 0 tag
> 0xff
> [    4.006068] [drm] nouveau 0000:02:00.0:   1: 0x00002130: type 0x30 idx=
 1 tag
> 0x08
> [    4.006073] [drm] nouveau 0000:02:00.0:   2: 0x00000210: type 0x10 idx=
 2 tag
> 0xff
> [    4.006078] [drm] nouveau 0000:02:00.0:   3: 0x00000211: type 0x11 idx=
 3 tag
> 0xff
> [    4.006083] [drm] nouveau 0000:02:00.0:   4: 0x00000213: type 0x13 idx=
 4 tag
> 0xff
> [    4.006093] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 0 at =
offset
> 0xDCEA
> [    4.006477] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 1 at =
offset
> 0xE04F
> [    4.026225] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 2 at =
offset
> 0xE589
> [    4.026243] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 3 at =
offset
> 0xE6DE
> [    4.028135] [drm] nouveau 0000:02:00.0: Parsing VBIOS init table 4 at =
offset
> 0xE888
> [    4.047489] [drm] nouveau 0000:02:00.0: mem timing table length unknow=
n: 14
> [    4.047495] [drm] nouveau 0000:02:00.0: 1 available performance level(=
s)
> [    4.047501] [drm] nouveau 0000:02:00.0: 0: memory 532MHz core 350MHz
> fanspeed 100%
> [    4.047512] [drm] nouveau 0000:02:00.0: c: memory 401MHz core 200MHz
> [    4.047520] [drm] nouveau 0000:02:00.0: Detected 256MiB VRAM
> [    4.049196] [drm] nouveau 0000:02:00.0: 64 MiB GART (aperture)
> [    4.051165] [drm] nouveau 0000:02:00.0: Allocating FIFO number 0
> [    4.051564] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initial=
ised
> FIFO 0
> [    4.051576] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga enc=
oder
> (output 0)
> [    4.051582] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on vga enc=
oder
> (output 1)
> [    4.051587] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on tmds en=
coder
> (output 2)
> [    4.051593] [drm] nouveau 0000:02:00.0: Setting dpms mode 3 on TV enco=
der
> (output 3)
> [    4.208627] [drm] nouveau 0000:02:00.0: allocated 1680x1050 fb: 0x4900=
0, bo
> ffff88007ae81c00
> [    4.208694] fb0: nouveaufb frame buffer device
> [    4.208698] drm: registered panic notifier
> [    4.208705] [drm] Initialized nouveau 0.0.16 20090420 for 0000:02:00.0=
 on
> minor 0
> [    4.488065] usb usb2: Manufacturer: Linux 2.6.37.2.nouveau ohci_hcd
>
>
> $ cat lsmod.out.txt | egrep '(drm|nouveau)'
> nouveau               464294  0
> ttm                    42177  1 nouveau
> drm_kms_helper         21691  1 nouveau
> drm                   141427  3 nouveau,ttm,drm_kms_helper
> fb                     30953  2 nouveau,drm_kms_helper
> cfbcopyarea             2857  1 nouveau
> i2c_algo_bit            4103  2 nouveau,bttv
> cfbimgblt               1897  1 nouveau
> button                  4522  1 nouveau
> i2c_core               15872  20
> tuner,tea5767,tda8290,tda18271,tda827x,tda9887,tuner_simple,tea5761,tvaud=
io,tda7432,msp3400,nouveau,bttv,drm_kms_helper,v4l2_common,videodev,drm,i2c=
_algo_bit,tveeprom,i2c_nforce2
> cfbfillrect             2917  1 nouveau
>
>
> $ cat Xorg.0.log
> X.Org X Server 1.7.7
> Release Date: 2010-05-04
> X Protocol Version 11, Revision 0
> Build Operating System: Linux 2.6.32-5-amd64 x86_64 Debian
> Current Operating System: Linux debian1 2.6.37.2.nouveau #7 SMP Fri Mar 4
> 22:35:28 ART 2011 x86_64
> Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.37.2.nouveau root=3D/=
dev/sda1
> ro vga=3D775
> Build Date: 12 January 2011  02:59:50AM
> xorg-server 2:1.7.7-11 (Cyril Brulebois<kibi-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>)
> Current version of pixman: 0.16.4
>          Before reporting problems, check http://wiki.x.org
>          to make sure that you have the latest version.
> Markers: (--) probed, (**) from config file, (=3D=3D) default setting,
>          (++) from command line, (!!) notice, (II) informational,
>          (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
> (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Fri Mar  4 22:37:43 2011
> (=3D=3D) Using config file: "/etc/X11/xorg.conf"
> (=3D=3D) Using system config directory "/usr/share/X11/xorg.conf.d"
> (=3D=3D) No Layout section.  Using the first Screen section.
> (=3D=3D) No screen section available. Using defaults.
> (**) |-->Screen "Default Screen Section" (0)
> (**) |   |-->Monitor "<default monitor>"
> (=3D=3D) No device specified for screen "Default Screen Section".
>          Using the first device section listed.
> (**) |   |-->Device "devname"
> (=3D=3D) No monitor specified for screen "Default Screen Section".
>          Using a default monitor configuration.
> (=3D=3D) Automatically adding devices
> (=3D=3D) Automatically enabling devices
> (WW) The directory "/usr/share/fonts/X11/cyrillic" does not exist.
>          Entry deleted from font path.
> (=3D=3D) FontPath set to:
>          /usr/share/fonts/X11/misc,
>          /usr/share/fonts/X11/100dpi/:unscaled,
>          /usr/share/fonts/X11/75dpi/:unscaled,
>          /usr/share/fonts/X11/Type1,
>          /usr/share/fonts/X11/100dpi,
>          /usr/share/fonts/X11/75dpi,
>          /var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
>          built-ins
> (=3D=3D) ModulePath set to "/usr/lib/xorg/modules"
> (=3D=3D) |-->Input Device "Generic Keyboard"
> (=3D=3D) No Layout section. Using the first core keyboard device.
> (II) The server relies on udev to provide the list of input devices.
>          If no devices become available, reconfigure udev or disable
> AutoAddDevices.
> (WW) AllowEmptyInput is on, devices using drivers 'kbd', 'mouse' or 'vmmo=
use'
> will be disabled.
> (WW) Disabling Generic Keyboard
> (II) Loader magic: 0x7c8a00
> (II) Module ABI versions:
>          X.Org ANSI C Emulation: 0.4
>          X.Org Video Driver: 6.0
>          X.Org XInput driver : 7.0
>          X.Org Server Extension : 2.0
> (++) using VT number 7
> (--) PCI: (0:1:7:0) 109e:036e:0000:0000 Brooktree Corporation Bt878 Video
> Capture rev 17, Mem @ 0xfdfff000/4096
> (--) PCI:*(0:2:0:0) 10de:016a:1682:2234 nVidia Corporation NV44 [GeForce =
7100
> GS] rev 161, Mem @ 0xfa000000/16777216, 0xd0000000/268435456,
> 0xfb000000/16777216, BIOS @ 0x????????/131072
> (II) Open ACPI successful (/var/run/acpid.socket)
> (II) LoadModule: "extmod"
> (II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
> (II) Module extmod: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 1.0.0
>          Module class: X.Org Server Extension
>          ABI class: X.Org Server Extension, version 2.0
> (II) Loading extension SELinux
> (II) Loading extension MIT-SCREEN-SAVER
> (II) Loading extension XFree86-VidModeExtension
> (II) Loading extension XFree86-DGA
> (II) Loading extension DPMS
> (II) Loading extension XVideo
> (II) Loading extension XVideo-MotionCompensation
> (II) Loading extension X-Resource
> (II) LoadModule: "dbe"
> (II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
> (II) Module dbe: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 1.0.0
>          Module class: X.Org Server Extension
>          ABI class: X.Org Server Extension, version 2.0
> (II) Loading extension DOUBLE-BUFFER
> (II) LoadModule: "glx"
> (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
> (II) Module glx: vendor=3D"NVIDIA Corporation"
>          compiled for 4.0.2, module version =3D 1.0.0
>          Module class: X.Org Server Extension
> (II) NVIDIA GLX Module  260.19.36  Tue Jan 18 17:12:12 PST 2011
> (II) Loading extension GLX
> (II) LoadModule: "record"
> (II) Loading /usr/lib/xorg/modules/extensions/librecord.so
> (II) Module record: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 1.13.0
>          Module class: X.Org Server Extension
>          ABI class: X.Org Server Extension, version 2.0
> (II) Loading extension RECORD
> (II) LoadModule: "dri"
> (II) Loading /usr/lib/xorg/modules/extensions/libdri.so
> (II) Module dri: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 1.0.0
>          ABI class: X.Org Server Extension, version 2.0
> (II) Loading extension XFree86-DRI
> (II) LoadModule: "dri2"
> (II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
> (II) Module dri2: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 1.1.0
>          ABI class: X.Org Server Extension, version 2.0
> (II) Loading extension DRI2
> (II) LoadModule: "nouveau"
> (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
> (II) Module nouveau: vendor=3D"X.Org Foundation"
>          compiled for 1.7.7, module version =3D 0.0.15
>          Module class: X.Org Video Driver
>          ABI class: X.Org Video Driver, version 6.0
> (II) NOUVEAU driver Date:   Tue Mar 16 13:08:37 2010 +1000
> (II) NOUVEAU driver for NVIDIA chipset families :
>          RIVA TNT    (NV04)
>          RIVA TNT2   (NV05)
>          GeForce 256 (NV10)
>          GeForce 2   (NV11, NV15)
>          GeForce 4MX (NV17, NV18)
>          GeForce 3   (NV20)
>          GeForce 4Ti (NV25, NV28)
>          GeForce FX  (NV3x)
>          GeForce 6   (NV4x)
>          GeForce 7   (G7x)
>          GeForce 8   (G8x)
> (II) Primary Device is: PCI 02@00:00:0
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 8, (OK)
> drmOpenByBusid: Searching for BusID pci:0000:02:00.0
> drmOpenDevice: node name is /dev/dri/card0
> drmOpenDevice: open result is 8, (OK)
> drmOpenByBusid: drmOpenMinor returns 8
> drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
> (EE) [drm] failed to open device
> (EE) No devices detected.
>
> Fatal server error:
> no screens found
>
I am not a developer but sometimes had to upgrade libdrm (or get it from gi=
t) to avoid this.


> Please consult the The X.Org Foundation support
>           at http://wiki.x.org
>   for help.
> Please also check the log file at "/var/log/Xorg.0.log" for additional
> information.
>
> $ lspci -nn
> 00:00.0 RAM memory [0500]: nVidia Corporation MCP61 Memory Controller
> [10de:03ea] (rev a1)
> 00:01.0 ISA bridge [0601]: nVidia Corporation MCP61 LPC Bridge [10de:03e0=
] (rev
> a2)
> 00:01.1 SMBus [0c05]: nVidia Corporation MCP61 SMBus [10de:03eb] (rev a2)
> 00:01.2 RAM memory [0500]: nVidia Corporation MCP61 Memory Controller
> [10de:03f5] (rev a2)
> 00:02.0 USB Controller [0c03]: nVidia Corporation MCP61 USB Controller
> [10de:03f1] (rev a3)
> 00:02.1 USB Controller [0c03]: nVidia Corporation MCP61 USB Controller
> [10de:03f2] (rev a3)
> 00:04.0 PCI bridge [0604]: nVidia Corporation MCP61 PCI bridge [10de:03f3=
] (rev
> a1)
> 00:05.0 Audio device [0403]: nVidia Corporation MCP61 High Definition Aud=
io
> [10de:03f0] (rev a2)
> 00:06.0 IDE interface [0101]: nVidia Corporation MCP61 IDE [10de:03ec] (r=
ev a2)
> 00:07.0 Bridge [0680]: nVidia Corporation MCP61 Ethernet [10de:03ef] (rev=
 a2)
> 00:08.0 IDE interface [0101]: nVidia Corporation MCP61 SATA Controller
> [10de:03f6] (rev a2)
> 00:09.0 PCI bridge [0604]: nVidia Corporation MCP61 PCI Express bridge
> [10de:03e8] (rev a2)
> 00:18.0 Host bridge [0600]: Advanced Micro Devices [AMD] K8 [Athlon64/Opt=
eron]
> HyperTransport Technology Configuration [1022:1100]
> 00:18.1 Host bridge [0600]: Advanced Micro Devices [AMD] K8 [Athlon64/Opt=
eron]
> Address Map [1022:1101]
> 00:18.2 Host bridge [0600]: Advanced Micro Devices [AMD] K8 [Athlon64/Opt=
eron]
> DRAM Controller [1022:1102]
> 00:18.3 Host bridge [0600]: Advanced Micro Devices [AMD] K8 [Athlon64/Opt=
eron]
> Miscellaneous Control [1022:1103]
> 01:07.0 Multimedia video controller [0400]: Brooktree Corporation Bt878 V=
ideo
> Capture [109e:036e] (rev 11)
> 01:07.1 Multimedia controller [0480]: Brooktree Corporation Bt878 Audio C=
apture
> [109e:0878] (rev 11)
> 02:00.0 VGA compatible controller [0300]: nVidia Corporation NV44 [GeForc=
e 7100
> GS] [10de:016a] (rev a1)
>

From: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: kms etc nouveau X failed
Date: Tue, 27 Nov 2012 07:08:42 -0800 (PST)
Message-ID: <1354028922.6600.YahooMailNeo@web120404.mail.ne1.yahoo.com>
Reply-To: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
References: 
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi,

My X setup with nouveau fails for some time now.


user@localhost ~ $ lspci -vknn


=A001:00.0 VGA compatible controller [0300]: NVIDIA Corporation G72M [Quadr=
o NVS 110M/GeForce Go 7300] [10de:01d7] (rev a1) (prog-if 00 [VGA controlle=
r])
=A0=A0 =A0Subsystem: Toshiba America Info Systems Device [1179:ff02]
=A0=A0 =A0Flags: bus master, fast devsel, latency 0, IRQ 16
=A0=A0 =A0Memory at dd000000 (32-bit, non-prefetchable) [size=3D16M]
=A0=A0 =A0Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
=A0=A0 =A0Memory at dc000000 (64-bit, non-prefetchable) [size=3D16M]
=A0=A0 =A0Capabilities: [60] Power Management version 2
=A0=A0 =A0Capabilities: [68] MSI: Enable- Count=3D1/1 Maskable- 64bit+
=A0=A0 =A0Capabilities: [78] Express Endpoint, MSI 00
=A0=A0 =A0Capabilities: [100] Virtual Channel
=A0=A0 =A0Capabilities: [128] Power Budgeting <?>
=A0=A0 =A0Kernel driver in use: nouveau

user@localhost ~ $ cat /var/log/Xorg.0.log

[ 63179.180] =

X.Org X Server 1.13.0
Release Date: 2012-09-05
[ 63179.180] X Protocol Version 11, Revision 0
[ 63179.180] Build Operating System: Linux 3.6.8-pf x86_64 Gentoo
[ 63179.180] Current Operating System: Linux localhost 3.6.9-pf #1 SMP PREE=
MPT Tue Nov 20 22:45:49 EET 2012 x86_64
[ 63179.180] Kernel command line: auto BOOT_IMAGE=3DGentoo3.6 ro root=3D100=
 dolvm real_root=3D/dev/mapper/root usbcore.autosuspend=3D1 pcie_aspm.polic=
y=3Dpowersave acpi_osi=3DLinux processor.max_cstate=3D2 snd_hda_intel.index=
=3D0 snd_hda_intel.model=3Dtoshiba snd_hda_intel.power_save=3D1 selinux=3D0=
 quiet init_opts=3D3 root_key=3Drootkey root_keydev=3D/dev/sda3 tpm_tis.itp=
m=3Dyes resume=3Dswap:/dev/sda6 fbcon=3Dscrollback:256k splash=3Dverbose,th=
eme:tuxonice
[ 63179.180] Build Date: 11 November 2012=A0 06:38:46PM
[ 63179.180]=A0 =

[ 63179.180] Current version of pixman: 0.29.1
[ 63179.180] =A0=A0=A0 Before reporting problems, check http://wiki.x.org
=A0=A0=A0 to make sure that you have the latest version.
[ 63179.180] Markers: (--) probed, (**) from config file, (=3D=3D) default =
setting,
=A0=A0=A0 (++) from command line, (!!) notice, (II) informational,
=A0=A0=A0 (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[ 63179.180] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Tue Nov 27 16:=
04:06 2012
[ 63179.180] (=3D=3D) Using config file: "/etc/X11/xorg.conf"
[ 63179.180] (=3D=3D) Using config directory: "/etc/X11/xorg.conf.d"
[ 63179.180] (=3D=3D) Using system config directory "/usr/share/X11/xorg.co=
nf.d"
[ 63179.182] (**) Option "defaultserverlayout" "SV"
[ 63179.182] (++) ServerLayout "SV"
[ 63179.182] (**) |-->Screen "Console0" (0)
[ 63179.182] (**) |=A0=A0 |-->Monitor "LCD 15.4'' WXGA"
[ 63179.182] (**) |=A0=A0 |-->Device "NVIDIA NV46 (Factory)"
[ 63179.182] (**) Option "DontVTSwitch" "false"
[ 63179.182] (**) Option "DontZap" "true"
[ 63179.182] (**) Option "DontZoom" "true"
[ 63179.182] (**) Option "AllowNonLocalXvidtune" "off"
[ 63179.182] (**) Option "AllowMouseOpenFail"
[ 63179.182] (**) Option "AIGLX" "on"
[ 63179.182] (**) Option "UseDefaultFontPath" "false"
[ 63179.182] (**) Option "AutoAddDevices" "true"
[ 63179.182] (**) Option "AutoEnableDevices" "true"
[ 63179.182] (**) Automatically adding devices
[ 63179.182] (**) Automatically enabling devices
[ 63179.182] (=3D=3D) Automatically adding GPU devices
[ 63179.183] (**) FontPath set to:
=A0=A0=A0 /usr/share/fonts/misc,
=A0=A0=A0 /usr/share/fonts/75dpi,
=A0=A0=A0 /usr/share/fonts/100dpi,
=A0=A0=A0 /usr/share/fonts/cronyx/misc/:unscaled,
=A0=A0=A0 /usr/share/fonts/cronyx/100dpi/:unscaled,
=A0=A0=A0 /usr/share/fonts/cronyx/75dpi/:unscaled,
[ 63179.183] (**) ModulePath set to "/usr/lib/xorg/modules"
[ 63179.183] (**) Extension "RANDR" is enabled
[ 63179.183] (**) Extension "RENDER" is enabled
[ 63179.183] (**) Extension "DAMAGE" is enabled
[ 63179.183] (**) Extension "XTEST" is enabled
[ 63179.183] (**) Extension "XVideo" is enabled
[ 63179.183] (**) Extension "Composite" is enabled
[ 63179.183] (II) The server relies on udev to provide the list of input de=
vices.
=A0=A0=A0 If no devices become available, reconfigure udev or disable AutoA=
ddDevices.
[ 63179.183] (II) Loader magic: 0x809c00
[ 63179.183] (II) Module ABI versions:
[ 63179.183] =A0=A0=A0 X.Org ANSI C Emulation: 0.4
[ 63179.183] =A0=A0=A0 X.Org Video Driver: 13.0
[ 63179.183] =A0=A0=A0 X.Org XInput driver : 18.0
[ 63179.183] =A0=A0=A0 X.Org Server Extension : 7.0
[ 63179.184] (II) config/udev: Adding drm device (/dev/dri/card0)
[ 63179.186] (--) PCI:*(0:1:0:0) 10de:01d7:1179:ff02 rev 161, Mem @ 0xdd000=
000/16777216, 0xc0000000/268435456, 0xdc000000/16777216
[ 63179.186] (II) Open ACPI successful (/var/run/acpid.socket)
[ 63179.186] Initializing built-in extension Generic Event Extension
[ 63179.186] Initializing built-in extension SHAPE
[ 63179.186] Initializing built-in extension MIT-SHM
[ 63179.186] Initializing built-in extension XInputExtension
[ 63179.186] Initializing built-in extension XTEST
[ 63179.186] Initializing built-in extension BIG-REQUESTS
[ 63179.186] Initializing built-in extension SYNC
[ 63179.186] Initializing built-in extension XKEYBOARD
[ 63179.186] Initializing built-in extension XC-MISC
[ 63179.186] Initializing built-in extension XINERAMA
[ 63179.186] Initializing built-in extension XFIXES
[ 63179.186] Initializing built-in extension RENDER
[ 63179.186] Initializing built-in extension RANDR
[ 63179.186] Initializing built-in extension COMPOSITE
[ 63179.186] Initializing built-in extension DAMAGE
[ 63179.186] Initializing built-in extension MIT-SCREEN-SAVER
[ 63179.186] Initializing built-in extension DOUBLE-BUFFER
[ 63179.186] Initializing built-in extension RECORD
[ 63179.186] Initializing built-in extension DPMS
[ 63179.186] Initializing built-in extension X-Resource
[ 63179.186] Initializing built-in extension XVideo
[ 63179.186] Initializing built-in extension XVideo-MotionCompensation
[ 63179.186] Initializing built-in extension XFree86-VidModeExtension
[ 63179.186] Initializing built-in extension XFree86-DGA
[ 63179.186] Initializing built-in extension XFree86-DRI
[ 63179.186] Initializing built-in extension DRI2
[ 63179.186] (II) "glx" will be loaded by default.
[ 63179.186] (II) LoadModule: "extmod"
[ 63179.186] (II) Module "extmod" already built-in
[ 63179.186] (II) LoadModule: "glx"
[ 63179.186] (II) Loading /usr/lib/xorg/modules/extensions/libglx.so
[ 63179.187] (II) Module glx: vendor=3D"X.Org Foundation"
[ 63179.187] =A0=A0=A0 compiled for 1.13.0, module version =3D 1.0.0
[ 63179.187] =A0=A0=A0 ABI class: X.Org Server Extension, version 7.0
[ 63179.187] (**) AIGLX enabled
[ 63179.187] Loading extension GLX
[ 63179.187] (II) LoadModule: "nouveau"
[ 63179.187] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[ 63179.187] (II) Module nouveau: vendor=3D"X.Org Foundation"
[ 63179.187] =A0=A0=A0 compiled for 1.13.0, module version =3D 1.0.4
[ 63179.187] =A0=A0=A0 Module class: X.Org Video Driver
[ 63179.187] =A0=A0=A0 ABI class: X.Org Video Driver, version 13.0
[ 63179.187] (II) NOUVEAU driver =

[ 63179.187] (II) NOUVEAU driver for NVIDIA chipset families :
[ 63179.187] =A0=A0=A0 RIVA TNT=A0=A0=A0=A0=A0=A0=A0 (NV04)
[ 63179.187] =A0=A0=A0 RIVA TNT2=A0=A0=A0=A0=A0=A0 (NV05)
[ 63179.187] =A0=A0=A0 GeForce 256=A0=A0=A0=A0 (NV10)
[ 63179.187] =A0=A0=A0 GeForce 2=A0=A0=A0=A0=A0=A0 (NV11, NV15)
[ 63179.187] =A0=A0=A0 GeForce 4MX=A0=A0=A0=A0 (NV17, NV18)
[ 63179.187] =A0=A0=A0 GeForce 3=A0=A0=A0=A0=A0=A0 (NV20)
[ 63179.187] =A0=A0=A0 GeForce 4Ti=A0=A0=A0=A0 (NV25, NV28)
[ 63179.187] =A0=A0=A0 GeForce FX=A0=A0=A0=A0=A0 (NV3x)
[ 63179.187] =A0=A0=A0 GeForce 6=A0=A0=A0=A0=A0=A0 (NV4x)
[ 63179.187] =A0=A0=A0 GeForce 7=A0=A0=A0=A0=A0=A0 (G7x)
[ 63179.187] =A0=A0=A0 GeForce 8=A0=A0=A0=A0=A0=A0 (G8x)
[ 63179.187] =A0=A0=A0 GeForce GTX 200 (NVA0)
[ 63179.187] =A0=A0=A0 GeForce GTX 400 (NVC0)
[ 63179.187] (++) using VT number 7

[ 63179.191] (II) [drm] nouveau interface version: 1.0.0
[ 63179.191] (EE) No devices detected.
[ 63179.191] =

Fatal server error:
[ 63179.191] no screens found
[ 63179.191] (EE) =

Please consult the The X.Org Foundation support =

=A0=A0=A0 =A0at http://wiki.x.org
=A0for help. =

[ 63179.191] (EE) Please also check the log file at "/var/log/Xorg.0.log" f=
or additional information.
[ 63179.191] (EE) =



user@localhost ~ $ cat /etc/X11/xorg.conf


Section "Screen"
=A0=A0=A0 Identifier=A0=A0=A0 "Console0"
=A0=A0=A0 Device=A0=A0=A0 =A0=A0=A0 "NVIDIA NV46 (Factory)"
=A0=A0=A0 Monitor=A0=A0=A0 =A0=A0=A0 "LCD 15.4'' WXGA"
=A0=A0=A0 DefaultDepth=A0=A0=A0 24

=A0=A0=A0 SubSection=A0=A0=A0 "Display"
=A0=A0=A0 =A0=A0=A0 Visual=A0=A0=A0 =A0=A0=A0 "TrueColor"
=A0=A0=A0 =A0=A0=A0 Depth=A0=A0=A0 =A0=A0=A0 24
=A0=A0=A0 =A0=A0=A0 Modes=A0=A0=A0 =A0=A0=A0 "1280x800"
=A0=A0=A0 =A0=A0=A0 ViewPort=A0=A0=A0 0 0
=A0=A0=A0 =A0=A0=A0 Virtual=A0=A0=A0 =A0=A0=A0 2560 2560
=A0=A0=A0 EndSubSection
EndSection
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 =

Section "DRI"
=A0=A0=A0 Group=A0=A0=A0 =A0=A0=A0 "video"
=A0=A0=A0 Mode=A0=A0=A0 =A0=A0=A0 0660
EndSection

Section "ServerFlags"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AutoAddDevices"=A0=A0=A0 "true"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AutoEnableDevices"=A0=A0=A0 "true"
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AllowMouseOpenFail"

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DontZap"=A0=A0=A0 =A0=A0=A0 "true"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DontVTSwitch"=A0=A0=A0 "false"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DontZoom"=A0=A0=A0 =A0=A0=A0 "true"

#=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DisableVidModeExtension"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AllowNonLocalXvidtune"=A0=A0=A0 "off"

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DisableModInDev"=A0=A0=A0 "0"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AllowNonLocalModInDev"=A0=A0=A0 "0"

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DefaultServerLayout"=A0=A0=A0 "SV"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "UseDefaultFontPath"=A0=A0=A0 "false"

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "AIGLX"=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 "o=
n"

EndSection

Section "Extensions"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "RANDR"=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 "o=
n"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "RENDER"=A0=A0=A0 =A0=A0=A0 "on"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "DAMAGE"=A0=A0=A0 =A0=A0=A0 "on"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "XTEST"=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 "o=
n"

=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "XVideo"=A0=A0=A0 =A0=A0=A0 "on"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "Composite"=A0=A0=A0 =A0=A0=A0 "on"
EndSection

Section "Module"
=A0=A0=A0 SubSection=A0=A0=A0 "extmod"
=A0=A0=A0 =A0=A0=A0 Option=A0=A0=A0 "omit XFree86-DGA"
=A0=A0=A0 EndSubSection
EndSection

Section "ServerLayout"
=A0=A0=A0 Identifier=A0=A0=A0 "SV"
=A0=A0=A0 Screen=A0=A0=A0 =A0=A0=A0 "Console0"=A0=A0=A0 =A0=A0=A0 Absolute =
0 0
EndSection


Section "Monitor"
=A0=A0=A0 Identifier=A0=A0=A0 "LCD 15.4'' WXGA"=A0=A0=A0 # TFT laptop panel
EndSection

Section "Device"
=A0=A0=A0 Identifier=A0=A0=A0 "NVIDIA NV46"
=A0=A0=A0 Driver=A0=A0=A0 =A0=A0=A0 "nv"
EndSection

Section "Device"
=A0=A0=A0 Identifier=A0=A0=A0 "NVIDIA NV46 (Factory)"
=A0=A0=A0 VendorName=A0=A0=A0 "NVIDIA Corp"
=A0=A0=A0 Driver=A0=A0=A0 =A0=A0=A0 "nouveau"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "Monitor-LVDS-1"=A0=A0=A0 "LCD 15.4'' W=
XGA"
=A0=A0=A0 Option=A0=A0=A0 =A0=A0=A0 "HW_cursor"=A0=A0=A0 =A0=A0=A0 "true"
EndSection


user@localhost ~ # lsmod
Module=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Size=A0 Used by
lru_cache=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4128=A0 1 drbd
phc_intel=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 8024=A0 0 =

mperf=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 928=A0 1 phc=
_intel
kvm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 215348=A0 1 kvm_i=
ntel
uvcvideo=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 63768=A0 0 =

videobuf2_vmalloc=A0=A0=A0=A0=A0=A0 1856=A0 1 uvcvideo
videobuf2_memops=A0=A0=A0=A0=A0=A0=A0 1696=A0 1 videobuf2_vmalloc
videobuf2_core=A0=A0=A0=A0=A0=A0=A0=A0 20580=A0 1 uvcvideo
snd_hda_codec_realtek=A0=A0=A0 52672=A0 1 =

nouveau=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 803368=A0 1 =

cfbfillrect=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3424=A0 1 nouveau
cfbimgblt=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1920=A0 1 nouveau
mxm_wmi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 1024=A0 1 nouveau
wmi=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6852=A0 2 m=
xm_wmi,nouveau
cfbcopyarea=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 3232=A0 1 nouveau
i2c_algo_bit=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4452=A0 1 nouveau
ttm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 53092=A0 1 nou=
veau
drm_kms_helper=A0=A0=A0=A0=A0=A0=A0=A0 21952=A0 1 nouveau
drm=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 184400=A0 3 ttm,d=
rm_kms_helper,nouveau


I have the following installed.

libdrm-2.4.40 configured with --enable libkms
xf86-video-nouveau-1.0.4
xorg-server-1.13.0-r1


Appreciate any help.


Thanks,
Sebastian

From: Maginot Junior <maginot.junior@gmail.com>
Subject: Nouveau_drv problem and KMS nouveau problem... please HELP!
Date: Tue, 11 Jan 2011 23:57:53 -0200
Message-ID: <AANLkTikNYKonHgt-WNsRZ6pXocfNF7xpiaVmpaLZkjf7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <xorg-bounces+gcfx-xorg-2=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/xorg>,
	<mailto:xorg-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/xorg>
List-Post: <mailto:xorg@lists.freedesktop.org>
List-Help: <mailto:xorg-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/xorg>,
	<mailto:xorg-request@lists.freedesktop.org?subject=subscribe>
Sender: xorg-bounces+gcfx-xorg-2=m.gmane.org@lists.freedesktop.org
Errors-To: xorg-bounces+gcfx-xorg-2=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org, xorg@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi.


I have being in a long journey trying to make my distro to have a
proper support for KMS/DRI. It's something of months, and still
nothing. I must confess that understanding the KMS concept isn't hard,
but joing all peaces to work althogether is other thing.

So after a while without proper support, I decided to start all over,
kernel, X11, nouveau, drm, mesa, and so on.
This are some of the links that I used to guied me:

http://dri.freedesktop.org/wiki/Download
http://www.kernel.org/pub/linux/kernel/v2.6/
http://nouveau.freedesktop.org/wiki/
http://nouveau.freedesktop.org/wiki/InstallDRM
http://nouveau.freedesktop.org/wiki/KernelModeSetting
http://dri.freedesktop.org/wiki/
http://gnihce.wordpress.com/2010/08/17/building-dri-drivers-for-mesa-7-8-2/
http://www.x.org/releases/X11R7.6/src/

I really don't know if I follow the right build order (if there is
any), I may be ommiting something, but these are the main packages I
build trying to make a proper KMS support:

Mesa-7.8.2
./configure --prefix=3D/usr/X11 --sysconfdir=3D/etc
--mandir=3D/usr/X11/share/man --localstatedir=3D/var --with-driver=3Ddri
--enable-xcb

xorg-server-1.9.3
./configure --prefix=3D/usr/X11 --sysconfdir=3D/etc
--mandir=3D/usr/X11/share/man --localstatedir=3D/var
--with-module-dir=3D/usr/X11/lib/X11/modules --enable-install-setuid
PKG_CONFIG_PATH=3D/usr/X11/lib/pkgconfig:/usr/X11/share/pkgconfig:/usr/loca=
l/lib/pkgconfig:/usr/lib/pkgconfig:/opt/gnome/lib/pkgconfig:/opt/gnome/shar=
e/pkgconfig:/opt/qt/lib/pkgconfig
--no-create --no-recursion

libdrm-2.4.23 (later following troubleshooting section of the nouveau
wiki, I build drm from Git too)
./configure --prefix=3D/usr/X11 --sysconfdir=3D/etc
--mandir=3D/usr/X11/share/man --localstatedir=3D/var
--enable-nouveau-experimental-api --enable-vmwgfx-experimental-api
--enable-udev

plymouth-0.8.3
./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var
--enable-tracing --disable-tests --without-boot-entry
--without-default-plugin --with-logo=3D/usr/share/pixmaps/x-normal.png
--with-background-start-color-stop=3D0x0073B3
--with-background-end-color-stop=3D0x00457E
--with-background-color=3D0x3391cd --enable-gdm-transition
--with-system-root-install --no-create --no-recursio

randrproto-1.3.2:
./configure --prefix=3D/usr/X11 --sysconfdir=3D/etc
--mandir=3D/usr/X11/share/man --localstatedir=3D/var

xf86-video-nouveau from GIT
./autogen.sh --prefix=3D/usr/X11 --sysconfdir=3D/etc
--mandir=3D/usr/X11/share/man --localstatedir=3D/var

Linux-2.6.35.7
CONFIG_DRM_KMS_HELPER=3Dm
CONFIG_DRM=3Dm
CONFIG_DRM_KMS_HELPER=3Dm
CONFIG_DRM_TTM=3Dm
CONFIG_DRM_TDFX=3Dm
CONFIG_DRM_R128=3Dm
CONFIG_DRM_RADEON=3Dm
CONFIG_DRM_RADEON_KMS=3Dy
CONFIG_DRM_I810=3Dm
CONFIG_DRM_I830=3Dm
CONFIG_DRM_I915=3Dm
CONFIG_DRM_I915_KMS=3Dy
CONFIG_DRM_MGA=3Dm
CONFIG_DRM_SIS=3Dm
CONFIG_DRM_VIA=3Dm
CONFIG_DRM_SAVAGE=3Dm
CONFIG_DRM_NOUVEAU=3Dm
CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
CONFIG_DRM_NOUVEAU_DEBUG=3Dy
CONFIG_DRM_I2C_CH7006=3Dm

I did downloaded nouveau master and nouveau-firmware-20091212.tar.gz,
build them inside linux source directory and installed the firmwares.

Inside /etc/X11/xorg.conf.d/20-nouveau.conf I have:
Section "Device"
  Identifier "n"
  Driver "nouveau"
EndSection

The problem is that booting without NOMODESET cmdline arg gives me a
blank screen. The system is still operant (I can hit CTRL+ALT+DEL in
dark and reboot the system). One of the last things that I can see
before the screen goes blank is "[drm] ..." line
If I keep 20-nouveau.conf configuration and use NOMODESET xorg doesn't
start, commenting it and running gdm makes Xorg start. I do have a
problem with nouveau_drv.so afaik.
If I comment 20-nouveau.conf and boot without NOMODESET them I have a
blank console and a buggy X.

My Xorg's log after booting with NOMODESET and 20-nouveau.conf NOT commente=
d:

[    12.507]
X.Org X Server 1.9.3
Release Date: 2010-12-13
[    12.508] X Protocol Version 11, Revision 0
[    12.508] Build Operating System: Linux
2.6.35.7chesX-2.6.35.7-fullbuild-v1.4 i686
[    12.508] Current Operating System: Linux chesx
2.6.35.7chesX-2.6.35.7-fullbuild-v1.4 #1 SMP Tue Jan 11 05:32:13 BRST
2011 i686
[    12.508] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.35.7
root=3D/dev/sda2 ro selinux=3D0 nomodeset
[    12.508] Build Date: 10 January 2011  08:42:18PM
[    12.508]
[    12.508] Current version of pixman: 0.21.2
[    12.508]    Before reporting problems, check http://wiki.x.org
       to make sure that you have the latest version.
[    12.508] Markers: (--) probed, (**) from config file, (=3D=3D) default =
setting,
       (++) from command line, (!!) notice, (II) informational,
       (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    12.508] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Tue Jan 11
17:08:14 2011
[    12.564] (=3D=3D) Using config directory: "/etc/X11/xorg.conf.d"
[    12.564] (=3D=3D) Using system config directory "/usr/X11/share/X11/xor=
g.conf.d"
[    12.584] (=3D=3D) No Layout section.  Using the first Screen section.
[    12.584] (=3D=3D) No screen section available. Using defaults.
[    12.584] (**) |-->Screen "Default Screen Section" (0)
[    12.584] (**) |   |-->Monitor "<default monitor>"
[    12.585] (=3D=3D) No device specified for screen "Default Screen Sectio=
n".
       Using the first device section listed.
[    12.585] (**) |   |-->Device "n"
[    12.585] (=3D=3D) No monitor specified for screen "Default Screen Secti=
on".
       Using a default monitor configuration.
[    12.585] (**) Option "DontZap" "false"
[    12.585] (**) Option "AllowEmptyInput" "false"
[    12.585] (=3D=3D) Automatically adding devices
[    12.585] (=3D=3D) Automatically enabling devices
[    12.704] (=3D=3D) FontPath set to:
       /usr/X11/share/fonts/X11/misc/,
       /usr/X11/share/fonts/X11/TTF/,
       /usr/X11/share/fonts/X11/OTF/,
       /usr/X11/share/fonts/X11/Type1/,
       /usr/X11/share/fonts/X11/100dpi/,
       /usr/X11/share/fonts/X11/75dpi/
[    12.704] (=3D=3D) ModulePath set to "/usr/X11/lib/X11/modules"
[    12.704] (=3D=3D) |-->Input Device "<default pointer>"
[    12.704] (=3D=3D) |-->Input Device "<default keyboard>"
[    12.704] (=3D=3D) No Layout section. Using the default mouse configurat=
ion.
[    12.704] (=3D=3D) No Layout section. Using the default keyboard configu=
ration.
[    12.704] (II) Loader magic: 0x8215060
[    12.704] (II) Module ABI versions:
[    12.704]    X.Org ANSI C Emulation: 0.4
[    12.704]    X.Org Video Driver: 8.0
[    12.704]    X.Org XInput driver : 11.0
[    12.704]    X.Org Server Extension : 4.0
[    12.705] (--) PCI:*(0:1:0:0) 10de:0615:1682:2605 rev 162, Mem @
0xfd000000/16777216, 0xc0000000/268435456, 0xfa000000/33554432, I/O @
0x00008c00/128, BIOS @ 0x????????/131072
[    12.705] (WW) Open ACPI failed (/var/run/acpid.socket) (No such
file or directory)
[    12.705] (II) LoadModule: "extmod"
[    12.767] (II) Loading /usr/X11/lib/X11/modules/extensions/libextmod.so
[    12.775] (II) Module extmod: vendor=3D"X.Org Foundation"
[    12.775]    compiled for 1.9.3, module version =3D 1.0.0
[    12.775]    Module class: X.Org Server Extension
[    12.775]    ABI class: X.Org Server Extension, version 4.0
[    12.775] (II) Loading extension MIT-SCREEN-SAVER
[    12.775] (II) Loading extension XFree86-VidModeExtension
[    12.775] (II) Loading extension XFree86-DGA
[    12.775] (II) Loading extension DPMS
[    12.775] (II) Loading extension XVideo
[    12.775] (II) Loading extension XVideo-MotionCompensation
[    12.775] (II) Loading extension X-Resource
[    12.775] (II) LoadModule: "dbe"
[    12.776] (II) Loading /usr/X11/lib/X11/modules/extensions/libdbe.so
[    12.784] (II) Module dbe: vendor=3D"X.Org Foundation"
[    12.784]    compiled for 1.9.3, module version =3D 1.0.0
[    12.784]    Module class: X.Org Server Extension
[    12.784]    ABI class: X.Org Server Extension, version 4.0
[    12.784] (II) Loading extension DOUBLE-BUFFER
[    12.784] (II) LoadModule: "glx"
[    12.785] (II) Loading /usr/X11/lib/X11/modules/extensions/libglx.so
[    12.823] (II) Module glx: vendor=3D"X.Org Foundation"
[    12.823]    compiled for 1.9.3, module version =3D 1.0.0
[    12.823]    ABI class: X.Org Server Extension, version 4.0
[    12.823] (=3D=3D) AIGLX enabled
[    12.823] (II) Loading extension GLX
[    12.824] (II) LoadModule: "record"
[    12.824] (II) Loading /usr/X11/lib/X11/modules/extensions/librecord.so
[    12.831] (II) Module record: vendor=3D"X.Org Foundation"
[    12.831]    compiled for 1.9.3, module version =3D 1.13.0
[    12.831]    Module class: X.Org Server Extension
[    12.831]    ABI class: X.Org Server Extension, version 4.0
[    12.831] (II) Loading extension RECORD
[    12.831] (II) LoadModule: "dri"
[    12.831] (II) Loading /usr/X11/lib/X11/modules/extensions/libdri.so
[    12.852] (II) Module dri: vendor=3D"X.Org Foundation"
[    12.852]    compiled for 1.9.3, module version =3D 1.0.0
[    12.852]    ABI class: X.Org Server Extension, version 4.0
[    12.852] (II) Loading extension XFree86-DRI
[    12.852] (II) LoadModule: "nouveau"
[    12.852] (II) Loading /usr/X11/lib/X11/modules/drivers/nouveau_drv.so
[    12.911] dlopen: /usr/X11/lib/X11/modules/drivers/nouveau_drv.so:
undefined symbol: nouveau_dri2_vblank_handler
[    12.911] (EE) Failed to load /usr/X11/lib/X11/modules/drivers/nouveau_d=
rv.so
[    12.911] (II) UnloadModule: "nouveau"
[    12.911] (EE) Failed to load module "nouveau" (loader failed, 7)
[    12.911] (II) LoadModule: "mouse"
[    12.912] (II) Loading /usr/X11/lib/X11/modules/input/mouse_drv.so
[    12.941] (II) Module mouse: vendor=3D"X.Org Foundation"
[    12.941]    compiled for 1.9.3, module version =3D 1.6.0
[    12.941]    Module class: X.Org XInput Driver
[    12.941]    ABI class: X.Org XInput driver, version 11.0
[    12.941] (II) LoadModule: "kbd"
[    12.941] (II) Loading /usr/X11/lib/X11/modules/input/kbd_drv.so
[    12.948] (II) Module kbd: vendor=3D"X.Org Foundation"
[    12.948]    compiled for 1.9.3, module version =3D 1.5.0
[    12.948]    Module class: X.Org XInput Driver
[    12.948]    ABI class: X.Org XInput driver, version 11.0
[    12.948] (EE) No drivers available.
[    12.949]
Fatal server error:
[    12.949] no screens found
[    12.949]
Please consult the The X.Org Foundation support
        at http://wiki.x.org
 for help.
[    12.949] Please also check the log file at "/var/log/Xorg.0.log"
for additional information.
[    12.949]




My Xorg's log after booting with NOMODESET and with 20-nouveau.conf comment=
ed:
[   970.030]
X.Org X Server 1.9.3
Release Date: 2010-12-13
[   970.030] X Protocol Version 11, Revision 0
[   970.030] Build Operating System: Linux
2.6.35.7chesX-2.6.35.7-fullbuild-v1.4 i686
[   970.030] Current Operating System: Linux chesx
2.6.35.7chesX-2.6.35.7-fullbuild-v1.4 #1 SMP Tue Jan 11 05:32:13 BRST
2011 i686
[   970.030] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-2.6.35.7
root=3D/dev/sda2 ro selinux=3D0 nomodeset
[   970.030] Build Date: 10 January 2011  08:42:18PM
[   970.030]
[   970.030] Current version of pixman: 0.21.2
[   970.030]    Before reporting problems, check http://wiki.x.org
       to make sure that you have the latest version.
[   970.030] Markers: (--) probed, (**) from config file, (=3D=3D) default =
setting,
       (++) from command line, (!!) notice, (II) informational,
       (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[   970.031] (=3D=3D) Log file: "/var/log/Xorg.0.log", Time: Tue Jan 11
17:24:11 2011
[   970.031] (=3D=3D) Using config directory: "/etc/X11/xorg.conf.d"
[   970.031] (=3D=3D) Using system config directory "/usr/X11/share/X11/xor=
g.conf.d"
[   970.031] (=3D=3D) No Layout section.  Using the first Screen section.
[   970.031] (=3D=3D) No screen section available. Using defaults.
[   970.031] (**) |-->Screen "Default Screen Section" (0)
[   970.031] (**) |   |-->Monitor "<default monitor>"
[   970.031] (=3D=3D) No monitor specified for screen "Default Screen Secti=
on".
       Using a default monitor configuration.
[   970.031] (**) Option "DontZap" "false"
[   970.031] (**) Option "AllowEmptyInput" "false"
[   970.031] (=3D=3D) Automatically adding devices
[   970.031] (=3D=3D) Automatically enabling devices
[   970.031] (=3D=3D) FontPath set to:
       /usr/X11/share/fonts/X11/misc/,
       /usr/X11/share/fonts/X11/TTF/,
       /usr/X11/share/fonts/X11/OTF/,
       /usr/X11/share/fonts/X11/Type1/,
       /usr/X11/share/fonts/X11/100dpi/,
       /usr/X11/share/fonts/X11/75dpi/
[   970.031] (=3D=3D) ModulePath set to "/usr/X11/lib/X11/modules"
[   970.031] (=3D=3D) |-->Input Device "<default pointer>"
[   970.031] (=3D=3D) |-->Input Device "<default keyboard>"
[   970.031] (=3D=3D) No Layout section. Using the default mouse configurat=
ion.
[   970.031] (=3D=3D) No Layout section. Using the default keyboard configu=
ration.
[   970.031] (II) Loader magic: 0x8215060
[   970.031] (II) Module ABI versions:
[   970.031]    X.Org ANSI C Emulation: 0.4
[   970.031]    X.Org Video Driver: 8.0
[   970.031]    X.Org XInput driver : 11.0
[   970.031]    X.Org Server Extension : 4.0
[   970.032] (--) PCI:*(0:1:0:0) 10de:0615:1682:2605 rev 162, Mem @
0xfd000000/16777216, 0xc0000000/268435456, 0xfa000000/33554432, I/O @
0x00008c00/128, BIOS @ 0x????????/131072
[   970.032] (WW) Open ACPI failed (/var/run/acpid.socket) (No such
file or directory)
[   970.032] (II) LoadModule: "extmod"
[   970.033] (II) Loading /usr/X11/lib/X11/modules/extensions/libextmod.so
[   970.033] (II) Module extmod: vendor=3D"X.Org Foundation"
[   970.033]    compiled for 1.9.3, module version =3D 1.0.0
[   970.033]    Module class: X.Org Server Extension
[   970.033]    ABI class: X.Org Server Extension, version 4.0
[   970.033] (II) Loading extension MIT-SCREEN-SAVER
[   970.033] (II) Loading extension XFree86-VidModeExtension
[   970.033] (II) Loading extension XFree86-DGA
[   970.033] (II) Loading extension DPMS
[   970.033] (II) Loading extension XVideo
[   970.033] (II) Loading extension XVideo-MotionCompensation
[   970.033] (II) Loading extension X-Resource
[   970.033] (II) LoadModule: "dbe"
[   970.034] (II) Loading /usr/X11/lib/X11/modules/extensions/libdbe.so
[   970.034] (II) Module dbe: vendor=3D"X.Org Foundation"
[   970.034]    compiled for 1.9.3, module version =3D 1.0.0
[   970.034]    Module class: X.Org Server Extension
[   970.034]    ABI class: X.Org Server Extension, version 4.0
[   970.034] (II) Loading extension DOUBLE-BUFFER
[   970.034] (II) LoadModule: "glx"
[   970.035] (II) Loading /usr/X11/lib/X11/modules/extensions/libglx.so
[   970.035] (II) Module glx: vendor=3D"X.Org Foundation"
[   970.035]    compiled for 1.9.3, module version =3D 1.0.0
[   970.035]    ABI class: X.Org Server Extension, version 4.0
[   970.035] (=3D=3D) AIGLX enabled
[   970.035] (II) Loading extension GLX
[   970.035] (II) LoadModule: "record"
[   970.036] (II) Loading /usr/X11/lib/X11/modules/extensions/librecord.so
[   970.036] (II) Module record: vendor=3D"X.Org Foundation"
[   970.036]    compiled for 1.9.3, module version =3D 1.13.0
[   970.036]    Module class: X.Org Server Extension
[   970.036]    ABI class: X.Org Server Extension, version 4.0
[   970.036] (II) Loading extension RECORD
[   970.036] (II) LoadModule: "dri"
[   970.036] (II) Loading /usr/X11/lib/X11/modules/extensions/libdri.so
[   970.037] (II) Module dri: vendor=3D"X.Org Foundation"
[   970.037]    compiled for 1.9.3, module version =3D 1.0.0
[   970.037]    ABI class: X.Org Server Extension, version 4.0
[   970.037] (II) Loading extension XFree86-DRI
[   970.037] (=3D=3D) Matched nv as autoconfigured driver 0
[   970.037] (=3D=3D) Matched vesa as autoconfigured driver 1
[   970.037] (=3D=3D) Matched fbdev as autoconfigured driver 2
[   970.037] (=3D=3D) Assigned the driver to the xf86ConfigLayout
[   970.037] (II) LoadModule: "nv"
[   970.037] (II) Loading /usr/X11/lib/X11/modules/drivers/nv_drv.so
[   970.058] (II) Module nv: vendor=3D"X.Org Foundation"
[   970.058]    compiled for 1.9.3, module version =3D 2.1.18
[   970.058]    Module class: X.Org Video Driver
[   970.058]    ABI class: X.Org Video Driver, version 8.0
[   970.059] (II) LoadModule: "vesa"
[   970.059] (II) Loading /usr/X11/lib/X11/modules/drivers/vesa_drv.so
[   970.064] (II) Module vesa: vendor=3D"X.Org Foundation"
[   970.064]    compiled for 1.9.3, module version =3D 2.3.0
[   970.064]    Module class: X.Org Video Driver
[   970.064]    ABI class: X.Org Video Driver, version 8.0
[   970.064] (II) LoadModule: "fbdev"
[   970.065] (II) Loading /usr/X11/lib/X11/modules/drivers/fbdev_drv.so
[   970.076] (II) Module fbdev: vendor=3D"X.Org Foundation"
[   970.076]    compiled for 1.9.3, module version =3D 0.4.2
[   970.076]    ABI class: X.Org Video Driver, version 8.0
[   970.076] (II) LoadModule: "mouse"
[   970.077] (II) Loading /usr/X11/lib/X11/modules/input/mouse_drv.so
[   970.077] (II) Module mouse: vendor=3D"X.Org Foundation"
[   970.077]    compiled for 1.9.3, module version =3D 1.6.0
[   970.077]    Module class: X.Org XInput Driver
[   970.077]    ABI class: X.Org XInput driver, version 11.0
[   970.077] (II) LoadModule: "kbd"
[   970.077] (II) Loading /usr/X11/lib/X11/modules/input/kbd_drv.so
[   970.077] (II) Module kbd: vendor=3D"X.Org Foundation"
[   970.077]    compiled for 1.9.3, module version =3D 1.5.0
[   970.077]    Module class: X.Org XInput Driver
[   970.077]    ABI class: X.Org XInput driver, version 11.0
[   970.077] (II) NV: driver for NVIDIA chipsets:
                  ( # text Removed for fitting in the list # )
[   970.084] (II) VESA: driver for VESA chipsets: vesa
[   970.084] (II) FBDEV: driver for framebuffer: fbdev
[   970.084] (--) using VT number 7

[   970.095] (--) NV: Found NVIDIA GeForce GTS 250 at 01@00:00:0
[   970.095] (WW) Falling back to old probe method for vesa
[   970.095] (WW) Falling back to old probe method for fbdev
[   970.095] (II) Loading sub module "fbdevhw"
[   970.095] (II) LoadModule: "fbdevhw"
[   970.095] (II) Loading /usr/X11/lib/X11/modules/libfbdevhw.so
[   970.105] (II) Module fbdevhw: vendor=3D"X.Org Foundation"
[   970.105]    compiled for 1.9.3, module version =3D 0.0.2
[   970.105]    ABI class: X.Org Video Driver, version 8.0
[   970.105] (EE) open /dev/fb0: No such file or directory
[   970.105] (II) Loading sub module "int10"
[   970.105] (II) LoadModule: "int10"
[   970.106] (II) Loading /usr/X11/lib/X11/modules/libint10.so
[   970.115] (II) Module int10: vendor=3D"X.Org Foundation"
[   970.115]    compiled for 1.9.3, module version =3D 1.0.0
[   970.115]    ABI class: X.Org Video Driver, version 8.0
[   970.115] (II) NV(0): Initializing int10
[   970.120] (II) NV(0): Primary V_BIOS segment is: 0xc000
[   970.121] (--) NV(0): Console is VGA mode 0x3
[   970.121] (II) NV(0): Creating default Display subsection in Screen sect=
ion
       "Default Screen Section" for depth/fbbpp 24/32
[   970.121] (=3D=3D) NV(0): Depth 24, (--) framebuffer bpp 32
[   970.121] (=3D=3D) NV(0): RGB weight 888
[   970.121] (=3D=3D) NV(0): Default visual is TrueColor
[   970.121] (=3D=3D) NV(0): Using hardware cursor
[   970.121] (=3D=3D) NV(0): Using gamma correction (1.0, 1.0, 1.0)
[   970.124] (II) NV(0): MMIO registers mapped at 0xb614f000
[   970.124] (--) NV(0): Total video RAM: 1024.0 MB
[   970.124] (--) NV(0):       BAR1 size: 256.0 MB
[   970.124] (--) NV(0):   Mapped memory: 256.0 MB
[   970.157] (II) NV(0): Linear framebuffer mapped at 0xa614f000
[   970.157] (II) Loading sub module "i2c"
[   970.157] (II) LoadModule: "i2c"
[   970.157] (II) Module "i2c" already built-in
[   970.157] (II) Loading sub module "ddc"
[   970.157] (II) LoadModule: "ddc"
[   970.157] (II) Module "ddc" already built-in
[   970.157] (II) NV(0): Ignoring unsupported output type 15 at port 0
[   970.157] (--) NV(0): Connector map:
[   970.157] (--) NV(0):   Bus 0 -> DAC1
[   970.157] (--) NV(0):   Bus 1 -> DAC2
[   970.157] (--) NV(0):   Bus 1 -> SOR0
[   970.157] (--) NV(0):   Bus 3 -> SOR1
[   970.157] (--) NV(0): Load detection: 497
[   970.157] (II) NV(0): I2C bus "I2C0" initialized.
[   970.157] (II) NV(0): Output VGA1 has no monitor section
[   970.157] (II) NV(0): I2C bus "I2C1" initialized.
[   970.157] (II) NV(0): Output VGA2 has no monitor section
[   970.158] (II) NV(0): Output DVI0 has no monitor section
[   970.158] (II) NV(0): I2C bus "I2C3" initialized.
[   970.158] (II) NV(0): Output DVI1 has no monitor section
[   970.158] (II) NV(0): Probing for EDID on I2C bus 0...
[   970.158] (II) NV(0): I2C device "I2C0:ddc2" registered at address 0xA0.
[   970.205] (--) NV(0): DDC detected a CRT:
[   970.205] (II) NV(0): Manufacturer: SAM  Model: 375  Serial#: 1346712114
[   970.205] (II) NV(0): Year: 2008  Week: 33
[   970.205] (II) NV(0): EDID Version: 1.3
[   970.205] (II) NV(0): Analog Display Input,  Input Voltage Level:
0.700/0.300 V
[   970.205] (II) NV(0): Sync:  Separate  Composite  SyncOnGreen
[   970.205] (II) NV(0): Max Image Size [cm]: horiz.: 49  vert.: 32
[   970.206] (II) NV(0): Gamma: 2.20
[   970.206] (II) NV(0): DPMS capabilities: Off; RGB/Color Display
[   970.206] (II) NV(0): First detailed timing is preferred mode
[   970.206] (II) NV(0): redX: 0.639 redY: 0.333   greenX: 0.289 greenY: 0.=
597
[   970.206] (II) NV(0): blueX: 0.153 blueY: 0.082   whiteX: 0.313 whiteY: =
0.329
[   970.206] (II) NV(0): Supported established timings:
[   970.206] (II) NV(0): 720x400@70Hz
[   970.206] (II) NV(0): 640x480@60Hz
[   970.206] (II) NV(0): 640x480@67Hz
[   970.206] (II) NV(0): 640x480@72Hz
[   970.206] (II) NV(0): 640x480@75Hz
[   970.206] (II) NV(0): 800x600@56Hz
[   970.206] (II) NV(0): 800x600@60Hz
[   970.206] (II) NV(0): 800x600@72Hz
[   970.206] (II) NV(0): 800x600@75Hz
[   970.206] (II) NV(0): 832x624@75Hz
[   970.206] (II) NV(0): 1024x768@60Hz
[   970.206] (II) NV(0): 1024x768@70Hz
[   970.206] (II) NV(0): 1024x768@75Hz
[   970.206] (II) NV(0): 1280x1024@75Hz
[   970.206] (II) NV(0): 1152x864@75Hz
[   970.206] (II) NV(0): Manufacturer's mask: 0
[   970.206] (II) NV(0): Supported standard timings:
[   970.206] (II) NV(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[   970.206] (II) NV(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 328=
97
[   970.206] (II) NV(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[   970.206] (II) NV(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[   970.206] (II) NV(0): Supported detailed timing:
[   970.206] (II) NV(0): clock: 119.0 MHz   Image Size:  494 x 320 mm
[   970.206] (II) NV(0): h_active: 1680  h_sync: 1728  h_sync_end 1760
h_blank_end 1840 h_border: 0
[   970.206] (II) NV(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1080 v_border: 0
[   970.206] (II) NV(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H
max: 81 kHz, PixClock max 145 MHz
[   970.206] (II) NV(0): Monitor name: SyncMaster
[   970.206] (II) NV(0): Serial No: HQAQ802723
[   970.206] (II) NV(0): EDID (in hex):
[   970.206] (II) NV(0):        00ffffffffffff004c2d750332324550
[   970.206] (II) NV(0):        211201030e3120782a9345a3554a9827
[   970.206] (II) NV(0):        155054bfef80b30081808140714f0101
[   970.206] (II) NV(0):        0101010101017c2e90a0601a1e403020
[   970.206] (II) NV(0):        3600ee401100001a000000fd00384b1e
[   970.206] (II) NV(0):        510e000a202020202020000000fc0053
[   970.206] (II) NV(0):        796e634d61737465720a2020000000ff
[   970.206] (II) NV(0):        00485141513830323732330a20200096
[   970.206] (--) NV(0): Trying load detection on VGA1 ... found one!
[   970.260] (II) NV(0): EDID for output VGA1
[   970.260] (II) NV(0): Manufacturer: SAM  Model: 375  Serial#: 1346712114
[   970.260] (II) NV(0): Year: 2008  Week: 33
[   970.260] (II) NV(0): EDID Version: 1.3
[   970.260] (II) NV(0): Analog Display Input,  Input Voltage Level:
0.700/0.300 V
[   970.260] (II) NV(0): Sync:  Separate  Composite  SyncOnGreen
[   970.260] (II) NV(0): Max Image Size [cm]: horiz.: 49  vert.: 32
[   970.260] (II) NV(0): Gamma: 2.20
[   970.260] (II) NV(0): DPMS capabilities: Off; RGB/Color Display
[   970.260] (II) NV(0): First detailed timing is preferred mode
[   970.260] (II) NV(0): redX: 0.639 redY: 0.333   greenX: 0.289 greenY: 0.=
597
[   970.260] (II) NV(0): blueX: 0.153 blueY: 0.082   whiteX: 0.313 whiteY: =
0.329
[   970.260] (II) NV(0): Supported established timings:
[   970.260] (II) NV(0): 720x400@70Hz
[   970.260] (II) NV(0): 640x480@60Hz
[   970.260] (II) NV(0): 640x480@67Hz
[   970.260] (II) NV(0): 640x480@72Hz
[   970.260] (II) NV(0): 640x480@75Hz
[   970.260] (II) NV(0): 800x600@56Hz
[   970.260] (II) NV(0): 800x600@60Hz
[   970.260] (II) NV(0): 800x600@72Hz
[   970.260] (II) NV(0): 800x600@75Hz
[   970.260] (II) NV(0): 832x624@75Hz
[   970.260] (II) NV(0): 1024x768@60Hz
[   970.260] (II) NV(0): 1024x768@70Hz
[   970.260] (II) NV(0): 1024x768@75Hz
[   970.260] (II) NV(0): 1280x1024@75Hz
[   970.260] (II) NV(0): 1152x864@75Hz
[   970.261] (II) NV(0): Manufacturer's mask: 0
[   970.261] (II) NV(0): Supported standard timings:
[   970.261] (II) NV(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[   970.261] (II) NV(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 328=
97
[   970.261] (II) NV(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[   970.261] (II) NV(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[   970.261] (II) NV(0): Supported detailed timing:
[   970.261] (II) NV(0): clock: 119.0 MHz   Image Size:  494 x 320 mm
[   970.261] (II) NV(0): h_active: 1680  h_sync: 1728  h_sync_end 1760
h_blank_end 1840 h_border: 0
[   970.261] (II) NV(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1080 v_border: 0
[   970.261] (II) NV(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H
max: 81 kHz, PixClock max 145 MHz
[   970.261] (II) NV(0): Monitor name: SyncMaster
[   970.261] (II) NV(0): Serial No: HQAQ802723
[   970.261] (II) NV(0): EDID (in hex):
[   970.261] (II) NV(0):        00ffffffffffff004c2d750332324550
[   970.261] (II) NV(0):        211201030e3120782a9345a3554a9827
[   970.261] (II) NV(0):        155054bfef80b30081808140714f0101
[   970.261] (II) NV(0):        0101010101017c2e90a0601a1e403020
[   970.261] (II) NV(0):        3600ee401100001a000000fd00384b1e
[   970.261] (II) NV(0):        510e000a202020202020000000fc0053
[   970.261] (II) NV(0):        796e634d61737465720a2020000000ff
[   970.261] (II) NV(0):        00485141513830323732330a20200096
[   970.261] (II) NV(0): EDID vendor "SAM", prod id 885
[   970.261] (II) NV(0): Using EDID range info for horizontal sync
[   970.261] (II) NV(0): Using EDID range info for vertical refresh
[   970.261] (II) NV(0): Printing DDC gathered Modelines:
[   970.261] (II) NV(0): Modeline "1680x1050"x0.0  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x0.0   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x0.0   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   970.261] (II) NV(0): Modeline "640x480"x0.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   970.261] (II) NV(0): Modeline "640x480"x0.0   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   970.261] (II) NV(0): Modeline "640x480"x0.0   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   970.261] (II) NV(0): Modeline "640x480"x0.0   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   970.261] (II) NV(0): Modeline "720x400"x0.0   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   970.261] (II) NV(0): Modeline "1280x1024"x0.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x0.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x0.0   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x0.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   970.261] (II) NV(0): Modeline "832x624"x0.0   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x0.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x0.0   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   970.261] (II) NV(0): Modeline "1152x864"x0.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   970.261] (II) NV(0): Modeline "1680x1050"x0.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   970.261] (II) NV(0): Modeline "1280x1024"x0.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   970.261] (II) NV(0): Modeline "1280x960"x0.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   970.261] (II) NV(0): EDID vendor "SAM", prod id 885
[   970.261] (II) NV(0): Printing probed modes for output VGA1
[   970.261] (II) NV(0): Modeline "1680x1050"x59.9  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   970.261] (II) NV(0): Modeline "1680x1050"x60.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   970.261] (II) NV(0): Modeline "1280x1024"x75.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   970.261] (II) NV(0): Modeline "1280x1024"x60.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   970.261] (II) NV(0): Modeline "1280x960"x60.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   970.261] (II) NV(0): Modeline "1152x864"x75.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x75.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x70.1   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   970.261] (II) NV(0): Modeline "1024x768"x60.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   970.261] (II) NV(0): Modeline "832x624"x74.6   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x72.2   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x75.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x60.3   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   970.261] (II) NV(0): Modeline "800x600"x56.2   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   970.262] (II) NV(0): Modeline "640x480"x75.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   970.262] (II) NV(0): Modeline "640x480"x72.8   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   970.262] (II) NV(0): Modeline "640x480"x66.7   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   970.262] (II) NV(0): Modeline "640x480"x59.9   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   970.262] (II) NV(0): Modeline "720x400"x70.1   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   970.262] (II) NV(0): Probing for EDID on I2C bus 1...
[   970.262] (II) NV(0): I2C device "I2C1:ddc2" registered at address 0xA0.
[   970.265] (II) NV(0):   ... none found
[   970.265] (--) NV(0): Trying load detection on VGA2 ... nothing.
[   970.310] (II) NV(0): EDID for output VGA2
[   970.310] (II) NV(0): EDID for output DVI0
[   970.310] (II) NV(0): Probing for EDID on I2C bus 3...
[   970.310] (II) NV(0): I2C device "I2C3:ddc2" registered at address 0xA0.
[   970.313] (II) NV(0):   ... none found
[   970.313] (II) NV(0): EDID for output DVI1
[   970.313] (II) NV(0): Output VGA1 connected
[   970.313] (II) NV(0): Output VGA2 disconnected
[   970.313] (II) NV(0): Output DVI0 disconnected
[   970.313] (II) NV(0): Output DVI1 disconnected
[   970.313] (II) NV(0): Using exact sizes for initial modes
[   970.313] (II) NV(0): Output VGA1 using initial mode 1680x1050
[   970.313] (II) NV(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[   970.313] (--) NV(0): Virtual size is 1680x1680 (pitch 1792)
[   970.313] (**) NV(0):  Driver mode "1680x1050": 119.0 MHz (scaled
from 0.0 MHz), 64.7 kHz, 59.9 Hz
[   970.313] (II) NV(0): Modeline "1680x1050"x59.9  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   970.313] (**) NV(0):  Driver mode "1680x1050": 146.2 MHz (scaled
from 0.0 MHz), 65.3 kHz, 60.0 Hz
[   970.313] (II) NV(0): Modeline "1680x1050"x60.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   970.313] (**) NV(0):  Driver mode "1280x1024": 135.0 MHz (scaled
from 0.0 MHz), 80.0 kHz, 75.0 Hz
[   970.313] (II) NV(0): Modeline "1280x1024"x75.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   970.313] (**) NV(0):  Driver mode "1280x1024": 108.0 MHz (scaled
from 0.0 MHz), 64.0 kHz, 60.0 Hz
[   970.313] (II) NV(0): Modeline "1280x1024"x60.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   970.313] (**) NV(0):  Driver mode "1280x960": 108.0 MHz (scaled
from 0.0 MHz), 60.0 kHz, 60.0 Hz
[   970.313] (II) NV(0): Modeline "1280x960"x60.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   970.313] (**) NV(0):  Driver mode "1152x864": 108.0 MHz (scaled
from 0.0 MHz), 67.5 kHz, 75.0 Hz
[   970.313] (II) NV(0): Modeline "1152x864"x75.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   970.313] (**) NV(0):  Driver mode "1024x768": 78.8 MHz (scaled
from 0.0 MHz), 60.0 kHz, 75.0 Hz
[   970.313] (II) NV(0): Modeline "1024x768"x75.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   970.313] (**) NV(0):  Driver mode "1024x768": 75.0 MHz (scaled
from 0.0 MHz), 56.5 kHz, 70.1 Hz
[   970.313] (II) NV(0): Modeline "1024x768"x70.1   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   970.313] (**) NV(0):  Driver mode "1024x768": 65.0 MHz (scaled
from 0.0 MHz), 48.4 kHz, 60.0 Hz
[   970.313] (II) NV(0): Modeline "1024x768"x60.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   970.313] (**) NV(0):  Driver mode "832x624": 57.3 MHz (scaled from
0.0 MHz), 49.7 kHz, 74.6 Hz
[   970.313] (II) NV(0): Modeline "832x624"x74.6   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   970.313] (**) NV(0):  Driver mode "800x600": 50.0 MHz (scaled from
0.0 MHz), 48.1 kHz, 72.2 Hz
[   970.313] (II) NV(0): Modeline "800x600"x72.2   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   970.313] (**) NV(0):  Driver mode "800x600": 49.5 MHz (scaled from
0.0 MHz), 46.9 kHz, 75.0 Hz
[   970.313] (II) NV(0): Modeline "800x600"x75.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   970.313] (**) NV(0):  Driver mode "800x600": 40.0 MHz (scaled from
0.0 MHz), 37.9 kHz, 60.3 Hz
[   970.313] (II) NV(0): Modeline "800x600"x60.3   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   970.314] (**) NV(0):  Driver mode "800x600": 36.0 MHz (scaled from
0.0 MHz), 35.2 kHz, 56.2 Hz
[   970.314] (II) NV(0): Modeline "800x600"x56.2   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   970.314] (**) NV(0):  Driver mode "640x480": 31.5 MHz (scaled from
0.0 MHz), 37.5 kHz, 75.0 Hz
[   970.314] (II) NV(0): Modeline "640x480"x75.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   970.314] (**) NV(0):  Driver mode "640x480": 31.5 MHz (scaled from
0.0 MHz), 37.9 kHz, 72.8 Hz
[   970.314] (II) NV(0): Modeline "640x480"x72.8   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   970.314] (**) NV(0):  Driver mode "640x480": 30.2 MHz (scaled from
0.0 MHz), 35.0 kHz, 66.7 Hz
[   970.314] (II) NV(0): Modeline "640x480"x66.7   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   970.314] (**) NV(0):  Driver mode "640x480": 25.2 MHz (scaled from
0.0 MHz), 31.5 kHz, 59.9 Hz
[   970.314] (II) NV(0): Modeline "640x480"x59.9   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   970.314] (**) NV(0):  Driver mode "720x400": 28.3 MHz (scaled from
0.0 MHz), 31.5 kHz, 70.1 Hz
[   970.314] (II) NV(0): Modeline "720x400"x70.1   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   970.314] (**) NV(0): Display dimensions: (490, 320) mm
[   970.314] (**) NV(0): DPI set to (87, 133)
[   970.314] (II) Loading sub module "fb"
[   970.314] (II) LoadModule: "fb"
[   970.314] (II) Loading /usr/X11/lib/X11/modules/libfb.so
[   970.321] (II) Module fb: vendor=3D"X.Org Foundation"
[   970.321]    compiled for 1.9.3, module version =3D 1.0.0
[   970.321]    ABI class: X.Org ANSI C Emulation, version 0.4
[   970.321] (II) Loading sub module "xaa"
[   970.321] (II) LoadModule: "xaa"
[   970.322] (II) Loading /usr/X11/lib/X11/modules/libxaa.so
[   970.331] (II) Module xaa: vendor=3D"X.Org Foundation"
[   970.331]    compiled for 1.9.3, module version =3D 1.2.1
[   970.331]    ABI class: X.Org Video Driver, version 8.0
[   970.331] (II) Loading sub module "ramdac"
[   970.331] (II) LoadModule: "ramdac"
[   970.331] (II) Module "ramdac" already built-in
[   970.331] (II) UnloadModule: "vesa"
[   970.331] (II) Unloading /usr/X11/lib/X11/modules/drivers/vesa_drv.so
[   970.331] (II) UnloadModule: "fbdev"
[   970.331] (II) Unloading /usr/X11/lib/X11/modules/drivers/fbdev_drv.so
[   970.331] (II) UnloadModule: "fbdevhw"
[   970.331] (II) Unloading /usr/X11/lib/X11/modules/libfbdevhw.so
[   970.331] (--) Depth 24 pixmap format is 32 bpp
[   970.349] (--) NV(0): 212.51 MB available for offscreen pixmaps
[   970.356] (II) NV(0): Using XFree86 Acceleration Architecture (XAA)
[   970.356]    Screen to screen bit blits
[   970.356]    Solid filled rectangles
[   970.356]    8x8 mono pattern filled rectangles
[   970.356]    Indirect CPU to Screen color expansion
[   970.356]    Solid Lines
[   970.356]    Scanline Image Writes
[   970.356]    Setting up tile and stipple cache:
[   970.356]            32 128x128 slots
[   970.356]            32 256x256 slots
[   970.356]            16 512x512 slots
[   970.356] (=3D=3D) NV(0): Backing store disabled
[   970.356] (=3D=3D) NV(0): Silken mouse enabled
[   970.357] (II) NV(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[   970.357] (=3D=3D) NV(0): DPMS enabled
[   970.403] (--) RandR disabled
[   970.403] (II) Initializing built-in extension Generic Event Extension
[   970.404] (II) Initializing built-in extension SHAPE
[   970.404] (II) Initializing built-in extension MIT-SHM
[   970.404] (II) Initializing built-in extension XInputExtension
[   970.404] (II) Initializing built-in extension XTEST
[   970.404] (II) Initializing built-in extension BIG-REQUESTS
[   970.404] (II) Initializing built-in extension SYNC
[   970.404] (II) Initializing built-in extension XKEYBOARD
[   970.404] (II) Initializing built-in extension XC-MISC
[   970.404] (II) Initializing built-in extension XINERAMA
[   970.404] (II) Initializing built-in extension XFIXES
[   970.404] (II) Initializing built-in extension RENDER
[   970.404] (II) Initializing built-in extension RANDR
[   970.404] (II) Initializing built-in extension COMPOSITE
[   970.404] (II) Initializing built-in extension DAMAGE
[   970.413] (II) AIGLX: Screen 0 is not DRI capable
[   970.460] (II) AIGLX: Loaded and initialized /usr/X11/lib/dri/swrast_dri=
.so
[   970.460] (II) GLX: Initialized DRISWRAST GL provider for screen 0
[   970.460] (II) NV(0): Setting screen physical size to 444 x 277
[   970.928] (WW) <default pointer>: No Device specified, looking for one...
[   971.024] (II) <default pointer>: Setting Device option to "/dev/input/m=
ice"
[   971.024] (--) <default pointer>: Device: "/dev/input/mice"
[   971.024] (=3D=3D) <default pointer>: Protocol: "Auto"
[   971.024] (**) Option "CorePointer"
[   971.024] (**) <default pointer>: always reports core events
[   971.136] (=3D=3D) <default pointer>: Emulate3Buttons, Emulate3Timeout: =
50
[   971.136] (**) <default pointer>: ZAxisMapping: buttons 4 and 5
[   971.136] (**) <default pointer>: Buttons: 9
[   971.136] (**) <default pointer>: Sensitivity: 1
[   971.136] (II) XINPUT: Adding extended input device "<default
pointer>" (type: MOUSE)
[   971.136] (**) <default pointer>: (accel) keeping acceleration scheme 1
[   971.136] (**) <default pointer>: (accel) acceleration profile 0
[   971.136] (**) <default pointer>: (accel) acceleration factor: 2.000
[   971.136] (**) <default pointer>: (accel) acceleration threshold: 4
[   971.168] (II) <default pointer>: Setting mouse protocol to "ExplorerPS/=
2"
[   971.460] (II) <default pointer>: ps2EnableDataReporting: succeeded
[   971.460] (**) Option "CoreKeyboard"
[   971.460] (**) <default keyboard>: always reports core events
[   971.460] (**) Option "Protocol" "standard"
[   971.460] (**) <default keyboard>: Protocol: standard
[   971.460] (**) Option "XkbRules" "base"
[   971.460] (**) <default keyboard>: XkbRules: "base"
[   971.460] (**) Option "XkbModel" "pc105"
[   971.460] (**) <default keyboard>: XkbModel: "pc105"
[   971.460] (**) Option "XkbLayout" "us"
[   971.460] (**) <default keyboard>: XkbLayout: "us"
[   971.460] (**) Option "CustomKeycodes" "off"
[   971.460] (**) <default keyboard>: CustomKeycodes disabled
[   971.460] (II) XINPUT: Adding extended input device "<default
keyboard>" (type: KEYBOARD)
[   974.185] (II) NV(0): Probing for EDID on I2C bus 0...
[   974.232] (--) NV(0): DDC detected a CRT:
[   974.233] (II) NV(0): Manufacturer: SAM  Model: 375  Serial#: 1346712114
[   974.233] (II) NV(0): Year: 2008  Week: 33
[   974.233] (II) NV(0): EDID Version: 1.3
[   974.233] (II) NV(0): Analog Display Input,  Input Voltage Level:
0.700/0.300 V
[   974.233] (II) NV(0): Sync:  Separate  Composite  SyncOnGreen
[   974.233] (II) NV(0): Max Image Size [cm]: horiz.: 49  vert.: 32
[   974.233] (II) NV(0): Gamma: 2.20
[   974.233] (II) NV(0): DPMS capabilities: Off; RGB/Color Display
[   974.233] (II) NV(0): First detailed timing is preferred mode
[   974.233] (II) NV(0): redX: 0.639 redY: 0.333   greenX: 0.289 greenY: 0.=
597
[   974.233] (II) NV(0): blueX: 0.153 blueY: 0.082   whiteX: 0.313 whiteY: =
0.329
[   974.233] (II) NV(0): Supported established timings:
[   974.233] (II) NV(0): 720x400@70Hz
[   974.233] (II) NV(0): 640x480@60Hz
[   974.233] (II) NV(0): 640x480@67Hz
[   974.233] (II) NV(0): 640x480@72Hz
[   974.233] (II) NV(0): 640x480@75Hz
[   974.233] (II) NV(0): 800x600@56Hz
[   974.233] (II) NV(0): 800x600@60Hz
[   974.233] (II) NV(0): 800x600@72Hz
[   974.233] (II) NV(0): 800x600@75Hz
[   974.233] (II) NV(0): 832x624@75Hz
[   974.233] (II) NV(0): 1024x768@60Hz
[   974.233] (II) NV(0): 1024x768@70Hz
[   974.233] (II) NV(0): 1024x768@75Hz
[   974.233] (II) NV(0): 1280x1024@75Hz
[   974.233] (II) NV(0): 1152x864@75Hz
[   974.233] (II) NV(0): Manufacturer's mask: 0
[   974.233] (II) NV(0): Supported standard timings:
[   974.233] (II) NV(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[   974.233] (II) NV(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 328=
97
[   974.233] (II) NV(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[   974.233] (II) NV(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[   974.233] (II) NV(0): Supported detailed timing:
[   974.233] (II) NV(0): clock: 119.0 MHz   Image Size:  494 x 320 mm
[   974.233] (II) NV(0): h_active: 1680  h_sync: 1728  h_sync_end 1760
h_blank_end 1840 h_border: 0
[   974.233] (II) NV(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1080 v_border: 0
[   974.233] (II) NV(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H
max: 81 kHz, PixClock max 145 MHz
[   974.233] (II) NV(0): Monitor name: SyncMaster
[   974.233] (II) NV(0): Serial No: HQAQ802723
[   974.233] (II) NV(0): EDID (in hex):
[   974.233] (II) NV(0):        00ffffffffffff004c2d750332324550
[   974.233] (II) NV(0):        211201030e3120782a9345a3554a9827
[   974.233] (II) NV(0):        155054bfef80b30081808140714f0101
[   974.233] (II) NV(0):        0101010101017c2e90a0601a1e403020
[   974.233] (II) NV(0):        3600ee401100001a000000fd00384b1e
[   974.233] (II) NV(0):        510e000a202020202020000000fc0053
[   974.233] (II) NV(0):        796e634d61737465720a2020000000ff
[   974.233] (II) NV(0):        00485141513830323732330a20200096
[   974.233] (--) NV(0): Trying load detection on VGA1 ... found one!
[   974.245] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.245] (II) NV(0): Using hsync ranges from config file
[   974.245] (II) NV(0): Using vrefresh ranges from config file
[   974.245] (II) NV(0): Printing DDC gathered Modelines:
[   974.245] (II) NV(0): Modeline "1680x1050"x0.0  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   974.245] (II) NV(0): Modeline "800x600"x0.0   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   974.245] (II) NV(0): Modeline "800x600"x0.0   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   974.245] (II) NV(0): Modeline "640x480"x0.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   974.245] (II) NV(0): Modeline "640x480"x0.0   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   974.245] (II) NV(0): Modeline "640x480"x0.0   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   974.245] (II) NV(0): Modeline "640x480"x0.0   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   974.245] (II) NV(0): Modeline "720x400"x0.0   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   974.245] (II) NV(0): Modeline "1280x1024"x0.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   974.245] (II) NV(0): Modeline "1024x768"x0.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   974.245] (II) NV(0): Modeline "1024x768"x0.0   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   974.245] (II) NV(0): Modeline "1024x768"x0.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   974.245] (II) NV(0): Modeline "832x624"x0.0   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   974.245] (II) NV(0): Modeline "800x600"x0.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   974.245] (II) NV(0): Modeline "800x600"x0.0   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   974.245] (II) NV(0): Modeline "1152x864"x0.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   974.245] (II) NV(0): Modeline "1680x1050"x0.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   974.245] (II) NV(0): Modeline "1280x1024"x0.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   974.245] (II) NV(0): Modeline "1280x960"x0.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   974.245] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.245] (II) NV(0): Probing for EDID on I2C bus 1...
[   974.248] (II) NV(0):   ... none found
[   974.248] (--) NV(0): Trying load detection on VGA2 ... nothing.
[   974.265] (II) NV(0): Probing for EDID on I2C bus 3...
[   974.268] (II) NV(0):   ... none found
[   974.268] (II) NV(0): Probing for EDID on I2C bus 0...
[   974.316] (--) NV(0): DDC detected a CRT:
[   974.316] (II) NV(0): Manufacturer: SAM  Model: 375  Serial#: 1346712114
[   974.316] (II) NV(0): Year: 2008  Week: 33
[   974.316] (II) NV(0): EDID Version: 1.3
[   974.316] (II) NV(0): Analog Display Input,  Input Voltage Level:
0.700/0.300 V
[   974.316] (II) NV(0): Sync:  Separate  Composite  SyncOnGreen
[   974.316] (II) NV(0): Max Image Size [cm]: horiz.: 49  vert.: 32
[   974.316] (II) NV(0): Gamma: 2.20
[   974.316] (II) NV(0): DPMS capabilities: Off; RGB/Color Display
[   974.316] (II) NV(0): First detailed timing is preferred mode
[   974.316] (II) NV(0): redX: 0.639 redY: 0.333   greenX: 0.289 greenY: 0.=
597
[   974.316] (II) NV(0): blueX: 0.153 blueY: 0.082   whiteX: 0.313 whiteY: =
0.329
[   974.316] (II) NV(0): Supported established timings:
[   974.316] (II) NV(0): 720x400@70Hz
[   974.317] (II) NV(0): 640x480@60Hz
[   974.317] (II) NV(0): 640x480@67Hz
[   974.317] (II) NV(0): 640x480@72Hz
[   974.317] (II) NV(0): 640x480@75Hz
[   974.317] (II) NV(0): 800x600@56Hz
[   974.317] (II) NV(0): 800x600@60Hz
[   974.317] (II) NV(0): 800x600@72Hz
[   974.317] (II) NV(0): 800x600@75Hz
[   974.317] (II) NV(0): 832x624@75Hz
[   974.317] (II) NV(0): 1024x768@60Hz
[   974.317] (II) NV(0): 1024x768@70Hz
[   974.317] (II) NV(0): 1024x768@75Hz
[   974.317] (II) NV(0): 1280x1024@75Hz
[   974.317] (II) NV(0): 1152x864@75Hz
[   974.317] (II) NV(0): Manufacturer's mask: 0
[   974.317] (II) NV(0): Supported standard timings:
[   974.317] (II) NV(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[   974.317] (II) NV(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 328=
97
[   974.317] (II) NV(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[   974.317] (II) NV(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[   974.317] (II) NV(0): Supported detailed timing:
[   974.317] (II) NV(0): clock: 119.0 MHz   Image Size:  494 x 320 mm
[   974.317] (II) NV(0): h_active: 1680  h_sync: 1728  h_sync_end 1760
h_blank_end 1840 h_border: 0
[   974.317] (II) NV(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1080 v_border: 0
[   974.317] (II) NV(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H
max: 81 kHz, PixClock max 145 MHz
[   974.317] (II) NV(0): Monitor name: SyncMaster
[   974.317] (II) NV(0): Serial No: HQAQ802723
[   974.317] (II) NV(0): EDID (in hex):
[   974.317] (II) NV(0):        00ffffffffffff004c2d750332324550
[   974.317] (II) NV(0):        211201030e3120782a9345a3554a9827
[   974.317] (II) NV(0):        155054bfef80b30081808140714f0101
[   974.317] (II) NV(0):        0101010101017c2e90a0601a1e403020
[   974.317] (II) NV(0):        3600ee401100001a000000fd00384b1e
[   974.317] (II) NV(0):        510e000a202020202020000000fc0053
[   974.317] (II) NV(0):        796e634d61737465720a2020000000ff
[   974.317] (II) NV(0):        00485141513830323732330a20200096
[   974.317] (--) NV(0): Trying load detection on VGA1 ... found one!
[   974.328] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.329] (II) NV(0): Using hsync ranges from config file
[   974.329] (II) NV(0): Using vrefresh ranges from config file
[   974.329] (II) NV(0): Printing DDC gathered Modelines:
[   974.329] (II) NV(0): Modeline "1680x1050"x0.0  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   974.329] (II) NV(0): Modeline "800x600"x0.0   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   974.329] (II) NV(0): Modeline "800x600"x0.0   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   974.329] (II) NV(0): Modeline "640x480"x0.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   974.329] (II) NV(0): Modeline "640x480"x0.0   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   974.329] (II) NV(0): Modeline "640x480"x0.0   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   974.329] (II) NV(0): Modeline "640x480"x0.0   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   974.329] (II) NV(0): Modeline "720x400"x0.0   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   974.329] (II) NV(0): Modeline "1280x1024"x0.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   974.329] (II) NV(0): Modeline "1024x768"x0.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   974.329] (II) NV(0): Modeline "1024x768"x0.0   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   974.329] (II) NV(0): Modeline "1024x768"x0.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   974.329] (II) NV(0): Modeline "832x624"x0.0   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   974.329] (II) NV(0): Modeline "800x600"x0.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   974.329] (II) NV(0): Modeline "800x600"x0.0   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   974.329] (II) NV(0): Modeline "1152x864"x0.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   974.329] (II) NV(0): Modeline "1680x1050"x0.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   974.329] (II) NV(0): Modeline "1280x1024"x0.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   974.329] (II) NV(0): Modeline "1280x960"x0.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   974.329] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.329] (II) NV(0): Probing for EDID on I2C bus 1...
[   974.332] (II) NV(0):   ... none found
[   974.332] (--) NV(0): Trying load detection on VGA2 ... nothing.
[   974.348] (II) NV(0): Probing for EDID on I2C bus 3...
[   974.352] (II) NV(0):   ... none found
[   974.386] (II) NV(0): Probing for EDID on I2C bus 0...
[   974.434] (--) NV(0): DDC detected a CRT:
[   974.434] (II) NV(0): Manufacturer: SAM  Model: 375  Serial#: 1346712114
[   974.434] (II) NV(0): Year: 2008  Week: 33
[   974.434] (II) NV(0): EDID Version: 1.3
[   974.434] (II) NV(0): Analog Display Input,  Input Voltage Level:
0.700/0.300 V
[   974.434] (II) NV(0): Sync:  Separate  Composite  SyncOnGreen
[   974.434] (II) NV(0): Max Image Size [cm]: horiz.: 49  vert.: 32
[   974.434] (II) NV(0): Gamma: 2.20
[   974.434] (II) NV(0): DPMS capabilities: Off; RGB/Color Display
[   974.434] (II) NV(0): First detailed timing is preferred mode
[   974.434] (II) NV(0): redX: 0.639 redY: 0.333   greenX: 0.289 greenY: 0.=
597
[   974.434] (II) NV(0): blueX: 0.153 blueY: 0.082   whiteX: 0.313 whiteY: =
0.329
[   974.434] (II) NV(0): Supported established timings:
[   974.434] (II) NV(0): 720x400@70Hz
[   974.434] (II) NV(0): 640x480@60Hz
[   974.434] (II) NV(0): 640x480@67Hz
[   974.434] (II) NV(0): 640x480@72Hz
[   974.434] (II) NV(0): 640x480@75Hz
[   974.434] (II) NV(0): 800x600@56Hz
[   974.434] (II) NV(0): 800x600@60Hz
[   974.434] (II) NV(0): 800x600@72Hz
[   974.434] (II) NV(0): 800x600@75Hz
[   974.434] (II) NV(0): 832x624@75Hz
[   974.434] (II) NV(0): 1024x768@60Hz
[   974.434] (II) NV(0): 1024x768@70Hz
[   974.434] (II) NV(0): 1024x768@75Hz
[   974.434] (II) NV(0): 1280x1024@75Hz
[   974.434] (II) NV(0): 1152x864@75Hz
[   974.434] (II) NV(0): Manufacturer's mask: 0
[   974.434] (II) NV(0): Supported standard timings:
[   974.434] (II) NV(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid: 179
[   974.434] (II) NV(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid: 328=
97
[   974.434] (II) NV(0): #2: hsize: 1280  vsize 960  refresh: 60  vid: 16513
[   974.434] (II) NV(0): #3: hsize: 1152  vsize 864  refresh: 75  vid: 20337
[   974.434] (II) NV(0): Supported detailed timing:
[   974.434] (II) NV(0): clock: 119.0 MHz   Image Size:  494 x 320 mm
[   974.434] (II) NV(0): h_active: 1680  h_sync: 1728  h_sync_end 1760
h_blank_end 1840 h_border: 0
[   974.434] (II) NV(0): v_active: 1050  v_sync: 1053  v_sync_end 1059
v_blanking: 1080 v_border: 0
[   974.434] (II) NV(0): Ranges: V min: 56 V max: 75 Hz, H min: 30 H
max: 81 kHz, PixClock max 145 MHz
[   974.434] (II) NV(0): Monitor name: SyncMaster
[   974.434] (II) NV(0): Serial No: HQAQ802723
[   974.434] (II) NV(0): EDID (in hex):
[   974.434] (II) NV(0):        00ffffffffffff004c2d750332324550
[   974.434] (II) NV(0):        211201030e3120782a9345a3554a9827
[   974.434] (II) NV(0):        155054bfef80b30081808140714f0101
[   974.434] (II) NV(0):        0101010101017c2e90a0601a1e403020
[   974.434] (II) NV(0):        3600ee401100001a000000fd00384b1e
[   974.434] (II) NV(0):        510e000a202020202020000000fc0053
[   974.434] (II) NV(0):        796e634d61737465720a2020000000ff
[   974.434] (II) NV(0):        00485141513830323732330a20200096
[   974.434] (--) NV(0): Trying load detection on VGA1 ... found one!
[   974.446] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.446] (II) NV(0): Using hsync ranges from config file
[   974.446] (II) NV(0): Using vrefresh ranges from config file
[   974.446] (II) NV(0): Printing DDC gathered Modelines:
[   974.446] (II) NV(0): Modeline "1680x1050"x0.0  119.00  1680 1728
1760 1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz)
[   974.446] (II) NV(0): Modeline "800x600"x0.0   40.00  800 840 968
1056  600 601 605 628 +hsync +vsync (37.9 kHz)
[   974.446] (II) NV(0): Modeline "800x600"x0.0   36.00  800 824 896
1024  600 601 603 625 +hsync +vsync (35.2 kHz)
[   974.446] (II) NV(0): Modeline "640x480"x0.0   31.50  640 656 720
840  480 481 484 500 -hsync -vsync (37.5 kHz)
[   974.446] (II) NV(0): Modeline "640x480"x0.0   31.50  640 664 704
832  480 489 492 520 -hsync -vsync (37.9 kHz)
[   974.446] (II) NV(0): Modeline "640x480"x0.0   30.24  640 704 768
864  480 483 486 525 -hsync -vsync (35.0 kHz)
[   974.446] (II) NV(0): Modeline "640x480"x0.0   25.18  640 656 752
800  480 490 492 525 -hsync -vsync (31.5 kHz)
[   974.446] (II) NV(0): Modeline "720x400"x0.0   28.32  720 738 846
900  400 412 414 449 -hsync +vsync (31.5 kHz)
[   974.446] (II) NV(0): Modeline "1280x1024"x0.0  135.00  1280 1296
1440 1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz)
[   974.446] (II) NV(0): Modeline "1024x768"x0.0   78.75  1024 1040
1136 1312  768 769 772 800 +hsync +vsync (60.0 kHz)
[   974.446] (II) NV(0): Modeline "1024x768"x0.0   75.00  1024 1048
1184 1328  768 771 777 806 -hsync -vsync (56.5 kHz)
[   974.446] (II) NV(0): Modeline "1024x768"x0.0   65.00  1024 1048
1184 1344  768 771 777 806 -hsync -vsync (48.4 kHz)
[   974.446] (II) NV(0): Modeline "832x624"x0.0   57.28  832 864 928
1152  624 625 628 667 -hsync -vsync (49.7 kHz)
[   974.446] (II) NV(0): Modeline "800x600"x0.0   49.50  800 816 896
1056  600 601 604 625 +hsync +vsync (46.9 kHz)
[   974.446] (II) NV(0): Modeline "800x600"x0.0   50.00  800 856 976
1040  600 637 643 666 +hsync +vsync (48.1 kHz)
[   974.446] (II) NV(0): Modeline "1152x864"x0.0  108.00  1152 1216
1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[   974.446] (II) NV(0): Modeline "1680x1050"x0.0  146.25  1680 1784
1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
[   974.446] (II) NV(0): Modeline "1280x1024"x0.0  108.00  1280 1328
1440 1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz)
[   974.446] (II) NV(0): Modeline "1280x960"x0.0  108.00  1280 1376
1488 1800  960 961 964 1000 +hsync +vsync (60.0 kHz)
[   974.446] (II) NV(0): EDID vendor "SAM", prod id 885
[   974.446] (II) NV(0): Probing for EDID on I2C bus 1...
[   974.449] (II) NV(0):   ... none found
[   974.450] (--) NV(0): Trying load detection on VGA2 ... nothing.
[   974.466] (II) NV(0): Probing for EDID on I2C bus 3...
[   974.469] (II) NV(0):   ... none found

at last, my kernel log (when booting WITHOUT nomodeset):

Jan 11 02:14:38 chesx syslogd 1.5.0: restart.
( # text Removed for fitting in the list # )
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: Local APIC address 0xfee=
00000
Jan 11 02:14:38 chesx kernel: [    0.000000] 1155MB HIGHMEM available.
Jan 11 02:14:38 chesx kernel: [    0.000000] 891MB LOWMEM available.
Jan 11 02:14:38 chesx kernel: [    0.000000]   mapped low ram: 0 - 37bfe000
Jan 11 02:14:38 chesx kernel: [    0.000000]   low ram: 0 - 37bfe000
Jan 11 02:14:38 chesx kernel: [    0.000000] Zone PFN ranges:
Jan 11 02:14:38 chesx kernel: [    0.000000]   DMA      0x00000010 -> 0x000=
01000
Jan 11 02:14:38 chesx kernel: [    0.000000]   Normal   0x00001000 -> 0x000=
37bfe
Jan 11 02:14:38 chesx kernel: [    0.000000]   HighMem  0x00037bfe -> 0x000=
7ff70
Jan 11 02:14:38 chesx kernel: [    0.000000] Movable zone start PFN
for each node
Jan 11 02:14:38 chesx kernel: [    0.000000] early_node_map[2] active PFN r=
anges
Jan 11 02:14:38 chesx kernel: [    0.000000]     0: 0x00000010 -> 0x0000009f
Jan 11 02:14:38 chesx kernel: [    0.000000]     0: 0x00000100 -> 0x0007ff70
Jan 11 02:14:38 chesx kernel: [    0.000000] On node 0 totalpages: 524031
Jan 11 02:14:38 chesx kernel: [    0.000000] free_area_init_node: node
0, pgdat c06c9040, node_mem_map c157e200
Jan 11 02:14:38 chesx kernel: [    0.000000]   DMA zone: 32 pages used
for memmap
Jan 11 02:14:38 chesx kernel: [    0.000000]   DMA zone: 0 pages reserved
Jan 11 02:14:38 chesx kernel: [    0.000000]   DMA zone: 3951 pages,
LIFO batch:0
Jan 11 02:14:38 chesx kernel: [    0.000000]   Normal zone: 1752 pages
used for memmap
Jan 11 02:14:38 chesx kernel: [    0.000000]   Normal zone: 222502
pages, LIFO batch:31
Jan 11 02:14:38 chesx kernel: [    0.000000]   HighMem zone: 2311
pages used for memmap
Jan 11 02:14:38 chesx kernel: [    0.000000]   HighMem zone: 293483
pages, LIFO batch:31
Jan 11 02:14:38 chesx kernel: [    0.000000] Using APIC driver default
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: PM-Timer IO Port: 0x808
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: Local APIC address 0xfee=
00000
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: LAPIC
(acpi_id[0x01] lapic_id[0x00] enabled)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: LAPIC
(acpi_id[0x02] lapic_id[0x01] enabled)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: LAPIC
(acpi_id[0x03] lapic_id[0x02] enabled)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: LAPIC
(acpi_id[0x04] lapic_id[0x03] enabled)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: IOAPIC (id[0x04]
address[0xfec00000] gsi_base[0])
Jan 11 02:14:38 chesx kernel: [    0.000000] IOAPIC[0]: apic_id 4,
version 32, address 0xfec00000, GSI 0-23
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0
bus_irq 0 global_irq 2 dfl dfl)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: INT_SRC_OVR (bus 0
bus_irq 9 global_irq 9 high level)
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: IRQ0 used by override.
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: IRQ2 used by override.
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: IRQ9 used by override.
Jan 11 02:14:38 chesx kernel: [    0.000000] Using ACPI (MADT) for SMP
configuration information
Jan 11 02:14:38 chesx kernel: [    0.000000] ACPI: HPET id: 0x8086a202
base: 0xfed00000
Jan 11 02:14:38 chesx kernel: [    0.000000] SMP: Allowing 4 CPUs, 0
hotplug CPUs
Jan 11 02:14:38 chesx kernel: [    0.000000] nr_irqs_gsi: 40
Jan 11 02:14:38 chesx kernel: [    0.000000] early_res array is
doubled to 64 at [16000 - 167ff]
Jan 11 02:14:38 chesx kernel: [    0.000000] PM: Registered nosave
memory: 000000000009f000 - 00000000000a0000
Jan 11 02:14:38 chesx kernel: [    0.000000] PM: Registered nosave
memory: 00000000000a0000 - 00000000000e4000
Jan 11 02:14:38 chesx kernel: [    0.000000] PM: Registered nosave
memory: 00000000000e4000 - 0000000000100000
Jan 11 02:14:38 chesx kernel: [    0.000000] Allocating PCI resources
starting at 80000000 (gap: 80000000:7ee00000)
Jan 11 02:14:38 chesx kernel: [    0.000000] Booting paravirtualized
kernel on bare hardware
Jan 11 02:14:38 chesx kernel: [    0.000000] setup_percpu: NR_CPUS:8
nr_cpumask_bits:8 nr_cpu_ids:4 nr_node_ids:1
Jan 11 02:14:38 chesx kernel: [    0.000000] PERCPU: Embedded 14
pages/cpu @c2600000 s35520 r0 d21824 u524288
Jan 11 02:14:38 chesx kernel: [    0.000000] pcpu-alloc: s35520 r0
d21824 u524288 alloc=3D1*2097152
Jan 11 02:14:38 chesx kernel: [    0.000000] pcpu-alloc: [0] 0 1 2 3
Jan 11 02:14:38 chesx kernel: [    0.000000] Built 1 zonelists in Zone
order, mobility grouping on.  Total pages: 519936
Jan 11 02:14:38 chesx kernel: [    0.000000] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-2.6.35.7 root=3D/dev/sda2 ro selinux=3D0 quiet
splash -
Jan 11 02:14:38 chesx kernel: [    0.000000] PID hash table entries:
4096 (order: 2, 16384 bytes)
Jan 11 02:14:38 chesx kernel: [    0.000000] Dentry cache hash table
entries: 131072 (order: 7, 524288 bytes)
Jan 11 02:14:38 chesx kernel: [    0.000000] Inode-cache hash table
entries: 65536 (order: 6, 262144 bytes)
Jan 11 02:14:38 chesx kernel: [    0.000000] Enabling fast FPU save
and restore... done.
Jan 11 02:14:38 chesx kernel: [    0.000000] Enabling unmasked SIMD
FPU exception support... done.
Jan 11 02:14:38 chesx kernel: [    0.000000] Initializing CPU#0
Jan 11 02:14:38 chesx kernel: [    0.000000] allocated 10482560 bytes
of page_cgroup
Jan 11 02:14:38 chesx kernel: [    0.000000] please try
'cgroup_disable=3Dmemory' option if you don't want memory cgroups
Jan 11 02:14:38 chesx kernel: [    0.000000] Subtract (50 early reservation=
s)
Jan 11 02:14:38 chesx kernel: [    0.000000]   #1 [0000001000 -
( # text Removed for fitting in the list # )
000280e000]         BOOTMEM
Jan 11 02:14:38 chesx kernel: [    0.000000]   #48 [000258da40 -
00025cda40]         BOOTMEM
Jan 11 02:14:38 chesx kernel: [    0.000000]   #49 [000280e000 -
000320d380]         BOOTMEM
Jan 11 02:14:38 chesx kernel: [    0.000000] Initializing HighMem for
node 0 (00037bfe:0007ff70)
Jan 11 02:14:38 chesx kernel: [    0.000000] Memory: 2047440k/2096576k
available (3796k kernel code, 48684k reserved, 2163k data, 652k init,
1183176k highmem)
Jan 11 02:14:38 chesx kernel: [    0.000000] virtual kernel memory layout:
Jan 11 02:14:38 chesx kernel: [    0.000000]     fixmap  : 0xfff15000
- 0xfffff000   ( 936 kB)
Jan 11 02:14:38 chesx kernel: [    0.000000]     pkmap   : 0xffc00000
- 0xffe00000   (2048 kB)
Jan 11 02:14:38 chesx kernel: [    0.000000]     vmalloc : 0xf83fe000
- 0xffbfe000   ( 120 MB)
Jan 11 02:14:38 chesx kernel: [    0.000000]     lowmem  : 0xc0000000
- 0xf7bfe000   ( 891 MB)
Jan 11 02:14:38 chesx kernel: [    0.000000]       .init : 0xc06d3000
- 0xc0776000   ( 652 kB)
Jan 11 02:14:38 chesx kernel: [    0.000000]       .data : 0xc04b5382
- 0xc06d21bc   (2163 kB)
Jan 11 02:14:38 chesx kernel: [    0.000000]       .text : 0xc0100000
- 0xc04b5382   (3796 kB)
Jan 11 02:14:38 chesx kernel: [    0.000000] Checking if this
processor honours the WP bit even in supervisor mode...Ok.
Jan 11 02:14:38 chesx kernel: [    0.000000] SLUB: Genslabs=3D13,
HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, Nodes=3D1
Jan 11 02:14:38 chesx kernel: [    0.000000] Hierarchical RCU implementatio=
n.
Jan 11 02:14:38 chesx kernel: [    0.000000] ^IRCU-based detection of
stalled CPUs is disabled.
Jan 11 02:14:38 chesx kernel: [    0.000000] ^IVerbose stalled-CPUs
detection is disabled.
Jan 11 02:14:38 chesx kernel: [    0.000000] NR_IRQS:2304 nr_irqs:712
Jan 11 02:14:38 chesx kernel: [    0.000000] Console: colour VGA+ 80x25
Jan 11 02:14:38 chesx kernel: [    0.000000] console [tty0] enabled
Jan 11 02:14:38 chesx kernel: [    0.000000] hpet clockevent registered
Jan 11 02:14:38 chesx kernel: [    0.000000] Fast TSC calibration using PIT
Jan 11 02:14:38 chesx kernel: [    0.000000] Detected 2399.845 MHz processo=
r.
Jan 11 02:14:38 chesx kernel: [    0.004004] Calibrating delay loop
(skipped), value calculated using timer frequency.. 4799.69 BogoMIPS
(lpj=3D9599380)
Jan 11 02:14:38 chesx kernel: [    0.004009] pid_max: default: 32768
minimum: 301
Jan 11 02:14:38 chesx kernel: [    0.004027] Security Framework initialized
Jan 11 02:14:38 chesx kernel: [    0.004031] SELinux:  Disabled at boot.
Jan 11 02:14:38 chesx kernel: [    0.004039] Mount-cache hash table entries=
: 512
Jan 11 02:14:38 chesx kernel: [    0.004151] Initializing cgroup subsys ns
Jan 11 02:14:38 chesx kernel: [    0.004154] Initializing cgroup subsys cpu=
acct
Jan 11 02:14:38 chesx kernel: [    0.004159] Initializing cgroup subsys mem=
ory
Jan 11 02:14:38 chesx kernel: [    0.004167] Initializing cgroup subsys dev=
ices
Jan 11 02:14:38 chesx kernel: [    0.004169] Initializing cgroup subsys fre=
ezer
Jan 11 02:14:38 chesx kernel: [    0.004171] Initializing cgroup subsys net=
_cls
Jan 11 02:14:38 chesx kernel: [    0.004190] CPU: Physical Processor ID: 0
Jan 11 02:14:38 chesx kernel: [    0.004192] CPU: Processor Core ID: 0
Jan 11 02:14:38 chesx kernel: [    0.004194] mce: CPU supports 6 MCE banks
Jan 11 02:14:38 chesx kernel: [    0.004201] CPU0: Thermal monitoring
enabled (TM2)
Jan 11 02:14:38 chesx kernel: [    0.004204] using mwait in idle threads.
Jan 11 02:14:38 chesx kernel: [    0.004210] Performance Events: PEBS
fmt0+, Core2 events, Intel PMU driver.
Jan 11 02:14:38 chesx kernel: [    0.004215] PEBS disabled due to CPU errat=
a.
Jan 11 02:14:38 chesx kernel: [    0.004218] ... version:                2
Jan 11 02:14:38 chesx kernel: [    0.004220] ... bit width:              40
Jan 11 02:14:38 chesx kernel: [    0.004221] ... generic registers:      2
Jan 11 02:14:38 chesx kernel: [    0.004223] ... value mask:
 000000ffffffffff
Jan 11 02:14:38 chesx kernel: [    0.004225] ... max period:
 000000007fffffff
Jan 11 02:14:38 chesx kernel: [    0.004226] ... fixed-purpose events:   3
Jan 11 02:14:38 chesx kernel: [    0.004228] ... event mask:
 0000000700000003
Jan 11 02:14:38 chesx kernel: [    0.008355] ACPI: Core revision 20100428
Jan 11 02:14:38 chesx kernel: [    0.016008] ftrace: converting mcount
calls to 0f 1f 44 00 00
Jan 11 02:14:38 chesx kernel: [    0.016012] ftrace: allocating 21738
entries in 43 pages
Jan 11 02:14:38 chesx kernel: [    0.020038] Enabling APIC mode:
Flat.  Using 1 I/O APICs
Jan 11 02:14:38 chesx kernel: [    0.020341] ..TIMER: vector=3D0x30
apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
Jan 11 02:14:38 chesx kernel: [    0.062198] CPU0: Intel(R) Core(TM)2
Quad CPU    Q6600  @ 2.40GHz stepping 0b
Jan 11 02:14:38 chesx kernel: [    0.064000] Booting Node   0, Processors  =
#1
Jan 11 02:14:38 chesx kernel: [    0.008000] Initializing CPU#1
Jan 11 02:14:38 chesx kernel: [    0.152069]  #2
Jan 11 02:14:38 chesx kernel: [    0.008000] Initializing CPU#2
Jan 11 02:14:38 chesx kernel: [    0.244063]  #3 Ok.
Jan 11 02:14:38 chesx kernel: [    0.008000] Initializing CPU#3
Jan 11 02:14:38 chesx kernel: [    0.336008] Brought up 4 CPUs
Jan 11 02:14:38 chesx kernel: [    0.336010] Total of 4 processors
activated (19199.52 BogoMIPS).
Jan 11 02:14:38 chesx kernel: [    0.337693] devtmpfs: initialized
Jan 11 02:14:38 chesx kernel: [    0.337693] regulator: core version 0.5
Jan 11 02:14:38 chesx kernel: [    0.337693] Time:  2:14:32  Date: 01/11/11
Jan 11 02:14:38 chesx kernel: [    0.337693] NET: Registered protocol famil=
y 16
Jan 11 02:14:38 chesx kernel: [    0.337693] EISA bus registered
Jan 11 02:14:38 chesx kernel: [    0.337693] ACPI: bus type pci registered
Jan 11 02:14:38 chesx kernel: [    0.337693] PCI: MMCONFIG for domain
0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Jan 11 02:14:38 chesx kernel: [    0.337693] PCI: not using MMCONFIG
Jan 11 02:14:38 chesx kernel: [    0.337693] PCI: PCI BIOS revision
3.00 entry at 0xf0031, last bus=3D5
Jan 11 02:14:38 chesx kernel: [    0.337693] PCI: Using configuration
type 1 for base access
Jan 11 02:14:38 chesx kernel: [    0.337693] bio: create slab <bio-0> at 0
Jan 11 02:14:38 chesx kernel: [    0.341092] ACPI: EC: Look up EC in DSDT
Jan 11 02:14:38 chesx kernel: [    0.342632] ACPI: Executed 1 blocks
of module-level executable AML code
Jan 11 02:14:38 chesx kernel: [    0.349868] ACPI: SSDT 7ff7e0a0 001C6
(v01    AMI   CPU1PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.350269] ACPI: Dynamic OEM Table Load:
Jan 11 02:14:38 chesx kernel: [    0.350272] ACPI: SSDT (null) 001C6
(v01    AMI   CPU1PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.350560] ACPI: SSDT 7ff7e270 0013A
(v01    AMI   CPU2PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.350955] ACPI: Dynamic OEM Table Load:
Jan 11 02:14:38 chesx kernel: [    0.350958] ACPI: SSDT (null) 0013A
(v01    AMI   CPU2PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.351244] ACPI: SSDT 7ff7e3b0 0013A
(v01    AMI   CPU3PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.351640] ACPI: Dynamic OEM Table Load:
Jan 11 02:14:38 chesx kernel: [    0.351643] ACPI: SSDT (null) 0013A
(v01    AMI   CPU3PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.351928] ACPI: SSDT 7ff7e4f0 0013A
(v01    AMI   CPU4PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.352337] ACPI: Dynamic OEM Table Load:
Jan 11 02:14:38 chesx kernel: [    0.352340] ACPI: SSDT (null) 0013A
(v01    AMI   CPU4PM 00000001 INTL 20060113)
Jan 11 02:14:38 chesx kernel: [    0.352406] ACPI: Interpreter enabled
Jan 11 02:14:38 chesx kernel: [    0.352410] ACPI: (supports S0 S1 S4 S5)
Jan 11 02:14:38 chesx kernel: [    0.352430] ACPI: Using IOAPIC for
interrupt routing
Jan 11 02:14:38 chesx kernel: [    0.352473] PCI: MMCONFIG for domain
0000 [bus 00-ff] at [mem 0xe0000000-0xefffffff] (base 0xe0000000)
Jan 11 02:14:38 chesx kernel: [    0.353457] PCI: MMCONFIG at [mem
0xe0000000-0xefffffff] reserved in ACPI motherboard resources
Jan 11 02:14:38 chesx kernel: [    0.353460] PCI: Using MMCONFIG for
extended config space
Jan 11 02:14:38 chesx kernel: [    0.361593] ACPI: No dock devices found.
Jan 11 02:14:38 chesx kernel: [    0.361597] PCI: Ignoring host bridge
windows from ACPI; if necessary, use "pci=3Duse_crs" and report a bug
Jan 11 02:14:38 chesx kernel: [    0.361699] ACPI: PCI Root Bridge
[PCI0] (domain 0000 [bus 00-ff])
Jan 11 02:14:38 chesx kernel: [    0.361899] pci_root PNP0A08:00: host
bridge window [io  0x0000-0x0cf7] (ignored)
( # text Removed for fitting in the list # )
[io  0xd880-0xd89f]
Jan 11 02:14:38 chesx kernel: [    0.362399] pci 0000:00:1d.2: reg 20:
[io  0xdc00-0xdc1f]
Jan 11 02:14:38 chesx kernel: [    0.362442] pci 0000:00:1d.3: reg 20:
[io  0xe000-0xe01f]
Jan 11 02:14:38 chesx kernel: [    0.362484] pci 0000:00:1d.7: reg 10:
[mem 0xfebfbc00-0xfebfbfff]
Jan 11 02:14:38 chesx kernel: [    0.362531] pci 0000:00:1d.7: PME#
supported from D0 D3hot D3cold
Jan 11 02:14:38 chesx kernel: [    0.362535] pci 0000:00:1d.7: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.362638] pci 0000:00:1f.0: quirk:
[io  0x0800-0x087f] claimed by ICH6 ACPI/GPIO/TCO
Jan 11 02:14:38 chesx kernel: [    0.362642] pci 0000:00:1f.0: quirk:
[io  0x0480-0x04bf] claimed by ICH6 GPIO
Jan 11 02:14:38 chesx kernel: [    0.362645] pci 0000:00:1f.0: ICH7
LPC Generic IO decode 1 PIO at 0294 (mask 0003)
Jan 11 02:14:38 chesx kernel: [    0.362650] pci 0000:00:1f.0: ICH7
LPC Generic IO decode 3 PIO at 4700 (mask 00ff)
Jan 11 02:14:38 chesx kernel: [    0.362691] pci 0000:00:1f.2: reg 10:
[io  0xec00-0xec07]
Jan 11 02:14:38 chesx kernel: [    0.362697] pci 0000:00:1f.2: reg 14:
[io  0xe880-0xe883]
Jan 11 02:14:38 chesx kernel: [    0.362702] pci 0000:00:1f.2: reg 18:
[io  0xe800-0xe807]
Jan 11 02:14:38 chesx kernel: [    0.362707] pci 0000:00:1f.2: reg 1c:
[io  0xe480-0xe483]
Jan 11 02:14:38 chesx kernel: [    0.362713] pci 0000:00:1f.2: reg 20:
[io  0xe400-0xe40f]
Jan 11 02:14:38 chesx kernel: [    0.362718] pci 0000:00:1f.2: reg 24:
[io  0xe080-0xe08f]
Jan 11 02:14:38 chesx kernel: [    0.362736] pci 0000:00:1f.2: PME#
supported from D3hot
Jan 11 02:14:38 chesx kernel: [    0.362740] pci 0000:00:1f.2: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.362756] pci 0000:00:1f.3: reg 10:
[mem 0x00000000-0x000000ff]
Jan 11 02:14:38 chesx kernel: [    0.362772] pci 0000:00:1f.3: reg 20:
[io  0x0400-0x041f]
Jan 11 02:14:38 chesx kernel: [    0.362804] pci 0000:00:1f.5: reg 10:
[io  0xd480-0xd487]
Jan 11 02:14:38 chesx kernel: [    0.362809] pci 0000:00:1f.5: reg 14:
[io  0xd400-0xd403]
Jan 11 02:14:38 chesx kernel: [    0.362814] pci 0000:00:1f.5: reg 18:
[io  0xd080-0xd087]
Jan 11 02:14:38 chesx kernel: [    0.362820] pci 0000:00:1f.5: reg 1c:
[io  0xd000-0xd003]
Jan 11 02:14:38 chesx kernel: [    0.362825] pci 0000:00:1f.5: reg 20:
[io  0xcc00-0xcc0f]
Jan 11 02:14:38 chesx kernel: [    0.362830] pci 0000:00:1f.5: reg 24:
[io  0xc880-0xc88f]
Jan 11 02:14:38 chesx kernel: [    0.362848] pci 0000:00:1f.5: PME#
supported from D3hot
Jan 11 02:14:38 chesx kernel: [    0.362852] pci 0000:00:1f.5: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.362903] pci 0000:01:00.0: reg 10:
[mem 0xfd000000-0xfdffffff]
Jan 11 02:14:38 chesx kernel: [    0.362914] pci 0000:01:00.0: reg 14:
[mem 0xc0000000-0xcfffffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.362926] pci 0000:01:00.0: reg 1c:
[mem 0xfa000000-0xfbffffff 64bit]
Jan 11 02:14:38 chesx kernel: [    0.362932] pci 0000:01:00.0: reg 24:
[io  0x8c00-0x8c7f]
Jan 11 02:14:38 chesx kernel: [    0.362939] pci 0000:01:00.0: reg 30:
[mem 0xfe7e0000-0xfe7fffff pref]
Jan 11 02:14:38 chesx kernel: [    0.362980] pci 0000:00:01.0: PCI
bridge to [bus 01-01]
Jan 11 02:14:38 chesx kernel: [    0.362984] pci 0000:00:01.0:
bridge window [io  0x8000-0x8fff]
Jan 11 02:14:38 chesx kernel: [    0.362987] pci 0000:00:01.0:
bridge window [mem 0xf8700000-0xfe7fffff]
Jan 11 02:14:38 chesx kernel: [    0.362991] pci 0000:00:01.0:
bridge window [mem 0xbfe00000-0xdfdfffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.363027] pci 0000:00:1c.0: PCI
bridge to [bus 04-04]
Jan 11 02:14:38 chesx kernel: [    0.363031] pci 0000:00:1c.0:
bridge window [io  0xf000-0x0000] (disabled)
Jan 11 02:14:38 chesx kernel: [    0.363035] pci 0000:00:1c.0:
bridge window [mem 0xfff00000-0x000fffff] (disabled)
Jan 11 02:14:38 chesx kernel: [    0.363041] pci 0000:00:1c.0:
bridge window [mem 0xdfe00000-0xdfefffff 64bit pref]
( # text Removed for fitting in the list # )
Jan 11 02:14:38 chesx kernel: [    0.363270] pci 0000:03:00.1: reg 20:
[io  0xa400-0xa40f]
Jan 11 02:14:38 chesx kernel: [    0.363327] pci 0000:00:1c.4: PCI
bridge to [bus 03-03]
Jan 11 02:14:38 chesx kernel: [    0.363331] pci 0000:00:1c.4:
bridge window [io  0xa000-0xafff]
Jan 11 02:14:38 chesx kernel: [    0.363335] pci 0000:00:1c.4:
bridge window [mem 0xfe900000-0xfe9fffff]
Jan 11 02:14:38 chesx kernel: [    0.363340] pci 0000:00:1c.4:
bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
Jan 11 02:14:38 chesx kernel: [    0.363412] pci 0000:02:00.0: reg 10:
[mem 0xfe8fc000-0xfe8fffff 64bit]
Jan 11 02:14:38 chesx kernel: [    0.363420] pci 0000:02:00.0: reg 18:
[io  0x9800-0x98ff]
Jan 11 02:14:38 chesx kernel: [    0.363445] pci 0000:02:00.0: reg 30:
[mem 0xfe8c0000-0xfe8dffff pref]
Jan 11 02:14:38 chesx kernel: [    0.363483] pci 0000:02:00.0: supports D1 =
D2
Jan 11 02:14:38 chesx kernel: [    0.363484] pci 0000:02:00.0: PME#
supported from D0 D1 D2 D3hot D3cold
Jan 11 02:14:38 chesx kernel: [    0.363489] pci 0000:02:00.0: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.363501] pci 0000:00:1c.5: PCI
bridge to [bus 02-02]
Jan 11 02:14:38 chesx kernel: [    0.363505] pci 0000:00:1c.5:
bridge window [io  0x9000-0x9fff]
Jan 11 02:14:38 chesx kernel: [    0.363509] pci 0000:00:1c.5:
bridge window [mem 0xfe800000-0xfe8fffff]
Jan 11 02:14:38 chesx kernel: [    0.363514] pci 0000:00:1c.5:
bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
Jan 11 02:14:38 chesx kernel: [    0.363559] pci 0000:05:03.0: reg 10:
[mem 0xfeaff800-0xfeafffff]
Jan 11 02:14:38 chesx kernel: [    0.363566] pci 0000:05:03.0: reg 14:
[mem 0xfeaf8000-0xfeafbfff]
Jan 11 02:14:38 chesx kernel: [    0.363606] pci 0000:05:03.0: supports D1 =
D2
Jan 11 02:14:38 chesx kernel: [    0.363608] pci 0000:05:03.0: PME#
supported from D0 D1 D2 D3hot
Jan 11 02:14:38 chesx kernel: [    0.363612] pci 0000:05:03.0: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.363644] pci 0000:05:04.0: reg 10:
[mem 0xfeaf4000-0xfeaf7fff]
Jan 11 02:14:38 chesx kernel: [    0.363650] pci 0000:05:04.0: reg 14:
[io  0xb800-0xb8ff]
Jan 11 02:14:38 chesx kernel: [    0.363674] pci 0000:05:04.0: reg 30:
[mem 0xfeac0000-0xfeadffff pref]
Jan 11 02:14:38 chesx kernel: [    0.363696] pci 0000:05:04.0: supports D1 =
D2
Jan 11 02:14:38 chesx kernel: [    0.363698] pci 0000:05:04.0: PME#
supported from D0 D1 D2 D3hot D3cold
Jan 11 02:14:38 chesx kernel: [    0.363702] pci 0000:05:04.0: PME# disabled
Jan 11 02:14:38 chesx kernel: [    0.363742] pci 0000:00:1e.0: PCI
bridge to [bus 05-05] (subtractive decode)
Jan 11 02:14:38 chesx kernel: [    0.363746] pci 0000:00:1e.0:
bridge window [io  0xb000-0xbfff]
Jan 11 02:14:38 chesx kernel: [    0.363749] pci 0000:00:1e.0:
bridge window [mem 0xfea00000-0xfeafffff]
Jan 11 02:14:38 chesx kernel: [    0.363755] pci 0000:00:1e.0:
bridge window [mem 0xfff00000-0x000fffff pref] (disabled)
Jan 11 02:14:38 chesx kernel: [    0.363757] pci 0000:00:1e.0:
bridge window [io  0x0000-0xffff] (subtractive decode)
Jan 11 02:14:38 chesx kernel: [    0.363760] pci 0000:00:1e.0:
bridge window [mem 0x00000000-0xffffffffffffffff] (subtractive decode)
Jan 11 02:14:38 chesx kernel: [    0.363779] pci_bus 0000:00: on NUMA node 0
Jan 11 02:14:38 chesx kernel: [    0.363783] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0._PRT]
Jan 11 02:14:38 chesx kernel: [    0.363944] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0.P0P2._PRT]
Jan 11 02:14:38 chesx kernel: [    0.364010] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0.P0P1._PRT]
Jan 11 02:14:38 chesx kernel: [    0.364141] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0.P0P4._PRT]
Jan 11 02:14:38 chesx kernel: [    0.364206] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0.P0P8._PRT]
Jan 11 02:14:38 chesx kernel: [    0.364282] ACPI: PCI Interrupt
Routing Table [\_SB_.PCI0.P0P9._PRT]
Jan 11 02:14:38 chesx kernel: [    0.368156] ACPI: PCI Interrupt Link
[LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
Jan 11 02:14:38 chesx kernel: [    0.368263] ACPI: PCI Interrupt Link
[LNKB] (IRQs 3 4 5 6 7 *10 11 12 14 15)
Jan 11 02:14:38 chesx kernel: [    0.368364] ACPI: PCI Interrupt Link
[LNKC] (IRQs 3 4 5 6 *7 10 11 12 14 15)
Jan 11 02:14:38 chesx kernel: [    0.368465] ACPI: PCI Interrupt Link
[LNKD] (IRQs 3 4 5 6 7 10 11 12 14 *15)
Jan 11 02:14:38 chesx kernel: [    0.368565] ACPI: PCI Interrupt Link
[LNKE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, disabled.
Jan 11 02:14:38 chesx kernel: [    0.368667] ACPI: PCI Interrupt Link
[LNKF] (IRQs 3 4 5 6 7 10 11 12 *14 15)
Jan 11 02:14:38 chesx kernel: [    0.368768] ACPI: PCI Interrupt Link
[LNKG] (IRQs 3 4 *5 6 7 10 11 12 14 15)
Jan 11 02:14:38 chesx kernel: [    0.368868] ACPI: PCI Interrupt Link
[LNKH] (IRQs *3 4 5 6 7 10 11 12 14 15)
Jan 11 02:14:38 chesx kernel: [    0.368967] vgaarb: device added:
PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone
Jan 11 02:14:38 chesx kernel: [    0.368972] vgaarb: loaded
Jan 11 02:14:38 chesx kernel: [    0.369057] SCSI subsystem initialized
Jan 11 02:14:38 chesx kernel: [    0.369065] libata version 3.00 loaded.
Jan 11 02:14:38 chesx kernel: [    0.369065] usbcore: registered new
interface driver usbfs
Jan 11 02:14:38 chesx kernel: [    0.369065] usbcore: registered new
interface driver hub
Jan 11 02:14:38 chesx kernel: [    0.369065] usbcore: registered new
device driver usb
Jan 11 02:14:38 chesx kernel: [    0.369065] ACPI: WMI: Mapper loaded
Jan 11 02:14:38 chesx kernel: [    0.369065] PCI: Using ACPI for IRQ routing
Jan 11 02:14:38 chesx kernel: [    0.369065] PCI: pci_cache_line_size
set to 64 bytes
Jan 11 02:14:38 chesx kernel: [    0.369065] reserve RAM buffer:
000000000009fc00 - 000000000009ffff
Jan 11 02:14:38 chesx kernel: [    0.369065] reserve RAM buffer:
000000007ff70000 - 000000007fffffff
Jan 11 02:14:38 chesx kernel: [    0.369065] NetLabel: Initializing
Jan 11 02:14:38 chesx kernel: [    0.369065] NetLabel:  domain hash size =
=3D 128
Jan 11 02:14:38 chesx kernel: [    0.369065] NetLabel:  protocols =3D
UNLABELED CIPSOv4
Jan 11 02:14:38 chesx kernel: [    0.369065] NetLabel:  unlabeled
traffic allowed by default
Jan 11 02:14:38 chesx kernel: [    0.369065] HPET: 3 timers in total,
0 timers will be used for per-cpu timer
Jan 11 02:14:38 chesx kernel: [    0.369065] hpet0: at MMIO
0xfed00000, IRQs 2, 8, 0
Jan 11 02:14:38 chesx kernel: [    0.369065] hpet0: 3 comparators,
64-bit 14.318180 MHz counter
Jan 11 02:14:38 chesx kernel: [    0.376025] Switching to clocksource tsc
Jan 11 02:14:38 chesx kernel: [    0.377902] pnp: PnP ACPI init
Jan 11 02:14:38 chesx kernel: [    0.377909] ACPI: bus type pnp registered
Jan 11 02:14:38 chesx kernel: [    0.379078] pnp 00:08: disabling [mem
0xfebfe000-0xfebfec00] because it overlaps 0000:00:1b.0 BAR 0 [mem
0xfebfc000-0xfebfffff 64bit]
Jan 11 02:14:38 chesx kernel: [    0.380740] pnp: PnP ACPI: found 15 devices
Jan 11 02:14:38 chesx kernel: [    0.380742] ACPI: ACPI bus type pnp
unregistered
Jan 11 02:14:38 chesx kernel: [    0.380746] PnPBIOS: Disabled by ACPI PNP
Jan 11 02:14:38 chesx kernel: [    0.380754] system 00:01: [mem
0xfed14000-0xfed19fff] has been reserved
Jan 11 02:14:38 chesx kernel: [    0.380760] system 00:07: [io
0x0290-0x0297] has been reserved
Jan 11 02:14:38 chesx kernel: [    0.380766] system 00:08: [io
0x04d0-0x04d1] has been reserved
Jan 11 02:14:38 chesx kernel: [    0.380768] system 00:08: [io
0x0800-0x087f] has been reserved
Jan 11 02:14:38 chesx kernel: [    0.380771] system 00:08: [io
0x0480-0x04bf] has been reserved
( # text Removed for fitting in the list # )
0x00100000-0x7fffffff] could not be reserved
Jan 11 02:14:38 chesx kernel: [    0.416535] pci 0000:00:1c.0: BAR 14:
assigned [mem 0x80000000-0x803fffff]
Jan 11 02:14:38 chesx kernel: [    0.416539] pci 0000:00:1c.4: BAR 15:
assigned [mem 0x80400000-0x805fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416543] pci 0000:00:1c.5: BAR 15:
assigned [mem 0x80600000-0x807fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416547] pci 0000:00:1c.0: BAR 13:
assigned [io  0x1000-0x1fff]
Jan 11 02:14:38 chesx kernel: [    0.416550] pci 0000:00:1f.3: BAR 0:
assigned [mem 0x80800000-0x808000ff]
Jan 11 02:14:38 chesx kernel: [    0.416556] pci 0000:00:1f.3: BAR 0:
set to [mem 0x80800000-0x808000ff] (PCI address
[0x80800000-0x808000ff]
Jan 11 02:14:38 chesx kernel: [    0.416559] pci 0000:00:01.0: PCI
bridge to [bus 01-01]
Jan 11 02:14:38 chesx kernel: [    0.416561] pci 0000:00:01.0:
bridge window [io  0x8000-0x8fff]
Jan 11 02:14:38 chesx kernel: [    0.416565] pci 0000:00:01.0:
bridge window [mem 0xf8700000-0xfe7fffff]
Jan 11 02:14:38 chesx kernel: [    0.416568] pci 0000:00:01.0:
bridge window [mem 0xbfe00000-0xdfdfffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416572] pci 0000:00:1c.0: PCI
bridge to [bus 04-04]
Jan 11 02:14:38 chesx kernel: [    0.416575] pci 0000:00:1c.0:
bridge window [io  0x1000-0x1fff]
Jan 11 02:14:38 chesx kernel: [    0.416580] pci 0000:00:1c.0:
bridge window [mem 0x80000000-0x803fffff]
Jan 11 02:14:38 chesx kernel: [    0.416584] pci 0000:00:1c.0:
bridge window [mem 0xdfe00000-0xdfefffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416590] pci 0000:00:1c.4: PCI
bridge to [bus 03-03]
Jan 11 02:14:38 chesx kernel: [    0.416593] pci 0000:00:1c.4:
bridge window [io  0xa000-0xafff]
Jan 11 02:14:38 chesx kernel: [    0.416597] pci 0000:00:1c.4:
bridge window [mem 0xfe900000-0xfe9fffff]
Jan 11 02:14:38 chesx kernel: [    0.416601] pci 0000:00:1c.4:
bridge window [mem 0x80400000-0x805fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416607] pci 0000:00:1c.5: PCI
bridge to [bus 02-02]
Jan 11 02:14:38 chesx kernel: [    0.416610] pci 0000:00:1c.5:
bridge window [io  0x9000-0x9fff]
Jan 11 02:14:38 chesx kernel: [    0.416614] pci 0000:00:1c.5:
bridge window [mem 0xfe800000-0xfe8fffff]
Jan 11 02:14:38 chesx kernel: [    0.416618] pci 0000:00:1c.5:
bridge window [mem 0x80600000-0x807fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416624] pci 0000:00:1e.0: PCI
bridge to [bus 05-05]
Jan 11 02:14:38 chesx kernel: [    0.416627] pci 0000:00:1e.0:
bridge window [io  0xb000-0xbfff]
Jan 11 02:14:38 chesx kernel: [    0.416631] pci 0000:00:1e.0:
bridge window [mem 0xfea00000-0xfeafffff]
Jan 11 02:14:38 chesx kernel: [    0.416635] pci 0000:00:1e.0:
bridge window [mem pref disabled]
Jan 11 02:14:38 chesx kernel: [    0.416645]   alloc irq_desc for 16 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.416647]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.416653] pci 0000:00:01.0: PCI INT
A -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    0.416656] pci 0000:00:01.0: setting
latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.416663] pci 0000:00:1c.0:
enabling device (0106 -> 0107)
Jan 11 02:14:38 chesx kernel: [    0.416666] pci 0000:00:1c.0: PCI INT
A -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    0.416670] pci 0000:00:1c.0: setting
latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.416677] pci 0000:00:1c.4: PCI INT
A -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    0.416681] pci 0000:00:1c.4: setting
latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.416688]   alloc irq_desc for 17 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.416690]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.416693] pci 0000:00:1c.5: PCI INT
B -> GSI 17 (level, low) -> IRQ 17
Jan 11 02:14:38 chesx kernel: [    0.416697] pci 0000:00:1c.5: setting
latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.416703] pci 0000:00:1e.0: setting
latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.416706] pci_bus 0000:00: resource
0 [io  0x0000-0xffff]
Jan 11 02:14:38 chesx kernel: [    0.416708] pci_bus 0000:00: resource
1 [mem 0x00000000-0xffffffffffffffff]
Jan 11 02:14:38 chesx kernel: [    0.416711] pci_bus 0000:01: resource
0 [io  0x8000-0x8fff]
Jan 11 02:14:38 chesx kernel: [    0.416713] pci_bus 0000:01: resource
1 [mem 0xf8700000-0xfe7fffff]
Jan 11 02:14:38 chesx kernel: [    0.416716] pci_bus 0000:01: resource
2 [mem 0xbfe00000-0xdfdfffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416718] pci_bus 0000:04: resource
0 [io  0x1000-0x1fff]
Jan 11 02:14:38 chesx kernel: [    0.416721] pci_bus 0000:04: resource
1 [mem 0x80000000-0x803fffff]
Jan 11 02:14:38 chesx kernel: [    0.416723] pci_bus 0000:04: resource
2 [mem 0xdfe00000-0xdfefffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416726] pci_bus 0000:03: resource
0 [io  0xa000-0xafff]
Jan 11 02:14:38 chesx kernel: [    0.416728] pci_bus 0000:03: resource
1 [mem 0xfe900000-0xfe9fffff]
Jan 11 02:14:38 chesx kernel: [    0.416731] pci_bus 0000:03: resource
2 [mem 0x80400000-0x805fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416733] pci_bus 0000:02: resource
0 [io  0x9000-0x9fff]
Jan 11 02:14:38 chesx kernel: [    0.416736] pci_bus 0000:02: resource
1 [mem 0xfe800000-0xfe8fffff]
Jan 11 02:14:38 chesx kernel: [    0.416738] pci_bus 0000:02: resource
2 [mem 0x80600000-0x807fffff 64bit pref]
Jan 11 02:14:38 chesx kernel: [    0.416741] pci_bus 0000:05: resource
0 [io  0xb000-0xbfff]
Jan 11 02:14:38 chesx kernel: [    0.416743] pci_bus 0000:05: resource
1 [mem 0xfea00000-0xfeafffff]
Jan 11 02:14:38 chesx kernel: [    0.416746] pci_bus 0000:05: resource
4 [io  0x0000-0xffff]
Jan 11 02:14:38 chesx kernel: [    0.416748] pci_bus 0000:05: resource
5 [mem 0x00000000-0xffffffffffffffff]
Jan 11 02:14:38 chesx kernel: [    0.416772] NET: Registered protocol famil=
y 2
Jan 11 02:14:38 chesx kernel: [    0.416828] IP route cache hash table
entries: 32768 (order: 5, 131072 bytes)
Jan 11 02:14:38 chesx kernel: [    0.417022] TCP established hash
table entries: 131072 (order: 8, 1048576 bytes)
Jan 11 02:14:38 chesx kernel: [    0.417313] TCP bind hash table
entries: 65536 (order: 7, 524288 bytes)
Jan 11 02:14:38 chesx kernel: [    0.417448] TCP: Hash tables
configured (established 131072 bind 65536)
Jan 11 02:14:38 chesx kernel: [    0.417450] TCP reno registered
Jan 11 02:14:38 chesx kernel: [    0.417453] UDP hash table entries:
512 (order: 2, 16384 bytes)
Jan 11 02:14:38 chesx kernel: [    0.417459] UDP-Lite hash table
entries: 512 (order: 2, 16384 bytes)
Jan 11 02:14:38 chesx kernel: [    0.417526] NET: Registered protocol famil=
y 1
Jan 11 02:14:38 chesx kernel: [    0.417640] pci 0000:01:00.0: Boot video d=
evice
Jan 11 02:14:38 chesx kernel: [    0.417655] PCI: CLS 32 bytes, default 64
Jan 11 02:14:38 chesx kernel: [    0.417697] Trying to unpack rootfs
image as initramfs...
Jan 11 02:14:38 chesx kernel: [    0.809164] Freeing initrd memory: 13832k =
freed
Jan 11 02:14:38 chesx kernel: [    0.814551] cpufreq-nforce2: No
nForce2 chipset.
Jan 11 02:14:38 chesx kernel: [    0.814577] Scanning for low memory
corruption every 60 seconds
Jan 11 02:14:38 chesx kernel: [    0.814681] audit: initializing
netlink socket (disabled)
Jan 11 02:14:38 chesx kernel: [    0.814692] type=3D2000
audit(1294712071.808:1): initialized
Jan 11 02:14:38 chesx kernel: [    0.826773] highmem bounce pool size: 64 p=
ages
Jan 11 02:14:38 chesx kernel: [    0.826778] HugeTLB registered 2 MB
page size, pre-allocated 0 pages
Jan 11 02:14:38 chesx kernel: [    0.828027] VFS: Disk quotas dquot_6.5.2
Jan 11 02:14:38 chesx kernel: [    0.828090] Dquot-cache hash table
entries: 1024 (order 0, 4096 bytes)
Jan 11 02:14:38 chesx kernel: [    0.828619] fuse init (API version 7.14)
Jan 11 02:14:38 chesx kernel: [    0.828694] msgmni has been set to 1715
Jan 11 02:14:38 chesx kernel: [    0.828989] alg: No test for stdrng (krng)
Jan 11 02:14:38 chesx kernel: [    0.829056] Block layer SCSI generic
(bsg) driver version 0.4 loaded (major 253)
Jan 11 02:14:38 chesx kernel: [    0.829060] io scheduler noop registered
Jan 11 02:14:38 chesx kernel: [    0.829063] io scheduler deadline register=
ed
Jan 11 02:14:38 chesx kernel: [    0.829078] io scheduler cfq
registered (default)
Jan 11 02:14:38 chesx kernel: [    0.829206] pcieport 0000:00:01.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.829229]   alloc irq_desc for 40 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.829231]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.829244] pcieport 0000:00:01.0:
irq 40 for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    0.829299] pcieport 0000:00:1c.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.829327]   alloc irq_desc for 41 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.829328]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.829335] pcieport 0000:00:1c.0:
irq 41 for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    0.829406] pcieport 0000:00:1c.4:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.829433]   alloc irq_desc for 42 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.829435]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.829441] pcieport 0000:00:1c.4:
irq 42 for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    0.829508] pcieport 0000:00:1c.5:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    0.829535]   alloc irq_desc for 43 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    0.829537]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    0.829544] pcieport 0000:00:1c.5:
irq 43 for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    0.829628] pci_hotplug: PCI Hot Plug
PCI Core version: 0.5
Jan 11 02:14:38 chesx kernel: [    0.829715] pciehp: PCI Express Hot
Plug Controller Driver version: 0.4
Jan 11 02:14:38 chesx kernel: [    0.829880] input: Power Button as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
Jan 11 02:14:38 chesx kernel: [    0.829886] ACPI: Power Button [PWRB]
Jan 11 02:14:38 chesx kernel: [    0.829928] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
Jan 11 02:14:38 chesx kernel: [    0.829931] ACPI: Power Button [PWRF]
Jan 11 02:14:38 chesx kernel: [    0.830170] ACPI: acpi_idle
registered with cpuidle
Jan 11 02:14:38 chesx kernel: [    0.832095] isapnp: Scanning for PnP cards=
...
Jan 11 02:14:38 chesx kernel: [    1.185073] isapnp: No Plug & Play device =
found
Jan 11 02:14:38 chesx kernel: [    1.185251] Serial: 8250/16550
driver, 4 ports, IRQ sharing enabled
Jan 11 02:14:38 chesx kernel: [    1.185339] serial8250: ttyS0 at I/O
0x3f8 (irq =3D 4) is a 16550A
Jan 11 02:14:38 chesx kernel: [    1.185649] 00:0a: ttyS0 at I/O 0x3f8
(irq =3D 4) is a 16550A
Jan 11 02:14:38 chesx kernel: [    1.186657] brd: module loaded
Jan 11 02:14:38 chesx kernel: [    1.187111] loop: module loaded
Jan 11 02:14:38 chesx kernel: [    1.187217] ata_piix 0000:00:1f.2: version=
 2.13
Jan 11 02:14:38 chesx kernel: [    1.187228]   alloc irq_desc for 19 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    1.187230]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    1.187235] ata_piix 0000:00:1f.2:
PCI INT B -> GSI 19 (level, low) -> IRQ 19
Jan 11 02:14:38 chesx kernel: [    1.187239] ata_piix 0000:00:1f.2:
MAP [ P0 P2 P1 P3 ]
Jan 11 02:14:38 chesx kernel: [    1.187281] ata_piix 0000:00:1f.2:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.187358] scsi0 : ata_piix
Jan 11 02:14:38 chesx kernel: [    1.187438] scsi1 : ata_piix
Jan 11 02:14:38 chesx kernel: [    1.189182] ata1: SATA max UDMA/133
cmd 0xec00 ctl 0xe880 bmdma 0xe400 irq 19
Jan 11 02:14:38 chesx kernel: [    1.189187] ata2: SATA max UDMA/133
cmd 0xe800 ctl 0xe480 bmdma 0xe408 irq 19
Jan 11 02:14:38 chesx kernel: [    1.189215] ata_piix 0000:00:1f.5:
PCI INT B -> GSI 19 (level, low) -> IRQ 19
Jan 11 02:14:38 chesx kernel: [    1.189220] ata_piix 0000:00:1f.5:
MAP [ P0 -- P1 -- ]
Jan 11 02:14:38 chesx kernel: [    1.189260] ata_piix 0000:00:1f.5:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.189314] scsi2 : ata_piix
Jan 11 02:14:38 chesx kernel: [    1.189383] scsi3 : ata_piix
Jan 11 02:14:38 chesx kernel: [    1.190507] ata3: SATA max UDMA/133
cmd 0xd480 ctl 0xd400 bmdma 0xcc00 irq 19
Jan 11 02:14:38 chesx kernel: [    1.190511] ata4: SATA max UDMA/133
cmd 0xd080 ctl 0xd000 bmdma 0xcc08 irq 19
Jan 11 02:14:38 chesx kernel: [    1.190577] pata_acpi 0000:03:00.1:
enabling device (0000 -> 0001)
Jan 11 02:14:38 chesx kernel: [    1.190583] pata_acpi 0000:03:00.1:
PCI INT B -> GSI 17 (level, low) -> IRQ 17
Jan 11 02:14:38 chesx kernel: [    1.190614] pata_acpi 0000:03:00.1:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.190626] pata_acpi 0000:03:00.1:
PCI INT B disabled
Jan 11 02:14:38 chesx kernel: [    1.190893] Fixed MDIO Bus: probed
Jan 11 02:14:38 chesx kernel: [    1.190924] PPP generic driver version 2.4=
.2
Jan 11 02:14:38 chesx kernel: [    1.190957] tun: Universal TUN/TAP
device driver, 1.6
Jan 11 02:14:38 chesx kernel: [    1.190958] tun: (C) 1999-2004 Max
Krasnyansky <maxk@qualcomm.com>
Jan 11 02:14:38 chesx kernel: [    1.191022] ehci_hcd: USB 2.0
'Enhanced' Host Controller (EHCI) Driver
Jan 11 02:14:38 chesx kernel: [    1.191036]   alloc irq_desc for 23 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    1.191038]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    1.191042] ehci_hcd 0000:00:1d.7:
PCI INT A -> GSI 23 (level, low) -> IRQ 23
Jan 11 02:14:38 chesx kernel: [    1.191052] ehci_hcd 0000:00:1d.7:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.191055] ehci_hcd 0000:00:1d.7:
EHCI Host Controller
Jan 11 02:14:38 chesx kernel: [    1.191085] ehci_hcd 0000:00:1d.7:
new USB bus registered, assigned bus number 1
Jan 11 02:14:38 chesx kernel: [    1.191106] ehci_hcd 0000:00:1d.7: debug p=
ort 1
Jan 11 02:14:38 chesx kernel: [    1.194991] ehci_hcd 0000:00:1d.7:
cache line size of 32 is not supported
Jan 11 02:14:38 chesx kernel: [    1.195003] ehci_hcd 0000:00:1d.7:
irq 23, io mem 0xfebfbc00
Jan 11 02:14:38 chesx kernel: [    1.208019] ehci_hcd 0000:00:1d.7:
USB 2.0 started, EHCI 1.00
Jan 11 02:14:38 chesx kernel: [    1.208159] hub 1-0:1.0: USB hub found
Jan 11 02:14:38 chesx kernel: [    1.208169] hub 1-0:1.0: 8 ports detected
Jan 11 02:14:38 chesx kernel: [    1.208235] ohci_hcd: USB 1.1 'Open'
Host Controller (OHCI) Driver
Jan 11 02:14:38 chesx kernel: [    1.208247] uhci_hcd: USB Universal
Host Controller Interface driver
Jan 11 02:14:38 chesx kernel: [    1.208263] uhci_hcd 0000:00:1d.0:
PCI INT A -> GSI 23 (level, low) -> IRQ 23
Jan 11 02:14:38 chesx kernel: [    1.208268] uhci_hcd 0000:00:1d.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.208271] uhci_hcd 0000:00:1d.0:
UHCI Host Controller
Jan 11 02:14:38 chesx kernel: [    1.208298] uhci_hcd 0000:00:1d.0:
new USB bus registered, assigned bus number 2
Jan 11 02:14:38 chesx kernel: [    1.208318] uhci_hcd 0000:00:1d.0:
irq 23, io base 0x0000d800
Jan 11 02:14:38 chesx kernel: [    1.208416] hub 2-0:1.0: USB hub found
Jan 11 02:14:38 chesx kernel: [    1.208420] hub 2-0:1.0: 2 ports detected
Jan 11 02:14:38 chesx kernel: [    1.208471] uhci_hcd 0000:00:1d.1:
PCI INT B -> GSI 19 (level, low) -> IRQ 19
Jan 11 02:14:38 chesx kernel: [    1.208476] uhci_hcd 0000:00:1d.1:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.208479] uhci_hcd 0000:00:1d.1:
UHCI Host Controller
Jan 11 02:14:38 chesx kernel: [    1.208509] uhci_hcd 0000:00:1d.1:
new USB bus registered, assigned bus number 3
Jan 11 02:14:38 chesx kernel: [    1.208529] uhci_hcd 0000:00:1d.1:
irq 19, io base 0x0000d880
Jan 11 02:14:38 chesx kernel: [    1.208622] hub 3-0:1.0: USB hub found
Jan 11 02:14:38 chesx kernel: [    1.208626] hub 3-0:1.0: 2 ports detected
Jan 11 02:14:38 chesx kernel: [    1.208673]   alloc irq_desc for 18 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    1.208675]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    1.208679] uhci_hcd 0000:00:1d.2:
PCI INT C -> GSI 18 (level, low) -> IRQ 18
Jan 11 02:14:38 chesx kernel: [    1.208684] uhci_hcd 0000:00:1d.2:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.208687] uhci_hcd 0000:00:1d.2:
UHCI Host Controller
Jan 11 02:14:38 chesx kernel: [    1.208713] uhci_hcd 0000:00:1d.2:
new USB bus registered, assigned bus number 4
Jan 11 02:14:38 chesx kernel: [    1.208741] uhci_hcd 0000:00:1d.2:
irq 18, io base 0x0000dc00
Jan 11 02:14:38 chesx kernel: [    1.208839] hub 4-0:1.0: USB hub found
Jan 11 02:14:38 chesx kernel: [    1.208842] hub 4-0:1.0: 2 ports detected
Jan 11 02:14:38 chesx kernel: [    1.208890] uhci_hcd 0000:00:1d.3:
PCI INT D -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    1.208895] uhci_hcd 0000:00:1d.3:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    1.208898] uhci_hcd 0000:00:1d.3:
UHCI Host Controller
Jan 11 02:14:38 chesx kernel: [    1.208926] uhci_hcd 0000:00:1d.3:
new USB bus registered, assigned bus number 5
Jan 11 02:14:38 chesx kernel: [    1.208953] uhci_hcd 0000:00:1d.3:
irq 16, io base 0x0000e000
Jan 11 02:14:38 chesx kernel: [    1.209061] hub 5-0:1.0: USB hub found
Jan 11 02:14:38 chesx kernel: [    1.209067] hub 5-0:1.0: 2 ports detected
Jan 11 02:14:38 chesx kernel: [    1.209169] PNP: PS/2 Controller
[PNP0f03:PS2M] at 0x60,0x64 irq 12
Jan 11 02:14:38 chesx kernel: [    1.209171] PNP: PS/2 controller
doesn't have KBD irq; using default 1
Jan 11 02:14:38 chesx kernel: [    1.211952] serio: i8042 KBD port at
0x60,0x64 irq 1
Jan 11 02:14:38 chesx kernel: [    1.211957] serio: i8042 AUX port at
0x60,0x64 irq 12
Jan 11 02:14:38 chesx kernel: [    1.212047] mice: PS/2 mouse device
common for all mice
Jan 11 02:14:38 chesx kernel: [    1.212143] rtc_cmos 00:03: RTC can
wake from S4
Jan 11 02:14:38 chesx kernel: [    1.212175] rtc_cmos 00:03: rtc core:
registered rtc_cmos as rtc0
Jan 11 02:14:38 chesx kernel: [    1.212196] rtc0: alarms up to one
month, y3k, 114 bytes nvram, hpet irqs
Jan 11 02:14:38 chesx kernel: [    1.212276] device-mapper: uevent:
version 1.0.3
Jan 11 02:14:38 chesx kernel: [    1.212393] device-mapper: ioctl:
4.17.0-ioctl (2010-03-05) initialised: dm-devel@redhat.com
Jan 11 02:14:38 chesx kernel: [    1.212544] device-mapper: multipath:
version 1.1.1 loaded
Jan 11 02:14:38 chesx kernel: [    1.212547] device-mapper: multipath
round-robin: version 1.0.0 loaded
Jan 11 02:14:38 chesx kernel: [    1.212681] EISA: Probing bus 0 at eisa.0
Jan 11 02:14:38 chesx kernel: [    1.212686] Cannot allocate resource
for EISA slot 1
Jan 11 02:14:38 chesx kernel: [    1.212704] Cannot allocate resource
for EISA slot 8
Jan 11 02:14:38 chesx kernel: [    1.212705] EISA: Detected 0 cards.
Jan 11 02:14:38 chesx kernel: [    1.212929] cpuidle: using governor ladder
Jan 11 02:14:38 chesx kernel: [    1.212931] cpuidle: using governor menu
Jan 11 02:14:38 chesx kernel: [    1.213251] TCP cubic registered
Jan 11 02:14:38 chesx kernel: [    1.213384] NET: Registered protocol famil=
y 10
Jan 11 02:14:38 chesx kernel: [    1.213723] lo: Disabled Privacy Extensions
Jan 11 02:14:38 chesx kernel: [    1.213945] NET: Registered protocol famil=
y 17
Jan 11 02:14:38 chesx kernel: [    1.214748] Using IPI No-Shortcut mode
Jan 11 02:14:38 chesx kernel: [    1.214806] TuxOnIce 3.2-rc2
(http://tuxonice.net)
Jan 11 02:14:38 chesx kernel: [    1.518648] ata3: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    1.529265] ata4: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    1.696017] usb 1-6: new high speed
USB device using ehci_hcd and address 4
Jan 11 02:14:38 chesx kernel: [    1.838687] ata2.00: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    1.838700] ata2.01: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    1.952021] usb 1-7: new high speed
USB device using ehci_hcd and address 5
Jan 11 02:14:38 chesx kernel: [    1.984061] ata1.00: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    1.984074] ata1.01: SATA link up 3.0
Gbps (SStatus 123 SControl 300)
Jan 11 02:14:38 chesx kernel: [    2.016259] ata1.01: ATA-7: SAMSUNG
HD322HJ, 1AC01118, max UDMA7
Jan 11 02:14:38 chesx kernel: [    2.016264] ata1.01: 625142448
sectors, multi 16: LBA48 NCQ (depth 0/32)
Jan 11 02:14:38 chesx kernel: [    2.024387] ata1.01: configured for UDMA/1=
33
Jan 11 02:14:38 chesx kernel: [    2.024508] scsi 0:0:1:0:
Direct-Access     ATA      SAMSUNG HD322HJ  1AC0 PQ: 0 ANSI: 5
Jan 11 02:14:38 chesx kernel: [    2.024664] sd 0:0:1:0: Attached scsi
generic sg0 type 0
Jan 11 02:14:38 chesx kernel: [    2.024684] sd 0:0:1:0: [sda]
625142448 512-byte logical blocks: (320 GB/298 GiB)
Jan 11 02:14:38 chesx kernel: [    2.024748] sd 0:0:1:0: [sda] Write
Protect is off
Jan 11 02:14:38 chesx kernel: [    2.024750] sd 0:0:1:0: [sda] Mode
Sense: 00 3a 00 00
Jan 11 02:14:38 chesx kernel: [    2.024771] sd 0:0:1:0: [sda] Write
cache: enabled, read cache: enabled, doesn't support DPO or FUA
Jan 11 02:14:38 chesx kernel: [    2.024891]  sda: sda1 sda2
Jan 11 02:14:38 chesx kernel: [    2.047526] sd 0:0:1:0: [sda]
Attached SCSI disk
Jan 11 02:14:38 chesx kernel: [    2.047691] TuxOnIce: No image found.
Jan 11 02:14:38 chesx kernel: [    2.047988] PM: Checking image
partition swap:/dev/sda1
Jan 11 02:14:38 chesx kernel: [    2.047991] PM: Resume from disk failed.
Jan 11 02:14:38 chesx kernel: [    2.048001] registered taskstats version 1
Jan 11 02:14:38 chesx kernel: [    2.048276]   Magic number: 11:171:207
Jan 11 02:14:38 chesx kernel: [    2.048336] rtc_cmos 00:03: setting
system clock to 2011-01-11 02:14:33 UTC (1294712073)
Jan 11 02:14:38 chesx kernel: [    2.048343] BIOS EDD facility v0.16
2004-Jun-25, 0 devices found
Jan 11 02:14:38 chesx kernel: [    2.048344] EDD information not available.
Jan 11 02:14:38 chesx kernel: [    2.048415] Freeing unused kernel
memory: 652k freed
Jan 11 02:14:38 chesx kernel: [    2.083727] udev: starting version 145
Jan 11 02:14:38 chesx kernel: [    2.101562] Linux agpgart interface v0.103
Jan 11 02:14:38 chesx kernel: [    2.120786] [drm] Initialized drm
1.1.0 20060810
Jan 11 02:14:38 chesx kernel: [    2.148819] nouveau 0000:01:00.0: PCI
INT A -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    2.148825] nouveau 0000:01:00.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    2.151110] [drm] nouveau
0000:01:00.0: Detected an NV50 generation card (0x092a80a2)
Jan 11 02:14:38 chesx kernel: [    2.155242] [drm] nouveau
0000:01:00.0: Attempting to load BIOS image from PRAMIN
Jan 11 02:14:38 chesx kernel: [    2.228837] [drm] nouveau
0000:01:00.0: ... appears to be valid
Jan 11 02:14:38 chesx kernel: [    2.228841] [drm] nouveau
0000:01:00.0: BIT BIOS found
Jan 11 02:14:38 chesx kernel: [    2.228843] [drm] nouveau
0000:01:00.0: Bios version 62.92.92.00
Jan 11 02:14:38 chesx kernel: [    2.228846] [drm] nouveau
0000:01:00.0: TMDS table revision 2.0 not currently supported
Jan 11 02:14:38 chesx kernel: [    2.228849] [drm] nouveau
0000:01:00.0: Found Display Configuration Block version 4.0
Jan 11 02:14:38 chesx kernel: [    2.228852] [drm] nouveau
0000:01:00.0: Raw DCB entry 0: 02000300 00000028
Jan 11 02:14:38 chesx kernel: [    2.228854] [drm] nouveau
0000:01:00.0: Raw DCB entry 1: 01010312 00020030
Jan 11 02:14:38 chesx kernel: [    2.228857] [drm] nouveau
0000:01:00.0: Raw DCB entry 2: 04021310 00000028
Jan 11 02:14:38 chesx kernel: [    2.228859] [drm] nouveau
0000:01:00.0: Raw DCB entry 3: 02021322 00020010
Jan 11 02:14:38 chesx kernel: [    2.228861] [drm] nouveau
0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
Jan 11 02:14:38 chesx kernel: [    2.228864] [drm] nouveau
0000:01:00.0: DCB connector table: VHER 0x40 5 16 4
Jan 11 02:14:38 chesx kernel: [    2.228867] [drm] nouveau
0000:01:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
Jan 11 02:14:38 chesx kernel: [    2.228870] [drm] nouveau
0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
Jan 11 02:14:38 chesx kernel: [    2.228878] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 0 at offset 0xC72B
Jan 11 02:14:38 chesx kernel: [    2.280159] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 1 at offset 0xCCE0
Jan 11 02:14:38 chesx kernel: [    2.296039] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 2 at offset 0xDABE
Jan 11 02:14:38 chesx kernel: [    2.296050] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 3 at offset 0xDBBC
Jan 11 02:14:38 chesx kernel: [    2.304123] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table 4 at offset 0xDE28
Jan 11 02:14:38 chesx kernel: [    2.304127] [drm] nouveau
0000:01:00.0: Parsing VBIOS init table at offset 0xDE8D
Jan 11 02:14:38 chesx kernel: [    2.328081] [drm] nouveau
0000:01:00.0: 0xDE8D: Condition still not met after 20ms, skipping
following opcodes
Jan 11 02:14:38 chesx kernel: [    2.328091] [drm] nouveau
0000:01:00.0: 0xB8C2: parsing output script 0
Jan 11 02:14:38 chesx kernel: [    2.328095] [drm] nouveau
0000:01:00.0: 0xB8C2: parsing output script 0
Jan 11 02:14:38 chesx kernel: [    2.328107] [drm] nouveau
0000:01:00.0: Detected 1024MiB VRAM
Jan 11 02:14:38 chesx kernel: [    2.474608] [TTM] Zone  kernel:
Available graphics memory: 439374 kiB.
Jan 11 02:14:38 chesx kernel: [    2.474612] [TTM] Zone highmem:
Available graphics memory: 1030962 kiB.
Jan 11 02:14:38 chesx kernel: [    2.474617] [TTM] Initializing pool alloca=
tor.
Jan 11 02:14:38 chesx kernel: [    2.488520] usb 3-2: new low speed
USB device using uhci_hcd and address 2
Jan 11 02:14:38 chesx kernel: [    2.492872] [drm] nouveau
0000:01:00.0: 512 MiB GART (aperture)
Jan 11 02:14:38 chesx kernel: [    2.494950] [drm] nouveau
0000:01:00.0: Allocating FIFO number 1
Jan 11 02:14:38 chesx kernel: [    2.499372] [drm] nouveau
0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
Jan 11 02:14:38 chesx kernel: [    2.500001] [drm] nouveau
0000:01:00.0: Detected a DAC output
Jan 11 02:14:38 chesx kernel: [    2.500003] [drm] nouveau
0000:01:00.0: Detected a TMDS output
Jan 11 02:14:38 chesx kernel: [    2.500006] [drm] nouveau
0000:01:00.0: Detected a DAC output
Jan 11 02:14:38 chesx kernel: [    2.500008] [drm] nouveau
0000:01:00.0: Detected a TMDS output
Jan 11 02:14:38 chesx kernel: [    2.500011] [drm] nouveau
0000:01:00.0: Detected a DVI-I connector
Jan 11 02:14:38 chesx kernel: [    2.500056] [drm] nouveau
0000:01:00.0: Detected a DVI-I connector
Jan 11 02:14:38 chesx kernel: [    2.660073] usbcore: registered new
interface driver hiddev
Jan 11 02:14:38 chesx kernel: [    2.672862] input: HID 04f3:0103 as
/devices/pci0000:00/0000:00:1d.1/usb3/3-2/3-2:1.0/input/input2
Jan 11 02:14:38 chesx kernel: [    2.672928] generic-usb
0003:04F3:0103.0001: input,hidraw0: USB HID v1.10 Keyboard [HID
04f3:0103] on usb-0000:00:1d.1-2/input0
Jan 11 02:14:38 chesx kernel: [    2.695732] input: HID 04f3:0103 as
/devices/pci0000:00/0000:00:1d.1/usb3/3-2/3-2:1.1/input/input3
Jan 11 02:14:38 chesx kernel: [    2.695783] generic-usb
0003:04F3:0103.0002: input,hidraw1: USB HID v1.10 Device [HID
04f3:0103] on usb-0000:00:1d.1-2/input1
Jan 11 02:14:38 chesx kernel: [    2.695798] usbcore: registered new
interface driver usbhid
Jan 11 02:14:38 chesx kernel: [    2.695800] usbhid: USB HID core driver
Jan 11 02:14:38 chesx kernel: [    2.832167] [drm] nouveau
0000:01:00.0: allocated 1920x1080 fb: 0x40250000, bo f6e29800
Jan 11 02:14:38 chesx kernel: [    2.832218] fb0: nouveaufb frame buffer de=
vice
Jan 11 02:14:38 chesx kernel: [    2.832220] drm: registered panic notifier
Jan 11 02:14:38 chesx kernel: [    2.832222] Slow work thread pool: Startin=
g up
Jan 11 02:14:38 chesx kernel: [    2.832293] Slow work thread pool: Ready
Jan 11 02:14:38 chesx kernel: [    2.832300] [drm] Initialized nouveau
0.0.16 20090420 for 0000:01:00.0 on minor 0
Jan 11 02:14:38 chesx kernel: [    2.860087] dracut: Starting plymouth daem=
on
Jan 11 02:14:38 chesx kernel: [    2.887136] pata_jmicron
0000:03:00.1: PCI INT B -> GSI 17 (level, low) -> IRQ 17
Jan 11 02:14:38 chesx kernel: [    2.887168] pata_jmicron
0000:03:00.1: setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    2.892031] usb 4-1: new full speed
USB device using uhci_hcd and address 2
Jan 11 02:14:38 chesx kernel: [    2.908560] scsi4 : pata_jmicron
Jan 11 02:14:38 chesx kernel: [    2.909615] Initializing USB Mass
Storage driver...
Jan 11 02:14:38 chesx kernel: [    2.912055] Floppy drive(s): fd0 is 1.44M
Jan 11 02:14:38 chesx kernel: [    2.915655] scsi5 : pata_jmicron
Jan 11 02:14:38 chesx kernel: [    2.916393] ata5: PATA max UDMA/100
cmd 0xac00 ctl 0xa880 bmdma 0xa400 irq 17
Jan 11 02:14:38 chesx kernel: [    2.916396] ata6: PATA max UDMA/100
cmd 0xa800 ctl 0xa480 bmdma 0xa408 irq 17
Jan 11 02:14:38 chesx kernel: [    2.916538] ahci 0000:03:00.0: version 3.0
Jan 11 02:14:38 chesx kernel: [    2.916559] ahci 0000:03:00.0: PCI
INT A -> GSI 16 (level, low) -> IRQ 16
Jan 11 02:14:38 chesx kernel: [    2.917570] scsi6 : usb-storage 1-6:1.0
Jan 11 02:14:38 chesx kernel: [    2.917773] usbcore: registered new
interface driver usb-storage
Jan 11 02:14:38 chesx kernel: [    2.917776] USB Mass Storage support
registered.
Jan 11 02:14:38 chesx kernel: [    2.932071] ahci 0000:03:00.0: AHCI
0001.0000 32 slots 2 ports 3 Gbps 0x3 impl SATA mode
Jan 11 02:14:38 chesx kernel: [    2.932075] ahci 0000:03:00.0: flags:
64bit ncq pm led clo pmp pio slum part
Jan 11 02:14:38 chesx kernel: [    2.932083] ahci 0000:03:00.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    2.932227] scsi7 : ahci
Jan 11 02:14:38 chesx kernel: [    2.932236] FDC 0 is a post-1991 82077
Jan 11 02:14:38 chesx kernel: [    2.932313] scsi8 : ahci
Jan 11 02:14:38 chesx kernel: [    2.932409] ata7: SATA max UDMA/133
abar m8192@0xfe9fe000 port 0xfe9fe100 irq 16
Jan 11 02:14:38 chesx kernel: [    2.932413] ata8: SATA max UDMA/133
abar m8192@0xfe9fe000 port 0xfe9fe180 irq 16
Jan 11 02:14:38 chesx kernel: [    3.076581] ata5.00: ATAPI: TSSTcorp
CDDVDW SH-S202J, SB01, max UDMA/66
Jan 11 02:14:38 chesx kernel: [    3.092539] ata5.00: configured for UDMA/66
Jan 11 02:14:38 chesx kernel: [    3.094106] scsi 4:0:0:0: CD-ROM
     TSSTcorp CDDVDW SH-S202J  SB01 PQ: 0 ANSI: 5
Jan 11 02:14:38 chesx kernel: [    3.097619] sr0: scsi3-mmc drive:
48x/48x writer dvd-ram cd/rw xa/form2 cdda tray
Jan 11 02:14:38 chesx kernel: [    3.097623] Uniform CD-ROM driver
Revision: 3.20
Jan 11 02:14:38 chesx kernel: [    3.097734] sr 4:0:0:0: Attached scsi
CD-ROM sr0
Jan 11 02:14:38 chesx kernel: [    3.097795] sr 4:0:0:0: Attached scsi
generic sg1 type 5
Jan 11 02:14:38 chesx kernel: [    3.249536] ata7: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    3.256540] ata8: SATA link down
(SStatus 0 SControl 300)
Jan 11 02:14:38 chesx kernel: [    3.270189]   alloc irq_desc for 21 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    3.270191]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    3.270199] firewire_ohci
0000:05:03.0: PCI INT A -> GSI 21 (level, low) -> IRQ 21
Jan 11 02:14:38 chesx kernel: [    3.325552] firewire_ohci: Added
fw-ohci device 0000:05:03.0, OHCI v1.10, 4 IR + 8 IT contexts, quirks
0x2
Jan 11 02:14:38 chesx kernel: [    3.411467] EXT3-fs: barriers not enabled
Jan 11 02:14:38 chesx kernel: [    3.427540] kjournald starting.
Commit interval 5 seconds
Jan 11 02:14:38 chesx kernel: [    3.427699] EXT3-fs (sda2): mounted
filesystem with ordered data mode
Jan 11 02:14:38 chesx kernel: [    3.495671] dracut: Mounted root
filesystem /dev/sda2
Jan 11 02:14:38 chesx kernel: [    3.633940] dracut: Switching root
Jan 11 02:14:38 chesx kernel: [    3.824224] firewire_core: created
device fw0: GUID 0011d80001645ba9, S400
Jan 11 02:14:38 chesx kernel: [    3.916763] scsi 6:0:0:0:
Direct-Access              USB Flash Memory PMAP PQ: 0 ANSI: 0 CCS
Jan 11 02:14:38 chesx kernel: [    3.917162] sd 6:0:0:0: Attached scsi
generic sg2 type 0
Jan 11 02:14:38 chesx kernel: [    3.918372] sd 6:0:0:0: [sdb]
31375360 512-byte logical blocks: (16.0 GB/14.9 GiB)
Jan 11 02:14:38 chesx kernel: [    3.918868] sd 6:0:0:0: [sdb] Write
Protect is off
Jan 11 02:14:38 chesx kernel: [    3.918872] sd 6:0:0:0: [sdb] Mode
Sense: 23 00 00 00
Jan 11 02:14:38 chesx kernel: [    3.918875] sd 6:0:0:0: [sdb]
Assuming drive cache: write through
Jan 11 02:14:38 chesx kernel: [    3.922119] sd 6:0:0:0: [sdb]
Assuming drive cache: write through
Jan 11 02:14:38 chesx kernel: [    3.922125]  sdb: sdb1
Jan 11 02:14:38 chesx kernel: [    3.923995] sd 6:0:0:0: [sdb]
Assuming drive cache: write through
Jan 11 02:14:38 chesx kernel: [    3.923999] sd 6:0:0:0: [sdb]
Attached SCSI removable disk
Jan 11 02:14:38 chesx kernel: [    4.307372] udev: starting version 145
Jan 11 02:14:38 chesx kernel: [    5.013705] iTCO_vendor_support:
vendor-support=3D0
Jan 11 02:14:38 chesx kernel: [    5.023113] i801_smbus 0000:00:1f.3:
enabling device (0001 -> 0003)
Jan 11 02:14:38 chesx kernel: [    5.023142] i801_smbus 0000:00:1f.3:
PCI INT C -> GSI 18 (level, low) -> IRQ 18
Jan 11 02:14:38 chesx kernel: [    5.023180] ACPI: resource
0000:00:1f.3 [io  0x0400-0x041f] conflicts with ACPI region SMRG [???
0x00000400-0x0000040f flags 0x47]
Jan 11 02:14:38 chesx kernel: [    5.023220] ACPI: If an ACPI driver
is available for this device, you should use it instead of the native
driver
Jan 11 02:14:38 chesx kernel: [    5.129729] iTCO_wdt: Intel TCO
WatchDog Timer Driver v1.06
Jan 11 02:14:38 chesx kernel: [    5.129810] iTCO_wdt: Found a ICH8 or
ICH8R TCO device (Version=3D2, TCOBASE=3D0x0860)
Jan 11 02:14:38 chesx kernel: [    5.129897] iTCO_wdt: initialized.
heartbeat=3D30 sec (nowayout=3D0)
Jan 11 02:14:38 chesx kernel: [    5.166309] input: PC Speaker as
/devices/platform/pcspkr/input/input4
Jan 11 02:14:38 chesx kernel: [    5.303134] skge 0000:05:04.0: PCI
INT A -> GSI 19 (level, low) -> IRQ 19
Jan 11 02:14:38 chesx kernel: [    5.303197] skge: 1.13 addr
0xfeaf4000 irq 19 chip Yukon-Lite rev 9
Jan 11 02:14:38 chesx kernel: [    5.303729] skge 0000:05:04.0: eth0:
addr 00:1b:fc:ea:72:a5
Jan 11 02:14:38 chesx kernel: [    5.341701] sky2: driver version 1.28
Jan 11 02:14:38 chesx kernel: [    5.341737] sky2 0000:02:00.0: PCI
INT A -> GSI 17 (level, low) -> IRQ 17
Jan 11 02:14:38 chesx kernel: [    5.341768] sky2 0000:02:00.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    5.341791] sky2 0000:02:00.0:
Yukon-2 EC Ultra chip revision 2
Jan 11 02:14:38 chesx kernel: [    5.341890]   alloc irq_desc for 44 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    5.341892]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    5.341905] sky2 0000:02:00.0: irq 44
for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    5.342480] sky2 0000:02:00.0: eth1:
addr 00:1b:fc:e9:9f:d2
Jan 11 02:14:38 chesx kernel: [    5.352306] psmouse serio1: ID: 10 00 64
Jan 11 02:14:38 chesx kernel: [    5.421040] udev: renamed network
interface eth1 to eth0
Jan 11 02:14:38 chesx kernel: [    5.454052] udev: renamed network
interface _rename to eth1
Jan 11 02:14:38 chesx kernel: [    5.469627] Registered led device: xpad0
Jan 11 02:14:38 chesx kernel: [    5.469676] input: Microsoft X-Box
360 pad as /devices/pci0000:00/0000:00:1d.2/usb4/4-1/4-1:1.0/input/input5
Jan 11 02:14:38 chesx kernel: [    5.469767] usbcore: registered new
interface driver xpad
Jan 11 02:14:38 chesx kernel: [    5.469790] xpad: X-Box pad driver
Jan 11 02:14:38 chesx kernel: [    5.496141] Error: Driver 'pcspkr' is
already registered, aborting...
Jan 11 02:14:38 chesx kernel: [    5.546092]   alloc irq_desc for 22 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    5.546094]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    5.546100] HDA Intel 0000:00:1b.0:
PCI INT A -> GSI 22 (level, low) -> IRQ 22
Jan 11 02:14:38 chesx kernel: [    5.546162]   alloc irq_desc for 45 on nod=
e -1
Jan 11 02:14:38 chesx kernel: [    5.546164]   alloc kstat_irqs on node -1
Jan 11 02:14:38 chesx kernel: [    5.546171] HDA Intel 0000:00:1b.0:
irq 45 for MSI/MSI-X
Jan 11 02:14:38 chesx kernel: [    5.546193] HDA Intel 0000:00:1b.0:
setting latency timer to 64
Jan 11 02:14:38 chesx kernel: [    5.846569] input: ImPS/2 Generic
Wheel Mouse as /devices/platform/i8042/serio1/input/input6
Jan 11 02:14:38 chesx kernel: [    5.958090] input: HDA Digital PCBeep
as /devices/pci0000:00/0000:00:1b.0/input/input7
Jan 11 02:14:38 chesx kernel: [    6.211501] Adding 1004024k swap on
/dev/sda1.  Priority:1 extents:1 across:1004024k
Jan 11 02:14:38 chesx kernel: [    6.351424] EXT3-fs (sda2): using
internal journal
Jan 11 02:14:40 chesx NetworkManager: <info>  starting...
Jan 11 02:14:40 chesx NetworkManager: <info>  Trying to start the
modem-manager...
Jan 11 02:14:40 chesx NetworkManager: Loaded plugin keyfile: (c) 2007
- 2008 Red Hat, Inc.  To report bugs please use the NetworkManager
mailing list.
Jan 11 02:14:40 chesx NetworkManager: <info>  WiFi enabled by radio
killswitch; enabled by state file
Jan 11 02:14:40 chesx NetworkManager: <info>  WWAN enabled by radio
killswitch; enabled by state file
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): carrier is OFF
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): new Ethernet
device (driver: 'sky2')
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): exported as
/org/freedesktop/NetworkManager/Devices/0
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): now managed
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): device state
change: 1 -> 2 (reason 2)
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): bringing up device.
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): preparing device.
Jan 11 02:14:40 chesx NetworkManager: <info>  (eth0): deactivating
device (reason: 2).
Jan 11 02:14:40 chesx NetworkManager: Added default wired connection
'Auto eth0' for
( # text Removed for fitting in the list # )
'Auto eth1' for
/sys/devices/pci0000:00/0000:00:1e.0/0000:05:04.0/net/eth1
Jan 11 02:14:40 chesx kernel: [    9.176255] ADDRCONF(NETDEV_UP):
eth1: link is not ready
Jan 11 02:14:41 chesx NetworkManager: <WARN>  default_adapter_cb():
bluez error getting default adapter: The name org.bluez was not
provided by any .service files
Jan 11 02:14:41 chesx NetworkManager: <info>  Trying to start the supplican=
t...
Jan 11 02:14:46 chesx kernel: [   15.418916] [drm] nouveau
0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 1
Jan 11 02:14:46 chesx kernel: [   15.418929] [drm] nouveau
0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 1
[ This last line keeps repeating until reboot. Its a real flood in the logs=
... ]



My NVidia card:
01:00.0 VGA compatible controller: nVidia Corporation G92 [GeForce GTS
250] (rev a2)




Since I can only have a working desktop using nomodeset and without my
20-nouveau.conf file, this is my current lsmod:
Module                  Size  Used by
ndiswrapper           150444  0
nls_iso8859_1           3209  1
nls_cp437               4875  1
vfat                    6690  1
fat                    39032  1 vfat
snd_hda_codec_analog    53701  1
snd_hda_intel          19603  1
snd_hda_codec          74132  2 snd_hda_codec_analog,snd_hda_intel
snd_hwdep               4648  1 snd_hda_codec
snd_pcm                60821  2 snd_hda_intel,snd_hda_codec
snd_timer              15854  1 snd_pcm
snd                    47178  8
snd_hda_codec_analog,snd_hda_intel,snd_hda_codec,snd_hwdep,snd_pcm,snd_timer
soundcore               5572  1 snd
sky2                   38126  0
snd_page_alloc          6514  2 snd_hda_intel,snd_pcm
joydev                  7499  0
pcspkr                  1394  0
xpad                    8429  0
led_class               2441  1 xpad
psmouse                48658  0
asus_atk0110            8903  0
iTCO_wdt                9072  0
iTCO_vendor_support     2298  1 iTCO_wdt
ff_memless              3543  1 xpad
skge                   32372  0
i2c_i801                7128  0
serio_raw               3472  0
firewire_ohci          17866  0
firewire_core          39454  1 firewire_ohci
usbhid                 30532  0
hid                    56286  1 usbhid
crc_itu_t               1347  1 firewire_core
pata_jmicron            1723  0
floppy                 46098  0
usb_storage            35994  1
ahci                   17557  0
libahci                17504  1 ahci
intel_agp              22183  0
nouveau               349083  0
ttm                    49505  1 nouveau
drm_kms_helper         24349  1 nouveau
drm                   149762  3 nouveau,ttm,drm_kms_helper
agpgart                27903  3 intel_agp,ttm,drm
i2c_algo_bit            4226  1 nouveau



I'm pretty sure that I'm doing something wrong, maybe something is
missing, or I did something in the wrong order? Well, I don't know.
But please I need some help.

Just one last observation, the first time I build my kernel I had all
fb devices as modules (less those who I can't set as module), now my
last kernel build have only VESA framebuffer, and I have this
blacklist in modprobe.d:

blacklist aty128fb
blacklist atyfb
blacklist radeonfb
blacklist cirrusfb
blacklist cyber2000fb
blacklist cyblafb
blacklist gx1fb
blacklist hgafb
blacklist i810fb
blacklist intelfb
blacklist kyrofb
blacklist lxfb
blacklist matroxfb_base
blacklist neofb
blacklist nvidiafb
blacklist pm2fb
blacklist rivafb
blacklist s1d13xxxfb
blacklist savagefb
blacklist sisfb
blacklist sstfb
blacklist tdfxfb
blacklist tridentfb
blacklist vesafb
blacklist vfb
blacklist viafb
blacklist vt8623fb

Anyway, I did tried many different combinations of blacklist,
with/without vesafb, nvidiafb, well, nothing works.


Hope someone can help me.


[ ]'s
Regards

--
Maginot Jr
--
Maginot J=FAnior
LPIC 1 - LPIC 2 - LPIC 3 -=A0 CCNA - CLA - Analista Forense
_______________________________________________
xorg@lists.freedesktop.org: X.Org support
Archives: http://lists.freedesktop.org/archives/xorg
Info: http://lists.freedesktop.org/mailman/listinfo/xorg
Your subscription address: gcfx-xorg-2@m.gmane.org

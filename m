From: Morten Bo Johansen <mbj-0XdUWXLQalXR7s880joybQ@public.gmane.org>
Subject: ../nouveau_drv.so: undefined symbol: RegionEmptyData
Date: Wed, 29 Dec 2010 19:40:49 +0100
Message-ID: <slrnihn05j.qck.mbj@gatsby.mbjnet.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Hi,

I get the above error message when trying to run the latest
xf86-video-nouveau driver from the git repository. It prevents the driver
from loading. If I revert back to the Debian version 
1:0.0.15+git20100329+7858345-5 of that driver, then the driver loads, but
there are many issues with that version that I hoped an upgrade could
fix.

Information about my hardware and software:

  GPU: GigaByte GV-N68128DH
  Kernel: 2.6.37 with the latest Nouveau git tree
  Drm: latest git version
  Nouveau: latest git version
  xserver-xorg-core: 1.7.7-10
  xserver-xorg-dev: 1.9.0.902-1

Below follows the contents of the Xorg.log. I hope someone can help.

Morten

----------------------------- Xorg.log begin -----------------------------

X.Org X Server 1.7.7
Release Date: 2010-05-04
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.32-5-686 i686 Debian
Current Operating System: Linux gatsby 2.6.37-rc3+ #1 SMP Tue Dec 28 20:10:12 CET 2010 i686
Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.37-rc3+ root=/dev/sda3 ro
Build Date: 02 December 2010  01:08:37AM
xorg-server 2:1.7.7-10 (Julien Cristau <jcristau-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>) 
Current version of pixman: 0.20.0
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.0.log", Time: Wed Dec 29 19:10:52 2010
(==) Using config file: "/etc/X11/xorg.conf"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
(==) ServerLayout "Default Layout"
(**) |-->Screen "Default Screen" (0)
(**) |   |-->Monitor "<default monitor>"
(**) |   |-->Device "n"
(==) No monitor specified for screen "Default Screen".
	Using a default monitor configuration.
(**) |-->Input Device "Keyboard0"
(**) |-->Input Device "Mouse0"
(==) Automatically adding devices
(==) Automatically enabling devices
(==) FontPath set to:
	/usr/share/fonts/X11/misc,
	/usr/share/fonts/X11/cyrillic,
	/usr/share/fonts/X11/100dpi/:unscaled,
	/usr/share/fonts/X11/75dpi/:unscaled,
	/usr/share/fonts/X11/Type1,
	/usr/share/fonts/X11/100dpi,
	/usr/share/fonts/X11/75dpi,
	/var/lib/defoma/x-ttcidfont-conf.d/dirs/TrueType,
	built-ins
(==) ModulePath set to "/usr/lib/xorg/modules"
(WW) AllowEmptyInput is on, devices using drivers 'kbd', 'mouse' or 'vmmouse' will be disabled.
(WW) Disabling Keyboard0
(WW) Disabling Mouse0
(II) Loader magic: 0x81ec060
(II) Module ABI versions:
	X.Org ANSI C Emulation: 0.4
	X.Org Video Driver: 6.0
	X.Org XInput driver : 7.0
	X.Org Server Extension : 2.0
(++) using VT number 7

(--) PCI:*(0:1:0:0) 10de:0041:1458:310f nVidia Corporation NV40 [GeForce 6800] rev 161, Mem @ 0xfa000000/16777216, 0xe8000000/134217728, 0xfb000000/16777216, BIOS @ 0x????????/131072
(II) Open ACPI successful (/var/run/acpid.socket)
(II) LoadModule: "extmod"
(II) Loading /usr/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension SELinux
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /usr/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.0.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /usr/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(==) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "record"
(II) Loading /usr/lib/xorg/modules/extensions/librecord.so
(II) Module record: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.13.0
	Module class: X.Org Server Extension
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension RECORD
(II) LoadModule: "dri"
(II) Loading /usr/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.0.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /usr/lib/xorg/modules/extensions/libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
	compiled for 1.7.7, module version = 1.1.0
	ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
dlopen: /usr/lib/xorg/modules/drivers/nouveau_drv.so: undefined symbol: RegionEmptyData
(EE) Failed to load /usr/lib/xorg/modules/drivers/nouveau_drv.so
(II) UnloadModule: "nouveau"
(EE) Failed to load module "nouveau" (loader failed, 7)
(EE) No drivers available.

Fatal server error:
no screens found

Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
Please also check the log file at "/var/log/Xorg.0.log" for additional information.

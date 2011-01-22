From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33357] New: Nouveau GPU lockup
Date: Fri, 21 Jan 2011 16:41:14 -0800 (PST)
Message-ID: <bug-33357-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33357

           Summary: Nouveau GPU lockup
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarding this bug from Ubuntu reporter Alex Mayorga Adame:
http://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/696104

[Problem]
Repeated GPU lockup on NVIDIA 320m with graphical corruption, both with DRI 3D
disabled and enabled.

[Original Description]
Just had Empathy (one IRC and one MSN window) and Mozilla Minefield (~15 tabs)
running and the screen locked up and stopped responding to mouse clicks or
keyboard input.
Mouse still moves.

[   100.372] (II) NOUVEAU(0): Modeline "1366x768"x0.0   72.00  1366 1388 1410
1430  768 776 784 840 -hsync -vsync (50.3 kHz)
[  4291.996] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[  4291.997] 
Backtrace:
[  4292.043] 0: /usr/bin/X (xorg_backtrace+0x26) [0x4a0836]
[  4292.043] 1: /usr/bin/X (mieqEnqueue+0x1f4) [0x49fc34]
[  4292.043] 2: /usr/bin/X (xf86PostMotionEventP+0xc4) [0x47ba34]
[  4292.043] 3: /usr/bin/X (xf86PostMotionEvent+0xa1) [0x47bbd1]
[  4292.043] 4: /usr/lib/xorg/modules/input/synaptics_drv.so
(0x7f3673f18000+0x3817) [0x7f3673f1b817]
[  4292.043] 5: /usr/lib/xorg/modules/input/synaptics_drv.so
(0x7f3673f18000+0x5c4d) [0x7f3673f1dc4d]
[  4292.043] 6: /usr/bin/X (0x400000+0x6aee7) [0x46aee7]
[  4292.043] 7: /usr/bin/X (0x400000+0x11e2ee) [0x51e2ee]
[  4292.043] 8: /lib/libpthread.so.0 (0x7f3679966000+0xfd70) [0x7f3679975d70]
[  4292.043] 9: /lib/libc.so.6 (ioctl+0x7) [0x7f36789867d7]
[  4292.043] 10: /lib/libdrm.so.2 (drmIoctl+0x28) [0x7f3676f38388]
[  4292.043] 11: /lib/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f3676f3a64b]
[  4292.043] 12: /lib/libdrm_nouveau.so.1 (0x7f36768fa000+0x2a97)
[0x7f36768fca97]
[  4292.043] 13: /lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xfe)
[0x7f36768fd09e]
[  4292.043] 14: /lib/libdrm_nouveau.so.1 (0x7f36768fa000+0x1bcd)
[0x7f36768fbbcd]
[  4292.043] 15: /lib/libdrm_nouveau.so.1 (nouveau_pushbuf_flush+0x1ae)
[0x7f36768fc19e]
[  4292.043] 16: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f3676b00000+0x1f928) [0x7f3676b1f928]
[  4292.043] 17: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7f3676b00000+0x6c7e) [0x7f3676b06c7e]
[  4292.043] 18: /usr/lib/xorg/modules/libexa.so (0x7f3675a50000+0x5e5f)
[0x7f3675a55e5f]
[  4292.043] 19: /usr/lib/xorg/modules/libexa.so (0x7f3675a50000+0x861a)
[0x7f3675a5861a]
[  4292.043] 20: /usr/lib/xorg/modules/libexa.so (0x7f3675a50000+0xf622)
[0x7f3675a5f622]
[  4292.043] 21: /usr/lib/xorg/modules/libexa.so (0x7f3675a50000+0x101be)
[0x7f3675a601be]
[  4292.043] 22: /usr/bin/X (0x400000+0xd7fb3) [0x4d7fb3]
[  4292.043] 23: /usr/lib/xorg/modules/libexa.so (0x7f3675a50000+0x11258)
[0x7f3675a61258]
[  4292.043] 24: /usr/bin/X (0x400000+0xd3351) [0x4d3351]
[  4292.043] 25: /usr/bin/X (0x400000+0x2d861) [0x42d861]
[  4292.043] 26: /usr/bin/X (0x400000+0x2190e) [0x42190e]
[  4292.043] 27: /lib/libc.so.6 (__libc_start_main+0xfe) [0x7f36788cdd1e]
[  4292.043] 28: /usr/bin/X (0x400000+0x214b9) [0x4214b9]

DistroRelease: Ubuntu 11.04
Package: xserver-xorg-video-nouveau 1:0.0.16+git20100805+b96170a-0ubuntu1
ProcVersionSignature: Ubuntu 2.6.37-11.25-generic 2.6.37-rc7
Uname: Linux 2.6.37-11-generic x86_64
Architecture: amd64
CompizPlugins: No value set for
`/apps/compiz-1/general/allscreens/options/active_plugins'
DRM.card0.HDMI.A.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes:
 edid-base64:
DRM.card0.LVDS.1:
 status: connected
 enabled: enabled
 dpms: On
 modes: 1366x768 1024x768 800x600 640x480 720x400 640x400 640x350
 edid-base64:
AP///////wBN2foFAAAAAC0MAQSQHxEA6qjgmVdLkiUcUFQAAAABAQEBAQEBAQEBAQEBAQEBIBxWQFAASDAWFogANa4QAAAYAAAA/ABOdmlkaWEgRGVmYXVsAAAA/AB0IEZsYXQgUGFuZWwAAAAA/QAAPR0zCAAAICAgICAAADU=
DRM.card0.VGA.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes:
 edid-base64:
Date: Fri Dec 31 15:17:42 2010
DistUpgraded: Yes, recently upgraded Log time: 2010-11-25 14:33:02.550411
DistroCodename: natty
DistroVariant: ubuntu
GdmLog2:

GraphicsCard:   Subsystem: Sony Corporation Device [104d:905e]
InstallationMedia: Ubuntu 10.04.1 LTS "Lucid Lynx" - Release amd64 (20100816.1)
MachineType: Sony Corporation VPCCW1FFX
ProcEnviron:
 PATH=(custom, no user)
 LANG=en_US.UTF-8
 ProcKernelCmdLine: BOOT_IMAGE=/boot/vmlinuz-2.6.37-11-generic
root=UUID=f415c990-a34d-451b-b69c-2070c5d53e47 ro vt.handoff=7 quiet splash
Renderer: Unknown
SourcePackage: xserver-xorg-video-nouveau
dmi.bios.date: 09/22/2009
dmi.bios.vendor: American Megatrends Inc.
dmi.bios.version: R0190Y5
dmi.board.asset.tag: N/A
dmi.board.name: VAIO
dmi.board.vendor: Sony Corporation
dmi.board.version: N/A
dmi.chassis.asset.tag: N/A
dmi.chassis.type: 10
dmi.chassis.vendor: Sony Corporation
dmi.chassis.version: N/A
dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrR0190Y5:bd09/22/2009:svnSonyCorporation:pnVPCCW1FFX:pvrR5785054:rvnSonyCorporation:rnVAIO:rvrN/A:cvnSonyCorporation:ct10:cvrN/A:
dmi.product.name: VPCCW1FFX
dmi.product.version: R5785054
dmi.sys.vendor: Sony Corporation
version.libdrm2: libdrm2 2.4.22-2ubuntu1
version.libgl1-mesa-glx: libgl1-mesa-glx 7.9+repack-1ubuntu3
version.xserver-xorg: xserver-xorg 1:7.5+6ubuntu6
version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:6.13.2-1ubuntu2
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.13.901-2ubuntu2
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20100805+b96170a-0ubuntu1


--- 
Architecture: amd64
CompizPlugins: No value set for
`/apps/compiz-1/general/allscreens/options/active_plugins'
DRM.card0.HDMI.A.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DRM.card0.LVDS.1:
 status: connected
 enabled: enabled
 dpms: On
 modes: 1366x768 1024x768 800x600 640x480 720x400 640x400 640x350
 edid-base64:
AP///////wBN2foFAAAAAC0MAQSQHxEA6qjgmVdLkiUcUFQAAAABAQEBAQEBAQEBAQEBAQEBIBxWQFAASDAWFogANa4QAAAYAAAA/ABOdmlkaWEgRGVmYXVsAAAA/AB0IEZsYXQgUGFuZWwAAAAA/QAAPR0zCAAAICAgICAAADU=
DRM.card0.VGA.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DistUpgraded: Yes, recently upgraded Log time: 2010-11-25 14:33:02.550411
DistroCodename: natty
DistroRelease: Ubuntu 11.04
DistroVariant: ubuntu
GraphicsCard:   Subsystem: Sony Corporation Device [104d:905e]
InstallationMedia: Ubuntu 10.04.1 LTS "Lucid Lynx" - Release amd64 (20100816.1)
MachineType: Sony Corporation VPCCW1FFX
Package: xserver-xorg-video-nouveau 1:0.0.16+git20100805+b96170a-0ubuntu1
PackageArchitecture: amd64
ProcEnviron:
 PATH=(custom, no user)
 LANG=en_US.UTF-8ProcKernelCmdLine: BOOT_IMAGE=/boot/vmlinuz-2.6.37-12-generic
root=UUID=f415c990-a34d-451b-b69c-2070c5d53e47 ro vt.handoff=7 quiet splash
ProcVersionSignature: Ubuntu 2.6.37-12.26-generic 2.6.37
Renderer: Unknown
Tags: natty natty ubuntu
Uname: Linux 2.6.37-12-generic x86_64
UserGroups:

dmi.bios.date: 09/22/2009
dmi.bios.vendor: American Megatrends Inc.
dmi.bios.version: R0190Y5
dmi.board.asset.tag: N/A
dmi.board.name: VAIO
dmi.board.vendor: Sony Corporation
dmi.board.version: N/A
dmi.chassis.asset.tag: N/A
dmi.chassis.type: 10
dmi.chassis.vendor: Sony Corporation
dmi.chassis.version: N/A
dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrR0190Y5:bd09/22/2009:svnSonyCorporation:pnVPCCW1FFX:pvrR5785054:rvnSonyCorporation:rnVAIO:rvrN/A:cvnSonyCorporation:ct10:cvrN/A:
dmi.product.name: VPCCW1FFX
dmi.product.version: R5785054
dmi.sys.vendor: Sony Corporation
version.libdrm2: libdrm2 2.4.22-2ubuntu1
version.libgl1-mesa-glx: libgl1-mesa-glx 7.9+repack-1ubuntu3
version.xserver-xorg: xserver-xorg 1:7.5+6ubuntu6
version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:6.13.2-1ubuntu2
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.13.901-2ubuntu2
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20100805+b96170a-0ubuntu1

--- 
Architecture: amd64
CompisitorRunning: None
CompizPlugins: No value set for
`/apps/compiz-1/general/allscreens/options/active_plugins'
DRM.card0.HDMI.A.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DRM.card0.LVDS.1:
 status: connected
 enabled: enabled
 dpms: On
 modes: 1366x768 1024x768 800x600 640x480 720x400 640x400 640x350
 edid-base64:
AP///////wBN2foFAAAAAC0MAQSQHxEA6qjgmVdLkiUcUFQAAAABAQEBAQEBAQEBAQEBAQEBIBxWQFAASDAWFogANa4QAAAYAAAA/ABOdmlkaWEgRGVmYXVsAAAA/AB0IEZsYXQgUGFuZWwAAAAA/QAAPR0zCAAAICAgICAAADU=
DRM.card0.VGA.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DistUpgraded: Yes, recently upgraded Log time: 2010-11-25 14:33:02.550411
DistroCodename: natty
DistroRelease: Ubuntu 11.04
DistroVariant: ubuntu
GraphicsCard:   Subsystem: Sony Corporation Device [104d:905e]
InstallationMedia: Ubuntu 10.04.1 LTS "Lucid Lynx" - Release amd64 (20100816.1)
MachineType: Sony Corporation VPCCW1FFX
Package: xserver-xorg-video-nouveau 1:0.0.16+git20100805+b96170a-0ubuntu1
PackageArchitecture: amd64
ProcEnviron:
 LANGUAGE=en_US:en
 PATH=(custom, no user)
 LANG=en_US.UTF-8
 LC_MESSAGES=en_US.utf8ProcKernelCmdLine:
BOOT_IMAGE=/boot/vmlinuz-2.6.37-12-generic
root=UUID=f415c990-a34d-451b-b69c-2070c5d53e47 ro vt.handoff=7 quiet splash
ProcVersionSignature: Ubuntu 2.6.37-12.26-generic 2.6.37
Renderer: Hardware acceleration
Tags: natty natty ubuntu
Uname: Linux 2.6.37-12-generic x86_64
UnitySupportTest: nv50_screen_get_param:162 -  Unknown PIPE_CAP 11
UserGroups:

dmi.bios.date: 09/22/2009
dmi.bios.vendor: American Megatrends Inc.
dmi.bios.version: R0190Y5
dmi.board.asset.tag: N/A
dmi.board.name: VAIO
dmi.board.vendor: Sony Corporation
dmi.board.version: N/A
dmi.chassis.asset.tag: N/A
dmi.chassis.type: 10
dmi.chassis.vendor: Sony Corporation
dmi.chassis.version: N/A
dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrR0190Y5:bd09/22/2009:svnSonyCorporation:pnVPCCW1FFX:pvrR5785054:rvnSonyCorporation:rnVAIO:rvrN/A:cvnSonyCorporation:ct10:cvrN/A:
dmi.product.name: VPCCW1FFX
dmi.product.version: R5785054
dmi.sys.vendor: Sony Corporation
version.libdrm2: libdrm2 2.4.22-2ubuntu1
version.libgl1-mesa-glx: libgl1-mesa-glx 7.9+repack-1ubuntu3
version.xserver-xorg: xserver-xorg 1:7.5+6ubuntu6
version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:6.13.2-1ubuntu2
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.13.901-2ubuntu2
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20100805+b96170a-0ubuntu1

--- 
Architecture: amd64
CompisitorRunning: None
CompizPlugins: No value set for
`/apps/compiz-1/general/allscreens/options/active_plugins'
DRM.card0.HDMI.A.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DRM.card0.LVDS.1:
 status: connected
 enabled: enabled
 dpms: On
 modes: 1366x768 1024x768 800x600 640x480 720x400 640x400 640x350
 edid-base64:
AP///////wBN2foFAAAAAC0MAQSQHxEA6qjgmVdLkiUcUFQAAAABAQEBAQEBAQEBAQEBAQEBIBxWQFAASDAWFogANa4QAAAYAAAA/ABOdmlkaWEgRGVmYXVsAAAA/AB0IEZsYXQgUGFuZWwAAAAA/QAAPR0zCAAAICAgICAAADU=
DRM.card0.VGA.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DistUpgraded: Yes, recently upgraded Log time: 2010-11-25 14:33:02.550411
DistroCodename: natty
DistroRelease: Ubuntu 11.04
DistroVariant: ubuntu
GraphicsCard:   Subsystem: Sony Corporation Device [104d:905e]
InstallationMedia: Ubuntu 10.04.1 LTS "Lucid Lynx" - Release amd64 (20100816.1)
MachineType: Sony Corporation VPCCW1FFX
Package: xserver-xorg-video-nouveau 1:0.0.16+git20100805+b96170a-0ubuntu1
PackageArchitecture: amd64
ProcEnviron:
 LANGUAGE=en_US:en
 PATH=(custom, no user)
 LANG=en_US.UTF-8
 LC_MESSAGES=en_US.utf8ProcKernelCmdLine:
BOOT_IMAGE=/boot/vmlinuz-2.6.37-12-generic
root=UUID=f415c990-a34d-451b-b69c-2070c5d53e47 ro vt.handoff=7 quiet splash
ProcVersionSignature: Ubuntu 2.6.37-12.26-generic 2.6.37
Renderer: Software
Tags: natty natty ubuntu
Uname: Linux 2.6.37-12-generic x86_64
UnitySupportTest:

UserGroups:

dmi.bios.date: 09/22/2009
dmi.bios.vendor: American Megatrends Inc.
dmi.bios.version: R0190Y5
dmi.board.asset.tag: N/A
dmi.board.name: VAIO
dmi.board.vendor: Sony Corporation
dmi.board.version: N/A
dmi.chassis.asset.tag: N/A
dmi.chassis.type: 10
dmi.chassis.vendor: Sony Corporation
dmi.chassis.version: N/A
dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrR0190Y5:bd09/22/2009:svnSonyCorporation:pnVPCCW1FFX:pvrR5785054:rvnSonyCorporation:rnVAIO:rvrN/A:cvnSonyCorporation:ct10:cvrN/A:
dmi.product.name: VPCCW1FFX
dmi.product.version: R5785054
dmi.sys.vendor: Sony Corporation
version.libdrm2: libdrm2 2.4.22-2ubuntu1
version.libgl1-mesa-glx: libgl1-mesa-glx 7.9+repack-1ubuntu3
version.xserver-xorg: xserver-xorg 1:7.5+6ubuntu7
version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:6.13.2-1ubuntu2
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.13.901-2ubuntu2
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20100805+b96170a-0ubuntu1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

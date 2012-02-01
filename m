From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45517] New: [GTX 580] X seems to hang a login prompt
 -- PFIFO errors in dmesg
Date: Wed, 01 Feb 2012 22:22:21 +0000
Message-ID: <bug-45517-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45517

             Bug #: 45517
           Summary: [GTX 580] X seems to hang a login prompt -- PFIFO
                    errors in dmesg
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Keywords: regression
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarding this bug from Ubuntu reporter Andy Whitcroft:
http://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/925048

[Problem]
[GTX 580] X seems to hang a login prompt -- PFIFO errors in dmesg

[Original Description]
Machine boots to and displays the lightdm login banner, as soon as the cursor
flashes in the password box output stops.  The mouse pointer is still movable
but nothing else works.

This was successfully running nouveau on an earlier version of ubuntu.  The
fault occurred after upgrade to precise.

[   15.944425] [drm] nouveau 0000:03:00.0: PMFB2_SUBP0: 0x037f0040
[   15.944430] [drm] nouveau 0000:03:00.0: PMFB2_SUBP1: 0x037f0000
[   15.944435] [drm] nouveau 0000:03:00.0: PMFB3_SUBP0: 0x037f0000
[   15.944440] [drm] nouveau 0000:03:00.0: PMFB3_SUBP1: 0x037f0040
[   15.944445] [drm] nouveau 0000:03:00.0: PMFB4_SUBP0: 0x037f0040
[   15.944449] [drm] nouveau 0000:03:00.0: PMFB4_SUBP1: 0x037f0000
[   16.785866] hda-intel: IRQ timing workaround is activated for card #0.
Suggest a bigger bdl_pos_adj.
[   17.349142] e1000e: eth1 NIC Link is Up 1000 Mbps Full Duplex, Flow Control:
Rx/Tx
[   17.349654] ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
[   21.940164] [drm] nouveau 0000:03:00.0: PFIFO: read fault at 0x00080da000
[PAGE_SYSTEM_ONLY] from PGRAPH/GPC3/(unknown enum 0x0000000b) on channel
0x0000a21000
[   21.940171] [drm] nouveau 0000:03:00.0: PFIFO: unknown status 0x40000000

DistroRelease: Ubuntu 12.04
Package: xorg 1:7.6+10ubuntu1
ProcVersionSignature: Ubuntu 3.2.0-12.21-generic 3.2.2
Uname: Linux 3.2.0-12-generic x86_64
ApportVersion: 1.91-0ubuntu1
Architecture: amd64
CompizPlugins:
[core,bailer,detection,composite,opengl,decor,mousepoll,vpswitch,regex,animation,snap,expo,move,compiztoolbox,place,grid,gnomecompat,wall,ezoom,workarounds,staticswitcher,resize,fade,scale,session,unityshell]
Date: Wed Feb  1 19:19:29 2012
DistUpgraded: Log time: 2012-02-01 16:44:35.369830
DistroCodename: precise
DistroVariant: ubuntu
ExtraDebuggingInterest: Yes, whatever it takes to get this fixed in Ubuntu
GlAlternative: lrwxrwxrwx 1 root root 24 Feb  7  2011 /etc/alternatives/gl_conf
-> /usr/lib/mesa/ld.so.conf
GraphicsCard:
NVIDIA Corporation GF110 [GeForce GTX 580] [10de:1080] (rev a1) (prog-if 00
[VGA controller])
Subsystem: eVga.com. Corp. Device [3842:1587]
InstallationMedia: Ubuntu 11.04 "Natty Narwhal" - Alpha amd64 (20110207)
Lsusb:
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 003: ID 099a:7202 Zippy Technology Corp.
ProcEnviron:
LC_CTYPE=en_GB.UTF-8
LC_COLLATE=en_GB.UTF-8
LANG=en_GB.UTF-8
LC_MESSAGES=en_GB.UTF-8ProcKernelCmdLine:
BOOT_IMAGE=/boot/vmlinuz-3.2.0-12-generic
root=UUID=375e3b8f-01ec-41de-80ee-6ab3210f6988 ro quiet splash nolapic_timer
vt.handoff=7
SourcePackage: xorg
UpgradeStatus: Upgraded to precise on 2012-02-01 (0 days ago)
dmi.bios.date: 07/15/2011
dmi.bios.vendor: Intel Corp.
dmi.bios.version: LCPBG10J.86A.0548.2011.0715.2025
dmi.board.asset.tag: Base Board Asset Tag
dmi.chassis.type: 3
dmi.modalias:
dmi:bvnIntelCorp.:bvrLCPBG10J.86A.0548.2011.0715.2025:bd07/15/2011:svn:pn:pvr:rvn:rn:rvr:cvn:ct3:cvr:
version.compiz: compiz 1:0.9.6+bzr20110929-0ubuntu8
version.ia32-libs: ia32-libs N/A
version.libdrm2: libdrm2 2.4.30-1ubuntu1
version.libgl1-mesa-dri: libgl1-mesa-dri
7.12.0~git20110825.27395cb5-0ubuntu0sarvatt~natty
version.libgl1-mesa-dri-experimental: libgl1-mesa-dri-experimental
7.12.0~git20110825.27395cb5-0ubuntu0sarvatt~natty
version.libgl1-mesa-glx: libgl1-mesa-glx
7.12.0~git20110825.27395cb5-0ubuntu0sarvatt~natty
version.xserver-xorg-core: xserver-xorg-core 2:1.11.3-0ubuntu9
version.xserver-xorg-input-evdev: xserver-xorg-input-evdev
1:2.6.99.901-1ubuntu3
version.xserver-xorg-video-ati: xserver-xorg-video-ati
1:6.14.99~git20111219.aacbd629-0ubuntu1
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.17.0-1ubuntu3
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20111201+b5534a1-1build2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45017] New: [GT216] Distorted screen on MacBook Air
	3, 2
Date: Sat, 21 Jan 2012 03:25:05 +0000
Message-ID: <bug-45017-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45017

             Bug #: 45017
           Summary: [GT216] Distorted screen on MacBook Air 3,2
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Keywords: regression
          Severity: normal
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarding this bug from Ubuntu reporter Peter Hedlund:
http://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/898784

[Problem]
The internal display is distorted with vertical bands of different colors
separated by black and white noise.  This worked in Ubuntu 11.10 (kernel 3.0).

The  the good news is that an external monitor now works perfectly through the
mini displayport, which did not work in Ubuntu 11.10.

DistroRelease: Ubuntu 12.04
Package: xserver-xorg-video-nouveau 1:0.0.16+git20110411+8378443-1
Uname: Linux 3.2.0-2-generic x86_64
CompizPlugins:
[core,bailer,detection,composite,opengl,compiztoolbox,decor,gnomecompat,grid,imgpng,mousepoll,move,place,regex,resize,session,snap,unitymtgrabhandles,vpswitch,wall,animation,expo,ezoom,fade,scale,unityshell,workarounds]
CompositorRunning: compiz
Date: Thu Dec  1 19:21:56 2011
GraphicsCard:
 nVidia Corporation Device [10de:08a3] (rev a2) (prog-if 00 [VGA controller])
   Subsystem: Apple Computer Inc. Device [106b:00d3]
LiveMediaBuild: Ubuntu 12.04 LTS "Precise Pangolin" - Alpha amd64 (20111129.1)
MachineType: Apple Inc. MacBookAir3,2
ProcEnviron:
 PATH=(custom, no user)
 LANG=en_US.UTF-8ProcKernelCmdLine: BOOT_IMAGE=/casper/vmlinuz
file=/cdrom/preseed/hostname.seed boot=casper quiet splash --
SourcePackage: xserver-xorg-video-nouveau
UpgradeStatus: No upgrade log present (probably fresh install)
dmi.bios.date: 11/18/10
dmi.bios.vendor: Apple Inc.
dmi.bios.version: MBA31.88Z.0061.B01.1011181342
dmi.board.asset.tag: Base Board Asset Tag#
dmi.board.name: Mac-942C5DF58193131B
dmi.board.vendor: Apple Inc.
dmi.board.version: MacBookAir3,2
dmi.chassis.type: 10
dmi.chassis.vendor: Apple Inc.
dmi.chassis.version: Mac-942C5DF58193131B
dmi.modalias:
dmi:bvnAppleInc.:bvrMBA31.88Z.0061.B01.1011181342:bd11/18/10:svnAppleInc.:pnMacBookAir3,2:pvr1.0:rvnAppleInc.:rnMac-942C5DF58193131B:rvrMacBookAir3,2:cvnAppleInc.:ct10:cvrMac-942C5DF58193131B:
dmi.product.name: MacBookAir3,2
dmi.product.version: 1.0
dmi.sys.vendor: Apple Inc.
version.compiz: compiz 1:0.9.6+bzr20110929-0ubuntu7
version.ia32-libs: ia32-libs N/A
version.libdrm2: libdrm2 2.4.27-1ubuntu1
version.libgl1-mesa-dri: libgl1-mesa-dri 7.11-0ubuntu4
version.libgl1-mesa-dri-experimental: libgl1-mesa-dri-experimental N/A
version.libgl1-mesa-glx: libgl1-mesa-glx 7.11-0ubuntu4
version.xserver-xorg-core: xserver-xorg-core 2:1.10.4-1ubuntu5
version.xserver-xorg-input-evdev: xserver-xorg-input-evdev 1:2.6.0-1ubuntu13
version.xserver-xorg-video-ati: xserver-xorg-video-ati
1:6.14.99~git20110811.g93fc084-0ubuntu1
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.15.901-1ubuntu3
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20110411+8378443-1

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34371] New: [natty] Video corruption on kernel
 2.6.38-1-generic (and on -3) and nVidia Corporation GT216 [GeForce GT 230M]
 (rev a2)
Date: Wed, 16 Feb 2011 20:02:59 -0800 (PST)
Message-ID: <bug-34371-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34371

           Summary: [natty] Video corruption on kernel 2.6.38-1-generic
                    (and on -3) and nVidia Corporation GT216 [GeForce GT
                    230M] (rev a2)
           Product: xorg
           Version: 7.6
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


Forwarding this bug from Ubuntu reporter Alex Mayorga Adame:
http://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/713781

[Problem]
Starting with 2.6.38-1, user reports X on -nouveau becomes corrupt (see
attached screenshot).  This is a regression since 2.6.37-12

We had the reporter disable vesafb in case it was conflicting, but issue
persisted.

Our guess is it looks like nouveau is failing to find any acceptable modes.

[Original Description]
Latest kernel update rendered X unusable.

I tried both 2.6.38-2 and 2.6.38-1 kernels but it didn't help. It still shows
the progressive line of pixels.  gdm and the desktop actually load as I can
hear the Ubuntu tune if I type my password and hit enter but the video is
garbled and only a line of pixels towards the top of the screen can be seen.

2.6.37-12 works fine with no parameters and even some degree of video
acceleration.

DistroRelease: Ubuntu 11.04
Package: xorg 1:7.6~3ubuntu3
ProcVersionSignature: Ubuntu 2.6.38-1.28-generic 2.6.38-rc2
Uname: Linux 2.6.38-1-generic x86_64
Architecture: amd64
CompizPlugins: No value set for
`/apps/compiz-1/general/screen0/options/active_plugins'
DRM.card0.HDMI.A.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DRM.card0.LVDS.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
DRM.card0.VGA.1:
 status: disconnected
 enabled: disabled
 dpms: Off
 modes: 
 edid-base64:
Date: Sat Feb  5 13:52:32 2011
DistUpgraded: Yes, recently upgraded Log time: 2010-11-25 14:33:02.550411
DistroCodename: natty
DistroVariant: ubuntu
GraphicsCard:   Subsystem: Sony Corporation Device [104d:905e]
InstallationMedia: Ubuntu 10.04.1 LTS "Lucid Lynx" - Release amd64 (20100816.1)
MachineType: Sony Corporation VPCCW1FFX
ProcEnviron:
 PATH=(custom, no user)
 LANG=en_US.UTF-8ProcKernelCmdLine: BOOT_IMAGE=/boot/vmlinuz-2.6.38-1-generic
root=UUID=f415c990-a34d-451b-b69c-2070c5d53e47 ro nouveau.noaccel=1 quiet
splash vt.handoff=7
Renderer: Unknown
SourcePackage: xorg
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
version.compiz: compiz 1:0.9.2.1+glibmainloop4-0ubuntu9
version.libdrm2: libdrm2 2.4.23-1ubuntu3
version.libgl1-mesa-glx: libgl1-mesa-glx 7.10-1ubuntu1
version.xserver-xorg: xserver-xorg 1:7.6~3ubuntu3
version.xserver-xorg-video-ati: xserver-xorg-video-ati
1:6.13.2+git20110124.fadee040-0ubuntu4
version.xserver-xorg-video-intel: xserver-xorg-video-intel 2:2.14.0-1ubuntu6
version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau
1:0.0.16+git20110107+b795ca6e-0ubuntu4

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

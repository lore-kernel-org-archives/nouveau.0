From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35514] New: Black screen with nouveau on a GeForce
 8600M GT, either LiveCD or fresh install
Date: Mon, 21 Mar 2011 11:23:27 -0700 (PDT)
Message-ID: <bug-35514-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35514

           Summary: Black screen with nouveau on a GeForce 8600M GT,
                    either LiveCD or fresh install
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: high
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryce-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Forwarding this bug from Ubuntu reporter Mathieu Marquer:
http://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/713864

[Problem]
Black screen on boot; system otherwise seems to have loaded correctly.

[Original Description]
Using Ubuntu Natty up-to-date on a Dell Vostro 1500 with a GeForce 8600M GT
GPU. When I boot on the LiveCD or on a fresh install, nouveau seems to load
correctly but all I get is a black screen.

On the attached Xorg.log, the lines at 27.960 is when I press Ctrl+Alt+F1 to
see if I can get a tty (I still get a black screen), and 31.965 is when I
Ctrl+Alt+Del to reboot the computer.

Note that it kind of works when nVidia proprietary drivers are installed or
when I use nomodeset (it actually uses Vesa instead of Nouveau.

Please let me know if you need additional informations.

DistroRelease: Ubuntu 11.04
Package: xserver-xorg-video-nouveau 1:0.0.16+git20110107+b795ca6e-0ubuntu4
ProcVersionSignature: Ubuntu 2.6.38-1.28-generic 2.6.38-rc2
Uname: Linux 2.6.38-1-generic x86_64
Architecture: amd64
Date: Sun Feb  6 00:58:13 2011
DistUpgraded: Fresh install
DistroCodename: natty
DistroVariant: ubuntu
DkmsStatus: vboxhost, 4.0.2: added
GraphicsCard:   Subsystem: Dell Device [1028:0228]
InstallationMedia: Ubuntu 11.04 "Natty Narwhal" - Alpha amd64 (20110131)
MachineType: Dell Inc. Vostro 1500
ProcEnviron:
 LANGUAGE=fr_FR.UTF-8:fr:en_GB:en
 LANG=fr_FR.UTF-8
 LC_MESSAGES=fr_FR.utf8ProcKernelCmdLine:
BOOT_IMAGE=/boot/vmlinuz-2.6.38-1-generic
root=UUID=55a88c4e-93f6-4ba7-aeae-9104bddc2682 ro nomodeset
SourcePackage: xserver-xorg-video-nouveau
dmi.bios.date: 04/21/2008
dmi.bios.vendor: Dell Inc.
dmi.bios.version: A06
dmi.board.name: 0WY040
dmi.board.vendor: Dell Inc.
dmi.chassis.type: 8
dmi.chassis.vendor: Dell Inc.
dmi.modalias:
dmi:bvnDellInc.:bvrA06:bd04/21/2008:svnDellInc.:pnVostro1500:pvr:rvnDellInc.:rn0WY040:rvr:cvnDellInc.:ct8:cvr:
dmi.product.name: Vostro 1500
dmi.sys.vendor: Dell Inc.
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

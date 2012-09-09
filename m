From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] New: Distorted graphics (double cursor) with
 GeForce 4200Go (NV28)
Date: Sun, 09 Sep 2012 18:46:01 +0000
Message-ID: <bug-54700-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54700

             Bug #: 54700
           Summary: Distorted graphics (double cursor) with GeForce 4200Go
                    (NV28)
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: r.ductor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 66889
  --> https://bugs.freedesktop.org/attachment.cgi?id=66889
dmesg output

In a newly installed debian wheezy (no non-free nvidia drivers around) nouveau
gives distorted graphics with a Geforce 4200Go (Dell inspiron 8500), see png
attached. The mouse pointer is distorted and the desktop difficultly usable.

This bug has been reported in debian
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=686611
and might be related to 
https://bugs.freedesktop.org/show_bug.cgi?id=50403

The files I attach refer to

# cat /etc/X11/xorg.conf.d/98-me
Section "Device"
Identifier "Device0"
Driver "nouveau"
EndSection

and no other tricks, but I've also tried:

1) boot with nouveau.noaccel=1 in kernel line
   TTY and X badly screwed up

2) boot with nouveau.nofbaccel=1 in kernel line
   TTY badly screwed up, X distorted as in the plain case

3) boot with Option "NoAccel" "On"
X distorted

4) Booted with experimenta kernel
linux-image-3.5-trunk-686-pae   
Version: 3.5.2-1~experimental.1
black TTY and black X so I cannot document this.

-----Kernel version
# cat /proc/version
Linux version 3.2.0-3-686-pae (Debian 3.2.23-1)
(debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org) (gcc version 4.6.3 (Debian 4.6.3-8) ) #1 SMP
Mon Jul 23 03:50:34 UTC 2012

-----Nouveau version
# aptitude show xserver-xorg-video-nouveau
Package: xserver-xorg-video-nouveau      
State: installed
Automatically installed: yes
Version: 1:1.0.1-3
Priority: optional
Section: x11
Maintainer: Debian X Strike Force <debian-x-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
Architecture: i386
Uncompressed Size: 483 k
Depends: libc6 (>= 2.4), libdrm2 (>= 2.4.17), libudev0 (>= 146),
xorg-video-abi-12, xserver-xorg-core (>= 2:1.11.99.901)
Recommends: libgl1-mesa-dri (>= 7.11.1)
Provides: xorg-driver-video
Description: X.Org X server -- Nouveau display driver
 This driver for the X.Org X server (see xserver-xorg for a further
description) provides support for NVIDIA Riva, TNT,
 GeForce, and Quadro cards.                                                     

 This package provides 2D support including EXA acceleration, Xv and RandR.  3D
functionality is provided by the           
 libgl1-mesa-dri package.                                                       

 This package is built from the FreeDesktop.org xf86-video-nouveau driver.      
Homepage: http://nouveau.freedesktop.org/wiki/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

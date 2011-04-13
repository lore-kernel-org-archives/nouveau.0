From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36195] New: Nouveau hard-locks Xorg
Date: Tue, 12 Apr 2011 21:45:38 -0700 (PDT)
Message-ID: <bug-36195-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36195

           Summary: Nouveau hard-locks Xorg
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: kiyoshi.aman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

I've been attempting to package xf86-video-nouveau on
http://www.alpinelinux.org edge (which, though it's irrelevant, has entered a
feature freeze on main/* in preparation for 2.2). However, it freezes X for all
libdrm or xf86-video-nouveau snapshots tried. (Please note that Alpine Linux
uses uClibc, which may or may not be related to the problem.)

Combinations I've tried:

* latest git snapshot of libdrm, latest git snapshot of xf86-video-nouveau
* distro-supplied libdrm rebuilt with nouveau support enabled, latest git
snapshot of xf86-video-nouveau
* git snapshot of libdrm, Debian's
xserver-xorg-video-nouveau_0.0.16+git20101210+8bb8231 snapshot (minus their
patchset)
* distro-supplied libdrm rebuilt with nouveau support enabled, Debian's
xserver-xorg-video-nouveau_0.0.16+git20101210+8bb8231 snapshot (minus their
patchset)

In all cases, it freezes X solid (kill -9 won't even take it out), thereby
requiring a manual reboot.

Hardware:
AMD Sempron64 2600+, socket 754, in an nForce3-chipset motherboard
nVidia GeForce 6600 GT (NV43, rev a2)
1GB DDR RAM

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

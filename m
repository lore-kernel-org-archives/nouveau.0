From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40858] New: nForce Go 430 onboard GPU GeForce 6100
 Go (C51G) is not supported
Date: Wed, 14 Sep 2011 00:01:29 -0700 (PDT)
Message-ID: <bug-40858-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40858

           Summary: nForce Go 430 onboard GPU GeForce 6100 Go (C51G) is
                    not supported
           Product: xorg
           Version: 7.6
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: runetmember-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


nForce Go 430 onboard GPU GeForce 6100 Go (C51G) is not supported. After boot
with enabled nouveau driver screen is covered by graphical garbage/glithes. GPU
work fine with VESA driver (limited functional) and nVidia proprietary driver
(full functional).

Tested with Ubuntu 10.04, 10.10, 11.04, 11.10 Beta 2. Only VGA output tested
(because there is only VGA output on motherboard).
lspci: VGA compatible controller: nVidia Corporation C51G [GeForce 6100] (rev
a2)

I suspect the problem in power management support:
Sep 14 04:03:52 ubuntu kernel: [    5.910059] [drm] nouveau 0000:00:05.0: 3
available performance level(s)
Sep 14 04:03:52 ubuntu kernel: [    5.910063] [drm] nouveau 0000:00:05.0: 0:
memory 0MHz core 100MHz fanspeed 100%
Sep 14 04:03:52 ubuntu kernel: [    5.910067] [drm] nouveau 0000:00:05.0: 1:
memory 800MHz core 350MHz fanspeed 100%
Sep 14 04:03:52 ubuntu kernel: [    5.910070] [drm] nouveau 0000:00:05.0: 2:
memory 1000MHz core 425MHz fanspeed 100%
Sep 14 04:03:52 ubuntu kernel: [    5.910081] [drm] nouveau 0000:00:05.0: c:
memory 0MHz
Probably driver shouldn't set memory speed to 0 MHz, but maybe I mistake and
it's just placeholder for future power management support of this GPU. Anyway
kernel log (Ubuntu 11.10 Beta 2), vbios.rom (copied by dd) and mmiotrace
(created with nVidia 280.13 proprietary driver) attached.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

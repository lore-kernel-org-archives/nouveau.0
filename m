From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20309] New: Nouveau problem with setting screen
 resolution on a monitor connected to VGA output on Geforce 7050
Date: Wed, 25 Feb 2009 05:03:02 -0800 (PST)
Message-ID: <bug-20309-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=20309

           Summary: Nouveau problem with setting screen resolution on a
                    monitor connected to VGA output on Geforce 7050
           Product: xorg
           Version: 7.4
          Platform: Other
               URL: http://rafb.net/p/prrKfp36.html
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: a1ea0d8d6cb7-bnvEqEza/tSenpxAfqdfUOcKUUyq9jGW@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've tried to setup Nouveau with a dual screen configuration, but I haven't
been very successful doing that. I've connected two monitors to my onboard
Geforce 7050  PV graphics adapter (NV44), one through DVI the other through the
VGA connector. While the monitor connected through the DVI connector works fine
at its native 1920x1200 resolution, I'm not able to use the other one at its
native 1280x1024@60 Hz resolution. The only resolutions that work are 640x480
and 720x400. Maybe 320x240 as well, but that one is not supported by the
monitor (the monitor detects a signal but tells me, that the resolution is not
supported).

The system is an Arch Linux 64 Bit machine running Xorg X Server 1.5.3 on an
ASRock mainboard with the Geforce 7050 PV chipset, a Athlon 4850e CPU and 8 GB
of RAM.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

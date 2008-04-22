From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15650] New: Hard freeze when starting X with GeForce
 6800 GS (NV43)
Date: Tue, 22 Apr 2008 07:12:14 -0700 (PDT)
Message-ID: <bug-15650-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15650

           Summary: Hard freeze when starting X with GeForce 6800 GS (NV43)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: amcnabb-2BOxfIlzoBpAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=16099)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16099)
xorg.conf

I installed Fedora Rawhide, which included the package
xorg-x11-drv-nouveau-0.0.10-2.20080408git0991281.fc9.x86_64.  When starting X,
the mouse cursor appears in the middle of the screen, and then the machine
freezes.  It's not just X that freezes; the computer is no longer reachable
over the network.

This is my first time trying Nouveau, so I'm not sure which information is most
helpful, but I'll attach Xorg.0.log and xorg.conf.  Here is the information
about the card from `lspci -v`:

05:00.0 VGA compatible controller: nVidia Corporation NV43 [GeForce 6800 GS]
(rev a2) (prog-if 00 [VGA controller])
        Subsystem: XFX Pine Group Inc. XFX GeForce 6800 XTreme 256MB DDR3 AGP
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 11
        Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d0000000 (32-bit, prefetchable) [size=256M]
        Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Expansion ROM at feae0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel modules: nvidiafb


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

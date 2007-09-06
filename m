From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12300] New: DMA queue hang (Quadro FX 4500)
Date: Thu,  6 Sep 2007 05:36:40 -0700 (PDT)
Message-ID: <bug-12300-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12300

           Summary: DMA queue hang (Quadro FX 4500)
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dmitry.platonov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Gentoo linux
randr-1.2 nouveau branch
NVidia Quadro FX 4500
-------------------------------
40:00.0 VGA compatible controller: nVidia Corporation G70GL [Quadro FX 4500]
(rev a1) (prog-if 00 [VGA])
        Subsystem: nVidia Corporation Unknown device 02af
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at d1000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d2000000 (64-bit, non-prefetchable) [size=16M]
        I/O ports at 1000 [size=128]
        [virtual] Expansion ROM at d0000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
        Capabilities: [78] Express Endpoint IRQ 0
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting
-------------------------------
X output:

(==) Using config file: "/etc/X11/xorg.conf"
DCB size is 19, entries is 0A
(II) Module already built-in
(II) Module already built-in
(II) Module already built-in
crtc 0 1600 1600
writting vpll 00020601
writting vpll2 00000000
output 0 debug_0 01141191
savep->dither 00070000
1: crtc 0 output0: 0000: twocrt 0 twomon 0
(EE) AIGLX error: drmMap of framebuffer failed (Invalid argument)(EE) AIGLX:
reverting to software rendering

Fatal server error:
DMA queue hang: dmaPut=1ff6, current=0, status=0

writting vpll 00031805
writting vpll2 00050D02
writting vpll 00031805
writting vpll2 00050D02


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

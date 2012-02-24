From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] New: nouveau: nv40 display corruption in
 framebuffer and X lockups unless nouveau.noaccel=1
Date: Fri, 24 Feb 2012 06:13:18 +0000
Message-ID: <bug-46557-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46557

             Bug #: 46557
           Summary: nouveau: nv40 display corruption in framebuffer and X
                    lockups unless nouveau.noaccel=1
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: salah.coronya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 57574
  --> https://bugs.freedesktop.org/attachment.cgi?id=57574
live dmesg before X was started

When I start nouveau with 2D acceleration the framebuffer is unusable
(typically displays frozen contents of the last shutdown), but the keyboard is
responsive. Once X starts, the display is unreadable - anything to a tiled
staircase picture to a partially solid grey screen, with no mouse cursor, and
the keyboard locks up - no responsive from the caps/num/scroll locks keys,
however it DOES respond to Magic SysRQ. The machine itself doesn't seem hard
locked, though.

The syslog is spammed with tons of message from the nouveau driver complaining
about PFIFO_CACHE_ERROR, PFIFO_DMA_PUSHER: MEM_FAULT, INVALID_CMD,
CALL_SUBR_ACTIVE, etc  - varies wildly on each boot. Sometimes its only few
errors, sometimes tons of them, but the end result is the same. 

Tried with the nouveau git tree on freedesktop 2/23. using nouveau.nofbaccel=1
clears up the framebuffer corruption, but the X display corruption/lockups
still happen

Display adapter: 

00:05.0 VGA compatible controller: nVidia Corporation C51 [GeForce 6150 LE]
(rev a2) (prog-if 00 [VGA controller])
    Subsystem: Hewlett-Packard Company Device 2a34
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at fb000000 (64-bit, non-prefetchable) [size=16M]
    [virtual] Expansion ROM at c0000000 [disabled] [size=128K]
    Capabilities: [48] Power Management version 2
        Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
        Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
    Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
        Address: 0000000000000000  Data: 0000
    Kernel driver in use: nouveau
    Kernel modules: nouveau

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

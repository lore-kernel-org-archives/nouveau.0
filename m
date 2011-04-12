From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36174] New: Xorg crashing in nv44 card in 3D apps
Date: Tue, 12 Apr 2011 09:41:27 -0700 (PDT)
Message-ID: <bug-36174-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36174

           Summary: Xorg crashing in nv44 card in 3D apps
           Product: Mesa
           Version: 7.10
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: a.radke-KvP5wT2u2U0@public.gmane.org


Created an attachment (id=45543)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=45543)
Xorg.0.log

Since kernel 2.6.38 and Mesa 7.10 I'm running into almost complete Xorg crashes
and sometimes even kernel unresponsiveness. First I noticed it in remote FreeNX
sessions (that use 2D hardware acceleration of nouveau-dri?) and can reproduce
it now easily every time running lincity simulation and starting supertuxkart
as a 2nd app. Xorg almost immediately crashes.

01:00.0 VGA compatible controller: nVidia Corporation NV44 [GeForce 6200
TurboCache(TM)] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: LeadTek Research Inc. Device 56c4
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at f9000000 (64-bit, non-prefetchable) [size=16M]
    Expansion ROM at fb000000 [disabled] [size=128K]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb

attaching Xorg.0.log and system log with lots of error messages.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

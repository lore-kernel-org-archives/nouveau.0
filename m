From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11949] New: composite broken on nv17
Date: Sat, 11 Aug 2007 05:49:25 -0700 (PDT)
Message-ID: <bug-11949-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11949

           Summary: composite broken on nv17
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: castet.matthieu-GANU6spQydw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

in EXA mode with nv17, composite extension is enabled by default. This result
in fifo hang. [1]

The hang happen in the NVComposite function.
Removing composite hook fix the problem.


PS : xv blitter that use the same object (NvScaledImage) works fine.

[1]
[21066.819064] [drm] NV: PGRAPH context switch interrupt channel 1
[21066.819078] [drm] NV: PGRAPH context switch interrupt channel 0 -> 1
[21125.044376] [drm:nouveau_pgraph_irq_handler] *ERROR* NV: PGRAPH error
interrupt
[21125.044389] [drm:nouveau_pgraph_irq_handler] *ERROR* nsource:0x00000800    
nstatus:0x01000000
[21125.044394] [drm:nouveau_pgraph_irq_handler] *ERROR* instance:0x000011cf
[21125.044400] [drm:nouveau_graph_dump_trap_info] *ERROR* nSource:
STATE_INVALID, nStatus: INVALID_STATE
[21125.044409] [drm:nouveau_graph_dump_trap_info] *ERROR* NV: Channel 1/0
(class 0x0089) - Method 0x040c, Data 0x00000000


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

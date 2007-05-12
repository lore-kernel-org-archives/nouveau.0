From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10924] New: XAA crash on NV17
Date: Sat, 12 May 2007 02:16:58 -0700 (PDT)
Message-ID: <bug-10924-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10924

           Summary: XAA crash on NV17
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


When using XAA mode, if I open a xterm, the X crash because of a PGRAPH error.
It seems related to 
RECT_EXPAND_TWO_COLOR_DATA.



May 11 23:48:11 localhost kernel: [16461.792975]
[drm:nouveau_pgraph_irq_handler
] *ERROR* NV: PGRAPH error interrupt
May 11 23:48:11 localhost kernel: [16461.792988]
[drm:nouveau_pgraph_irq_handler
] *ERROR* nsource:0x00000800^Instatus:0x01000000
May 11 23:48:11 localhost kernel: [16461.792993]
[drm:nouveau_pgraph_irq_handler
] *ERROR* instance:0x000011c8
May 11 23:48:11 localhost kernel: [16461.792999]
[drm:nouveau_graph_dump_trap_in
fo] *ERROR* NV: nSource: 0x00000800, nStatus: 0x01000000
May 11 23:48:11 localhost kernel: [16461.793005]
[drm:nouveau_graph_dump_trap_in
fo] *ERROR* NV: Channel 0/1 (class 0x804a) -Method 0x0c00, Data 0x00000000


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

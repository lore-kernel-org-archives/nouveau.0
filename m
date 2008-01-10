From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14010] New: TNT2 generate too much noise in logs
Date: Thu, 10 Jan 2008 09:30:54 -0800 (PST)
Message-ID: <bug-14010-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14010

           Summary: TNT2 generate too much noise in logs
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


xserver git e070c2cbef0d6fbbafce8d417e8b29231c2fdc50
drm git 5f15f317fb304f6a2321c033d401f603b365f2d0
xf86-video-nouveau 31b1a894079ca3983d17ac7a81d6ecd420f7d377
kernel 2.6.23.13 from kernel.org
Window manager - E 0.16.8.11-001
additional software: gkrellm 2.3.0 running in background

hw:

lspci -v
01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15) (prog-if 00 [VGA])
        Subsystem: ASUSTeK Computer Inc. AGP-V3800PRO
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at da000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0

lspci -vn
01:00.0 0300: 10de:0028 (rev 15) (prog-if 00 [VGA])
        Subsystem: 1043:4000
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 19
        Memory at de000000 (32-bit, non-prefetchable) [size=16M]
        Memory at da000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at dfef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0

During normal usage my /var/log/messages grow very quickly, and can eat 300mb+
in few hours.

Log full with messages like 

[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d01da
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d0006
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d01da
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d0006
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d01da
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d0006
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d00de
[drm] PGRAPH_NOTIFY - nSource: STATE_INVALID, nStatus: INVALID_STATE
PROTECTION_FAULT
[drm] PGRAPH_NOTIFY - Ch 1/4 Class 0x005f Mthd 0x0308 Data
0x0001e83c:0x000d0006

i will add last 1000 lines from just X start. This card doesn't work in randr12
mode, but this is separate issue.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

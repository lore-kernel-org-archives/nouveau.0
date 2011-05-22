From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37445] New: Nouveau regulary reports the TRAP_VFETCH
 FAULT errors.
Date: Sat, 21 May 2011 17:31:01 -0700 (PDT)
Message-ID: <bug-37445-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37445

           Summary: Nouveau regulary reports the TRAP_VFETCH FAULT errors.
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org


Like this:


 9714.987179] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[ 9714.987203] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000
0000fe0c 00000000 00000000
[ 9714.987219] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[ 9714.987234] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000770a000) subc 5
class 0x8297 mthd 0x15f0 data 0x00000000
[ 9714.987265] [drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on
ch 5 [0x0000770a] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
[ 9714.987301] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[ 9714.987320] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000
0000fe0c 00000000 00000000
[ 9714.987336] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[ 9714.987350] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000770a000) subc 5
class 0x8297 mthd 0x15f0 data 0x09000936
[ 9714.987376] [drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on
ch 5 [0x0000770a] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
[ 9714.987411] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[ 9714.987429] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000
0000fe0c 00000000 00000000
[ 9714.987445] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[ 9714.987461] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000770a000) subc 5
class 0x8297 mthd 0x15f0 data 0x00000013
[ 9714.987497] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[ 9714.987516] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000
0000fe0c 00000000 00000000
[ 9714.987532] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[ 9714.987546] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000770a000) subc 5
class 0x8297 mthd 0x15f0 data 0x32212121
[ 9714.987577] [drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on
ch 5 [0x0000770a] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT

Not sure if that can cause a lockup, but sure a clue, so I keep this in a
bugreport.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

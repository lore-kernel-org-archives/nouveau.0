From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37243] New: Resume STR or STD,
	black & white stripes & dots.
Date: Sun, 15 May 2011 20:44:35 -0700 (PDT)
Message-ID: <bug-37243-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37243

           Summary: Resume STR or STD, black & white stripes & dots.
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bryce2-b4dvK1Jd0NvqlBn2x/YWAg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


System:

Linux bnesbitt-desktop 2.6.32-31-generic #61-Ubuntu SMP Fri Apr 8 18:24:35 UTC
2011 i686 GNU/Linux
Shuttle SN41 nForce2

Error log snippet:

May 15 19:27:25 bnesbitt-desktop kernel: 986.776362] [drm] nouveau
0000:03:00.0: AIII, invalid/inactive channel id 32
May 15 19:27:25 bnesbitt-desktop kernel: <el id 32
May 15 19:27:36 bnesbitt-desktop kernel: ] [drm] nouveau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:27:38 bnesbitt-desktop kernel: veau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:27:38 bnesbitt-desktop kernel: <m] nouveau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:27:38 bnesbitt-desktop kernel: <:03:00.0: AIII, invalid/inactive
channel id 32
May 15 19:28:02 bnesbitt-desktop kernel: </inactive channel id 32
May 15 19:28:17 bnesbitt-desktop kernel: 0271] [drm] nouveau 0000:03:00.0:
AIII, invalid/inactive channel id 32
May 15 19:28:24 bnesbitt-desktop kernel: <active channel id 32
May 15 19:28:32 bnesbitt-desktop kernel: AIII, invalid/inactive channel id 32
May 15 19:28:35 bnesbitt-desktop kernel: <3tive channel id 32
May 15 19:28:42 bnesbitt-desktop kernel: ] nouveau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:28:47 bnesbitt-desktop kernel: <3] [drm] nouveau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:28:52 bnesbitt-desktop kernel: 7074.217800] [drm] nouveau
0000:03:00.0: AIII, invalid/inactive channel id 32
May 15 19:28:54 bnesbitt-desktop kernel: <3uveau 0000:03:00.0: AIII,
invalid/inactive channel id 32
May 15 19:28:57 bnesbitt-desktop kernel: [ 7078.948004] __ratelimit: 205874
callbacks suppressed
May 15 19:28:57 bnesbitt-desktop kernel: [ 7078.948007] [drm] nouveau
0000:03:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May 15 19:28:57 bnesbitt-desktop kernel: [ 7078.948014] [drm] nouveau
0000:03:00.0: PGRAPH_ERROR - Ch -1/3 Class 0x0000 Mthd 0x0d78 Data
0x00000000:0x00000000
May 15 19:28:57 bnesbitt-desktop kernel: [ 7078.948031] [drm] nouveau
0000:03:00.0: PGRAPH_ERROR - nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
May 15 19:28:57 bnesbitt-desktop kernel: [ 7078.948038] [drm] nouveau
0000:03:00.0: PGRAPH_ERROR - Ch -1/3 Class 0x0000 Mthd 0x0d7c Data
0x00000000:0x00000000


See also Bug #37039

After resume, the machine staggers up, but is unresponsive to CTRL-ALT-F1,
CTRL-ALT-BKSP etc.  Eventually it falls into a twisted lump and must be
rebooted.


----

Proprietary nVideo drivers WERE NOT installed.  I will install them to see if
it gets better.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

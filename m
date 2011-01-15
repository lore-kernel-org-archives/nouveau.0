From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33159] New: Lock up on GeForce 9600 GT
Date: Sat, 15 Jan 2011 09:36:11 -0800 (PST)
Message-ID: <bug-33159-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33159

           Summary: Lock up on GeForce 9600 GT
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: krange-sjIhS0o/hVU@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I am running OpenSUSE 11.4M5 on an AMD64 machine with a GeForce 9600 GT.  The
kernel is 2.6.37-rc5 and the nouveau driver version is 0.0.16_20101010_8c8f15c
(apparently).

Right before the lock up /var/log/messages contains:

Jan 15 12:02:17 krange kernel: [777811.035641] [drm] nouveau 0000:07:00.0:
PGRAPH_TRAP - Ch 2/5 Class 0x8297 Mthd 0x0f04 Data 0x00000000:0x00000000
Jan 15 12:02:17 krange kernel: [777811.035652] [drm] nouveau 0000:07:00.0:
PGRAPH_TRAP_CCACHE_FAULT - VM: Trapped read at 0040822000 status 00000560
channel 2 (0x000007a0)
Jan 15 12:02:17 krange kernel: [777811.035661] [drm] nouveau 0000:07:00.0:
PGRAPH_TRAP_CCACHE_FAULT - 00000000 00000000 00000000 00000000 00000000
00000000 00000000


This may be similar to bug #30307

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

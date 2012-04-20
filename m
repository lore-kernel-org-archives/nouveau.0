From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48954] New: nv25 PGRAPH error and X freeze
Date: Fri, 20 Apr 2012 09:25:59 +0000
Message-ID: <bug-48954-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48954

             Bug #: 48954
           Summary: nv25 PGRAPH error and X freeze
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: noviktor-9Vj9tDbzfuSlVyrhU4qvOw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 60373
  --> https://bugs.freedesktop.org/attachment.cgi?id=60373
Kernel log from boot to error on nv25

I am running nouveau git kernel 3.4.0-rc2-g965a47f, xf86-video-nouveau ver.
fb3a36b and xorg-server 1.12.0 on nv25 card and I am getting PGRAPH erros

nouveau 0000:01:00.0: PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
PROTECTION_FAULT
nouveau 0000:01:00.0: PGRAPH - ch 1/4 class 0x009f mthd 0x0308 data 0x00240771

X then freezes but ssh or SysRq works. Additionally some icons on Gnome 3
fall-back mode have white rectangle in background instead of being transparent.
Didn't happen before libdrm rewrite.
Fastest way to reproduce seems to be right clicking to open pop-up menu or
opening drop-down selections - error happens in a few attempts.
On nv11 it seems not to crash, but some icons still have white background.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

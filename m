From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15164] New: PTIMER broken in DRM (regression)
Date: Fri, 21 Mar 2008 15:16:18 -0700 (PDT)
Message-ID: <bug-15164-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15164

           Summary: PTIMER broken in DRM (regression)
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


The commit 1021799b6ca6b195ad2d5f002e45668f69c44651 in DRM,
http://gitweb.freedesktop.org/?p=mesa/drm.git;a=commit;h=1021799b6ca6b195ad2d5f002e45668f69c44651
"nouveau: do not set on-board timer's numerator/denominator to bad values"
breaks my nv20 (gf3) card.

When starting X, mode is set, I get a screen with colorful garbage on top,
black&white noise on the bottom, and black in the middle for couple of seconds
during which mouse cursor moves fine. Then I'm back in text console with a
kernel gone out to lunch.

There are two problems:
1. the mentioned commit apparently also breaks PTIMER, and
2. nouveau_fifo_free() uses PTIMER for a timeout, which will never happen,
hence the kernel becomes a zombie.

While the kernel is a zombie, I can SysRq tErminate, after which I can SysRq
show Program counter, which says it is in nouveau_fifo_free. All I can do is
SysRq reBoot.

Reverting the mentioned commit fixes the problem 1, and consequently the
problem 2. does not trigger.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16911] New: xserver EXA optimization causes nv31 to
	crash
Date: Wed, 30 Jul 2008 16:03:46 -0700 (PDT)
Message-ID: <bug-16911-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16911

           Summary: xserver EXA optimization causes nv31 to crash
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=18015)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=18015)
Kernel log

Following the commit of a3afa6f2fb80489f7b6a88d12def09281d32ed94 "EXA: Optimize
GXcopy tiled fills." to the xserver, the nouveau driver (git HEAD of both ddx
and drm) will crash on certain webpages, with

[drm] PGRAPH_ERROR - nSource: LIMIT_COLOR, nStatus: PROTECTION_FAULT
[drm] PGRAPH_ERROR - Ch 1/6 Class 0x009f Mthd 0x0308 Data 0x00000003:0x00f304f8

in the kernel log and a fifo lockup in the ddx log -- both attached. A simple
reproducible case is using Firefox (2.0.0.16) on
http://people.freedesktop.org/~stuart/pgraph_limit_color/crash.html
Going back to the previous xserver commit "EXA: Replace open coded CopyArea
logic with GC op call.", the page does not cause the driver error, nor a crash.

black.png used in the page was simply created in the GIMP using a new image and
a bucket fill. I suspect the size of the background image is a factor, as tests
using a 200x200 PNG did not crash.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20144] New: 2D images broken on nv28 (EXA failure?)
Date: Mon, 16 Feb 2009 11:43:45 -0800 (PST)
Message-ID: <bug-20144-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20144

           Summary: 2D images broken on nv28 (EXA failure?)
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=22992)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22992)
Screencapture of broken 2D

bisected:
d97e993072dc773ecfeb80b5e138b5e4598a1c3d is first bad commit
"exa: preparation for reintroducing driver-controlled pixmaps"

As you see from the screen capture, which oddly enough looks just like what I
saw with my eyes, the 2d rendering is quite broken. More specifcally, pixmap
handling, it seems. I should have a nice background picture, and only one aterm
window drawn. There really is just one aterm, I moved it a few times.

With commit 60c8bb1391a51188a4981b4936c190c149b79b7f "default to autodetecting
whether to enable the driver's kms paths", I tried to disable UTS, DFS and EXA
render, but none of them changed anything.

Currently I'm running happily with commit
1e00c7d1e6edb7f6b4e6d12ef227d27413948f8f "shadowfb: clip copied regions to
frontbuffer size.".


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

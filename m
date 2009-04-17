From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21257] New: Qt applications strange behavior
Date: Fri, 17 Apr 2009 11:22:06 -0700 (PDT)
Message-ID: <bug-21257-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21257

           Summary: Qt applications strange behavior
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello,

I'm having a problem with Qt applications and nouveau. I filled a bug in kde
(4.2.2) for some drawing problems. However, as it occurs also with virtualbox,
I think this might be related to nouveau with Qt.

I use updated nouveau git + drm git without 3d. Alfter some time, plasma and
virtualbox, independently, stops to draw some parts randomly. For example, when
I pass the mouse over icons, they disapear and reapear (maybe reapers using
cache image).

If I kill plasma or vbox and open it again, it works for some time before the
same problem reocurs. This happens also with other kde aplications like
kterminal.

I also tested with nv without being able to reproduce the problem.

For plasma I got a lot of this error:

QPainter::begin: Paint device returned engine == 0, type: 3                     
QPainter::setCompositionMode: Painter not active    
QPainter::end: Painter not active, aborted                                      

I also reported this in:
https://bugs.kde.org/show_bug.cgi?id=189059

PS: I'm not attaching the kernel log as it has only the normal startup info.
Do I need to attach "drm+debug" ?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

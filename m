From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51207] New: Background corruption in Firefox w/ cairo
Date: Mon, 18 Jun 2012 15:44:09 +0000
Message-ID: <bug-51207-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51207

             Bug #: 51207
           Summary: Background corruption in Firefox w/ cairo
    Classification: Unclassified
           Product: Mesa
           Version: 8.0
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: n.t.koopman-TNUcmE4EBc2sTnJN9+BGXg@public.gmane.org


Created attachment 63180
  --> https://bugs.freedesktop.org/attachment.cgi?id=63180
dmesg output

Using Firefox with the Cairo backend and nouveau drivers sometimes produces
incorrect backgrounds. This does not happen on many websites, but if it happens
it is always reproducible.

Switching to Firefox without cairo, or using the nVidia proprietary drivers
'solves' the problem. 

This is all on ArchLinux, with nouveau 8.0.3.

Some screenshots (taken from
https://bbs.archlinux.org/viewtopic.php?id=142457):
incorrect:
https://picasaweb.google.com/111265856557370928577/Firefox#5748743925544931010
correct:
https://lh5.googleusercontent.com/-irizSJzvgvw/T8ekPXHk2nI/AAAAAAAAArg/iUOy2zqq6Lw/s800/correct.jpg

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

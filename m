From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49786] New: In xterm,
 some rectangles are not redrawn when the window is partly covered
Date: Fri, 11 May 2012 10:25:56 +0000
Message-ID: <bug-49786-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49786

             Bug #: 49786
           Summary: In xterm, some rectangles are not redrawn when the
                    window is partly covered
    Classification: Unclassified
           Product: xorg
           Version: 7.6 (2010.12)
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 61438
  --> https://bugs.freedesktop.org/attachment.cgi?id=61438
file "text" used in the command to reproduce the bug

When an xterm window is partly covered by another window, not everything is
redrawn. The problem can be reproduced in the following way (this is tested on
a Debian/unstable machine). Run the following command:

$ xterm -geometry 80x60 -e 'sleep 10; cat text; sleep 999'

(with the file "text" that will be attached), then put a smaller window
covering the middle of the right part, and wait for the text (after "sleep 10"
terminates).

I'll also attach 2 snapshots showing the problem: the first one being what I
obtain after the above steps (corrupt output), the second one being what I
obtain after a full redraw (the correct output), e.g. when switching the
desktop and going back (one can also move a window over the xterm window).

The corresponding Debian bug report:

  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=640464

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

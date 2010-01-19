From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26108] New: xrandr rotate causes a segfault with
 HWCursor set to false
Date: Mon, 18 Jan 2010 17:09:39 -0800 (PST)
Message-ID: <bug-26108-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26108

           Summary: xrandr rotate causes a segfault with HWCursor set to
                    false
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: drewfrank-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32706)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32706)
Xorg.0.log after attempted rotate and crash.

OVERVIEW

On my dual-monitor setup, if HWCursor is set to false in the xorg.conf file
then attemtps to rotate one or both screens with xrandr result in segfaults.

STEPS TO REPRODUCE

Add 
"Option" "HWCursor" "false" 
to xorg.conf and restart X.  Then, attempt to rotate a screen using
xrandr --output VGA-1 --rotate left

ACTUAL RESULTS

X segfaults.  Computer is completely unresponsive, so a hard reboot is
necessary.

EXPECTED RESULTS

A nicely rotated screen.

Build Date & Platform:

Nouveau driver built from the Git repo on 2010-01-13, running on 32-bit Arch
Linux.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

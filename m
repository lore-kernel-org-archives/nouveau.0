From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23466] New: xrandr --rotate normal crashes system
Date: Sat, 22 Aug 2009 11:18:33 -0700 (PDT)
Message-ID: <bug-23466-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23466

           Summary: xrandr --rotate normal crashes system
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=28853)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=28853)
The Xorg.0.log with ModeDebug on

I'm running all-git versions of X components. I can xrandr --rotate left,right
and inverted. The problem is when rotating back to normal.

If the display is rotated "inverted", issuing "xrandr --output LVDS-0 --rotate
normal" leads to a black screen or a console (VT1 for instance) painted screen.
Moving the mouse around paints the X display contents where it passes. If I
change VT to a console and then back, everythings goes back to normal.

If the display is rotated either "left" or "right", issuing "xrandr --output
LVDS-0 --rotate normal" seems to crash the system. I get no more log entries,
not even when SysRq sync'ing. But I can SysRq reboot.

I've made some tests with Option "ModeDebug" "on". I'll attach both the
Xorg.0.log and the relevant part of the system log.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

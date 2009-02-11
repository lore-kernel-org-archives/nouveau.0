From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20066] New: slowness in gnome-terminal
Date: Wed, 11 Feb 2009 10:19:33 -0800 (PST)
Message-ID: <bug-20066-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20066

           Summary: slowness in gnome-terminal
           Product: xorg
           Version: 7.4
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: debian-E6TheL+NHo3k1uMJSBkQmQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Nouveau is generally fast but not when it comes to gnome-terminal.

Things like opening a new tab, maximizing the window, restoring its size,
switching to a desktop with a gnome-terminal on it... take a couple of seconds.

The more the window is big, the more it's slow.

But it disappears when the gnome-terminal is minimized (reduced in the
taskbar). Switching desktops is then instantaneous.

The worst is when I maximize it vertically and then open a new tab. X seems
like frozen, thought I can still move the mouse but clicking has no effect.

It doesn't happen with xterm, so I guess gnome-terminal is using rendering
paths that are not accelerated in nouveau.

The card is a 8400M GS plugged to a 1280x800 LVDS, without any external screen.

As accidentally discovered with bug #20065, it doesn't happen in ShadowFB
NoAccel mode.

I'm quite puzzled about what information I could give you now. Or maybe the bug
is know and this bug will remain open until it's fixed.

Regards


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

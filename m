From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41588] New: connected DVI output dies after
 suspend/resume occasionally.
Date: Sat,  8 Oct 2011 07:29:17 -0700 (PDT)
Message-ID: <bug-41588-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41588

           Summary: connected DVI output dies after suspend/resume
                    occasionally.
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=52120)
 View: https://bugs.freedesktop.org/attachment.cgi?id=52120
 Review: https://bugs.freedesktop.org/review?bug=41588&attachment=52120

disable hotplug polling while in suspend

Just like summary says, to reproduce just attach external monitor via DVI
(other inputs should cause same problem) suspend/resume.

On resume you see black/white stripes on internal screen (LVDS) and external
monitor is on standby.
If you then disconnect external monitor and suspend again, on resume often the
desktop's screen doesn't come back ether.
Happens with and without compiz, with and without pageflipping enabled.

However I found what triggers the problem. kernel driver doesn't disable output
polling during suspend so once in a while, it polls the port while whole card
is disabled and logically doesn't detect anything connected.
Then on resume it detects the monitor again, and that triggers the bug.
Of course this should be fixed, and patch to do so will be attached here.

However, its still possible to reproduce same bug, with 100% probability, by
doing:

1. ensure you don't have apps that listen to hotplug events and reconfigure the
screen. KDE sadly is belongs here.

2. connect external monitor, and activate an output on it using xrandr (side by
side screens) aka:
xrandr --output DVI-I-1 --auto --left-of LVDS-1

3. suspend the system

4. while system suspended, disconnect the monitor

5. resume the system, and note that screen configuration didn't change, because
no apps listen to hotplug events. Yet, if you connect the DVI screen now, it
won't activate. don't connect it though yet.

7. suspend system

8. connect monitor

9. resume system, and see the problem.

10. if you also run compiz and try to rotate screen, enjoy hung compiz. Dunno
why.


Yet though, the above sequence of events is unlikely to happen while using the
system, thus patch to stop hotplug detection while in suspend is enough for me
to use external monitor safely.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

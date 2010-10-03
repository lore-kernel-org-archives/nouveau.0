From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30589] New: Dual screen connected with VGA works,
 but not with DVI on G94 [GeForce 9600GT]
Date: Sun,  3 Oct 2010 11:30:49 -0700 (PDT)
Message-ID: <bug-30589-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30589

           Summary: Dual screen connected with VGA works, but not with DVI
                    on G94 [GeForce 9600GT]
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: diego.abelenda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=39139)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=39139)
Both monitors are connected via DVI after a fresh reboot

When connecting my two identical Acer monitors with their VGA input (using a
DVI-to-VGA adapter) the dual screen works and xrandr is capable of changing the
resolution of both monitors independently.

But when connecting both screens to DVI-I input one monitor stays black saying
"no signal" even if xrandr says that the screen is connected and at native
resolution.

It seems that the video= option affects this, and changes the behavior when one
monitor is connected to VGA while the other is connected to DVI input. If the
option "video=DVI-I-x:1920x1080eD" is passed for both screens (DVI-I-1 and
DVI-I-2) only the VGA one shows something while we expect only the DVI one to
work and not the VGA (as stated here : ) . If no option is passed both work as
expected.

EDID are parsed correctly and monitors are detected correctly as will be shown
in the multiple xrandr outputs that will follow.

As discussed on IRC it is impossible to force the subconnector with xrandr so
we can't test this way. But anyway the sub-connectors are selected correctly.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

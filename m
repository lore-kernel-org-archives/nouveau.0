From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40502] New: Ability to assign arbitrary CRTC to an
 output is broken
Date: Tue, 30 Aug 2011 18:13:03 -0700 (PDT)
Message-ID: <bug-40502-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40502

           Summary: Ability to assign arbitrary CRTC to an output is
                    broken
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I am assigning that bug to nouveau DDX, although I really won't be surprised if
that is xserver or even kernel driver bug.

I have two CRTCs (CRTC0 and CRTC1) (most modern cards have such number)

I would like to assign CRTC1 to laptop screen, so I do this:

xrandr --output LVDS-1 --auto --crtc 1

Screen does blink however doing 'xrandr --verbose' still tells me that LVDS-1
uses CRTC0.
I can repeat that command again and again.
If I enable kernel modesetting debug, I notice that LVDS-1 is connected once to
CRTC0 and once to CRTC1 (on each invocation of 'xrandr' they change places),
and it does succedd, leading me to beliving that on kernel level everything is
fine.
However on higher level something is really broken, as xrand insists that
LVDS-1 connected to CRTC0, not to mention that such toggle of CRTCs shouln't
take place as I told explicitly I want to use crtc1.

This is preparation of hunt for bug that causes external connected monitor to
go dark after suspend and resume cycle sometimes, then if I disconnect it, even
nastier problem happends, the notebook screen goes dark as well, a thing that
makes me suspect that one of CRTCs goes tits up.
So I need a ability to control which CRTC is used.


I am using very recent versions (from git actually) of everything related to
GFX stack, although not everything is up to date, like for example xrand
library.

I think I will be able to handle that bug on my own, although if you have seen
anything related, or maybe even fact that this is known, please tell me.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

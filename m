From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26102] New: Rotating one monitor of a dual-head
 setup causes cursor problems
Date: Mon, 18 Jan 2010 10:18:12 -0800 (PST)
Message-ID: <bug-26102-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26102

           Summary: Rotating one monitor of a dual-head setup causes cursor
                    problems
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


OVERVIEW

Rotating either of my two monitors using xrandr 1.2 causes problems with the
cursor:

1) The cursor fails to rotate along with the rest of the screen.
2) The "click point" is shifted relative to the cursor by about 40 pixels.
i.e., after "xrandr --output VGA-1 --rotate left" all mouse clicks affect the
screen element approximately 40 pixels to the left of the visible cursor.
3) The region over which the cursor is allowed to move is not aligned with the
edges of the screen.  Again after rotating the screen left, the cursor appears
to hit a wall about 40 pixels from the left edge of the screen.  The cursor can
also move beyond the right edge of the screen.

STEPS TO REPRODUCE

Set up nouveau with 2 monitors.  Use xrandr to rotate one of them, then move
the mouse around.

ACTUAL RESULTS

The problems described in the overview.

EXPECTED RESULTS

The cursor should rotate along with the screen, clicks should be sent to the
point directly under the cursor, and the cursor's range of motion should be
bounded by the screen edges.

BUILD DATE & PLATFORM

I am running Arch Linux with nouveau built from git on 2010-01-13.  My video
card is the GeForce 9500 GT.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

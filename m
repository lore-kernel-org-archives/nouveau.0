From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] New: External analog monitor does not show
 part of the output ( Randr12)
Date: Thu,  6 Mar 2008 11:56:12 -0800 (PST)
Message-ID: <bug-14859-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14859

           Summary: External analog monitor does not show part of the output
                    (Randr12)
           Product: xorg
           Version: unspecified
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: sbriglie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14885)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14885)
xrandr --verbose output (with monitor connected and working)

Whenever I plug an external analog (VGA) monitor to my 12 inches Apple
powerbook I can see with xrandr that it is correctly recognized. When I turn it
on with xrandr --auto my desktop appears on the external monitor (mirroring) in
full height (768), but on the left the first 290 or so pixels out of 1024 are
black and the same happens to the last 16 on the right. This same behavior
happens with two different monitors.
Image quality is excellent and there's no distortion or stretching whatsoever,
the pixels are just plainly black. To give an ascii-art idea:

xxxxxooooooooooox
xxxxxooooooooooox
xxxxxooooooooooox
xxxxxooooooooooox
xxxxxooooooooooox
xxxxxooooooooooox

x are black, o are ok (proportions are of course not respected :))

Trying to change the resolution doesn't give a different behavior. I'm
attaching a xorg.log and the output of xrandr --verbose

This happens with git head for both ddx and drm, xorg server
1.4.1~git20080131-1 (debian package) and libxrandr2 1.2.2-1 on debian lenny ppc


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

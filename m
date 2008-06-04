From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16233] New: [Randr12] Server crash when detecting
 DVI output change
Date: Wed,  4 Jun 2008 14:51:00 -0700 (PDT)
Message-ID: <bug-16233-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16233

           Summary: [Randr12] Server crash when detecting DVI output change
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Keywords: regression
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=16916)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16916)
Xorg log containing crash after running 'xrandr'

I have two DVI devices: a LCD panel with single channel DVI interface and a TV
connected over a dual-channel DVI->HDMI.  Nouveau kills X when swapping between
them in the following way:
1) Connect LCD panel to DVI port.
2) xrandr --auto to bring it up.
3) xrandr --output DVI-D-0 --off to bring it down
4) Disconnect LCD, plug DVI->HDMI cable into same DVI port
5) Run xrandr <-- Crash here.

This is symmetric, in that TV->LCD crashes in the same way that LCD->TV does.

I've run a git-bisect, and the offending commit is:
cdae2e26cc432ba572f92522f1b3454264d38f43 is first bad commit
commit cdae2e26cc432ba572f92522f1b3454264d38f43
Author: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri Jan 25 00:10:08 2008 +0100

    randr12: Rework native modes for TMDS.

    - Choose a preferred ddc mode when available, otherwise the one with the
highest refresh.
    - Fall back on cvt modes, only when needed.

:040000 040000 497af7e1199ee5079d38ab8dd668c1612230dfb7
78929b01e4e079417a26e25b64788c5c75cf3878 M      src


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14703] New: On NV17 on laptop screen: certain
 resolutions are scrambled
Date: Wed, 27 Feb 2008 11:06:37 -0800 (PST)
Message-ID: <bug-14703-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14703

           Summary: On NV17 on laptop screen: certain resolutions are
                    scrambled
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
            Blocks: 14405


With git, I am able to use xrandr 1.2 on most of the modes that my laptop
screen
supports. 

However, these resolutions are corrupted when I switch to them: 1152x864
and1024x768.  It is as if the flat panel isn't reading out enough
columns to put on the display.

(For example, if the display is 1024x768, the flat panel might be
showing 1020, and as a result, each line wraps around to the next.)

In 1024x768, my screen kinda looks like the following:
111111111111111111111111111111
111222222222222222222222222222
222223333333333333333333333333
333333333444444444444444444444
444444444444

Notice how it is shifted over more and more as you go down the screen.
...
However, once you get to the middle, the pattern appears to go in the
other direction, but that might just be random garbage.
The upper part of the screen has my gnome-panel, but is just shifted.

I hope that is clear...
...
The rest of the resolutions work.  Here is my xrandr output for reference:

Screen 0: minimum 320 x 200, current 1680 x 1050, maximum 1680 x 1680
VGA-0 disconnected (normal left inverted right x axis y axis)
LVDS-0 connected 1680x1050+0+0 (normal left inverted right x axis y
axis) 331mm x 207mm
  1680x1050      59.9*+   60.0
  1360x768       59.8     60.0
  1280x800       60.0
  1152x864       60.0
  1280x768       60.0
  1280x720       60.0
  1024x768       60.0
  800x600        60.3
  640x480        59.9
....


See bug 14403 for more details about my config.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

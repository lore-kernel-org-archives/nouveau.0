From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37056] New: --rotate left and --right-of <another
 output> doesn't work together
Date: Tue, 10 May 2011 02:43:52 -0700 (PDT)
Message-ID: <bug-37056-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37056

           Summary: --rotate left and --right-of <another output> doesn't
                    work together
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: tomi.pievilainen+freedesktop-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Setup: two monitors: Samsung 305t with supported modes of 2560x1600 and
1280x800 and HP2475W with lots of modes ranging up to 1920x1200. HP is
physically on the right side and pivoted 90 degs clockwise. GPU is GT7950 with
render target limit of 4096x4096.

Starting X without xorg.conf: both monitors are in highest res mode cloned,
with the HP showing only part of the screen (clipped at right side and below).

Starting with xorg.conf that instructs the HP (DVI-I-1) to be RightOf the
Samsung (DVI-I-2): Graphics ends up in a very unsuable state (see bug 37000).
Starting X without xorg.conf and using xrandr to achive the same: Samsung gets
blanked, HP is on. xrandr says the screen size is 1920x1200 and that maximum
screen size is 4096x4096. As the resolutions of 1920 and 2560 exceed the 4096,
this is expected.

Starting with xorg.conf that instructs the HP (DVI-I-1) to be RightOf the
Samsung (DVI-I-2) and rotated left: HP is properly rotated and is logically on
the right of the Samsung (ie. moving the mouse to right makes it appear to the
HP and moving it left moves it to the Samsung), but the Samsung screen is only
activated to 1280x800 mode. Activating the higher resolution with xrandr at
this point, or starting from the configuration-less cloned mode (first case)
and ordering the rotation and alignment with xrandr (no need to force the
resolution in this case) corrupts the Samsung image. The corruption makes the
applications and background image wrong, but mouse cursor is fine. It even
changes from arrow to caret when hovering above a terminal.

Finally trying to set the HP below the Samsung with or without rotation works
fine.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

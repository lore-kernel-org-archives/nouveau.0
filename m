From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] New: nouveau fails to display on external
	monitor
Date: Sun, 12 Sep 2010 23:15:53 -0700 (PDT)
Message-ID: <bug-30158-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30158

           Summary: nouveau fails to display on external monitor
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: varp-b-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello,

I have an IBM/Lenovo Thinkpad W701. It has a NVIDIA Quadro FX 3800M built in. I
did a fresh install out of the box on a clean system with Ubuntu 10.04 64-bit.
As long as I am using the internal laptops monitor everything is fine and runs
very fast and stable.

But if I connect an external monitor via the docking stations DVI I receive a
blank screen with a non-blinking cursor in the upper left. X does start but it
is not visible (starting sound is heard). Also the console windows can be
accessed and used.

As I have found, forcing xorg.conf to throw an error, for example with a
statement anywhere in xorg.conf like "ForceError 1" which is not parsable, X
will come up with an error saying something like "Syntax Error", "X running in
low resolution", and then asks what I want to do. Please note that now _this_
happens in a graphical display! I answer "run X with low settings for this
time", X says "restarting" and then everything is perfect and as fast and
stable as with the internal monitor. X does _not_ run in low resolution, it
runs perfect just as with the internal monitor - if X has thrown an error
during init. Otherwise it is gone.

Seems like X does some preliminary initialization if it encounters an error in
the xorg.conf which nouveau has missed. But if X has correct config data it
assumes all necessary inits have already been made and nouveau displays its
screen somewhere in nirvana... X is reported to be running on screen 0 (which
would be correct), but the display actually is in nowhere-land.

I have searched for many days now but could not find a solution, for example an
additional init-command to be placed in xorg.conf. Though I can live with it
easily (have to press OK twice when starting, after that no problems at all)
this took me a long long time to get Linux installed, and it might arise from
some deeper problem not so easily to be circumvented by some other user. So I
decided to report this problem.

If you need any additional info please let me know. Have a good time, best
regards, Michael

PS: NVIDIA proprietary drivers don't run at all on my system. They crash (very
early in the boot process requiring a reinstall/restore) whether internal or
external monitor is used. Using VESA of course isn't really an alternative but
this runs without any problems. I didn't try NV yet and don't really want to
(since this is a deep system operation hard to clean up and I have found a
circumvent working very good).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

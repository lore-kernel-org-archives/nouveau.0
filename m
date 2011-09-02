From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40572] New: Nouveau drm causes failure to resume
 from suspend with any kernel newer than 2.6.36
Date: Fri,  2 Sep 2011 00:03:22 -0700 (PDT)
Message-ID: <bug-40572-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40572

           Summary: Nouveau drm causes failure to resume from suspend with
                    any kernel newer than 2.6.36
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dali.spam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50834)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50834)
lspci -vvv

Hello.

I have problems resuming from suspend on my machine with a XFX GeForce 9300
motherboard using any kernel later than 2.6.36.

I've done a git bisect and this is the final result:

----

02c30ca0a1d6d8b878fc32f47b3b25192ef4a8ef is the first bad commit
commit 02c30ca0a1d6d8b878fc32f47b3b25192ef4a8ef
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Sep 16 16:17:35 2010 +1000

   drm/nv50: import initial clock get/set routines + hook up pm engine

   This will make nouveau_pm attempt to report the card's current performance
   level both during bootup, and through sysfs.

   This is a very initial implementation, and can be improved a *lot*

   Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 626c66f9899b5542726bff4d994cdeab5c6c52af
8ec449fdc267d205dd33ba4f4ca51347e6e6b7a0 M      drivers

----

The problem is 100% repeatable and goes like this:

- Boot any kernel later than 2.6.36, while testing I boot the kernel's recovery
mode option.
- Suspend machine, while testing I run pm-suspend.
- Attempt resume.
- The machine sort of wakes, but the screen is still in power save mode and the
keyboard doesn't light up. After roughly 30 seconds, the machine reboots.
- Nothing in the logs after reboot.

I am currently running Debian Wheezy, but I've had the same problem with Debian
Squeeze (with backported kernel 2.6.38.2) and Fedora 15.

Resume works as expected with kernel 2.6.36.4 and older. If I run a working
kernel and add "nomodeset" to the kernel command line, the machine behaves
similarly to when the problem occurs, with the difference that it doesn't
reboot after 30 secs, I have to reset it manually.

At the moment I'm running 2.6.35.14, which is the latest currently maintained
kernel that doesn't have any issues on my machine. Hopefully this won't be the
last usable kernel on the machine, the hardware isn't very old.

I'd be happy to supply any information needed, I've attached lspci output and
the git bisect log to start with. Please note that the last 4-5 good bisects
actually had other issues, during boot the screen goes blank when modesetting
kicks in, I had to log on blindly and run "pm-suspend". After successful
suspend/resume, the screen starts working, both on the console and in X.

Cheers,
Daniel

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

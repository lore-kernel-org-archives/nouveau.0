From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16782] New: Light graphical corruption in
	Firefox/Iceweasel
Date: Sun, 20 Jul 2008 05:30:48 -0700 (PDT)
Message-ID: <bug-16782-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16782

           Summary: Light graphical corruption in Firefox/Iceweasel
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: screwtape-L9NkjsXw7LUAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=17767)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=17767)
A screenshot of a glitch in action.

The nouveau driver was added to the Debian experimental repository the other
day[1], so I decided to try it out. So far, it's working better than nv, but
I've experienced some light graphical corruption in Iceweasel (Debian's build
of Firefox). It's superficially similar to some corruption I saw with the "nv"
driver[2], but that seemed to be XAA-specific while I hear nouveau is an
EXA-based driver.

I'll attach a screenshot of the problem, but in general background-images seem
to paint with the wrong origin - sometimes the edges of a web-page will paint
in the middle, sometimes the background won't be drawn at all. Selecting text
then deselecting it often repairs the damage (or sometimes causes it).

My video-card is a GeForce FX 5200 Ultra ("NV34", says Xorg.0.log), I'm running
Debian Unstable on a PowerMac G5, I'm using Metacity with compositing disabled;
other system info includes:

-- System Information:
Debian Release: lenny/sid
  APT prefers unstable
  APT policy: (500, 'unstable'), (500, 'stable'), (499, 'experimental')
Architecture: powerpc (ppc64)

Kernel: Linux 2.6.25-2-powerpc64 (SMP w/1 CPU core)
Locale: LANG=en_AU.UTF-8, LC_CTYPE=en_AU.UTF-8 (charmap=UTF-8)
Shell: /bin/sh linked to /bin/bash

Versions of packages xserver-xorg-video-nouveau depends on:
ii  dr 2.3.1+git+20080706+401f77a-1+2.6.25-7 DRM modules for Linux (kernel 2.6.
ii  li 2.7-12                                GNU C Library: Shared libraries
ii  xs 2:1.4.2-1                             Xorg X server - core server

I've attached a screenshot of the glitch in action; this occurred during page
load and occasionally while I was resizing the window. It took me a while to
get this screenshot, as defocusing the window was enough to make it redraw and
clean itself up.

[1]:
http://chris-lamb.co.uk/2008/07/16/nouveau-nvidia-drivers-now-available-in-debian-experimental/
[2]: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=482992


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

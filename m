From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30842] New: G84M/NVS 140M GPU Lockup
Date: Wed, 13 Oct 2010 13:10:12 -0700 (PDT)
Message-ID: <bug-30842-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30842

           Summary: G84M/NVS 140M GPU Lockup
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: carbonfreeze-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Ubuntu 10.10 x64
Thinkpad T61
01:00.0 VGA compatible controller: nVidia Corporation G84M [Quadro NVS 140M]
(rev a1) (prog-if 00 [VGA controller])

Xorg locks up somewhat randomly. I primarily notice this issue when switching
virtual desktops in KDE, or switching to a GTK application. Maximum login time
before triggering this issue can be anywhere from 30m to a day. When the lockup
occurs, I noted the following things:

Anything that was happening on the screen stops (animations, clock, etc)
Mouse can still be moved
System does not react to keyboard input (cannot switch vt, have not tried
sysrq)
Can login to system via ssh, but attempting to restart X appears to result in a
hard lock of the system (network goes down, no disk activity)
Occurs with KDM and GDM, in either KDE or XFCE
Occurs on AC or Battery power
Occurs on external monitor (dsub) or internal LCD
Occurs when switching virtual desktops, unlocking 2d screensaver, switching to
or clicking buttons in GNUcash and a few other cases


Nouveau packages installed from xorg-edgers (git20101012) and earlier effected.

Proprietary driver not effected by issue, however the system seems to slow down
a bit where I would experience lockups with nouveau (there is a noticeable 2d
draw latency).

When starting the system with nouveau.noaccel=1, I have been unable to
reproduce the lockup. Normally without the entry I am unable to maintain an
uptime over 8 hours, now running with nouveau.noaccel=1 I have been running 3
days without triggering the issue.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

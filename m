From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25275] New: [NV30] Graphical artefacts on PPC64
Date: Wed, 25 Nov 2009 04:41:30 -0800 (PST)
Message-ID: <bug-25275-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25275

           Summary: [NV30] Graphical artefacts on PPC64
           Product: xorg
           Version: 7.4
          Platform: PowerPC
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bluescarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I installed the latest git revision (as of 25/11/2009) of the nouveau driver on
a Gentoo Linux PPC64 (Apple Dual Mac G5) system. The card is an NV34, lspci
reports:

0000:f0:10.0 VGA compatible controller: nVidia Corporation NV34 [GeForce FX
5200 Ultra] (rev a1)

The driver seems to work quite well in a dual head configuration LCD monitor +
beamer (recognized as DVI-I-0 and DVI-I-1 by xrandr). 2D performance is really
nice and xrandr seems to work well :)

The only problem is that sometimes minor graphical artefacts pop up, in a more
or less random fashion. Such artefacts include:

- black pixels appearing sometimes at the border of buttons,
- small strangely-coloured stripes in KDE's taskbar and system tray,
- text colour sometimes changing and in some rare cases text disappearing from
graphical widgets.

I was able to capture a couple of such occurrences (see attachments). It seems
like using the option "ExaNoComposite" fixes the problems (but unfortunately I
was not able to test this configuration extensively). Simply disabling
composite in the server flags does not seem to make a difference.

It seems like issues were already reported on PPC64:

http://bugs.freedesktop.org/show_bug.cgi?id=17571

But that report is rather old, and I'm not sure the information there contained
is relevant any more.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

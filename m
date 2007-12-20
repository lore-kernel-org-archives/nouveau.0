From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13750] New: Repetitively Taking Screenshots Causes
	the X Server to Hang
Date: Thu, 20 Dec 2007 02:17:13 -0800 (PST)
Message-ID: <bug-13750-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13750

           Summary: Repetitively Taking Screenshots Causes the X Server to
                    Hang
           Product: xorg
           Version: 7.2
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nVidia (open)
        AssignedTo: aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
        ReportedBy: shlomif-ik1l9ssToec+JF/nGntIXQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                CC: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org


This happens:

* When using KDE (with KSnapshot installed) and pressing hold of the Print
Screen key to take screenshots for a few seconds.

* When using GNOME (with gnome-screenshot installed) and pressing hold of the
Print Screen key to take screenshots for a few seconds.

What happens then is that the X Server hangs (or gets stalled) and becomes
unresponsive. One can move the mouse, and the background music (at least on
Amarok) continues to play and one can ssh into the machine, but otherwise one
cannot do anything with the X Server.

Verified on:

1. Mandriva Cooker running x11-server-xorg-1.4-17mdv2008.1 with the "nv"
driver.

2. Mandriva Cooker running x11-server-xorg-1.4-17mdv2008.1 with Nouveau.

3. Archlinux latest with x11-server-1.4.0.90 and the "nv" driver.

All on freshly opened UNIX users/accounts.

I have a GeForce 4 MX 440 AGP card, a P4-2.4GHz machine and 2.5 GB of RAM (with
no swap).

Someone else who tried to reproduce this problem with XFCE and the "nvidia"
proprietary drivers on Mandriva Cooker (and 768MB of RAM) failed to reproduce
it.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31139] New: Wake from sleep doesn't turn on
	display(s)
Date: Tue, 26 Oct 2010 10:33:53 -0700 (PDT)
Message-ID: <bug-31139-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31139

           Summary: Wake from sleep doesn't turn on display(s)
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: psadauskas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


MacBook Pro (Mid 2010 model) with Nvidia NV50 using nouveau driver on Arch
Linux.

Using both the packaged xf86-video-nouveau (0.0.16_git20100819) and nouveau
from git, the display fails to resume after sleep. Happens when closing the
lid, and using `pm-suspend`, even after removing pm scripts 98video-quirks and
99-video as suggested in other bug trackers. 

After sleeping, the display never comes on, nor does the display backlight.
External displays connected to the Mini-DisplayPort->DVI stay asleep (amber
LED). Sleeping from and/or waking to a non-X virtual terminal (eg, Ctrl-Alt-F1)
does not restore the display, nor does switching after waking. The laptop is
responsive, keyboard backlight comes on, and I can type `sudo reboot` into a
terminal that I left focused before sleeping, and the laptop shuts down and
reboots, with the display working after reboot. 

Attached is messages.log of the sleep (first line), and the resume (line 35 or
so). Please let me know what additonal information is needed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

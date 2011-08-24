From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40336] New: Nouveau: Kernel oops when unplugging
 external monitor
Date: Wed, 24 Aug 2011 00:16:25 -0700 (PDT)
Message-ID: <bug-40336-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40336

           Summary: Nouveau: Kernel oops when unplugging external monitor
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: marco-w08N04152XNe4xh82S9ftw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50518)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50518)
lspci

Hi everybody.

I encountered a bug that is kind of annoying. It is my first bug report, so
please be patient. ;) When I use an external monitor and either
(a) just unplug the cable or
(b) change the xrandr settings and use ctrl-alt f1 to get a terminal
the screen stays black. Fortunately, I could save the log files with the help
of a ssh session.

I use a GeForce Go 7300. The command sequence is the following:
* To use the monitor: xrandr --output VGA-1 --auto --right-of LVDS-1
* To deactivate the monitor: xrandr --output VGA-1 --off

The problems also occurs when I use a much smaller monitor.

I attached all the log files (dmesg, /var/log/messages, kernel configs ...).
Because I am abroad and this computer is my only way to work here, I try to
avoid using the current git HEAD of nouveau.

# uname -a
Linux samson 3.0.1-gentoo #1 SMP Fri Aug 12 09:59:57 IDT 2011 i686 Intel(R)
Core(TM)2 CPU T5600 @ 1.83GHz GenuineIntel GNU/Linux

I use mesa-7.11, libdrm-2.4.26, and xf86-video-nouveau-0.0.16_pre20110801,
xorg-server-1.10.2

I am very eager to help fixing this bug.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14391] New: nouveau lockup on NV44 / x86_64
Date: Tue,  5 Feb 2008 13:14:19 -0800 (PST)
Message-ID: <bug-14391-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14391

           Summary: nouveau lockup on NV44 / x86_64
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: wwoods-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=14159)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14159)
Xorg.0.log

This is similar to bug #12300, but I'm filing it separately just to avoid
confusing things.

Some basic info:
Card: VGA compatible controller: nVidia Corporation NV44 [Quadro NVS 285] (rev
a1)
Driver: xorg-x11-drv-nouveau-2.1.6-7.fc9.x86_64
Kernel: Linux brinstar.test.redhat.com 2.6.24-17.fc9 #1 SMP Mon Feb 4 18:35:53
EST 2008 x86_64 x86_64 x86_64 GNU/Linux

This is on Fedora Rawhide. I'm not sure how recent the nouveau driver is - it
identifies itself as "module version = 1.2.0". The buildsystem page for this
Fedora package is here:
http://koji.fedoraproject.org/koji/buildinfo?buildID=32677

Anyway. Configuring X to use nouveau I get the following message if I run
startx from runlevel 3

  Fatal server error:
  DMA queue hang: dmaPut=1ffc, current=0, status=0

  giving up.

Running 'telinit 5' to start GDM gives me a messed up display and a few X
crashes before I get the following messages from the kernel:

  Uhhuh. NMI received for unknown reason a1.
  You have some hardware problem, likely on the PCI bus.
  Dazed and confused, but trying to continue

And then the system either locks or, occasionally, reboots itself. Fun!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

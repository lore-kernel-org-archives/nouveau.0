From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40406] New: Nouveau NVIDIA NV46: Freeze
Date: Fri, 26 Aug 2011 13:36:24 -0700 (PDT)
Message-ID: <bug-40406-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40406

           Summary: Nouveau NVIDIA NV46: Freeze
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


Created an attachment (id=50594)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50594)
system information

Hi.

As already mentioned in Bug 40336, I see sporadic freezes of my computer. So
far, it happened while using mplayer2, kde konsole, and emacs. Kde desktop
effects are deactivated.

Course of events:
At first, I notice kind of a "delay"/unresponsiveness of the system. The mouse
works but some programs don't. Mostly, I can still use the SysRq keys. Usually,
the result of a SysRq-Kill All Tasks is a frozen system.

Fortunately, today, I still had a screen and I could take pictures, but no log
files. Maybe it is enough information to get a rough idea of the problem. The
system freeze happened after I tried to log in and save the log files. ;)

I use:
* GeForce Go 7300
* Linux samson 3.0.3-gentoo #1 SMP Thu Aug 25 08:49:17 IDT 2011 i686 Intel(R)
Core(TM)2 CPU T5600 @ 1.83GHz GenuineIntel GNU/Linux
* mesa-7.11, libdrm-2.4.26, and xf86-video-nouveau-0.0.16_pre20110801,
xorg-server-1.10.2
* suspend2ram

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

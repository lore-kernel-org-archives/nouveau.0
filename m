From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52509] New: System hangs completely after loading
 nouveau kernel module
Date: Thu, 26 Jul 2012 05:35:20 +0000
Message-ID: <bug-52509-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52509

             Bug #: 52509
           Summary: System hangs completely after loading nouveau kernel
                    module
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: eugene-l/Z4ZXB6TmzR7s880joybQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 64686
  --> https://bugs.freedesktop.org/attachment.cgi?id=64686
Kernel messages after loading noveau module

GT 240 card (10de:0ca3), works nice with proprietary driver
Gentoo kernels 3.2.12 and 3.3.8 Fedora 16, 17 with 3.4.4 - same behavior, even
same last messages.
Almost immediately after loading nouveau kernel module the system hangs
completely, even Alt+SysRq keys don't work. Few times it looked like panic -
keyboard LEDs started blinking, but usually it just hangs.
I used systemd.unit=emergency.target to isolate the situation - boot to minimal
system and run modprobe nouveau manually, netconsole to extract messages -
strangely, it got nothing more than I can see on the screen. I'm afraid nothing
useful is there, last one being "[drm] No driver support for vblank timestamp
query.", but I attached log of all messages which appear after executing
modprobe. Maybe, I can get more debug output somehow?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

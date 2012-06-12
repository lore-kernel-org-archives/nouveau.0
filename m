From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51018] New: kernel >=3.4.0: nouveau triggers kernel
 BUG in slub.c on GTX 560 Ti
Date: Tue, 12 Jun 2012 22:12:21 +0000
Message-ID: <bug-51018-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51018

             Bug #: 51018
           Summary: kernel >=3.4.0: nouveau triggers kernel BUG in slub.c
                    on GTX 560 Ti
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
        ReportedBy: jiri.bluebear.dluhos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Observed on a workstation running Gentoo, with a Zotac GTX 560 Ti card.

After upgrading kernel to 3.4.0, the machine freezes during startup,
approximately during udev initialization. Seemingly randomly the screen either
goes completely blank and the monitor shuts down, or a kernel BUG report
appears, stating approximately the following:

kernel BUG at mm/slub.c:3474!
invalid opcode: 0000 [#1] SMP
.
.
.
Call trace:
    sysfs_release+0xa1/0xc0
    fput+0xd2/0x240
    filp_close+0x61/0x90
    sys_close+0x7b/0xd0
    system_call_fastpath+0x16/0x1b
RIP: kfree+0xab/0xb0

(The exact location in mm/slub.c alternates between 3471 and 3474 according to
the kernel version.)

I suppose that the same BUG occurs when the screen goes blank, only it is not
visible. In all cases, the machine becomes unresponsive, except for the
MagicSysRq combo which works as expected.

The problem occurs also with the new kernel 3.5.0-rc2. I never observed it with
kernel 3.3.7 or older.

The problem disappears if any of these conditions is met:

* the "slub_debug" kernel option is enabled, or
* the SLAB memory manager is used instead of SLUB, or
* the nouveau.ko module is disabled.

When the nouveau.ko module is disabled, the machine passes the whole boot into
text mode, and after nouveau is loaded manually with modprobe, it stays working
until X is started, in which case the same crash occurs.

No error messages are written to syslog, even with the "slub_debug" kernel
option (the bug just disappears), even if the crash is invoked by modprobing
the module manually and starting X.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

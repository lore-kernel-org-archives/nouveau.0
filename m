From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26767] New: kmemleak complain about possible memory
	leak
Date: Fri, 26 Feb 2010 01:56:58 -0800 (PST)
Message-ID: <bug-26767-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26767

           Summary: kmemleak complain about possible memory leak
           Product: xorg
           Version: 7.5
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: me-uiRdBs8odbtmTBlB0Cgj/Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When running kernel with kmemleak enabled, we keep seeing on dmesg suspects of
new memory leaks, looking at /sys/kernel/debug/kmemleak says that nouveau might
be the one to be blamed:

unreferenced object 0xf6175390 (size 148):
  comm "X", pid 8910, jiffies 4294890281 (age 6196.003s)
  hex dump (first 32 bytes):
    06 82 00 00 00 00 00 00 e0 84 a8 f3 80 81 a8 f3  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<c1433abb>] kmemleak_alloc+0x2a/0x47
    [<c10b5faa>] kmem_cache_alloc+0xa8/0xf6
    [<c11a11b5>] idr_pre_get+0x27/0x60
    [<f8144ca2>] drm_gem_handle_create+0x25/0x6f [drm]
    [<f81f6780>] nouveau_gem_ioctl_new+0x201/0x262 [nouveau]
    [<f81436a1>] drm_ioctl+0x268/0x310 [drm]
    [<c10c6238>] vfs_ioctl+0x27/0x8c
    [<c10c67b4>] do_vfs_ioctl+0x46e/0x4a8
    [<c10c6833>] sys_ioctl+0x45/0x5f
    [<c100290c>] sysenter_do_call+0x12/0x22
    [<ffffffff>] 0xffffffff

As an extra detail, I'm using current linux-2.6 head
(baac35c4155a8aa826c70acee6553368ca5243a2) plus x11 overlay on gentoo


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

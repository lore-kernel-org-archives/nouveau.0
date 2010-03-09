From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] New: GT230M/nouveau: X server hangs
	spontaneously
Date: Tue,  9 Mar 2010 08:50:32 -0800 (PST)
Message-ID: <bug-26980-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26980

           Summary: GT230M/nouveau: X server hangs spontaneously
           Product: xorg
           Version: 7.5
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vvv-mK/T7fl7eHLILq5++fvS8w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=33897)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33897)
Xorg log

I have observed X server hangs up few times (not too often, usually once per
1-2 days). System continue to work properly still accessible through network.
kill -9 to X restore the system with loss of X session. strace to X process
shows it hangs on ioctl to /dev/dri/card0:

ioctl(11, 0x40086485, 0x7fff61c01800)   = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
rt_sigreturn(0xe)                       = -1 EINTR (Interrupted system call)
ioctl(11, 0x40086485, 0x7fff61c01800)   = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
rt_sigreturn(0xe)                       = -1 EINTR (Interrupted system call)
ioctl(11, 0x40086485, 0x7fff61c01800)   = ? ERESTARTSYS (To be restarted)
--- SIGALRM (Alarm clock) @ 0 (0) ---
rt_sigreturn(0xe)                       = -1 EINTR (Interrupted system call)

X log has message on event queue overflow and backtrace:
[mi] EQ overflowing. The server is probably stuck in an infinite loop.

Backtrace:
0: /usr/bin/X (xorg_backtrace+0x28) [0x49ea18]
1: /usr/bin/X (mieqEnqueue+0x1f4) [0x49e3e4]
2: /usr/bin/X (xf86PostMotionEventP+0xce) [0x478f9e]
3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7feb9c7cd000+0x516f)
[0x7feb9c7d216f]
4: /usr/bin/X (0x400000+0x6be87) [0x46be87]
5: /usr/bin/X (0x400000+0x1171c3) [0x5171c3]
6: /lib64/libpthread.so.0 (0x3e9e200000+0xf0f0) [0x3e9e20f0f0]
7: /lib64/libc.so.6 (ioctl+0x7) [0x3e9d6d6937]
8: /usr/lib64/libdrm.so.2 (drmIoctl+0x23) [0x3eb3e03383]
9: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x3eb3e0360b]
10: /usr/lib64/libdrm_nouveau.so.1 (0x7feb9fe68000+0x2f1d) [0x7feb9fe6af1d]
11: /usr/lib64/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xfc) [0x7feb9fe6b11c]
12: /usr/lib64/libdrm_nouveau.so.1 (0x7feb9fe68000+0x2106) [0x7feb9fe6a106]
13: /usr/lib64/libdrm_nouveau.so.1 (nouveau_pushbuf_flush+0x29c)
[0x7feb9fe6a49c]
14: /usr/lib64/xorg/modules/libexa.so (0x7feb9dc89000+0x90e1) [0x7feb9dc920e1]
15: /usr/lib64/xorg/modules/libexa.so (0x7feb9dc89000+0x939d) [0x7feb9dc9239d]
16: /usr/bin/X (miCopyRegion+0x28d) [0x545e5d]
17: /usr/bin/X (miDoCopy+0x44a) [0x54636a]
18: /usr/lib64/xorg/modules/libexa.so (0x7feb9dc89000+0x8667) [0x7feb9dc91667]
19: /usr/bin/X (0x400000+0xd44b8) [0x4d44b8]
20: /usr/bin/X (0x400000+0x2b3bc) [0x42b3bc]
21: /usr/bin/X (0x400000+0x2c86c) [0x42c86c]
22: /usr/bin/X (0x400000+0x21e3a) [0x421e3a]
23: /lib64/libc.so.6 (__libc_start_main+0xfd) [0x3e9d61eb1d]
24: /usr/bin/X (0x400000+0x219f9) [0x4219f9]

I'm using Fedora 12 for x86-64, uname -a output is
Linux lumos 2.6.32.9-67.fc12.x86_64 #1 SMP Sat Feb 27 09:26:40 UTC 2010 x86_64
x86_64 x86_64 GNU/Linux
xorg-x11-drv-nouveau version 0.0.15 release 20.20091105gite1c2efd.fc12

Ask me if I can provide more information or make more experiments.
Thanks, Victor


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

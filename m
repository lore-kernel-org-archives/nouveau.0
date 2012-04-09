From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48454] New: Xorg hang and have to kill X from ssh
Date: Mon, 09 Apr 2012 07:57:19 +0000
Message-ID: <bug-48454-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=48454

             Bug #: 48454
           Summary: Xorg hang and have to kill X from ssh
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dclemen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 59666
  --> https://bugs.freedesktop.org/attachment.cgi?id=59666
Full gdm3 log file

Debian Testing AMD64

$ uname -a
Linux xxx 3.2.0-2-amd64 #1 SMP Tue Mar 20 18:36:37 UTC 2012 x86_64 GNU/Linux

sudo dpkg -l |grep nouve
ii  libdrm-nouveau1a:amd64                                      2.4.32-1       
                 Userspace interface to nouveau-specific kernel DRM services --
runtime
ii  xserver-xorg-video-nouveau                                 
1:0.0.16+git20111201+b5534a1-1   X.Org X server -- Nouveau display driver


Hi from a long time ago, I have a problem with Xorg, it crash and have to login
with another computer with ssh and "killall -s 9 -I xorg" to get X works again.
When crash, CTRL+ALT+Fx don't work.

This is gdm3 log file lines
[mi] EQ overflowing. The server is probably stuck in an infinite loop.

Backtrace:
0: /usr/bin/Xorg (xorg_backtrace+0x26) [0x7f0102d0f4d6]
1: /usr/bin/Xorg (mieqEnqueue+0x191) [0x7f0102cefde1]
2: /usr/bin/Xorg (0x7f0102b8b000+0x65254) [0x7f0102bf0254]
3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f00fc58b000+0x5588)
[0x7f00fc590588]
4: /usr/bin/Xorg (0x7f0102b8b000+0x8a947) [0x7f0102c15947]
5: /usr/bin/Xorg (0x7f0102b8b000+0xb052e) [0x7f0102c3b52e]
6: /lib/x86_64-linux-gnu/libpthread.so.0 (0x7f0101eb3000+0xf030)
[0x7f0101ec2030]
7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7f0100c8e957]
8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7f00ff00ca68]
9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7f00ff00ed5b]
10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.1 (0x7f00fe9bd000+0x3197)
[0x7f00fe9c0197]
11: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x109)
[0x7f00fe9c07b9]
12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f00febc3000+0x7b23)
[0x7f00febcab23]
13: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x4c47) [0x7f00fe586c47]
14: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x82fb) [0x7f00fe58a2fb]
15: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x12a07) [0x7f00fe594a07]
16: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0xf0b8) [0x7f00fe5910b8]
17: /usr/bin/Xorg (0x7f0102b8b000+0x114f34) [0x7f0102c9ff34]
18: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x10330) [0x7f00fe592330]
19: /usr/bin/Xorg (0x7f0102b8b000+0x10dbf1) [0x7f0102c98bf1]
20: /usr/bin/Xorg (0x7f0102b8b000+0x51f81) [0x7f0102bdcf81]
21: /usr/bin/Xorg (0x7f0102b8b000+0x411aa) [0x7f0102bcc1aa]
22: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xfd) [0x7f0100bdbead]
23: /usr/bin/Xorg (0x7f0102b8b000+0x4149d) [0x7f0102bcc49d]
[mi] EQ overflowing. The server is probably stuck in an infinite loop.

Backtrace:
0: /usr/bin/Xorg (xorg_backtrace+0x26) [0x7f0102d0f4d6]
1: /usr/bin/Xorg (mieqEnqueue+0x191) [0x7f0102cefde1]
2: /usr/bin/Xorg (0x7f0102b8b000+0x65254) [0x7f0102bf0254]
3: /usr/lib/xorg/modules/input/evdev_drv.so (0x7f00fc58b000+0x5588)
[0x7f00fc590588]
4: /usr/bin/Xorg (0x7f0102b8b000+0x8a947) [0x7f0102c15947]
5: /usr/bin/Xorg (0x7f0102b8b000+0xb052e) [0x7f0102c3b52e]
6: /lib/x86_64-linux-gnu/libpthread.so.0 (0x7f0101eb3000+0xf030)
[0x7f0101ec2030]
7: /lib/x86_64-linux-gnu/libc.so.6 (ioctl+0x7) [0x7f0100c8e957]
8: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmIoctl+0x28) [0x7f00ff00ca68]
9: /usr/lib/x86_64-linux-gnu/libdrm.so.2 (drmCommandWrite+0x1b)
[0x7f00ff00ed5b]
10: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.1 (0x7f00fe9bd000+0x3197)
[0x7f00fe9c0197]
11: /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x109)
[0x7f00fe9c07b9]
12: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f00febc3000+0x7b23)
[0x7f00febcab23]
13: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x4c47) [0x7f00fe586c47]
14: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x82fb) [0x7f00fe58a2fb]
15: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x12a07) [0x7f00fe594a07]
16: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0xf0b8) [0x7f00fe5910b8]
17: /usr/bin/Xorg (0x7f0102b8b000+0x114f34) [0x7f0102c9ff34]
18: /usr/lib/xorg/modules/libexa.so (0x7f00fe582000+0x10330) [0x7f00fe592330]
19: /usr/bin/Xorg (0x7f0102b8b000+0x10dbf1) [0x7f0102c98bf1]
20: /usr/bin/Xorg (0x7f0102b8b000+0x51f81) [0x7f0102bdcf81]
21: /usr/bin/Xorg (0x7f0102b8b000+0x411aa) [0x7f0102bcc1aa]
22: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xfd) [0x7f0100bdbead]
23: /usr/bin/Xorg (0x7f0102b8b000+0x4149d) [0x7f0102bcc49d]


Attached full gdm3 log file

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47288] New: System hangs with GeForce 6150SE nForce
	430
Date: Tue, 13 Mar 2012 13:29:05 +0000
Message-ID: <bug-47288-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47288

             Bug #: 47288
           Summary: System hangs with GeForce 6150SE nForce 430
    Classification: Unclassified
           Product: xorg
           Version: 7.6 (2010.12)
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


My system (GeForce 6150SE nForce 430) hangs up from time to time under KDE
4.7.4. All I can do then is to move the mouse pointer.
Clicks have no effect and I can not switch to the console. I even can't shut
down the system pressing the power button.
It seems I can trigger this by increasing the workload, e.g when
maximizing/minimizing lots of windows.

Xorg.0.log shows the following messages (full file attached):
...
[   771.443] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[   771.443] 
Backtrace:
[   771.456] 0: /usr/bin/Xorg (xorg_backtrace+0x37) [0x80a86b7]
[   771.456] 1: /usr/bin/Xorg (mieqEnqueue+0x1d1) [0x80a2841]
[   771.456] 2: /usr/bin/Xorg (xf86PostMotionEventM+0xb0) [0x80c9d70]
[   771.457] 3: /usr/bin/Xorg (xf86PostMotionEventP+0x6f) [0x80c9ebf]
[   771.457] 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xb63a7000+0x2dde)
[0xb63a9dde]
[   771.457] 5: /usr/lib/xorg/modules/input/evdev_drv.so (0xb63a7000+0x3f0d)
[0xb63aaf0d]
[   771.457] 6: /usr/bin/Xorg (0x8048000+0x6ea11) [0x80b6a11]
[   771.457] 7: /usr/bin/Xorg (0x8048000+0x129da2) [0x8171da2]
[   771.457] 8: (vdso) (__kernel_sigreturn+0x0) [0xffffe400]
[   771.457] 9: /lib/libc.so.6 (ioctl+0x14) [0xb73e7114]
[   771.457] 10: /usr/lib/libdrm.so.2 (drmIoctl+0x34) [0xb7198f04]
[   771.457] 11: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3c) [0xb719ba9c]
[   771.457] 12: /usr/lib/libdrm_nouveau.so.1 (0xb777c000+0x2dff) [0xb777edff]
[   771.457] 13: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x10a)
[0xb777f4ea]
[   771.457] 14: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map+0x32)
[0xb777f5e2]
[   771.457] 15: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0xb7159000+0x5497) [0xb715e497]
[   771.457] 16: /usr/lib/xorg/modules/libexa.so (0xb7114000+0xbe93)
[0xb711fe93]
[   771.457] 17: /usr/bin/Xorg (0x8048000+0x16ad63) [0x81b2d63]
[   771.458] 18: /usr/bin/Xorg (0x8048000+0xa9986) [0x80f1986]
[   771.458] 19: /usr/lib/xorg/modules/libexa.so (exaGetPixmapFirstPixel+0x94)
[0xb71287d4]
[   771.458] 20: /usr/lib/xorg/modules/libexa.so (0xb7114000+0x109e0)
[0xb71249e0]
[   771.458] 21: /usr/bin/Xorg (0x8048000+0xe426b) [0x812c26b]
[   771.458] 22: /usr/bin/Xorg (CompositePicture+0x21e) [0x8120b6e]
[   771.458] 23: /usr/bin/Xorg (0x8048000+0xde66c) [0x812666c]
[   771.458] 24: /usr/bin/Xorg (0x8048000+0xd9461) [0x8121461]
[   771.458] 25: /usr/bin/Xorg (0x8048000+0x2d9d7) [0x80759d7]
[   771.458] 26: /usr/bin/Xorg (0x8048000+0x207cc) [0x80687cc]
[   771.458] 27: /lib/libc.so.6 (__libc_start_main+0xf3) [0xb7334003]
[   771.458] 28: /usr/bin/Xorg (0x8048000+0x20ae1) [0x8068ae1]

The kernel log shows the following suspicious messages:
...
[  765.361432] [drm] nouveau 0000:00:0d.0: fail pre-validate sync
[  765.361442] [drm] nouveau 0000:00:0d.0: validate vram_list
[  765.361452] [drm] nouveau 0000:00:0d.0: validate: -16
...

I'm using openSUSE 12.1 (kernel 3.1.9, Xorg 7.6). I also tried kernel
3.3.0-rc7.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

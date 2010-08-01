From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M or GT218 with nouveau: X server hangs
 spontaneously
Date: Sat, 31 Jul 2010 19:51:59 -0700 (PDT)
Message-ID: <20100801025159.D0EC61300FD@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #28 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-07-31 19:51:59 PDT ---
Adding a me too.  

NVA8, GT218

[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2

Fedora 13. Seems to happen reproducably after playing freeciv for 45 - 60
minutes.

[  3407.261] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[  3407.262] 
Backtrace:
[  3407.272] 0: /usr/bin/Xorg (xorg_backtrace+0x3c) [0x80ad11c]
[  3407.272] 1: /usr/bin/Xorg (mieqEnqueue+0x1b7) [0x809b8f7]
[  3407.272] 2: /usr/bin/Xorg (xf86PostMotionEventP+0xd2) [0x80c8232]
[  3407.272] 3: /usr/lib/xorg/modules/input/evdev_drv.so (0xe7c000+0x30a2)
[0xe7f0a2]
[  3407.272] 4: /usr/lib/xorg/modules/input/evdev_drv.so (0xe7c000+0x3349)
[0xe7f349]
[  3407.272] 5: /usr/bin/Xorg (0x8047000+0x76c30) [0x80bdc30]
[  3407.272] 6: /usr/bin/Xorg (0x8047000+0x12db64) [0x8174b64]
[  3407.272] 7: (vdso) (__kernel_sigreturn+0x0) [0xdba400]
[  3407.272] 8: (vdso) (__kernel_vsyscall+0x2) [0xdba416]
[  3407.272] 9: /lib/libc.so.6 (ioctl+0x19) [0x74c0b9]
[  3407.272] 10: /usr/lib/libdrm.so.2 (drmIoctl+0x2e) [0x7fd6a7e]
[  3407.272] 11: /usr/lib/libdrm.so.2 (drmCommandWrite+0x3c) [0x7fd6e0c]
[  3407.273] 12: /usr/lib/libdrm_nouveau.so.1 (0xfb5000+0x2a9a) [0xfb7a9a]
[  3407.273] 13: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xf1)
[0xfb7c91]
[  3407.273] 14: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map+0x34) [0xfb7d64]
[  3407.273] 15: /usr/lib/libdrm_nouveau.so.1 (0xfb5000+0x1c2e) [0xfb6c2e]
[  3407.273] 16: /usr/lib/libdrm_nouveau.so.1 (nouveau_pushbuf_flush+0x1ca)
[0xfb700a]
[  3407.273] 17: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x131000+0x1b76f) [0x14c76f]
[  3407.273] 18: /usr/lib/xorg/modules/libexa.so (0x163000+0x8ac3) [0x16bac3]
[  3407.273] 19: /usr/lib/xorg/modules/libexa.so (0x163000+0x9673) [0x16c673]
[  3407.273] 20: /usr/bin/Xorg (0x8047000+0xe6f26) [0x812df26]
[  3407.273] 21: /usr/bin/Xorg (0x8047000+0x17967d) [0x81c067d]
[  3407.273] 22: /usr/bin/Xorg (miCompositeRects+0x7f) [0x81c079f]
[  3407.273] 23: /usr/bin/Xorg (CompositeRects+0x74) [0x811da34]
[  3407.273] 24: /usr/bin/Xorg (0x8047000+0xe036d) [0x812736d]
[  3407.273] 25: /usr/bin/Xorg (0x8047000+0xdc494) [0x8123494]
[  3407.273] 26: /usr/bin/Xorg (0x8047000+0x50a37) [0x8097a37]
[  3407.273] 27: /usr/bin/Xorg (0x8047000+0x1b595) [0x8062595]
[  3407.273] 28: /lib/libc.so.6 (__libc_start_main+0xe6) [0x68dcc6]
[  3407.273] 29: /usr/bin/Xorg (0x8047000+0x1b181) [0x8062181]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

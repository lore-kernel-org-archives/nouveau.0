From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Fri, 20 Aug 2010 08:39:34 -0700 (PDT)
Message-ID: <20100820153934.65EF21300C7@annarchy.freedesktop.org>
References: <bug-26733-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26733-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26733

Sebastian Thias <bugs-OXl1b/uZKHizQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs-OXl1b/uZKHizQB+pC5nmwQ@public.gmane.org

--- Comment #27 from Sebastian Thias <bugs-OXl1b/uZKHizQB+pC5nmwQ@public.gmane.org> 2010-08-20 08:39:34 PDT ---
Hi, same or similar problem here, often during day to day work under kde4.4
with NVIDIA Quadro NVS 140M.

I will try out "as of today" DDX as soon as possible and report back (unless
I'm told that this is a completely different bug...)

Kernel:
--------
[29470.176297] [drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2
[29470.176975] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - Ch 2/5 Class
0x8297 Mthd 0x1560 Data 0x00000000:0xcccccccc
[29470.176979] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - INVALID_VALUE
[29470.176990] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - Ch 2/5 Class
0x8297 Mthd 0x1564 Data 0x00000000:0xcccccccc
[29470.176993] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - INVALID_BITFIELD

Xorg.0.log:
-------------------
[mi] EQ overflowing. The server is probably stuck in an infinite loop.

Backtrace:
0: /usr/bin/X (xorg_backtrace+0x28) [0x4b2518]
1: /usr/bin/X (mieqEnqueue+0x1eb) [0x4b1cdb]
2: /usr/bin/X (xf86PostMotionEventP+0xc8) [0x488b48]
3: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f2c9c2bf000+0x61dc)
[0x7f2c9c2c51dc]
4: /usr/bin/X (0x400000+0x77847) [0x477847]
5: /usr/bin/X (0x400000+0x132d4a) [0x532d4a]
6: /lib/libpthread.so.0 (0x7f2ca0856000+0xea40) [0x7f2ca0864a40]
7: /lib/libc.so.6 (ioctl+0x7) [0x7f2c9f9a2507]
8: /usr/lib/libdrm.so.2 (drmIoctl+0x23) [0x7f2c9e147543]
9: /usr/lib/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f2c9e147a3b]
10: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x183) [0x7f2c9db09783]
11: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f2c9dd0c000+0x653b)
[0x7f2c9dd1253b]
12: /usr/lib64/xorg/modules/libexa.so (0x7f2c9d293000+0x8d1a) [0x7f2c9d29bd1a]
13: /usr/bin/X (0x400000+0x1750b4) [0x5750b4]
14: /usr/lib64/xorg/modules/libexa.so (exaGetPixmapFirstPixel+0xa9)
[0x7f2c9d2a47a9]
15: /usr/lib64/xorg/modules/libexa.so (0x7f2c9d293000+0x1010f) [0x7f2c9d2a310f]
16: /usr/bin/X (0x400000+0xea4e6) [0x4ea4e6]
17: /usr/bin/X (0x400000+0xe15cd) [0x4e15cd]
18: /usr/bin/X (0x400000+0x30204) [0x430204]
19: /usr/bin/X (0x400000+0x250dd) [0x4250dd]
20: /lib/libc.so.6 (__libc_start_main+0xfd) [0x7f2c9f8faa3d]
21: /usr/bin/X (0x400000+0x24c99) [0x424c99]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

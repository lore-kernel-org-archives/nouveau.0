From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40485] PGRAPH - ERROR nsource: LIMIT_COLOR nstatus:
 PROTECTION_FAULT
Date: Sun, 25 Sep 2011 13:50:30 -0700 (PDT)
Message-ID: <20110925205030.57B37130109@annarchy.freedesktop.org>
References: <bug-40485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40485

--- Comment #10 from Dennis Schridde <devurandom-hi6Y0CQ0nG0@public.gmane.org> 2011-09-25 13:50:30 PDT ---
In case nouveau for GF7 is one day resurrected - logs of another hang:

-- dmesg --
[drm] nouveau 0000:03:00.0: Failed to idle channel 3.
[drm] nouveau 0000:03:00.0: PGRAPH idle timed out with status 0x0bef0101
[drm] nouveau 0000:03:00.0: Failed: Instance=0x00014100 Save=1
[drm] nouveau 0000:03:00.0: IP: 0x28, Opcode: 0x00500060
[drm] nouveau 0000:03:00.0: 0x40030C = 0x00000029

-- Xorg.log --
[  5753.293] [mi] EQ overflowing. The server is probably stuck in an infinite
loop.
[  5753.305] 
Backtrace:
[  5753.420] 0: /usr/bin/X (xorg_backtrace+0x26) [0x56bb46]
[  5753.420] 1: /usr/bin/X (mieqEnqueue+0x199) [0x54bff9]
[  5753.420] 2: /usr/bin/X (0x400000+0x46b94) [0x446b94]
[  5753.420] 3: /usr/bin/X (xf86PostMotionEventP+0x37) [0x486497]
[  5753.420] 4: /usr/lib64/xorg/modules/input/evdev_drv.so
(0x7f41ce441000+0x4979) [0x7f41ce445979]
[  5753.420] 5: /usr/bin/X (0x400000+0x72087) [0x472087]
[  5753.420] 6: /usr/bin/X (0x400000+0x9793e) [0x49793e]
[  5753.420] 7: /lib64/libpthread.so.0 (0x7f41d398b000+0xf450) [0x7f41d399a450]
[  5753.420] 8: /lib64/libc.so.6 (ioctl+0x7) [0x7f41d29790d7]
[  5753.420] 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f41d0f15598]
[  5753.420] 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f41d0f177bb]
[  5753.420] 11: /usr/lib64/libdrm_nouveau.so.1 (0x7f41d08c7000+0x2f87)
[0x7f41d08c9f87]
[  5753.420] 12: /usr/lib64/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xf9)
[0x7f41d08ca599]
[  5753.420] 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f41d0acd000+0x6da5) [0x7f41d0ad3da5]
[  5753.420] 14: /usr/lib64/xorg/modules/libexa.so (0x7f41d048c000+0xb244)
[0x7f41d0497244]
[  5753.420] 15: /usr/bin/X (0x400000+0x15b901) [0x55b901]
[  5753.420] 16: /usr/bin/X (0x400000+0xbe633) [0x4be633]
[  5753.420] 17: /usr/lib64/xorg/modules/libexa.so
(exaGetPixmapFirstPixel+0x71) [0x7f41d049ec01]
[  5753.430] 18: /usr/lib64/xorg/modules/libexa.so (0x7f41d048c000+0xf561)
[0x7f41d049b561]
[  5753.430] 19: /usr/bin/X (0x400000+0xfba16) [0x4fba16]
[  5753.430] 20: /usr/bin/X (0x400000+0xf411c) [0x4f411c]
[  5753.430] 21: /usr/bin/X (0x400000+0x33bc9) [0x433bc9]
[  5753.430] 22: /usr/bin/X (0x400000+0x22cfc) [0x422cfc]
[  5753.430] 23: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f41d28bd2cd]
[  5753.430] 24: /usr/bin/X (0x400000+0x2305d) [0x42305d]

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

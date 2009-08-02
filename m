From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23086] New: TNT2 doesn't start with current nouveau
Date: Sun,  2 Aug 2009 01:32:44 -0700 (PDT)
Message-ID: <bug-23086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=23086

           Summary: TNT2 doesn't start with current nouveau
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: randrik-JGs/UdohzUI@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hardware:

01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
(rev 15) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. AGP-V3800PRO
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 16
        Memory at d6000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d2000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at d7ef0000 [disabled] [size=64K]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0
        Kernel modules: nouveau

Software:

kernel nouveau/linux-2.6 master commit 29af57c65904deced7a431623c8fea55e24e5c83
(drm/nouveau: block channel creation without ctxprog)

libdrm - master commit  5a73f066ba149816cc0fc2de4b97ec4714cf8ebc (nouveau:
don't overwrite user-specified bo size needlessly)

pixman - git master, commit 9dec2e352b24bdccaac4f570b8cf12e61a9194ee (Various
updates to the CODING_STYLE document)

xserver - git master , commit  ae65daab080c6269f0eadc6be1a48bf27866c542
(XQuartz: Unify how we set our bitmasks for visuals)

xf86-video-nouveau - git master, commit
1ecd4358c851b3d7bebfb00f5f7ac3c7c151bc20 ( Recalculate displayWidth if we do a
late NoAccel fallback)

X itself starts, but if i run E16 1.0.0 WM on top of it - i get only movable 
cursor, my background, pager, and  at this point X segfaults:

(**) Option "xkb_options" "grp:ctrl_shift_toggle"
[mi] EQ overflowing. The server is probably stuck in an infinite loop.

Backtrace:
0: /usr/X11/bin/X(xorg_backtrace+0x34) [0x80a2134]
1: /usr/X11/bin/X(mieqEnqueue+0x221) [0x809a3a1]
2: /usr/X11/bin/X(xf86PostMotionEventP+0xcf) [0x80ba3ff]
3: /usr/X11R7/lib/xorg/modules/input/evdev_drv.so [0xb5ea12f2]
4: /usr/X11/bin/X [0x80b002b]
5: /usr/X11/bin/X [0x815b742]
6: [0xffffe400]
7: /usr/X11R7/lib/libdrm.so.2(drmCommandWrite+0x35) [0xb7afbaa5]
8: /usr/X11R7/lib/libdrm_nouveau.so.1 [0xb7b1d4f1]
9: /usr/X11R7/lib/libdrm_nouveau.so.1(nouveau_bo_map_range+0xf3) [0xb7b1d723]
10: /usr/X11R7/lib/libdrm_nouveau.so.1(nouveau_bo_map+0x26) [0xb7b1d7d6]
11: /usr/X11R7/lib/xorg/modules/drivers/nouveau_drv.so [0xb7ab7db3]
12: /usr/X11R7/lib/xorg/modules/drivers/nouveau_drv.so [0xb7ab8eef]
13: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c552c]
14: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c59b6]
15: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c5a28]
16: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c64d7]
17: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c0ae8]
18: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c0b45]
19: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68cabed]
20: /usr/X11R7/lib/xorg/modules/libexa.so [0xb68c8796]
21: /usr/X11/bin/X [0x8113e62]
22: /usr/X11/bin/X(CompositePicture+0x249) [0x8107da9]
23: /usr/X11/bin/X(miGlyphs+0x4c0) [0x81a9210]
24: /usr/X11/bin/X [0x8114115]
25: /usr/X11/bin/X(CompositeGlyphs+0x7d) [0x81a931d]
26: /usr/X11/bin/X [0x810f683]
27: /usr/X11/bin/X [0x810a89f]
28: /usr/X11/bin/X [0x806fd31]
29: /usr/X11/bin/X [0x8063544]
30: /lib/libc.so.6(__libc_start_main+0xe5) [0xb7ba66a5]
31: /usr/X11/bin/X [0x8063101]


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

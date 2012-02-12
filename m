From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26733] Full-screen XV causes graphics lockup
Date: Sun, 12 Feb 2012 23:10:15 +0000
Message-ID: <bug-26733-8800-SXHZ6iH9tp@http.bugs.freedesktop.org/>
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

--- Comment #32 from Diego Ercolani <diego.ercolani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-02-12 15:10:15 PST ---
Created attachment 56934
  --> https://bugs.freedesktop.org/attachment.cgi?id=56934
syslog extract of nouveau DRM exception while watching a movie with mplayer

Similar behave here.
Here it is my environment:
Software
OpenSUSE 12.1
/lib/modules/3.1.9-1.4-desktop/kernel/drivers/gpu/drm/nouveau/nouveau.ko
xorg-x11-driver-video-nouveau-0.0.16_20110720_b806e3f-2.1.2.x86_64
xorg-x11-7.6-67.3.1.x86_64

Hardware:
02:00.0 VGA compatible controller: nVidia Corporation C77 [GeForce 8300] (rev a2)
Motherboard: ASUS Product Name: M4N78 PRO
CPU: Phenom II Family 16, Model 4, Stepping 2 3400 MHz

While watching movie with mplayer randomly nouveau seem to crash freezing the X11 session.
It's possible to connect to the system using ssh but it isn't possible to kill xorg processes. 
Here are the last entries of the Xorg.0.log:
[    51.867] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865 868 900 +hsync +vsync (67.5 kHz)
[ 17186.956] [mi] EQ overflowing. The server is probably stuck in an infinite loop.
[ 17186.968] 
Backtrace:
[ 17186.972] 0: /usr/bin/X (xorg_backtrace+0x26) [0x462396]
[ 17186.972] 1: /usr/bin/X (mieqEnqueue+0x201) [0x45c911]
[ 17186.972] 2: /usr/bin/X (xf86PostMotionEventM+0xa3) [0x482203]
[ 17186.972] 3: /usr/bin/X (xf86PostMotionEventP+0x37) [0x4822f7]
[ 17186.972] 4: /usr/lib64/xorg/modules/input/evdev_drv.so (0x7f5c081da000+0x4b2e) [0x7f5c081deb2e]
[ 17186.972] 5: /usr/bin/X (0x400000+0x6f7c7) [0x46f7c7]
[ 17186.972] 6: /usr/bin/X (0x400000+0x11ebfe) [0x51ebfe]
[ 17186.972] 7: /lib64/libpthread.so.0 (0x7f5c0dcda000+0xfd00) [0x7f5c0dce9d00]
[ 17186.972] 8: /lib64/libc.so.6 (ioctl+0x7) [0x7f5c0cceed67]
[ 17186.972] 9: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f5c0942a948]
[ 17186.972] 10: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f5c0942cc5b]
[ 17186.972] 11: /usr/lib64/libdrm_nouveau.so.1 (0x7f5c08ddb000+0x31b7) [0x7f5c08dde1b7]
[ 17186.972] 12: /usr/lib64/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x109) [0x7f5c08dde7d9]
[ 17186.972] 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f5c08fe1000+0x9ec7) [0x7f5c08feaec7]
[ 17186.972] 14: /usr/bin/X (0x400000+0x131b3e) [0x531b3e]
[ 17186.972] 15: /usr/lib64/xorg/modules/extensions/libextmod.so (0x7f5c0c140000+0xf5c4) [0x7f5c0c14f5c4]
[ 17186.972] 16: /usr/bin/X (0x400000+0x332a9) [0x4332a9]
[ 17186.972] 17: /usr/bin/X (0x400000+0x272ce) [0x4272ce]
[ 17186.972] 18: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f5c0cc3e23d]
[ 17186.972] 19: /usr/bin/X (0x400000+0x275bd) [0x4275bd]

These are the information about Xorg in the same log:
[    37.485] X.Org X Server 1.10.4 Release Date: 2011-08-19
[    37.485] Current Operating System: Linux casaregno 3.1.9-1.4-desktop #1 SMP PREEMPT Fri Jan 27 08:55:10 UTC 2012 (efb5ff4) x86_64
[    37.487] (--) PCI:*(0:2:0:0) 10de:0848:1043:82e2 rev 162, Mem @ 0xfb000000/16777216, 0xf0000000/134217728, 0xf8000000/33554432, I/O @ 0x0000ec00/128, BIOS
@ 0x????????/131072
[    38.172] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    38.172] (II) Module nouveau: vendor="X.Org Foundation"
[    38.172]    compiled for 1.10.4, module version = 0.0.16
[    38.172]    Module class: X.Org Video Driver
[    38.172]    ABI class: X.Org Video Driver, version 10.0
[    38.753] (--) NOUVEAU(0): Chipset: "NVIDIA NVaa"
[    38.995] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
[    38.995] (II) NOUVEAU(0): [XvMC] Extension initialized.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

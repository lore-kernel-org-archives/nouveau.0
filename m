From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47288] System hangs with GeForce 6150SE nForce 430
 ("EQ overflowing")
Date: Mon, 23 Jul 2012 02:31:18 +0000
Message-ID: <bug-47288-8800-fn5zDNEPxV@http.bugs.freedesktop.org/>
References: <bug-47288-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47288-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

--- Comment #10 from zebob <zebob.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-22 19:31:18 PDT ---
Hello,

I'm using the same hardware (Geforce 6150/nForce 430) and experiencing the same
problem since months, at least since GNOME 3.0 release with compositing
enabled, and then with KDE 4.7 with compositing enabled also.

Currently I'm running Fedora 17 with these:
kernel 3.4.6-2
libdrm 2.4.33
mesa-dri-drivers 8.0.3
xorg-x11-drv-nouveau 37.20120306gitf5d1cd2.fc17

The problem seems to occur randomly, but often while typing text in a Firefox
window.

Following the Debugging documentation, I have been able to log with SSH and use
gdb. From here, I can see that Xorg does not crash, the display and input just
seem "frozen".

Xorg log gives the following backtrace:

[ 10897.517] [mi] EQ overflowing.  Additional events will be discarded until
existing events are processed.
[ 10897.539] 
[ 10897.540] Backtrace:
[ 10897.769] 0: /usr/bin/X (xorg_backtrace+0x36) [0x4650a6]
[ 10897.769] 1: /usr/bin/X (mieqEnqueue+0x26b) [0x55111b]
[ 10897.769] 2: /usr/bin/X (0x400000+0x48062) [0x448062]
[ 10897.783] 3: /usr/lib64/xorg/modules/input/evdev_drv.so
(0x7f69244da000+0x60e4) [0x7f69244e00e4]
[ 10897.783] 4: /usr/bin/X (0x400000+0x80557) [0x480557]
[ 10897.783] 5: /usr/bin/X (0x400000+0xa4730) [0x4a4730]
[ 10897.783] 6: /lib64/libpthread.so.0 (0x3ce5000000+0xefe0) [0x3ce500efe0]
[ 10897.783] 7: /lib64/libc.so.6 (ioctl+0x7) [0x3ce48ea5f7]
[ 10897.783] 8: /lib64/libdrm.so.2 (drmIoctl+0x28) [0x7f6926b78548]
[ 10897.783] 9: /lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f6926b7a77b]
[ 10897.784] 10: /lib64/libdrm_nouveau.so.1 (0x7f6926533000+0x3085)
[0x7f6926536085]
[ 10897.784] 11: /lib64/libdrm_nouveau.so.1 (nouveau_bo_map_range+0x103)
[0x7f69265366b3]
[ 10897.784] 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f6926739000+0x6718) [0x7f692673f718]
[ 10897.784] 13: /usr/lib64/xorg/modules/libexa.so (0x7f6925ae7000+0xb007)
[0x7f6925af2007]
[ 10897.784] 14: /usr/bin/X (0x400000+0x1600f3) [0x5600f3]
[ 10897.785] 15: /usr/bin/X (0x400000+0xc99f0) [0x4c99f0]
[ 10897.785] 16: /usr/bin/X (0x400000+0x3161a) [0x43161a]
[ 10897.785] 17: /usr/bin/X (0x400000+0x3444a) [0x43444a]
[ 10897.785] 18: /usr/bin/X (0x400000+0x23485) [0x423485]
[ 10897.785] 19: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x3ce4821735]
[ 10897.785] 20: /usr/bin/X (0x400000+0x2375d) [0x42375d]
[ 10897.785] 
[ 10897.785] [mi] These backtraces from mieqEnqueue may point to a culprit
higher up the stack.
[ 10897.785] [mi] mieq is *NOT* the cause.  It is a victim.

I don't know if what I did with "gdb" was the correct way but the output next.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

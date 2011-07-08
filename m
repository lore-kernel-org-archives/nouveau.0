From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Fri,  8 Jul 2011 01:21:01 -0700 (PDT)
Message-ID: <20110708082101.5C87C13004F@annarchy.freedesktop.org>
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

--- Comment #55 from Ildar Muyukov <ildar-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> 2011-07-08 01:20:56 PDT ---
(In reply to comment #54)
> I can confirm I didn't had any freeze using 2.6.39 kernel on Lenovo T410 for 3
> days (I had several freezes per hour before), using GNOME Shell.

Frederic, you forgot to mention that it's now terribly unstable. I have regular
crashes like below, especially on: VT switching, Suspend-to-RAM, etc.

Details:
(II) NOUVEAU(0): NVLeaveVT is called.

Backtrace:
0: /usr/bin/Xorg (xorg_backtrace+0x28) [0x45de88]
1: /usr/bin/Xorg (0x400000+0x62449) [0x462449]
2: /lib64/libpthread.so.0 (0x7fc7e6fb2000+0xefc0) [0x7fc7e6fc0fc0]
3: /lib64/libc.so.6 (0x7fc7e5f00000+0x7427c) [0x7fc7e5f7427c]
4: /lib64/libc.so.6 (__libc_malloc+0x70) [0x7fc7e5f76600]
5: /usr/lib64/X11/modules/libexa.so (0x7fc7e3297000+0x8d44) [0x7fc7e329fd44]
6: /usr/lib64/X11/modules/libexa.so (0x7fc7e3297000+0x53c2) [0x7fc7e329c3c2]
7: /usr/bin/Xorg (0x400000+0xa4a20) [0x4a4a20]
8: /usr/bin/Xorg (ChangeWindowAttributes+0x2e3) [0x455e23]
9: /usr/bin/Xorg (0x400000+0x27c38) [0x427c38]
10: /usr/bin/Xorg (0x400000+0x2db61) [0x42db61]
11: /usr/bin/Xorg (0x400000+0x215ce) [0x4215ce]
12: /lib64/libc.so.6 (__libc_start_main+0xfd) [0x7fc7e5f1ec5d]
13: /usr/bin/Xorg (0x400000+0x21179) [0x421179]
Segmentation fault at address (nil)

Fatal server error:
Caught signal 11 (Segmentation fault). Server aborting

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

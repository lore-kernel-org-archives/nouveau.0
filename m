From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28320] Xserver hangs in an infinite loop
Date: Tue, 15 Jun 2010 07:09:29 -0700 (PDT)
Message-ID: <20100615140929.E70BD1300CA@annarchy.freedesktop.org>
References: <bug-28320-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28320-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28320

--- Comment #5 from Matej Cepl <mcepl-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> 2010-06-15 07:09:29 PDT ---
That " [mi] EQ overflowing" message is completely meaningless. Please, read
http://marc.info/?l=fedora-devel-list&m=124101535025331&w=2 and then take a
look at the disaster which happens when people start to file this message as a
bug at https://bugzilla.redhat.com/show_bug.cgi?id=465884. 

Much more interesting is this backtrace:

Backtrace:
[  5443.624] 0: /usr/bin/X (xorg_backtrace+0x28) [0x46c3c8]
[  5443.624] 1: /usr/bin/X (mieqEnqueue+0x1eb) [0x45b21b]
[  5443.624] 2: /usr/bin/X (xf86PostMotionEventP+0xc8) [0x472828]
[  5443.624] 3: /usr/lib64/xorg/modules/input/evdev_drv.so
(0x7f29c6ccc000+0x407f) [0x7f29c6cd007f]
[  5443.625] 4: /usr/bin/X (0x400000+0x6f6d7) [0x46f6d7]
[  5443.625] 5: /usr/bin/X (0x400000+0xf647a) [0x4f647a]
[  5443.625] 6: /lib/libpthread.so.0 (0x7f29ca790000+0xedf0) [0x7f29ca79edf0]
[  5443.625] 7: /lib/libc.so.6 (ioctl+0x7) [0x7f29c8f0bf17]
[  5443.625] 8: /usr/lib/libdrm.so.2 (drmIoctl+0x23) [0x7f29c881eeb3]
[  5443.625] 9: /usr/lib/libdrm.so.2 (drmCommandWrite+0x1b) [0x7f29c881f13b]
[  5443.625] 10: /usr/lib/libdrm_nouveau.so.1 (0x7f29c7741000+0x31ed)
[0x7f29c77441ed]
[  5443.625] 11: /usr/lib/libdrm_nouveau.so.1 (nouveau_bo_map_range+0xff)
[0x7f29c774439f]
[  5443.625] 12: /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(0x7f29c7947000+0x5f5d) [0x7f29c794cf5d]
[  5443.625] 13: /usr/lib64/xorg/modules/libexa.so (0x7f29c70de000+0x4637)
[0x7f29c70e2637]
[  5443.625] 14: /usr/lib64/xorg/modules/libexa.so (0x7f29c70de000+0x74d2)
[0x7f29c70e54d2]
[  5443.625] 15: /usr/lib64/xorg/modules/libexa.so (0x7f29c70de000+0x4817)
[0x7f29c70e2817]
[  5443.625] 16: /usr/bin/X (0x400000+0xb6a3a) [0x4b6a3a]
[  5443.625] 17: /usr/bin/X (ValidateGC+0x24) [0x447b54]
[  5443.625] 18: /usr/bin/X (0x400000+0x14758b) [0x54758b]
[  5443.625] 19: /usr/bin/X (0x400000+0x1476b0) [0x5476b0]
[  5443.625] 20: /usr/bin/X (0x400000+0x149d33) [0x549d33]
[  5443.625] 21: /usr/bin/X (ConfigureWindow+0xb22) [0x42a302]
[  5443.625] 22: /usr/bin/X (0x400000+0x378d7) [0x4378d7]
[  5443.625] 23: /usr/bin/X (0x400000+0x3830c) [0x43830c]
[  5443.625] 24: /usr/bin/X (0x400000+0x24de5) [0x424de5]
[  5443.625] 25: /lib/libc.so.6 (__libc_start_main+0xe6) [0x7f29c8e61a26]
[  5443.625] 26: /usr/bin/X (0x400000+0x24999) [0x424999]

Looks like a crash in libdrm (or maybe nouveau driver) to me.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M or GT218 with nouveau: X server hangs
 spontaneously
Date: Thu, 15 Jul 2010 15:44:20 -0700 (PDT)
Message-ID: <20100715224420.2CAF61300BF@annarchy.freedesktop.org>
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

--- Comment #27 from Dmytro Poplavskiy <dmytro.poplavskiy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-07-15 15:44:19 PDT ---
I also have the similar problem on GT240 on OpenSuse 11.3,
I hope the backtrace may help.


#0  0x00007fddfac33e87 in ioctl () from /lib64/libc.so.6
#1  0x00007fddf93ebc38 in drmIoctl (fd=10, request=1074291842,
arg=0x7fffca3b0330) at xf86drm.c:184
#2  0x00007fddf93edf3b in drmCommandWrite (fd=<value optimized out>,
drmCommandIndex=<value optimized out>, data=<value optimized out>, size=<value
optimized out>)
    at xf86drm.c:2398
#3  0x00007fddf8dad07d in nouveau_bo_wait (bo=0x829b00, cpu_write=<value
optimized out>, no_wait=<value optimized out>, no_block=<value optimized out>)
    at nouveau_bo.c:385
#4  0x00007fddf8dad68e in nouveau_bo_map_range (bo=0x829b00, delta=0,
size=<value optimized out>, flags=8) at nouveau_bo.c:428
#5  0x00007fddf8dac21a in nouveau_pushbuf_space (chan=0x8366c0, min=<value
optimized out>) at nouveau_pushbuf.c:53
#6  0x00007fddf8dac760 in nouveau_pushbuf_flush (chan=0x8366c0, min=0) at
nouveau_pushbuf.c:273
#7  0x00007fddf7f0e7a5 in ?? () from /usr/lib64/xorg/modules/libexa.so
#8  0x00007fddf7f10272 in ?? () from /usr/lib64/xorg/modules/libexa.so

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

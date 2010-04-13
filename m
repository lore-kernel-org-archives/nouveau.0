From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27603] [nouveau] Celestia 1.6.0 crashes with
 nv04_surface_copy_swizzle assertion
Date: Tue, 13 Apr 2010 04:18:50 -0700 (PDT)
Message-ID: <20100413111850.2777713005E@annarchy.freedesktop.org>
References: <bug-27603-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27603-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27603

--- Comment #9 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-13 04:18:49 PDT ---
Don't ask me why, but the stupid hack supposed to break things is what actually
worked best for me (on top of mesa master) :
http://paste.pocoo.org/show/201196/

I still think the proper fix will come with the new 2d engine. So it probably
does not matter much to find how that assert was reached, since it's all
already fixed.

That said, just for completeness, to print dst, you need to :
1) switch to frame 4 nv04_surface_copy_swizzle where the code asserts and where
dst is defined
2) build mesa with -O0 so that the value does not get optimized out

(gdb) frame 4
#4  0xb601c88b in nv04_surface_copy_swizzle (ctx=0x911c300, dst=0x928ec00, 
    dx=0, dy=0, src=0x92da248, sx=0, sy=0, w=64, h=64) at nv04_surface_2d.c:170
170            assert(!(dst->offset & 63));
(gdb) print dst
$1 = (struct pipe_surface *) 0x928ec00
(gdb) print *dst
$2 = {reference = {count = 1}, texture = 0x9339b20, 
  format = PIPE_FORMAT_B8G8R8X8_UNORM, width = 64, height = 64, layout = 0, 
  offset = 21844, usage = 128, zslice = 0, face = 1, level = 0}

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

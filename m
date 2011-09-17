From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau becomes very unstable after
 suspend/hibernate/resume (corrupted graphics and hangs with OpenGL
 applications) GeForce 9500 GT
Date: Sat, 17 Sep 2011 07:31:00 -0700 (PDT)
Message-ID: <20110917143100.CCD041301FD@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #68 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-17 07:31:00 PDT ---
We did futher testing and even though we had some promising results, it looks
like this bug is too hard to fix at least for myself.

We found following things:

1. Forcing nouveau to run POST tables (force_post=1) made the same corruption
as after suspend when we didn't use nvidia's ctxprog. The error reported was
the same (failure in MP1 of TP1).
Also, we managed to crash the system twice when force_post was set (running
supertuxkart)

Sadly, We couldn't crash the system anymore when we tried to repeat that
running Nexuz. Yet.

Also when I decoded the init tables, I found that they do setup of memory
controller, reclock the card, etc...

2. Nature of the crashes after resume from ram and nvidia ctxprog:
We found out that disabling of pageflip support made the crash occur less
often, also we found that 2D activity like opening firefox or changing virtual
desktop made system crash right away on condition that 3d app was already
running (we used unigine tropics for that I think)

3. Without nvidia ctxprog crashes happen as well.

4. We ruled out that that problem was that core clock is more that 1/2 of
shader clock. Its exactly 1/2

5. ....

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

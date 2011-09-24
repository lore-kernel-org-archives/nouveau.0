From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] Bad memory clock set on GeForce 9500 GT after
	resume
Date: Fri, 23 Sep 2011 17:16:27 -0700 (PDT)
Message-ID: <20110924001627.BC1081300A3@annarchy.freedesktop.org>
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

Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #90 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-23 17:16:26 PDT ---
I've rebuilt the kernel today from Linus Torvalds github repository and applied
darktama's patch.

Linux myhost 3.1.0-rc7+ #1 SMP Fri Sep 23 13:44:20 PYT 2011 x86_64 Intel(R)
Core(TM)2 Duo CPU E7500 @ 2.93GHz GenuineIntel GNU/Linux

So far things are very stable!

I've ran STK (100 laps) with glxgears and suspended many times, I also
suspended while in-game and things are very stable.

I also tried using KDE 4.7 with kwin opengl compositing after and before
suspending and things are very smooth and stable.

I'm going to close this bug report now and mark it fixed. calim and
MaximLevitsky already approved closing the bug report. calim have also stated
that the real fix has been merged into nouveau git master and that it will be
available in Linux 3.2. The commit is here:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=a51d43c1b27581e780f60b6d724d146db94b31c5

Thanks to everyone who have helped!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

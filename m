From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23730] x11-base/nouveau-drm fails on drm_fb_helper.c
 with 'EINVAL' undeclared
Date: Sun,  6 Sep 2009 00:45:25 -0700 (PDT)
Message-ID: <20090906074525.A0A8D130058@annarchy.freedesktop.org>
References: <bug-23730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23730


Maxim Britov <maxim.britov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID




--- Comment #3 from Maxim Britov <maxim.britov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-09-06 00:45:24 PST ---
Fixed in kernel 2.6.31-rc2-git1

http://www.kernel.org/pub/linux/kernel/v2.6/snapshots/patch-2.6.31-rc2-git1.log
commit 82e3310ace59794ecf0f531eca94647b2863dfda
Author: Tobias Doerffel <tobias.doerffel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Sun Jul 5 12:08:23 2009 -0700

    linux/sysrq.h needs linux/errno.h

    In include/linux/sysrq.h the constant EINVAL is being used but is undefined
    if include/linux/errno.h is not included before.

    Fix this by adding #include <linux/errno.h> at the beginning.

    Signed-off-by: Tobias Doerffel <tobias.doerffel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
    Signed-off-by: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
    Signed-off-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

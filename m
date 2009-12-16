From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25658] Move to loadable firmware breaks suspend on
	nVidia 9800M
Date: Tue, 15 Dec 2009 16:21:29 -0800 (PST)
Message-ID: <20091216002129.A2C311300CB@annarchy.freedesktop.org>
References: <bug-25658-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25658-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25658





--- Comment #4 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-12-15 16:21:29 PST ---
I also suspected loadable firmware initially, but then I quickly moved to
suspecting all the ttm changes.
It's the last merge that broke it for me :
commit 12b59e64a4df9f4298a2abb8b331074adea113ed

curro pointed me to the following fix on dri-devel by airlied :
http://www.mail-archive.com/dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org/msg45533.html

It seems that fixed suspend for me. But I still have troubles resuming, I get
pixmap corruption problem in X. After reloading X, it is fine.

However, there is also a known bug in nouveau code, fixed by curro :
http://lists.freedesktop.org/archives/nouveau/2009-December/004266.html

This last patch seems to correct a very obvious bug/overlook. But it causes
other problems for me when resuming :
Dec 15 18:50:06 xps-m1530 kernel: [   42.706924] [drm] nouveau 0000:01:00.0:
Reinitialising engines...
Dec 15 18:50:06 xps-m1530 kernel: [   42.709976] [drm] nouveau 0000:01:00.0:
Restoring GPU objects...
Dec 15 18:50:06 xps-m1530 kernel: [   42.742509] [drm] nouveau 0000:01:00.0:
Restoring mode...
Dec 15 18:50:06 xps-m1530 kernel: [   42.742513] [drm] nouveau 0000:01:00.0: bo
ffff88011d2b1400 pinned elsewhere: 0x00000002 vs 0x00000004
Dec 15 18:50:06 xps-m1530 kernel: [   42.746882] [drm] nouveau 0000:01:00.0: bo
ffff88011d2b1400 pinned elsewhere: 0x00000002 vs 0x00000004
Dec 15 18:50:06 xps-m1530 kernel: [   42.746885]
[drm:drm_helper_resume_force_mode] *ERROR* failed to set mode on crtc
ffff88011c51c000

The screen stays black. Reloading nouveau blindly fixes it though.
Some other times, resuming caused hardlock, but I suspect it's related to this
same bo/ttm problem.

Just give me another year and I might find something :)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

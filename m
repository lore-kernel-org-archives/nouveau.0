From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25451] Nouveau fails to resume on NV50 board
Date: Fri,  4 Dec 2009 14:49:19 -0800 (PST)
Message-ID: <20091204224919.461F81300C8@annarchy.freedesktop.org>
References: <bug-25451-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25451-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25451





--- Comment #1 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-12-04 14:49:18 PST ---
I think I ran into some issue resuming on nv50 today as well. But in my case
the laptop was completely locked, sysrq did not even have any effect. After
rebooting, I had no traces at all of the resuming.

So I suspect a regression happened between :
2009-12-04 14:00 Ben Skeggs  drm/nv50: very initial DisplayPort support
3ca22d107d7622ce56e2aac356ead815e7f42d69
and
2009-12-01 15:05 Ben Skeggs  drm/nv50: (hopefully) more correct LVDS output
script selection  91f44d691472ce505bec75cc26e3b185b1556cc7

However the bad? news is that the following suspend/resume went fine. If there
is some randomness involved, it will be harder and longer to test.

But maybe my issue is completely unrelated.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36382] Frozen graphics and corrupted second monitor
 (mouse still moves)
Date: Sat, 23 Apr 2011 11:55:07 -0700 (PDT)
Message-ID: <20110423185507.B62A3130056@annarchy.freedesktop.org>
References: <bug-36382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36382

--- Comment #3 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-04-23 11:55:03 PDT ---
Funny, I also experienced corrupted second monitor after doing the same
upgrade. But not frozen graphics. Well I think it froze only once, and after
some time, so it was not easily reproducible.

After updating to latest git of everything (kernel, drm, ddx), I still got the
same corruption, and not a single gpu lockup. I just found one combination of
xrandr commands that would crash X every time, but no big deal.

Anyway as Emil said, I found many workarounds to my problem (if it's the same)
:
- use wrappedfb in xorg.conf (which was the default before the upgrade)
- use xft to render fonts
- don't run xrandr settings before the wm

So I am curious to know how this would work for you.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

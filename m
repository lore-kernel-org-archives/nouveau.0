From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35901] two full hd displays (left and right) with
 nouveau does not work any more
Date: Fri, 20 May 2011 08:34:05 -0700 (PDT)
Message-ID: <20110520153406.0ABB113004E@annarchy.freedesktop.org>
References: <bug-35901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35901

--- Comment #15 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-05-20 08:34:05 PDT ---
Here as some things you can try - not too sure it they may work as I do not
have a nv40 card

xorg.cong options:

* Try enabling/disabling the WrappedFB - it is known to cause issues in some
rare cases
* Disable PageFlip
* Disable AIGLX

Looking at the "16 pixels overlap" it does give me some ideas that tiling may
be responsible, thus on top of master(xf86-video-nouveau) you can try reverting
some commits
Note that in some cases reverting can cause other visual "bonuses"

* xv: use nouveau_bo_new_tile() - c2d341f7e0a0dc70a28c6091ef6919fc6c0d60561

* nv10-nv40/exa: Fix tiled pixmap pitch alignment calculation -
8c8f15c9d3a31c35bf2ef20faf8c4133295a678f

* Restructure tiled pixmap allocation in a single place -
75daada678d03d2e162f8003a6f2edcbe0525f92

* Allocate a tiled scanout on pre-nv50 too -
c88f13e25b0040c1dd0f93e0ac40f62a6005ce59

I hope it helps

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

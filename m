From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Sat, 17 Apr 2010 04:06:19 -0700 (PDT)
Message-ID: <20100417110619.83C0713005D@annarchy.freedesktop.org>
References: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

--- Comment #15 from Christopher James Halse Rogers <chalserogers-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-17 04:06:19 PDT ---
So, the pertinent changes between Lucid Alpha 3 and Beta 2 would be:
Alpha 3 had the nouveau kernel module + drm + ttm from linux 2.6.33 + the
ctxprog voodoo generator backported, in the out-of-tree
linux-backports-modules.
Beta 2 has the drm stack from 2.6.33.2 + a number of fixes pulled in from
nouveau/linux-2.6

If you're interested in bisecting, it should be quicker to start with 2.6.33.2
- if that works, then the problem is in one of the small number of backported
nouveau patches we've got.  If it doesn't, it should be relatively quick to
bisect from 2.6.33 to 2.6.33.2

If you're uncomfortable building this stack from source, the xorg-edgers PPA
has recent snapshots, available here:
https://edge.launchpad.net/~xorg-edgers/+archive/ppa

If that works, then this bug can be closed because it's already fixed.  If that
doesn't work then you'll probably need to do some building from source in order
to identify which change broke it.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

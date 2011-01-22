From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33222] random hang-up with nouveau when browsing
 with Google chrome
Date: Sat, 22 Jan 2011 06:58:08 -0800 (PST)
Message-ID: <20110122145808.E68C213004D@annarchy.freedesktop.org>
References: <bug-33222-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33222-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33222

--- Comment #6 from Zhang Chi <zhangchi866-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-01-22 06:58:08 PST ---
I have to mention that this bug is quite like
https://bugs.freedesktop.org/show_bug.cgi?id=26980
except when I pressed SysRq+E, when the harddisk indicator is no longer
flashing, the screen is still locked up, with the last screen in X, and a mouse
able to move.

Both xf86-video-nouveau and mesa are from git repo.
for xf86-video-nouveau I used:
./configure --prefix=/usr
and for mesa:
./configure --enable-glx-tls --with-dri-drivers= --enable-gallium-nouveau
--disable-gallium-i915 --disable-gallium-i965 --disable-gallium-radeon
--disable-gallium-r600 --disable-gallium-svga --with-state-trackers=glx,dri
--prefix=/usr

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

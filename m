From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35452] Pageflipping + nouveau + compiz + fullscreen
	== FAIL
Date: Wed, 04 Jan 2012 18:22:36 +0000
Message-ID: <bug-35452-8800-M9uQYldV7r@http.bugs.freedesktop.org/>
References: <bug-35452-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35452-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35452

--- Comment #22 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2012-01-04 10:22:36 PST ---
OK, here are the full results:

All tests done without any composition manager using specific scene from
neverball with accuracy +=1FPS:

1. without any patches: 100 FPS
2. with your patch: 94 FPS
3. with ugly xserver workaround I used before: 84 FPS

Then I tested with kwin and 'unredirect full screen windows' option, and I
confirm that your patch indeed fixes the issue, the issue of crazy kwin after I
end the game 

(I had this with compiz as well - had to stop using it, its just too buggy
nowadays and its not nouveau fault, I checked, besides kwin finally is good
both performance and feature wise, and integrates well into KDE).

Also I noticed though that if I don't redirect full screen windows (and I don't
as I prefer just to disable composing - its easy with kwin, and I had enough of
problems with this option, everything works fine without any patches. Thus if I
forget to disable composing, game runs, abet slow - 67 FPS).

So thanks, but it would be great somehow to eliminate the overhead in case
composing manager is not running, which not the case yet.

Thank a lot for looking into this,
Best regards,
     Maxim Levitsky

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17462] XVideo Overlay adaptor is jerky on HD videos
	(NV18 card)
Date: Sun, 19 Oct 2008 09:34:08 -0700 (PDT)
Message-ID: <20081019163420.EF38E130143@annarchy.freedesktop.org>
References: <bug-17462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-17462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17462





--- Comment #7 from Danny <moondrake-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-09-26 05:19:55 PST ---
one or two days ago, somebody reported the overlay actually not working at all
on nv18gl with current git. Can you confirm this?

d.


--- Comment #8 from Diogo Franco <diogomfranco-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-10-19 09:34:05 PST ---
Sorry for the long delay in the answer... Yes, I get only a blue screen if I
use the Overlay; the Blitter is fine.

Btw, he jittering problem also happens on the Blitter when CPU usage is
topping, like just after starting or unpausing a video; but returns to normal
shortly afterwards.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

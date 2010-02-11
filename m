From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26102] Rotating one monitor of a dual-head setup
 causes cursor problems
Date: Wed, 10 Feb 2010 17:33:30 -0800 (PST)
Message-ID: <20100211013330.94CB61300EB@annarchy.freedesktop.org>
References: <bug-26102-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26102-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26102





--- Comment #5 from Drew Frank <drewfrank-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-02-10 17:33:29 PST ---
(In reply to comment #4)
> Could you try again with latest git?
> 

Latest git build fixes the problem :).  Thanks, developers!

I do notice a new issue, where my cursor is not constrained to my monitor
space.  i.e. my setup looks like this:
              _____
 ___________ |     |
|           ||     |
|   Mon1    ||Mon2 |
|___________||     |
             |_____|
and my cursor is able to move beyond the top and bottom of Monitor 1. 
Similarly, it can move across the left boundary of Monitor 2 from the highest
and lowest points into the same regions.  It seems like the cursor should be
screen should be constrained such that this can't happen.  Perhaps this belongs
in its own bug report, though.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

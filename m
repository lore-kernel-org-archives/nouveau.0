From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33222] random hang-up with nouveau when browsing
 with Google chrome
Date: Sat, 22 Jan 2011 06:43:19 -0800 (PST)
Message-ID: <20110122144319.2DA6313004D@annarchy.freedesktop.org>
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

--- Comment #3 from Zhang Chi <zhangchi866-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-01-22 06:43:18 PST ---
Finally I caught lines like:

  Failed to idle channel 2.
  Ctxprog is still running
  PGRAGH idle timed out with status 0x00100101
  Ctxprog is still running
  PGRAGH idle timed out with status 0x00100101
  PGRAGH idle timed out with status 0x00100101
  ......(something about fifo 3, this time no failure but "Ctxprog is still
running" for 2 times)

when X is locked up and I was trying to reboot. It took 17 secs.
Adding
LIBGL_ALWAYS_INDIRECT=1
and
LIBGL_ALWAYS_SOFTWARE=1
almost makes no difference. X continues to be locked up, usually once a day,
not in certian time of the day, however.

I hope these information can be useful enough, as I can not come up with
anything else.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

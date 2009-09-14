From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23847] kernel BUG when using nouveau
Date: Mon, 14 Sep 2009 11:48:02 -0700 (PDT)
Message-ID: <20090914184802.3F69013005C@annarchy.freedesktop.org>
References: <bug-23847-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23847-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23847





--- Comment #7 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-14 11:48:01 PST ---
From what has been reported here, this looks like a race in a completely
irrelevant (to nouveau) part of the kernel. It happens randomly, more often
when nouveau.ko KMS is loaded early, and less often when nouveau.ko loads
later. AFAIK no-one has yet managed to hit it completely without Nouveau, which
is somewhat concerning. My guess is that nouveau alters the kernel code
execution timings and makes a race elsewhere a lot more failure prone.

Some suggestions:
- search kernel mailing lists for CFQ bug reports (since it seems to happen in
CFQ code)
- try to reproduce it without nouveau, e.g., try an old FB driver
- try enabling heavy debugging features in the kernel config, like kmemcheck or
kmemleak

I'm trying to steer this away from Nouveau first, because it looks very
difficult to debug.

In the future, please provide full kernel logs from boot, and set attachment
type to text/plain.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

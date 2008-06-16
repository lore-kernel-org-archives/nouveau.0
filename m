From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16375] Xv frame rate > refresh rate causes 100% CPU
	usage
Date: Mon, 16 Jun 2008 04:31:58 -0700 (PDT)
Message-ID: <20080616113159.0952113005A@annarchy.freedesktop.org>
References: <bug-16375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16375





--- Comment #1 from Arthur Huillet <arthur.huillet-dFvTVMYgtfk@public.gmane.org>  2008-06-16 04:31:58 PST ---
Since this person forgot to mention it (I'm wondering why this deliberate lack
of precision), this concerns the blitter and texture adapter. There are reasons
to believe the overlay does not have this problem, though nothing was proven at
this point.

Some design changes may be necessary to fix this, I'm leaving it to anybody
interested because I have not investigated the issue and do not intend to.

The suggestion of adding a sleep in notifier waits does not fix this problem
but a very partly related issue (eating CPU when waiting), and has already been
discussed in the past and considered incorrect due to insufficient precision of
the wait (and maybe other things, I happen not to remember).

Thanks for the comment at the end which - despite being only partly related
again - explains the strange behavior all of us have observed on all adapters
whenever the card was really too slow. Is there a possible fix here?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

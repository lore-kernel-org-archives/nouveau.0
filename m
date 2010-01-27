From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25966] nv25 : rxvt scrolling is very slow
Date: Wed, 27 Jan 2010 08:26:14 -0800 (PST)
Message-ID: <20100127162614.6B94F130092@annarchy.freedesktop.org>
References: <bug-25966-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25966-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25966





--- Comment #16 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2010-01-27 08:26:13 PST ---
(In reply to comment #14)
> Created an attachment (id=32833)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32833) [details]
> oprofile with debug symbol
> 
> So your cpu got sse2 ?

It does.

I installed rxvt 2.7.10, but there is no rxvt-xpm that appears in your profile,
and scrolling it furiously while full of text still leaves me with at least 70%
of CPU idle.

What else should we try to reproduce this? Is it an rxvt-clone of some sort, or
some extra features enabled? Perhaps you have a different font configuration?

Did you search the bugzilla? I recall this is not the first report of rxvt
slowness, but I cannot remember where I read about it, nor what was the
resolution, if any.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

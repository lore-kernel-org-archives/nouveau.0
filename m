From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22763] suspend doesn't works
Date: Tue, 14 Jul 2009 05:21:57 -0700 (PDT)
Message-ID: <20090714122157.BF13F13005A@annarchy.freedesktop.org>
References: <bug-22763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22763-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22763





--- Comment #5 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-07-14 05:21:57 PST ---
On Tue, 2009-07-14 at 04:44 -0700, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
wrote:
> http://bugs.freedesktop.org/show_bug.cgi?id=22763
This is the intended behaviour currently, suspend will fail (and that
patch *definitely* will since you're using KMS) so I made the nouveau
module refuse to suspend.

I've been working on this a bit this week, and have code that *may* work
on your system.  It'll hit git later this week perhaps, there's still a
couple of issues to iron out.

Ben.
> 
> 
> 
> 
> 
> --- Comment #4 from Francesco Marella <francesco.marella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-07-14 04:44:56 PST ---
> Created an attachment (id=27678)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=27678)
>  --> (http://bugs.freedesktop.org/attachment.cgi?id=27678)
> pm-powersave
> 
> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

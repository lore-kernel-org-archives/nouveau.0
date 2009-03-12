From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20612] nouveau xv crash with BadMatch (invalid
 parameter attributes)
Date: Thu, 12 Mar 2009 03:00:59 -0700 (PDT)
Message-ID: <20090312100059.430A2130057@annarchy.freedesktop.org>
References: <bug-20612-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20612-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20612





--- Comment #3 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-12 03:00:58 PST ---
(In reply to comment #2)
> Unfortunately this is the current expected behaviour.  If you run an XRENDER
> base composite manager (xcompmgr is fine) Xv will work.  Hopefully we'll be
> able to remove this limitation in the future.
> 
> The errors you mentioned are also expected, and harmless.  We're looking at
> what's going wrong there however :)
> 

I just enabled composite in xorg.conf (not enabled by default), and started
xcompmgr -a, and xv works perfectly now, thanks!

However I could not find anything when searching for this issue, is it
mentioned somewhere?
I did not find existing bug reports, and maybe this limitation could also be
mentioned on the main page ( http://nouveau.freedesktop.org/wiki/ ) since there
is a decent workaround.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

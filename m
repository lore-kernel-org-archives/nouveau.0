From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30375] (NV34) X server using 100% cpu with latest
 nouveau.git and xf86-video-nouveau.git
Date: Thu, 30 Sep 2010 15:40:27 -0700 (PDT)
Message-ID: <20100930224027.9A0E013000D@annarchy.freedesktop.org>
References: <bug-30375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30375

--- Comment #3 from walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-30 15:40:27 PDT ---
Oh dear, I spoke much too soon.  I just discovered that the bug disappeared
only because I forgot to change xorg.conf from nv back to nouveau :-(

Now that I really *am* using nouveau, the CPU is still pegged at 99% by Xorg
when viewing the npr.org website with the latest nightly build of firefox.

One new observation that I didn't notice earlier is that minimizing the firefox
window completely eliminates the cpu overload.

When I restore the firefox window, the cpu overload resumes exactly as before.
I hope this may give you some clue about the cause of the problem.

Again, I've looked closely at my amd64 builds of firefox and nouveau-related
packages and there is no sign of this cpu overload problem.  Just on i686.

I'd be more than happy to build profiling versions of X/nouveau if such
versions exist, but I'll need some hints to get started.

Many thanks.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

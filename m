From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30375] (NV34) X server using 100% cpu with latest
 nouveau.git and xf86-video-nouveau.git
Date: Sun, 26 Sep 2010 17:00:47 -0700 (PDT)
Message-ID: <20100927000047.A33F31300FD@annarchy.freedesktop.org>
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

--- Comment #2 from walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-26 17:00:47 PDT ---
On 09/26/2010 01:59 PM, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=30375
>
> --- Comment #1 from Robert Kaiser<kairo-mUdhYT1RRAM@public.gmane.org>  2010-09-26 13:59:24 PDT ---

> Are you sure it's not something like Flash, which accesses graphics directly?

Excellent clue, thanks.  The problem was not a plugin, but rather an add-on :-/

When I download and run the nightly builds from mozilla I never install any
plugins for my brief tests -- but just now when I looked at about:plugins I
noticed an add-on that I'd installed for converting video formats in real time.

The bit that confused me is that the add-on was installed in my ~/.mozilla
directory instead of the firefox/plugins directory, so it was still messing
things up even when running the nightly builds "with no plugins".

The probability of encountering mysterious screw-ups gets closer to 1 with
every passing day :)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

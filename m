From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Tue, 27 Sep 2011 07:05:56 -0700 (PDT)
Message-ID: <20110927140556.CC8731301B3@annarchy.freedesktop.org>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #16 from rick <rick.hendricksen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-27 07:05:55 PDT ---
(In reply to comment #15)
> (In reply to comment #13)
> [snip]
> > Brightness control does not work before suspend, I did not try suspending. So
> > no.
> [snip]
> > I tried that. It works exactly the same as without this option. Brightness
> > control works fine before suspend, fails after.
> 
> I see a bit of contradiction in here
> 
> Firstly can you try nouveau kernel git tree [1], as it includes some patches
> regarding backlight/brightness
> 
> Note: Fedora may have precompiled package that is up-to date (search for koji)

I cloned the git repo you linked, and compiled my kernel (which works), but it
has the exact same issues as before.
$ uname -r
3.1.0-rc7+

> If it still fails please record the following 
> 
> example
> "with option "xxxxx" (acpi_backlight=vendor, nouveau.force_post=1)
> before suspend - works, after - stuck"
> 
with option: none
before suspend: works, after: stuck to low value
with option: nouveau.force_post=1
before suspend: stuck to low value, after: stuck to low value
with option: acpi_backlight=vendor
before suspend: works, after: stuck to low value
with option: acpi_backlight=vendor nouveau.force_post=1
before suspend: stuck to low value, after: stuck to low value

> it may be worth checking the registers (see comment 7) in each case as well

Maybe tomorrow, it took me long enough to get that kernel working. (I need
envytools right?)

> Cheers
> Emil
> 
> [1] http://cgit.freedesktop.org/nouveau/linux-2.6/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

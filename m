From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Sat, 17 Apr 2010 02:48:10 -0700 (PDT)
Message-ID: <20100417094810.38B0213005D@annarchy.freedesktop.org>
References: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

--- Comment #14 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-04-17 02:48:09 PDT ---
(In reply to comment #13)
> In any case, I don't think this could be due to ubuntu patches because the
> behavior is the same with fedora 13 beta
> 
> The versions used by fedora seem a bit more recent :
> kernel 2.6.33.1-24-fc13.i686
> xorg-x11-drv-nouveau 1:0.0.16-2.20100218git2964702.fc13
> libdrm 2.4.19-1.fc13

Fedora has the advantage that its maintained and supported by a nouveau
developer (actually the main one working on the kernel side). But you also
should use the distrib bug tracker in that case.

Going back to ubuntu, it's not just a matter of what custom patches they have
applied (though that's very important to know too), but also what changed
between the working and broken version.
You said the main new changes was a quirk to disable accel ? How could that be
the problem, since the new version only works when accel is disabled, and you
need to do that manually ?
Anyway it seems the noaccel quirks do no affect your card, and should cause a
message to be displayed when they are used.
http://people.canonical.com/~apw/raof-nv-accel-lucid/

Building latest code manually has several advantages :
- check if it has already been fixed there
- easy way for everyone to see what code you tried
- you can update whenever you want, and quickly apply patches if needed
- if it's indeed a regression, you can git bisect it to find the offending
commit

Instructions are there :
http://nouveau.freedesktop.org/wiki/InstallNouveau
http://nouveau.freedesktop.org/wiki/InstallDRM

PS : a lot of what I said here is not specific to that bug, more a general
concern about how nouveau bugs should be handled

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

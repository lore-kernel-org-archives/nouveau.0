From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] Bad memory clock set on GeForce 9500 GT after
	resume
Date: Mon, 19 Sep 2011 07:43:33 -0700 (PDT)
Message-ID: <20110919144333.C1B481300BD@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #77 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-19 07:43:32 PDT ---
I found another way to hung/crash the system.

1- Boot into console mode (id:3:initdefault: in /etc/inittab)

2- start X (and just X) in tty1

3- switch to tty2 and start STK in that tty2.

start STK in tty2 like this:

export DISPLAY=:0
/usr/local/games/supertuxkart  --profile-laps=50000 --fullscreen

when I start STK like that it would attempt to switch to X as soon as STK is
launched.

Then X would hung right there, it wont even start STK, but it would hung as
soon as the VT is switched to X, then I would get errors like this one:

[ 17583.534] (EE) NOUVEAU(0): failed to set mode: Permission denied
Fatal server error:
[ 17583.534] EnterVT failed for screen 0

It seems like this issue is more related to this bug than anything else:
https://bugzilla.redhat.com/show_bug.cgi?id=680677

If I try to do the same, e.g. reboot the machine, login into tty1, start X,
switch to tty2, login into tty2, start glxgears in tty2, nothing happens... it
doesn't even switch right back to X when I start glxgears in tty2, it runs
glxgears and I see output in tty2, and I can switch to tt7 where X is running
(alt+f7) and see glxgears running in there.

But whether I try the same with STK, it would attempt to switch to X directly
and hung the machine.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

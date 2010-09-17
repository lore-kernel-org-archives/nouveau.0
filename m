From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Thu, 16 Sep 2010 23:09:10 -0700 (PDT)
Message-ID: <20100917060910.6FB3913008B@annarchy.freedesktop.org>
References: <bug-30158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30158

--- Comment #12 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-16 23:09:10 PDT ---
(In reply to comment #11)

Hello,

thanks for the clarifications and sorry about the packed log files, I didn't
know that.

As you suggest I took a look into the log files myself. The log files for the
config I have now (comes up without error, works fine) actually do show nv is
used.

But in the log files for the other config that was at least working somehow
(nouveau kernel mode setting enabled and X forced to throw an error) I really
can't figure which driver is used. Don't find any output either for nv, nouveau
or anything else that might be a driver.

The log file for the case "blank screen" does show nouveau is used, there is -
as you say - a lot of output from it. But as far as I can tell there are no
nouveau errors to be seen. So nouveau configured correctly does not work and
does not throw an error. But only for the external monitor, internal monitor
does work.

I hope somebody will be interested and take care of this bug. It took me such a
long time and hard effort to get around this prob and also, I'd like to use a
proper kernel mode driver (as you put it). Using the config that forces X to
throw an error isn't really a permanent option, because a) I can't figure if
that is using nouveau and b) this considerably makes startup time longer since
it needs 2 user interactions plus an X server restart. Also, a config that
begins with a system error is nothing I can trust in, might cause problems
later I just didn't encounter yet.

I use nv now and wait to see if that bug gets fixed sometime.

Best regards, Michael

PS I don't think I have to disable / unload nouveau completely to use nv. I
followed the link given above to the nouveau troubleshooting FAQ, and there
they said, you may unload nouveau, but you don't have to - disabling kernel
mode switching should be sufficient. I'd prefer to use nouveau when sometime
the bug will be fixed so I don't want do disable it completely now. The nv
config I have now works correct, as of yet I did not find any graphics related
problem and I have checked quite some points now with it, so as of now I don't
see the necessity / benefit of unloading nouveau completely.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

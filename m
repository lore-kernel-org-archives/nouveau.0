From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40572] [nvac] Nouveau drm causes failure to resume
 from suspend with any kernel newer than 2.6.36
Date: Sat,  3 Sep 2011 09:27:32 -0700 (PDT)
Message-ID: <20110903162732.83F00130153@annarchy.freedesktop.org>
References: <bug-40572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40572

--- Comment #10 from Daniel Lindgren <dali.spam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-03 09:27:32 PDT ---
(In reply to comment #9)
> 1) If without nouveau you cannot resume properly, then your problems with
> nouveau are not nouveau fault. Maybe you could fiddle with some BIOS options
> and see how it will affect s/r.

I've done that in the past, when the problems started with kernel 2.6.37.
Couldn't find anything that improved the situation.

> 2) Machine Check Exceptions report *hardware errors* - your hardware is
> probably dying.
> 
> I have no idea why it started with kernel upgrade.

1) Resume/suspend with any kernel older than 2.6.37 works without a hitch, no
MCE.
2) Besides resume problems, the machine is rock solid with both older and newer
kernels.
3) When nouveau is blacklisted, there is no MCE. The machine wakes but doesn't
activate the monitor correctly, I can however ssh into the machine.
4) I have no problems with resume/suspend when running Windows 7 on the machine
and no crashes either.

Semms unlikely to me that if the hardware truly is faulty the only situation it
ever shows up is when nouveau is loaded during a resume from suspend with a
kernel newer than 2.6.36.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

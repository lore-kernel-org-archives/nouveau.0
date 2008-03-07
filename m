From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] External analog monitor does not show part of
 the output ( Randr12)
Date: Fri,  7 Mar 2008 08:47:59 -0800 (PST)
Message-ID: <20080307164800.B7D2313011E@annarchy.freedesktop.org>
References: <bug-14859-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14859-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14859





--- Comment #9 from Jacopo <sbriglie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-07 08:47:56 PST ---
(In reply to comment #8)
> Some ideas of things to test:
> 1) Is the situation any better if the external head is plugged at boot?
> 

This is funny: it is reversed like this

xxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxx
oooooooooooooooo
oooooooooooooooo
oooooooooooooooo
oooooooooooooooo

meaning the top third or so is black, while the rest is ok, in full width this
time.


> 2) If nouveau does not bring up the lvds head, does the external head work? --
> to test this, add "return XF86OutputStatusDisconnected;" to the top of
> nv_lvds_output_detect in nv_output.c

This does not change anything with respect to attaching the second head while X
is running: the left stays black

> 3) Attaching the output of "radeontool regs" to the bug (when both heads are
> plugged and nouveau is running) would be interesting.
> 
> 4) Likewise, comparison reg dumps if suggestions 1) or 2) work would be
> invaluable.
> 

I'm attaching reg dumps in the two different situations, plus the xorg log with
the second head plugged at boot


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

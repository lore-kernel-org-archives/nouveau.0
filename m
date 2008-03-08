From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14859] External analog monitor does not show part of
 the output ( Randr12)
Date: Sat,  8 Mar 2008 04:29:58 -0800 (PST)
Message-ID: <20080308123003.D62A2130051@annarchy.freedesktop.org>
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





--- Comment #16 from Jacopo <sbriglie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-08 04:29:54 PST ---
(In reply to comment #15)
> Is the external head a real CRT, or instead an LCD over an analogue connection?
> 

This time it was a real CRT, the previous tests were with an LCD over analogue

> For the situation where the top of the screen is missing (plugged at boot),
> what happens if you start nouveau -- does the top half stay missing, or does it
> change to the side being missing? Does this change if you disable the laptop
> display as described previously, and have the external head plugged in before
> starting X?
> 

Well, at boot the external became all white with flickering when the kernel got
loaded and then when X started it came up displaying the bottom two thirds with
the top one black. I then tried unplugging, replugging, restarting X with the
monitor unplugged, etc. but the behavior remained this, it never reverted to
the situation "left third off" that happens when the external head is not
plugged at boot but hotplugged during a X session. In order to see again the
"left off" behavior I had to reboot keeping the monitor unplugged.

Disabling the laptop display does not change anything: if the monitor is
connected at boot the top is off when X starts, if instead (after a reboot) I
connect it before starting X the left stays off.

So I would say that the difference in behavior is given by having the monitor
connected at boot time. There's no difference instead between connecting it
before X starts or with X running.

> If when nouveau is running and the screen was plugged at boot the external
> display is any different to how it looks when hotplugged, a register dump would
> also be useful -- I'm guessing the previous one was done from just offb?
> 

No, both regdumps were done with the external head connected and working under
nouveau, the first one is when the external head was connected at boot (and so
top missing), the second one when it was simply hotplugged during a X session
(left missing). I didn't make myself clear on this.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

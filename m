From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19854] XrandR reports no CRTCs for VGA-0 output
 until the first time a display is plugged
Date: Tue, 10 Feb 2009 10:52:58 -0800 (PST)
Message-ID: <20090210185258.E8BE2130057@annarchy.freedesktop.org>
References: <bug-19854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19854-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19854





--- Comment #5 from Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-10 10:52:58 PST ---
(In reply to comment #3)
Sorry for the delay...

> Agreed that the crash is a bug, and the <never plugged> vs
> <plugged>,<unplugged> inconsistency is an issue.  Can you confirm the following
> patch resolves both these problems?
> 
It solves the crash, but I can't test with an external display unless I carry
the laptop to work, which I'd prefer not to do again... maybe there is someone
else who can reproduce the bug and test the fix?. If not, I'll try to do it
when I can.

> As for 2) above, while in the VGA-0 case listing CRTCs when disconnected is
> possible, it really isn't for DVI-I until a monitor is plugged (as the
> available CRTCs vary depending on whether it's an analogue or digital
> connection).  I think I'd prefer to retain a consistent approach across all
> connector types, and get other things that make bad assumptions get fixed
> sooner :-) (is there any real-world case where the usefulness of providing a
> crtc list for unused connectors exceeds the problem that it won't work half the
> time (DVI)?)
> 
I don't know, the only known problem is with xscreensaver which is arguably
buggy. OTOH if there are cases where a CRTC can't drive some displays, it is
correct to simply return an error at modesetting time, no? (I took a look at
the randr spec, but may be misremembering it). In other words, I'm fine with
whatever you decide to do, I don't know better. :-)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

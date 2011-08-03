From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37922] NV86: too high power usage.
Date: Tue,  2 Aug 2011 20:12:30 -0700 (PDT)
Message-ID: <20110803031230.CB35B13010C@annarchy.freedesktop.org>
References: <bug-37922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37922

--- Comment #14 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-08-02 20:12:30 PDT ---
@Martin: I tested your patch and of course it works.
Once small note is that you probably also want nouveau stop writing 0x4000 to
that register initially. With your patch that flag is unset on first ctxprog
invocation, so it doesn't matter much, yet nouveau shouldn't set it if blob
doesn't.

I also reduced trace futher.
I also sadly note that my full reclocking trace reduces system stability a lot
(supertuxkart crashes just after 1~2 laps and hangs the system).
(Although due to low clocks involved it might just expose better hangs I had
due to nouveau drivers....)

Also, the register 0xc040, I poked this evening a lot does play some role in
blob reclocking, yet though I don't have any ideas on how to nail down its
contents.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

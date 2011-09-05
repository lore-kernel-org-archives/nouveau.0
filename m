From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40548] Displayport not working on NV50
Date: Mon,  5 Sep 2011 11:59:54 -0700 (PDT)
Message-ID: <20110905185954.60A8413012E@annarchy.freedesktop.org>
References: <bug-40548-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40548-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40548

--- Comment #8 from Felipe Contreras <felipe.contreras-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-05 11:59:54 PDT ---
(In reply to comment #7)
> Thanks Felipe for the logs
> 
> It would have been great if you could tell us if the DP monitor is working at
> boot, and at what exact moment it switches off - i.e. load of radeon/nouveau

No, it doesn't work at boot, and it never switches off. The led turns blue, as
if it just received signal, but it stays black. The back-light is on and
everything, there's just nothing there.

> Looking at your logs it appears that you have a laptop with two cards/gpus

Nope.

> Have you looked at Optimus [1]?

What is that?

> Does this setup work with the proprietary driver ?

Yes.

> For some reason Xorg.log is saying that you have 2 monitors connected to your
> laptop, apart from the LVDS

I do.

> AFAIK nouveau/nvidia cannot control more than two outputs, thus can you try
> only one at a time ?

I'll try, but my LVDS is broken, so it would be tricky.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

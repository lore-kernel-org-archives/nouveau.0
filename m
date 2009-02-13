From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Fri, 13 Feb 2009 05:22:03 -0800 (PST)
Message-ID: <20090213132204.3A5D3130057@annarchy.freedesktop.org>
References: <bug-20006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20006





--- Comment #19 from bmaass <bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org>  2009-02-13 05:21:59 PST ---
(In reply to comment #18)
> (In reply to comment #17)
> This register dump is with all three patches, or just the first two?

All three. Do you want one with just 1+2?

> Just to clarify, you tried 0003 on top of 0002, but could see no difference?

Exactly. I started seeing something with 1+2 and 1+2+3 didn't visibly change
anything.

> Hmm, might be interesting to see a picture should you have a digital camera,
> but don't worry if it's not convenient.

I'm pretty happy you're taking so much time helping me, so I certainly won't
complain about small inconveniences. I'll have to charge the camera's batteries
first, though. :-)

> Is it worse than the "picture degradation (bad resolution?) which isn't
> recovered even when killing X" you mentioned previously, or the same?

It is the same, only that before I couldn't see it in X but only after killing
it. But it is exactly the same.

> One other thing that would be interesting to know next time you test (using a
> clean checkout (no patches)), if you add `Option "FPScale" "off"' in the driver
> section of your xorg.conf, and set 1280x800, whether that works any better.

I'll try that and report back along with the promised photo.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34491] Resuming from Suspend to RAM causes poor 2D
	performance
Date: Sat, 19 Feb 2011 16:43:45 -0800 (PST)
Message-ID: <20110220004345.D91A3130005@annarchy.freedesktop.org>
References: <bug-34491-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34491-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34491

--- Comment #1 from Richard <shiningarcanine-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-19 16:43:45 PST ---
Created an attachment (id=43566)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43566)
Xorg log from a different boot

mupuf_laptop asked me to include the Xorg server log. I triggered this
condition again to generate the log.

Unfortunately, dmesg is not displaying any of the things it exhibited during
the previous boot, despite the 2D performance being poor like the previous
time.

I couldn't get this issue to manifest itself consistently with the 2.6.38-rc4
kernel earlier in the week. Sometimes it would be slow and at others it would
simply display graphical corruption. Now that I have some time, it seems that
the 2.6.38-rc5 kernel is also being inconsistent, although I have not seen any
graphical corruption yet.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34554] Nouveau seems to have corrupted my laptop
 screen's EDID info
Date: Wed, 30 Mar 2011 08:51:54 -0700 (PDT)
Message-ID: <20110330155154.2BFA613004F@annarchy.freedesktop.org>
References: <bug-34554-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34554-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34554

--- Comment #8 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2011-03-30 08:51:53 PDT ---
(In reply to comment #7)
> TL;DR (short) version:
> 
> I have seen very, very similar symptoms on two Dell (D620, XPS M1710) laptops
> running nouveau since about the same time.  The laptop panels no longer work
> properly in Linux, in BIOS, or in Windows 7, however in one case (D620), proper
> fiddling with the BIOS display select hotkey during POST results in partial
> functionality under certain circumstances.
> 
I wouldn't rule out a manufacturing defect, interestingly both laptops are
mentioned in the nVidia GPU litigation [1].

> Like the OP, I get EDID blocks with an invalid first byte (often 0xa9 or 0xa1)
> and/or invalid leading 0x 00ff ffff ffff ff00 reported in dmesg.
> 
> I think this is the same issue described in #4552.
> 
> Given the amount of my hardware that I believe to have been affected, I am
> hereby offering as a bounty a hardware donation of ~200 USD worth of
> at-least-sort-of relevant hardware of his/her choosing to any developer able to
> resolve this in such a way that my laptop panels start working again, in the
> interest of keeping him/her well stocked with hardware to hack.  If you're up
> to your eyeballs in cards to work on, I'll ship to another hacker of your
> choosing or consider a favorite charity.
> 
Have you considered donating/lending out one of the affected laptops instead?
It looks like physical access and being able to take the laptop apart would
actually be helpful here to diagnose the problem.

>[...]

[1] http://www.nvidiasettlement.com/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

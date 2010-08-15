From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Sun, 15 Aug 2010 02:41:22 -0700 (PDT)
Message-ID: <20100815094122.42F8E13006E@annarchy.freedesktop.org>
References: <bug-29455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29455

--- Comment #15 from Vlado Plaga <rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org> 2010-08-15 02:41:22 PDT ---
(In reply to comment #14)
> I also need the output from "lspci -vvnn" to add a quirk for your card.

I'll add a small attachment, so that no new line breaks are introduced.

> > I used Linus' git tree first, where both patches could be applied. But there
> > were still many errors in the kernel log, so I went back to kernel 2.6.35,
> > where the  nouveau_imac_g4_tvout.patch (with "gpio-> = 4") also has the desired
> > effect.
> > 
> What kind of errors do you get with Linus' master?

I'm not sure these errors are caused by nouveau, but it seem so. The system was
working, but KDE also gave notification of kernel failures. I'll add a
kern.log. I cut a huge chunk in the middle, because the file was 5,7 MBytes
originally.

The last boot recorded was with the modified working 2.6.35 kernel:
Aug 14 21:40:07 platypus kernel: [    0.000000] Linux version 2.6.35 (2.6.35)
(root@platypus) (gcc version 4.4.5 20100728 (prerelease) (Debian 4.4.4-8) ) #1
Sat Aug 14 20:18:29 CEST 2010

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

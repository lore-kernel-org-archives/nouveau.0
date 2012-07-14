From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47182] GeFroce 6150SE nForce 430: misaligned reg
	0x0060081D
Date: Sat, 14 Jul 2012 18:12:16 +0000
Message-ID: <bug-47182-8800-tUzXJSLI5Q@http.bugs.freedesktop.org/>
References: <bug-47182-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47182-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47182

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-07-14 11:12:16 PDT ---
(In reply to comment #3)
> (In reply to comment #2)
> > Have you experienced any issues with nouveau ?
> 
> Yes, I have several issues with the GeForce 6150SE, e.g. Bug 48434 (, problems
> with flash player, pixmap/image/background corruption, ...).
> 
> What's the function of reg 0x0060081D ?

Registers should be aligned to 0x4, otherwise bad things may happen depending
on the motherboard chipset

The register mentioned is "off by one" to NV_PCRTC_GPIO_EXT (0x0060081c).
Whenever nouveau detects a misaligned register, we strip and align it before
accessing it

The bug mentioned is very unlikely to be related to the misaligned registers in
the vbios, as the register in question does handle the crtc gpio (display
controller)

Feel free to take a look at nouveau_bios.c: valid_reg() and bios_rd32()
There are some hints that may help us out and get rid of those annoying
messages


Appreciated

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

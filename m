From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30582] SDL tests under su root crashes X server
Date: Sun,  3 Oct 2010 12:47:24 -0700 (PDT)
Message-ID: <20101003194724.5278D13004F@annarchy.freedesktop.org>
References: <bug-30582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30582

--- Comment #2 from Arvind R. <arvino55-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-10-03 12:47:24 PDT ---
On Sun, Oct 3, 2010 at 5:07 PM,  <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
> https://bugs.freedesktop.org/show_bug.cgi?id=30582
>
> --- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-10-03 04:37:54 PDT ---
> Looks like such a hard crash, that logs do not get to disk. Can you try the
> suggestions in http://nouveau.freedesktop.org/wiki/HangDiagnosis to get a
> kernel log showing the crash?
No, it is not such a hard crash. Only screen is blank and keyboard,
mouse dead. Power-button neatly shuts down system - no fscks on next
boot. But I have no other system to try logging into the 'crashed'
system.
>
> Can you reproduce this without nouveau_dri.so?
Yes, with the software rasterizer in use.
>
> Also, might be worth to try with the latest git nouveau kernel modules
> (requires a kernel upgrade for you).
The attached log was from a 2.6.35.4 mainline kernel. The bug is also
present in drm-tree of nouveau git (which appears to be 2.6.36rc3)
backported to xen-2.6.32.18. I did not have this problem with drm-tree
2.6.34 backports or standard kernel and xorg-7.6
>
> Is this a regression, have you ever had a situation, where the test apps do not
> cause a hard crash?
Have always been starting SDL enabled xen VMs. Suddenly after upgrade,
I couldn't do so and thinking it was a SDL problem, I tried the tests.
Normally, I don't allow root-login to X - but after this finding, I
have to login
as root to run Xen VMs.
>
> Errm, "Couldn't set console screen info." sounds weird, are you sure SDL is
> using X here, and does not attempt to use, say, SVGA or kernel framebuffer?
Sure. As normal user, testgl works fine. SVGA is not even installed,
but I don't know if SDL will use the nouveau-fb as kernel framebuffer
as you put it.
> Does 'su root' allow you to start any X applications, that is, does it preserve
> DISPLAY environment variable for you? Try starting e.g. xterm from a 'su root'
> shell.
Aargh -  cannot start xterm even! But DISPLAY environment variable is
preserved - 0:0.
BTW, there is another little bug that may be linked. With kernel
2.6.35.4 and xorg-7.9, if VT-consoles are set to UTF-8, capslock leds
freezes (but capslock works) on VT-consoles. In X, everything is fine.

Anything further I can do?
> --
> Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
> ------- You are receiving this mail because: -------
> You reported the bug.
>

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

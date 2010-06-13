From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28524] Debian Testing Kernel Upgrade Enables KMS,
 Disables External Monitor
Date: Sun, 13 Jun 2010 11:41:56 -0700 (PDT)
Message-ID: <20100613184156.6FD491300EE@annarchy.freedesktop.org>
References: <bug-28524-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28524-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28524

--- Comment #1 from GilbertSullivan <whirlygig-Wuw85uim5zDR7s880joybQ@public.gmane.org> 2010-06-13 11:41:56 PDT ---
(In reply to comment #0)
> Please note, also, the result of
> 
> grep -B2 'Module class: X.Org Video Driver' /var/log/Xorg.0.log
> (II) Module nv: vendor="X.Org Foundation"
>         compiled for 1.7.7, module version = 2.1.17
>         Module class: X.Org Video Driver
> --
> (II) Module vesa: vendor="X.Org Foundation"
>         compiled for 1.7.7, module version = 2.3.0
>         Module class: X.Org Video Driver
> 
> The Xorg log shows this content regardless of whether the system is docked or
> undocked, and whether I boot with the old kernel or the new one. (But I would
> swear that it used to show only the vesa driver.)
> 
> I tried forcing the use of nouveau driver creating
> 
> Section "Device"
> Identifier "n"
> Driver "nouveau"
> EndSection
> 
> for Xorg configuration. This results in X not starting at all -- until the
> configuration file is removed..

Created "blacklist nouveau" line in /etc/modprobe.d/blacklist.conf, and that
proved a workaround the issue with the external monitor. I can now boot the
system while docked with the new kernel. The nouveau frame buffer doesn't load,
so the console resolution stays at 800x600 (or whatever it is) until gdm loads.

After seeing that nouveau driver wasn't usable, I decided to create an
/etc/X11/xorg.conf which specified the vesa driver. That, also, would not allow
X to start. Specifying nv driver in xorg.conf fixed it, and now using grep on
/var/log/Xorg.0.log shows me only the nv driver.

So I have a workaround, but I'd rather be able to use the nouveau driver when
all the pieces are in place.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

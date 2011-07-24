From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 16:35:26 -0700 (PDT)
Message-ID: <20110724233526.62E15130166@annarchy.freedesktop.org>
References: <bug-39498-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39498-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39498

--- Comment #16 from Felix Miata <mrmazda-ihVZJaRskl1bRRN4PJnoQQ@public.gmane.org> 2011-07-24 16:35:25 PDT ---
(In reply to comment #14)
> Felix, the bugs you are describing seem different from mine because:

> - I have a different NVidia card (mine is GeForce GT 330M);

It also happens with a much older GeForce2 MX400.

> - I do not have a blinking cursor in the upper left corner (it's a steady white
> underscore);

Mine stopped blinking after switching to Jobermayr's drm-nouveau-kmp-desktop
and 3.0.0-2 (both installed at same time).

> - keyboard and mouse are both working fine for me.

PS/2 connected, or USB? Mine are both USB with the 8600GT, but PS/2 on the old
NV11.

(In reply to comment #15)
> Felix, just a quick comment on your logs. I am no expert at all, but I noticed
> something:

> - xserver is trying to load the "nvidia" driver (binary driver from NVidia) and
> fortunately it's failing to load it because it's missing (otherwise it might
> conflict with nouveau); lsmod should not show that "nvidia" kernel module is
> loaded; Xorg.log should not show that it is trying to load nvidia_drv.so
> - xserver is loading the "nv" driver (successfully) and that could interfere
> with nouveau. you should avoid loading that. use 'Driver "nouveau"' in
> xorg.conf or otherwise remove the file nv_drv.so from
> /usr/lib/xorg/modules/drivers.

I only have a vague notion of the inner workings of X as they appear in the
logs, but I think you see the result of prioritization of drivers to try. It
prefers nvidia, regardless whether installed (which is never the case on any of
my systems), next tries nouveau, next nv, and last vesa. I always see their
*.sos listed, but only that actually used shows up in the capitalized repeats
show which is actually used, such as in this case (II) NOUVEAU(0):

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

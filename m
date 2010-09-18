From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Sat, 18 Sep 2010 01:14:24 -0700 (PDT)
Message-ID: <20100918081424.359181300AC@annarchy.freedesktop.org>
References: <bug-30158-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30158-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30158

--- Comment #14 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-09-18 01:14:23 PDT ---
(In reply to comment #13)
> 
> In the meanwhile I have clearly found that for the case when X throws an error
> and restarts, then all fine, nouveau actually IS running. hwinfo --gfx has an
> entry I had before overseen that says [ driver "nouveau" ] this entry is not
> present when running nv. Still, X log files don't have the slightest indication
> that nouveau was started, but it must be running. Which is also quite obvious,
> since with this case kernel mode setting is active and X cannot switch to any
> other driver.

See my previous post, why I think hwinfo gets it wrong.

If X log does not have a lot of lines from NOUVEAU, (accelerated) Nouveau is
*not* used by X.

It is quite possible to be able to start X with a user mode driver (that is,
one that pokes the hardware bypassing the kernel), while still having a kernel
mode driver active. This is a bug, and I recall some efforts have been made to
detect it, but I would not count on it yet. The situation leads to an unstable
system, where two drivers drive the same hardware without knowing about each
other.

What happens with Ubuntu: it first tries the normal config, and if X fails, it
will switch to a fail-safe config. I have no idea what drivers the fail-safe
config tries to use. Quite likely "vesafb" is one of those, and is incompatible
with Nouveau kernel mode driver, too.

The only X driver apart from "nouveau" that can work with the Nouveau kernel
driver, is "fbdev". If it gets used automatically, you are fine, you just do
not get any graphics acceleration whatsoever and probably lack other features,
too. "fbdev" uses the generic kernel framebuffer interface, which is very much
hardware agnostic.

I don't have the time to help you further now, or check your logs, but don't
give up. It could be nice to boot Ubuntu to text-mode (non-graphical), set up
Nouveau, and start X with the command 'startx'. When it fails, the fail-safe-X
should not kick in. In that situation, the complete (starting at current
boot-up) kernel and X logs would be most useful in debugging this.

More about KMS and checking if it is active:
http://nouveau.freedesktop.org/wiki/KernelModeSetting

Cheers.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

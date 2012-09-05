From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54512] xrandr does not detect HDMI screen
Date: Wed, 05 Sep 2012 06:42:39 +0000
Message-ID: <bug-54512-8800-Mo9MzhJyZo@http.bugs.freedesktop.org/>
References: <bug-54512-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54512-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54512

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-05 06:42:39 UTC ---
(In reply to comment #2)
> Thanks for the quick response.
> 
> Attached my Xorg.0.log now.
> This is when I booted my system WITHOUT a xorg.conf.
> I do get the boot logo on my HDMI screen, but still xrandr doesn't see my
> screen.
Yes, I suspected this was your issue initially and your X log confirms it. 
You're using an Optimus laptop, and the Intel GPU (which is the one X is using)
is NOT wired up the the HDMI connector.

The boot logo on your screen *is* nouveau's doing, and show's nouveau's
(mostly, see below) done its job correctly.

If possible in you BIOS setup, you can select "Discrete Graphics" mode and your
NVIDIA GPU will become the primary adaptor and X should JustWork with the HDMI
display.  But, a great deal of manufacturers don't allow this mode, so it may
not be available.

Your last resort until X is able to handle Optimus properly (coming up in the
next X server release), is to create an xorg.conf specifying two X screens, one
on the intel (to drive the laptop panel) and another on nouveau (to handle your
external outputs).

> 
> Also notice something strange in the xrandr output:
> HDMI2 disconnected (normal left inverted right x axis y axis)
> 
> It now says HDMI2 somehow
This will highly depend on the ordering of which the Intel and Nouveau drivers
load and create the connector objects.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

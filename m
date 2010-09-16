From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Thu, 16 Sep 2010 02:06:32 -0700 (PDT)
Message-ID: <20100916090632.CEC861300DB@annarchy.freedesktop.org>
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

--- Comment #8 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-16 02:06:31 PDT ---
(In reply to comment #5)
> try to blacklist vga16fb first - see
> https://wiki.ubuntu.com/X/Troubleshooting/Nouveau#Disable%20vga16fb
> 
> (the log says it is "not registering due to another framebuffer present", but
> it's not completely true)

I have interesting news. After I had enabled nv I checked with hwinfo --gfx and
lsmod to see if it was active. It wasn't. Instead the system still reported
nouveau to be active. That puzzled me quite a bit but explained why performance
was so good. I then tried again to put [ driver "nouveau" ] into the xorg.conf
while still [ nouveau.modeset=0 ] - hard crash (no terminals, requiring repair
from live-cd). Next I tried xorg.conf with back to [ driver "nv" ] but removed
the [ nouveau.modeset=0 ] boot-statement (the link you provided said "to enable
nv make X to use [ driver "nv" ] and disable nouveau with [ nouveau.modeset=0
]).

And - everything is fine now. X comes up perfectly without an error. And as far
as I can tell from the output of hwinfo --gfx and lsmod I am not running nv but
nouveau.

So my problem seems to be solved. The solution was to put [ driver "nv" ] into
the xorg.conf instead of the "nouveau" which is documented. After that, X seems
to be still using the nouveau driver, doesn't complain at all and comes up ok
without having to force an error.

I'm adding an attachment containing kern.log, Xorg.0.log (there is only one
logfile now), the output of lsmod, the output of hwinfo --gfx and my xorg.conf
as they are now.

Please note nevertheless that this IS a (since probs come ONLY with the
external monitor, minor) bug since live-cd will use an empty xorg.conf which
fails to blank screen and if following documentation and creating an xorg.conf
with [ driver "nouveau" ] this crashes. Means, as it comes out of the box (and
I had a fresh install on a clean system) it does NOT work, and what you have to
do to circumvent the problem is absolutely against the documentation and really
not understandable if you ask me - I use nouveau but have to tell X to use nv
though it can't, actually (should be error "modesetting driver in use"), but it
doesnt report the modesetting-in-use-error (as it would for example with [
driver "vesa" ]) but then runs fine.

I'd be very thankful if you could check against my attached files whether I am
now running nv or nouveau? I am still not sure about that.

From my side, if you could confirm nouveau is actually running, the problem is
then solved since I have found a working circumvent. Thank you all very much
for your help on this matter.

And one more bit of info: I also tried again, with [ nouveau.modeset=0 ] and
vga16fb blacklisted to install the proprietary nvidia drivers. They still crash
very hard requiring a restore. So this means, at least when referring to my
system, nouveau (or nv?) does a far better job than nvidia - congratulations.

Best regards, Michael

PS Maybe it might be interesting to analyze further, I have always disabled the
"splash" boot-option. Did not try with it, yet. If you want me to, please give
a note.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Sat, 18 Sep 2010 15:48:22 -0700 (PDT)
Message-ID: <20100918224822.58A771300A7@annarchy.freedesktop.org>
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

--- Comment #19 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-18 15:48:22 PDT ---
(In reply to comment #14)

Hello,

I have established the test case as you suggested. Booted with kernel mode
setting enabled and the option single 3 to receive a textonly console.
xorg.conf was configured to use nouveau, then startx. The result was again this
blank screen, but with terminals accessible (as before). From one of these
terminals I saved the log-files dmesg, kern.log (shortened for the last boot),
Xorg.0.log and the config-file xorg.conf. I have created attachments for these,
find them above.

But this message is written with nouveau enabled! Your link in comment #14
finally brought a solution!

There is a section in the link (quite at the end) about the boot option video=
and with this I now disable DVI-D-2 (video=DVI-D-2:d) but with, of course,
kernel mode setting enabled and xorg.conf configured to nouveau, and then...
nouveau starts and everything is fast, stable and perfect!

I came to the idea because I was puzzled about the Xorg log files. nv only
talks of DVI-1 (DVI1 in it's log files), never any DVI-2, whereas nouveau
always had entries for DVI-D-1 and DVI-D-2. But if the laptop is closed there
is no DVI-2 (which would be the external monitor if laptop is open), then the
external monitor is mapped to DVI-1 (which I concluded from the fact that nv is
using DVI-1). So basically, I was (partially) right, the bug is a remapping /
table lookup problem. The external monitor is connected to DVI-D-2 but if the
internal monitor is inactive (closed laptop) this DVI-D-2 gets mapped to
DVI-D-1 and exactly this is the point which nouveau is missing (but nv
doesn't). But I wasn't right about the point that X does a "better" init,
because what happens if you force X to throw the error that causes a
X-server-restart, is, that X is using nv. Now, that I have finally seen nouveau
alive, I can clearly distinguish what X actually was running under this
condition - it was NOT nouveau, it must, although corresponding Xorg.0.log
statements are missing, have been nv (much too fast for any vesa / vga driver
type, and right resolution, too).

So thanks a lot for that very valuable link, and I hope the information about
how to stop the failure can help to fix this bug.

I'd have never ever gone to such length to get this bug out if I had not before
installed Ubuntu on an other system (with a NVIDIA GTX 295) where everything
went completely fine and without any problems, and if I had not, from this
install / usage, developed a real liking for Ubuntu already. Had I first tried
to install Ubuntu on my laptop I'd have just discarded Ubuntu as unusable and
incompatible. That's why I think fixing this bug could be worthwhile, although
I am aware of the fact that maybe this is a problem not many people will have.
On the other hand many laptops have external monitor connectors, and many
laptops are used in the office in a desktop style (like I do). The remapping /
table lookup problem might therefore affect a lot more machines than only mine
or maybe even arises from some internal chaos in the NVIDIA Quadro FX 3800M, so
it is well possible that this bug could be of concern to quite some users.

Best regards, and thanks again for your very very helpful advice, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

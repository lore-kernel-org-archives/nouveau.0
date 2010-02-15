From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18286] [nouveau] GeForce 8200 and 8300 not supported
 (10de:0848/0849/C77/MCP77/MCP78S)
Date: Mon, 15 Feb 2010 02:00:22 -0800 (PST)
Message-ID: <20100215100022.51266130085@annarchy.freedesktop.org>
References: <bug-18286-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18286-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=18286





--- Comment #32 from Josh Saddler <nightmorph-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>  2010-02-15 02:00:20 PST ---
(In reply to comment #28)
> Can someone actually confirm it doesn't work with the current version (with KMS
> enabled)?

It kinda works on my GeForce 8200. And it's kinda broken.

While KMS works perfectly, from the console to logging into my Xfce desktop,
performance is pretty bad. Nowhere *near* as bad as the proprietary driver is,
but it's still definitely stuttering and slow in places while just doing 2D
desktop work. I haven't tried 3D games yet.

I checked my Xorg logs, and this is what I see:

(EE) NOUVEAU(0): Error creating GPU channel: -16
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): NVEnterVT is called.
(**) NOUVEAU(0): DPMS enabled
(II) AIGLX: Screen 0 is not DRI2 capable
(II) AIGLX: Screen 0 is not DRI capable
(II) AIGLX: Loaded and initialized /usr/lib64/dri/swrast_dri.so
(II) GLX: Initialized DRISWRAST GL provider for screen 0

By far it looks like the biggest errors are in the EE lines, where it says it's
falling back to NoAccel. How can I fix that?

The other big problem is where it disables the backing store. Probably not good
for performance. And lastly, it tells me it's not capable of DRI/DRI2, even
though those are both installed and working correctly for my other (ATI) card.

I'm using:

kernel 2.6.33-rc7 (vanilla, straight from upstream)
mesa git (today's checkout)
libdrm git (today's checkout)
xorg-server 1.7.99.2
dri2proto 2.2
xf86-video-nouveau 0.0.15_pre20100213
nouveau-firmware 20091212


I will say that there is no documentation at all for which specific nVidia GPU
family my chipset belongs to -- only that it's "at least" nv50. The 8200 is
just a downclocked 8300, and the interwebs indicate that the 8300 (GS) is an
nv86 chip. So that's what I put in my kernel for the extra firmware:
nv86.ctxprog/ctxvals. Maybe this is screwing things up?

If I should actually be using the nv50 firmware, then lemme know -- I can
recompile. I just thought that it was for the old 8800 cards.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Thu, 16 Sep 2010 14:38:01 -0700 (PDT)
Message-ID: <20100916213802.0E237130081@annarchy.freedesktop.org>
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

--- Comment #11 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-09-16 14:38:01 PDT ---
(In reply to comment #8)
> I have interesting news. After I had enabled nv I checked with hwinfo --gfx and
> lsmod to see if it was active. It wasn't. Instead the system still reported
> nouveau to be active. That puzzled me quite a bit but explained why performance
> was so good. I then tried again to put [ driver "nouveau" ] into the xorg.conf
> while still [ nouveau.modeset=0 ] - hard crash (no terminals, requiring repair
> from live-cd). Next I tried xorg.conf with back to [ driver "nv" ] but removed
> the [ nouveau.modeset=0 ] boot-statement (the link you provided said "to enable
> nv make X to use [ driver "nv" ] and disable nouveau with [ nouveau.modeset=0
> ]).

The "nv" driver has no kernel part at all, therefore it will never show up in
lsmod, and I guess the same applies to hwinfo, since "nv" never registers with
the kernel. "nv" pokes the hardware directly from user space, corrupting any
state a proper kernel driver (nouveau) has set up.

If you have Nouveau KMS enabled (maybe even if you just have the nouveau kernel
module loaded), "nv" X.org driver will corrupt the card state, and when the
kernel driver attempts to do anything, it will probably crash somehow (just
like you later experienced).

If you use *any* other X.org driver than "nouveau", then you *must* disable the
Nouveau kernel module, or at least disable Nouveau KMS with nouveau.modeset=0.
Do note, that without an explicit X.org driver configuration, X will attemp
several different drivers one by one, and use the one that happens to
initialize.

> I'm adding an attachment containing kern.log, Xorg.0.log (there is only one
> logfile now), the output of lsmod, the output of hwinfo --gfx and my xorg.conf
> as they are now.

I haven't checked any of the logs, because they are packaged, and I'm not
really that interested. Please, see http://nouveau.freedesktop.org/wiki/Bugs .

I just wanted to correct some misconceptions.

> I'd be very thankful if you could check against my attached files whether I am
> now running nv or nouveau? I am still not sure about that.

The X log should be fairly self-explanatory on that. And if you run Nouveau,
the kernel log will have many lines (a lot more than 5) from nouveau. You will
know, when you see them.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

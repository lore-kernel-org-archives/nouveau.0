From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39498] nouveau hangs on unresponsive black screen at
	startup
Date: Sun, 24 Jul 2011 13:41:25 -0700 (PDT)
Message-ID: <20110724204125.CE8B7130166@annarchy.freedesktop.org>
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

--- Comment #12 from Guido Trentalancia <guido-D1bseh+SzQikhjTqA1DzBQ@public.gmane.org> 2011-07-24 13:41:25 PDT ---
Hi Emil, thanks once again very much for offering your support !

Yes, there will be no gdm greeter in runlevel 3, but I shall get some
gnome-terminals and the gnome-panel too. Doesn't matter...

By the way, the minimal xorg.conf did not help (and it actually enables AIGLX).

The freedesktop snapshot kernel driver on 3.0.0-git3 did not sort things out
either.

Perhaps, the only difference that I recently noticed is that with NoAccel (only
usable configuration) and AIGLX disabled in xorg.conf, I get:

[   541.369] (**) Option "AIGLX" "off"
...
[   541.562] (**) AIGLX disabled
[   541.562] (II) Loading extension GLX
...
[   542.281] (II) AIGLX: Loaded and initialized /usr/lib64/dri/swrast_dri.so
[   542.281] (II) GLX: Initialized DRISWRAST GL provider for screen 0

I think this is not very relevant. Perhaps it just means that it has loaded the
SW rasterizer (the one used by the "nv" driver). It does not speed up anything
(acceleration is disabled). It could be that earlier on Mesa did not produce
that module after building it and therefore it was not getting loaded.

I will now try to follow your latest advice. I will take some time to play
around with all possible different configurations and options...

However in the earliest logs (at the end of dmesg's output) there is some extra
debugging output from the kernel drm module. Does that tell you anything ?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

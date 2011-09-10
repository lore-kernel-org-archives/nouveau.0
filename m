From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] The new nouveau kernel module fails to use my
 monitor's native resolution
Date: Sat, 10 Sep 2011 13:57:57 -0700 (PDT)
Message-ID: <20110910205757.A8C5D13019A@annarchy.freedesktop.org>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #7 from monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org 2011-09-10 13:57:57 PDT ---
So, I tried to play with the video= parameter and I now have an acceptable
workaround with "video=1600x1200@55" which gives me the right resolution
without any complaint from my monitor.
I tried to "M" and the "R" thingies as in "1600x1200MR" or "1600x1200R" but
these seem to be ignored, or at least didn't make much difference (actually the
"R" does the same as when nothing is specified and the "MR" gives a marginally
higher pixel clock).  I expected the "R" to give a much more substantial
reduction in dotclock, or maybe the R is somehow ignored in the "MR"
combination ("cvt" gives me the same modeline as I got with 1600x1200MR, at
161MHz, whereas "cvs --reduced" drops the dotclock to 130MHz).

I haven't tried the Xorg nouveau driver on top to see whether it obeys my
"video=" arg or whether I'm going to have to play the same dance in the
xorg.conf file (because right now the Xorg driver gives me the familiar "error
opening the drm").  But at least using the fbdev driver, this gives me a good
workaround.

I see only two ways to improve the situation (modulo the handling of "R"
mentioned above):
- provide a way to override the 155MHz limit (apparently, the hardware does not
prevent overclocking and at least in my case, it handles such overclocking
without blinking).
- when the monitor's preferred modeline can't be used because of dotclock
limits, output a clear message in the dmesg about it, and cook up a different
modeline that preserves the resolution (e.g. at the cost of lower refresh
rate).  This is because on LCD displays, using the native resolution is a lot
more important than using a high enough refresh rate.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

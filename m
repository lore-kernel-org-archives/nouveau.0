From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30158] nouveau fails to display on external monitor
Date: Fri, 17 Sep 2010 13:00:48 -0700 (PDT)
Message-ID: <20100917200048.662661300C5@annarchy.freedesktop.org>
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

--- Comment #13 from Michael Boehm <varp-b-Mmb7MZpHnFY@public.gmane.org> 2010-09-17 13:00:48 PDT ---
(As an update to comment #12)

In the meanwhile I have clearly found that for the case when X throws an error
and restarts, then all fine, nouveau actually IS running. hwinfo --gfx has an
entry I had before overseen that says [ driver "nouveau" ] this entry is not
present when running nv. Still, X log files don't have the slightest indication
that nouveau was started, but it must be running. Which is also quite obvious,
since with this case kernel mode setting is active and X cannot switch to any
other driver. BTW it is quite easy to make X throw that error, do not disable
kernel mode switching for nouveau (omit nouveau.modeset=0 in the boot options)
but set the boot option xforcevesa. That will make X throw that error since it
can't change to vesa ("kernel mode setting driver in use") regardless if there
is a xorg.conf or not, and regardless of the content of xorg.conf.

This is a strange bug. It happens only for the external monitor and if X relies
on the init done by nouveau, then the bug will come up (= blank screen, but
terminals accessible). If X should do the init, but fails with it and restarts,
the bug is gone.

For a beginner or for someone first installing ubuntu this is a hard hurdle.
Definitely the live-cd won't install or run. One just sits in front of an empty
screen. If one follows all the faqs on problems like this it will lead to no
result or even heavy crashes, because what you have to do is against all
documentation: do not block nouveau modeset but do enforce xforcevesa. Which
leads to an X error but makes the system usable / installation possible. After
once the system has been set up to get a clean system without system error,
making the system possibly unstable, the only way is to go back to nv with
blocking kernel mode setting for nouveau and configuring X to use nv.

As from my side, my problem is solved. As for nouveau, there IS a bug, and I
hope it will be fixed in one of the next releases. Shouldn't be so difficult, I
hope, since there is just some initialization / table lookup / whatever that X
performs in case of init-error and nouveau doesn't in it's regular init. I hope
that can be fixed sometime, since I'd prefer to use nouveau - from the little I
saw, it is quite a bit superior to nv.

I thank everybody who has given me very valuable advice here that led my on the
right path to find a solution for my problem, and again I apologize if I, as a
linux-beginner, maybe at some points didn't behave as it is expected here.

To the makers of Linux/Ubuntu/Nouveau/other GPL software - thank you so much
for keeping the idea of free software and free programming alive, and for all
the efforts and hard work you contribute. Intel is planning now a "walled
garden" for Intel-Processor-based software like Apple already has with its
app-store (that's why Intel purchased McAfee as they recently explained on a
press meeting), and if that happens, you guys are the only hope that software
and programming will stay a free resource for free people.

Best regards, Michael

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

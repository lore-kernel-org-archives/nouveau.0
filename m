From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31957] Video Noise on HDMI output
Date: Sun, 12 Dec 2010 12:00:24 -0800 (PST)
Message-ID: <20101212200024.3792B13004E@annarchy.freedesktop.org>
References: <bug-31957-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31957-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31957

--- Comment #19 from James <buzzbuzz22-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> 2010-12-12 12:00:21 PST ---
I have found out what the problem is.
The Nvidia ION graphics card has two video modes:
1) Between the CPU and the Graphics card.
2) Between the Graphics card and the TV.

It seems that the nouveau driver is correctly setting (1), but wrongly setting
(2).

I have many config options in xorg.conf etc. that let me set (1).
Are there any config options that allow me to force (2) to a particular mode?

The nvidia driver tool "nvidia-settings" calls the option "Force Full GPU
scaling".

With "Force Full GPU scaling" enabled, whatever X sets for video mode only
changes (1). It will never change (2).

The nouveau driver is setting some values for (2) that are outside of what my
TV can handle, and thus I see the "noise".

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

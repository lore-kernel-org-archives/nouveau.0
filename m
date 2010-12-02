From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31780] DRM/Nouveau Blank Screen with 8500 GT
Date: Wed,  1 Dec 2010 16:20:42 -0800 (PST)
Message-ID: <20101202002042.ACA3113004E@annarchy.freedesktop.org>
References: <bug-31780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31780

--- Comment #11 from Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-12-01 16:20:42 PST ---
I can confirm even more soundly now that the nouveau driver is mixing up the
DVI and VGA outputs of my video card.  I now have one monitor hooked up to each
output, using identical monitors.  When the nouveau fbcon comes on at boot
time, the VGA-connected monitor seems to work correctly.  And then when I start
X with the nouveau driver selected, the VGA-connected monitor shows a proper
desktop, and the DVI-connected monitor stays blank (even though my xorg.conf
specifies that both monitors should be used - which works when the nv driver is
used).

The way I know that something is wrong is that the xrandr utility believes that
both monitors are connected and enabled, and the DVI connection should be the
primary display and to the left of the VGA connection.  However, my
VGA-connected monitor is actually the primary, and it is on the left side of
the virtual screen, instead of the right.

This fits with the earlier boot log where the KMS driver seemed to be getting
confused between the two outputs.

Is there anything I can do to help debug this, or change the way the driver
detects the outputs?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

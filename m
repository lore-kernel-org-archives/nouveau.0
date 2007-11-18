From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10673] nouveau can't use a Dell 2001FP in 1600x1200
	mode
Date: Sun, 18 Nov 2007 08:00:32 -0800 (PST)
Message-ID: <20071118160032.295D113000D@annarchy.freedesktop.org>
References: <bug-10673-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10673-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10673





------- Comment #2 from ajax-TAsg7VrFCGc@public.gmane.org  2007-11-18 08:07 PST -------
(In reply to comment #0)
> The long term best solution would be to figure out why this is being
> misdetected and correct that. A good short term solution would be to implement
> the "PanelSize" option in nouveau (see the radeon driver) to allow the user to
> override the detected panel size and force the driver to attempt to continue.

I've tried this, it doesn't work.

As far as I can tell, what actually happens with nv and nouveau on digital
connections is that the "resolution" we set is really just the size of the
framebuffer, which is then fed to an upscaler for scanout.  In other words,
your panel is always scanning out whatever the BIOS set it to at init time,
which defaults to 1280x1024 because that's nice and conservative.

The nvidia driver, we can assume, just goes ahead and bangs the output
registers directly.

Experimentally, using RANDR to resize the screen is subjectively faster on nv
than on, say, radeon.  This corroborates the above theory; you're not changing
the signalling timings, so the monitor doesn't need to resync.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

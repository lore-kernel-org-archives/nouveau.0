From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20361] nouveau - incorrect resolution on an external
 monitor attached to a laptop
Date: Sat, 28 Feb 2009 06:09:53 -0800 (PST)
Message-ID: <20090228140953.1981D13005A@annarchy.freedesktop.org>
References: <bug-20361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20361





--- Comment #11 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-28 06:09:52 PST ---
As Maarten says, this is an xserver feature.  See
http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/modes/xf86Crtc.c?h=server-1.5-branch
and search for "Using exact sizes for initial modes" as appears in your log
just before it picks 1024x768 for both heads.

Looking at the xf86TargetPreferred function (in the same file) that selects
this behaviour, it tries to pick the largest preferred mode (an attribute
specified in the screen's EDID) where the mode is available on all screens,
hence you get 1024x768 as the laptop screen's preferred mode.  This behaviour
appears mostly unchanged in master (
http://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/modes/xf86Crtc.c ), so
if you want it fixed you'll have to file an xserver bug, but I suspect they'd
argue it's reasonable and intended behaviour.

Alternatively, before using this method of mode selection, the xserver allows
consideration of user-specified preferences, so you could configure it in your
xorg.conf (see http://wiki.debian.org/XStrikeForce/HowToRandR12 for details). 
Also any DM you use may have a control panel to set this up for you when X
starts.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

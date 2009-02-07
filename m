From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19854] XrandR reports no CRTCs for VGA-0 output
 until the first time a display is plugged
Date: Sat,  7 Feb 2009 09:01:54 -0800 (PST)
Message-ID: <20090207170154.3BA6C13005A@annarchy.freedesktop.org>
References: <bug-19854-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19854-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19854





--- Comment #3 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-07 09:01:52 PST ---
(In reply to comment #2)
> Yep, the bug seems the same (I haven't had the time to compile xscreensaver
> yet), however I think that nouveau may be at fault here:
> 
> 1) X starts whith only LVDS connected
> 2) XrandR reports no CRTCs for VGA-0 output. I'd expect it to report CRTCs 0
> and 1, as both of them can drive the output when it is connected (and this is
> what it did before, IIRC)
> 3) xscreensaver fails.
> 
> If at this point one runs xrandr --addmode VGA-0 640x480, the server crashes
> with

...

> inside nv_output_mode_valid (I think nv_encoder is NULL at this point).
> 
> When a display is connected to VGA-0, xrandr reports CRTCs: 0 1 for VGA-0, and
> everything works as it should (xscreensaver included). If the display is
> disconnected, everything keeps working (and xrandr --addmode no longer crashes
> the server), the CRTCs: 0 1 line remains in the VGA-0 output of xrandr.
> 
> So, I don't know for sure if it is wrong to report no CRTCs for a disconnected
> output, but the fact that the reported CRTCs change after an external display
> is plugged and unplugged again, and the related crash of the Xserver seems to
> imply that there is a bug with this. I've changed the description accordingly.

Agreed that the crash is a bug, and the <never plugged> vs
<plugged>,<unplugged> inconsistency is an issue.  Can you confirm the following
patch resolves both these problems?

As for 2) above, while in the VGA-0 case listing CRTCs when disconnected is
possible, it really isn't for DVI-I until a monitor is plugged (as the
available CRTCs vary depending on whether it's an analogue or digital
connection).  I think I'd prefer to retain a consistent approach across all
connector types, and get other things that make bad assumptions get fixed
sooner :-) (is there any real-world case where the usefulness of providing a
crtc list for unused connectors exceeds the problem that it won't work half the
time (DVI)?)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

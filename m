From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19854] XrandR reports no CRTCs for VGA-0 output
 until the first time a display is plugged
Date: Thu, 12 Feb 2009 09:59:22 -0800 (PST)
Message-ID: <20090212175922.4AF6F130057@annarchy.freedesktop.org>
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


Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #7 from Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-02-12 09:59:21 PST ---
(In reply to comment #6)
> So, I've pushed the crash fix, but not the state resetting thing.  After
> testing it, it seems xrandr gets very upset (even just running xrandr
> --verbose) with CRTCs disappearing (although this is probably valid behaviour)
> and dies with a fatal error of "cannot find crtc 0x..", so I'll stick with the
> crap lingering CRTC behaviour, rather than break xrandr whenever someone
> disconnects an output.
> 
> As for bailing out at modeset time, yes, this might be possible, but it relies
> on the xserver failing gracefully, and the user app coping with a failure for
> which it can determine no good reason, which I think is a higher standard to
> expect than getting the application to query what display is connected before
> it sets out on its modesetting journey.
> 
> Happy for this bug to be resolved as fixed?
> 
Yes, thank you. If it turns out this is not really correct it can be reopened
again.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

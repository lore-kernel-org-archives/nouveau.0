From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21023] NV34GL: fails to properly set up DVI
Date: Mon,  6 Apr 2009 08:58:00 -0700 (PDT)
Message-ID: <20090406155800.7F067130057@annarchy.freedesktop.org>
References: <bug-21023-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21023-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21023





--- Comment #10 from Bill Nottingham <notting-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>  2009-04-06 08:57:59 PST ---
(In reply to comment #9)
> Thanks.  Two initial things to try (see if it stops the blinking):
> 1) when nouveau is running, do "./radeontool regset 0x680848 0x11100110"
> 2) when nouveau is running, do "./radeontool regset C0:33 0x9"

Neither appears to help.

> if these don't help, does the blinking stop if you close X and go back to the
> terminal?

80x25 text mode is fine (either with VT switch, or after X exists.)

> Does "nv" still work successfully following nouveau having been
> used?

Yes.

Attempting to describe more, since 'blinking' is a bit of a shorthand:

- The display starts (mouse cursor on black). The cursor wobbles a bit (out of
sync?), and there are some minor display artifiacts.
- The display flashes on and off a couple of times (when it's on, it's still
wobbling with slight artifacts)
- The 'on' flashes decrease in frequency, to a point after about 30 seconds
where the display's just blank.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

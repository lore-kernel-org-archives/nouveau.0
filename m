From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14820] randr 1.2 always shows the hwcursor after a
	mode change
Date: Thu,  6 Mar 2008 14:47:20 -0800 (PST)
Message-ID: <20080306224720.BAF55130116@annarchy.freedesktop.org>
References: <bug-14820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14820


Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|nouveau-PD4FTy7X32lNgt0PjOBp9/EVdHwE84te@public.gmane.org|xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
                   |g                           |
          Component|Driver/nouveau              |Server/general
            Summary|Double mouse cursor on nv4  |randr 1.2 always shows the
                   |                            |hwcursor after a mode change
            Version|unspecified                 |git




--- Comment #9 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-03-06 14:47:20 PST ---
Original nouveau bug repurposed for xserver issue.

After an xrandr mode change, drivers tend to call xf86_reload_cursors in the
commit function. This in turn will show a hw cursor, if configured. This is not
the correct behaviour for hardware that cannot do alpha cursors natively, if
the cursor is an alpha cursor at the time; two cursors (one hardware (2
colour), one software (alpha)) show up, when the hardware cursor should be
hidden.

In the nouveau case, the 1st option in comment 7 has been applied to the driver
as a work-around which takes a trip through xf86CursorSetCursor which sorts
things out.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

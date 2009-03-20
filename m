From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20780] nouveau corrupts and crashes on 7800gt when
 NoAccel= false after a few drawing operations
Date: Fri, 20 Mar 2009 15:16:48 -0700 (PDT)
Message-ID: <20090320221648.3AEFD13005A@annarchy.freedesktop.org>
References: <bug-20780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20780


Andy Matteson <xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #2 from Andy Matteson <xt.knight-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-03-20 15:16:47 PST ---
To be clear, xorg is crashing after I do DISPLAY=:0 xterm and type a few
commands in xterm to cause a few painting commands.

It exits with this message in the Xorg log:


Fatal server error:
Detected GPU lockup


Please consult the The X.Org Foundation support 
         at http://wiki.x.org
 for help. 
Please also check the log file at "/var/log/Xorg.0.log" for additional
information.

[   42.661694] (II) AT Translated Set 2 keyboard: Close
[   42.661732] (II) UnloadModule: "evdev"
[   42.669699] (II) Macintosh mouse button emulation: Close
[   42.669721] (II) UnloadModule: "evdev"
[   42.677687] (II) Microsoft Microsoft Optical Mouse with Tilt Wheel: Close
[   42.677709] (II) UnloadModule: "evdev"
[   42.677732] (II) NOUVEAU(0): NVLeaveVT is called.
[   44.677756] (II) NOUVEAU(0): Restoring encoders
[   44.677771] (II) NOUVEAU(0): 0xD417: Parsing digital output script table
[   44.678111] (II) NOUVEAU(0): 0xD467: Parsing digital output script table
[   44.698112] (II) NOUVEAU(0): Restoring crtcs
[   44.698534] (II) NOUVEAU(0): Restoring CRTC_OWNER to 3.
 ddxSigGiveUp: Closing log


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

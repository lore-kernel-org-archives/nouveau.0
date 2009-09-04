From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Fri,  4 Sep 2009 10:26:40 -0700 (PDT)
Message-ID: <20090904172640.5998E13005A@annarchy.freedesktop.org>
References: <bug-23593-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23593-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23593





--- Comment #14 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-09-04 10:26:37 PST ---
(In reply to comment #12)
> lspci says:
> 01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro]
> (rev 15)
> but the nouveay and/or drm code speaks of nv04 on probing...? I'll attach an
> Xorg log too.
> 
> 

I've been trying to reproduce this for a while on another nv05 without success,
I'm using master though. You said you were on master-compat but later that you
were using a 2.6.31 release candidate so, which branch are you using exactly?

There might be an specific acceleration request deterministically triggering
the lockup. Have you tried e.g. "$ x11perf -all"? It would be interesting to
know if any of the tests it does makes your system hang.

> [...]
> As a newbie to nouveau, I made one interesting observation: The X screen when
> starting X (even after warm-reboot) is initially painted with the contents of
> the last X screen. If I bog down the cpu with a cpu bound task (such as drm
> logging to syslog) I can watch the old contents for ca 5 seconds before it's
> cleared and the WM starts. That smells like a BIG security issue for public
> terminals. Shouldn't the GPU/fb memory be clearedbefore handed to the process
> (as RAM is when provided to a process?)
> 

That could be easily done. In fact it's already done for the non-KMS case. I
guess patches are welcome.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

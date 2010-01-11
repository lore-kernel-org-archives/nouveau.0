From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16033] [Randr12] DPI calculation ludicrously
	incorrect
Date: Mon, 11 Jan 2010 11:16:08 -0800 (PST)
Message-ID: <20100111191608.EFCB0130092@annarchy.freedesktop.org>
References: <bug-16033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16033


Elvis Pranskevichus <elprans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |elprans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org




--- Comment #3 from Elvis Pranskevichus <elprans-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-01-11 11:16:08 PST ---
I can confirm this happening on xorg-server-1.7.4 on my system.  I use external
monitor in a randr setup and the physical dimensions reported in xdpyinfo are
totally wrong:

dimensions: 4000x1600 pixels (331x207 millimeters)
resolution: 307x196 dots per inch

I have DisplaySize set for both monitors and apparently the server takes only
the first one.

Now, I've hit this trying to remedy a regression from xorg-server-1.6. 
Previously, physical dimensions were detected correctly and a correct DPI was
set.  Now (with 1.7.4) it just uses 96x96.  xrandr reports correct dimensions
in all cases.

Oh, and I'm on xf86-video-intel, so this is almost definitely not
nouveau-specific.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35876] Hard GPU hangs on NV86
Date: Fri, 26 Aug 2011 20:04:33 -0700 (PDT)
Message-ID: <20110827030433.4C3A41300E9@annarchy.freedesktop.org>
References: <bug-35876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35876

--- Comment #24 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-08-26 20:04:33 PDT ---
In PFIFO dump it appears that game channel was already killed, and it tried
switching to DDX channel.
I have another older dump of PFIFO that, where its not killed, and once again
there is attempt to switch to channel #2 which is for DDX.

In fact channel mapping (which just happens to be this way):

Without compiz:

1 - framebuffer - idle (while in X of course)

2 - xserver EXA - occasional bursts while game runs. on screen panel updates
(clock,etc..) mostly I think

3 - xserver AIGLX - not used at all, as I don't launch such clients
4 - game


With compiz:


1 - framebuffer
2 - xserver EXA
3 - xserver AIGLX

4 - compiz - again, short bursts of activity time after time while game runs,
probably to redraw windows that X clients (the same panel for example) writes
to.

5 - game


Also channel 0 seems not to be used at all, it with channel 127 are sort of
special.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

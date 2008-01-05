From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13866] nouveau gives Xvideo tearing
Date: Sat,  5 Jan 2008 01:55:08 -0800 (PST)
Message-ID: <20080105095508.EF18C130009@annarchy.freedesktop.org>
References: <bug-13866-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13866-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13866





------- Comment #4 from drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org  2008-01-05 01:55 PST -------
Ah, I see what is happening now, and you were right.

mplayer, where I'm seeing the tearing, uses the first port found. But my tests
were using the last port. So one used the texture adapter, and one the blitter.
If I change my tests to use the texture adapter, the problem is apparent. It
also explains why nv works as it doesn't have the texture adapter.

So I have a couple of questions:

1. What's the difference between the two? Judging from the names I'd guess the
texture adapter uses the 3D engine and the blitter the 2D engine.

2. Why two? I.e. why is the blitter insufficient?

3. Why is the texture adapter the first (and therefore picked by programs) if
it is inferior to the blitter when it comes to displaying video?

4. Why does vsync need rev.eng.? I tested adding a simple
FIRE_RING()/NVWaitVSync() and it removed the tearing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

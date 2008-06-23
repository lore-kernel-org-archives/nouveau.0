From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16231] Xv vsync and backing store don't mix in new
	Xorg
Date: Mon, 23 Jun 2008 14:36:22 -0700 (PDT)
Message-ID: <20080623213622.A294E13005A@annarchy.freedesktop.org>
References: <bug-16231-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16231-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16231


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pq-X3B1VOXEql0@public.gmane.org




--- Comment #10 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2008-06-23 14:36:22 PST ---
I have nv20, and both the overlay and blitter work the same: I have a static
horizontal tearing line, location depending on window size.

Section "Extensions"
        Option "Composite" "off"
EndSection

With Composite disabled with the above config, blitter now works fine. Overlay
on the other hand does not, video appears jerky and there is occasional tearing
at random places. I'll file a separate bug report on this.

I do not have a texture adapter. Xorg-server is from git.

I've posted a comment to the mplayer-users list.
http://article.gmane.org/gmane.comp.video.mplayer.user/57029


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

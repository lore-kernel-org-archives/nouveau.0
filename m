From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20023] nv20: unwanted solid fills during busyloop
	rendering
Date: Mon,  9 Feb 2009 13:16:01 -0800 (PST)
Message-ID: <20090209211601.B1E9F130058@annarchy.freedesktop.org>
References: <bug-20023-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20023-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20023





--- Comment #3 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-02-09 13:16:01 PST ---
The SCF appears only, when a RAFAP application is running, and a terminal
window draws something. The "drawing something" is most easily triggered in
aterm by switching the focus between a RAFAP window and the aterm window. Aterm
fills the text cursor with yellow when it receives focus, and this fill may
"blow up".

The SCF seems to be drawn directly onto the framebuffer, any rendering
whatsoever will fix it for the rendered area. Except fluxbox window borders
while moving windows (no window content shown while moving). Switching virtual
desktops is a good way to clear it. SCF seems to never touch the background or
the root window.

Having three trivial/tri-repeat applications running at the same time works
fine, and it seems that the SCF happens more frequently/easily.

Todo:
- confirm it's not happening with swrast
- try disabling all 2D rendering (fill, clear, copy) in NV20 Gallium one by one

Ideas:
- could nv2x_graph_context_init (DRM) be incorrect?
- buggy hw ctx switching? Hope not! But nvidia did use sw ctx switching for
some reason.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

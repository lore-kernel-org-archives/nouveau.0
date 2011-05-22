From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35930] flickering in many OpenGL applications with
 composition manager
Date: Sun, 22 May 2011 03:19:18 -0700 (PDT)
Message-ID: <20110522101918.14035130051@annarchy.freedesktop.org>
References: <bug-35930-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35930-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35930

--- Comment #18 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-05-22 03:19:17 PDT ---
Also note that user with nick 'curro' noted that
https://bugs.freedesktop.org/show_bug.cgi?id=35452 fixes that issue partially,
and indeed even though flickering is there, at least upon full-screen game
exit, compiz continues to work fine and not gain the same flickering issue.

Also I found out why alien-arena was such a good reproducer of this bug.
It now looks that compiz due to a bug or a race doesn't un-redirect games that
switch resolution upon start.
(First I noticed that if game uses non-native resolution, it always flickers,
then I switched the screen via xrandr to target resolution _before_ starting
the game, and flicker disappeared)
And alien-arena weren't using native resolution.
Pretty much for me that issue is fixed now as I don't really play
non-fullscreen games (FPS loss and pointless anyway).
And nether I want to play while rendering is done via compiz (because of
non-native resolution bug)
Nouveau i quite fast these days, fast enough to run all games I play
occasionally at native resolution (1280x800)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35901] two full hd displays (left and right) with
 nouveau does not work any more
Date: Mon, 25 Apr 2011 14:20:24 -0700 (PDT)
Message-ID: <20110425212024.19AFF130051@annarchy.freedesktop.org>
References: <bug-35901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35901

--- Comment #12 from Greg Turner <gmturner007-yWtbtysYrB+LZ21kGMrzwg@public.gmane.org> 2011-04-25 14:20:23 PDT ---
Some observations about this bug which may or may not be helpful.  I messed
around with xrandr to see exactly what would and wouldn't trigger the problem.

If I slightly overlay my second display onto the first one's viewport, then the
problem vanishes.  Turns out that if I have 16 or more pixels of horizontal
overlap, the bug does not occur, but once the right-hand display comes within
16 pixels of a standard --right-of arrangement, the bug occurs.

Finally, I found that the bug only occurs at 24bpp.

Also, I found a pseudo-workaround.  It's pretty horrible though.  If I do:

  $ xrandr --output DVI-I-1 --scale 1x1.0001
  $ xrandr --output DVI-I-2 --scale 1x1.0001

which is just enough to add one vertical pixel to the screen dimensions, then I
get a result which very closely approximates a working setup.  Obviously this
is a terrible kludge and really no solution at all but it was good enough to
get me up and running.

HTH,

-gmt

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

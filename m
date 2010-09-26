From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30375] (NV34) X server using 100% cpu with latest
 nouveau.git and xf86-video-nouveau.git
Date: Sun, 26 Sep 2010 13:59:24 -0700 (PDT)
Message-ID: <20100926205924.ED5B9130106@annarchy.freedesktop.org>
References: <bug-30375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30375

--- Comment #1 from Robert Kaiser <kairo-mUdhYT1RRAM@public.gmane.org> 2010-09-26 13:59:24 PDT ---
I didn't find anything sticking out that could influence graphics that way when
I did look at Firefox/Mozilla code logs, and I didn't see that happening myself
even though I'm using state-of-the-art Mozilla code as part of my work daily,
and I'm using nouveau as well.

Are you sure it's not something like Flash, which accesses graphics directly?

Of course, with Firefox adding hardware acceleration capabilities recently, our
Mozilla code could trigger nouveau bugs more easily - but from what I see on my
machine, Mozilla doesn't actually enable hardware-accelerated windows (i.e.
compositing) with nouveau right now. Check the bottom of about:support in
Firefox, it probably will tell you that 0/x windows are accelerated.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

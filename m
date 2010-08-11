From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M or GT218 with nouveau: X server hangs
 spontaneously
Date: Wed, 11 Aug 2010 11:38:14 -0700 (PDT)
Message-ID: <20100811183814.6C2081300B9@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #33 from Rich Coe <Richard.Coe-uBwQTICB363QT0dZR+AlfA@public.gmane.org> 2010-08-11 11:38:13 PDT ---
I found this bug while researching my X locks up issue.  
This solution does not address the hardware issue documented here, but
I want help anyone who is in a similar situation that does *NOT* have
the hardware lockup and that the noaccel=1 does not work.

In my case all you have to do is move a window and then immediately
click in another window.  There may be other ways to reproduce this.

The only workaround is to restart the window manager or Xorg.

Investigating the issue I found this patch:
http://cgit.freedesktop.org/xorg/xserver/patch/?id=1884db430a5680e37e94726dff46686e2218d525
Subject: Revert "dix: use the event mask of the grab for TryClientEvents."

I am using xorg-server-1.8.0 and found the issue was introduced in
xorg-server-1.6.3. The patch fix appears in xorg-server-1.8.2 and later

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

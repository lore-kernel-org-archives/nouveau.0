From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13866] nouveau gives Xvideo tearing
Date: Thu,  3 Jan 2008 12:57:49 -0800 (PST)
Message-ID: <20080103205749.815E8130009@annarchy.freedesktop.org>
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


drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|RandR 1.2 gives Xvideo      |nouveau gives Xvideo tearing
                   |tearing                     |




------- Comment #1 from drzeus-bugzilla-p3sGCRWkH8CeZLLa646FqQ@public.gmane.org  2008-01-03 12:57 PST -------
I've tested things a bit further. RandR 1.2 is not needed to produce the
problem, but having two output enabled worsens the problem.

Things work fine with the nv driver, so you do not need to compare with the
closed one.

I've confirmed that all three test cases (nv, nouveau "normal", nouveau
"randr") use the same mode line. The RandR code path selects a different one by
default, but I switched it to get a valid comparison.

This card does not have any overlay, so it's the blitter that's involved.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

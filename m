From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 12473] [randr12] Xv scales to match virtual
	resulotion, not actual resolution.
Date: Tue, 18 Dec 2007 06:45:12 -0800 (PST)
Message-ID: <20071218144512.CEFAD130051@annarchy.freedesktop.org>
References: <bug-12473-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-12473-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=12473





------- Comment #1 from madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org  2007-10-05 07:37 PST -------
Does this occur both with overlay and blitter (use xvinfo to determine which
ports are blitter)?


------- Comment #2 from xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org  2007-10-05 13:07 PST -------
So currently I am running my screen with the same desktop-size as the virtual
screen.
Most of the time the overlay seems to work as it should, i.e. good picture on
first screen, blank windows on second screen.
But sometimes somehow the scaling is still wrong. I have not been able to find
out a way to reproduce currently.
I will report back if I find a way to reproduce.

Blitter seems to work perfectly on both screens.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

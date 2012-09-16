From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52244] [ 4.876531] [drm] nouveau 0000:01:00.0: GPU
 lockup - switching to software fbcon
Date: Sun, 16 Sep 2012 22:38:18 +0000
Message-ID: <bug-52244-8800-gB34b4vH6j@http.bugs.freedesktop.org/>
References: <bug-52244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52244

--- Comment #13 from WorMzy Tykashi <wormzy.tykashi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-16 22:38:18 UTC ---
https://bugs.freedesktop.org/show_bug.cgi?id=53101 and
https://bugs.freedesktop.org/show_bug.cgi?id=53566 look to be a duplicates of
this bug.

Can confirm that reverting commit 1a46098e910b96337f0fe3838223db43b923bad4
'fixes'* the problem. I'm using 3.6.0-rc5 right now after doing just that.


*Haven't extensively tested this yet, I've only just compiled and booted a
'fixed' kernel, but everything seems fine so far. In the second report, Vlad K
suggests that reverting this commit may only delay the lockup.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

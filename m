From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40050] freezing nouveau,
	when playing videos on a 2nd screen
Date: Tue, 27 Mar 2012 02:40:04 +0000
Message-ID: <bug-40050-8800-Bg2cqCedJt@http.bugs.freedesktop.org/>
References: <bug-40050-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40050-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40050

--- Comment #2 from Christoph Anton Mitterer <calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org> 2012-03-26 19:40:04 PDT ---
Hi.

Well disabling 3D makes the whole thing quit boring, right? ;)
And isn't it shipped as more or less "stable" now anyway?


Nevertheless, the problem persists, but few news:
I tried just before with Linux 3.0.0 (upgrading that system to the most recent
versions is a bit painful).

Things have improved a bit:
The system no longer freezes forever, it recovers after some time (2-3 minutes)
and continues to work "flawlessly".

Also this seems to be no longer specially triggered by watching video but
rather by e.g. switching the virtual desktop (and the then ongoing compiz 3D
animations).

During the freeze, e.g. the sound continues to work. But mouse/keboard are
dead.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

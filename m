From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22763] suspend doesn't works
Date: Wed, 22 Jul 2009 04:12:30 -0700 (PDT)
Message-ID: <20090722111230.BD3C4130058@annarchy.freedesktop.org>
References: <bug-22763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22763-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22763





--- Comment #10 from okias <d.okias-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-07-22 04:12:29 PST ---
Actual state on 9600M GT.
Console testing (KMS enabled, nouveau/linux-2.6 master, rc3, kernel+ddx today
updated):
hibernate-ram: working fine! Circa 10 seconds is console extremly slow, but
after 10s console working fast

hibernate: it hibernate to hdd, it shudown self, but if is machine power on,
LCD is black and system not working. Removing battery and AC power helps. After
that system successfully resume from hdd to previous state.

X testing (KMS enabled, no EXAPixmaps)
hibernate-ram: switch to console, suspend, after pressing power try to
continue, switch to fbcon, try to switch back X and then screen goes into state
from console hibernate (same problem)

X testing (KMS enabled, EXAPixmaps)
can't test, cause now EXAPixmaps rendering one bold line(vertical block on
screen circa 3 seconds and it's terrible slow


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

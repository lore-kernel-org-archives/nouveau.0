From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26521] Bug in kernel module - ttm_bo_pci_offset
Date: Wed, 17 Feb 2010 01:39:08 -0800 (PST)
Message-ID: <20100217093908.795CE13009E@annarchy.freedesktop.org>
References: <bug-26521-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26521-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26521





--- Comment #4 from Alexander <alex.vizor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-02-17 01:39:07 PST ---
About full debugging kernel in last post, I compiled kernel with:
- Compile the kernel with debug info
- Compile the kernel with frame pointers
from "Kernel hacking" section in menuconfig.

Before 2.6.33-rcX I used nvidia blob and it always works good with suspend to
ram and never resume from suspend to disk. I didn't use nouveau before
2.6.33-rcX so I can't say worked it or not for me earlier.

Starting from 2.6.33-rcX I'm using nouveau included in kernel. And I have some
troubles with suspending and resuming (with both to ram and to disk). 

About suspend to disk - I tested it as described in kernel documentation
immediately after system start without X and with it, with different debug
option and all worked just well. Then I worked for an hour and tried to to
suspend to disk and laptop hanged up. I'm using KDE with effects through
XRender may be this can affect.

About suspend to ram - I don't know how to reproduce this bug, it appears
randomly, ones ten, and actually that is all I can say about it the rest in
kernel log :)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

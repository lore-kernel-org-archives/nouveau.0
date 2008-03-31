From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15276] text rendering,
 PGRAPH_ERROR/ILLEGAL_MTHD/  PROTECTION_FAULT spam in syslog
Date: Mon, 31 Mar 2008 05:20:22 -0700 (PDT)
Message-ID: <20080331122022.1DC9D130197@annarchy.freedesktop.org>
References: <bug-15276-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15276-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15276





--- Comment #4 from Paul Wise <pabs3-RVKGE0iud0ZIf6P1QZMOBw@public.gmane.org>  2008-03-31 05:20:21 PST ---
I purged everything from the nvidia 96xx legacy proprietary driver after I
verified that it still sucks (used to kernel freeze occasionally, now kernel
freezes when X starts) and before starting with nouveau stuff.

Looks like the fb thing was caused by vesafb being compiled into my kernel and
having vga=... on the kernel command-line. Without this, I still get the same
syslog spam and the text rendering issue. The monitor attached to the computer
is now being used on another computer, I'll get you the updated logs later
tonight.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

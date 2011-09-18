From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau becomes very unstable after
 suspend/hibernate/resume (corrupted graphics and hangs with OpenGL
 applications) GeForce 9500 GT
Date: Sat, 17 Sep 2011 20:27:04 -0700 (PDT)
Message-ID: <20110918032704.D5294130056@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #70 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-17 20:27:04 PDT ---
Now the situation is much better. We did many tests and we get this picture:

There are 3 problems that are more or less independent. All are caused by ether
suspend or running BIOS init tables (tested).
None of these problems happen if nether of above was done.

In other words BIOS init tables set some registers to harmful values, but
nvidia driver undoes that - bios writes really are evil and indeed one need
'glove box' to handle BIOSes.

1. Fault in MP1 of TP0 - we tested that often and we did get it with
force_post=1.
Nvidia ctxprog (more likely ctxvals) 'fixes' this.

2. Semaphore related fault, happen after around 10 minutes of full screen STK.
Was reproduced with and without forced POSTing, one time in each situation,
same error according to PFIFO state dumps.
Can be 'fixed' by turning pageflipping off.


3. Crash that happens if we run glxgears in addition to STK.
Happens very fast (~3 seconds from glxgears start), regardless of pageflipping.
Both PFIFO and PGRAPH appears to be idle though.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

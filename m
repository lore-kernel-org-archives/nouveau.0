From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] BIOS POST tables induced problems on GeForce
	9500 GT
Date: Sun, 18 Sep 2011 15:41:53 -0700 (PDT)
Message-ID: <20110918224153.3AAE61301FC@annarchy.freedesktop.org>
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

--- Comment #74 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-18 15:41:52 PDT ---
OK Folks, it was just one bit, and it was unset by bios init tables.
One 
Bit 0x400000 of register 0x4008, the register that responsible for memory
clock.

Actual values of this register:


before suspend:

0x90596400 PCLOCK.MPLL1 => { UNK0 = 0x6400 | P = 0x1 | UNK19 = 0xb | UNK28 =
0x1 | ENABLE }

after suspend:   
0x90016400 PCLOCK.MPLL1 => { UNK0 = 0x6400 | P = 0x1 | UNK19 = 0 | UNK28 = 0x1
| ENABLE }

test1:  0x90096400 - corruptions, but stable (with ctxfw, hang after 10 secs)
test2   0x90516400 - good (with ctxprog)
test3   0x90416400 - good (with ctxprog), without ctxprog: good
test4   0x90116400 - corruptions without ctxprog

Also seems that without nvidia's ctxprog, while we always got corruption, we
didn't get hangs (but we tested just few laps of STK+glxgears)
It doesn't matter much. It is one bit and its in unknown PLL area....

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

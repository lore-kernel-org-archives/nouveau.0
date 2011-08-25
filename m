From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40336] Nouveau: Kernel oops when unplugging external
	monitor
Date: Wed, 24 Aug 2011 23:29:27 -0700 (PDT)
Message-ID: <20110825062927.D2B181300CD@annarchy.freedesktop.org>
References: <bug-40336-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40336-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40336

--- Comment #10 from marco-w08N04152XNe4xh82S9ftw@public.gmane.org 2011-08-24 23:29:27 PDT ---
(In reply to comment #9)
> Created an attachment (id=50547)
 View: https://bugs.freedesktop.org/attachment.cgi?id=50547
 Review: https://bugs.freedesktop.org/review?bug=40336&attachment=50547

> fix
> 
> Hi Marco
> 
> Thanks for the comprehensive bug report
> 
> Regarding your issue - I believe it's similar to bug 40005
> 
> Although in your case the nv04 codepath has been used
> 
> Can you please try the patch provided
> 
> Cheers
> Emil


Hi Emil,

it worked!!
Thank you very much for your work.

I am very satisfied with nouveau.
I just have one bug on my list. Unfortunately, it is very hard to trigger this
bug. It happens sometimes with mplayer2, but not mplayer. And it is somehow
connected to a huge number of messages like
(EE) NOUVEAU(0): [DRI2] DRI2SwapBuffers: drawable has no back or front?

I will open a new bug if I have more reliable information and maybe log files.

Can be marked as fixed.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

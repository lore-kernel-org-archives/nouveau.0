From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Mon,  3 Mar 2008 15:53:07 -0800 (PST)
Message-ID: <20080303235307.8BE951300E4@annarchy.freedesktop.org>
References: <bug-14597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14597





--- Comment #23 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-03-03 15:53:06 PST ---
I'm afraid comments 20 & 21 miss the point; that I want parse_init_table to
run, and any bad reg writes to be fixed up afterwards. If running
parse_init_table is causing problems, then we need to go back to the code of
comment 18, and try and figure out what breaks.

From sbriglie's comments on IRC, the code in comment 18 worked when the data
writen at index 0x02 was changed from 0x32 to 0x72, and the suggestion of using
comment 15's code was that it would be a patch run *after* the script, to fix
up the contents of index 0x02 (much like link_head_and_output fixes index 0x04
currently).

I guess the step-by-step way forward here is to verify that the unrolled
version in comment 18 works, when all the code is allowed to execute (no
comments) and 0x32 is changed to 0x72. THEN, to change that 0x72 back to 0x32,
and add 

nv32_wr(pScrn, 0x006828b4, 0x72);
nv32_wr(pScrn, 0x006828b0, 0x02);

on the end of the unrolled script as a fix-up, and check that works.

Assuming that's ok, calling parse_init_table, then calling that same fix-up
code ought be have exactly the same result, and these two writes can be added
as a ppc specific quirk.

Hopefully this all makes sense to you ppc people, but if I'm being incoherent
please say and I'll code up a set of numbered patches of what I want testing :)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

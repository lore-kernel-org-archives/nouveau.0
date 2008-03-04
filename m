From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Mon,  3 Mar 2008 18:44:37 -0800 (PST)
Message-ID: <20080304024437.EFE5D13008C@annarchy.freedesktop.org>
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





--- Comment #24 from Danny <obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org>  2008-03-03 18:44:35 PST ---
Actually you make very much sense. I didn't realize yesterday but Jacopo's
comments seem inconsistent with mine and sbriglies reports on irc.

Your commit indeed fixed link_head_and_output. So it should work anyway when
parse_init_table is commented, and there would be nothing to "fixup". So to me,
comment 20 does not make sense. Yesterday evening i tried running with
parse_init_table and indeed it does not work, but adding the lines from comment
15 fixes it. Actually only fixing reg 2 fixes it, ie:
               nv32_wr(pScrn, 0x006828b4, 0x72);
               nv32_wr(pScrn, 0x006828b0, 0x02);
               nv32_wr(pScrn, 0x00001588, 0); 
is enough for me.

Since this wonderfully matches your last comment I think we've solved it. Apart
from how do you want to check _when_ to apply this fix and when not. It so far
was only reported on powerbooks, but the hw components are usually not only
specific to apple and could be used elsewhere. In addition, some types of
powerbooks have different hw.

d.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

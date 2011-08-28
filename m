From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37922] NV86: too high power usage.
Date: Sat, 27 Aug 2011 19:39:31 -0700 (PDT)
Message-ID: <20110828023931.5E9331300BA@annarchy.freedesktop.org>
References: <bug-37922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37922

--- Comment #24 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-08-27 19:39:31 PDT ---
1099/1588/1590 information as requested:


register 1098:

0x21ca0004 - default
0x21ca0034 - set by blob
0xf9fe007e - writeable bits
0x00000020 - enable automatic clock gating for register 0x1588
0x00000040 - enable automatic clock gating for register 0x1590


register 1588/1590:

* registers consists of 2bit subregisters (or 4bit subregisters maybe???):
0x00 - nothing
0x01 - automatic clock gating, doesn't affect engine usability 
        (tested on PGRAPH only). see register 0x1098

0x02 - nothing/reserved - tested this in all combinations
0x03 - disable clock - stops the engine - slightly larger power saving that
0x01, but difference small


1588 subregisters:
0x00000003 - PGRAPH - (or part of it).
0x00000030 - VPE - no power savings at all.

1590 subregisters:
0x00003000 - some VP2 engine
0x00000300 - some another VP2 engine
0x00000c00 - supposed to be also VP2 related - no reaction

also note that writing 0x8000 to this register while 1098 bit 0x40 set harms
power usage

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

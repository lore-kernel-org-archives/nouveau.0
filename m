From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54056] plenty of errors trapped write at plus PGRAPH
	error
Date: Fri, 31 Aug 2012 14:44:42 +0000
Message-ID: <bug-54056-8800-Pqoiyx3k5r@http.bugs.freedesktop.org/>
References: <bug-54056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54056-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54056

--- Comment #1 from Sebastian-6b102mguJBqELgA04lAiVw@public.gmane.org <sebastian-7CH+t18bm0uELgA04lAiVw@public.gmane.org> 2012-08-31 14:44:42 UTC ---
I get very similar symptoms, corrupted screen (Ubuntu login screen constantly
attempts to redraw itself with widgets in the wrong place) and missing mouse
pointer after login on my MacBookPro7,1 Nvidia 320M:

VM: trapped write at 0x00523b0000 on ch 2 [0x000007f9] PGRAPHG/PROP/DST2D
reason: VRAM_LIMIT
...


there are *plenty* of those. Kernel is 3.5.0-13 #14-Ubuntu SMP

The very first *error* in dmesg that I can see is
 PGRAPH - TRAP_TEXTURE - TP0: Unhandled ustatus 0x000000003

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

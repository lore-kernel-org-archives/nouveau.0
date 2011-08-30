From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27455] dualhead not working,
	second display always black
Date: Mon, 29 Aug 2011 23:56:20 -0700 (PDT)
Message-ID: <20110830065620.C48E61300B8@annarchy.freedesktop.org>
References: <bug-27455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27455

--- Comment #13 from Ge@@ru <geaaru-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-08-29 23:56:17 PDT ---
Hi,
i use a gentoo distribution and i see that after release of the nouveau kernel
driver v. 20110602 (with both kernel 3.x and 2.6.x) dual head doesn't work.
I have a NVIDIA Quadro FX 2800M.

01:00.0 VGA compatible controller: nVidia Corporation G92 [Quadro FX 2800M]
(rev a2

So, with version 20110801 and 20110820 there is a regression that doesn't
permit correct use of dual head.

Currently, i use xorg-server-1.10.3 (i try soon 1.11.0) but i don't think that
problem is on xorg-server.

So,now i downgrade version on kernel module to 20110602 and all works fine.
Please, can you verify where is regression?

As x11 driver i use v. 0.0.16_pre20110323.

Thanks

P.S. If it is needed i will upgrade soon a dump of the xorg.log when dual head
doesn't work.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

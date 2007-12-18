From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13481] RandR12 fails on GF6600Go
Date: Tue, 18 Dec 2007 08:49:27 -0800 (PST)
Message-ID: <20071218164927.7F3D1130052@annarchy.freedesktop.org>
References: <bug-13481-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13481-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13481


sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org




------- Comment #13 from sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org  2007-12-18 08:49 PST -------
Ok, here's some tests that might help the LVDS restore issue, please try these
in order and reboot between each. You should not have anything connected on
DVI. Report back if any of them work :)

1) try current git and see if it's magically fixed itself
2) only call nv_set_tmds_registers in nv_driver.c when nv_output2->type ==
OUTPUT_LVDS (i.e. not for OUTPUT_TMDS)
3) Leaving change from 2) in place, force crosswired in nv_driver.c (a few
lines above nv_set_tmds_registers call) to 0
4) Leaving change from 2) in place, force crosswired to 1


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

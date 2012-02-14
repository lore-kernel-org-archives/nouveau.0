From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Tue, 14 Feb 2012 15:48:35 +0000
Message-ID: <bug-39550-8800-ryTu8CrXKA@http.bugs.freedesktop.org/>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #25 from Jesse Brandeburg <jesse.brandeburg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org> 2012-02-14 15:48:35 UTC ---
Hi Emil, thanks. Behavior is unchanged with new kernels. I've tested through nouveau commit:

commit 9a0a03b43176ee676693232f2afe92b83b15233e
Author: Roy Spliet <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org>
Date:   Tue Feb 7 00:29:06 2012 +0100

    drm/nouveau/pm: several fixes for nvc0 memory timings

and 3.3.0-rc2 (actually the above is on top of)
which contains a0b2563

commit 62aa2b537c6f5957afd98e29f96897419ed5ebab
Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Date:   Tue Jan 31 13:31:54 2012 -0800

    Linux 3.3-rc2

with no change, from that patch or any other.

in fact nvapeek (nouveau git with 3.3.0-rc2) shows:
before suspend:
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000

after:
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444747 00000000

the only difference I see is e104 bit 10 being set before, and not after.

NOTE: I have the exact same laptop as Walther.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

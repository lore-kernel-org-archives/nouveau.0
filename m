From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33967] No image on a VGA screen attached to DVI with
 a dvi to vga adaptor on NVa3 card..
Date: Mon,  7 Feb 2011 05:13:55 -0800 (PST)
Message-ID: <20110207131355.7C82D13004F@annarchy.freedesktop.org>
References: <bug-33967-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33967-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33967

--- Comment #4 from Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-07 05:13:55 PST ---
just finished submitting a bug report to the gentoo bugzilla about the same
behaviour: upon boot the internal display goes blank at KMS activation time,
but external monitor works - xrandr reports both working and X (of course)
thinks it too.
(http://bugs.gentoo.org/show_bug.cgi?id=353957)

in my case the situation is a bit clearer: it all worked up to and including
2.6.36, so it's a 2.6.37 regression.

also, one more hint can be found in the fact that between the working and
non-working xrandr output there are differences in refresh rates for the
internal, non-working display.
my hw is a bit different (see the gentoo bug for details)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

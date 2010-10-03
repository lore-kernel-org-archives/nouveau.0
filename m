From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30582] SDL tests under su root crashes X server
Date: Sun,  3 Oct 2010 04:37:54 -0700 (PDT)
Message-ID: <20101003113754.E191613004F@annarchy.freedesktop.org>
References: <bug-30582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30582

--- Comment #1 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-10-03 04:37:54 PDT ---
Looks like such a hard crash, that logs do not get to disk. Can you try the
suggestions in http://nouveau.freedesktop.org/wiki/HangDiagnosis to get a
kernel log showing the crash?

Can you reproduce this without nouveau_dri.so?

Also, might be worth to try with the latest git nouveau kernel modules
(requires a kernel upgrade for you).

Is this a regression, have you ever had a situation, where the test apps do not
cause a hard crash?

Errm, "Couldn't set console screen info." sounds weird, are you sure SDL is
using X here, and does not attempt to use, say, SVGA or kernel framebuffer?
Does 'su root' allow you to start any X applications, that is, does it preserve
DISPLAY environment variable for you? Try starting e.g. xterm from a 'su root'
shell.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

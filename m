From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35360] nouveau: no space while hiding cursor
Date: Tue, 22 Mar 2011 10:32:03 -0700 (PDT)
Message-ID: <20110322173204.1E51A13000C@annarchy.freedesktop.org>
References: <bug-35360-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35360-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35360

--- Comment #3 from Robert White <rwhite-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org> 2011-03-22 10:32:03 PDT ---
Bonus Symptom: If I try to switch to VT(1) [e.g. ctrl-alt-f1] the cursor
disappears but the screen doesn't switch. Keyboard input goes nowhere, but when
I "switch back" [ctrl-alt-f7] the cursor returns and the keyboard comes back to
life. Any attempt to go from VT1-non-func to VT2-non-func makes no differenc.

DMESG from two attmpts left this behind...

[109438.348916] [drm] nouveau 0000:01:00.0: no space while hiding cursor
[109440.616640] detected fb_set_par error, error code: -16
[109456.000523] [drm] nouveau 0000:01:00.0: no space while hiding cursor
[109456.796429] detected fb_set_par error, error code: -16
[109473.865107] [drm] nouveau 0000:01:00.0: no space while hiding cursor


Note that the input paths in the alternate VTs are still good as I could
blindly log in before switching back. from /var/log/messages:

Mar 22 10:27:39 BAEatBoeing login[18516]: ROOT LOGIN  on '/dev/tty5'

Another possible contributor is that I have 'transparent hugepage' support
active. I don't know it that could have glombed onto some mapping as I no idea
how it really works 8-). I do know that the xorg shared mapping pages "seem to"
count since the number of hugepage mappings was non-zero immediately after xorg
started. (weak evidence, I know...)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

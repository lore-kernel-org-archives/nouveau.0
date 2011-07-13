From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Wed, 13 Jul 2011 10:17:31 -0700 (PDT)
Message-ID: <20110713171731.3987D1303DF@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #59 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2011-07-13 10:17:27 PDT ---
(In reply to comment #58)
> Uuggh, this seems to be a serious problem, even when using nvidia.ko.
> Why? Because xorg seems to probe drivers on startup, and somehow managing to
> load the nouveau module even when I want to use the nvidia module. The nouveau
> module then fails to unload properly (use count is always at least 1, and stays
> 1 even after changing to runlevel 3 and killing xorg).

Your problem has nothing to do with this bug report.

You are (or the X server is) trying to use nouveau and nvidia drivers at the
same time, which is known to cause havoc and should not be attempted. All the
fallout you described fits perfectly.

The simple fix for you is to define Driver "nvidia" in your xorg.conf.
That prevents probing of any drivers and uses only what you want.

If you feel there is bad behavior in the X server, when it probes different
drivers, you should file a bug against the X server. But first, make sure your
distribution has not patched the X server driver probing code, e.g. by adding
drivers not present in the original driver list. If they have, you should
complain to your distribution.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

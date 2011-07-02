From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33445] NVS 3100M : Blank screen on internal eDP
	monitor
Date: Sat,  2 Jul 2011 15:50:31 -0700 (PDT)
Message-ID: <20110702225031.74D0B13004F@annarchy.freedesktop.org>
References: <bug-33445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33445

--- Comment #15 from celelibi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-07-02 15:50:31 PDT ---
OMGWTFBBQ! IT WORKS! IT WORKS! :D
I can even start xorg using nouveau.

And at the same time it solves my ugly fonts I had using nvidia driver.

BTW, here are the log lines added (I suppose) by your patch:
Jul  3 00:30:56 Sylabtop kernel: [drm] nouveau 0000:01:00.0: DP config:
0x950e270e/0x00052801 0x004150c9 0x950e270e
Jul  3 00:30:56 Sylabtop kernel: [drm] nouveau 0000:01:00.0: DP config:
0x00000000/0x00000000 0x00401100 0x14000000
Jul  3 00:30:56 Sylabtop kernel: [drm] nouveau 0000:01:00.0: DP config:
0x00000000/0x00000000 0x00401100 0x14000000


Now I hope it wouldn't take too long to make a real patch. ;)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

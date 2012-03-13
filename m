From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37445] Nouveau regularly reports the TRAP_VFETCH
	FAULT errors.
Date: Tue, 13 Mar 2012 04:30:34 +0000
Message-ID: <bug-37445-8800-ESN5gk3x82@http.bugs.freedesktop.org/>
References: <bug-37445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37445

--- Comment #8 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-03-12 21:30:34 PDT ---
I also run into these errors.  They only occur after I reclock the card to any
performance level above 1. If I then run Heroes of Newerth (Opengl game)  I run
into slowdowns that will eventually lock the system up with this message in log
repeatedly.  The messages and slowdowns stop if I manage to kill X before the
system becomes unresponsive.  Running the game at the default performance level
works fine.

01:00.0 VGA compatible controller: nVidia Corporation G96 [GeForce 9600M GT]
(rev a1)

Mar 11 19:23:46 [kernel] [55207.554706] [drm] nouveau 0000:01:00.0: PGRAPH -
TRAP_VFETCH FAULT
Mar 11 19:23:46 [kernel] [55207.554724] [drm] nouveau 0000:01:00.0: PGRAPH -
TRAP_VFETCH 00f00000 0000fe0c 00000000 00000000
Mar 11 19:23:46 [kernel] [55207.554726] [drm] nouveau 0000:01:00.0: PGRAPH -
TRAP
Mar 11 19:23:46 [kernel] [55207.554730] [drm] nouveau 0000:01:00.0: PGRAPH - ch
4 (0x00040f0000) subc 5 class 0x8297 mthd 0x0f04 data 0xbef727ba
Mar 11 19:23:46 [kernel] [55207.554743] [drm] nouveau 0000:01:00.0: VM: trapped
read at 0x0000000000 on ch 4 [0x000040f0] PGRAPH/VFETCH/00 reason:
PT_NOT_PRESENT

libdrm mesa xf86-video-nouveau and kernel current as of 3 PM 02/19/2012 PST

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

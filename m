From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 41585] X freeze and PGRAPH errors in dmesg
Date: Sat, 29 Oct 2011 12:45:21 +0000
Message-ID: <bug-41585-8800-n9IlxkUi73@http.bugs.freedesktop.org/>
References: <bug-41585-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-41585-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=41585

--- Comment #10 from dirkneukirchen-S0/GAf8tV78@public.gmane.org 2011-10-29 05:45:21 PDT ---
I think i see the same bug 

uname -a
Linux tenchi-htpc 3.1.0-1-generic #1-Ubuntu SMP Tue Oct 18 21:46:02 UTC 2011
i686 athlon i386 GNU/Linux

System:
- Ubuntu oneiric with current xorg-edgers
- Dual Monitor Setup (1680x1050,1280x1024)
- videocard is onboard 8200
- several video player freezes (totem), faster if I skip forwards/backwards ->
updated to xorg-edgers but problem remained 
- filed some launchpad bug:
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/877626

(In reply to comment #9)
> It's not enough. Sorry.
> 
> You need to find quick and reliable way to reproduce it, like running some 
> rendercheck or piglit test.

I installed the libs and got piglet from that git repo

env PIGLIT_BUILD_DIR=`pwd` ./piglit-run.py tests/sanity.tests
results/sanity.results
[Sat Oct 29 14:26:02 2011] ::  running :: glean/basic
[Sat Oct 29 14:26:15 2011] ::     pass :: glean/basic
[Sat Oct 29 14:26:15 2011] ::  running :: glean/readPixSanity
[Sat Oct 29 14:29:07 2011] ::     fail :: glean/readPixSanity

Thank you for running Piglit!
Results have been written to results/sanity.results/main

Dmesg output:
[ 1079.152099] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP_TPDMA - TP0: Unhandled
ustatus 0x00020000
[ 1079.152105] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 1079.152112] [drm] nouveau 0000:02:00.0: PGRAPH - ch 4 (0x0004d6c000) subc 5
class 0x8397 mthd 0x19d0 data 0x00000001
[ 1079.466136] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP_TPDMA - TP0: Unhandled
ustatus 0x00020000
[ 1079.466146] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 1079.466158] [drm] nouveau 0000:02:00.0: PGRAPH - ch 4 (0x0004d6c000) subc 5
class 0x8397 mthd 0x19d0 data 0x00000001
[ 1079.764620] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP_TPDMA - TP0: Unhandled
ustatus 0x00020000
[ 1079.764631] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP
[ 1079.764643] [drm] nouveau 0000:02:00.0: PGRAPH - ch 4 (0x0004d6c000) subc 5
class 0x8397 mthd 0x19d0 data 0x00000001
[ 1080.064785] [drm] nouveau 0000:02:00.0: PGRAPH - TRAP_TPDMA - TP0: Unhandled
ustatus 0x00020000

and more identical lines.
Attaching sanity.results/main

Are some new logs needed?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

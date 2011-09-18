From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] BIOS POST tables induced problems on GeForce
	9500 GT
Date: Sun, 18 Sep 2011 05:59:08 -0700 (PDT)
Message-ID: <20110918125908.8E0AD1300B9@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #73 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-18 05:59:07 PDT ---
I've ran SuperTuxKart for 9 hours (620/50000 laps) in total, without suspend
the machine.

The result: SuperTuxKart didn't crash or hang at all. I also ran glxgears in
the middle of it and no hangs or crashes. Stability is really good without
suspend.

I see lots of these messages on my dmesg however:

[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000
00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001980000) subc 5 class 0x8297
mthd 0x15f0 data 0xff0d2d07
[drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on ch 4
[0x00001980] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000
00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001980000) subc 5 class 0x8297
mthd 0x15f0 data 0xff346120
[drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on ch 4
[0x00001980] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000
00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001980000) subc 5 class 0x8297
mthd 0x15f0 data 0xff254208
[drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on ch 4
[0x00001980] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000
00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001980000) subc 5 class 0x8297
mthd 0x15f0 data 0xff041d00
[drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on ch 4
[0x00001980] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

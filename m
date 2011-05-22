From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37445] Nouveau regularly reports the TRAP_VFETCH
	FAULT errors.
Date: Sun, 22 May 2011 03:27:56 -0700 (PDT)
Message-ID: <20110522102756.D202813004F@annarchy.freedesktop.org>
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

--- Comment #4 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-05-22 03:27:56 PDT ---
I also have just seen that in kernel log:


[29782.682641] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_TEXTURE - TP0:
Unhandled ustatus 0x00000003
[29782.682671] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TPDMA_RT - TP 0 -
Unknown fault at address 0022467000
[29782.682693] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TPDMA_RT - TP 0 - e0c:
00000000, e18: 00000000, e1c: 00000000, e20: 00001100, e24: 00030000
[29782.682722] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[29782.682740] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000472b000) subc 5
class 0x8297 mthd 0x15e0 data 0x00000000
[29782.682771] [drm] nouveau 0000:01:00.0: VM: trapped write at 0x0022467000 on
ch 5 [0x0000472b] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT


Probably unrelated, or maybe not.
This time its texture fetch fault.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

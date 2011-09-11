From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted opengl/3d/composited
 graphics after suspend/hibernate
Date: Sat, 10 Sep 2011 22:55:06 -0700 (PDT)
Message-ID: <20110911055506.C88E413019F@annarchy.freedesktop.org>
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

--- Comment #54 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-10 22:55:02 PDT ---
Got this now (while playing Nexuiz) -- I got no crashes this time but this
error in dmesg:

[diego@myhost ~]$ dmesg
[drm] nouveau 0000:01:00.0: firmware ctxvals loaded
uhci_hcd 0000:00:1d.3: reserve dev 2 ep01-ISO, period 1, phase 0, 158 us
uhci_hcd 0000:00:1d.3: release dev 2 ep01-ISO, period 1, phase 0, 158 us
uhci_hcd 0000:00:1d.3: reserve dev 2 ep01-ISO, period 1, phase 0, 158 us
[drm] nouveau 0000:01:00.0: firmware ctxvals loaded
[drm] nouveau 0000:01:00.0: firmware ctxvals loaded
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000
00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000f7b0000) subc 5 class 0x8297
mthd 0x15f0 data 0x00000000
[drm] nouveau 0000:01:00.0: VM: trapped read at 0x0000000000 on ch 5
[0x0000f7b0] PGRAPH/VFETCH/00 reason: PT_NOT_PRESENT
uhci_hcd 0000:00:1d.3: release dev 2 ep01-ISO, period 1, phase 0, 158 us
[diego@myhost ~]$ 


As you can see, I did a "dmesg -c" before, so I make sure I go this now.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

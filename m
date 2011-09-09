From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted graphics after
 suspend/resume computer
Date: Thu,  8 Sep 2011 18:28:52 -0700 (PDT)
Message-ID: <20110909012852.F059B1301E3@annarchy.freedesktop.org>
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

--- Comment #26 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-08 18:28:52 PDT ---
Same problem when doing hibernate, even using 'shutdown' mode.
So no magic missing help from bios on resume of screwup from bios on resume is
expected.

Another sample:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07bf00 warp 1, opcode ff1f515e ff1f515e
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001ccd000) subc 5 class 0x8297
mthd 0x1b0c data 0x1000f010

And another:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07bf00 warp 12, opcode 00000000 00000000
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001319000) subc 5 class 0x8297
mthd 0x1b0c data 0x1000f010

All errors suggest that always MP1 of TP0 executes random garbage code.
So maybe, maybe......

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

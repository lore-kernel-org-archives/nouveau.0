From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted opengl/3d/composited
 graphics after suspend/hibernate
Date: Sun, 11 Sep 2011 19:19:16 -0700 (PDT)
Message-ID: <20110912021916.ACF1913009F@annarchy.freedesktop.org>
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

--- Comment #61 from Diego Viola <diego.viola-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-11 19:19:15 PDT ---
(In reply to comment #59)
> I suspended my computer (tm-suspend as root) then played SuperTuxKart and after
> completing the first race it just hung my computer.
> 
> I sssh-in and did a dmesg, here is the relevant log:
> 
> [drm] nouveau 0000:01:00.0: firmware ctxvals loaded
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: Failed to idle channel 5.
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000203
> 0x00000001 0x00000000 0x00000000
> [drm] nouveau 0000:01:00.0: PGRAPH idle timed out with status 0x00000203
> [drm] nouveau 0000:01:00.0: PGRAPH idle timed out with status 0x00000303
> [drm] nouveau 0000:01:00.0: PGRAPH TLB flush idle timeout fail: 0x00000303
> 0x00000001 0x00000000 0x00000000

The last time it crashed I was running the game in windowed mode at max
resolution (1680x1050). AFTER suspending.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

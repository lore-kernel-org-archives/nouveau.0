From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted graphics after
 suspending/resuming computer
Date: Tue,  6 Sep 2011 19:25:15 -0700 (PDT)
Message-ID: <20110907022515.BC3B71300B7@annarchy.freedesktop.org>
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

maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #24 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-06 19:25:15 PDT ---
So now we found that after suspend, starting glxgears (and that means pretty
much any 3D apps) produces the corruption found on screenshot in former
comment.

On first glxgear invocation after s2ram cycle, kernel log gets this:

[  297.625761] EXT4-fs (sda2): re-mounted. Opts: commit=0
[  297.628545] EXT4-fs (sda3): re-mounted. Opts: commit=0
[  306.243318] eth0: no IPv6 routers present
[  347.083807] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP_MP - TP0: Unhandled
ustatus 0x00020000
[  347.083812] [drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[  347.083818] [drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x0001b07000) subc 5
class 0x8297 mthd 0x1b0c data 0x1000f010

According to envytools, its TP0.MPC_TRAP bit MP1.

The failing PFIFO method doesn't always present in kernel log (eg it wasn't
there when we tested compiz) and it decodes to QUERY_GET method.

Any ideas?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

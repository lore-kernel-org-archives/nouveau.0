From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35876] Hard GPU hang on nvidia
Date: Fri,  1 Apr 2011 19:49:11 -0700 (PDT)
Message-ID: <20110402024911.C366613004E@annarchy.freedesktop.org>
References: <bug-35876-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35876-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35876

--- Comment #1 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-04-01 19:49:11 PDT ---
I might have being lucky with this bug, dunno.
I looked at docomentation at envytools and it mentions that you can't do a tlb
flush while pgraph is running on NV86.

Well, thats known and code contains a workaround.

What I did in addition to that is I took Martin Peres's code that
suspends/resumes pgraph and hooked it into nv84_graph_tlb_flush.
No hangs yet, but that doesn't mean anything yet.

I added this code:

    nv50_graph_pause(dev);
    nv50_vm_flush_engine(dev, 0);
    nv50_graph_unpause(dev);

So PGRAPH is paused when it is supposed to be idle.
Yet, his nv50_graph_pause often complains that:

[18931.100046] [drm] nouveau 0000:01:00.0: PGRAPH: PGRAPH paused while running
a ctxprog, NV40_PGRAPH_CTXCTL_0310 = 0x11
[18937.770017] [drm] nouveau 0000:01:00.0: PGRAPH: wait for idle fail: 00000000
00000000 00000000 00000101!

Let wait and see, but it could be that I am right and we need to pause PGRAPH
more aggressively here.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30024] New: Screen corruptions on suspend/resume
	[G86]
Date: Sun,  5 Sep 2010 01:50:41 -0700 (PDT)
Message-ID: <bug-30024-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30024

           Summary: Screen corruptions on suspend/resume [G86]
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Here I want to report a summary of the triage I did to very bizarre bug.
It mostly affects suspend while 3D application is running (compiz).
I won't make a claim that this can happen without it, but I did saw that few
times.
It could be that compiz was running before and corruption just surfaced.

The bug can be reproduced without suspend by triggering the eviction of video
ram
(a call to ttm_bo_evict_mm(&dev_priv->ttm.bdev, TTM_PL_VRAM); )

Next time I use nouveau, I will attach the pictures of typical corruptions.

When the most severe corruption happens, I see that in kernel log:

[25831.672535] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 5/7 Class 0x8297
Mthd 0x15e0 Data 0x00000000:0x00000000
[25831.672563] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000004 warp 0, opcode 3ab15cac 00000000
[25831.704343] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 5/7 Class 0x8297
Mthd 0x1a1c Data 0x00001111:0x00001111
[25831.704374] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 0:
INVALID_OPCODE at 000004 warp 0, opcode 3ab15cac 00000000
[25831.706436] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 5/7 Class 0x8297
Mthd 0x1a1c Data 0x00001111:0x00001111
[25831.706458] [drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP - TP0: Unhandled
ustatus 0x00020000


Note that 'opcode 3ab15cac 00000000' isn't random, that is always the bad
optcode executed.


While I did the debugging, I ruled out the following possibilities:

1. Lack of TIC flush if texture state didn't change (but textures could have
been moved)

2. Move of buffers while draw operation happens. It looks like on every
pushbuffer, card emits relocs for all active buffers and that also marks them
as used by adding a fence.

3. Move of buffers while card isn't idle (mostly as above, but I added another
wait for idle before eviction, and kept the one that after)

4. GPU assisted memory moves. I commented out the code that does that, thus
made it always revert to software copy.


So thats all.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26201] New: Some screen garbage,
 NoAccel and GPU lockup reported with NV4E
Date: Mon, 25 Jan 2010 01:38:35 -0800 (PST)
Message-ID: <bug-26201-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=26201

           Summary: Some screen garbage, NoAccel and GPU lockup reported
                    with NV4E
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: phelps-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32800)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32800)
drm/nouveau lines from dmesg

This is a weird one, so bear with me.

I'm using nouveau-linux git (eeec3a1) and KMS on the GeForce 6150 (NV4E)
embedded in my M2NPV-VM motherboard.  When I load the nouveau module, the
kernel logs the following, but the console appears to work just fine:

    [drm] nouveau 0000:00:05.0: GPU lockup - switching to software fbcon

When I start up the X server, it reports a similar error:

    (EE) NOUVEAU(0): Error creating GPU channel: -16
    (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel

This is probably not a duplicate of bug#26193 since the work-around that I'm
using doesn't help in that case.

Things then mostly work except window outlines turn to garbage when another
window is dragged over it.  This garbage isn't captured by a screen capture, so
I'm afraid we're stuck with my hand-wavy description.

Long ago, this used to just work, so I've bisected to find which commits broke
things, and found that these related commits appear to be the culprit:

    77bce8e  drm/nouveau: fix for ttm interface changes, and
    ad49f50  drm/ttm/radeon: add dma32 support.

I've found that commenting out the bit of ttm_tt_alloc page which adds
__GFP_DMA32 to the alloc_page flags fixes this issue, as does forcing the last
argument of ttm_bo_device_init() to false in nouveau_mem_init().  This, of
course, makes no sense -- the DMA32 memory zone is a fallback for the normal
memory zones.

I'm happy to test patches if anyone can think of anything to try.

Thanks,
-Ted


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

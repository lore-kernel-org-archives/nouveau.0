From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11820] New: two mplayers using Xv make DMA queue hang
Date: Thu,  2 Aug 2007 13:38:27 -0700 (PDT)
Message-ID: <bug-11820-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11820

           Summary: two mplayers using Xv make DMA queue hang
           Product: DRI
           Version: DRI CVS
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM modules
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pq-X3B1VOXEql0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Starting two mplayers showing video at the same time, both using Xv output,
makes eventually (withing about 15 minutes) the DMA queue hang.

First I bisected DDX and found the commit
e0e90f427581929fd01c96f1958a1292982dee83 "nouveau: rip out card init,
everything except modesetting." to be the first bad commit. Before this the
hang does not seem to happen. However, this and the previous commit both bumped
the patchlevel, so I started to bisect DRM.

Bisecting DRM found good and bad commits, all when using the forementioned DDX
commit. The first bad DRM commit is 5f05cd7086c54bccf1c2f0b003b78a08dc55472a
"nouveau: NV04/NV10/NV20 PGRAPH engtab functions". Commits before that work
fine.

The following is an excerpt from Xorg log:
(II) NOUVEAU(0): Fifo dump (lockup 0x004b,0x004b):
(II) NOUVEAU(0): [0x0037] 0x00230001
(II) NOUVEAU(0): [0x0038] 0x022002d0
(II) NOUVEAU(0): [0x0039] 0x00100000
(II) NOUVEAU(0): [0x003a] 0x00100000
(II) NOUVEAU(0): [0x003b] 0x00104400
(II) NOUVEAU(0): [0x003c] 0x022002d0
(II) NOUVEAU(0): [0x003d] 0x010105c0
(II) NOUVEAU(0): [0x003e] 0x0419b000
(II) NOUVEAU(0): [0x003f] 0x00000000
(II) NOUVEAU(0): [0x0040] 0x0004a2fc
(II) NOUVEAU(0): [0x0041] 0x00000003
(II) NOUVEAU(0): [0x0042] 0x00100300
(II) NOUVEAU(0): [0x0043] 0x0000000a
(II) NOUVEAU(0): [0x0044] 0x140007c0
(II) NOUVEAU(0): [0x0045] 0x00520700
(II) NOUVEAU(0): [0x0046] 0x00000000
(II) NOUVEAU(0): [0x0047] 0x000ca300
(II) NOUVEAU(0): [0x0048] 0x012d0104
(II) NOUVEAU(0): [0x0049] 0x03d20105
(II) NOUVEAU(0): [0x004a] 0x000f0006
(II) NOUVEAU(0): [0x004b] 0x00000005
(II) NOUVEAU(0): [0x004c] 0x00000003
(II) NOUVEAU(0): [0x004d] 0x000423fc
(II) NOUVEAU(0): [0x004e] 0x00000000
(II) NOUVEAU(0): [0x004f] 0x00184308
(II) NOUVEAU(0): [0x0050] 0x00230001
(II) NOUVEAU(0): [0x0051] 0x022002d0
(II) NOUVEAU(0): [0x0052] 0x00230001
(II) NOUVEAU(0): [0x0053] 0x022002d0
(II) NOUVEAU(0): [0x0054] 0x00100000
(II) NOUVEAU(0): End of fifo dump

Fatal server error:
DMA queue hang: dmaPut=4b, current=4b, status=1


This is NV28, running on a fully 64-bit Gentoo Linux.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

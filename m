From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30307] New: 8500GT Hardware Lockup
Date: Tue, 21 Sep 2010 07:35:51 -0700 (PDT)
Message-ID: <bug-30307-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30307

           Summary: 8500GT Hardware Lockup
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pat-lkml-Jx9fsTfDDR3YtjvyW6yDsg@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've been running into this with ALL drivers on ALL operating systems, and do
not believe this is a software glitch.  However, it may be something that you
are interested in, so I figured I would share it.

Basically, I have a 'silent' 8500GT:

 VGA compatible controller: nVidia Corporation G86 [GeForce 8500 GT] (rev a1)

that has a tendency to deadlock and/or get 'glitchy'.  When it get 'glitchy',
it just corrupts the screen.  No errors anywhere, just the output gets random
blinking blocks etc.  When it deadlocks, the system locks up shortly
there-after.  I've been having this happen for maybe 18 months, but never
caught a stack trace or anything, so have never reported it.

Again, this happens under windows and linux.

Today I managed to catch some dmesg errors between the card crashing and the
system rebooting.  here's the output:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/5 Class 0x8297 Mthd 0x15e0 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TEXTURE - no VM fault?
[drm] nouveau 0000:01:00.0: magic set 0:
[drm] nouveau 0000:01:00.0:     0x00408904: 0x20084e05
[drm] nouveau 0000:01:00.0:     0x00408908: 0x000095fa
[drm] nouveau 0000:01:00.0:     0x0040890c: 0x40000e00
[drm] nouveau 0000:01:00.0:     0x00408910: 0xb5002e04
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_TEXTURE - TP0: Unhandled ustatus
0x00000011
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020072000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20072f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP - Ch 2/3 Class 0x5039 Mthd 0x0328 Data
0x00000000:0x00000000
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF_IN - VM: Trapped read at
0020062000 status 00004320 00000000 channel 2
[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_M2MF - 00320251 20062f80 00000000
04000e00
[drm] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER - Ch 2

I don't expect that this can be fixed, as even nvidia doesn't have it right in
their windows drivers, but I thought that might at least provide some feedback
on someone hitting a corner case in the error handling. ("PGRAPH_TRAP_TEXTURE -
no VM fault?" looks like an error message someone was expecting to be
impossible)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

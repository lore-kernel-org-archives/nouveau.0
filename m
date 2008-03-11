From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14961] New: NV30: random dma queue hang
Date: Tue, 11 Mar 2008 14:11:58 -0700 (PDT)
Message-ID: <bug-14961-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14961

           Summary: NV30: random dma queue hang
           Product: xorg
           Version: 7.3
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pmandin-/BqsFWbVIFRWk0Htik3J/w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Sometimes I got this in the kernel logs:

[drm] PGRAPH_ERROR - nSource: LIMIT_ZETA, nStatus: PROTECTION_FAULT
[drm] PGRAPH_ERROR - Ch 2/2 Class 0x009f Mthd 0x0308 Data 0x00000007:0x011c0130

I checked every calls in DDX driver that set data to method 0x308 for class
0x9f (NV12_IMAGE_BLIT), and did not find anything that may cause the error. It
happens either at start time (heavy bus usage, to load everything from disk),
when I move a big window (opaque mode), or sometimes more randomly.

I notice some big lags just before it triggers, and X crashes with DMA queue
hang error. It's like the fifo data has been overwritten. Enabling
NOUVEAU_DMA_DEBUG in DDX did not show anything wrong.

Card is 0x10de:0x0309, NV30GL


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

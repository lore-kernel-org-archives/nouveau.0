From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14284] New: frequent DMA queue hangs on NV34 on
	powerpc
Date: Mon, 28 Jan 2008 22:42:58 -0800 (PST)
Message-ID: <bug-14284-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14284

           Summary: frequent DMA queue hangs on NV34 on powerpc
           Product: xorg
           Version: git
          Platform: PowerPC
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: obiwan-ajv+KCCKUOlAfugRpC6u6w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


When stressing the machine a bit (scrolling large amounts of icons, or running
gtkperf usually does the trick) but also after some time of normal use, I
inevitably get X to reset because of a hang in the DMA queue.

Drm messages:
Jan 27 01:23:23 legolas kernel: [  205.234985] [drm] PFIFO_DMA_PUSHER - Ch 1
put: 32, get:948 mthd 0x0a2c status 0x00001000
Jan 27 01:23:23 legolas kernel: [  205.235011] [drm] PGRAPH_ERROR - nSource:
ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Jan 27 01:23:23 legolas kernel: [  205.235021] [drm] PGRAPH_ERROR - Ch 1/6
Class 0x009f Mthd 0x0a00 Data 0x00030303:0x00011229
Jan 27 01:23:23 legolas kernel: [  205.235032] [drm] PGRAPH_ERROR - nSource:
ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Jan 27 01:23:23 legolas kernel: [  205.235040] [drm] PGRAPH_ERROR - Ch 1/6
Class 0x009f Mthd 0x0a04 Data 0x00030303
:0x00030303

This then continues until method 0a2c. The PGRAPH_ERROR are not always there.
The pusher interrupt is always happening. Sometimes, I also get 
[drm] PFIFO_CACHE_ERROR - Ch 1/0 Mthd 0x0000 Data 0x6f000000 status 0x00000001

Xorg log attached. 

Danny


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

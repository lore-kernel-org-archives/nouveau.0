From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25762] New: Quadro NVS 140M doesn't wake up anymore
Date: Tue, 22 Dec 2009 12:21:32 -0800 (PST)
Message-ID: <bug-25762-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25762

           Summary: Quadro NVS 140M doesn't wake up anymore
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi,

My laptop (featuring a Quadro NVS 140M) doesn't wake up after a suspend to ram.
This used to work two months ago but hasn't been working for the last month.

Today, I decided to track the problem a bit and this is what I got when
resuming :

[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 0
[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 0
[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 0
[drm] nouveau 0000:01:00.0: PFIFO_INTR 0x00000010 - Ch 0
....
My dmesg is full of this message and then shows
....
[drm] nouveau 0000:01:00.0: PFIFO still angry after 101 spins, halt

This happens with drm-next or with a stock kernel 2.6.32 with drm from
http://people.freedesktop.org/~pq/nouveau-drm/master.tar.gz.

Do you guys have any idea on what's going on ?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

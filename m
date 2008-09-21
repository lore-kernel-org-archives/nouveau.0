From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 17699] New: Xorg crashes when trying to share a VT
Date: Sun, 21 Sep 2008 12:06:08 -0700 (PDT)
Message-ID: <bug-17699-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=17699

           Summary: Xorg crashes when trying to share a VT
           Product: xorg
           Version: 7.3
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: me-PXJxRtMjfBtg9hUCZPvPmw@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I'm using Kubuntu 8.04.1 (with all the latest updates) and the nouveau driver
from https://launchpad.net/~raof/+archive

I have two video cards, a PCIEx16 nvidia 6600GT (pci:0000:01:00.0) and a PCI
ATI Radeon Mobility M7 LW (pci:0000:07:02.0). The nvidia card is connected to
two monitors (used in a dualhead configuration) and the ati card is connected
to a television via it's s-video output.

Using the proprietary nvidia driver I was able to start a second X server for
the ati card on a shared VT (using the -novtswitch and -sharevts options). Now
when I try that with the nouveau driver the X server of the nvidia card
crashes, here's an excerpt from the Xorg.0.log:

(II) NOUVEAU(0): Fifo dump (lockup 0x3fffffff,0x02d2):
(II) NOUVEAU(0): End of fifo dump

Fatal server error:
DMA queue hang: dmaPut=2d2, current=3fffffff, status=ffffffff

(II) NOUVEAU(0): NVLeaveVT is called.


What does work is if I start the second X server without the -novtswitch and
-sharevts options on it's own VT, but then I can't use both outputs at the same
time.

Here are some various files that might be of use:

nvidia card's Xorg.0.log: http://slexy.org/raw/s23sDw5Xzq
nvidia card's xorg.conf: http://slexy.org/raw/s21cWkoQiK
ati card's Xorg.1.log: http://slexy.org/raw/s2ld9etfR1
ati card's xorg.conf: http://slexy.org/raw/s2dCF4Rf0B


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

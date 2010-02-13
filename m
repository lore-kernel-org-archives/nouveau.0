From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26555] New: nouveau fails to fully resume nforce1
 (nv1a) after S3
Date: Sat, 13 Feb 2010 07:49:27 -0800 (PST)
Message-ID: <bug-26555-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26555

           Summary: nouveau fails to fully resume nforce1 (nv1a) after S3
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=33272)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=33272)
Kernel log for both scenarios (debug messages not captured)

Nouveau fails to fully resume from suspend to ram complaining with "PFIFO still
angry after 101 spins" and monitor just shows garbage (advertised fallback
software fbcon seems not to work). All is done with KMS on linux console,
without running X.

02:00.0 VGA compatible controller [0300]: nVidia Corporation NVCrush11
        [GeForce2 MX Integrated Graphics] [10de:01a0] (rev b1)
(see bug #25619 for full lspci)

kernel version used: 2.6.33-rc8 from Linus + commit
d5f669822059651c4db1be94cbab605e1ba5a389 from nouveau/master.


I tried the following approaches, all ending at the same state:

suspend with nouveau loaded, it POSTs the GPU (which causes monitor to display
"colorful flickering text console") and after doing modesetting displays
garbage and complains about the angry PFIFO.

suspend while unloading nouveau before suspend and loading it after resume (not
runing vbetool or anything special between resume and loading nouveau), in this
case system resumes quickly without graphics, nouveau then hits the same issues
as when it's resuming (though without POSTing GPU).

In either case switching back from nouveau to text console ends in the
"colorful flickering text console" (back to nouveau after that does not help
either).

It looks like either something is done in the wrong order or is missing for the
GPU to get things done right.


Is there anything additional I could provide to help getting the resume
working properly?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

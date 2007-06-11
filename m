From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 11240] New: doesn't start X - DMA Queue hang
Date: Mon, 11 Jun 2007 15:47:59 -0700 (PDT)
Message-ID: <bug-11240-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=11240

           Summary: doesn't start X - DMA Queue hang
           Product: xorg
           Version: 7.2
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: notting-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


startx dies with:

(II) Module already built-in
crtc 0 1360 1360
writting vpll 00027109
writting vpll2 00000000
output 0 debug_0 31101111
savep->dither 000F0000
0: crtc 0 output0: 0001: twocrt 1 twomon 1
crtc 1 1360 1360
writting vpll 00027109
writting vpll2 00027109
output 1 debug_0 31101111
savep->dither 000F0000
0: crtc 1 output1: 0101: twocrt 1 twomon 1
(EE) AIGLX error: dlopen of /usr/lib64/dri/nouveau_dri.so failed
(/usr/lib64/dri/nouveau_dri.so: cannot open shared object file: No such file or
directory)
(EE) AIGLX: reverting to software rendering

Fatal server error:
DMA queue hang: dmaPut=8a, current=0, status=0

writting vpll 00045405
writting vpll2 00045405
writting vpll 00045405
writting vpll2 00045405
XIO:  fatal IO error 104 (Connection reset by peer) on X server ":0.0"
      after 0 requests (0 known processed) with 0 events remaining.

01:00.0 VGA compatible controller: nVidia Corporation NV34GL [Quadro FX 500/600
PCI] (rev a1)
on an Intel E7505 chipset. Will attach X conf, x logs, etc.

xorg server 1.3.0, March 30 noveau snapshot (git head of the randr 1.2 branch
beahves similarly).

Originally filed as http://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=242773


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.

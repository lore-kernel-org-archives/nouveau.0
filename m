From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49088] New: MapsGL labels doen't render properly on
	nouveau
Date: Mon, 23 Apr 2012 13:19:27 +0000
Message-ID: <bug-49088-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=49088

             Bug #: 49088
           Summary: MapsGL labels doen't render properly on nouveau
    Classification: Unclassified
           Product: Mesa
           Version: 8.0
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alex_mayorga-/E1597aS9LQAvxtiuMwx3w@public.gmane.org


Something messed up MapsGL at http://maps.google.com/?vector=1 with this
configuration:

alex-mayorga@VPCCW1FFXL:~$ uname -a
Linux VPCCW1FFXL 3.2.0-23-generic #36-Ubuntu SMP Tue Apr 10 20:39:51 UTC 2012
x86_64 x86_64 x86_64 GNU/Linux

Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:14.0) Gecko/20120423 Firefox/14.0a1
ID:20120423034053

Graphics
Adapter Description nouveau -- Gallium 0.4 on NVA5
Vendor ID nouveau
Device ID Gallium 0.4 on NVA5
Driver Version 2.1 Mesa 8.0.2
WebGL Renderer nouveau -- Gallium 0.4 on NVA5 -- 2.1 Mesa 8.0.2
GPU Accelerated Windows 0
AzureBackend skia

This is how the map looks http://imm.io/n1PJ street names are not visible. Same
garbled labels appear on Chromium.

At first I thought it was a bug on Firefox and reported it as
https://bugzilla.mozilla.org/show_bug.cgi?id=745481

Also reported it to the distribution (Ubuntu) as
https://bugs.launchpad.net/ubuntu/+bug/981883

Both bug reports suggested this was a problem "upstream" and suggested I filed
the issue here so I'm doing that.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

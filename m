From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27706] New: Blank screen and "Error referencing VRAM
 ctxdma: -12" on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
Date: Fri, 16 Apr 2010 13:04:51 -0700 (PDT)
Message-ID: <bug-27706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

https://bugs.freedesktop.org/show_bug.cgi?id=27706

           Summary: Blank screen and "Error referencing VRAM ctxdma: -12"
                    on NV44A with ubuntu lucid beta 2 (worked in alpha 3)
           Product: xorg
           Version: 7.5
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: mossroy.mossroy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=35110)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35110)
Dmesg on ubuntu lucid beta 2 installed (does not work)

I can't start the ubuntu lucid beta 2 liveCD on a computer with a Nvidia
GeForce 6200 (NV44A rev A1) : the screen stays blank after booting.
It works properly with a ubuntu lucid alpha 3 liveCD (which probably uses a
previous version of nouveau) and ubuntu karmic liveCD (which uses nv driver)

I managed to install the beta 2 on this computer through the alternate CD : the
behavior is the same when booting on the hard drive.
I installed all the updates (as of 16th april 2040) : same behavior

I experience the precise same behavior with Fedora live : Fedora 12 live boots
correctly (but relies on "nv" driver), Fedora 13 beta live gives the same blank
screen (and also uses "nouveau" driver).

I think this is a regression in the "nouveau" graphic driver : the version
bundled with lucid alpha 3 works, the one with lucid beta 2 (or fedora 13 beta)
does not.
Here is an excerpt of the dmesg on beta 2 :
  nouveau 0000:03:00.0: RAMHT space exhausted. ch=0
  nouveau 0000:03:00.0: Error referencing VRAM ctxdma: -12
  nouveau 0000:03:00.0: gpuobj -12

This error message does not appear when using lucid alpha 3.

I found that adding "nouveau.noaccel=1" as a boot parameter is a workaround,
both on ubuntu lucid beta 2 and on fedora 13 beta

My motherboard is a Asus A7N8X-E deluxe, on which a GeForce 6200 video card
(branded MSI) is in the AGP port.

You will find attached the dmesg of :
- ubuntu lucid beta 2 installed (does not work)
- ubuntu lucid alpha 3 liveCD (works)
- ubuntu lucid beta 2 installed, with nouveau.noaccel=1 (works)

lspci gives :
03:00.0 VGA compatible controller: nVidia Corporation NV44A [Geforce 6200] (rev
a1)

I first opened this bug on ubuntu launchpad :
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/564617

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

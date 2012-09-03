From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54437] New: linux-nouveau2.6 (3.6.0-rc4) : GTX580 :
 Xorg freezes when using accel
Date: Mon, 03 Sep 2012 12:53:10 +0000
Message-ID: <bug-54437-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54437

             Bug #: 54437
           Summary: linux-nouveau2.6 (3.6.0-rc4) : GTX580 : Xorg freezes
                    when using accel
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: 3rik.gm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello,

I've compiled linux-nouveau-3.6.0rc4 x86_64 (made a package for Arch). With
this, the system is stable for 1 minute. Then, when I run compiz, or
cairo-dock, it freezes..

Here are dmesg messages :

[    0.000000] Linux version 3.6.0-1-nouveau (bioman@pumpkin) (gcc version
4.7.1 20120721 (prerelease) (GCC) ) #1 SMP PREEMPT Sun Sep 2 22:33:28 CEST 2012
[    1.236259] fb: conflicting fb hw usage nouveaufb vs VESA VGA - removing
generic driver
[    1.237326] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0c8000a1
[    1.237328] nouveau  [  DEVICE][0000:01:00.0] Chipset: GF110 (NVC8)
[    1.237329] nouveau  [  DEVICE][0000:01:00.0] Family : NVC0
[    1.238288] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.339740] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.339741] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.339822] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.339823] nouveau  [   VBIOS][0000:01:00.0] version 70.10.17.00
[    1.340038] nouveau  [     MXM][0000:01:00.0] no VBIOS data, nothing to do
[    1.362195] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    1.362196] nouveau  [     PFB][0000:01:00.0] RAM size: 1536 MiB
[    1.378219] nouveau  [     DRM][0000:01:00.0] VRAM: 1536MiB
[    1.378221] nouveau  [     DRM][0000:01:00.0] GART: 512MiB
[    1.378224] nouveau  [     DRM][0000:01:00.0] BIT BIOS found
[    1.378226] nouveau  [     DRM][0000:01:00.0] Bios version 70.10.17.00
[    1.378229] nouveau  [     DRM][0000:01:00.0] TMDS table version 2.0
[    1.378231] nouveau  [     DRM][0000:01:00.0] DCB version 4.0
[    1.378233] nouveau  [     DRM][0000:01:00.0] DCB outp 00: 02000300 00000000
[    1.378235] nouveau  [     DRM][0000:01:00.0] DCB outp 01: 01000302 00020030
[    1.378237] nouveau  [     DRM][0000:01:00.0] DCB outp 02: 04011380 00000000
[    1.378239] nouveau  [     DRM][0000:01:00.0] DCB outp 03: 08011382 00020030
[    1.378241] nouveau  [     DRM][0000:01:00.0] DCB outp 04: 02022362 00020010
[    1.378243] nouveau  [     DRM][0000:01:00.0] DCB conn 00: 00001030
[    1.378246] nouveau  [     DRM][0000:01:00.0] DCB conn 01: 00010130
[    1.378248] nouveau  [     DRM][0000:01:00.0] DCB conn 02: 00002261
[    1.406991] nouveau  [     DRM][0000:01:00.0] 0 available performance
level(s)
[    1.406993] nouveau  [     DRM][0000:01:00.0] c: core 50MHz shader 101MHz
memory 135MHz voltage 963mV fanspeed 40%
[    1.421196] nouveau  [     DRM][0000:01:00.0] MM: using COPY0 for buffer
copies
[    1.713751] nouveau  [     DRM][0000:01:00.0] allocated 1920x1200 fb:
0x60000, bo ffff88031f77b400
[    1.713938] fbcon: nouveaufb (fb0) is primary device
[    1.741008] fb0: nouveaufb frame buffer device
[    1.741010] [drm] Initialized nouveau 1.1.0 20120801 for 0000:01:00.0 on
minor 0
[    1.741023] nouveau 0000:02:00.0: enabling device (0004 -> 0007)
[    1.741572] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0c8000a1
[    1.741574] nouveau  [  DEVICE][0000:02:00.0] Chipset: GF110 (NVC8)
[    1.741576] nouveau  [  DEVICE][0000:02:00.0] Family : NVC0
[    1.742577] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    1.752297] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[    1.752300] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[    2.013316] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    2.013318] nouveau  [   VBIOS][0000:02:00.0] using image from PROM
[    2.013401] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    2.013403] nouveau  [   VBIOS][0000:02:00.0] version 70.10.17.00
[    2.013871] nouveau  [     MXM][0000:02:00.0] no VBIOS data, nothing to do
[    2.013886] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[    2.013887] nouveau  [   VBIOS][0000:02:00.0] running init tables
[    2.123350] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[    2.123352] nouveau  [     PFB][0000:02:00.0] RAM size: 1536 MiB
[    2.139055] nouveau  [     DRM][0000:02:00.0] VRAM: 1536MiB
[    2.139056] nouveau  [     DRM][0000:02:00.0] GART: 512MiB
[    2.139057] nouveau  [     DRM][0000:02:00.0] BIT BIOS found
[    2.139059] nouveau  [     DRM][0000:02:00.0] Bios version 70.10.17.00
[    2.139060] nouveau  [     DRM][0000:02:00.0] TMDS table version 2.0
[    2.139061] nouveau  [     DRM][0000:02:00.0] DCB version 4.0
[    2.139062] nouveau  [     DRM][0000:02:00.0] DCB outp 00: 02000300 00000000
[    2.139063] nouveau  [     DRM][0000:02:00.0] DCB outp 01: 01000302 00020030
[    2.139064] nouveau  [     DRM][0000:02:00.0] DCB outp 02: 04011380 00000000
[    2.139065] nouveau  [     DRM][0000:02:00.0] DCB outp 03: 08011382 00020030
[    2.139066] nouveau  [     DRM][0000:02:00.0] DCB outp 04: 02022362 00020010
[    2.139067] nouveau  [     DRM][0000:02:00.0] DCB conn 00: 00001030
[    2.139068] nouveau  [     DRM][0000:02:00.0] DCB conn 01: 00010130
[    2.139069] nouveau  [     DRM][0000:02:00.0] DCB conn 02: 00002261
[    2.146174] nouveau  [     DRM][0000:02:00.0] 0 available performance
level(s)
[    2.146176] nouveau  [     DRM][0000:02:00.0] c: core 50MHz shader 101MHz
memory 135MHz voltage 963mV fanspeed 40%
[    2.160303] nouveau  [     DRM][0000:02:00.0] MM: using COPY0 for buffer
copies
[    2.468525] nouveau  [     DRM][0000:02:00.0] allocated 1024x768 fb:
0x60000, bo ffff88031ec1b800
[    2.468602] fb1: nouveaufb frame buffer device
[    2.468604] [drm] Initialized nouveau 1.1.0 20120801 for 0000:02:00.0 on
minor 1
[  293.317841] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x40000000
[  311.737359] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x4294000000
[PT_NOT_PRESENT] from PGRAPH/CTXCTL on channel 0x005fcbb000
[  311.737368] nouveau W[   PFIFO][0000:01:00.0] unknown status 0x40000000
[  318.253976] nouveau E[     DRM][0000:01:00.0] GPU lockup - switching to
software fbcon
[  321.258010] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0001
[  323.258060] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  326.255500] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0000
[  326.257004] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  328.255524] nouveau E[   PFIFO][0000:01:00.0] channel 1 kick timeout
[  328.257004] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  330.255526] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  330.256872] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00000001
[  332.549469] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  334.585660] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  347.004925] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0001
[  349.004914] nouveau E[   PFIFO][0000:01:00.0] channel 2 kick timeout
[  351.005021] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  354.004593] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0000
[  356.004823] nouveau E[   PFIFO][0000:01:00.0] channel 1 kick timeout
[  358.004887] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  360.284163] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  362.320275] nouveau E[   PFIFO][0000:01:00.0] playlist update failed

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

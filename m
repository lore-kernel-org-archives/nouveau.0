From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62035] New: [Regression kernel 3.8.0+] G86 GeForce
 8400M GS 3D desktop effects does not work
Date: Fri, 08 Mar 2013 19:25:32 +0000
Message-ID: <bug-62035-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0252761846=="
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


--===============0252761846==
Content-Type: multipart/alternative; boundary="1362770733.d55bCd1f1.17574"; charset="us-ascii"


--1362770733.d55bCd1f1.17574
Date: Fri, 8 Mar 2013 19:25:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62035

          Priority: medium
            Bug ID: 62035
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [Regression kernel 3.8.0+] G86 GeForce 8400M GS 3D
                    desktop effects does not work
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Disto: Linux mint 14
Card: NVIDIA Corporation G86 [GeForce 8400M GS] (rev a1) (10de:0427)

Starting with kernel 3.8.0+ I can no longer log in to Cinnamon with desktop
effects. I get the following errors in the kernel log:

Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338710] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x086700a2
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338717] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G86 (NV86)
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338720] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.354358] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476751] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476757] nouveau  [  
VBIOS][0000:01:00.0] using image from PRAMIN
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476873] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476877] nouveau  [  
VBIOS][0000:01:00.0] version 60.86.45.00.40
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498750] nouveau  [    
PFB][0000:01:00.0] RAM type: GDDR3
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498756] nouveau  [    
PFB][0000:01:00.0] RAM size: 128 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498759] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 646 tags
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571799] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: PWM
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571812] nouveau  [ 
PTHERM][0000:01:00.0] Thermal management: disabled
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571936] nouveau  [ 
PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 105(5), 125(5) ]
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574747] nouveau  [     DRM] VRAM:
128 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574752] nouveau  [     DRM] GART:
512 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574759] nouveau  [     DRM] TMDS
table version 2.0
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574761] nouveau  [     DRM] DCB
version 4.0
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574765] nouveau  [     DRM] DCB
outp 00: 01000323 00010034
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574768] nouveau  [     DRM] DCB
outp 01: 02011300 00000028
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574770] nouveau  [     DRM] DCB
outp 02: 02022312 00020010
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574773] nouveau  [     DRM] DCB
conn 00: 0041
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574776] nouveau  [     DRM] DCB
conn 01: 0100
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574779] nouveau  [     DRM] DCB
conn 02: 2261
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574782] nouveau  [     DRM] DCB
conn 03: 0310
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574785] nouveau  [     DRM] DCB
conn 04: 0311
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574787] nouveau  [     DRM] DCB
conn 05: 0313
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574855] nouveau  [ 
PTHERM][0000:01:00.0] temperature (89 C) hit the 'fanboost' threshold
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574966] nouveau  [ 
PTHERM][0000:01:00.0] Thermal management: automatic
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.575019] nouveau E[ 
PTHERM][0000:01:00.0] unhandled intr 0x000001a1
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594679] nouveau  [     DRM] ACPI
backlight interface available, not registering our own
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594866] nouveau  [     DRM] 3
available performance level(s)
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594871] nouveau  [     DRM] 0: core
169MHz shader 338MHz memory 100MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594875] nouveau  [     DRM] 1: core
275MHz shader 550MHz memory 301MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594879] nouveau  [     DRM] 2: core
400MHz shader 800MHz memory 600MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594882] nouveau  [     DRM] c: core
200MHz shader 400MHz memory 351MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.616211] nouveau  [     DRM] MM:
using CRYPT for buffer copies
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.657561] nouveau  [     DRM]
allocated 1280x800 fb: 0x60000, bo ffff8802022ca800
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.657808] fbcon: nouveaufb (fb0) is
primary device
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720096] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720098] nouveau 0000:01:00.0:
registered panic notifier
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720104] [drm] Initialized nouveau
1.1.0 20120801 for 0000:01:00.0 on minor 0
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.258521] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x002001e020 on channel 0x00007b23 [unknown]
SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.258667] nouveau E[  
PFIFO][0000:01:00.0] CACHE_ERROR - ch 2 [Xorg[1206]] subc 0 mthd 0x0060 data
0xbeef0201
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.265971] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020315000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266029] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
00000000, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266097] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266141] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 2 class 0x502d mthd
0x0860 data 0xff4a4a4a
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266225] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020315000 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266363] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020316100
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266420] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
0006001e, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266489] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266533] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 2 class 0x502d mthd
0x0860 data 0xff040404
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266615] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020317300 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267099] nouveau E[ 
PGRAPH][0000:01:00.0] magic set 0:
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267140] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408904: 0x20081005
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267184] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408908: 0x00203150
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267225] nouveau E[ 
PGRAPH][0000:01:00.0]     0x0040890c: 0x40000432
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267266] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408910: 0x31500000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267302] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267375] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020317500
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267429] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
0016002a, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267498] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267541] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 7 class 0x8297 mthd
0x15e0 data 0x00000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267628] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020317700 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267756] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF NOTIFY
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267816] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF 00304041 00004360 00000000 06000432
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267861] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267906] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 0 class 0x5039 mthd
0x0328 data 0x00000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267981] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x0020313000 on channel 0x00007b23
[Xorg[1206]] PGRAPH/DISPATCH/M2M_IN reason: NULL_DMAOBJ
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268121] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF IN
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268178] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF 003200d1 20313bc0 00000000 04000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268223] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268266] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 0 class 0x5039 mthd
0x0328 data 0x00000000
Mar  8 20:07:45 pf-XPS-M1330 kernel: [   67.686493] nouveau  [ 
PTHERM][0000:01:00.0] temperature (86 C) went below the 'fanboost' threshold

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362770733.d55bCd1f1.17574
Date: Fri, 8 Mar 2013 19:25:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression kernel 3.8.0+] G86 GeForce 8400M GS 3D desktop effects does not work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62035">62035</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Regression kernel 3.8.0+] G86 GeForce 8400M GS 3D desktop effects does not work
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>pontus.fuchs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Disto: Linux mint 14
Card: NVIDIA Corporation G86 [GeForce 8400M GS] (rev a1) (10de:0427)

Starting with kernel 3.8.0+ I can no longer log in to Cinnamon with desktop
effects. I get the following errors in the kernel log:

Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338710] nouveau  [ 
DEVICE][0000:01:00.0] BOOT0  : 0x086700a2
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338717] nouveau  [ 
DEVICE][0000:01:00.0] Chipset: G86 (NV86)
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.338720] nouveau  [ 
DEVICE][0000:01:00.0] Family : NV50
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.354358] nouveau  [  
VBIOS][0000:01:00.0] checking PRAMIN for image...
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476751] nouveau  [  
VBIOS][0000:01:00.0] ... appears to be valid
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476757] nouveau  [  
VBIOS][0000:01:00.0] using image from PRAMIN
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476873] nouveau  [  
VBIOS][0000:01:00.0] BIT signature found
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.476877] nouveau  [  
VBIOS][0000:01:00.0] version 60.86.45.00.40
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498750] nouveau  [    
PFB][0000:01:00.0] RAM type: GDDR3
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498756] nouveau  [    
PFB][0000:01:00.0] RAM size: 128 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.498759] nouveau  [    
PFB][0000:01:00.0]    ZCOMP: 646 tags
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571799] nouveau  [ 
PTHERM][0000:01:00.0] FAN control: PWM
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571812] nouveau  [ 
PTHERM][0000:01:00.0] Thermal management: disabled
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.571936] nouveau  [ 
PTHERM][0000:01:00.0] Programmed thresholds [ 90(3), 95(3), 105(5), 125(5) ]
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574747] nouveau  [     DRM] VRAM:
128 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574752] nouveau  [     DRM] GART:
512 MiB
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574759] nouveau  [     DRM] TMDS
table version 2.0
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574761] nouveau  [     DRM] DCB
version 4.0
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574765] nouveau  [     DRM] DCB
outp 00: 01000323 00010034
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574768] nouveau  [     DRM] DCB
outp 01: 02011300 00000028
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574770] nouveau  [     DRM] DCB
outp 02: 02022312 00020010
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574773] nouveau  [     DRM] DCB
conn 00: 0041
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574776] nouveau  [     DRM] DCB
conn 01: 0100
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574779] nouveau  [     DRM] DCB
conn 02: 2261
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574782] nouveau  [     DRM] DCB
conn 03: 0310
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574785] nouveau  [     DRM] DCB
conn 04: 0311
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574787] nouveau  [     DRM] DCB
conn 05: 0313
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574855] nouveau  [ 
PTHERM][0000:01:00.0] temperature (89 C) hit the 'fanboost' threshold
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.574966] nouveau  [ 
PTHERM][0000:01:00.0] Thermal management: automatic
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.575019] nouveau E[ 
PTHERM][0000:01:00.0] unhandled intr 0x000001a1
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594679] nouveau  [     DRM] ACPI
backlight interface available, not registering our own
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594866] nouveau  [     DRM] 3
available performance level(s)
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594871] nouveau  [     DRM] 0: core
169MHz shader 338MHz memory 100MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594875] nouveau  [     DRM] 1: core
275MHz shader 550MHz memory 301MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594879] nouveau  [     DRM] 2: core
400MHz shader 800MHz memory 600MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.594882] nouveau  [     DRM] c: core
200MHz shader 400MHz memory 351MHz voltage 1150mV fanspeed 100%
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.616211] nouveau  [     DRM] MM:
using CRYPT for buffer copies
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.657561] nouveau  [     DRM]
allocated 1280x800 fb: 0x60000, bo ffff8802022ca800
Mar  8 20:06:41 pf-XPS-M1330 kernel: [    3.657808] fbcon: nouveaufb (fb0) is
primary device
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720096] nouveau 0000:01:00.0: fb0:
nouveaufb frame buffer device
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720098] nouveau 0000:01:00.0:
registered panic notifier
Mar  8 20:06:42 pf-XPS-M1330 kernel: [    4.720104] [drm] Initialized nouveau
1.1.0 20120801 for 0000:01:00.0 on minor 0
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.258521] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x002001e020 on channel 0x00007b23 [unknown]
SEMAPHORE_BG/PFIFO_READ/00 reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.258667] nouveau E[  
PFIFO][0000:01:00.0] CACHE_ERROR - ch 2 [Xorg[1206]] subc 0 mthd 0x0060 data
0xbeef0201
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.265971] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020315000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266029] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
00000000, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266097] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266141] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 2 class 0x502d mthd
0x0860 data 0xff4a4a4a
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266225] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020315000 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266363] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020316100
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266420] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
0006001e, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266489] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266533] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 2 class 0x502d mthd
0x0860 data 0xff040404
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.266615] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020317300 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267099] nouveau E[ 
PGRAPH][0000:01:00.0] magic set 0:
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267140] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408904: 0x20081005
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267184] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408908: 0x00203150
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267225] nouveau E[ 
PGRAPH][0000:01:00.0]     0x0040890c: 0x40000432
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267266] nouveau E[ 
PGRAPH][0000:01:00.0]     0x00408910: 0x31500000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267302] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TEXTURE - TP0: Unhandled ustatus 0x00000003
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267375] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - Unknown fault at address
0020317500
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267429] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_TPDMA_2D - TP 0 - e0c: 00000000, e18: 00000000, e1c:
0016002a, e20: 00000011, e24: 0c030000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267498] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267541] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 7 class 0x8297 mthd
0x15e0 data 0x00000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267628] nouveau E[    
PFB][0000:01:00.0] trapped write at 0x0020317700 on channel 0x00007b23
[Xorg[1206]] PGRAPH/PROP/DST2D reason: PAGE_NOT_PRESENT
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267756] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF NOTIFY
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267816] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF 00304041 00004360 00000000 06000432
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267861] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267906] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 0 class 0x5039 mthd
0x0328 data 0x00000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.267981] nouveau E[    
PFB][0000:01:00.0] trapped read at 0x0020313000 on channel 0x00007b23
[Xorg[1206]] PGRAPH/DISPATCH/M2M_IN reason: NULL_DMAOBJ
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268121] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF IN
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268178] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP_M2MF 003200d1 20313bc0 00000000 04000000
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268223] nouveau E[ 
PGRAPH][0000:01:00.0]  TRAP
Mar  8 20:07:24 pf-XPS-M1330 kernel: [   46.268266] nouveau E[ 
PGRAPH][0000:01:00.0] ch 2 [0x0007b23000 Xorg[1206]] subc 0 class 0x5039 mthd
0x0328 data 0x00000000
Mar  8 20:07:45 pf-XPS-M1330 kernel: [   67.686493] nouveau  [ 
PTHERM][0000:01:00.0] temperature (86 C) went below the 'fanboost' threshold</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362770733.d55bCd1f1.17574--

--===============0252761846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0252761846==--

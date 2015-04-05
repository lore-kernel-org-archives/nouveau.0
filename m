From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89912] New: Sometimes Nouveau hangs kernel with
 PGRAPH engine fault
Date: Sun, 05 Apr 2015 20:16:17 +0000
Message-ID: <bug-89912-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1634187713=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1634187713==
Content-Type: multipart/alternative; boundary="1428264977.24fcE01.8120"; charset="UTF-8"


--1428264977.24fcE01.8120
Date: Sun, 5 Apr 2015 20:16:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89912

            Bug ID: 89912
           Summary: Sometimes Nouveau hangs kernel with PGRAPH engine
                    fault
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: davispuh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 114883
  --> https://bugs.freedesktop.org/attachment.cgi?id=114883&action=edit
Loaded kernel modules

With Nvidia GTX 650 Ti on Arch Linux using kernel 3.19.2 and xf86-video-nouveau
1.0.11-3 sometimes random hangs happen which locks up whole kernel. Screen
stays frozen and mouse cursor can be moved, but nothing else, even numlock
doesn't respond.

From kernel log, last messages

kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/MP trap:
MULTIPLE_WARP_ERRORS
kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at 0x867e84f000 [PDE] from
GR/GPC2/RAST on channel 0x003f61d000 [kwin_x11[697]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 8,
recovering...
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/MP trap:
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0 0xbadf1200 0xbadf1200
kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1 0xbadf1200 0xbadf1200
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP UNHANDLED 0xb8df1200
kernel: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at
0x400108 [ IBUS ]


from some other times

---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002af000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[476]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...
---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002aa000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[459]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...
---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x003fa28000 [Xorg[496]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...

---

kernel: fb: switching to nouveaufb from EFI VGA
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6060a1
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 80.06.21.00.37
kernel: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 887500uv
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] 0a: core 549 MHz memory 1620 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] 0f: core 928-954 MHz memory 5400 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648 MHz 
kernel: nouveau  [     DRM] VRAM: 1024 MiB
kernel: nouveau  [     DRM] GART: 1048576 MiB
kernel: nouveau  [     DRM] TMDS table version 2.0
kernel: nouveau  [     DRM] DCB version 4.0
kernel: nouveau  [     DRM] DCB outp 00: 01000f02 00020030
kernel: nouveau  [     DRM] DCB outp 01: 02000f00 00020030
kernel: nouveau  [     DRM] DCB outp 02: 08011f82 0f420030
kernel: nouveau  [     DRM] DCB outp 03: 02022f62 0f420010
kernel: nouveau  [     DRM] DCB conn 00: 00001030
kernel: nouveau  [     DRM] DCB conn 01: 00002131
kernel: nouveau  [     DRM] DCB conn 02: 00010263
kernel: nouveau  [     DRM] MM: using COPY for buffer copies
kernel: nouveau  [     DRM] allocated 2560x1536 fb: 0x60000, bo
ffff88022316a400
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on minor 0
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a2000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[512]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428264977.24fcE01.8120
Date: Sun, 5 Apr 2015 20:16:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89912">89912</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Sometimes Nouveau hangs kernel with PGRAPH engine fault
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>davispuh&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=114883" name="attach_114883" title="Loaded kernel modules">attachment 114883</a> <a href="attachment.cgi?id=114883&amp;action=edit" title="Loaded kernel modules">[details]</a></span>
Loaded kernel modules

With Nvidia GTX 650 Ti on Arch Linux using kernel 3.19.2 and xf86-video-nouveau
1.0.11-3 sometimes random hangs happen which locks up whole kernel. Screen
stays frozen and mouse cursor can be moved, but nothing else, even numlock
doesn't respond.

From kernel log, last messages

kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/MP trap:
MULTIPLE_WARP_ERRORS
kernel: nouveau E[   PFIFO][0000:01:00.0] read fault at 0x867e84f000 [PDE] from
GR/GPC2/RAST on channel 0x003f61d000 [kwin_x11[697]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 8,
recovering...
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/MP trap:
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 8 [0x003f61d000
kwin_x11[697]]
kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP0 0xbadf1200 0xbadf1200
kernel: nouveau E[  PGRAPH][0000:01:00.0] ROP1 0xbadf1200 0xbadf1200
kernel: nouveau E[  PGRAPH][0000:01:00.0] TRAP UNHANDLED 0xb8df1200
kernel: nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT at
0x400108 [ IBUS ]


from some other times

---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002af000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[476]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...
---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002aa000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[459]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...
---
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a0000 [PTE]
from GR/GPC0/PROP_0 on channel 0x003fa28000 [Xorg[496]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...

---

kernel: fb: switching to nouveaufb from EFI VGA
kernel: nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6060a1
kernel: nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
kernel: nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
kernel: nouveau  [   VBIOS][0000:01:00.0] using image from PROM
kernel: nouveau  [   VBIOS][0000:01:00.0] BIT signature found
kernel: nouveau  [   VBIOS][0000:01:00.0] version 80.06.21.00.37
kernel: nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
kernel: nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
kernel: nouveau  [     PFB][0000:01:00.0] RAM size: 1024 MiB
kernel: nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage: 887500uv
kernel: nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
kernel: nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
kernel: nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
kernel: nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] 0a: core 549 MHz memory 1620 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] 0f: core 928-954 MHz memory 5400 MHz 
kernel: nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648 MHz 
kernel: nouveau  [     DRM] VRAM: 1024 MiB
kernel: nouveau  [     DRM] GART: 1048576 MiB
kernel: nouveau  [     DRM] TMDS table version 2.0
kernel: nouveau  [     DRM] DCB version 4.0
kernel: nouveau  [     DRM] DCB outp 00: 01000f02 00020030
kernel: nouveau  [     DRM] DCB outp 01: 02000f00 00020030
kernel: nouveau  [     DRM] DCB outp 02: 08011f82 0f420030
kernel: nouveau  [     DRM] DCB outp 03: 02022f62 0f420010
kernel: nouveau  [     DRM] DCB conn 00: 00001030
kernel: nouveau  [     DRM] DCB conn 01: 00002131
kernel: nouveau  [     DRM] DCB conn 02: 00010263
kernel: nouveau  [     DRM] MM: using COPY for buffer copies
kernel: nouveau  [     DRM] allocated 2560x1536 fb: 0x60000, bo
ffff88022316a400
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: nouveau 0000:01:00.0: registered panic notifier
kernel: [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on minor 0
kernel: nouveau E[   PFIFO][0000:01:00.0] write fault at 0x00002a2000 [PTE]
from GR/GPC1/PROP_0 on channel 0x003fa28000 [Xorg[512]]
kernel: nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel 2,
recovering...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428264977.24fcE01.8120--

--===============1634187713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1634187713==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92863] New: Complete freeze even with NvGrUseFW=1
Date: Sun, 08 Nov 2015 22:03:50 +0000
Message-ID: <bug-92863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2064881038=="
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


--===============2064881038==
Content-Type: multipart/alternative; boundary="1447020230.00f81.24982"; charset="UTF-8"


--1447020230.00f81.24982
Date: Sun, 8 Nov 2015 22:03:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92863

            Bug ID: 92863
           Summary: Complete freeze even with NvGrUseFW=1
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 119489
  --> https://bugs.freedesktop.org/attachment.cgi?id=119489&action=edit
EVGA GTX-660SC vbios.rom

[52879.546431] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002974000
[PTE] from GR/GPC1/T1_0 on channel 0x023f741000 [Xorg[1978]]
[52879.546435] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[52879.546445] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 7 [0x023f741000
Xorg[1978]]
[52879.546451] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52879.546456] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52879.546460] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52879.546466] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000009
[52879.546470] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000009

lcpci:

01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 660]
(rev a1)

rpm -qa | grep "mesa-dri\|nouveau\|xorg-x11-serer":

mesa-dri-drivers-11.0.3-1.20151012.fc23.x86_64
xorg-x11-drv-nouveau-1.0.12-0.3.fc23.x86_64
mesa-dri-drivers-11.0.3-1.20151012.fc23.i686

uname -a:

Linux saturn 4.2.5-300.fc23.x86_64 #1 SMP Tue Oct 27 04:29:56 UTC 2015 x86_64
x86_64 x86_64 GNU/Linux


dmesg | grep nouveau:

[    2.107108] fb: switching to nouveaufb from EFI VGA
[    2.108940] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    2.108941] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    2.108942] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.168853] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    2.168939] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.168940] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    2.169185] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    2.169230] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    2.169230] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    2.169231] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    2.171190] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    2.220669] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    2.220682] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    2.220699] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.220743] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    2.220760] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    2.220810] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    2.220870] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    2.220939] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    2.341538] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[    2.342216] nouveau  [     DRM] VRAM: 2048 MiB
[    2.342218] nouveau  [     DRM] GART: 1048576 MiB
[    2.342223] nouveau  [     DRM] TMDS table version 2.0
[    2.342225] nouveau  [     DRM] DCB version 4.0
[    2.342229] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    2.342231] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    2.342233] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    2.342235] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    2.342238] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    2.342240] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    2.342242] nouveau  [     DRM] DCB conn 00: 00001030
[    2.342245] nouveau  [     DRM] DCB conn 01: 00010161
[    2.342247] nouveau  [     DRM] DCB conn 02: 00020246
[    2.342249] nouveau  [     DRM] DCB conn 03: 01000331
[    2.352372] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.644912] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff88040931e000
[    2.645016] fbcon: nouveaufb (fb0) is primary device
[    3.131691] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.131692] nouveau 0000:01:00.0: registered panic notifier
[    3.146749] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[52879.546431] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002974000
[PTE] from GR/GPC1/T1_0 on channel 0x023f741000 [Xorg[1978]]
[52879.546435] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[52879.546445] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 7 [0x023f741000
Xorg[1978]]
[52879.546451] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52879.546456] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52879.546460] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52879.546466] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000009
[52879.546470] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000009

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447020230.00f81.24982
Date: Sun, 8 Nov 2015 22:03:50 +0000
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
   title="NEW - Complete freeze even with NvGrUseFW=1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92863">92863</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Complete freeze even with NvGrUseFW=1
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
          <td>xenith&#64;overtmind.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=119489" name="attach_119489" title="EVGA GTX-660SC vbios.rom">attachment 119489</a> <a href="attachment.cgi?id=119489&amp;action=edit" title="EVGA GTX-660SC vbios.rom">[details]</a></span>
EVGA GTX-660SC vbios.rom

[52879.546431] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002974000
[PTE] from GR/GPC1/T1_0 on channel 0x023f741000 [Xorg[1978]]
[52879.546435] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[52879.546445] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 7 [0x023f741000
Xorg[1978]]
[52879.546451] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52879.546456] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52879.546460] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52879.546466] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000009
[52879.546470] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000009

lcpci:

01:00.0 VGA compatible controller: NVIDIA Corporation GK106 [GeForce GTX 660]
(rev a1)

rpm -qa | grep &quot;mesa-dri\|nouveau\|xorg-x11-serer&quot;:

mesa-dri-drivers-11.0.3-1.20151012.fc23.x86_64
xorg-x11-drv-nouveau-1.0.12-0.3.fc23.x86_64
mesa-dri-drivers-11.0.3-1.20151012.fc23.i686

uname -a:

Linux saturn 4.2.5-300.fc23.x86_64 #1 SMP Tue Oct 27 04:29:56 UTC 2015 x86_64
x86_64 x86_64 GNU/Linux


dmesg | grep nouveau:

[    2.107108] fb: switching to nouveaufb from EFI VGA
[    2.108940] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0e6000a1
[    2.108941] nouveau  [  DEVICE][0000:01:00.0] Chipset: GK106 (NVE6)
[    2.108942] nouveau  [  DEVICE][0000:01:00.0] Family : NVE0
[    2.168853] nouveau  [   VBIOS][0000:01:00.0] using image from PROM
[    2.168939] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    2.168940] nouveau  [   VBIOS][0000:01:00.0] version 80.06.28.00.08
[    2.169185] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    2.169230] nouveau  [     PFB][0000:01:00.0] RAM type: GDDR5
[    2.169230] nouveau  [     PFB][0000:01:00.0] RAM size: 2048 MiB
[    2.169231] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 0 tags
[    2.171190] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 862500uv
[    2.220669] nouveau  [  PTHERM][0000:01:00.0] FAN control: PWM
[    2.220682] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    2.220699] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    2.220743] nouveau  [     CLK][0000:01:00.0] 07: core 324 MHz memory 648
MHz 
[    2.220760] nouveau  [     CLK][0000:01:00.0] 0a: core 324-862 MHz memory
1620 MHz 
[    2.220810] nouveau  [     CLK][0000:01:00.0] 0d: core 549-1280 MHz memory
6008 MHz 
[    2.220870] nouveau  [     CLK][0000:01:00.0] 0f: core 549-1280 MHz memory
6008 MHz 
[    2.220939] nouveau  [     CLK][0000:01:00.0] --: core 324 MHz memory 648
MHz 
[    2.341538] nouveau  [  PGRAPH][0000:01:00.0] using external firmware
[    2.342216] nouveau  [     DRM] VRAM: 2048 MiB
[    2.342218] nouveau  [     DRM] GART: 1048576 MiB
[    2.342223] nouveau  [     DRM] TMDS table version 2.0
[    2.342225] nouveau  [     DRM] DCB version 4.0
[    2.342229] nouveau  [     DRM] DCB outp 00: 02000f00 00000000
[    2.342231] nouveau  [     DRM] DCB outp 01: 01000f02 00020030
[    2.342233] nouveau  [     DRM] DCB outp 03: 02011f62 00020010
[    2.342235] nouveau  [     DRM] DCB outp 04: 04822fb6 0f420010
[    2.342238] nouveau  [     DRM] DCB outp 05: 04022f72 00020010
[    2.342240] nouveau  [     DRM] DCB outp 06: 08033f82 00020030
[    2.342242] nouveau  [     DRM] DCB conn 00: 00001030
[    2.342245] nouveau  [     DRM] DCB conn 01: 00010161
[    2.342247] nouveau  [     DRM] DCB conn 02: 00020246
[    2.342249] nouveau  [     DRM] DCB conn 03: 01000331
[    2.352372] nouveau  [     DRM] MM: using COPY for buffer copies
[    2.644912] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff88040931e000
[    2.645016] fbcon: nouveaufb (fb0) is primary device
[    3.131691] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    3.131692] nouveau 0000:01:00.0: registered panic notifier
[    3.146749] [drm] Initialized nouveau 1.2.2 20120801 for 0000:01:00.0 on
minor 0
[52879.546431] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0002974000
[PTE] from GR/GPC1/T1_0 on channel 0x023f741000 [Xorg[1978]]
[52879.546435] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
7, recovering...
[52879.546445] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 7 [0x023f741000
Xorg[1978]]
[52879.546451] nouveau E[  PGRAPH][0000:01:00.0] GPC0/TPC0/TEX: 0x80000049
[52879.546456] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC0/TEX: 0x80000049
[52879.546460] nouveau E[  PGRAPH][0000:01:00.0] GPC1/TPC1/TEX: 0x80000049
[52879.546466] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC0/TEX: 0x80000009
[52879.546470] nouveau E[  PGRAPH][0000:01:00.0] GPC2/TPC1/TEX: 0x80000009</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447020230.00f81.24982--

--===============2064881038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2064881038==--

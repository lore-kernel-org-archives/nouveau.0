From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88415] New: [NVA8] nouveau GPU lockup when reclocking
Date: Wed, 14 Jan 2015 18:06:35 +0000
Message-ID: <bug-88415-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1606435835=="
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


--===============1606435835==
Content-Type: multipart/alternative; boundary="1421258795.8F44Bb41.26201"; charset="UTF-8"


--1421258795.8F44Bb41.26201
Date: Wed, 14 Jan 2015 18:06:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88415

            Bug ID: 88415
           Summary: [NVA8] nouveau GPU lockup when reclocking
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: benedikt.morbach-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 112240
  --> https://bugs.freedesktop.org/attachment.cgi?id=112240&action=edit
full dmesg

kernel: 3.19-rc4
hardware: Thinkpad T510, Quadro NVS 3100M
full dmesg attached, nouveau parts below

What I did:
 1. downclocking before starting X
    -> '[0000:01:00.0] invalid/missing rammap entry' in dmesg

 2. start X
    -> working fine (could run glxgears, didn't try much else)

 3. returning to default performance level
    -> fine

 4. downclocking again
    -> lockup, broke it with sysrq and saved dmesg

Any other logs I should produce?
Do you want a more verbose dmesg?

dmesg | grep nouveau:
[   24.080412] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8600a2
[   24.080417] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
[   24.080420] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[   24.112811] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   24.113012] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   24.113016] nouveau  [   VBIOS][0000:01:00.0] version 70.18.45.00.09
[   24.114500] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   24.114546] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[   24.114549] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[   24.114551] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
[   24.117885] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 850000uv
[   24.147955] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   24.147972] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   24.147978] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   24.168063] nouveau  [     CLK][0000:01:00.0] 03: core 135 MHz shader 270
MHz memory 135 MHz
[   24.168070] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz shader 810
MHz memory 405 MHz
[   24.168074] nouveau  [     CLK][0000:01:00.0] 0f: core 606 MHz shader 1468
MHz memory 790 MHz
[   24.168117] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[   24.168493] nouveau  [     DRM] VRAM: 512 MiB
[   24.168495] nouveau  [     DRM] GART: 1048576 MiB
[   24.168499] nouveau  [     DRM] TMDS table version 2.0
[   24.168501] nouveau  [     DRM] DCB version 4.0
[   24.168504] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[   24.168506] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[   24.168508] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[   24.168510] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[   24.168511] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[   24.168513] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[   24.168515] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[   24.168517] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[   24.168519] nouveau  [     DRM] DCB conn 00: 00000040
[   24.168521] nouveau  [     DRM] DCB conn 01: 00000100
[   24.168523] nouveau  [     DRM] DCB conn 02: 00101246
[   24.168524] nouveau  [     DRM] DCB conn 03: 00202346
[   24.168526] nouveau  [     DRM] DCB conn 04: 00410446
[   24.236201] nouveau  [     DRM] MM: using COPY for buffer copies
[   25.443491] nouveau  [     DRM] allocated 1600x900 fb: 0x70000, bo
ffff8800b8decc00
[   25.443614] fbcon: nouveaufb (fb0) is primary device
[   25.763829] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   25.763831] nouveau 0000:01:00.0: registered panic notifier
[   25.766694] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[  107.585436] nouveau E[     PFB][0000:01:00.0] invalid/missing rammap entry
[  612.287829] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  626.123229] nouveau E[  X[907]] failed to idle channel 0xcccc0000 [X[907]]
[  641.123107] nouveau E[  X[907]] failed to idle channel 0xcccc0000 [X[907]]
[  643.129470] nouveau E[   PFIFO][0000:01:00.0] channel 6 [X[907]] unload
timeout

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421258795.8F44Bb41.26201
Date: Wed, 14 Jan 2015 18:06:35 +0000
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
   title="NEW - [NVA8] nouveau GPU lockup when reclocking"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88415">88415</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVA8] nouveau GPU lockup when reclocking
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
          <td>benedikt.morbach&#64;googlemail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=112240" name="attach_112240" title="full dmesg">attachment 112240</a> <a href="attachment.cgi?id=112240&amp;action=edit" title="full dmesg">[details]</a></span>
full dmesg

kernel: 3.19-rc4
hardware: Thinkpad T510, Quadro NVS 3100M
full dmesg attached, nouveau parts below

What I did:
 1. downclocking before starting X
    -&gt; '[0000:01:00.0] invalid/missing rammap entry' in dmesg

 2. start X
    -&gt; working fine (could run glxgears, didn't try much else)

 3. returning to default performance level
    -&gt; fine

 4. downclocking again
    -&gt; lockup, broke it with sysrq and saved dmesg

Any other logs I should produce?
Do you want a more verbose dmesg?

dmesg | grep nouveau:
[   24.080412] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x0a8600a2
[   24.080417] nouveau  [  DEVICE][0000:01:00.0] Chipset: GT218 (NVA8)
[   24.080420] nouveau  [  DEVICE][0000:01:00.0] Family : NV50
[   24.112811] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[   24.113012] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[   24.113016] nouveau  [   VBIOS][0000:01:00.0] version 70.18.45.00.09
[   24.114500] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[   24.114546] nouveau  [     PFB][0000:01:00.0] RAM type: DDR3
[   24.114549] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[   24.114551] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 960 tags
[   24.117885] nouveau  [    VOLT][0000:01:00.0] GPU voltage: 850000uv
[   24.147955] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[   24.147972] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[   24.147978] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[   24.168063] nouveau  [     CLK][0000:01:00.0] 03: core 135 MHz shader 270
MHz memory 135 MHz
[   24.168070] nouveau  [     CLK][0000:01:00.0] 07: core 405 MHz shader 810
MHz memory 405 MHz
[   24.168074] nouveau  [     CLK][0000:01:00.0] 0f: core 606 MHz shader 1468
MHz memory 790 MHz
[   24.168117] nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810
MHz memory 405 MHz
[   24.168493] nouveau  [     DRM] VRAM: 512 MiB
[   24.168495] nouveau  [     DRM] GART: 1048576 MiB
[   24.168499] nouveau  [     DRM] TMDS table version 2.0
[   24.168501] nouveau  [     DRM] DCB version 4.0
[   24.168504] nouveau  [     DRM] DCB outp 00: 01800323 00010034
[   24.168506] nouveau  [     DRM] DCB outp 01: 02811300 00000000
[   24.168508] nouveau  [     DRM] DCB outp 02: 028223a6 0f220010
[   24.168510] nouveau  [     DRM] DCB outp 03: 02822362 00020010
[   24.168511] nouveau  [     DRM] DCB outp 04: 048333b6 0f220010
[   24.168513] nouveau  [     DRM] DCB outp 05: 04833372 00020010
[   24.168515] nouveau  [     DRM] DCB outp 06: 088443c6 0f220010
[   24.168517] nouveau  [     DRM] DCB outp 07: 08844382 00020010
[   24.168519] nouveau  [     DRM] DCB conn 00: 00000040
[   24.168521] nouveau  [     DRM] DCB conn 01: 00000100
[   24.168523] nouveau  [     DRM] DCB conn 02: 00101246
[   24.168524] nouveau  [     DRM] DCB conn 03: 00202346
[   24.168526] nouveau  [     DRM] DCB conn 04: 00410446
[   24.236201] nouveau  [     DRM] MM: using COPY for buffer copies
[   25.443491] nouveau  [     DRM] allocated 1600x900 fb: 0x70000, bo
ffff8800b8decc00
[   25.443614] fbcon: nouveaufb (fb0) is primary device
[   25.763829] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   25.763831] nouveau 0000:01:00.0: registered panic notifier
[   25.766694] [drm] Initialized nouveau 1.2.1 20120801 for 0000:01:00.0 on
minor 0
[  107.585436] nouveau E[     PFB][0000:01:00.0] invalid/missing rammap entry
[  612.287829] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  626.123229] nouveau E[  X[907]] failed to idle channel 0xcccc0000 [X[907]]
[  641.123107] nouveau E[  X[907]] failed to idle channel 0xcccc0000 [X[907]]
[  643.129470] nouveau E[   PFIFO][0000:01:00.0] channel 6 [X[907]] unload
timeout</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421258795.8F44Bb41.26201--

--===============1606435835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1606435835==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87942] New: [NVE7] Unable to use nouveau
Date: Thu, 01 Jan 2015 18:20:43 +0000
Message-ID: <bug-87942-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0809430005=="
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


--===============0809430005==
Content-Type: multipart/alternative; boundary="1420136443.317d41.27785"; charset="UTF-8"


--1420136443.317d41.27785
Date: Thu, 1 Jan 2015 18:20:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87942

            Bug ID: 87942
           Summary: [NVE7] Unable to use nouveau
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno.pagani-vYW+cPY1g1pg9hUCZPvPmw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Whenever I try to modprobe nouveau, I face this:

[  449.052494] MXM: GUID detected in BIOS
[  449.052560] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140724/nsarguments-95)
[  449.052599] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140724/nsarguments-95)
[  449.052683] pci 0000:02:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  449.052684] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  449.052715] nouveau 0000:02:00.0: enabling device (0006 -> 0007)
[  449.053208] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0e7240a2
[  449.053211] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK107 (NVE7)
[  449.053212] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[  449.053228] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image.=
..
[  449.053235] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  449.053236] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  449.053291] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  449.053292] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  452.219933] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  452.219937] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[  452.220062] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[  452.220064] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.10
[  452.220328] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[  452.220336] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  452.377876] nouveau 0000:02:00.0: irq 38 for MSI/MSI-X
[  452.377885] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[  452.377933] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[  452.377934] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[  452.377935] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  452.380181] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[  452.409895] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / extern=
al
[  452.409901] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[  452.409912] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[  452.409942] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz=20
[  452.410000] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memo=
ry
1600 MHz=20
[  452.410076] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memo=
ry
5000 MHz=20
[  452.410213] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz=20
[  452.450870] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 F=
AULT
at 0x4188ac [ IBUS ]
[  452.450919] vga_switcheroo: enabled
[  452.451052] [TTM] Zone  kernel: Available graphics memory: 8169116 kiB
[  452.451054] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  452.451055] [TTM] Initializing pool allocator
[  452.451061] [TTM] Initializing DMA pool allocator
[  452.451073] nouveau  [     DRM] VRAM: 2048 MiB
[  452.451075] nouveau  [     DRM] GART: 1048576 MiB
[  452.451079] nouveau E[     DRM] Pointer to TMDS table invalid
[  452.451082] nouveau  [     DRM] DCB version 4.0
[  452.451084] nouveau E[     DRM] Pointer to flat panel table invalid
[  452.458570] nouveau  [     DRM] MM: using COPY for buffer copies
[  452.458580] [drm] Initialized nouveau 1.2.0 20120801 for 0000:02:00.0 on
minor 1

Then, I=E2=80=99m unable to use the card (through Bumblebee or DRI_PRIME, t=
his is an
Optimus system).

I=E2=80=99m running ArchLinux, with the following package versions:

linux 3.17.6
mesa 10.4.1
xf86-video-nouveau 1.0.11

Please tell me if I can do anything helping you to fix this bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1420136443.317d41.27785
Date: Thu, 1 Jan 2015 18:20:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] Unable to use nouveau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87942">87942</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE7] Unable to use nouveau
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
          <td>major
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
          <td>bruno.pagani&#64;ens-lyon.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Whenever I try to modprobe nouveau, I face this:

[  449.052494] MXM: GUID detected in BIOS
[  449.052560] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140724/nsarguments-95)
[  449.052599] ACPI Warning: \_SB_.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20140724/nsarguments-95)
[  449.052683] pci 0000:02:00.0: optimus capabilities: enabled, status dyna=
mic
power, hda bios codec supported
[  449.052684] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[  449.052715] nouveau 0000:02:00.0: enabling device (0006 -&gt; 0007)
[  449.053208] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0e7240a2
[  449.053211] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK107 (NVE7)
[  449.053212] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[  449.053228] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image.=
..
[  449.053235] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  449.053236] nouveau  [   VBIOS][0000:02:00.0] checking PROM for image...
[  449.053291] nouveau  [   VBIOS][0000:02:00.0] ... signature not found
[  449.053292] nouveau  [   VBIOS][0000:02:00.0] checking ACPI for image...
[  452.219933] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[  452.219937] nouveau  [   VBIOS][0000:02:00.0] using image from ACPI
[  452.220062] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[  452.220064] nouveau  [   VBIOS][0000:02:00.0] version 80.07.b3.00.10
[  452.220328] nouveau  [ DEVINIT][0000:02:00.0] adaptor not initialised
[  452.220336] nouveau  [   VBIOS][0000:02:00.0] running init tables
[  452.377876] nouveau 0000:02:00.0: irq 38 for MSI/MSI-X
[  452.377885] nouveau  [     PMC][0000:02:00.0] MSI interrupts enabled
[  452.377933] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[  452.377934] nouveau  [     PFB][0000:02:00.0] RAM size: 2048 MiB
[  452.377935] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[  452.380181] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 600000uv
[  452.409895] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / extern=
al
[  452.409901] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[  452.409912] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[  452.409942] nouveau  [     CLK][0000:02:00.0] 07: core 405 MHz memory 810
MHz=20
[  452.410000] nouveau  [     CLK][0000:02:00.0] 0a: core 405-1058 MHz memo=
ry
1600 MHz=20
[  452.410076] nouveau  [     CLK][0000:02:00.0] 0f: core 405-1058 MHz memo=
ry
5000 MHz=20
[  452.410213] nouveau  [     CLK][0000:02:00.0] --: core 405 MHz memory 810
MHz=20
[  452.450870] nouveau E[    PBUS][0000:02:00.0] MMIO write of 0x00000002 F=
AULT
at 0x4188ac [ IBUS ]
[  452.450919] vga_switcheroo: enabled
[  452.451052] [TTM] Zone  kernel: Available graphics memory: 8169116 kiB
[  452.451054] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[  452.451055] [TTM] Initializing pool allocator
[  452.451061] [TTM] Initializing DMA pool allocator
[  452.451073] nouveau  [     DRM] VRAM: 2048 MiB
[  452.451075] nouveau  [     DRM] GART: 1048576 MiB
[  452.451079] nouveau E[     DRM] Pointer to TMDS table invalid
[  452.451082] nouveau  [     DRM] DCB version 4.0
[  452.451084] nouveau E[     DRM] Pointer to flat panel table invalid
[  452.458570] nouveau  [     DRM] MM: using COPY for buffer copies
[  452.458580] [drm] Initialized nouveau 1.2.0 20120801 for 0000:02:00.0 on
minor 1

Then, I=E2=80=99m unable to use the card (through Bumblebee or DRI_PRIME, t=
his is an
Optimus system).

I=E2=80=99m running ArchLinux, with the following package versions:

linux 3.17.6
mesa 10.4.1
xf86-video-nouveau 1.0.11

Please tell me if I can do anything helping you to fix this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420136443.317d41.27785--

--===============0809430005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0809430005==--

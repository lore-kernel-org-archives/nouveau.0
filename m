From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105916] New: "xset dpms force off" can't be undone
 on hp omen 17-an0xx laptop
Date: Thu, 05 Apr 2018 22:51:00 +0000
Message-ID: <bug-105916-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0499733643=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0499733643==
Content-Type: multipart/alternative; boundary="15229686600.dAf5.1345"
Content-Transfer-Encoding: 7bit


--15229686600.dAf5.1345
Date: Thu, 5 Apr 2018 22:51:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105916

            Bug ID: 105916
           Summary: "xset dpms force off" can't be undone on hp omen
                    17-an0xx laptop
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bero-Qev7zP1q8vftRgLqZ5aouw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

After turning the display off with "xset dpms force off", "xset dpms force
suspend" or "xset dpms force standby", the display can't be turned back on
(short of turning the entire laptop off and back on), even "xset dpms force=
 on"
has no effect.

lspci reports this about the GPU:
01:00.0 0300: 10de:1be1 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 103c:8393
        Flags: bus master, fast devsel, latency 0, IRQ 132
        Memory at db000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at dc000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

related dmesg bits after normal startup:
[Fri Apr  6 00:34:36 2018] fb: switching to nouveaufb from EFI VGA
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: bios: version 86.04.67.00.=
17
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: BIT table 'A' not fou=
nd
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: BIT table 'L' not fou=
nd
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB version 4.1
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 00: 02803f76
04400020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 01: 02012f62
00020010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 02: 04824f86
04400010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 03: 04824f82
00020010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 04: 04835f96
04400020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 05: 04835f92
00020020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 03: 00020347
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: MM: using COPY for bu=
ffer
copies
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: DRM: allocated 3840x2160 f=
b:
0x200000, bo 0000000055fe5b7c
[Fri Apr  6 00:34:37 2018] fbcon: nouveaufb (fb0) is primary device
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
[Fri Apr  6 00:34:37 2018] [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

Kernel 4.16.0, Mesa 18.0.0, libdrm 2.4.90, xorg-server 1.19.6, using
modesetting DDX from xorg-server 1.19.6

dmesg after (successful but irreversible) "xset dpms force off":
[Fri Apr  6 00:49:48 2018] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07

dmesg after (unsuccessful) "xset dpms force on" issued over ssh:
[Fri Apr  6 00:50:15 2018] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15229686600.dAf5.1345
Date: Thu, 5 Apr 2018 22:51:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - &quot;xset dpms force off&quot; can't be undone on hp ome=
n 17-an0xx laptop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105916">105916</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>&quot;xset dpms force off&quot; can't be undone on hp omen 17=
-an0xx laptop
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>bero&#64;lindev.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After turning the display off with &quot;xset dpms force off&q=
uot;, &quot;xset dpms force
suspend&quot; or &quot;xset dpms force standby&quot;, the display can't be =
turned back on
(short of turning the entire laptop off and back on), even &quot;xset dpms =
force on&quot;
has no effect.

lspci reports this about the GPU:
01:00.0 0300: 10de:1be1 (rev a1) (prog-if 00 [VGA controller])
        Subsystem: 103c:8393
        Flags: bus master, fast devsel, latency 0, IRQ 132
        Memory at db000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at dc000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

related dmesg bits after normal startup:
[Fri Apr  6 00:34:36 2018] fb: switching to nouveaufb from EFI VGA
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: bios: version 86.04.67.00.=
17
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: fb: 8192 MiB GDDR5
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: BIT table 'A' not fou=
nd
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: BIT table 'L' not fou=
nd
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB version 4.1
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 00: 02803f76
04400020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 01: 02012f62
00020010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 02: 04824f86
04400010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 03: 04824f82
00020010
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 04: 04835f96
04400020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB outp 05: 04835f92
00020020
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010261
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 03: 00020347
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[Fri Apr  6 00:34:36 2018] nouveau 0000:01:00.0: DRM: MM: using COPY for bu=
ffer
copies
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: DRM: allocated 3840x2160 f=
b:
0x200000, bo 0000000055fe5b7c
[Fri Apr  6 00:34:37 2018] fbcon: nouveaufb (fb0) is primary device
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07
[Fri Apr  6 00:34:37 2018] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
[Fri Apr  6 00:34:37 2018] [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

Kernel 4.16.0, Mesa 18.0.0, libdrm 2.4.90, xorg-server 1.19.6, using
modesetting DDX from xorg-server 1.19.6

dmesg after (successful but irreversible) &quot;xset dpms force off&quot;:
[Fri Apr  6 00:49:48 2018] nouveau 0000:01:00.0: disp: 0x0000643b[0]:
INIT_GENERIC_CONDITON: unknown 0x07

dmesg after (unsuccessful) &quot;xset dpms force on&quot; issued over ssh:
[Fri Apr  6 00:50:15 2018] nouveau 0000:01:00.0: disp: 0x00005fcc[2]:
INIT_GENERIC_CONDITON: unknown 0x07</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15229686600.dAf5.1345--

--===============0499733643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0499733643==--

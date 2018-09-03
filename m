From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107817] New: NV50 : Nvidia NVS295 - Printing out
 EDID errors about not connected monitor ports
Date: Mon, 03 Sep 2018 16:12:43 +0000
Message-ID: <bug-107817-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0501261572=="
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


--===============0501261572==
Content-Type: multipart/alternative; boundary="15359911631.3CFac3F.9653"
Content-Transfer-Encoding: 7bit


--15359911631.3CFac3F.9653
Date: Mon, 3 Sep 2018 16:12:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107817

            Bug ID: 107817
           Summary: NV50 : Nvidia NVS295 - Printing out EDID errors about
                    not connected monitor ports
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: cezdhzez-GK+4nHxFadIswetKESUqMA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Card: Nvidia NVS295 with 2 DisplayPort connectors.

Problem: nouveau is spamming the kernel message, that it cant find the EDID=
 of
not connected ports. Of course it cant, because there is no monitor connect=
ed
to that port.

When i connect the monitor to DisplayPort number 1, it writes, that it cant
find EDID on DisplayPort number 2. When i connect it to DisplayPort 2, it
writes that it cant find EDID of Display Port 1.

Linux kernel version: Kernel 4.19RC2 (its also there on older kernels)

Output when connected to DisplayPort 2 on kernel 4.19RC2 :

[    1.929715] fb: switching to nouveaufb from EFI VGA
[    1.930182] nouveau 0000:01:00.0: NVIDIA G98 (298e80a2)
[    2.064262] nouveau 0000:01:00.0: bios: version 62.98.75.00.08
[    2.086423] nouveau 0000:01:00.0: fb: 256 MiB GDDR3
[    2.155387] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    2.155388] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.155393] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.155394] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.155397] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000386 0f200010
[    2.155399] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000332 00020010
[    2.155401] nouveau 0000:01:00.0: DRM: DCB outp 02: 040113a6 0f200010
[    2.155402] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011342 00020010
[    2.155404] nouveau 0000:01:00.0: DRM: DCB conn 00: 00005046
[    2.155405] nouveau 0000:01:00.0: DRM: DCB conn 01: 0000a146
[    2.164991] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    2.291693] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.299041] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x50000, =
bo
(____ptrval____)
[    2.299785] fbcon: nouveaufb (fb0) is primary device
[    2.423693] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.607694] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.616508] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.631694] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[    3.283698] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   38.267703] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   38.403699] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   50.075703] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   50.207697] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   53.323704] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   53.455714] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15359911631.3CFac3F.9653
Date: Mon, 3 Sep 2018 16:12:43 +0000
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
   title=3D"NEW - NV50 : Nvidia NVS295 - Printing out EDID errors about not=
 connected monitor ports"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107817">107817</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>NV50 : Nvidia NVS295 - Printing out EDID errors about not con=
nected monitor ports
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
          <td>minor
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
          <td>cezdhzez&#64;sharklasers.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Card: Nvidia NVS295 with 2 DisplayPort connectors.

Problem: nouveau is spamming the kernel message, that it cant find the EDID=
 of
not connected ports. Of course it cant, because there is no monitor connect=
ed
to that port.

When i connect the monitor to DisplayPort number 1, it writes, that it cant
find EDID on DisplayPort number 2. When i connect it to DisplayPort 2, it
writes that it cant find EDID of Display Port 1.

Linux kernel version: Kernel 4.19RC2 (its also there on older kernels)

Output when connected to DisplayPort 2 on kernel 4.19RC2 :

[    1.929715] fb: switching to nouveaufb from EFI VGA
[    1.930182] nouveau 0000:01:00.0: NVIDIA G98 (298e80a2)
[    2.064262] nouveau 0000:01:00.0: bios: version 62.98.75.00.08
[    2.086423] nouveau 0000:01:00.0: fb: 256 MiB GDDR3
[    2.155387] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    2.155388] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.155393] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.155394] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.155397] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000386 0f200010
[    2.155399] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000332 00020010
[    2.155401] nouveau 0000:01:00.0: DRM: DCB outp 02: 040113a6 0f200010
[    2.155402] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011342 00020010
[    2.155404] nouveau 0000:01:00.0: DRM: DCB conn 00: 00005046
[    2.155405] nouveau 0000:01:00.0: DRM: DCB conn 01: 0000a146
[    2.164991] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    2.291693] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.299041] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x50000, =
bo
(____ptrval____)
[    2.299785] fbcon: nouveaufb (fb0) is primary device
[    2.423693] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.607694] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.616508] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.631694] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[    3.283698] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   38.267703] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   38.403699] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   50.075703] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   50.207697] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   53.323704] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   53.455714] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15359911631.3CFac3F.9653--

--===============0501261572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0501261572==--

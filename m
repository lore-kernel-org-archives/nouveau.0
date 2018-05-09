From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106454] New: Xorg crashes with nouveau on lenovo y50
 (nvidia GTX 860M) (freezes with proprietary drivers)
Date: Wed, 09 May 2018 10:11:52 +0000
Message-ID: <bug-106454-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0560860485=="
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


--===============0560860485==
Content-Type: multipart/alternative; boundary="15258607121.cF2a1917.32504"
Content-Transfer-Encoding: 7bit


--15258607121.cF2a1917.32504
Date: Wed, 9 May 2018 10:11:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106454

            Bug ID: 106454
           Summary: Xorg crashes with nouveau on lenovo y50 (nvidia GTX
                    860M) (freezes with proprietary drivers)
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: abinavpp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139443
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139443&action=3Dedit
Xorg log file

I have attached the log file which traces the segmentation fault.

$ dmesg | grep nouv
[   12.036804] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[   12.038563] nouveau 0000:01:00.0: NVIDIA GM107 (117120a2)
[   12.072130] nouveau 0000:01:00.0: bios: version 82.07.34.00.08
[   12.178128] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   12.178143] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[   12.179573] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   12.233709] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[   12.233710] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   12.233721] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   12.233722] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   12.360797] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.360804] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

$ sudo lspci -v | grep -A19 3D
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 860M] (rev a2)
        Subsystem: Lenovo GM107M [GeForce GTX 860M]
        Flags: bus master, fast devsel, latency 0, IRQ 32
        Memory at d0000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 4000 [size=3D128]
        Expansion ROM at b2000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15258607121.cF2a1917.32504
Date: Wed, 9 May 2018 10:11:52 +0000
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
   title=3D"NEW - Xorg crashes with nouveau on lenovo y50 (nvidia GTX 860M)=
 (freezes with proprietary drivers)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106454">106454</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Xorg crashes with nouveau on lenovo y50 (nvidia GTX 860M) (fr=
eezes with proprietary drivers)
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
          <td>abinavpp&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139443=
" name=3D"attach_139443" title=3D"Xorg log file">attachment 139443</a> <a h=
ref=3D"attachment.cgi?id=3D139443&amp;action=3Dedit" title=3D"Xorg log file=
">[details]</a></span>
Xorg log file

I have attached the log file which traces the segmentation fault.

$ dmesg | grep nouv
[   12.036804] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[   12.038563] nouveau 0000:01:00.0: NVIDIA GM107 (117120a2)
[   12.072130] nouveau 0000:01:00.0: bios: version 82.07.34.00.08
[   12.178128] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   12.178143] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[   12.179573] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   12.233709] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[   12.233710] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   12.233721] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[   12.233722] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   12.360797] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.360804] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1

$ sudo lspci -v | grep -A19 3D
01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 860M] (rev a2)
        Subsystem: Lenovo GM107M [GeForce GTX 860M]
        Flags: bus master, fast devsel, latency 0, IRQ 32
        Memory at d0000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at a0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at b0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at 4000 [size=3D128]
        Expansion ROM at b2000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15258607121.cF2a1917.32504--

--===============0560860485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0560860485==--

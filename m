From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104835] New: MMIO read of 00000000 FAULT at 10ac08 [
 IBUS ]
Date: Mon, 29 Jan 2018 13:10:43 +0000
Message-ID: <bug-104835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0350380454=="
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


--===============0350380454==
Content-Type: multipart/alternative; boundary="15172314420.38EAAA1bb.8919"
Content-Transfer-Encoding: 7bit


--15172314420.38EAAA1bb.8919
Date: Mon, 29 Jan 2018 13:10:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

            Bug ID: 104835
           Summary: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Same setup as in https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

Relevant part of dmesg:
```
[   10.667586] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[   10.667788] nouveau 0000:01:00.0: NVIDIA GM107 (117310a2)
[   10.695951] nouveau 0000:01:00.0: bios: version 82.07.a9.00.0c
[   10.849391] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   10.849404] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[   10.851426] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   11.937159] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[   11.937160] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   11.937163] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   11.937164] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   11.937165] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811fa6 04420010
[   11.937167] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011f62 04420010
[   11.937168] nouveau 0000:01:00.0: DRM: DCB outp 03: 08822fc6 04420010
[   11.937169] nouveau 0000:01:00.0: DRM: DCB outp 04: 08022f82 04420010
[   11.937170] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   11.937171] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[   12.126552] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.233419] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15172314420.38EAAA1bb.8919
Date: Mon, 29 Jan 2018 13:10:42 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835">104835</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
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
          <td>bruno.n.pagani&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Same setup as in <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D100423">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100423</a>

Relevant part of dmesg:
```
[   10.667586] nouveau 0000:01:00.0: enabling device (0006 -&gt; 0007)
[   10.667788] nouveau 0000:01:00.0: NVIDIA GM107 (117310a2)
[   10.695951] nouveau 0000:01:00.0: bios: version 82.07.a9.00.0c
[   10.849391] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[   10.849404] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[   10.851426] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[   11.937159] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[   11.937160] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   11.937163] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   11.937164] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   11.937165] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811fa6 04420010
[   11.937167] nouveau 0000:01:00.0: DRM: DCB outp 02: 02011f62 04420010
[   11.937168] nouveau 0000:01:00.0: DRM: DCB outp 03: 08822fc6 04420010
[   11.937169] nouveau 0000:01:00.0: DRM: DCB outp 04: 08022f82 04420010
[   11.937170] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   11.937171] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[   12.126552] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.233419] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15172314420.38EAAA1bb.8919--

--===============0350380454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0350380454==--

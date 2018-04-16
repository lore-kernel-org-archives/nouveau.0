From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106077] New: gr: TRAP DISPATCH_QUERY
Date: Mon, 16 Apr 2018 15:11:27 +0000
Message-ID: <bug-106077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0756254269=="
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


--===============0756254269==
Content-Type: multipart/alternative; boundary="15238914872.E396.15969"
Content-Transfer-Encoding: 7bit


--15238914872.E396.15969
Date: Mon, 16 Apr 2018 15:11:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106077

            Bug ID: 106077
           Summary: gr: TRAP DISPATCH_QUERY
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pmenzel+bugs.freedesktop-KUpvgZVWgV9o1qOY/usvUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

With Linux 4.14.30, X.Org X Server 1.19.3, Nouveau 1.0.15 running XFCE 4.12=
 the
messages below are shown.

```
[=E2=80=A6]
[   55.882828] nouveau 0000:01:00.0: NVIDIA GT216 (0a5c00a2)
[   56.007447] nouveau 0000:01:00.0: bios: version 70.16.72.00.04
[   56.008001] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[   56.057440] [TTM] Zone  kernel: Available graphics memory: 3928698 kiB
[   56.057441] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   56.057441] [TTM] Initializing pool allocator
[   56.057444] [TTM] Initializing DMA pool allocator
[   56.057456] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[   56.057457] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   56.057459] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   56.057460] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   56.057461] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000380 00000000
[   56.057463] nouveau 0000:01:00.0: DRM: DCB outp 01: 08000382 00020030
[   56.057464] nouveau 0000:01:00.0: DRM: DCB outp 02: 028213a6 0f220010
[   56.057465] nouveau 0000:01:00.0: DRM: DCB outp 03: 02021362 00020010
[   56.057466] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002030
[   56.057467] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[   56.096865] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   56.096865] [drm] Driver supports precise vblank timestamp query.
[   56.147522] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   56.198649] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x70000, =
bo
ffff8801f51d3800
[   56.200002] fbcon: nouveaufb (fb0) is primary device
[   56.362317] Console: switching to colour frame buffer device 240x75
[   56.378972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   56.389927] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[=E2=80=A6]
[24345.413226] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[24345.413228] nouveau 0000:01:00.0: gr: no stuck command?
[24345.413241] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on cha=
nnel
7 [1f7c3000 timetunnel[10223]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[=E2=80=A6]
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15238914872.E396.15969
Date: Mon, 16 Apr 2018 15:11:27 +0000
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
   title=3D"NEW - gr: TRAP DISPATCH_QUERY"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106077">106077</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>gr: TRAP DISPATCH_QUERY
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>pmenzel+bugs.freedesktop&#64;molgen.mpg.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>With Linux 4.14.30, X.Org X Server 1.19.3, Nouveau 1.0.15 runn=
ing XFCE 4.12 the
messages below are shown.

```
[=E2=80=A6]
[   55.882828] nouveau 0000:01:00.0: NVIDIA GT216 (0a5c00a2)
[   56.007447] nouveau 0000:01:00.0: bios: version 70.16.72.00.04
[   56.008001] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[   56.057440] [TTM] Zone  kernel: Available graphics memory: 3928698 kiB
[   56.057441] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   56.057441] [TTM] Initializing pool allocator
[   56.057444] [TTM] Initializing DMA pool allocator
[   56.057456] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[   56.057457] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   56.057459] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   56.057460] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   56.057461] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000380 00000000
[   56.057463] nouveau 0000:01:00.0: DRM: DCB outp 01: 08000382 00020030
[   56.057464] nouveau 0000:01:00.0: DRM: DCB outp 02: 028213a6 0f220010
[   56.057465] nouveau 0000:01:00.0: DRM: DCB outp 03: 02021362 00020010
[   56.057466] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002030
[   56.057467] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[   56.096865] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   56.096865] [drm] Driver supports precise vblank timestamp query.
[   56.147522] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   56.198649] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x70000, =
bo
ffff8801f51d3800
[   56.200002] fbcon: nouveaufb (fb0) is primary device
[   56.362317] Console: switching to colour frame buffer device 240x75
[   56.378972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   56.389927] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[=E2=80=A6]
[24345.413226] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[24345.413228] nouveau 0000:01:00.0: gr: no stuck command?
[24345.413241] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on cha=
nnel
7 [1f7c3000 timetunnel[10223]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[=E2=80=A6]
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

--15238914872.E396.15969--

--===============0756254269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0756254269==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108980] GF117: MMIO write of 0000001f FAULT at
 6013d4 [ IBUS ]
Date: Sun, 21 Apr 2019 06:00:28 +0000
Message-ID: <bug-108980-8800-WG8PfL8urU@http.bugs.freedesktop.org/>
References: <bug-108980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1382828200=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1382828200==
Content-Type: multipart/alternative; boundary="15558264283.BE8CcA8D.25921"
Content-Transfer-Encoding: 7bit


--15558264283.BE8CcA8D.25921
Date: Sun, 21 Apr 2019 06:00:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108980

--- Comment #16 from Johnny B. Goode <adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org> ---
Kernel 5 generates more faults then earlier version.

# uname -a
Linux 5.0.9-gentoo #1 SMP Sun Apr 21 04:31:13 CEST 2019 x86_64 Intel(R)
Core(TM) i3-4030U CPU @ 1.90GHz GenuineIntel GNU/Linux

# journalctl -b -1 --no-hostname -o short-monotonic | grep nouveau
[    5.629856] kernel: nouveau: detected PR support, will not use DSM
[    5.629893] kernel: nouveau 0000:08:00.0: enabling device (0006 -> 0007)
[    5.630103] kernel: nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[    5.785996] kernel: nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[    5.870928] kernel: nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[    6.527871] kernel: nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[    6.527873] kernel: nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[    6.527876] kernel: nouveau 0000:08:00.0: DRM: Pointer to TMDS table inv=
alid
[    6.527878] kernel: nouveau 0000:08:00.0: DRM: DCB version 4.0
[    6.529675] kernel: nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer
copies
[    6.529850] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:08:00.0 on minor 1
[    7.681975] kernel: nouveau 0000:08:00.0: bus: MMIO write of 0000001f FA=
ULT
at 6013d4 [ IBUS ]
[    7.682002] kernel: nouveau 0000:08:00.0: bus: MMIO write of badf1001 FA=
ULT
at 50405c [ IBUS ]
[   36.995439] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[   47.395823] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  186.745334] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  186.745358] kernel: nouveau 0000:08:00.0: bus: MMIO write of badf1001 FA=
ULT
at 50405c [ IBUS ]
[  308.263103] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  325.400452] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  345.742702] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  360.574654] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  374.383876] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  523.869265] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  554.220856] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  655.092116] kernel: nouveau 0000:08:00.0: bus: MMIO write of 0000001f FA=
ULT
at 6013d4 [ IBUS ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15558264283.BE8CcA8D.25921
Date: Sun, 21 Apr 2019 06:00:28 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108980">bug 10898=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adamos&#64;hell.factory.net.pl" title=3D"Johnny B. Goode &lt;adamos&#64;hel=
l.factory.net.pl&gt;"> <span class=3D"fn">Johnny B. Goode</span></a>
</span></b>
        <pre>Kernel 5 generates more faults then earlier version.

# uname -a
Linux 5.0.9-gentoo #1 SMP Sun Apr 21 04:31:13 CEST 2019 x86_64 Intel(R)
Core(TM) i3-4030U CPU &#64; 1.90GHz GenuineIntel GNU/Linux

# journalctl -b -1 --no-hostname -o short-monotonic | grep nouveau
[    5.629856] kernel: nouveau: detected PR support, will not use DSM
[    5.629893] kernel: nouveau 0000:08:00.0: enabling device (0006 -&gt; 00=
07)
[    5.630103] kernel: nouveau 0000:08:00.0: NVIDIA GF117 (0d7000a2)
[    5.785996] kernel: nouveau 0000:08:00.0: bios: version 75.17.86.00.04
[    5.870928] kernel: nouveau 0000:08:00.0: fb: 2048 MiB DDR3
[    6.527871] kernel: nouveau 0000:08:00.0: DRM: VRAM: 2048 MiB
[    6.527873] kernel: nouveau 0000:08:00.0: DRM: GART: 1048576 MiB
[    6.527876] kernel: nouveau 0000:08:00.0: DRM: Pointer to TMDS table inv=
alid
[    6.527878] kernel: nouveau 0000:08:00.0: DRM: DCB version 4.0
[    6.529675] kernel: nouveau 0000:08:00.0: DRM: MM: using COPY0 for buffer
copies
[    6.529850] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:08:00.0 on minor 1
[    7.681975] kernel: nouveau 0000:08:00.0: bus: MMIO write of 0000001f FA=
ULT
at 6013d4 [ IBUS ]
[    7.682002] kernel: nouveau 0000:08:00.0: bus: MMIO write of badf1001 FA=
ULT
at 50405c [ IBUS ]
[   36.995439] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[   47.395823] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  186.745334] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  186.745358] kernel: nouveau 0000:08:00.0: bus: MMIO write of badf1001 FA=
ULT
at 50405c [ IBUS ]
[  308.263103] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  325.400452] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  345.742702] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  360.574654] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  374.383876] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  523.869265] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  554.220856] kernel: nouveau 0000:08:00.0: bus: MMIO write of 04048d1f FA=
ULT
at 6013d4 [ IBUS ]
[  655.092116] kernel: nouveau 0000:08:00.0: bus: MMIO write of 0000001f FA=
ULT
at 6013d4 [ IBUS ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15558264283.BE8CcA8D.25921--

--===============1382828200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1382828200==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104835] MMIO read of 00000000 FAULT at 10ac08 [ IBUS
 ]
Date: Tue, 22 May 2018 05:32:54 +0000
Message-ID: <bug-104835-8800-mMGSszotsv@http.bugs.freedesktop.org/>
References: <bug-104835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1089336285=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1089336285==
Content-Type: multipart/alternative; boundary="15269671730.Dedad3F.25678"
Content-Transfer-Encoding: 7bit


--15269671730.Dedad3F.25678
Date: Tue, 22 May 2018 05:32:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

--- Comment #4 from Andreas Sch=C3=B6neck <as.maps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Similarly here, on a linux desktop/Fedora 28:

$ journalctl --dmesg --grep=3Dnouveau --no-hostname=20

-- Logs begin at Wed 2015-01-07 08:21:59 CET, end at Tue 2018-05-22 07:29:38
CEST. --
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1173b0a2)
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bios: version 82.07.5a.00.02
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: fb: 2048 MiB DDR3
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FA=
ULT
at 3e6684 [ IBUS ]
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FA=
ULT
at 10ac08 [ IBUS ]
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02
00020030
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00
0f420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 02811fa6
04420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62
04420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002146
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
Mai 22 06:58:52 kernel: nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb:
0x80000, bo 000000004af09701
Mai 22 06:58:52 kernel: fbcon: nouveaufb (fb0) is primary device
Mai 22 06:58:52 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Mai 22 06:58:52 kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GL [Quadro K620]
(rev a2)

$ uname -rv
4.16.9-300.fc28.x86_64 #1 SMP Thu May 17 06:39:18 UTC 2018

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15269671730.Dedad3F.25678
Date: Tue, 22 May 2018 05:32:53 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104835">bug 10483=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
as.maps&#64;gmail.com" title=3D"Andreas Sch=C3=B6neck &lt;as.maps&#64;gmail=
.com&gt;"> <span class=3D"fn">Andreas Sch=C3=B6neck</span></a>
</span></b>
        <pre>Similarly here, on a linux desktop/Fedora 28:

$ journalctl --dmesg --grep=3Dnouveau --no-hostname=20

-- Logs begin at Wed 2015-01-07 08:21:59 CET, end at Tue 2018-05-22 07:29:38
CEST. --
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1173b0a2)
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bios: version 82.07.5a.00.02
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: fb: 2048 MiB DDR3
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FA=
ULT
at 3e6684 [ IBUS ]
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FA=
ULT
at 10ac08 [ IBUS ]
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02
00020030
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00
0f420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 02811fa6
04420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62
04420010
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002146
Mai 22 06:58:51 kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
Mai 22 06:58:52 kernel: nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb:
0x80000, bo 000000004af09701
Mai 22 06:58:52 kernel: fbcon: nouveaufb (fb0) is primary device
Mai 22 06:58:52 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Mai 22 06:58:52 kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

$ lspci | grep VGA
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GL [Quadro K620]
(rev a2)

$ uname -rv
4.16.9-300.fc28.x86_64 #1 SMP Thu May 17 06:39:18 UTC 2018</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15269671730.Dedad3F.25678--

--===============1089336285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1089336285==--

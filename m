From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Sun, 01 Jul 2018 18:58:45 +0000
Message-ID: <bug-105319-8800-zpEPIm2x46@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1145269326=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1145269326==
Content-Type: multipart/alternative; boundary="15304715251.1dE9DaD0.21518"
Content-Transfer-Encoding: 7bit


--15304715251.1dE9DaD0.21518
Date: Sun, 1 Jul 2018 18:58:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #17 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
Against one good boot=20

dmesg | grep -i nouv
[    6.731505] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    6.758367] nouveau 0000:01:00.0: bios: version 62.98.2e.00.08
[    6.781022] nouveau 0000:01:00.0: bios: M0203T not found
[    6.781025] nouveau 0000:01:00.0: bios: M0203E not matched!
[    6.781028] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    6.831893] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    6.832058] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.832206] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.832349] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.832493] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
[    6.832638] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[    6.832783] nouveau 0000:01:00.0: DRM: DCB outp 02: 04032312 00020010
[    6.832928] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    6.833085] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[    6.833226] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001261
[    6.869977] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    6.945008] nouveau 0000:01:00.0: DRM: allocated 1280x800 fb: 0x50000, bo
ffff8a5638d90000
[    6.977103] fbcon: nouveaufb (fb0) is primary device
[    8.542893] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    8.546151] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15304715251.1dE9DaD0.21518
Date: Sun, 1 Jul 2018 18:58:45 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>Against one good boot=20

dmesg | grep -i nouv
[    6.731505] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    6.758367] nouveau 0000:01:00.0: bios: version 62.98.2e.00.08
[    6.781022] nouveau 0000:01:00.0: bios: M0203T not found
[    6.781025] nouveau 0000:01:00.0: bios: M0203E not matched!
[    6.781028] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    6.831893] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    6.832058] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.832206] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.832349] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    6.832493] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
[    6.832638] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[    6.832783] nouveau 0000:01:00.0: DRM: DCB outp 02: 04032312 00020010
[    6.832928] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    6.833085] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[    6.833226] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001261
[    6.869977] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    6.945008] nouveau 0000:01:00.0: DRM: allocated 1280x800 fb: 0x50000, bo
ffff8a5638d90000
[    6.977103] fbcon: nouveaufb (fb0) is primary device
[    8.542893] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    8.546151] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15304715251.1dE9DaD0.21518--

--===============1145269326==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1145269326==--

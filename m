From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Sun, 01 Jul 2018 18:43:45 +0000
Message-ID: <bug-105319-8800-35un8EC1nK@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0591350063=="
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


--===============0591350063==
Content-Type: multipart/alternative; boundary="15304706250.Bf5ef52.16754"
Content-Transfer-Encoding: 7bit


--15304706250.Bf5ef52.16754
Date: Sun, 1 Jul 2018 18:43:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #16 from S=C3=A9rgio M. Basto <sergio-iCFKjj3otdHQT0dZR+AlfA@public.gmane.org> ---
while kernel-4.14.18 still boot without any problem , and was boot since 20=
07 ,
now with kernel-4.17.3-100.fc27.x86_64 still have=20

dmesg | grep -i nouv
[    6.897082] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    6.924724] nouveau 0000:01:00.0: bios: version 62.98.2e.00.08
[    6.946862] nouveau 0000:01:00.0: bios: M0203T not found
[    6.947024] nouveau 0000:01:00.0: bios: M0203E not matched!
[    6.947173] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    7.031599] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    7.031744] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    7.031905] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    7.032073] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    7.032240] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
[    7.032394] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[    7.032541] nouveau 0000:01:00.0: DRM: DCB outp 02: 04032312 00020010
[    7.032688] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    7.032835] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[    7.032980] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001261
[    7.039372] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    7.117580] nouveau 0000:01:00.0: DRM: allocated 1280x800 fb: 0x60000, bo
0000000065c597bd
[    7.123536] fbcon: nouveaufb (fb0) is primary device
[    9.191132] nouveau 0000:01:00.0: DRM: EVO timeout
[   11.191063] nouveau 0000:01:00.0: DRM: base-0: timeout
[   13.192324] nouveau 0000:01:00.0: DRM: base-0: timeout
[   15.266028] nouveau 0000:01:00.0: DRM: base-0: timeout
[   17.266094] nouveau 0000:01:00.0: DRM: base-0: timeout
[   17.499507] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[   19.503322] nouveau 0000:01:00.0: DRM: base-0: timeout
[   19.511588] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   19.519163] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   21.564246] nouveau 0000:01:00.0: DRM: base-0: timeout
[   30.324866] nouveau 0000:01:00.0: DRM: EVO timeout
[  639.261601] nouveau 0000:01:00.0: DRM: EVO timeout

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15304706250.Bf5ef52.16754
Date: Sun, 1 Jul 2018 18:43:45 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio&#64;serjux.com" title=3D"S=C3=A9rgio M. Basto &lt;sergio&#64;serjux.=
com&gt;"> <span class=3D"fn">S=C3=A9rgio M. Basto</span></a>
</span></b>
        <pre>while kernel-4.14.18 still boot without any problem , and was =
boot since 2007 ,
now with kernel-4.17.3-100.fc27.x86_64 still have=20

dmesg | grep -i nouv
[    6.897082] nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
[    6.924724] nouveau 0000:01:00.0: bios: version 62.98.2e.00.08
[    6.946862] nouveau 0000:01:00.0: bios: M0203T not found
[    6.947024] nouveau 0000:01:00.0: bios: M0203E not matched!
[    6.947173] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    7.031599] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    7.031744] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    7.031905] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    7.032073] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    7.032240] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000323 00010034
[    7.032394] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[    7.032541] nouveau 0000:01:00.0: DRM: DCB outp 02: 04032312 00020010
[    7.032688] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    7.032835] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
[    7.032980] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001261
[    7.039372] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[    7.117580] nouveau 0000:01:00.0: DRM: allocated 1280x800 fb: 0x60000, bo
0000000065c597bd
[    7.123536] fbcon: nouveaufb (fb0) is primary device
[    9.191132] nouveau 0000:01:00.0: DRM: EVO timeout
[   11.191063] nouveau 0000:01:00.0: DRM: base-0: timeout
[   13.192324] nouveau 0000:01:00.0: DRM: base-0: timeout
[   15.266028] nouveau 0000:01:00.0: DRM: base-0: timeout
[   17.266094] nouveau 0000:01:00.0: DRM: base-0: timeout
[   17.499507] nouveau 0000:01:00.0: DRM: GPU lockup - switching to software
fbcon
[   19.503322] nouveau 0000:01:00.0: DRM: base-0: timeout
[   19.511588] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   19.519163] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   21.564246] nouveau 0000:01:00.0: DRM: base-0: timeout
[   30.324866] nouveau 0000:01:00.0: DRM: EVO timeout
[  639.261601] nouveau 0000:01:00.0: DRM: EVO timeout</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15304706250.Bf5ef52.16754--

--===============0591350063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0591350063==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Fri, 07 Dec 2018 11:26:38 +0000
Message-ID: <bug-100423-8800-kR6KkbblSu@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1454114759=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1454114759==
Content-Type: multipart/alternative; boundary="15441819981.7c8bb.29505"
Content-Transfer-Encoding: 7bit


--15441819981.7c8bb.29505
Date: Fri, 7 Dec 2018 11:26:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #24 from joel.busch-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
I'm getting one of these too on Fedora 28 KDE Plasma spin.

Acer Aspire VN7-592G/Aspire VN7-592G, BIOS V1.13 03/21/2018
Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz
NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)

$ cat /proc/version
Linux version 4.19.6-200.fc28.x86_64
(mockbuild-IQyTzKUysSGO0/Z9DF9WQsNrQ1sYaAMk1rGf20DD4Tc@public.gmane.org) (gcc version 8.2.1 20181105 (R=
ed
Hat 8.2.1-5) (GCC)) #1 SMP Sun Dec 2 18:03:32 UTC 2018

$ journalctl -b --no-hostname -o short-monotonic | grep nouveau
[    2.515464] kernel: nouveau: detected PR support, will not use DSM
[    2.515480] kernel: nouveau 0000:01:00.0: enabling device (0006 -> 0007)
[    2.515620] kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[    2.537544] kernel: nouveau 0000:01:00.0: bios: version 82.07.80.00.2a
[    2.586306] kernel: nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.586357] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 022554 [ IBUS ]
[    2.599343] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 10ac08 [ IBUS ]
[    3.260508] kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    3.260509] kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.260511] kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS table inv=
alid
[    3.260512] kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.261005] kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
[    3.261011] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1
[    7.846986] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 619444 [ IBUS ]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15441819981.7c8bb.29505
Date: Fri, 7 Dec 2018 11:26:38 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joel.busch&#64;hotmail.com" title=3D"joel.busch&#64;hotmail.com">joel.busch=
&#64;hotmail.com</a>
</span></b>
        <pre>I'm getting one of these too on Fedora 28 KDE Plasma spin.

Acer Aspire VN7-592G/Aspire VN7-592G, BIOS V1.13 03/21/2018
Intel(R) Core(TM) i7-6700HQ CPU &#64; 2.60GHz
NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)

$ cat /proc/version
Linux version 4.19.6-200.fc28.x86_64
(<a href=3D"mailto:mockbuild&#64;bkernel04.phx2.fedoraproject.org">mockbuil=
d&#64;bkernel04.phx2.fedoraproject.org</a>) (gcc version 8.2.1 20181105 (Red
Hat 8.2.1-5) (GCC)) #1 SMP Sun Dec 2 18:03:32 UTC 2018

$ journalctl -b --no-hostname -o short-monotonic | grep nouveau
[    2.515464] kernel: nouveau: detected PR support, will not use DSM
[    2.515480] kernel: nouveau 0000:01:00.0: enabling device (0006 -&gt; 00=
07)
[    2.515620] kernel: nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[    2.537544] kernel: nouveau 0000:01:00.0: bios: version 82.07.80.00.2a
[    2.586306] kernel: nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.586357] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 022554 [ IBUS ]
[    2.599343] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 10ac08 [ IBUS ]
[    3.260508] kernel: nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    3.260509] kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.260511] kernel: nouveau 0000:01:00.0: DRM: Pointer to TMDS table inv=
alid
[    3.260512] kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.261005] kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer
copies
[    3.261011] kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 1
[    7.846986] kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAU=
LT
at 619444 [ IBUS ]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15441819981.7c8bb.29505--

--===============1454114759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1454114759==--

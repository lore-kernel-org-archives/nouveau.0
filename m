From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Mon, 29 Oct 2018 07:22:15 +0000
Message-ID: <bug-100423-8800-KjLSNvhcwE@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1478090598=="
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


--===============1478090598==
Content-Type: multipart/alternative; boundary="15407977352.Bb4e723A6.24823"
Content-Transfer-Encoding: 7bit


--15407977352.Bb4e723A6.24823
Date: Mon, 29 Oct 2018 07:22:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #19 from boldingd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I think I'm also seeing this with Fedora 29 Beta, I was also seeing errors =
with
updated Fedora 28.

[    1.614055] nouveau: detected PR support, will not use DSM
[    1.614243] nouveau 0000:01:00.0: NVIDIA GM108 (118070a2)
[    1.629639] nouveau 0000:01:00.0: bios: version 82.08.3b.00.4b
[    1.714600] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    1.714622] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[    1.729900] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    2.372521] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.372522] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.372526] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.372543] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.373356] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.373363] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[    8.044183] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[    9.126208] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   93.901280] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[  101.777394] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[  112.733004] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]

I'm also on a laptop (Asus Zenbook UX303U) with hybrid graphics (Skylake GT2
[HD Graphics 520] (rev 07) / GM108M [GeForce 940M] (rev a2)).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15407977352.Bb4e723A6.24823
Date: Mon, 29 Oct 2018 07:22:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
boldingd&#64;gmail.com" title=3D"boldingd&#64;gmail.com">boldingd&#64;gmail=
.com</a>
</span></b>
        <pre>I think I'm also seeing this with Fedora 29 Beta, I was also s=
eeing errors with
updated Fedora 28.

[    1.614055] nouveau: detected PR support, will not use DSM
[    1.614243] nouveau 0000:01:00.0: NVIDIA GM108 (118070a2)
[    1.629639] nouveau 0000:01:00.0: bios: version 82.08.3b.00.4b
[    1.714600] nouveau 0000:01:00.0: fb: 2048 MiB DDR3
[    1.714622] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[    1.729900] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10=
ac08
[ IBUS ]
[    2.372521] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.372522] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.372526] nouveau 0000:01:00.0: DRM: Pointer to TMDS table invalid
[    2.372543] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.373356] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.373363] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 1
[    8.044183] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[    9.126208] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 61=
9444
[ IBUS ]
[   93.901280] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[  101.777394] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]
[  112.733004] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 60=
13d4
[ IBUS ]

I'm also on a laptop (Asus Zenbook UX303U) with hybrid graphics (Skylake GT2
[HD Graphics 520] (rev 07) / GM108M [GeForce 940M] (rev a2)).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15407977352.Bb4e723A6.24823--

--===============1478090598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1478090598==--

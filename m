From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Sun, 28 Jan 2018 21:34:05 +0000
Message-ID: <bug-100423-8800-VJWnJoAxJW@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0103804073=="
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


--===============0103804073==
Content-Type: multipart/alternative; boundary="15171752450.5ffd1.12027"
Content-Transfer-Encoding: 7bit


--15171752450.5ffd1.12027
Date: Sun, 28 Jan 2018 21:34:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #8 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
There is a new one now (10ac08, in addition to 022554):
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

Should I open a new issue for this one?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15171752450.5ffd1.12027
Date: Sun, 28 Jan 2018 21:34:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>There is a new one now (10ac08, in addition to 022554):
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

```

Should I open a new issue for this one?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15171752450.5ffd1.12027--

--===============0103804073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0103804073==--

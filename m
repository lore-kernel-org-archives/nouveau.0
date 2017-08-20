From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101887] gtx 970 black screen
Date: Sun, 20 Aug 2017 11:29:24 +0000
Message-ID: <bug-101887-8800-1RKL4JViU2@http.bugs.freedesktop.org/>
References: <bug-101887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694560637=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1694560637==
Content-Type: multipart/alternative; boundary="15032285641.e2Cdd3d46.21866";
 charset="UTF-8"


--15032285641.e2Cdd3d46.21866
Date: Sun, 20 Aug 2017 11:29:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101887

--- Comment #16 from fariouche-Qt13gs6zZMY@public.gmane.org ---
I have a good news: just update my kernel to 4.13.0-rc5 from git, with no
patches, and it works!

Only one error in dmesg (FAULT when MMIO write...) but I do not see any obv=
ious
issue...

I suppose that we can close this bug.

The part of the dmesg output is here:

[    0.940114] nouveau 0000:03:00.0: NVIDIA GM204 (124020a1)
[    1.030897] nouveau 0000:03:00.0: bios: version 84.04.36.00.0b
[    1.031759] nouveau 0000:03:00.0: fb: 4096 MiB GDDR5
[    1.032013] nouveau 0000:03:00.0: bus: MMIO write of 80000422 FAULT at
10eb14 [ IBUS ]
[    1.040367] [TTM] Zone  kernel: Available graphics memory: 8214694 kiB
[    1.040538] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.040704] [TTM] Initializing pool allocator
[    1.040868] [TTM] Initializing DMA pool allocator
[    1.041112] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    1.041278] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    1.041444] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    1.041610] nouveau 0000:03:00.0: DRM: DCB version 4.1
[    1.041774] nouveau 0000:03:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.041941] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.042115] nouveau 0000:03:00.0: DRM: DCB outp 02: 02811f76 04400020
[    1.042285] nouveau 0000:03:00.0: DRM: DCB outp 03: 02011f72 00020020
[    1.042452] nouveau 0000:03:00.0: DRM: DCB outp 04: 04822f86 04400010
[    1.042618] nouveau 0000:03:00.0: DRM: DCB outp 05: 04022f82 00020010
[    1.042785] nouveau 0000:03:00.0: DRM: DCB outp 06: 04833f96 04400020
[    1.042952] nouveau 0000:03:00.0: DRM: DCB outp 07: 04033f92 00020020
[    1.043127] nouveau 0000:03:00.0: DRM: DCB outp 08: 02044f62 00020010
[    1.043296] nouveau 0000:03:00.0: DRM: DCB outp 15: 01df5ff8 00000000
[    1.043463] nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
[    1.043628] nouveau 0000:03:00.0: DRM: DCB conn 01: 00020146
[    1.043792] nouveau 0000:03:00.0: DRM: DCB conn 02: 01000246
[    1.043957] nouveau 0000:03:00.0: DRM: DCB conn 03: 02000346
[    1.044130] nouveau 0000:03:00.0: DRM: DCB conn 04: 00010461
[    1.044298] nouveau 0000:03:00.0: DRM: DCB conn 05: 00000570
[    1.044463] nouveau 0000:03:00.0: DRM: Pointer to flat panel table inval=
id
[    1.044654] nouveau 0000:03:00.0: disp: dcb 15 type 8 unknown
[    1.097223] nouveau 0000:03:00.0: DRM: unknown connector type 70
[    1.097413] nouveau 0000:03:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.097586] nouveau 0000:03:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.097787] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.097957] [drm] Driver supports precise vblank timestamp query.
[    1.207976] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    1.561492] nouveau 0000:03:00.0: DRM: allocated 4096x2160 fb: 0x60000, =
bo
ffff88041ca58000

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15032285641.e2Cdd3d46.21866
Date: Sun, 20 Aug 2017 11:29:24 +0000
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
   title=3D"NEW - gtx 970 black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101887#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gtx 970 black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101887">bug 10188=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fariouche&#64;yahoo.fr" title=3D"fariouche&#64;yahoo.fr">fariouche&#64;yaho=
o.fr</a>
</span></b>
        <pre>I have a good news: just update my kernel to 4.13.0-rc5 from g=
it, with no
patches, and it works!

Only one error in dmesg (FAULT when MMIO write...) but I do not see any obv=
ious
issue...

I suppose that we can close this bug.

The part of the dmesg output is here:

[    0.940114] nouveau 0000:03:00.0: NVIDIA GM204 (124020a1)
[    1.030897] nouveau 0000:03:00.0: bios: version 84.04.36.00.0b
[    1.031759] nouveau 0000:03:00.0: fb: 4096 MiB GDDR5
[    1.032013] nouveau 0000:03:00.0: bus: MMIO write of 80000422 FAULT at
10eb14 [ IBUS ]
[    1.040367] [TTM] Zone  kernel: Available graphics memory: 8214694 kiB
[    1.040538] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.040704] [TTM] Initializing pool allocator
[    1.040868] [TTM] Initializing DMA pool allocator
[    1.041112] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    1.041278] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    1.041444] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    1.041610] nouveau 0000:03:00.0: DRM: DCB version 4.1
[    1.041774] nouveau 0000:03:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.041941] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.042115] nouveau 0000:03:00.0: DRM: DCB outp 02: 02811f76 04400020
[    1.042285] nouveau 0000:03:00.0: DRM: DCB outp 03: 02011f72 00020020
[    1.042452] nouveau 0000:03:00.0: DRM: DCB outp 04: 04822f86 04400010
[    1.042618] nouveau 0000:03:00.0: DRM: DCB outp 05: 04022f82 00020010
[    1.042785] nouveau 0000:03:00.0: DRM: DCB outp 06: 04833f96 04400020
[    1.042952] nouveau 0000:03:00.0: DRM: DCB outp 07: 04033f92 00020020
[    1.043127] nouveau 0000:03:00.0: DRM: DCB outp 08: 02044f62 00020010
[    1.043296] nouveau 0000:03:00.0: DRM: DCB outp 15: 01df5ff8 00000000
[    1.043463] nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
[    1.043628] nouveau 0000:03:00.0: DRM: DCB conn 01: 00020146
[    1.043792] nouveau 0000:03:00.0: DRM: DCB conn 02: 01000246
[    1.043957] nouveau 0000:03:00.0: DRM: DCB conn 03: 02000346
[    1.044130] nouveau 0000:03:00.0: DRM: DCB conn 04: 00010461
[    1.044298] nouveau 0000:03:00.0: DRM: DCB conn 05: 00000570
[    1.044463] nouveau 0000:03:00.0: DRM: Pointer to flat panel table inval=
id
[    1.044654] nouveau 0000:03:00.0: disp: dcb 15 type 8 unknown
[    1.097223] nouveau 0000:03:00.0: DRM: unknown connector type 70
[    1.097413] nouveau 0000:03:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.097586] nouveau 0000:03:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.097787] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.097957] [drm] Driver supports precise vblank timestamp query.
[    1.207976] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    1.561492] nouveau 0000:03:00.0: DRM: allocated 4096x2160 fb: 0x60000, =
bo
ffff88041ca58000</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15032285641.e2Cdd3d46.21866--

--===============1694560637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1694560637==--

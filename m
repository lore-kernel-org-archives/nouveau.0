From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108857] display becomes unresponsive and keyboard
 input fails
Date: Sat, 01 Dec 2018 07:04:05 +0000
Message-ID: <bug-108857-8800-jXqNwMqEtR@http.bugs.freedesktop.org/>
References: <bug-108857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0841164166=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0841164166==
Content-Type: multipart/alternative; boundary="15436478471.67faeD.18431"
Content-Transfer-Encoding: 7bit


--15436478471.67faeD.18431
Date: Sat, 1 Dec 2018 07:04:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108857

--- Comment #6 from Victor Costan <costan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I ran into the same problem since I upgraded to 4.19. I've been using the 4=
.18
kernel to get my work done. I just tried the 4.19 and 4.20 vanilla kernels
packaged for Fedora, and the problem is still there.

I've been suspecting the Spectre mitigations until I found this bug -- I now
tried the proprietary nvidia driver, and it seems to have made the problem =
go
away.

In case it helps, I have a GTX1080 founders' edition.

Relevant lines from dmesg:
[    1.745599] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
[    1.852957] nouveau 0000:01:00.0: bios: version 86.04.17.00.01
[    1.853407] nouveau 0000:01:00.0: bios: M0203E type 08
[    1.853440] nouveau 0000:01:00.0: fb: 8192 MiB of unknown memory type
[    1.893737] [TTM] Zone  kernel: Available graphics memory: 16445892 kiB
[    1.893738] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.893738] [TTM] Initializing pool allocator
[    1.893741] [TTM] Initializing DMA pool allocator
[    1.893750] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[    1.893751] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    1.893752] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.893753] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.893754] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.893755] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.893756] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 00020030
[    1.893757] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.893757] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 00020020
[    1.893758] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.893759] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 00020010
[    1.893760] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    1.893761] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.893762] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.893762] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    1.893763] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    1.893764] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[    1.893765] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    1.893765] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[    1.998241] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.998243] [drm] Driver supports precise vblank timestamp query.
[    2.043058] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.374601] nouveau 0000:01:00.0: DRM: allocated 3840x2160 fb: 0x200000,=
 bo
00000000ae0f5db6
[    2.374656] fbcon: nouveaufb (fb0) is primary device
[    2.374657] fbcon: Deferring console take-over
[    2.374658] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.393355] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[    2.470633] nouveau 0000:01:00.0: disp: 0x000064f7[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[   40.934912] nouveau 0000:01:00.0: disp: chid 1 mthd 0000 data 00000000
00003000 00000000
[   40.934931] nouveau 0000:01:00.0: disp: chid 1 mthd 0004 data 08700f00
10003004 00000000
[   40.934948] nouveau 0000:01:00.0: disp: chid 1 mthd 0008 data 0000f004
10003008 00000000
[   40.934966] nouveau 0000:01:00.0: disp: chid 1 mthd 000c data 0000cf00
1000300c 00000000
[   40.934977] nouveau 0000:01:00.0: disp: chid 1 mthd 0010 data 20000000
10003010 00000000
[   40.934992] nouveau 0000:01:00.0: disp: chid 1 mthd 0014 data 00000000
10003014 00000000
[   40.935002] nouveau 0000:01:00.0: disp: chid 1 mthd 0018 data 00000000
10003018 00000000
[   40.935015] nouveau 0000:01:00.0: disp: chid 1 mthd 001c data 00000000
1000301c 00000000
[   40.935024] nouveau 0000:01:00.0: disp: chid 1 mthd 0020 data 00000000
10003020 00000000
[   40.935037] nouveau 0000:01:00.0: disp: chid 1 mthd 0000 data 00000400
10001000 00000002
[   42.935037] nouveau 0000:01:00.0: DRM: base-0: timeout
[   44.937059] nouveau 0000:01:00.0: DRM: base-0: timeout
[   46.940112] nouveau 0000:01:00.0: DRM: base-0: timeout
[   48.942221] nouveau 0000:01:00.0: DRM: base-0: timeout
[   73.444493] nouveau 0000:01:00.0: DRM: base-0: timeout
[   91.300747] nouveau 0000:01:00.0: DRM: base-0: timeout
[   93.306492] nouveau 0000:01:00.0: DRM: base-0: timeout
[   95.310609] nouveau 0000:01:00.0: DRM: base-0: timeout
[  111.646135] nouveau 0000:01:00.0: DRM: base-0: timeout
[  113.648187] nouveau 0000:01:00.0: DRM: base-0: timeout
[  115.649874] nouveau 0000:01:00.0: DRM: base-0: timeout
[  117.650629] nouveau 0000:01:00.0: DRM: base-0: timeout
[  120.902222] nouveau 0000:01:00.0: DRM: base-0: timeout
[  122.902900] nouveau 0000:01:00.0: DRM: base-0: timeout
[  124.903509] nouveau 0000:01:00.0: DRM: base-0: timeout
[  126.904112] nouveau 0000:01:00.0: DRM: base-0: timeout
[  154.470730] nouveau 0000:01:00.0: DRM: base-0: timeout
[  214.470998] nouveau 0000:01:00.0: DRM: base-0: timeout
[  274.471269] nouveau 0000:01:00.0: DRM: base-0: timeout
[  334.470469] nouveau 0000:01:00.0: DRM: base-0: timeout
[  394.470680] nouveau 0000:01:00.0: DRM: base-0: timeout
[  454.470846] nouveau 0000:01:00.0: DRM: base-0: timeout

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15436478471.67faeD.18431
Date: Sat, 1 Dec 2018 07:04:07 +0000
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
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - display becomes unresponsive and keyboard input fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108857">bug 10885=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
costan&#64;gmail.com" title=3D"Victor Costan &lt;costan&#64;gmail.com&gt;">=
 <span class=3D"fn">Victor Costan</span></a>
</span></b>
        <pre>I ran into the same problem since I upgraded to 4.19. I've bee=
n using the 4.18
kernel to get my work done. I just tried the 4.19 and 4.20 vanilla kernels
packaged for Fedora, and the problem is still there.

I've been suspecting the Spectre mitigations until I found this bug -- I now
tried the proprietary nvidia driver, and it seems to have made the problem =
go
away.

In case it helps, I have a GTX1080 founders' edition.

Relevant lines from dmesg:
[    1.745599] nouveau 0000:01:00.0: NVIDIA GP104 (134000a1)
[    1.852957] nouveau 0000:01:00.0: bios: version 86.04.17.00.01
[    1.853407] nouveau 0000:01:00.0: bios: M0203E type 08
[    1.853440] nouveau 0000:01:00.0: fb: 8192 MiB of unknown memory type
[    1.893737] [TTM] Zone  kernel: Available graphics memory: 16445892 kiB
[    1.893738] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.893738] [TTM] Initializing pool allocator
[    1.893741] [TTM] Initializing DMA pool allocator
[    1.893750] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[    1.893751] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    1.893752] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.893753] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.893754] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.893755] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.893756] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 00020030
[    1.893757] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.893757] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 00020020
[    1.893758] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.893759] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 00020010
[    1.893760] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    1.893761] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.893762] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.893762] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    1.893763] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    1.893764] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[    1.893765] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    1.893765] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[    1.998241] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.998243] [drm] Driver supports precise vblank timestamp query.
[    2.043058] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.374601] nouveau 0000:01:00.0: DRM: allocated 3840x2160 fb: 0x200000,=
 bo
00000000ae0f5db6
[    2.374656] fbcon: nouveaufb (fb0) is primary device
[    2.374657] fbcon: Deferring console take-over
[    2.374658] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.393355] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[    2.470633] nouveau 0000:01:00.0: disp: 0x000064f7[0]:
INIT_GENERIC_CONDITON: unknown 0x07
[   40.934912] nouveau 0000:01:00.0: disp: chid 1 mthd 0000 data 00000000
00003000 00000000
[   40.934931] nouveau 0000:01:00.0: disp: chid 1 mthd 0004 data 08700f00
10003004 00000000
[   40.934948] nouveau 0000:01:00.0: disp: chid 1 mthd 0008 data 0000f004
10003008 00000000
[   40.934966] nouveau 0000:01:00.0: disp: chid 1 mthd 000c data 0000cf00
1000300c 00000000
[   40.934977] nouveau 0000:01:00.0: disp: chid 1 mthd 0010 data 20000000
10003010 00000000
[   40.934992] nouveau 0000:01:00.0: disp: chid 1 mthd 0014 data 00000000
10003014 00000000
[   40.935002] nouveau 0000:01:00.0: disp: chid 1 mthd 0018 data 00000000
10003018 00000000
[   40.935015] nouveau 0000:01:00.0: disp: chid 1 mthd 001c data 00000000
1000301c 00000000
[   40.935024] nouveau 0000:01:00.0: disp: chid 1 mthd 0020 data 00000000
10003020 00000000
[   40.935037] nouveau 0000:01:00.0: disp: chid 1 mthd 0000 data 00000400
10001000 00000002
[   42.935037] nouveau 0000:01:00.0: DRM: base-0: timeout
[   44.937059] nouveau 0000:01:00.0: DRM: base-0: timeout
[   46.940112] nouveau 0000:01:00.0: DRM: base-0: timeout
[   48.942221] nouveau 0000:01:00.0: DRM: base-0: timeout
[   73.444493] nouveau 0000:01:00.0: DRM: base-0: timeout
[   91.300747] nouveau 0000:01:00.0: DRM: base-0: timeout
[   93.306492] nouveau 0000:01:00.0: DRM: base-0: timeout
[   95.310609] nouveau 0000:01:00.0: DRM: base-0: timeout
[  111.646135] nouveau 0000:01:00.0: DRM: base-0: timeout
[  113.648187] nouveau 0000:01:00.0: DRM: base-0: timeout
[  115.649874] nouveau 0000:01:00.0: DRM: base-0: timeout
[  117.650629] nouveau 0000:01:00.0: DRM: base-0: timeout
[  120.902222] nouveau 0000:01:00.0: DRM: base-0: timeout
[  122.902900] nouveau 0000:01:00.0: DRM: base-0: timeout
[  124.903509] nouveau 0000:01:00.0: DRM: base-0: timeout
[  126.904112] nouveau 0000:01:00.0: DRM: base-0: timeout
[  154.470730] nouveau 0000:01:00.0: DRM: base-0: timeout
[  214.470998] nouveau 0000:01:00.0: DRM: base-0: timeout
[  274.471269] nouveau 0000:01:00.0: DRM: base-0: timeout
[  334.470469] nouveau 0000:01:00.0: DRM: base-0: timeout
[  394.470680] nouveau 0000:01:00.0: DRM: base-0: timeout
[  454.470846] nouveau 0000:01:00.0: DRM: base-0: timeout</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15436478471.67faeD.18431--

--===============0841164166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0841164166==--

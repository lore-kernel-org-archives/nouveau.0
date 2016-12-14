From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99068] Screen hangs when running a 3D app. GTX 660
Date: Wed, 14 Dec 2016 21:00:20 +0000
Message-ID: <bug-99068-8800-WiacZgryvO@http.bugs.freedesktop.org/>
References: <bug-99068-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1628638847=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99068-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1628638847==
Content-Type: multipart/alternative; boundary="14817492200.5e7F.29057";
 charset="UTF-8"


--14817492200.5e7F.29057
Date: Wed, 14 Dec 2016 21:00:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99068

--- Comment #5 from Nicol=C3=A1s Luciano B=C3=A9rtolo <nicolasbertolo@gmail=
.com> ---
I ran the mmiotrace, extracted the files using the script provided, renamed
them to their correct name and rebuilt the initramfs.

I can't get it to load the firmware. This is the error message I get:

[    4.908199] fb: switching to nouveaufb from EFI VGA
[    4.908585] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[    5.042663] nouveau 0000:01:00.0: bios: version 80.06.10.00.3d
[    5.043341] nouveau 0000:01:00.0: loading
/lib/firmware/nvidia/gk106/fecs_inst.bin failed with error -22
[    5.043342] nouveau 0000:01:00.0: Direct firmware load for
nvidia/gk106/fecs_inst.bin failed with error -22
[    5.043343] nouveau 0000:01:00.0: gr: failed to load fecs_inst
[    5.043978] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    5.105387] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    5.105388] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.105391] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    5.105392] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.105394] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[    5.105396] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[    5.105397] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[    5.105398] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[    5.105399] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[    5.105400] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[    5.105401] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    5.105402] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    5.105403] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    5.105404] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[    5.148299] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[    5.199540] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 00=
1940
[ !ENGINE ]
[    5.468949] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff8db261921c00
[    5.469019] fbcon: nouveaufb (fb0) is primary device
[    6.062618] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.099542] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14817492200.5e7F.29057
Date: Wed, 14 Dec 2016 21:00:20 +0000
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
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen hangs when running a 3D app. GTX 660"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99068">bug 99068<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicolasbertolo&#64;gmail.com" title=3D"Nicol=C3=A1s Luciano B=C3=A9rtolo &l=
t;nicolasbertolo&#64;gmail.com&gt;"> <span class=3D"fn">Nicol=C3=A1s Lucian=
o B=C3=A9rtolo</span></a>
</span></b>
        <pre>I ran the mmiotrace, extracted the files using the script prov=
ided, renamed
them to their correct name and rebuilt the initramfs.

I can't get it to load the firmware. This is the error message I get:

[    4.908199] fb: switching to nouveaufb from EFI VGA
[    4.908585] nouveau 0000:01:00.0: NVIDIA GK106 (0e6000a1)
[    5.042663] nouveau 0000:01:00.0: bios: version 80.06.10.00.3d
[    5.043341] nouveau 0000:01:00.0: loading
/lib/firmware/nvidia/gk106/fecs_inst.bin failed with error -22
[    5.043342] nouveau 0000:01:00.0: Direct firmware load for
nvidia/gk106/fecs_inst.bin failed with error -22
[    5.043343] nouveau 0000:01:00.0: gr: failed to load fecs_inst
[    5.043978] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    5.105387] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    5.105388] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    5.105391] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    5.105392] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    5.105394] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000f00 00000000
[    5.105396] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000f02 00020030
[    5.105397] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[    5.105398] nouveau 0000:01:00.0: DRM: DCB outp 04: 04822fb6 0f420010
[    5.105399] nouveau 0000:01:00.0: DRM: DCB outp 05: 04022f72 00020010
[    5.105400] nouveau 0000:01:00.0: DRM: DCB outp 06: 08033f82 00020030
[    5.105401] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    5.105402] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    5.105403] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    5.105404] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331
[    5.148299] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[    5.199540] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 00=
1940
[ !ENGINE ]
[    5.468949] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff8db261921c00
[    5.469019] fbcon: nouveaufb (fb0) is primary device
[    6.062618] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    6.099542] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14817492200.5e7F.29057--

--===============1628638847==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1628638847==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70388] [NV34] failed to idle channel 0xcccc0000
	(also NV44A)
Date: Sat, 11 Mar 2017 01:44:36 +0000
Message-ID: <bug-70388-8800-Pl1U1sQE0G@http.bugs.freedesktop.org/>
References: <bug-70388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0982157483=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70388-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0982157483==
Content-Type: multipart/alternative; boundary="14891966763.88b3b6e7.16602";
 charset="UTF-8"


--14891966763.88b3b6e7.16602
Date: Sat, 11 Mar 2017 01:44:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70388

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Huh. Well, I totally forgot about this bug. And due to wanting to cram
ever-more GPUs into my box, ended up getting a PCI NV4x so that I could keep
using 2x PCIe slots for "better" GPUs. Well, this turned out to be a NV44A =
with
a PCI bridge, and I'm getting the same issues.

FTR, I have:

# lspci -nn -d ::300
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108 [GeForce=
 GT
620] [10de:0f01] (rev a1)
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107 [GeForce=
 GTX
745] [10de:1382] (rev a2)
09:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV44A [GeForce
6200] [10de:0221] (rev a1)
09:01.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce =
FX
5200] [10de:0322] (rev a1)

And only the NV44A is giving me trouble. The NV34 works like a champ, as do=
 the
newer GPUs. On boot, with a 4.8.5 kernel, I got:

[    8.114998] [drm] Initialized nouveau 1.3.1 20120801 for 0000:04:00.0 on
minor 1
[    8.115015] nouveau 0000:09:00.0: enabling device (0000 -> 0002)
[    8.115152] nouveau 0000:09:00.0: NVIDIA NV44A (04a100a1)
[    8.302416] nouveau 0000:09:00.0: bios: version 05.44.a2.10.61
[    8.344251] nouveau 0000:09:00.0: fb: 256 MiB DDR2
[    8.470618] nouveau 0000:09:00.0: DRM: VRAM: 252 MiB
[    8.470619] nouveau 0000:09:00.0: DRM: GART: 512 MiB
[    8.470621] nouveau 0000:09:00.0: DRM: TMDS table version 1.1
[    8.470622] nouveau 0000:09:00.0: DRM: DCB version 3.0
[    8.470624] nouveau 0000:09:00.0: DRM: DCB outp 00: 01000300 00000028
[    8.470625] nouveau 0000:09:00.0: DRM: DCB outp 01: 02011310 00000028
[    8.470627] nouveau 0000:09:00.0: DRM: DCB outp 02: 01011312 00000000
[    8.470628] nouveau 0000:09:00.0: DRM: DCB outp 03: 020223f1 00c0c030
[    8.470629] nouveau 0000:09:00.0: DRM: DCB conn 00: 0000
[    8.470630] nouveau 0000:09:00.0: DRM: DCB conn 01: 2130
[    8.470632] nouveau 0000:09:00.0: DRM: DCB conn 02: 0210
[    8.470633] nouveau 0000:09:00.0: DRM: DCB conn 03: 0211
[    8.470634] nouveau 0000:09:00.0: DRM: DCB conn 04: 0213
[    8.470647] nouveau 0000:09:00.0: DRM: Adaptor not initialised, running
VBIOS init tables.
[    8.470773] nouveau 0000:09:00.0: DRM: Saving VGA fonts
[    8.577099] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    8.577101] [drm] Driver supports precise vblank timestamp query.
[    8.582396] nouveau 0000:09:00.0: DRM: MM: using CPU for buffer copies
[    8.582407] nouveau 0000:09:00.0: DRM: Setting dpms mode 3 on TV encoder
(output 3)
[    8.632789] nouveau 0000:09:00.0: DRM: Load detected on output B
[    8.642638] nouveau 0000:09:00.0: DRM: allocated 720x576 fb: 0x9000, bo
ffff8f5961eda000
[    8.642701] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 0 [DRM] get 0000=
0000
put 00000178 state 80000000 (err: INVALID_CMD) push 00000010
[    8.642794] nouveau 0000:09:00.0: fb2: nouveaufb frame buffer device

and when trying to start X on it, I got plenty more errors:

[  441.868341] nouveau 0000:09:00.0: DRM: Load detected on output B
[  441.920374] nouveau 0000:09:00.0: DRM: Load detected on output B
[  441.965447] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 2 [X[2962]] get
00049000 put 00049090 state 80000000 (err: INVALID_CMD) push 00000010
[  441.966367] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
00018000 put 000180a0 state 80000000 (err: INVALID_CMD) push 00000010
[  471.988366] nouveau 0000:09:00.0: DRM: Setting dpms mode 0 on TV encoder
(output 3)
[  471.988448] nouveau 0000:09:00.0: DRM: Output TV-1 is running on CRTC 0
using output B
[  472.033852] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180a0 put 000180b0 state 80000000 (err: INVALID_CMD) push 00000000
[  472.407262] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180b0 put 000180c0 state 80000000 (err: INVALID_CMD) push 00000000
[  483.836587] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180c0 put 000180d0 state 80000000 (err: INVALID_CMD) push 00000000
[  483.838904] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180d0 put 000180f0 state 80000000 (err: INVALID_CMD) push 00000000

and so on. Will investigate, I guess.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14891966763.88b3b6e7.16602
Date: Sat, 11 Mar 2017 01:44:36 +0000
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
   title=3D"NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70388#c35">Commen=
t # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV34] failed to idle channel 0xcccc0000 (also NV44A)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70388">bug 70388<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Huh. Well, I totally forgot about this bug. And due to wanting=
 to cram
ever-more GPUs into my box, ended up getting a PCI NV4x so that I could keep
using 2x PCIe slots for &quot;better&quot; GPUs. Well, this turned out to b=
e a NV44A with
a PCI bridge, and I'm getting the same issues.

FTR, I have:

# lspci -nn -d ::300
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GF108 [GeForce=
 GT
620] [10de:0f01] (rev a1)
04:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107 [GeForce=
 GTX
745] [10de:1382] (rev a2)
09:00.0 VGA compatible controller [0300]: NVIDIA Corporation NV44A [GeForce
6200] [10de:0221] (rev a1)
09:01.0 VGA compatible controller [0300]: NVIDIA Corporation NV34 [GeForce =
FX
5200] [10de:0322] (rev a1)

And only the NV44A is giving me trouble. The NV34 works like a champ, as do=
 the
newer GPUs. On boot, with a 4.8.5 kernel, I got:

[    8.114998] [drm] Initialized nouveau 1.3.1 20120801 for 0000:04:00.0 on
minor 1
[    8.115015] nouveau 0000:09:00.0: enabling device (0000 -&gt; 0002)
[    8.115152] nouveau 0000:09:00.0: NVIDIA NV44A (04a100a1)
[    8.302416] nouveau 0000:09:00.0: bios: version 05.44.a2.10.61
[    8.344251] nouveau 0000:09:00.0: fb: 256 MiB DDR2
[    8.470618] nouveau 0000:09:00.0: DRM: VRAM: 252 MiB
[    8.470619] nouveau 0000:09:00.0: DRM: GART: 512 MiB
[    8.470621] nouveau 0000:09:00.0: DRM: TMDS table version 1.1
[    8.470622] nouveau 0000:09:00.0: DRM: DCB version 3.0
[    8.470624] nouveau 0000:09:00.0: DRM: DCB outp 00: 01000300 00000028
[    8.470625] nouveau 0000:09:00.0: DRM: DCB outp 01: 02011310 00000028
[    8.470627] nouveau 0000:09:00.0: DRM: DCB outp 02: 01011312 00000000
[    8.470628] nouveau 0000:09:00.0: DRM: DCB outp 03: 020223f1 00c0c030
[    8.470629] nouveau 0000:09:00.0: DRM: DCB conn 00: 0000
[    8.470630] nouveau 0000:09:00.0: DRM: DCB conn 01: 2130
[    8.470632] nouveau 0000:09:00.0: DRM: DCB conn 02: 0210
[    8.470633] nouveau 0000:09:00.0: DRM: DCB conn 03: 0211
[    8.470634] nouveau 0000:09:00.0: DRM: DCB conn 04: 0213
[    8.470647] nouveau 0000:09:00.0: DRM: Adaptor not initialised, running
VBIOS init tables.
[    8.470773] nouveau 0000:09:00.0: DRM: Saving VGA fonts
[    8.577099] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    8.577101] [drm] Driver supports precise vblank timestamp query.
[    8.582396] nouveau 0000:09:00.0: DRM: MM: using CPU for buffer copies
[    8.582407] nouveau 0000:09:00.0: DRM: Setting dpms mode 3 on TV encoder
(output 3)
[    8.632789] nouveau 0000:09:00.0: DRM: Load detected on output B
[    8.642638] nouveau 0000:09:00.0: DRM: allocated 720x576 fb: 0x9000, bo
ffff8f5961eda000
[    8.642701] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 0 [DRM] get 0000=
0000
put 00000178 state 80000000 (err: INVALID_CMD) push 00000010
[    8.642794] nouveau 0000:09:00.0: fb2: nouveaufb frame buffer device

and when trying to start X on it, I got plenty more errors:

[  441.868341] nouveau 0000:09:00.0: DRM: Load detected on output B
[  441.920374] nouveau 0000:09:00.0: DRM: Load detected on output B
[  441.965447] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 2 [X[2962]] get
00049000 put 00049090 state 80000000 (err: INVALID_CMD) push 00000010
[  441.966367] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
00018000 put 000180a0 state 80000000 (err: INVALID_CMD) push 00000010
[  471.988366] nouveau 0000:09:00.0: DRM: Setting dpms mode 0 on TV encoder
(output 3)
[  471.988448] nouveau 0000:09:00.0: DRM: Output TV-1 is running on CRTC 0
using output B
[  472.033852] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180a0 put 000180b0 state 80000000 (err: INVALID_CMD) push 00000000
[  472.407262] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180b0 put 000180c0 state 80000000 (err: INVALID_CMD) push 00000000
[  483.836587] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180c0 put 000180d0 state 80000000 (err: INVALID_CMD) push 00000000
[  483.838904] nouveau 0000:09:00.0: fifo: DMA_PUSHER - ch 1 [X[2962]] get
000180d0 put 000180f0 state 80000000 (err: INVALID_CMD) push 00000000

and so on. Will investigate, I guess.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14891966763.88b3b6e7.16602--

--===============0982157483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0982157483==--

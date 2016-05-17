From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Tue, 17 May 2016 16:13:59 +0000
Message-ID: <bug-93629-8800-9X9SxubSHt@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0762514317=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0762514317==
Content-Type: multipart/alternative; boundary="14635016391.2248bfE5.2480";
 charset="UTF-8"


--14635016391.2248bfE5.2480
Date: Tue, 17 May 2016 16:13:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #30 from D=C4=81vis <davispuh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I think I'm getting this same bug with Nvidia GTX 650 Ti on Arch Linux using
unpatched released kernel 4.6, xf86-video-nouveau 1.0.12 and mesa 11.2.2

Sometimes random hangs happen which locks up GPU.
Note that nouveau have never really worked for me on this PC with this GPU =
for
like more than a year since I installed Linux there. It always have been
getting random hangs like other bug #89912 So I've been using proprietary
Nvidia driver which works fine.



Anyway for this bug, I'm using GNOME Shell and it happened while playing
Minecraft (with java-8-openjdk)

Kernel log:

kernel: fb: switching to nouveaufb from EFI VGA
kernel: Console: switching to colour dummy device 80x25
kernel: nouveau 0000:01:00.0: NVIDIA GK106 (0e6060a1)
kernel: nouveau 0000:01:00.0: bios: version 80.06.21.00.37
kernel: nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
kernel: [TTM] Zone  kernel: Available graphics memory: 12204692 kiB
kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00020030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82 0f420030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62 0f420010
kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
kernel: [drm] Driver supports precise vblank timestamp query.
kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
kernel: nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x60000, bo
ffff880601a1c400
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: Console: switching to colour frame buffer device 128x48
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
...
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 000c data 00000000
kernel: nouveau 0000:01:00.0: gr: TRAP ch 6 [003f7d0000 java[1817]]
kernel: nouveau 0000:01:00.0: gr: DISPATCH 80000002 [CLASS_SUBCH_MISMATCH]
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 [SEMAPHORE] ch 6
[003f7d0000 java[1817]] subc 0 mthd 001c data 3f800000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0100 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0030 data 20030700
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0034 data 00001014
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0038 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 003c data 015c4d10
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0040 data 200207c0
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0044 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0048 data 015d1fff
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00400000 [METHODCRC] ch 6
[003f7d0000 java[1817]] subc 0 mthd 007c data a01108e3
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 004c data 80000704
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00ec data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f0 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f4 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f8 data 3f800000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00fc data 3f800000
... loads of more like these ...
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0100 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0104 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0108 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 010c data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0110 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0114 data 3f800000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0118 data 3f800000
... again all log spammed with these like ILLEGAL_CLASS ...
[  345.614760] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b08 data 000014b6
[  345.614773] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b0c data 1000f010
[  428.465923] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 0100 data 00000000
[  428.465961] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b00 data 00000000
[  428.465989] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b04 data 00238000
[  428.466010] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b08 data 000014b7
[  428.466037] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b0c data 1000f010
[ 6833.360096] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 6833.360109] nouveau 0000:01:00.0: fifo: gr engine fault on channel 6,
recovering...
[ 7195.188708] nouveau 0000:01:00.0: gnome-shell[1177]: failed to idle chan=
nel
5 [gnome-shell[1177]]
[ 7210.189442] nouveau 0000:01:00.0: gnome-shell[1177]: failed to idle chan=
nel
5 [gnome-shell[1177]]
[ 7210.189607] nouveau 0000:01:00.0: fifo: read fault at 0000013000 engine =
07
[PBDMA0] client 07 [HOST_CPU] reason 02 [PTE] on channel 5 [003f8aa000
gnome-shell[1177]]
[ 7210.189772] nouveau 0000:01:00.0: fifo: fifo engine fault on channel 5,
recovering...
[ 7225.206843] nouveau 0000:01:00.0: java[2577]: failed to idle channel 6
[java[2577]]
[ 7240.207579] nouveau 0000:01:00.0: java[2577]: failed to idle channel 6
[java[2577]]

and here GPU lockup, but kernel itself didn't hung and works fine,
using SSH I was able to kill Xorg, unbind VT and unload nouveau and then re=
load
it again

# echo 0 > /sys/class/vtconsole/vtcon1/bind
# rmmod nouveau
# modprobe nouveau
# echo 1 > /sys/class/vtconsole/vtcon1/bind

then I started Xorg and it works, and in kernel log can see

[ 7354.650288] Console: switching to colour dummy device 80x25
[ 7398.714966] [TTM] Finalizing pool allocator
[ 7398.714972] [TTM] Finalizing DMA pool allocator
[ 7398.715081] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[ 7398.715084] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[ 7398.715664] [drm] Module unloaded
[ 7449.947953] MXM: GUID detected in BIOS
[ 7449.948021] nouveau 0000:01:00.0: NVIDIA GK106 (0e6060a1)
[ 7450.009294] nouveau 0000:01:00.0: bios: version 80.06.21.00.37
[ 7450.010087] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
[ 7450.064908] [TTM] Zone  kernel: Available graphics memory: 12204692 kiB
[ 7450.064912] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 7450.064914] [TTM] Initializing pool allocator
[ 7450.064921] [TTM] Initializing DMA pool allocator
[ 7450.064939] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[ 7450.064942] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[ 7450.064947] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[ 7450.064949] nouveau 0000:01:00.0: DRM: DCB version 4.0
[ 7450.064952] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[ 7450.064955] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00020030
[ 7450.064958] nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82 0f420030
[ 7450.064960] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62 0f420010
[ 7450.064963] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[ 7450.064965] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
[ 7450.064967] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
[ 7450.066173] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 7450.066175] [drm] Driver supports precise vblank timestamp query.
[ 7450.122768] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[ 7450.213563] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x60000, =
bo
ffff8804405c4800
[ 7450.213720] fbcon: nouveaufb (fb0) is primary device
[ 7450.569182] Console: switching to colour frame buffer device 128x48
[ 7450.569972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[ 7450.587996] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[ 7479.483820] Console: switching to colour dummy device 80x25
[ 7483.096411] Console: switching to colour frame buffer device 128x48


but then after some while it hung again=20

[10425.388235] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[10425.388240] nouveau 0000:01:00.0: fifo: gr engine fault on channel 6,
recovering...

[11378.573422] nouveau 0000:01:00.0: java[4377]: failed to idle channel 6
[java[4377]]
[11393.574071] nouveau 0000:01:00.0: java[4377]: failed to idle channel 6
[java[4377]]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14635016391.2248bfE5.2480
Date: Tue, 17 May 2016 16:13:59 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
davispuh&#64;gmail.com" title=3D"D=C4=81vis &lt;davispuh&#64;gmail.com&gt;"=
> <span class=3D"fn">D=C4=81vis</span></a>
</span></b>
        <pre>I think I'm getting this same bug with Nvidia GTX 650 Ti on Ar=
ch Linux using
unpatched released kernel 4.6, xf86-video-nouveau 1.0.12 and mesa 11.2.2

Sometimes random hangs happen which locks up GPU.
Note that nouveau have never really worked for me on this PC with this GPU =
for
like more than a year since I installed Linux there. It always have been
getting random hangs like other <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sometimes Nouveau hangs kernel with PGRAPH engine fault"
   href=3D"show_bug.cgi?id=3D89912">bug #89912</a> So I've been using propr=
ietary
Nvidia driver which works fine.



Anyway for this bug, I'm using GNOME Shell and it happened while playing
Minecraft (with java-8-openjdk)

Kernel log:

kernel: fb: switching to nouveaufb from EFI VGA
kernel: Console: switching to colour dummy device 80x25
kernel: nouveau 0000:01:00.0: NVIDIA GK106 (0e6060a1)
kernel: nouveau 0000:01:00.0: bios: version 80.06.21.00.37
kernel: nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
kernel: [TTM] Zone  kernel: Available graphics memory: 12204692 kiB
kernel: [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
kernel: [TTM] Initializing pool allocator
kernel: [TTM] Initializing DMA pool allocator
kernel: nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00020030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82 0f420030
kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62 0f420010
kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
kernel: [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
kernel: [drm] Driver supports precise vblank timestamp query.
kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
kernel: nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x60000, bo
ffff880601a1c400
kernel: fbcon: nouveaufb (fb0) is primary device
kernel: Console: switching to colour frame buffer device 128x48
kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
kernel: [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
...
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 000c data 00000000
kernel: nouveau 0000:01:00.0: gr: TRAP ch 6 [003f7d0000 java[1817]]
kernel: nouveau 0000:01:00.0: gr: DISPATCH 80000002 [CLASS_SUBCH_MISMATCH]
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 [SEMAPHORE] ch 6
[003f7d0000 java[1817]] subc 0 mthd 001c data 3f800000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0100 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0030 data 20030700
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0034 data 00001014
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0038 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 003c data 015c4d10
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0040 data 200207c0
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0044 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 0048 data 015d1fff
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00400000 [METHODCRC] ch 6
[003f7d0000 java[1817]] subc 0 mthd 007c data a01108e3
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 004c data 80000704
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00ec data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f0 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f4 data 00000000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00f8 data 3f800000
kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000 [METHOD] ch 6 [003f7d0=
000
java[1817]] subc 0 mthd 00fc data 3f800000
... loads of more like these ...
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0100 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0104 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0108 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 010c data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0110 data 00000000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0114 data 3f800000
kernel: nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000 java[1817]]
subc 0 class 0000 mthd 0118 data 3f800000
... again all log spammed with these like ILLEGAL_CLASS ...
[  345.614760] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b08 data 000014b6
[  345.614773] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b0c data 1000f010
[  428.465923] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 0100 data 00000000
[  428.465961] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b00 data 00000000
[  428.465989] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b04 data 00238000
[  428.466010] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b08 data 000014b7
[  428.466037] nouveau 0000:01:00.0: gr: ILLEGAL_CLASS ch 6 [003f7d0000
java[1817]] subc 0 class 0186 mthd 1b0c data 1000f010
[ 6833.360096] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[ 6833.360109] nouveau 0000:01:00.0: fifo: gr engine fault on channel 6,
recovering...
[ 7195.188708] nouveau 0000:01:00.0: gnome-shell[1177]: failed to idle chan=
nel
5 [gnome-shell[1177]]
[ 7210.189442] nouveau 0000:01:00.0: gnome-shell[1177]: failed to idle chan=
nel
5 [gnome-shell[1177]]
[ 7210.189607] nouveau 0000:01:00.0: fifo: read fault at 0000013000 engine =
07
[PBDMA0] client 07 [HOST_CPU] reason 02 [PTE] on channel 5 [003f8aa000
gnome-shell[1177]]
[ 7210.189772] nouveau 0000:01:00.0: fifo: fifo engine fault on channel 5,
recovering...
[ 7225.206843] nouveau 0000:01:00.0: java[2577]: failed to idle channel 6
[java[2577]]
[ 7240.207579] nouveau 0000:01:00.0: java[2577]: failed to idle channel 6
[java[2577]]

and here GPU lockup, but kernel itself didn't hung and works fine,
using SSH I was able to kill Xorg, unbind VT and unload nouveau and then re=
load
it again

# echo 0 &gt; /sys/class/vtconsole/vtcon1/bind
# rmmod nouveau
# modprobe nouveau
# echo 1 &gt; /sys/class/vtconsole/vtcon1/bind

then I started Xorg and it works, and in kernel log can see

[ 7354.650288] Console: switching to colour dummy device 80x25
[ 7398.714966] [TTM] Finalizing pool allocator
[ 7398.714972] [TTM] Finalizing DMA pool allocator
[ 7398.715081] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[ 7398.715084] [TTM] Zone   dma32: Used memory at exit: 0 kiB
[ 7398.715664] [drm] Module unloaded
[ 7449.947953] MXM: GUID detected in BIOS
[ 7449.948021] nouveau 0000:01:00.0: NVIDIA GK106 (0e6060a1)
[ 7450.009294] nouveau 0000:01:00.0: bios: version 80.06.21.00.37
[ 7450.010087] nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
[ 7450.064908] [TTM] Zone  kernel: Available graphics memory: 12204692 kiB
[ 7450.064912] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[ 7450.064914] [TTM] Initializing pool allocator
[ 7450.064921] [TTM] Initializing DMA pool allocator
[ 7450.064939] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[ 7450.064942] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[ 7450.064947] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[ 7450.064949] nouveau 0000:01:00.0: DRM: DCB version 4.0
[ 7450.064952] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[ 7450.064955] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00020030
[ 7450.064958] nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82 0f420030
[ 7450.064960] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62 0f420010
[ 7450.064963] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[ 7450.064965] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
[ 7450.064967] nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
[ 7450.066173] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[ 7450.066175] [drm] Driver supports precise vblank timestamp query.
[ 7450.122768] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[ 7450.213563] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x60000, =
bo
ffff8804405c4800
[ 7450.213720] fbcon: nouveaufb (fb0) is primary device
[ 7450.569182] Console: switching to colour frame buffer device 128x48
[ 7450.569972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[ 7450.587996] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[ 7479.483820] Console: switching to colour dummy device 80x25
[ 7483.096411] Console: switching to colour frame buffer device 128x48


but then after some while it hung again=20

[10425.388235] nouveau 0000:01:00.0: fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT]
[10425.388240] nouveau 0000:01:00.0: fifo: gr engine fault on channel 6,
recovering...

[11378.573422] nouveau 0000:01:00.0: java[4377]: failed to idle channel 6
[java[4377]]
[11393.574071] nouveau 0000:01:00.0: java[4377]: failed to idle channel 6
[java[4377]]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14635016391.2248bfE5.2480--

--===============0762514317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0762514317==--

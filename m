From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103351] Nouveau fails when booting with a screen
 connected to displayport since 13a86519202c5d119d83640d6f781f3181205d2c
Date: Fri, 04 May 2018 02:51:11 +0000
Message-ID: <bug-103351-8800-RaRrmk3FRO@http.bugs.freedesktop.org/>
References: <bug-103351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0091046539=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0091046539==
Content-Type: multipart/alternative; boundary="15254022710.2Ea483.12294"
Content-Transfer-Encoding: 7bit


--15254022710.2Ea483.12294
Date: Fri, 4 May 2018 02:51:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103351

--- Comment #6 from Allen Wild <allenwild93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
This still exists on 4.17-rc3 with my GTX 980 (GM204).
Reverting 13a86519202c5d119d83640d6f781f3181205d2c gets my DP monitor worki=
ng
again. (My HDMI monitor works in both cases)

The DP monitor works (low-resolution console) until nouveau is loaded, then=
 it
goes blank.

dmesg output on stock 4.17-rc3 source:
[    6.790387] fb: switching to nouveaufb from VESA VGA
[    6.800232] input: HDA Intel PCH Front Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[    6.828574] Console: switching to colour dummy device 80x25
[    6.828726] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    6.829091] input: HDA Intel PCH Rear Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input12
[    6.829150] input: HDA Intel PCH Line as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input13
[    6.829192] input: HDA Intel PCH Line Out Front as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input14
[    6.829235] input: HDA Intel PCH Line Out Surround as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input15
[    6.829276] input: HDA Intel PCH Line Out CLFE as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input16
[    6.829322] input: HDA Intel PCH Line Out Side as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input17
[    6.829369] input: HDA Intel PCH Front Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input18
[    6.841234] fuse init (API version 7.26)
[    6.888971] EXT4-fs (sdb1): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    6.911531] nouveau 0000:01:00.0: bios: version 84.04.2f.00.4b
[    6.913746] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    6.913762] nouveau 0000:01:00.0: bus: MMIO write of 8000012c FAULT at
10eb14 [ IBUS ]
[    6.976881] [TTM] Zone  kernel: Available graphics memory: 8185092 kiB
[    6.976886] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    6.976889] [TTM] Initializing pool allocator
[    6.976892] [TTM] Initializing DMA pool allocator
[    6.976902] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    6.976904] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.976907] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.976909] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    6.976911] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    6.976913] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    6.976915] nouveau 0000:01:00.0: DRM: DCB outp 02: 04811f96 04400020
[    6.976916] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011f92 00020020
[    6.976918] nouveau 0000:01:00.0: DRM: DCB outp 04: 02822f76 04400020
[    6.976920] nouveau 0000:01:00.0: DRM: DCB outp 05: 02022f72 00020020
[    6.976922] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    6.976923] nouveau 0000:01:00.0: DRM: DCB outp 07: 04844f86 04400010
[    6.976925] nouveau 0000:01:00.0: DRM: DCB outp 08: 04044f82 00020010
[    6.976927] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df6ff8 00000000
[    6.976929] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    6.976930] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    6.976932] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    6.976933] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    6.976935] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    6.976937] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000670
[    7.018129] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    7.018134] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[    7.018162] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    7.018165] [drm] Driver supports precise vblank timestamp query.
[    7.122492] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    7.138298] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.230500] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input19
[    7.230532] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input20
[    7.230556] input: HDA NVidia HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input21
[    7.230579] input: HDA NVidia HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input22
[    7.402595] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x80000, =
bo=20=20
      (ptrval)
[    7.402642] fbcon: nouveaufb (fb0) is primary device
[    7.417391] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.650543] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.835686] Console: switching to colour frame buffer device 240x67
[    7.869512] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    7.906730] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[    9.137286] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.237674] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1


dmesg with the regression-inducing commit reverted:
[    7.893930] fb: switching to nouveaufb from VESA VGA
[    8.082202] Console: switching to colour dummy device 80x25
[    8.082527] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    8.104913] fuse init (API version 7.26)
[    8.105261] intel_rapl: Found RAPL domain package
[    8.105265] intel_rapl: Found RAPL domain core
[    8.105267] intel_rapl: Found RAPL domain dram
[    8.166362] nouveau 0000:01:00.0: bios: version 84.04.2f.00.4b
[    8.168851] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    8.168875] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    8.227132] EXT4-fs (sdb1): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    8.231196] [TTM] Zone  kernel: Available graphics memory: 8185088 kiB
[    8.231199] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    8.231201] [TTM] Initializing pool allocator
[    8.231204] [TTM] Initializing DMA pool allocator
[    8.231213] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    8.231215] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    8.231218] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    8.231219] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    8.231221] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    8.231223] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    8.231225] nouveau 0000:01:00.0: DRM: DCB outp 02: 04811f96 04400020
[    8.231227] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011f92 00020020
[    8.231229] nouveau 0000:01:00.0: DRM: DCB outp 04: 02822f76 04400020
[    8.231231] nouveau 0000:01:00.0: DRM: DCB outp 05: 02022f72 00020020
[    8.231232] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    8.231234] nouveau 0000:01:00.0: DRM: DCB outp 07: 04844f86 04400010
[    8.231236] nouveau 0000:01:00.0: DRM: DCB outp 08: 04044f82 00020010
[    8.231238] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df6ff8 00000000
[    8.231239] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    8.231241] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    8.231243] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    8.231244] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    8.231246] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    8.231247] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000670
[    8.272499] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    8.272507] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[    8.272552] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    8.272557] [drm] Driver supports precise vblank timestamp query.
[    8.371715] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    8.550449] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input19
[    8.550480] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input20
[    8.550506] input: HDA NVidia HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input21
[    8.550531] input: HDA NVidia HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input22
[    8.655960] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x80000, =
bo=20=20
      (ptrval)
[    8.656719] fbcon: nouveaufb (fb0) is primary device
[    8.912908] Console: switching to colour frame buffer device 240x67
[    9.130400] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    9.160063] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

Full dmesg captures are available at
https://gist.github.com/aswild/d8fe1b9700c60452b4c9ea79b419d4ee

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15254022710.2Ea483.12294
Date: Fri, 4 May 2018 02:51:11 +0000
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
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351">bug 10335=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
allenwild93&#64;gmail.com" title=3D"Allen Wild &lt;allenwild93&#64;gmail.co=
m&gt;"> <span class=3D"fn">Allen Wild</span></a>
</span></b>
        <pre>This still exists on 4.17-rc3 with my GTX 980 (GM204).
Reverting 13a86519202c5d119d83640d6f781f3181205d2c gets my DP monitor worki=
ng
again. (My HDMI monitor works in both cases)

The DP monitor works (low-resolution console) until nouveau is loaded, then=
 it
goes blank.

dmesg output on stock 4.17-rc3 source:
[    6.790387] fb: switching to nouveaufb from VESA VGA
[    6.800232] input: HDA Intel PCH Front Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input11
[    6.828574] Console: switching to colour dummy device 80x25
[    6.828726] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    6.829091] input: HDA Intel PCH Rear Mic as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input12
[    6.829150] input: HDA Intel PCH Line as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input13
[    6.829192] input: HDA Intel PCH Line Out Front as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input14
[    6.829235] input: HDA Intel PCH Line Out Surround as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input15
[    6.829276] input: HDA Intel PCH Line Out CLFE as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input16
[    6.829322] input: HDA Intel PCH Line Out Side as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input17
[    6.829369] input: HDA Intel PCH Front Headphone as
/devices/pci0000:00/0000:00:1b.0/sound/card0/input18
[    6.841234] fuse init (API version 7.26)
[    6.888971] EXT4-fs (sdb1): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    6.911531] nouveau 0000:01:00.0: bios: version 84.04.2f.00.4b
[    6.913746] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    6.913762] nouveau 0000:01:00.0: bus: MMIO write of 8000012c FAULT at
10eb14 [ IBUS ]
[    6.976881] [TTM] Zone  kernel: Available graphics memory: 8185092 kiB
[    6.976886] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    6.976889] [TTM] Initializing pool allocator
[    6.976892] [TTM] Initializing DMA pool allocator
[    6.976902] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    6.976904] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    6.976907] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.976909] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    6.976911] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    6.976913] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    6.976915] nouveau 0000:01:00.0: DRM: DCB outp 02: 04811f96 04400020
[    6.976916] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011f92 00020020
[    6.976918] nouveau 0000:01:00.0: DRM: DCB outp 04: 02822f76 04400020
[    6.976920] nouveau 0000:01:00.0: DRM: DCB outp 05: 02022f72 00020020
[    6.976922] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    6.976923] nouveau 0000:01:00.0: DRM: DCB outp 07: 04844f86 04400010
[    6.976925] nouveau 0000:01:00.0: DRM: DCB outp 08: 04044f82 00020010
[    6.976927] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df6ff8 00000000
[    6.976929] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    6.976930] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    6.976932] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    6.976933] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    6.976935] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    6.976937] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000670
[    7.018129] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    7.018134] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[    7.018162] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    7.018165] [drm] Driver supports precise vblank timestamp query.
[    7.122492] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    7.138298] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.230500] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input19
[    7.230532] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input20
[    7.230556] input: HDA NVidia HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input21
[    7.230579] input: HDA NVidia HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input22
[    7.402595] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x80000, =
bo=20=20
      (ptrval)
[    7.402642] fbcon: nouveaufb (fb0) is primary device
[    7.417391] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.650543] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    7.835686] Console: switching to colour frame buffer device 240x67
[    7.869512] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    7.906730] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[    9.137286] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1
[   16.237674] nouveau 0000:01:00.0: DRM: DDC responded, but no EDID for DP=
-1


dmesg with the regression-inducing commit reverted:
[    7.893930] fb: switching to nouveaufb from VESA VGA
[    8.082202] Console: switching to colour dummy device 80x25
[    8.082527] nouveau 0000:01:00.0: NVIDIA GM204 (124000a1)
[    8.104913] fuse init (API version 7.26)
[    8.105261] intel_rapl: Found RAPL domain package
[    8.105265] intel_rapl: Found RAPL domain core
[    8.105267] intel_rapl: Found RAPL domain dram
[    8.166362] nouveau 0000:01:00.0: bios: version 84.04.2f.00.4b
[    8.168851] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5
[    8.168875] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 02=
2554
[ IBUS ]
[    8.227132] EXT4-fs (sdb1): mounted filesystem with ordered data mode. O=
pts:
data=3Dordered
[    8.231196] [TTM] Zone  kernel: Available graphics memory: 8185088 kiB
[    8.231199] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    8.231201] [TTM] Initializing pool allocator
[    8.231204] [TTM] Initializing DMA pool allocator
[    8.231213] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    8.231215] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    8.231218] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    8.231219] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    8.231221] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    8.231223] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    8.231225] nouveau 0000:01:00.0: DRM: DCB outp 02: 04811f96 04400020
[    8.231227] nouveau 0000:01:00.0: DRM: DCB outp 03: 04011f92 00020020
[    8.231229] nouveau 0000:01:00.0: DRM: DCB outp 04: 02822f76 04400020
[    8.231231] nouveau 0000:01:00.0: DRM: DCB outp 05: 02022f72 00020020
[    8.231232] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 00020010
[    8.231234] nouveau 0000:01:00.0: DRM: DCB outp 07: 04844f86 04400010
[    8.231236] nouveau 0000:01:00.0: DRM: DCB outp 08: 04044f82 00020010
[    8.231238] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df6ff8 00000000
[    8.231239] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    8.231241] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    8.231243] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    8.231244] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    8.231246] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    8.231247] nouveau 0000:01:00.0: DRM: DCB conn 06: 00000670
[    8.272499] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    8.272507] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[    8.272552] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    8.272557] [drm] Driver supports precise vblank timestamp query.
[    8.371715] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    8.550449] input: HDA NVidia HDMI/DP,pcm=3D3 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input19
[    8.550480] input: HDA NVidia HDMI/DP,pcm=3D7 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input20
[    8.550506] input: HDA NVidia HDMI/DP,pcm=3D8 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input21
[    8.550531] input: HDA NVidia HDMI/DP,pcm=3D9 as
/devices/pci0000:00/0000:00:01.0/0000:01:00.1/sound/card1/input22
[    8.655960] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x80000, =
bo=20=20
      (ptrval)
[    8.656719] fbcon: nouveaufb (fb0) is primary device
[    8.912908] Console: switching to colour frame buffer device 240x67
[    9.130400] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    9.160063] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

Full dmesg captures are available at
<a href=3D"https://gist.github.com/aswild/d8fe1b9700c60452b4c9ea79b419d4ee"=
>https://gist.github.com/aswild/d8fe1b9700c60452b4c9ea79b419d4ee</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15254022710.2Ea483.12294--

--===============0091046539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0091046539==--

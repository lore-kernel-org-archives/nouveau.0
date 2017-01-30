From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP, PFIFO,
 PGRAPH and PGR errors
Date: Mon, 30 Jan 2017 00:17:51 +0000
Message-ID: <bug-90453-8800-KstPWDHnbN@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1284710009=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1284710009==
Content-Type: multipart/alternative; boundary="14857354710.52848C.30434";
 charset="UTF-8"


--14857354710.52848C.30434
Date: Mon, 30 Jan 2017 00:17:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D90453

--- Comment #27 from Anthony Foiani <anthony.foiani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Seeing something very similar on my GTX 650.  Most common trigger is
`xscreensaver`, but since I have set to randomly pick one, unsure whether t=
here
is a pattern.  It also tends to trigger on full-screen video (display is
2560x1440 Dell 2713HM).

I'm using Fedora 25, and apparently Wayland:

$ echo $WAYLAND_DISPLAY
wayland-0

Let me know if I can provide any more information.  Thanks!

Linux version: `uname -a`

Linux hum 4.9.5-200.fc25.x86_64 #1 SMP Fri Jan 20 12:24:16 UTC 2017 x86_64
x86_64 x86_64 GNU/Linux

Kernel log:

-- at boot:
Jan 28 18:24:03 hum kernel: fb: switching to nouveaufb from EFI VGA
Jan 28 18:24:03 hum kernel: Console: switching to colour dummy device 80x25
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: NVIDIA GK107 (0e7060a2)
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: bios: version 80.07.35.00=
.04
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
Jan 28 18:24:03 hum kernel: [TTM] Zone  kernel: Available graphics memory:
8191232 kiB
Jan 28 18:24:03 hum kernel: [TTM] Zone   dma32: Available graphics memory:
2097152 kiB
Jan 28 18:24:03 hum kernel: [TTM] Initializing pool allocator
Jan 28 18:24:03 hum kernel: [TTM] Initializing DMA pool allocator
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2=
.0
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02
00020030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00
00000000
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82
00020030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62
00020010
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
Jan 28 18:24:03 hum kernel: [drm] Supports vblank timestamp caching Rev 2
(21.10.2013).
Jan 28 18:24:03 hum kernel: [drm] Driver supports precise vblank timestamp
query.
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for
buffer copies
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: DRM: allocated 2560x1440 =
fb:
0x60000, bo ffff95135afd4000
Jan 28 18:24:04 hum kernel: fbcon: nouveaufb (fb0) is primary device
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buff=
er
device
Jan 28 18:24:04 hum kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

-- when it locked up:
Jan 29 13:05:45 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:45 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:05:48 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:48 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:05:49 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:49 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:10:13 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:10:13 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:11:55 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:11:55 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:12:29 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:13:27 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:13:27 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:12 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:13 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:16:13 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: FB_FLUSH_TIMEOUT
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00000004
[MEMACK_EXTRA] ch 1 [003fe13000 DRM] subc 0 mthd 0020 data 00000000
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
[That repeats hundreds of times per second.]

`sudo lspci -vnn`:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce=
 GTX
650] [10de:0fc6] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Device [196e:0973]
        Flags: bus master, fast devsel, latency 0, IRQ 44
        Memory at f3000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=3D14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Packages:

Installed Packages
abrt-addon-xorg.x86_64                          2.9.0-1.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-ati.x86_64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
7.7.1-1.20160928git3fc839ff.fc25          @fedora=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-evdev.x86_64                       2.10.5-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-fbdev.x86_64                       0.4.3-25.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-intel.x86_64                       2.99.917-26.20160929.fc25=
=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-libinput.x86_64                    0.23.0-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-nouveau.x86_64                     1:1.0.13-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-openchrome.x86_64                  0.5.0-2.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-qxl.x86_64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
0.1.4-10.20160929gite13d28ee.fc25         @fedora=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-synaptics.x86_64                   1.9.0-1.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-vesa.x86_64                        2.3.2-25.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-vmware.x86_64                      13.2.1-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-wacom.x86_64                       0.34.0-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-font-utils.x86_64                      1:7.5-32.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-fonts-ISO8859-1-100dpi.noarch          7.5-16.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-proto-devel.noarch                     7.7-20.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-resutils.x86_64                        7.5-13.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-Xorg.x86_64                     1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-Xwayland.x86_64                 1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-common.x86_64                   1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-utils.x86_64                    7.7-20.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-utils.x86_64                           7.5-21.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xauth.x86_64                           1:1.0.9-5.fc24=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xinit.x86_64                           1.3.4-13.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xkb-utils.x86_64                       7.7-17.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          @fedora

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14857354710.52848C.30434
Date: Mon, 30 Jan 2017 00:17:51 +0000
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
   title=3D"NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR=
 errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90453#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] Desktop freezes &amp; PDISP, PFIFO, PGRAPH and PGR=
 errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90453">bug 90453<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
anthony.foiani&#64;gmail.com" title=3D"Anthony Foiani &lt;anthony.foiani&#6=
4;gmail.com&gt;"> <span class=3D"fn">Anthony Foiani</span></a>
</span></b>
        <pre>Seeing something very similar on my GTX 650.  Most common trig=
ger is
`xscreensaver`, but since I have set to randomly pick one, unsure whether t=
here
is a pattern.  It also tends to trigger on full-screen video (display is
2560x1440 Dell 2713HM).

I'm using Fedora 25, and apparently Wayland:

$ echo $WAYLAND_DISPLAY
wayland-0

Let me know if I can provide any more information.  Thanks!

Linux version: `uname -a`

Linux hum 4.9.5-200.fc25.x86_64 #1 SMP Fri Jan 20 12:24:16 UTC 2017 x86_64
x86_64 x86_64 GNU/Linux

Kernel log:

-- at boot:
Jan 28 18:24:03 hum kernel: fb: switching to nouveaufb from EFI VGA
Jan 28 18:24:03 hum kernel: Console: switching to colour dummy device 80x25
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: NVIDIA GK107 (0e7060a2)
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: bios: version 80.07.35.00=
.04
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: fb: 1024 MiB GDDR5
Jan 28 18:24:03 hum kernel: [TTM] Zone  kernel: Available graphics memory:
8191232 kiB
Jan 28 18:24:03 hum kernel: [TTM] Zone   dma32: Available graphics memory:
2097152 kiB
Jan 28 18:24:03 hum kernel: [TTM] Initializing pool allocator
Jan 28 18:24:03 hum kernel: [TTM] Initializing DMA pool allocator
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2=
.0
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02
00020030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00
00000000
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 08011f82
00020030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f62
00020010
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00002131
Jan 28 18:24:03 hum kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00010263
Jan 28 18:24:03 hum kernel: [drm] Supports vblank timestamp caching Rev 2
(21.10.2013).
Jan 28 18:24:03 hum kernel: [drm] Driver supports precise vblank timestamp
query.
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: DRM: MM: using COPY for
buffer copies
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: DRM: allocated 2560x1440 =
fb:
0x60000, bo ffff95135afd4000
Jan 28 18:24:04 hum kernel: fbcon: nouveaufb (fb0) is primary device
Jan 28 18:24:04 hum kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buff=
er
device
Jan 28 18:24:04 hum kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0

-- when it locked up:
Jan 29 13:05:45 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:45 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:05:48 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:48 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:05:49 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:05:49 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:10:13 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 06 []
Jan 29 13:10:13 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:11:55 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:11:55 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:12:29 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:13:27 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:13:27 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:12 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:13 hum kernel: nouveau 0000:01:00.0: fifo: SCHED_ERROR 08 []
Jan 29 13:16:13 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000004
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: FB_FLUSH_TIMEOUT
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00000004
[MEMACK_EXTRA] ch 1 [003fe13000 DRM] subc 0 mthd 0020 data 00000000
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
Jan 29 13:16:39 hum kernel: nouveau 0000:01:00.0: fifo: CHSW_ERROR 00000002
[That repeats hundreds of times per second.]

`sudo lspci -vnn`:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107 [GeForce=
 GTX
650] [10de:0fc6] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Device [196e:0973]
        Flags: bus master, fast devsel, latency 0, IRQ 44
        Memory at f3000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=3D14 &lt;?&gt;
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau

Packages:

Installed Packages
abrt-addon-xorg.x86_64                          2.9.0-1.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-ati.x86_64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
7.7.1-1.20160928git3fc839ff.fc25          &#64;fedora=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-evdev.x86_64                       2.10.5-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-fbdev.x86_64                       0.4.3-25.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-intel.x86_64                       2.99.917-26.20160929.fc25=
=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-libinput.x86_64                    0.23.0-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-nouveau.x86_64                     1:1.0.13-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-openchrome.x86_64                  0.5.0-2.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-qxl.x86_64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20
0.1.4-10.20160929gite13d28ee.fc25         &#64;fedora=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-synaptics.x86_64                   1.9.0-1.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-vesa.x86_64                        2.3.2-25.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-vmware.x86_64                      13.2.1-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-drv-wacom.x86_64                       0.34.0-1.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-font-utils.x86_64                      1:7.5-32.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-fonts-ISO8859-1-100dpi.noarch          7.5-16.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-proto-devel.noarch                     7.7-20.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-resutils.x86_64                        7.5-13.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-Xorg.x86_64                     1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-Xwayland.x86_64                 1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-common.x86_64                   1.19.1-2.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-server-utils.x86_64                    7.7-20.fc25=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-utils.x86_64                           7.5-21.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xauth.x86_64                           1:1.0.9-5.fc24=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xinit.x86_64                           1.3.4-13.fc25=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;updates=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
xorg-x11-xkb-utils.x86_64                       7.7-17.fc24=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
          &#64;fedora</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14857354710.52848C.30434--

--===============1284710009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1284710009==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] Graphics deadlock "ILLEGAL_MTHD" in nouveau
 with mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5
Date: Mon, 05 Sep 2016 07:55:22 +0000
Message-ID: <bug-97462-8800-MUxtKkZhJr@http.bugs.freedesktop.org/>
References: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2081504950=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2081504950==
Content-Type: multipart/alternative; boundary="14730621221.ffbAc.31527";
 charset="UTF-8"


--14730621221.ffbAc.31527
Date: Mon, 5 Sep 2016 07:55:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

--- Comment #8 from wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org ---
Now it became more interesting.
I "downgraded" to Jessie (clean install), 3.16.0-4, with

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

..and I still have the problem :/

The log messages are, however, different. I add some here should it help
anybody somewhat.

Starts with this:

Sep  5 09:22:08 terra kernel: [ 2751.636231] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.636289] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
^-- these two get repeated 5 times, then
Sep  5 09:22:08 terra kernel: [ 2751.641028] nouveau E[  PGRAPH][0000:01:00=
.0]
TRAP ch 5 [0x007f9ee000 Compositor[2889]]
Sep  5 09:22:08 terra kernel: [ 2751.641041] nouveau E[  PGRAPH][0000:01:00=
.0]
GPC0/PROP trap: (unknown enum 0x00000003)
Sep  5 09:22:08 terra kernel: [ 2751.641044] nouveau E[  PGRAPH][0000:01:00=
.0]
x =3D 0, y =3D 960, format =3D 0, storage type =3D 0
Sep  5 09:22:08 terra kernel: [ 2751.850711] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850717] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850732] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 c=
lass
0x9297 mthd 0x0820 data 0x20020850
Sep  5 09:22:08 terra kernel: [ 2751.850747] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850748] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x196c data 0x2003048a
Sep  5 09:22:08 terra kernel: [ 2751.850763] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 class
0x9297 mthd 0x0ff0 data 0x20164010
Sep  5 09:22:08 terra kernel: [ 2751.850777] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850781] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850793] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850795] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.641028] nouveau E[  PGRAPH][0000:01:00=
.0]
TRAP ch 5 [0x007f9ee000 Compositor[2889]]
Sep  5 09:22:08 terra kernel: [ 2751.641041] nouveau E[  PGRAPH][0000:01:00=
.0]
GPC0/PROP trap: (unknown enum 0x00000003)
Sep  5 09:22:08 terra kernel: [ 2751.641044] nouveau E[  PGRAPH][0000:01:00=
.0]
x =3D 0, y =3D 960, format =3D 0, storage type =3D 0
Sep  5 09:22:08 terra kernel: [ 2751.850711] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850717] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850732] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 c=
lass
0x9297 mthd 0x0820 data 0x20020850
Sep  5 09:22:08 terra kernel: [ 2751.850747] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850748] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x196c data 0x2003048a
Sep  5 09:22:08 terra kernel: [ 2751.850763] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 class
0x9297 mthd 0x0ff0 data 0x20164010
Sep  5 09:22:08 terra kernel: [ 2751.850777] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850781] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850793] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850795] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:23:12 terra kernel: [ 2815.401214] nouveau E[Compositor[2889]] fa=
iled
to idle channel 0xcccc0000 [Compositor[2889]]
Sep  5 09:23:27 terra kernel: [ 2830.386552] nouveau E[Compositor[2889]] fa=
iled
to idle channel 0xcccc0000 [Compositor[2889]]
Sep  5 09:23:42 terra kernel: [ 2845.635632] nouveau E[Xorg[2228]] failed to
idle channel 0xcccc0000 [Xorg[2228]]
Sep  5 09:23:57 terra kernel: [ 2860.620970] nouveau E[Xorg[2228]] failed to
idle channel 0xcccc0000 [Xorg[2228]]
Sep  5 09:23:57 terra kernel: [ 2860.621105] nouveau E[   PFIFO][0000:01:00=
.0]
read fault at 0x000001b000 [PAGE_NOT_PRESENT] from PFIFO/BAR_READ on channel
0x007fb5e000 [unknown]
Sep  5 09:24:28 terra kernel: [ 2891.693846] nouveau E[     DRM] GPU lockup=
 -
switching to software fbcon
--- then
Sep  5 09:28:28 terra kernel: [   75.733281] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 0 class
0x9297 mthd 0x2388 data 0x20010487
Sep  5 09:28:28 terra kernel: [   75.735768] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0880 data 0x200203fd
Sep  5 09:28:28 terra kernel: [   75.735793] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0884 data 0x077e0000
Sep  5 09:28:28 terra kernel: [   75.735822] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0888 data 0x03b90000
Sep  5 09:28:28 terra kernel: [   75.735852] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x088c data 0x80000671
Sep  5 09:28:28 terra kernel: [   75.735882] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0890 data 0x800004b9
Sep  5 09:28:28 terra kernel: [   75.735912] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0894 data 0x80ff0e04
Sep  5 09:28:28 terra kernel: [   75.735939] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0898 data 0x200504d0
Sep  5 09:28:28 terra kernel: [   75.735960] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x089c data 0x00008006
Sep  5 09:28:28 terra kernel: [   75.735981] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a0 data 0x00004001
Sep  5 09:28:28 terra kernel: [   75.736002] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a4 data 0x00004303
Sep  5 09:28:28 terra kernel: [   75.736022] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a8 data 0x00008006
Sep  5 09:28:28 terra kernel: [   75.736043] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08ac data 0x00004001
Sep  5 09:28:28 terra kernel: [   75.736063] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08b0 data 0x200104d6
Sep  5 09:28:28 terra kernel: [   75.736084] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08bc data 0x05520000
Sep  5 09:28:28 terra kernel: [   75.736105] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08cc data 0x2001054e
Sep  5 09:28:28 terra kernel: [   75.736126] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08d4 data 0x2003048a
Sep  5 09:28:28 terra kernel: [   75.736149] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08e0 data 0x00010001
Sep  5 09:28:28 terra kernel: [   75.736150] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS 0x00000002
Sep  5 09:28:28 terra kernel: [   75.736154] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - done 0x00000320
Sep  5 09:28:28 terra kernel: [   75.736158] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x80000000 0x00011c00 0x00000000 0x800308e0
Sep  5 09:28:28 terra kernel: [   75.736163] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x00010001 0x00000003 0x00000006 0x00000001
Sep  5 09:28:28 terra kernel: [   75.736166] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - done 0x00000300
Sep  5 09:28:28 terra kernel: [   75.736170] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x80000000 0x00005f00 0x00000000 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736174] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x00000000 0x00000000 0x00000002 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736195] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08f4 data 0x00000200
-- and --
Sep  5 09:28:28 terra kernel: [   75.736196] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS 0x00000002
Sep  5 09:28:28 terra kernel: [   75.736154] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - done 0x00000320
Sep  5 09:28:28 terra kernel: [   75.736158] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x80000000 0x00011c00 0x00000000 0x800308e0
Sep  5 09:28:28 terra kernel: [   75.736163] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x00010001 0x00000003 0x00000006 0x00000001
Sep  5 09:28:28 terra kernel: [   75.736166] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - done 0x00000300
Sep  5 09:28:28 terra kernel: [   75.736170] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x80000000 0x00005f00 0x00000000 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736174] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x00000000 0x00000000 0x00000002 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736195] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08f4 data 0x00000200
^-- this last block gets repeated with various "mthd" values and various "d=
ata"
values in the last line, and also the last value in the first "stat" dump
changes, all others seem static.

It "quickly" wrote about 1.5G into syslog.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14730621221.ffbAc.31527
Date: Mon, 5 Sep 2016 07:55:22 +0000
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
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">bug 97462<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wadev&#64;mailbox.hu" title=3D"wadev&#64;mailbox.hu">wadev&#64;mailbox.hu</=
a>
</span></b>
        <pre>Now it became more interesting.
I &quot;downgraded&quot; to Jessie (clean install), 3.16.0-4, with

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NVD9
OpenGL core profile version string: 3.3 (Core Profile) Mesa 10.3.2
OpenGL core profile shading language version string: 3.30
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

..and I still have the problem :/

The log messages are, however, different. I add some here should it help
anybody somewhat.

Starts with this:

Sep  5 09:22:08 terra kernel: [ 2751.636231] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.636289] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
^-- these two get repeated 5 times, then
Sep  5 09:22:08 terra kernel: [ 2751.641028] nouveau E[  PGRAPH][0000:01:00=
.0]
TRAP ch 5 [0x007f9ee000 Compositor[2889]]
Sep  5 09:22:08 terra kernel: [ 2751.641041] nouveau E[  PGRAPH][0000:01:00=
.0]
GPC0/PROP trap: (unknown enum 0x00000003)
Sep  5 09:22:08 terra kernel: [ 2751.641044] nouveau E[  PGRAPH][0000:01:00=
.0]
x =3D 0, y =3D 960, format =3D 0, storage type =3D 0
Sep  5 09:22:08 terra kernel: [ 2751.850711] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850717] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850732] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 c=
lass
0x9297 mthd 0x0820 data 0x20020850
Sep  5 09:22:08 terra kernel: [ 2751.850747] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850748] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x196c data 0x2003048a
Sep  5 09:22:08 terra kernel: [ 2751.850763] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 class
0x9297 mthd 0x0ff0 data 0x20164010
Sep  5 09:22:08 terra kernel: [ 2751.850777] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850781] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850793] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850795] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.641028] nouveau E[  PGRAPH][0000:01:00=
.0]
TRAP ch 5 [0x007f9ee000 Compositor[2889]]
Sep  5 09:22:08 terra kernel: [ 2751.641041] nouveau E[  PGRAPH][0000:01:00=
.0]
GPC0/PROP trap: (unknown enum 0x00000003)
Sep  5 09:22:08 terra kernel: [ 2751.641044] nouveau E[  PGRAPH][0000:01:00=
.0]
x =3D 0, y =3D 960, format =3D 0, storage type =3D 0
Sep  5 09:22:08 terra kernel: [ 2751.850711] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850717] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850732] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 c=
lass
0x9297 mthd 0x0820 data 0x20020850
Sep  5 09:22:08 terra kernel: [ 2751.850747] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850748] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x196c data 0x2003048a
Sep  5 09:22:08 terra kernel: [ 2751.850763] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2889]] subc 0 class
0x9297 mthd 0x0ff0 data 0x20164010
Sep  5 09:22:08 terra kernel: [ 2751.850777] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850781] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:22:08 terra kernel: [ 2751.850793] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: (unknown bits 0x00040000)
Sep  5 09:22:08 terra kernel: [ 2751.850795] nouveau E[   PFIFO][0000:01:00=
.0]
PBDMA0: ch 5 [Compositor[2889]] subc 0 mthd 0x0000 data 0x00000000
Sep  5 09:23:12 terra kernel: [ 2815.401214] nouveau E[Compositor[2889]] fa=
iled
to idle channel 0xcccc0000 [Compositor[2889]]
Sep  5 09:23:27 terra kernel: [ 2830.386552] nouveau E[Compositor[2889]] fa=
iled
to idle channel 0xcccc0000 [Compositor[2889]]
Sep  5 09:23:42 terra kernel: [ 2845.635632] nouveau E[Xorg[2228]] failed to
idle channel 0xcccc0000 [Xorg[2228]]
Sep  5 09:23:57 terra kernel: [ 2860.620970] nouveau E[Xorg[2228]] failed to
idle channel 0xcccc0000 [Xorg[2228]]
Sep  5 09:23:57 terra kernel: [ 2860.621105] nouveau E[   PFIFO][0000:01:00=
.0]
read fault at 0x000001b000 [PAGE_NOT_PRESENT] from PFIFO/BAR_READ on channel
0x007fb5e000 [unknown]
Sep  5 09:24:28 terra kernel: [ 2891.693846] nouveau E[     DRM] GPU lockup=
 -
switching to software fbcon
--- then
Sep  5 09:28:28 terra kernel: [   75.733281] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 0 class
0x9297 mthd 0x2388 data 0x20010487
Sep  5 09:28:28 terra kernel: [   75.735768] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0880 data 0x200203fd
Sep  5 09:28:28 terra kernel: [   75.735793] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0884 data 0x077e0000
Sep  5 09:28:28 terra kernel: [   75.735822] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x0888 data 0x03b90000
Sep  5 09:28:28 terra kernel: [   75.735852] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_BITFIELD] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 c=
lass
0x902d mthd 0x088c data 0x80000671
Sep  5 09:28:28 terra kernel: [   75.735882] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0890 data 0x800004b9
Sep  5 09:28:28 terra kernel: [   75.735912] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0894 data 0x80ff0e04
Sep  5 09:28:28 terra kernel: [   75.735939] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x0898 data 0x200504d0
Sep  5 09:28:28 terra kernel: [   75.735960] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x089c data 0x00008006
Sep  5 09:28:28 terra kernel: [   75.735981] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a0 data 0x00004001
Sep  5 09:28:28 terra kernel: [   75.736002] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a4 data 0x00004303
Sep  5 09:28:28 terra kernel: [   75.736022] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08a8 data 0x00008006
Sep  5 09:28:28 terra kernel: [   75.736043] nouveau E[  PGRAPH][0000:01:00=
.0]
ILLEGAL_MTHD ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class 0x902d mthd
0x08ac data 0x00004001
Sep  5 09:28:28 terra kernel: [   75.736063] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08b0 data 0x200104d6
Sep  5 09:28:28 terra kernel: [   75.736084] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08bc data 0x05520000
Sep  5 09:28:28 terra kernel: [   75.736105] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08cc data 0x2001054e
Sep  5 09:28:28 terra kernel: [   75.736126] nouveau E[  PGRAPH][0000:01:00=
.0]
DATA_ERROR [INVALID_VALUE] ch 5 [0x007f9ee000 Compositor[2569]] subc 3 class
0x902d mthd 0x08d4 data 0x2003048a
Sep  5 09:28:28 terra kernel: [   75.736149] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08e0 data 0x00010001
Sep  5 09:28:28 terra kernel: [   75.736150] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS 0x00000002
Sep  5 09:28:28 terra kernel: [   75.736154] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - done 0x00000320
Sep  5 09:28:28 terra kernel: [   75.736158] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x80000000 0x00011c00 0x00000000 0x800308e0
Sep  5 09:28:28 terra kernel: [   75.736163] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x00010001 0x00000003 0x00000006 0x00000001
Sep  5 09:28:28 terra kernel: [   75.736166] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - done 0x00000300
Sep  5 09:28:28 terra kernel: [   75.736170] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x80000000 0x00005f00 0x00000000 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736174] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x00000000 0x00000000 0x00000002 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736195] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08f4 data 0x00000200
-- and --
Sep  5 09:28:28 terra kernel: [   75.736196] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS 0x00000002
Sep  5 09:28:28 terra kernel: [   75.736154] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - done 0x00000320
Sep  5 09:28:28 terra kernel: [   75.736158] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x80000000 0x00011c00 0x00000000 0x800308e0
Sep  5 09:28:28 terra kernel: [   75.736163] nouveau E[  PGRAPH][0000:01:00=
.0]
409000 - stat 0x00010001 0x00000003 0x00000006 0x00000001
Sep  5 09:28:28 terra kernel: [   75.736166] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - done 0x00000300
Sep  5 09:28:28 terra kernel: [   75.736170] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x80000000 0x00005f00 0x00000000 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736174] nouveau E[  PGRAPH][0000:01:00=
.0]
502000 - stat 0x00000000 0x00000000 0x00000002 0x00000000
Sep  5 09:28:28 terra kernel: [   75.736195] nouveau E[  PGRAPH][0000:01:00=
.0]
FECS MTHD subc 3 class 0x0000 mthd 0x08f4 data 0x00000200
^-- this last block gets repeated with various &quot;mthd&quot; values and =
various &quot;data&quot;
values in the last line, and also the last value in the first &quot;stat&qu=
ot; dump
changes, all others seem static.

It &quot;quickly&quot; wrote about 1.5G into syslog.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14730621221.ffbAc.31527--

--===============2081504950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2081504950==--

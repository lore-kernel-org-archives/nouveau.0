From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99202] New: system freeze - fifo: SCHED_ERROR 0a
 [CTXSW_TIMEOUT] - MULTIPLE_WARP_ERRORS - DATA_ERROR 00000004
 [INVALID_VALUE] - ILLEGAL_CLASS ch 11 - RT_STORAGE_TYPE_MISMATCH -
 CLASS_SUBCH_MISMATCH
Date: Mon, 26 Dec 2016 16:53:38 +0000
Message-ID: <bug-99202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1389153508=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1389153508==
Content-Type: multipart/alternative; boundary="14827712180.CdBA.26080";
 charset="UTF-8"


--14827712180.CdBA.26080
Date: Mon, 26 Dec 2016 16:53:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99202

            Bug ID: 99202
           Summary: system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] -
                    MULTIPLE_WARP_ERRORS - DATA_ERROR 00000004
                    [INVALID_VALUE] - ILLEGAL_CLASS ch 11 -
                    RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: as.newsletter-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

This might be related to https://bugs.freedesktop.org/show_bug.cgi?id=3D936=
29 but
a few things are different.

The screen freezes except for that the mouse pointer can be used (click has=
 no
effect). Apart from the magic syskeys (sync, unmount, boot) the keyboard
doesn't react.
I can not use ALT-tab to switch to another program. I can not leave the game
(fullscreen mode) by using the ingame console or using ALT-F4. The mouse
pointer is trapped on the monitor where the game runs (I have two). The sou=
nd
keeps playing and sound effects are played now and then too.
I tried to get to the terminals via CTRL-ALT-F[1-6] but nothing happens.
Switching (KDE) desktops via CTRL-ALT-[arrow-left,arrow-right] is just the
same.

So far the problem happed when I used app-emulation/wine to play a game (na=
mely
MassEffect 2, I haven't tried others) and once when I used firefoy (maybe w=
hen
using youtube). It happens unexpectedly, at least I didn't find a pattern.
I downgraded to xf86-video-nouveau-1.0.12 - seems like it happens less ofte=
n.
Once when using firefox (probably watching a video).

Dec 15 15:12:38 [kernel] [ 6197.881567] nouveau 0000:03:00.0: gr: GPC3/PROP
trap: 00000004 [] x =3D 1968, y =3D 992, format =3D 0, storage type =3D 0
[...]
Dec 18 03:20:57 [kernel] [97585.789880] nouveau 0000:03:00.0: fifo: read fa=
ult
at 0000441000 engine 00 [GR] client 10 [PD] reason 02 [PTE] on channel 11
[017e507000 MassEffect2.exe[18715]]
Dec 18 03:20:57 [kernel] [97585.789883] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 11, recovering...
Dec 18 03:21:46 [kernel] [97635.048675] sysrq: SysRq : Emergency Sync
Dec 18 03:21:46 [kernel] [97635.049024] Emergency Sync complete
[...]
Dec 18 17:57:52 [kernel] [ 7553.852044] nouveau 0000:03:00.0: gr: TRAP ch 13
[017e107000 MassEffect2.exe[10678]]
Dec 18 17:57:52 [kernel] [ 7553.852056] nouveau 0000:03:00.0: gr: GPC0/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852067] nouveau 0000:03:00.0: gr: GPC1/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852078] nouveau 0000:03:00.0: gr: GPC2/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852086] nouveau 0000:03:00.0: gr: GPC2/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852097] nouveau 0000:03:00.0: gr: GPC3/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852105] nouveau 0000:03:00.0: gr: GPC3/TPC1=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852114] nouveau 0000:03:00.0: gr: GPC3/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852125] nouveau 0000:03:00.0: gr: GPC4/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852133] nouveau 0000:03:00.0: gr: GPC4/TPC1=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852142] nouveau 0000:03:00.0: gr: GPC4/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852158] nouveau 0000:03:00.0: gr: TRAP ch 13
[017e107000 MassEffect2.exe[10678]]
Dec 18 17:57:52 [kernel] [ 7553.852168] nouveau 0000:03:00.0: gr: GPC0/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 1000d [OOR_REG]
Dec 18 17:57:57 [kernel] [ 7558.147983] nouveau 0000:03:00.0: fifo: SCHED_E=
RROR
0a [CTXSW_TIMEOUT]
Dec 18 17:57:57 [kernel] [ 7558.147987] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 2, recovering...
Dec 18 17:59:01 [CROND] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hour=
ly)
[...]
Dec 18 20:43:22 [kernel] [ 6788.582706] nouveau 0000:03:00.0: gr: TRAP ch 12
[017e348000 MassEffect2.exe[19526]]
Dec 18 20:43:22 [kernel] [ 6788.582719] nouveau 0000:03:00.0: gr: GPC3/PROP
trap: 00000100 [RT_STORAGE_TYPE_MISMATCH] x =3D 48, y =3D 4, format =3D 2a,=
 storage
type =3D e6
Dec 18 20:43:26 [kernel] [ 6792.878268] nouveau 0000:03:00.0: fifo: SCHED_E=
RROR
0a [CTXSW_TIMEOUT]
Dec 18 20:43:26 [kernel] [ 6792.878271] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 2, recovering..=20
[...]
Dec 21 21:19:08 [kernel] [54341.955480] nouveau 0000:03:00.0: fifo: PBDMA0:
00040000 [PBENTRY] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0000 data
00000000
Dec 21 21:19:08 [kernel] [54341.955500] nouveau 0000:03:00.0: gr: DATA_ERROR
00000004 [INVALID_VALUE] ch 11 [017efba000 firefox[17446]] subc 0 class a197
mthd 2380 data 00000040
Dec 21 21:19:08 [kernel] [54342.174931] nouveau 0000:03:00.0: gr: TRAP ch 11
[017efba000 firefox[17446]]
Dec 21 21:19:08 [kernel] [54342.174938] nouveau 0000:03:00.0: gr: DISPATCH
80000002 [CLASS_SUBCH_MISMATCH]
Dec 21 21:19:08 [kernel] [54342.174953] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 000c data
00000000
Dec 21 21:19:08 [kernel] [54342.175025] nouveau 0000:03:00.0: fifo: PBDMA0:
02000000 [SEMAPHORE] ch 11 [017efba000 firefox[17446]] subc 0 mthd 001c data
00000000
Dec 21 21:19:08 [kernel] [54342.175084] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0030 data
43000000
Dec 21 21:19:08 [kernel] [54342.175102] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0034 data
00000000
Dec 21 21:19:08 [kernel] [54342.175121] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0038 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175139] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 003c data
00000000
Dec 21 21:19:08 [kernel] [54342.175157] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0040 data
00000000
Dec 21 21:19:08 [kernel] [54342.175175] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0044 data
00000000
Dec 21 21:19:08 [kernel] [54342.175193] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0048 data
00000000
Dec 21 21:19:08 [kernel] [54342.175211] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 004c data
3f800000
Dec 21 21:19:08 [kernel] [54342.175296] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0054 data
00000000
Dec 21 21:19:08 [kernel] [54342.175323] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0058 data
00000000
Dec 21 21:19:08 [kernel] [54342.175350] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 005c data
00000000
Dec 21 21:19:08 [kernel] [54342.175376] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0060 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175403] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0064 data
00000000
Dec 21 21:19:08 [kernel] [54342.175429] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0068 data
00000000
Dec 21 21:19:08 [kernel] [54342.175452] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 006c data
00000000
Dec 21 21:19:08 [kernel] [54342.175475] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0070 data
00000000
Dec 21 21:19:08 [kernel] [54342.175517] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0074 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175541] nouveau 0000:03:00.0: fifo: PBDMA0:
00400000 [METHODCRC] ch 11 [017efba000 firefox[17446]] subc 0 mthd 007c data
00000000
Dec 21 21:19:08 [kernel] [54342.175563] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0084 data
00000000
[...]
Dec 21 21:19:08 [kernel] [54342.176189] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 00f8 data
00000800
Dec 21 21:19:08 [kernel] [54342.176211] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 00fc data
00000000
Dec 21 21:19:08 [kernel] [54342.176229] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0100 data 004e2000
Dec 21 21:19:08 [kernel] [54342.176244] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0104 data 200208e3
Dec 21 21:19:08 [kernel] [54342.176258] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0108 data 00000020
Dec 21 21:19:08 [kernel] [54342.176270] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 010c data 0000000b
Dec 21 21:19:08 [kernel] [54342.176285] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0110 data 20030700
Dec 21 21:19:08 [kernel] [54342.176300] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0114 data 00001010
[...]
Dec 21 21:20:09 [kernel] [54402.836602] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 2644 data ef584f57
Dec 21 21:20:09 [kernel] [54402.836618] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 2648 data 00000002
Dec 21 21:20:09 [kernel] [54402.836635] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 264c data 00000000
Dec 21 21:21:15 [kernel] [54468.854863] sysrq: SysRq : Emergency Sync


03:00.0 VGA compatible controller: NVIDIA Corporation GK110B [GeForce GTX T=
ITAN
Z] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: eVga.com. Corp. GK110B [GeForce GTX TITAN Z]
        Flags: bus master, fast devsel, latency 0, IRQ 34
        Memory at f8000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at ee000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at cf00 [size=3D128]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau

x11-drivers/xf86-video-nouveau
     IUSE (alle Versionen):  glamor
     Installierte Versionen: Version:   1.0.12

$> emerge --info | head -n3
Portage 2.3.3 (python 2.7.12-final-0, default/linux/amd64/13.0/desktop/plas=
ma,
gcc-4.9.3, glibc-2.23-r3, 4.8.2-gentoo_M16 x86_64)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
System uname:
Linux-4.8.2-gentoo_M16-x86_64-Intel-R-_Core-TM-_i7_CPU_870_@_2.93GHz-with-g=
entoo-2.3

$> USE=3D"opengl"; for PKG in $(equery -q hasuse $USE); do echo $PKG: $(equ=
ery -q
uses $PKG |grep $USE); done | head -n 2
app-emulation/qemu-2.7.0-r7: +opengl
app-emulation/wine-1.9.20: +opengl

# opencl is builtin for mesa and wine
$> USE=3D"opencl"; for PKG in $(equery -q hasuse $USE); do echo $PKG: $(equ=
ery -q
uses $PKG |grep $USE); done | head -n 2
app-emulation/wine-1.9.20: +opencl
media-libs/mesa-13.0.2: +opencl

# downgrading wine didn't help
$> eix app-emulation/wine$ | grep -i install
     installed Versions: Version:   1.9.20^t

$> eix firefox$
     installed Versions: Version:   50.1.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14827712180.CdBA.26080
Date: Mon, 26 Dec 2016 16:53:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MU=
LTIPLE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch=
 11 - RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99202">99202</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>system freeze - fifo: SCHED_ERROR 0a [CTXSW_TIMEOUT] - MULTIP=
LE_WARP_ERRORS - DATA_ERROR 00000004 [INVALID_VALUE] - ILLEGAL_CLASS ch 11 =
- RT_STORAGE_TYPE_MISMATCH - CLASS_SUBCH_MISMATCH
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>as.newsletter&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>This might be related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"show_bug.cgi?id=3D93629">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D93629</a> but
a few things are different.

The screen freezes except for that the mouse pointer can be used (click has=
 no
effect). Apart from the magic syskeys (sync, unmount, boot) the keyboard
doesn't react.
I can not use ALT-tab to switch to another program. I can not leave the game
(fullscreen mode) by using the ingame console or using ALT-F4. The mouse
pointer is trapped on the monitor where the game runs (I have two). The sou=
nd
keeps playing and sound effects are played now and then too.
I tried to get to the terminals via CTRL-ALT-F[1-6] but nothing happens.
Switching (KDE) desktops via CTRL-ALT-[arrow-left,arrow-right] is just the
same.

So far the problem happed when I used app-emulation/wine to play a game (na=
mely
MassEffect 2, I haven't tried others) and once when I used firefoy (maybe w=
hen
using youtube). It happens unexpectedly, at least I didn't find a pattern.
I downgraded to xf86-video-nouveau-1.0.12 - seems like it happens less ofte=
n.
Once when using firefox (probably watching a video).

Dec 15 15:12:38 [kernel] [ 6197.881567] nouveau 0000:03:00.0: gr: GPC3/PROP
trap: 00000004 [] x =3D 1968, y =3D 992, format =3D 0, storage type =3D 0
[...]
Dec 18 03:20:57 [kernel] [97585.789880] nouveau 0000:03:00.0: fifo: read fa=
ult
at 0000441000 engine 00 [GR] client 10 [PD] reason 02 [PTE] on channel 11
[017e507000 MassEffect2.exe[18715]]
Dec 18 03:20:57 [kernel] [97585.789883] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 11, recovering...
Dec 18 03:21:46 [kernel] [97635.048675] sysrq: SysRq : Emergency Sync
Dec 18 03:21:46 [kernel] [97635.049024] Emergency Sync complete
[...]
Dec 18 17:57:52 [kernel] [ 7553.852044] nouveau 0000:03:00.0: gr: TRAP ch 13
[017e107000 MassEffect2.exe[10678]]
Dec 18 17:57:52 [kernel] [ 7553.852056] nouveau 0000:03:00.0: gr: GPC0/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852067] nouveau 0000:03:00.0: gr: GPC1/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852078] nouveau 0000:03:00.0: gr: GPC2/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852086] nouveau 0000:03:00.0: gr: GPC2/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3e000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852097] nouveau 0000:03:00.0: gr: GPC3/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852105] nouveau 0000:03:00.0: gr: GPC3/TPC1=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852114] nouveau 0000:03:00.0: gr: GPC3/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852125] nouveau 0000:03:00.0: gr: GPC4/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852133] nouveau 0000:03:00.0: gr: GPC4/TPC1=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3d000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852142] nouveau 0000:03:00.0: gr: GPC4/TPC2=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3c000d [OOR_REG]
Dec 18 17:57:52 [kernel] [ 7553.852158] nouveau 0000:03:00.0: gr: TRAP ch 13
[017e107000 MassEffect2.exe[10678]]
Dec 18 17:57:52 [kernel] [ 7553.852168] nouveau 0000:03:00.0: gr: GPC0/TPC0=
/MP
trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 1000d [OOR_REG]
Dec 18 17:57:57 [kernel] [ 7558.147983] nouveau 0000:03:00.0: fifo: SCHED_E=
RROR
0a [CTXSW_TIMEOUT]
Dec 18 17:57:57 [kernel] [ 7558.147987] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 2, recovering...
Dec 18 17:59:01 [CROND] (root) CMD (rm -f /var/spool/cron/lastrun/cron.hour=
ly)
[...]
Dec 18 20:43:22 [kernel] [ 6788.582706] nouveau 0000:03:00.0: gr: TRAP ch 12
[017e348000 MassEffect2.exe[19526]]
Dec 18 20:43:22 [kernel] [ 6788.582719] nouveau 0000:03:00.0: gr: GPC3/PROP
trap: 00000100 [RT_STORAGE_TYPE_MISMATCH] x =3D 48, y =3D 4, format =3D 2a,=
 storage
type =3D e6
Dec 18 20:43:26 [kernel] [ 6792.878268] nouveau 0000:03:00.0: fifo: SCHED_E=
RROR
0a [CTXSW_TIMEOUT]
Dec 18 20:43:26 [kernel] [ 6792.878271] nouveau 0000:03:00.0: fifo: gr engi=
ne
fault on channel 2, recovering..=20
[...]
Dec 21 21:19:08 [kernel] [54341.955480] nouveau 0000:03:00.0: fifo: PBDMA0:
00040000 [PBENTRY] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0000 data
00000000
Dec 21 21:19:08 [kernel] [54341.955500] nouveau 0000:03:00.0: gr: DATA_ERROR
00000004 [INVALID_VALUE] ch 11 [017efba000 firefox[17446]] subc 0 class a197
mthd 2380 data 00000040
Dec 21 21:19:08 [kernel] [54342.174931] nouveau 0000:03:00.0: gr: TRAP ch 11
[017efba000 firefox[17446]]
Dec 21 21:19:08 [kernel] [54342.174938] nouveau 0000:03:00.0: gr: DISPATCH
80000002 [CLASS_SUBCH_MISMATCH]
Dec 21 21:19:08 [kernel] [54342.174953] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 000c data
00000000
Dec 21 21:19:08 [kernel] [54342.175025] nouveau 0000:03:00.0: fifo: PBDMA0:
02000000 [SEMAPHORE] ch 11 [017efba000 firefox[17446]] subc 0 mthd 001c data
00000000
Dec 21 21:19:08 [kernel] [54342.175084] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0030 data
43000000
Dec 21 21:19:08 [kernel] [54342.175102] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0034 data
00000000
Dec 21 21:19:08 [kernel] [54342.175121] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0038 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175139] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 003c data
00000000
Dec 21 21:19:08 [kernel] [54342.175157] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0040 data
00000000
Dec 21 21:19:08 [kernel] [54342.175175] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0044 data
00000000
Dec 21 21:19:08 [kernel] [54342.175193] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0048 data
00000000
Dec 21 21:19:08 [kernel] [54342.175211] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 004c data
3f800000
Dec 21 21:19:08 [kernel] [54342.175296] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0054 data
00000000
Dec 21 21:19:08 [kernel] [54342.175323] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0058 data
00000000
Dec 21 21:19:08 [kernel] [54342.175350] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 005c data
00000000
Dec 21 21:19:08 [kernel] [54342.175376] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0060 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175403] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0064 data
00000000
Dec 21 21:19:08 [kernel] [54342.175429] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0068 data
00000000
Dec 21 21:19:08 [kernel] [54342.175452] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 006c data
00000000
Dec 21 21:19:08 [kernel] [54342.175475] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0070 data
00000000
Dec 21 21:19:08 [kernel] [54342.175517] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0074 data
3f800000
Dec 21 21:19:08 [kernel] [54342.175541] nouveau 0000:03:00.0: fifo: PBDMA0:
00400000 [METHODCRC] ch 11 [017efba000 firefox[17446]] subc 0 mthd 007c data
00000000
Dec 21 21:19:08 [kernel] [54342.175563] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 0084 data
00000000
[...]
Dec 21 21:19:08 [kernel] [54342.176189] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 00f8 data
00000800
Dec 21 21:19:08 [kernel] [54342.176211] nouveau 0000:03:00.0: fifo: PBDMA0:
00200000 [METHOD] ch 11 [017efba000 firefox[17446]] subc 0 mthd 00fc data
00000000
Dec 21 21:19:08 [kernel] [54342.176229] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0100 data 004e2000
Dec 21 21:19:08 [kernel] [54342.176244] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0104 data 200208e3
Dec 21 21:19:08 [kernel] [54342.176258] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0108 data 00000020
Dec 21 21:19:08 [kernel] [54342.176270] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 010c data 0000000b
Dec 21 21:19:08 [kernel] [54342.176285] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0110 data 20030700
Dec 21 21:19:08 [kernel] [54342.176300] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 0114 data 00001010
[...]
Dec 21 21:20:09 [kernel] [54402.836602] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 2644 data ef584f57
Dec 21 21:20:09 [kernel] [54402.836618] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 2648 data 00000002
Dec 21 21:20:09 [kernel] [54402.836635] nouveau 0000:03:00.0: gr: ILLEGAL_C=
LASS
ch 11 [017efba000 firefox[17446]] subc 0 class 0000 mthd 264c data 00000000
Dec 21 21:21:15 [kernel] [54468.854863] sysrq: SysRq : Emergency Sync


03:00.0 VGA compatible controller: NVIDIA Corporation GK110B [GeForce GTX T=
ITAN
Z] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: eVga.com. Corp. GK110B [GeForce GTX TITAN Z]
        Flags: bus master, fast devsel, latency 0, IRQ 34
        Memory at f8000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D128M]
        Memory at ee000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at cf00 [size=3D128]
        [virtual] Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau

x11-drivers/xf86-video-nouveau
     IUSE (alle Versionen):  glamor
     Installierte Versionen: Version:   1.0.12

$&gt; emerge --info | head -n3
Portage 2.3.3 (python 2.7.12-final-0, default/linux/amd64/13.0/desktop/plas=
ma,
gcc-4.9.3, glibc-2.23-r3, 4.8.2-gentoo_M16 x86_64)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
System uname:
<a href=3D"mailto:Linux-4.8.2-gentoo_M16-x86_64-Intel-R-_Core-TM-_i7_CPU_87=
0_&#64;_2.93GHz-with-gentoo-2.3">Linux-4.8.2-gentoo_M16-x86_64-Intel-R-_Cor=
e-TM-_i7_CPU_870_&#64;_2.93GHz-with-gentoo-2.3</a>

$&gt; USE=3D&quot;opengl&quot;; for PKG in $(equery -q hasuse $USE); do ech=
o $PKG: $(equery -q
uses $PKG |grep $USE); done | head -n 2
app-emulation/qemu-2.7.0-r7: +opengl
app-emulation/wine-1.9.20: +opengl

# opencl is builtin for mesa and wine
$&gt; USE=3D&quot;opencl&quot;; for PKG in $(equery -q hasuse $USE); do ech=
o $PKG: $(equery -q
uses $PKG |grep $USE); done | head -n 2
app-emulation/wine-1.9.20: +opencl
media-libs/mesa-13.0.2: +opencl

# downgrading wine didn't help
$&gt; eix app-emulation/wine$ | grep -i install
     installed Versions: Version:   1.9.20^t

$&gt; eix firefox$
     installed Versions: Version:   50.1.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14827712180.CdBA.26080--

--===============1389153508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1389153508==--

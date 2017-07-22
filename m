From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Sat, 22 Jul 2017 10:40:35 +0000
Message-ID: <bug-94990-8800-WwhRu9uxvl@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2049295384=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2049295384==
Content-Type: multipart/alternative; boundary="15007200366.c32E5f.24603";
 charset="UTF-8"


--15007200366.c32E5f.24603
Date: Sat, 22 Jul 2017 10:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #127 from fariouche-Qt13gs6zZMY@public.gmane.org ---
Hi,

I finally tried the 4.12.2 kernel, and in my case it does not fully work :(

I can see a working console, but:
- only on my first monitor (DVI)
- no x11 (I can see a brief display of xfce4 but immediately turns black an=
d no
more display, even if I return to the console.)

I think I'm facing 2 different issues. One is about detecting my second mon=
itor
(a 4K LG 31MU97 plugged on DP-0 (this display is maybe a bit slow to probe))
The log shows a lot of error concerning this monitor...

But I do not see anything on my third output too (HDMI, this is an av recei=
ver,
with a full HD tv). No error at all for this one, even the resolution is pr=
obed
correctly by xorg.


The kernel log shows an EDID error for the LG monitor...
[    1.065917] ACPI: Power Button [PWRF]
[    1.066154] Monitor-Mwait will be used to enter C-1 state
[    1.066158] Monitor-Mwait will be used to enter C-2 state
[    1.066161] Monitor-Mwait will be used to enter C-3 state
[    1.067170] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    1.067386] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.067877] Non-volatile memory driver v1.3
[    1.068132] Linux agpgart interface v0.103
[    1.068546] nouveau 0000:03:00.0: NVIDIA GM204 (124020a1)
[    1.158533] nouveau 0000:03:00.0: bios: version 84.04.36.00.0b
[    1.158944] nouveau 0000:03:00.0: disp: dcb 15 type 8 unknown
[    1.159616] nouveau 0000:03:00.0: fb: 4096 MiB GDDR5
[    1.159794] nouveau 0000:03:00.0: bus: MMIO write of 80000159 FAULT at
10eb14 [ IBUS ]
[    1.168074] [TTM] Zone  kernel: Available graphics memory: 8214682 kiB
[    1.168244] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.168410] [TTM] Initializing pool allocator
[    1.168576] [TTM] Initializing DMA pool allocator
[    1.168830] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    1.168995] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    1.169161] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    1.169327] nouveau 0000:03:00.0: DRM: DCB version 4.1
[    1.169492] nouveau 0000:03:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.169666] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.169838] nouveau 0000:03:00.0: DRM: DCB outp 02: 02811f76 04400020
[    1.170004] nouveau 0000:03:00.0: DRM: DCB outp 03: 02011f72 00020020
[    1.170170] nouveau 0000:03:00.0: DRM: DCB outp 04: 04822f86 04400010
[    1.170337] nouveau 0000:03:00.0: DRM: DCB outp 05: 04022f82 00020010
[    1.170504] nouveau 0000:03:00.0: DRM: DCB outp 06: 04833f96 04400020
[    1.170678] nouveau 0000:03:00.0: DRM: DCB outp 07: 04033f92 00020020
[    1.170848] nouveau 0000:03:00.0: DRM: DCB outp 08: 02044f62 00020010
[    1.171015] nouveau 0000:03:00.0: DRM: DCB outp 15: 01df5ff8 00000000
[    1.171181] nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
[    1.171347] nouveau 0000:03:00.0: DRM: DCB conn 01: 00020146
[    1.171511] nouveau 0000:03:00.0: DRM: DCB conn 02: 01000246
[    1.171684] nouveau 0000:03:00.0: DRM: DCB conn 03: 02000346
[    1.171853] nouveau 0000:03:00.0: DRM: DCB conn 04: 00010461
[    1.172018] nouveau 0000:03:00.0: DRM: DCB conn 05: 00000570
[    1.172183] nouveau 0000:03:00.0: DRM: Pointer to flat panel table inval=
id
[    1.214711] random: fast init done
[    1.233460] nouveau 0000:03:00.0: DRM: unknown connector type 70
[    1.233662] nouveau 0000:03:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.233834] nouveau 0000:03:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.234034] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.234207] [drm] Driver supports precise vblank timestamp query.
[    1.276832] nouveau 0000:03:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    1.343188] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    1.434201] nouveau 0000:03:00.0: DP-1: EDID is invalid:
[    1.434384]  [00] BAD  03 12 71 45 10 04 03 01 00 23 09 07 07 83 01 00
[    1.434568]  [00] BAD  00 02 3a 80 18 71 38 2d 40 58 2c 45 00 b8 6f 21
[    1.434759]  [00] BAD  00 00 1e 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.434939]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435121]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435301]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435482]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435670]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 44 00
[    1.435855] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    1.706882] nouveau 0000:03:00.0: DRM: allocated 1920x1200 fb: 0x60000, =
bo
ffff88041cec5800
[    1.707396] fbcon: nouveaufb (fb0) is primary device
[    1.798548] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.068735] tsc: Refined TSC clocksource calibration: 3197.726 MHz
[    2.068740] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2e17e64edfb, max_idle_ns: 440795351804 ns
[    2.090622] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.481844] Console: switching to colour frame buffer device 200x67
[    2.501851] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[    2.501864] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on
minor 0



When switching to x11, I see the following errors:
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar dbus[4361]: [system] Activating service
name=3D'org.freedesktop.UPower' (using servicehelper)
Jul 22 12:15:42 Quazar dbus[4361]: [system] Successfully activated service
'org.freedesktop.UPower'
Jul 22 12:15:42 Quazar polkitd[4433]: Registered Authentication Agent for
unix-session:/org/freedesktop/ConsoleKit/Session1 (system bus name :1.8
[/usr/libexec/polkit-gnome-authentication-agent-1], object path
/org/gnome/PolicyKit1/AuthenticationAgent, locale en_US.utf8)
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c814 [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: disp: intr24 80000000
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c930 [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c9b0 [ IBUS ]
.......
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c9bc [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: disp: outp 02:0006:0f8=
2:
link training failed
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c92c [ IBUS ]
Jul 22 12:15:44 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:46 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:48 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:15:48 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 690400 [ IBUS TIMEOUT ]
Jul 22 12:15:50 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:52 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout



I can attach all the relevant logs.

Any idea? Maybe this belongs to an other bug?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15007200366.c32E5f.24603
Date: Sat, 22 Jul 2017 10:40:36 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c127">Comme=
nt # 127</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fariouche&#64;yahoo.fr" title=3D"fariouche&#64;yahoo.fr">fariouche&#64;yaho=
o.fr</a>
</span></b>
        <pre>Hi,

I finally tried the 4.12.2 kernel, and in my case it does not fully work :(

I can see a working console, but:
- only on my first monitor (DVI)
- no x11 (I can see a brief display of xfce4 but immediately turns black an=
d no
more display, even if I return to the console.)

I think I'm facing 2 different issues. One is about detecting my second mon=
itor
(a 4K LG 31MU97 plugged on DP-0 (this display is maybe a bit slow to probe))
The log shows a lot of error concerning this monitor...

But I do not see anything on my third output too (HDMI, this is an av recei=
ver,
with a full HD tv). No error at all for this one, even the resolution is pr=
obed
correctly by xorg.


The kernel log shows an EDID error for the LG monitor...
[    1.065917] ACPI: Power Button [PWRF]
[    1.066154] Monitor-Mwait will be used to enter C-1 state
[    1.066158] Monitor-Mwait will be used to enter C-2 state
[    1.066161] Monitor-Mwait will be used to enter C-3 state
[    1.067170] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    1.067386] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.067877] Non-volatile memory driver v1.3
[    1.068132] Linux agpgart interface v0.103
[    1.068546] nouveau 0000:03:00.0: NVIDIA GM204 (124020a1)
[    1.158533] nouveau 0000:03:00.0: bios: version 84.04.36.00.0b
[    1.158944] nouveau 0000:03:00.0: disp: dcb 15 type 8 unknown
[    1.159616] nouveau 0000:03:00.0: fb: 4096 MiB GDDR5
[    1.159794] nouveau 0000:03:00.0: bus: MMIO write of 80000159 FAULT at
10eb14 [ IBUS ]
[    1.168074] [TTM] Zone  kernel: Available graphics memory: 8214682 kiB
[    1.168244] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.168410] [TTM] Initializing pool allocator
[    1.168576] [TTM] Initializing DMA pool allocator
[    1.168830] nouveau 0000:03:00.0: DRM: VRAM: 4096 MiB
[    1.168995] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    1.169161] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    1.169327] nouveau 0000:03:00.0: DRM: DCB version 4.1
[    1.169492] nouveau 0000:03:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.169666] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.169838] nouveau 0000:03:00.0: DRM: DCB outp 02: 02811f76 04400020
[    1.170004] nouveau 0000:03:00.0: DRM: DCB outp 03: 02011f72 00020020
[    1.170170] nouveau 0000:03:00.0: DRM: DCB outp 04: 04822f86 04400010
[    1.170337] nouveau 0000:03:00.0: DRM: DCB outp 05: 04022f82 00020010
[    1.170504] nouveau 0000:03:00.0: DRM: DCB outp 06: 04833f96 04400020
[    1.170678] nouveau 0000:03:00.0: DRM: DCB outp 07: 04033f92 00020020
[    1.170848] nouveau 0000:03:00.0: DRM: DCB outp 08: 02044f62 00020010
[    1.171015] nouveau 0000:03:00.0: DRM: DCB outp 15: 01df5ff8 00000000
[    1.171181] nouveau 0000:03:00.0: DRM: DCB conn 00: 00001030
[    1.171347] nouveau 0000:03:00.0: DRM: DCB conn 01: 00020146
[    1.171511] nouveau 0000:03:00.0: DRM: DCB conn 02: 01000246
[    1.171684] nouveau 0000:03:00.0: DRM: DCB conn 03: 02000346
[    1.171853] nouveau 0000:03:00.0: DRM: DCB conn 04: 00010461
[    1.172018] nouveau 0000:03:00.0: DRM: DCB conn 05: 00000570
[    1.172183] nouveau 0000:03:00.0: DRM: Pointer to flat panel table inval=
id
[    1.214711] random: fast init done
[    1.233460] nouveau 0000:03:00.0: DRM: unknown connector type 70
[    1.233662] nouveau 0000:03:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.233834] nouveau 0000:03:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.234034] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.234207] [drm] Driver supports precise vblank timestamp query.
[    1.276832] nouveau 0000:03:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    1.343188] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    1.434201] nouveau 0000:03:00.0: DP-1: EDID is invalid:
[    1.434384]  [00] BAD  03 12 71 45 10 04 03 01 00 23 09 07 07 83 01 00
[    1.434568]  [00] BAD  00 02 3a 80 18 71 38 2d 40 58 2c 45 00 b8 6f 21
[    1.434759]  [00] BAD  00 00 1e 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.434939]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435121]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435301]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435482]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    1.435670]  [00] BAD  00 00 00 00 00 00 00 00 00 00 00 00 00 00 44 00
[    1.435855] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    1.706882] nouveau 0000:03:00.0: DRM: allocated 1920x1200 fb: 0x60000, =
bo
ffff88041cec5800
[    1.707396] fbcon: nouveaufb (fb0) is primary device
[    1.798548] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.068735] tsc: Refined TSC clocksource calibration: 3197.726 MHz
[    2.068740] clocksource: tsc: mask: 0xffffffffffffffff max_cycles:
0x2e17e64edfb, max_idle_ns: 440795351804 ns
[    2.090622] nouveau 0000:03:00.0: DRM: DDC responded, but no EDID for DP=
-1
[    2.481844] Console: switching to colour frame buffer device 200x67
[    2.501851] nouveau 0000:03:00.0: fb0: nouveaufb frame buffer device
[    2.501864] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on
minor 0



When switching to x11, I see the following errors:
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:40 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: DRM: DDC responded, bu=
t no
EDID for DP-1
Jul 22 12:15:42 Quazar dbus[4361]: [system] Activating service
name=3D'org.freedesktop.UPower' (using servicehelper)
Jul 22 12:15:42 Quazar dbus[4361]: [system] Successfully activated service
'org.freedesktop.UPower'
Jul 22 12:15:42 Quazar polkitd[4433]: Registered Authentication Agent for
unix-session:/org/freedesktop/ConsoleKit/Session1 (system bus name :1.8
[/usr/libexec/polkit-gnome-authentication-agent-1], object path
/org/gnome/PolicyKit1/AuthenticationAgent, locale en_US.utf8)
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c814 [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: disp: intr24 80000000
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c930 [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c9b0 [ IBUS ]
.......
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c9bc [ IBUS ]
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: disp: outp 02:0006:0f8=
2:
link training failed
Jul 22 12:15:42 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 61c92c [ IBUS ]
Jul 22 12:15:44 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:46 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:48 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:15:48 Quazar kernel: nouveau 0000:03:00.0: bus: MMIO read of 0000=
0000
FAULT at 690400 [ IBUS TIMEOUT ]
Jul 22 12:15:50 Quazar kernel: nouveau 0000:03:00.0: DRM: EVO timeout
Jul 22 12:15:52 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-0: timeout
Jul 22 12:16:05 Quazar kernel: nouveau 0000:03:00.0: DRM: base-1: timeout



I can attach all the relevant logs.

Any idea? Maybe this belongs to an other bug?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15007200366.c32E5f.24603--

--===============2049295384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2049295384==--

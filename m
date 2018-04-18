From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106120] New: Hang in XScreenSaver
Date: Wed, 18 Apr 2018 08:43:26 +0000
Message-ID: <bug-106120-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1778374497=="
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


--===============1778374497==
Content-Type: multipart/alternative; boundary="15240410060.CAE57.8351"
Content-Transfer-Encoding: 7bit


--15240410060.CAE57.8351
Date: Wed, 18 Apr 2018 08:43:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106120

            Bug ID: 106120
           Summary: Hang in XScreenSaver
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pmenzel+bugs.freedesktop-KUpvgZVWgV9o1qOY/usvUg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 138902
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138902&action=3Dedit
Linux 4.14.30 messages

On a dual monitor setup, since moving from Nvidia=E2=80=99s proprietary dri=
vers to
Nouveau 1.0.15 with Linux 4.14.30 and X.Org X server 1.19.6, running
XScreenSaver 5.37 over night coming back to the system the program is froze=
n.

```
$ more /proc/version
Linux version 4.14.30.mx64.211 (root-mccexzeWwsejwueTl6BtlECU5h/uR09zhGxnpwIvXIk@public.gmane.org) (gcc
version 7.3.0 (GCC)) #1 SMP Tue Mar
 27 12:40:07 CEST 2018
$ dmesg | grep nouveau
[   55.882828] nouveau 0000:01:00.0: NVIDIA GT216 (0a5c00a2)
[   56.007447] nouveau 0000:01:00.0: bios: version 70.16.72.00.04
[   56.008001] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[   56.057456] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[   56.057457] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   56.057459] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   56.057460] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   56.057461] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000380 00000000
[   56.057463] nouveau 0000:01:00.0: DRM: DCB outp 01: 08000382 00020030
[   56.057464] nouveau 0000:01:00.0: DRM: DCB outp 02: 028213a6 0f220010
[   56.057465] nouveau 0000:01:00.0: DRM: DCB outp 03: 02021362 00020010
[   56.057466] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002030
[   56.057467] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[   56.147522] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   56.198649] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x70000, =
bo
ffff8801f51d3800
[   56.200002] fbcon: nouveaufb (fb0) is primary device
[   56.378972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   56.389927] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[24345.413226] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[24345.413228] nouveau 0000:01:00.0: gr: no stuck command?
[24345.413241] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on cha=
nnel
7 [1f7c3000 timetunnel[10223]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[136540.327847] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[136540.327849] nouveau 0000:01:00.0: gr: no stuck command?
[136540.327859] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 cubicgrid[24392]] engine 00 [PGRAPH] client 03 [DISPATC=
H]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[149740.682664] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[149740.682666] nouveau 0000:01:00.0: gr: no stuck command?
[149740.682682] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 flipscreen3d[30021]] engine 00 [PGRAPH] client 03
[DISPATCH] subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[161741.043699] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[161741.043701] nouveau 0000:01:00.0: gr: no stuck command?
[161741.043711] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 rubikblocks[2611]] engine 00 [PGRAPH] client 03 [DISPAT=
CH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[166541.141873] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[166541.141875] nouveau 0000:01:00.0: gr: no stuck command?
[166541.141889] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 boing[4728]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[172738.032860] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000000 ib_put 00000002 state c0000000
(err: MEM_FAULT) push 00400040
[172738.032870] nouveau 0000:01:00.0: fb: trapped read at 0020010000 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
[172738.054718] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000002 ib_put 00000004 state c0000000
(err: MEM_FAULT) push 00400040
[172738.054730] nouveau 0000:01:00.0: fb: trapped read at 0020010010 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
[172829.815630] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000004 ib_put 00000006 state c0000000
(err: MEM_FAULT) push 00400040
[172829.815640] nouveau 0000:01:00.0: fb: trapped read at 0020010020 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
```

It could be, that the system was under memory pressure.

root      4572  0.0  0.0 159180  1928 ?        Ssl  Apr16   0:00
/usr/sbin/gdm-binary
root      4577  0.0  0.0 175448  1596 ?        Sl   Apr16   0:00  \_
/usr/lib/gdm/gdm-simple-slave --display-id /org/gnome/DisplayManager/Displa=
y1
root      4579  9.2  2.5 694112 202660 tty3    Ssl+ Apr16 263:09      \_
/usr/libexec/Xorg :0 -br -verbose -auth
/var/run/gdm/auth-for-gdm-NG4xU2/database -nolisten tcp
root      4688  0.0  0.0 262704  6812 ?        Sl   Apr16   0:00      \_
gdm-session-worker [pam/gdm-password]
joey1     4741  0.0  0.0  24152   536 ?        Ss   Apr16   0:00          \_
/bin/sh /etc/xdg/xfce4/xinitrc
joey1     4761  0.0  0.0  19768   332 ?        Ss   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20
\_ /usr/bin/ssh-agent -- startxfce4
joey1     4766  0.0  0.0 325448  3660 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20
\_ xfce4-session
joey1     4795  0.0  0.0 355232  6576 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ bluetooth-applet
joey1     4829  0.0  0.0  64888  2524 ?        S    Apr16   0:08=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ xscreensaver -no-splash
joey1     7871  0.9  0.3 252952 26896 ?        SNl  07:54   1:31=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  |   \_ geodesic -root
joey1     7872  0.3  0.3 255000 26588 ?        SNl  07:54   0:39=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  |   \_ geodesic -root
joey1     4842  0.0  0.1 648920  8148 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ gnome-sound-applet

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15240410060.CAE57.8351
Date: Wed, 18 Apr 2018 08:43:26 +0000
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
   title=3D"NEW - Hang in XScreenSaver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106120">106120</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Hang in XScreenSaver
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>pmenzel+bugs.freedesktop&#64;molgen.mpg.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138902=
" name=3D"attach_138902" title=3D"Linux 4.14.30 messages">attachment 138902=
</a> <a href=3D"attachment.cgi?id=3D138902&amp;action=3Dedit" title=3D"Linu=
x 4.14.30 messages">[details]</a></span>
Linux 4.14.30 messages

On a dual monitor setup, since moving from Nvidia=E2=80=99s proprietary dri=
vers to
Nouveau 1.0.15 with Linux 4.14.30 and X.Org X server 1.19.6, running
XScreenSaver 5.37 over night coming back to the system the program is froze=
n.

```
$ more /proc/version
Linux version 4.14.30.mx64.211 (<a href=3D"mailto:root&#64;holidayincambodi=
a.molgen.mpg.de">root&#64;holidayincambodia.molgen.mpg.de</a>) (gcc
version 7.3.0 (GCC)) #1 SMP Tue Mar
 27 12:40:07 CEST 2018
$ dmesg | grep nouveau
[   55.882828] nouveau 0000:01:00.0: NVIDIA GT216 (0a5c00a2)
[   56.007447] nouveau 0000:01:00.0: bios: version 70.16.72.00.04
[   56.008001] nouveau 0000:01:00.0: fb: 512 MiB DDR3
[   56.057456] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
[   56.057457] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   56.057459] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   56.057460] nouveau 0000:01:00.0: DRM: DCB version 4.0
[   56.057461] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000380 00000000
[   56.057463] nouveau 0000:01:00.0: DRM: DCB outp 01: 08000382 00020030
[   56.057464] nouveau 0000:01:00.0: DRM: DCB outp 02: 028213a6 0f220010
[   56.057465] nouveau 0000:01:00.0: DRM: DCB outp 03: 02021362 00020010
[   56.057466] nouveau 0000:01:00.0: DRM: DCB conn 00: 00002030
[   56.057467] nouveau 0000:01:00.0: DRM: DCB conn 01: 00101146
[   56.147522] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   56.198649] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0x70000, =
bo
ffff8801f51d3800
[   56.200002] fbcon: nouveaufb (fb0) is primary device
[   56.378972] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   56.389927] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[24345.413226] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[24345.413228] nouveau 0000:01:00.0: gr: no stuck command?
[24345.413241] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on cha=
nnel
7 [1f7c3000 timetunnel[10223]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[136540.327847] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[136540.327849] nouveau 0000:01:00.0: gr: no stuck command?
[136540.327859] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 cubicgrid[24392]] engine 00 [PGRAPH] client 03 [DISPATC=
H]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[149740.682664] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[149740.682666] nouveau 0000:01:00.0: gr: no stuck command?
[149740.682682] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 flipscreen3d[30021]] engine 00 [PGRAPH] client 03
[DISPATCH] subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[161741.043699] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[161741.043701] nouveau 0000:01:00.0: gr: no stuck command?
[161741.043711] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 rubikblocks[2611]] engine 00 [PGRAPH] client 03 [DISPAT=
CH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[166541.141873] nouveau 0000:01:00.0: gr: TRAP DISPATCH_QUERY
[166541.141875] nouveau 0000:01:00.0: gr: no stuck command?
[166541.141889] nouveau 0000:01:00.0: fb: trapped write at 0020215000 on
channel 7 [1f7b3000 boing[4728]] engine 00 [PGRAPH] client 03 [DISPATCH]
subclient 02 [QUERY] reason 00000002 [PAGE_NOT_PRESENT]
[172738.032860] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000000 ib_put 00000002 state c0000000
(err: MEM_FAULT) push 00400040
[172738.032870] nouveau 0000:01:00.0: fb: trapped read at 0020010000 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
[172738.054718] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000002 ib_put 00000004 state c0000000
(err: MEM_FAULT) push 00400040
[172738.054730] nouveau 0000:01:00.0: fb: trapped read at 0020010010 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
[172829.815630] nouveau 0000:01:00.0: fifo: DMA_PUSHER - ch 7 [geodesic[787=
1]]
get 0000000000 put 0000000000 ib_get 00000004 ib_put 00000006 state c0000000
(err: MEM_FAULT) push 00400040
[172829.815640] nouveau 0000:01:00.0: fb: trapped read at 0020010020 on cha=
nnel
7 [1f6b3000 geodesic[7871]] engine 05 [PFIFO] client 08 [PFIFO_READ] subcli=
ent
00 [PUSHBUF] reason 0000000f [DMAOBJ_LIMIT]
```

It could be, that the system was under memory pressure.

root      4572  0.0  0.0 159180  1928 ?        Ssl  Apr16   0:00
/usr/sbin/gdm-binary
root      4577  0.0  0.0 175448  1596 ?        Sl   Apr16   0:00  \_
/usr/lib/gdm/gdm-simple-slave --display-id /org/gnome/DisplayManager/Displa=
y1
root      4579  9.2  2.5 694112 202660 tty3    Ssl+ Apr16 263:09      \_
/usr/libexec/Xorg :0 -br -verbose -auth
/var/run/gdm/auth-for-gdm-NG4xU2/database -nolisten tcp
root      4688  0.0  0.0 262704  6812 ?        Sl   Apr16   0:00      \_
gdm-session-worker [pam/gdm-password]
joey1     4741  0.0  0.0  24152   536 ?        Ss   Apr16   0:00          \_
/bin/sh /etc/xdg/xfce4/xinitrc
joey1     4761  0.0  0.0  19768   332 ?        Ss   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20
\_ /usr/bin/ssh-agent -- startxfce4
joey1     4766  0.0  0.0 325448  3660 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20
\_ xfce4-session
joey1     4795  0.0  0.0 355232  6576 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ bluetooth-applet
joey1     4829  0.0  0.0  64888  2524 ?        S    Apr16   0:08=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ xscreensaver -no-splash
joey1     7871  0.9  0.3 252952 26896 ?        SNl  07:54   1:31=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  |   \_ geodesic -root
joey1     7872  0.3  0.3 255000 26588 ?        SNl  07:54   0:39=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  |   \_ geodesic -root
joey1     4842  0.0  0.1 648920  8148 ?        Sl   Apr16   0:00=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
  \_ gnome-sound-applet</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15240410060.CAE57.8351--

--===============1778374497==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1778374497==--

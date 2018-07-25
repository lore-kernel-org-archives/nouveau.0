From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107381] New: [NV117] Hang with 'fifo: write fault'
 and thousands of 'TRAP UNHANDLED 00000020'
Date: Wed, 25 Jul 2018 22:48:00 +0000
Message-ID: <bug-107381-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0797064404=="
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


--===============0797064404==
Content-Type: multipart/alternative; boundary="15325588801.0482f79e6.9246"
Content-Transfer-Encoding: 7bit


--15325588801.0482f79e6.9246
Date: Wed, 25 Jul 2018 22:48:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107381

            Bug ID: 107381
           Summary: [NV117] Hang with 'fifo: write fault' and thousands of
                    'TRAP UNHANDLED 00000020'
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: awillia2-1iWHkkKxmXRZroRs9YW3xA@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I was using Chrome when my display froze (the mouse still worked, but other=
wise
the screen was non-responsive).  After SSHing in, the following messages we=
re
in /var/log/syslog (dmesg wasn't helpful because the kernel message buffer =
had
wrapped around):

...
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.571179:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.596384:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!
kernel: [512690.788845] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788857] nouveau 0000:02:00.0: gr: MACRO 80000010 [WATCHDOG],
pc: 0x111, op: 0xff111111
kernel: [512690.788867] nouveau 0000:02:00.0: gr: GPC0/TPC0/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788874] nouveau 0000:02:00.0: gr: GPC0/TPC1/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788881] nouveau 0000:02:00.0: gr: GPC0/TPC2/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788885] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
kernel: [512690.788897] nouveau 0000:02:00.0: fifo: write fault at ff111780=
00
engine 00 [GR] client 15 [SCC_NB] reason 00 [PDE] on channel 12 [007f108000
chrome[16340]]
kernel: [512690.788911] nouveau 0000:02:00.0: fifo: channel 12: killed
kernel: [512690.788914] nouveau 0000:02:00.0: fifo: runlist 0: scheduled for
recovery
kernel: [512690.788920] nouveau 0000:02:00.0: fifo: engine 0: scheduled for
recovery
kernel: [512690.788931] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788935] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
kernel: [512690.788946] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788949] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
[ The above two messages repeated ~ 3,200 times ]
kernel: [512690.813965] nouveau 0000:02:00.0: chrome[16340]: channel 12 kil=
led!
kernel: [512690.813971] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.813973] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
[ The above two messages repeat ten more times  ]
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.614008:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!



Eventually the display appears to have crashed, and the following log messa=
ges
occurred:

kernel: [514889.808652] nouveau 0000:02:00.0: fifo: PBDMA0: 04000000 [ACQUI=
RE]
ch 6 [007f576000 systemd-logind[957]] subc 0 mthd 001c data 00001004
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "25"
/usr/lib/gdm3/gdm-x-session[15566]: (II) event1  - (II) Power Button: (II)
device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "28"
/usr/lib/gdm3/gdm-x-session[15566]: (II) event0  - (II) Power Button: (II)
device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "29"
/usr/lib/gdm3/gdm-x-session[15566]: (II) event2  - (II) Dell KB216 Wired
Keyboard: (II) device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "30"
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "31"
/usr/lib/gdm3/gdm-x-session[15566]: (II) event4  - (II) PixArt Dell MS116 U=
SB
Optical Mouse: (II) device removed
gnome-session-binary[15772]: WARNING: Could not get session path for sessio=
n.
Check that logind is properly installed and pam_systemd is getting used at
login.
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Could not get
session path for session. Check that logind is properly installed and
pam_systemd is getting used at login.
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option "fd" "30"
/usr/lib/gdm3/gdm-x-session[15566]: (II) event3  - (II) Dell KB216 Wired
Keyboard: (II) device removed
/usr/lib/gdm3/gdm-x-session[15566]: (II) AIGLX: Suspending AIGLX clients fo=
r VT
switch
/usr/lib/gdm3/gdm-x-session[15566]: (II) NOUVEAU(0): NVLeaveVT is called.
/usr/lib/gdm3/gdm-x-session[15566]: (II) NOUVEAU(G0): NVLeaveVT is called.
systemd[1]: Started Getty on tty6.
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 226:1
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 226:0
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:65
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:67
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:64
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:66
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:68
nautilus-deskto[16115]: gdk_event_set_source_device: assertion 'GDK_IS_DEVI=
CE
(device)' failed
terminator[16252]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
kernel: [514890.022839] nautilus-deskto[16115]: segfault at 90 ip
00007fd9ec3a0d95 sp 00007ffdbf71ace0 error 4 in
libgdk-3.so.0.2200.25[7fd9ec33e000+101000]
kernel: [514890.024149] terminator[16252]: segfault at 90 ip 00007fb0d1678d=
95
sp 00007ffcd51bd2b0 error 4 in libgdk-3.so.0.2200.25[7fb0d1616000+101000]
gnome-panel[16108]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_get_device_type: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_list_slave_devices: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_get_n_axes: assertion 'GDK_IS_DEVICE (device=
)'
failed
gnome-panel[16108]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
kernel: [514890.035217] gnome-panel[16108]: segfault at 90 ip 00007f4a87279=
138
sp 00007ffe5bcb6350 error 4 in libgdk-3.so.0.2200.25[7f4a87216000+101000]
systemd[15554]: Starting Notification regarding a crash report...
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Application
'nautilus-classic.desktop' killed by signal 11
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Application
'gnome-panel.desktop' killed by signal 11
gnome-session-binary[15772]: WARNING: Application 'nautilus-classic.desktop'
killed by signal 11
gnome-session-binary[15772]: WARNING: Application 'gnome-panel.desktop' kil=
led
by signal 11
...
kernel: [514909.422983] CPU: 1 PID: 15568 Comm: Xorg Not tainted
4.13.0-46-generic #51-Ubuntu
kernel: [514909.422985] Hardware name: Dell Inc. Precision Tower 5810/0HHV7=
N,
BIOS A20 07/26/2017
kernel: [514909.422987] task: ffff88ab2145c5c0 task.stack: ffffb47943474000
kernel: [514909.423040] RIP: 0010:nouveau_bo_move_ntfy+0x9b/0xa0 [nouveau]
kernel: [514909.423042] RSP: 0018:ffffb47943477840 EFLAGS: 00010286
kernel: [514909.423045] RAX: 00000000fffffff0 RBX: ffff88ab49a29d00 RCX:
ffff88aa0771ccc0
kernel: [514909.423047] RDX: 0000000000000000 RSI: 0000000000000282 RDI:
0000000000000282
kernel: [514909.423048] RBP: ffffb47943477860 R08: 0000000000000000 R09:
000000000003f16b
kernel: [514909.423050] R10: ffffb47943477728 R11: 00000000003d0900 R12:
ffffb47943477930
kernel: [514909.423052] R13: ffff88ab73335000 R14: ffff88ab733352f8 R15:
ffffb47943477930
kernel: [514909.423055] FS:  00007f7ea52b6500(0000) GS:ffff88ab7f240000(000=
0)
knlGS:0000000000000000
kernel: [514909.423057] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: [514909.423059] CR2: 00001fb578c78000 CR3: 00000007f4fee002 CR4:
00000000003606e0
kernel: [514909.423061] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
kernel: [514909.423063] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
kernel: [514909.423064] Call Trace:
kernel: [514909.423077]  ttm_bo_handle_move_mem+0x251/0x5c0 [ttm]
kernel: [514909.423083]  ? ttm_bo_mem_space+0x39d/0x470 [ttm]
kernel: [514909.423090]  ttm_bo_evict+0x141/0x330 [ttm]
kernel: [514909.423134]  ? __nv50_ram_put+0x66/0x90 [nouveau]
kernel: [514909.423142]  ttm_mem_evict_first+0x145/0x1a0 [ttm]
kernel: [514909.423149]  ttm_bo_mem_space+0x312/0x470 [ttm]
kernel: [514909.423156]  ttm_bo_validate+0xd4/0x160 [ttm]
kernel: [514909.423162]  ttm_bo_init_reserved+0x3bb/0x450 [ttm]
kernel: [514909.423168]  ttm_bo_init+0x2d/0x90 [ttm]
kernel: [514909.423218]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
kernel: [514909.423262]  nouveau_bo_new+0x1bc/0x2f0 [nouveau]
kernel: [514909.423303]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
kernel: [514909.423344]  nouveau_gem_new+0x64/0x130 [nouveau]
kernel: [514909.423384]  nouveau_gem_ioctl_new+0x80/0x140 [nouveau]
kernel: [514909.423422]  ? nouveau_gem_new+0x130/0x130 [nouveau]
kernel: [514909.423443]  drm_ioctl_kernel+0x5f/0xb0 [drm]
kernel: [514909.423459]  drm_ioctl+0x31b/0x3d0 [drm]
kernel: [514909.423499]  ? nouveau_gem_new+0x130/0x130 [nouveau]
kernel: [514909.423541]  nouveau_drm_ioctl+0x72/0xc0 [nouveau]
kernel: [514909.423548]  do_vfs_ioctl+0xa8/0x630
kernel: [514909.423553]  SyS_ioctl+0x79/0x90
kernel: [514909.423560]  entry_SYSCALL_64_fastpath+0x24/0xab
kernel: [514909.423562] RIP: 0033:0x7f7ea271cef7
kernel: [514909.423564] RSP: 002b:00007ffdc1942688 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
kernel: [514909.423567] RAX: ffffffffffffffda RBX: 00005578772b9820 RCX:
00007f7ea271cef7
kernel: [514909.423569] RDX: 00007ffdc19426e0 RSI: 00000000c0306480 RDI:
000000000000000d
kernel: [514909.423570] RBP: 00007ffdc1942720 R08: 0000000000000000 R09:
000055787747a760
kernel: [514909.423572] R10: 0000000000000030 R11: 0000000000000246 R12:
0000000040086409
kernel: [514909.423574] R13: 000000000000000d R14: 0000557876f2e7e0 R15:
00005578772b9820
kernel: [514909.423576] Code: 75 c5 31 d2 31 f6 4c 89 ef e8 42 dd f3 ff 85 =
c0
75 19 48 89 df e8 c6 0a fa ff 48 8b 1b 49 39 de 75 d2 5b 41 5c 41 5d 41 5e =
5d
c3 <0f> ff eb e3 90 0f 1f
 44 00 00 55 48 89 e5 41 57 41 56 41 55 41
kernel: [514909.423635] ---[ end trace ecbf69f5285cfa6c ]---


Finally, a bunch of the following messages were generated until I rebooted:

/usr/lib/gdm3/gdm-x-session[15566]: -12
kernel: [514924.526648] [TTM] Buffer eviction failed



Some info about my machine:

Linux system 4.13.0-46-generic #51-Ubuntu SMP Tue Jun 12 12:36:29 UTC 2018
x86_64 x86_64 x86_64 GNU/Linux

From Chrome:
GL_VENDOR: nouveau
GL_RENDERER: NV117
GL_VERSION: 3.0 Mesa 17.2.8

The video card is a Quadro K620

A few potentially interesting notes:
 - I routinely hit the following bug (and I hit it when rebooting after this
crash):
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/1=
684123
 - The GetVSyncParametersIfAvailable log messages occurred 160,000 times ov=
er
the course of four hours, and occurred directly before and directly after t=
his
issue (as can be seen in the log output above)

Let me know if there is any additional information that I can provide.  Tha=
nks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15325588801.0482f79e6.9246
Date: Wed, 25 Jul 2018 22:48:00 +0000
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
   title=3D"NEW - [NV117] Hang with 'fifo: write fault' and thousands of 'T=
RAP UNHANDLED 00000020'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107381">107381</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV117] Hang with 'fifo: write fault' and thousands of 'TRAP =
UNHANDLED 00000020'
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>awillia2&#64;sourcefire.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I was using Chrome when my display froze (the mouse still work=
ed, but otherwise
the screen was non-responsive).  After SSHing in, the following messages we=
re
in /var/log/syslog (dmesg wasn't helpful because the kernel message buffer =
had
wrapped around):

...
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.571179:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.596384:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!
kernel: [512690.788845] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788857] nouveau 0000:02:00.0: gr: MACRO 80000010 [WATCHDOG],
pc: 0x111, op: 0xff111111
kernel: [512690.788867] nouveau 0000:02:00.0: gr: GPC0/TPC0/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788874] nouveau 0000:02:00.0: gr: GPC0/TPC1/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788881] nouveau 0000:02:00.0: gr: GPC0/TPC2/MP trap: global
00000000 [] warp 111111 []
kernel: [512690.788885] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
kernel: [512690.788897] nouveau 0000:02:00.0: fifo: write fault at ff111780=
00
engine 00 [GR] client 15 [SCC_NB] reason 00 [PDE] on channel 12 [007f108000
chrome[16340]]
kernel: [512690.788911] nouveau 0000:02:00.0: fifo: channel 12: killed
kernel: [512690.788914] nouveau 0000:02:00.0: fifo: runlist 0: scheduled for
recovery
kernel: [512690.788920] nouveau 0000:02:00.0: fifo: engine 0: scheduled for
recovery
kernel: [512690.788931] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788935] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
kernel: [512690.788946] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.788949] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
[ The above two messages repeated ~ 3,200 times ]
kernel: [512690.813965] nouveau 0000:02:00.0: chrome[16340]: channel 12 kil=
led!
kernel: [512690.813971] nouveau 0000:02:00.0: gr: TRAP ch 12 [007f108000
chrome[16340]]
kernel: [512690.813973] nouveau 0000:02:00.0: gr: TRAP UNHANDLED 00000020
[ The above two messages repeat ten more times  ]
gnome-panel.desktop[16108]:
[16340:16340:0725/162405.614008:ERROR:gl_surface_presentation_helper.cc(115=
)]
GetVSyncParametersIfAvailable() failed!



Eventually the display appears to have crashed, and the following log messa=
ges
occurred:

kernel: [514889.808652] nouveau 0000:02:00.0: fifo: PBDMA0: 04000000 [ACQUI=
RE]
ch 6 [007f576000 systemd-logind[957]] subc 0 mthd 001c data 00001004
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;25&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (II) event1  - (II) Power Button: (II)
device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;28&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (II) event0  - (II) Power Button: (II)
device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;29&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (II) event2  - (II) Dell KB216 Wired
Keyboard: (II) device removed
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;30&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;31&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (II) event4  - (II) PixArt Dell MS116 U=
SB
Optical Mouse: (II) device removed
gnome-session-binary[15772]: WARNING: Could not get session path for sessio=
n.
Check that logind is properly installed and pam_systemd is getting used at
login.
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Could not get
session path for session. Check that logind is properly installed and
pam_systemd is getting used at login.
/usr/lib/gdm3/gdm-x-session[15566]: (**) Option &quot;fd&quot; &quot;30&quo=
t;
/usr/lib/gdm3/gdm-x-session[15566]: (II) event3  - (II) Dell KB216 Wired
Keyboard: (II) device removed
/usr/lib/gdm3/gdm-x-session[15566]: (II) AIGLX: Suspending AIGLX clients fo=
r VT
switch
/usr/lib/gdm3/gdm-x-session[15566]: (II) NOUVEAU(0): NVLeaveVT is called.
/usr/lib/gdm3/gdm-x-session[15566]: (II) NOUVEAU(G0): NVLeaveVT is called.
systemd[1]: Started Getty on tty6.
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 226:1
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 226:0
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:65
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:67
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:64
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:66
/usr/lib/gdm3/gdm-x-session[15566]: (II) systemd-logind: got pause for 13:68
nautilus-deskto[16115]: gdk_event_set_source_device: assertion 'GDK_IS_DEVI=
CE
(device)' failed
terminator[16252]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
kernel: [514890.022839] nautilus-deskto[16115]: segfault at 90 ip
00007fd9ec3a0d95 sp 00007ffdbf71ace0 error 4 in
libgdk-3.so.0.2200.25[7fd9ec33e000+101000]
kernel: [514890.024149] terminator[16252]: segfault at 90 ip 00007fb0d1678d=
95
sp 00007ffcd51bd2b0 error 4 in libgdk-3.so.0.2200.25[7fb0d1616000+101000]
gnome-panel[16108]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_get_device_type: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_list_slave_devices: assertion 'GDK_IS_DEVICE
(device)' failed
gnome-panel[16108]: gdk_device_get_n_axes: assertion 'GDK_IS_DEVICE (device=
)'
failed
gnome-panel[16108]: gdk_event_set_source_device: assertion 'GDK_IS_DEVICE
(device)' failed
kernel: [514890.035217] gnome-panel[16108]: segfault at 90 ip 00007f4a87279=
138
sp 00007ffe5bcb6350 error 4 in libgdk-3.so.0.2200.25[7f4a87216000+101000]
systemd[15554]: Starting Notification regarding a crash report...
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Application
'nautilus-classic.desktop' killed by signal 11
gnome-session[15772]: gnome-session-binary[15772]: WARNING: Application
'gnome-panel.desktop' killed by signal 11
gnome-session-binary[15772]: WARNING: Application 'nautilus-classic.desktop'
killed by signal 11
gnome-session-binary[15772]: WARNING: Application 'gnome-panel.desktop' kil=
led
by signal 11
...
kernel: [514909.422983] CPU: 1 PID: 15568 Comm: Xorg Not tainted
4.13.0-46-generic #51-Ubuntu
kernel: [514909.422985] Hardware name: Dell Inc. Precision Tower 5810/0HHV7=
N,
BIOS A20 07/26/2017
kernel: [514909.422987] task: ffff88ab2145c5c0 task.stack: ffffb47943474000
kernel: [514909.423040] RIP: 0010:nouveau_bo_move_ntfy+0x9b/0xa0 [nouveau]
kernel: [514909.423042] RSP: 0018:ffffb47943477840 EFLAGS: 00010286
kernel: [514909.423045] RAX: 00000000fffffff0 RBX: ffff88ab49a29d00 RCX:
ffff88aa0771ccc0
kernel: [514909.423047] RDX: 0000000000000000 RSI: 0000000000000282 RDI:
0000000000000282
kernel: [514909.423048] RBP: ffffb47943477860 R08: 0000000000000000 R09:
000000000003f16b
kernel: [514909.423050] R10: ffffb47943477728 R11: 00000000003d0900 R12:
ffffb47943477930
kernel: [514909.423052] R13: ffff88ab73335000 R14: ffff88ab733352f8 R15:
ffffb47943477930
kernel: [514909.423055] FS:  00007f7ea52b6500(0000) GS:ffff88ab7f240000(000=
0)
knlGS:0000000000000000
kernel: [514909.423057] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: [514909.423059] CR2: 00001fb578c78000 CR3: 00000007f4fee002 CR4:
00000000003606e0
kernel: [514909.423061] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
kernel: [514909.423063] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
kernel: [514909.423064] Call Trace:
kernel: [514909.423077]  ttm_bo_handle_move_mem+0x251/0x5c0 [ttm]
kernel: [514909.423083]  ? ttm_bo_mem_space+0x39d/0x470 [ttm]
kernel: [514909.423090]  ttm_bo_evict+0x141/0x330 [ttm]
kernel: [514909.423134]  ? __nv50_ram_put+0x66/0x90 [nouveau]
kernel: [514909.423142]  ttm_mem_evict_first+0x145/0x1a0 [ttm]
kernel: [514909.423149]  ttm_bo_mem_space+0x312/0x470 [ttm]
kernel: [514909.423156]  ttm_bo_validate+0xd4/0x160 [ttm]
kernel: [514909.423162]  ttm_bo_init_reserved+0x3bb/0x450 [ttm]
kernel: [514909.423168]  ttm_bo_init+0x2d/0x90 [ttm]
kernel: [514909.423218]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
kernel: [514909.423262]  nouveau_bo_new+0x1bc/0x2f0 [nouveau]
kernel: [514909.423303]  ? nouveau_bo_invalidate_caches+0x10/0x10 [nouveau]
kernel: [514909.423344]  nouveau_gem_new+0x64/0x130 [nouveau]
kernel: [514909.423384]  nouveau_gem_ioctl_new+0x80/0x140 [nouveau]
kernel: [514909.423422]  ? nouveau_gem_new+0x130/0x130 [nouveau]
kernel: [514909.423443]  drm_ioctl_kernel+0x5f/0xb0 [drm]
kernel: [514909.423459]  drm_ioctl+0x31b/0x3d0 [drm]
kernel: [514909.423499]  ? nouveau_gem_new+0x130/0x130 [nouveau]
kernel: [514909.423541]  nouveau_drm_ioctl+0x72/0xc0 [nouveau]
kernel: [514909.423548]  do_vfs_ioctl+0xa8/0x630
kernel: [514909.423553]  SyS_ioctl+0x79/0x90
kernel: [514909.423560]  entry_SYSCALL_64_fastpath+0x24/0xab
kernel: [514909.423562] RIP: 0033:0x7f7ea271cef7
kernel: [514909.423564] RSP: 002b:00007ffdc1942688 EFLAGS: 00000246 ORIG_RA=
X:
0000000000000010
kernel: [514909.423567] RAX: ffffffffffffffda RBX: 00005578772b9820 RCX:
00007f7ea271cef7
kernel: [514909.423569] RDX: 00007ffdc19426e0 RSI: 00000000c0306480 RDI:
000000000000000d
kernel: [514909.423570] RBP: 00007ffdc1942720 R08: 0000000000000000 R09:
000055787747a760
kernel: [514909.423572] R10: 0000000000000030 R11: 0000000000000246 R12:
0000000040086409
kernel: [514909.423574] R13: 000000000000000d R14: 0000557876f2e7e0 R15:
00005578772b9820
kernel: [514909.423576] Code: 75 c5 31 d2 31 f6 4c 89 ef e8 42 dd f3 ff 85 =
c0
75 19 48 89 df e8 c6 0a fa ff 48 8b 1b 49 39 de 75 d2 5b 41 5c 41 5d 41 5e =
5d
c3 &lt;0f&gt; ff eb e3 90 0f 1f
 44 00 00 55 48 89 e5 41 57 41 56 41 55 41
kernel: [514909.423635] ---[ end trace ecbf69f5285cfa6c ]---


Finally, a bunch of the following messages were generated until I rebooted:

/usr/lib/gdm3/gdm-x-session[15566]: -12
kernel: [514924.526648] [TTM] Buffer eviction failed



Some info about my machine:

Linux system 4.13.0-46-generic #51-Ubuntu SMP Tue Jun 12 12:36:29 UTC 2018
x86_64 x86_64 x86_64 GNU/Linux

From Chrome:
GL_VENDOR: nouveau
GL_RENDERER: NV117
GL_VERSION: 3.0 Mesa 17.2.8

The video card is a Quadro K620

A few potentially interesting notes:
 - I routinely hit the following bug (and I hit it when rebooting after this
crash):
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nou=
veau/+bug/1684123">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-v=
ideo-nouveau/+bug/1684123</a>
 - The GetVSyncParametersIfAvailable log messages occurred 160,000 times ov=
er
the course of four hours, and occurred directly before and directly after t=
his
issue (as can be seen in the log output above)

Let me know if there is any additional information that I can provide.  Tha=
nks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15325588801.0482f79e6.9246--

--===============0797064404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0797064404==--

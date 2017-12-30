From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104421] New: System freeze on wayland with nouveau
 on NV137 (GP107)
Date: Sat, 30 Dec 2017 22:42:20 +0000
Message-ID: <bug-104421-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1479636429=="
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


--===============1479636429==
Content-Type: multipart/alternative; boundary="15146737411.F6ECe.30858";
 charset="UTF-8"


--15146737411.F6ECe.30858
Date: Sat, 30 Dec 2017 22:42:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104421

            Bug ID: 104421
           Summary: System freeze on wayland with nouveau on NV137 (GP107)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jan.public-4zxwHqDmGJ7z+pZb47iToQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I experience regular freezes of my fully updated Fedora 27 system, probably
wayland/nouveau related.

installed package versions:
kernel.x86_64                              4.14.8-300.fc27
xorg-x11-drv-nouveau.x86_64                1:1.0.15-3.fc27
libwayland-client.x86_64                   1.14.0-2.fc27
libwayland-cursor.x86_64                   1.14.0-2.fc27
libwayland-server.x86_64                   1.14.0-2.fc27
xorg-x11-server-Xwayland.x86_64            1.19.5-1.fc27

see also: https://bugzilla.redhat.com/show_bug.cgi?id=3D1529854

Graphics:  Card: NVIDIA GP107 [GeForce GTX 1050 Ti]
           Display Server: X.org 1.19.5 drivers: modesetting,fbdev,vesa
           tty size: 211x52 Advanced Data: N/A for root out of X

One freeze:
Dec 30 11:58:57 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 11:59:13 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:02:53 nyx kernel: usb 1-4: USB disconnect, device number 4
Dec 30 12:03:00 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:01 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:01 nyx kernel: usb usb1-port4: attempt power cycle
Dec 30 12:03:03 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:04 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:04 nyx kernel: usb usb1-port4: unable to enumerate USB device
Dec 30 12:06:20 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:12:29 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:15:05 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:15:20 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:17:18 nyx kernel: nouveau 0000:23:00.0: DRM: base-0: timeout
Dec 30 12:17:20 nyx kernel: nouveau 0000:23:00.0: DRM: base-0: timeout
Dec 30 12:17:21 nyx kernel: nouveau 0000:23:00.0: bus: MMIO read of 00000000
FAULT at 616798 [ IBUS ]
Dec 30 12:17:21 nyx kernel: BUG: unable to handle kernel paging request at
ffff8d9ebd7e5000
Dec 30 12:17:21 nyx kernel: IP: evo_wait+0x5d/0x130 [nouveau]
Dec 30 12:17:21 nyx kernel: PGD 67300067 P4D 67300067 PUD 0=20
Dec 30 12:17:21 nyx kernel: Oops: 0002 [#1] SMP
Dec 30 12:17:21 nyx kernel: Modules linked in: uas usb_storage fuse xt_CHEC=
KSUM
ipt_MASQUERADE nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_
Dec 30 12:17:21 nyx kernel:  i2c_piix4 parport_pc tpm_tis parport shpchp
tpm_tis_core tpm acpi_cpufreq dm_crypt hid_logitech_hidpp nouveau video mxm=
_wmi
i2c_algo_bit drm_kms_helper ttm crct10dif_pclmul r8169 crc
Dec 30 12:17:21 nyx kernel: CPU: 9 PID: 15981 Comm: kworker/9:0 Not tainted
4.14.8-300.fc27.x86_64 #1
Dec 30 12:17:21 nyx kernel: Hardware name: Micro-Star International Co., Lt=
d.
MS-7A34/B350 PC MATE (MS-7A34), BIOS A.73 09/11/2017
Dec 30 12:17:21 nyx kernel: Workqueue: events drm_mode_rmfb_work_fn [drm]
Dec 30 12:17:21 nyx kernel: task: ffff8d9d51a03e80 task.stack: ffffb4320e7a=
c000
Dec 30 12:17:21 nyx kernel: RIP: 0010:evo_wait+0x5d/0x130 [nouveau]
Dec 30 12:17:21 nyx kernel: RSP: 0018:ffffb4320e7afc78 EFLAGS: 00010212
Dec 30 12:17:21 nyx kernel: RAX: ffff8d9e029f4000 RBX: 000000002eb7c402 RCX:
ffffffffc049b540
Dec 30 12:17:21 nyx kernel: RDX: 000000002eb7c400 RSI: 0000000000000002 RDI:
ffff8d9e038cd388
Dec 30 12:17:21 nyx kernel: RBP: ffffb4320e7afca0 R08: 0000000000000000 R09:
0000000000000004
Dec 30 12:17:21 nyx kernel: R10: ffffea590f233880 R11: ffffffffc049b1c0 R12:
ffff8d9e038cd2e8
Dec 30 12:17:21 nyx kernel: R13: ffff8d9e0c4c9068 R14: 0000000000000002 R15:
ffff8d9e038cd388
Dec 30 12:17:21 nyx kernel: FS:  0000000000000000(0000)
GS:ffff8d9e1ee40000(0000) knlGS:0000000000000000
Dec 30 12:17:21 nyx kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
Dec 30 12:17:21 nyx kernel: CR2: ffff8d9ebd7e5000 CR3: 00000003c6d6d000 CR4:
00000000003406e0
Dec 30 12:17:21 nyx kernel: Call Trace:
Dec 30 12:17:21 nyx kernel:  nv50_base_update+0x2a/0xf0 [nouveau]
Dec 30 12:17:21 nyx kernel:  nv50_disp_atomic_commit_tail+0x64a/0x3980
[nouveau]
Dec 30 12:17:21 nyx kernel:  nv50_disp_atomic_commit+0x26e/0x280 [nouveau]
Dec 30 12:17:21 nyx kernel:  drm_atomic_commit+0x4b/0x50 [drm]
Dec 30 12:17:21 nyx kernel:  drm_framebuffer_remove+0x2a5/0x3c0 [drm]
Dec 30 12:17:21 nyx kernel:  drm_mode_rmfb_work_fn+0x55/0x70 [drm]
Dec 30 12:17:21 nyx kernel:  process_one_work+0x193/0x3c0
Dec 30 12:17:21 nyx kernel:  worker_thread+0x35/0x3b0
Dec 30 12:17:21 nyx kernel:  kthread+0x125/0x140
Dec 30 12:17:21 nyx kernel:  ? process_one_work+0x3c0/0x3c0
Dec 30 12:17:21 nyx kernel:  ? kthread_park+0x60/0x60
Dec 30 12:17:21 nyx kernel:  ret_from_fork+0x25/0x30
Dec 30 12:17:21 nyx kernel: Code: a0 00 00 00 c1 e8 02 89 c3 4c 89 ff e8 fd=
 5a
49 ca 89 da 44 01 f3 81 fb f7 03 00 00 48 8d 04 95 00 00 00 00 76 7a 49 8b =
44
24 38 <c7> 04 90 00 00 00 20 49 8b 74 24 18 48 85 f6 7
Dec 30 12:17:21 nyx kernel: RIP: evo_wait+0x5d/0x130 [nouveau] RSP:
ffffb4320e7afc78
Dec 30 12:17:21 nyx kernel: CR2: ffff8d9ebd7e5000
Dec 30 12:17:21 nyx kernel: ---[ end trace 4880f0d9dac51dbf ]---

Another freeze:
Probably the problem is purely nouveau related. My system froze again, but
again I was still able to access it via ssh (but not via the attached keybo=
ard
and display, even CTRL-ALT-F2, did not work):

Dec 30 13:15:23 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:07:48 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:59:14 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:59:52 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 17:10:14 nyx kernel: nf_conntrack: default automatic helper assignme=
nt
has been turned off for security reasons and CT-based  firewall rule not fo=
und.
Use the iptables CT target to attach helpers instead.
Dec 30 18:17:37 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:19:37 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:20:06 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:54:51 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 19:58:54 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 19:59:13 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 21:18:02 nyx kernel: perf: interrupt took too long (2505 > 2500),
lowering kernel.perf_event_max_sample_rate to 79000
Dec 30 22:08:39 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 22:12:54 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00ff115000
Xwayland[5346]]
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
000685a000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00ff115000 Xwayland[5346]]
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: channel 14
killed!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15146737411.F6ECe.30858
Date: Sat, 30 Dec 2017 22:42:21 +0000
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
   title=3D"NEW - System freeze on wayland with nouveau on NV137 (GP107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104421">104421</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>System freeze on wayland with nouveau on NV137 (GP107)
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
          <td>jan.public&#64;famvlug.nl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I experience regular freezes of my fully updated Fedora 27 sys=
tem, probably
wayland/nouveau related.

installed package versions:
kernel.x86_64                              4.14.8-300.fc27
xorg-x11-drv-nouveau.x86_64                1:1.0.15-3.fc27
libwayland-client.x86_64                   1.14.0-2.fc27
libwayland-cursor.x86_64                   1.14.0-2.fc27
libwayland-server.x86_64                   1.14.0-2.fc27
xorg-x11-server-Xwayland.x86_64            1.19.5-1.fc27

see also: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1529854"=
>https://bugzilla.redhat.com/show_bug.cgi?id=3D1529854</a>

Graphics:  Card: NVIDIA GP107 [GeForce GTX 1050 Ti]
           Display Server: X.org 1.19.5 drivers: modesetting,fbdev,vesa
           tty size: 211x52 Advanced Data: N/A for root out of X

One freeze:
Dec 30 11:58:57 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 11:59:13 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:02:53 nyx kernel: usb 1-4: USB disconnect, device number 4
Dec 30 12:03:00 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:01 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:01 nyx kernel: usb usb1-port4: attempt power cycle
Dec 30 12:03:03 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:04 nyx kernel: usb usb1-port4: Cannot enable. Maybe the USB ca=
ble
is bad?
Dec 30 12:03:04 nyx kernel: usb usb1-port4: unable to enumerate USB device
Dec 30 12:06:20 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:12:29 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:15:05 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:15:20 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 12:17:18 nyx kernel: nouveau 0000:23:00.0: DRM: base-0: timeout
Dec 30 12:17:20 nyx kernel: nouveau 0000:23:00.0: DRM: base-0: timeout
Dec 30 12:17:21 nyx kernel: nouveau 0000:23:00.0: bus: MMIO read of 00000000
FAULT at 616798 [ IBUS ]
Dec 30 12:17:21 nyx kernel: BUG: unable to handle kernel paging request at
ffff8d9ebd7e5000
Dec 30 12:17:21 nyx kernel: IP: evo_wait+0x5d/0x130 [nouveau]
Dec 30 12:17:21 nyx kernel: PGD 67300067 P4D 67300067 PUD 0=20
Dec 30 12:17:21 nyx kernel: Oops: 0002 [#1] SMP
Dec 30 12:17:21 nyx kernel: Modules linked in: uas usb_storage fuse xt_CHEC=
KSUM
ipt_MASQUERADE nf_nat_masquerade_ipv4 tun nf_conntrack_netbios_ns
nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJECT nf_reject_
Dec 30 12:17:21 nyx kernel:  i2c_piix4 parport_pc tpm_tis parport shpchp
tpm_tis_core tpm acpi_cpufreq dm_crypt hid_logitech_hidpp nouveau video mxm=
_wmi
i2c_algo_bit drm_kms_helper ttm crct10dif_pclmul r8169 crc
Dec 30 12:17:21 nyx kernel: CPU: 9 PID: 15981 Comm: kworker/9:0 Not tainted
4.14.8-300.fc27.x86_64 #1
Dec 30 12:17:21 nyx kernel: Hardware name: Micro-Star International Co., Lt=
d.
MS-7A34/B350 PC MATE (MS-7A34), BIOS A.73 09/11/2017
Dec 30 12:17:21 nyx kernel: Workqueue: events drm_mode_rmfb_work_fn [drm]
Dec 30 12:17:21 nyx kernel: task: ffff8d9d51a03e80 task.stack: ffffb4320e7a=
c000
Dec 30 12:17:21 nyx kernel: RIP: 0010:evo_wait+0x5d/0x130 [nouveau]
Dec 30 12:17:21 nyx kernel: RSP: 0018:ffffb4320e7afc78 EFLAGS: 00010212
Dec 30 12:17:21 nyx kernel: RAX: ffff8d9e029f4000 RBX: 000000002eb7c402 RCX:
ffffffffc049b540
Dec 30 12:17:21 nyx kernel: RDX: 000000002eb7c400 RSI: 0000000000000002 RDI:
ffff8d9e038cd388
Dec 30 12:17:21 nyx kernel: RBP: ffffb4320e7afca0 R08: 0000000000000000 R09:
0000000000000004
Dec 30 12:17:21 nyx kernel: R10: ffffea590f233880 R11: ffffffffc049b1c0 R12:
ffff8d9e038cd2e8
Dec 30 12:17:21 nyx kernel: R13: ffff8d9e0c4c9068 R14: 0000000000000002 R15:
ffff8d9e038cd388
Dec 30 12:17:21 nyx kernel: FS:  0000000000000000(0000)
GS:ffff8d9e1ee40000(0000) knlGS:0000000000000000
Dec 30 12:17:21 nyx kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
Dec 30 12:17:21 nyx kernel: CR2: ffff8d9ebd7e5000 CR3: 00000003c6d6d000 CR4:
00000000003406e0
Dec 30 12:17:21 nyx kernel: Call Trace:
Dec 30 12:17:21 nyx kernel:  nv50_base_update+0x2a/0xf0 [nouveau]
Dec 30 12:17:21 nyx kernel:  nv50_disp_atomic_commit_tail+0x64a/0x3980
[nouveau]
Dec 30 12:17:21 nyx kernel:  nv50_disp_atomic_commit+0x26e/0x280 [nouveau]
Dec 30 12:17:21 nyx kernel:  drm_atomic_commit+0x4b/0x50 [drm]
Dec 30 12:17:21 nyx kernel:  drm_framebuffer_remove+0x2a5/0x3c0 [drm]
Dec 30 12:17:21 nyx kernel:  drm_mode_rmfb_work_fn+0x55/0x70 [drm]
Dec 30 12:17:21 nyx kernel:  process_one_work+0x193/0x3c0
Dec 30 12:17:21 nyx kernel:  worker_thread+0x35/0x3b0
Dec 30 12:17:21 nyx kernel:  kthread+0x125/0x140
Dec 30 12:17:21 nyx kernel:  ? process_one_work+0x3c0/0x3c0
Dec 30 12:17:21 nyx kernel:  ? kthread_park+0x60/0x60
Dec 30 12:17:21 nyx kernel:  ret_from_fork+0x25/0x30
Dec 30 12:17:21 nyx kernel: Code: a0 00 00 00 c1 e8 02 89 c3 4c 89 ff e8 fd=
 5a
49 ca 89 da 44 01 f3 81 fb f7 03 00 00 48 8d 04 95 00 00 00 00 76 7a 49 8b =
44
24 38 &lt;c7&gt; 04 90 00 00 00 20 49 8b 74 24 18 48 85 f6 7
Dec 30 12:17:21 nyx kernel: RIP: evo_wait+0x5d/0x130 [nouveau] RSP:
ffffb4320e7afc78
Dec 30 12:17:21 nyx kernel: CR2: ffff8d9ebd7e5000
Dec 30 12:17:21 nyx kernel: ---[ end trace 4880f0d9dac51dbf ]---

Another freeze:
Probably the problem is purely nouveau related. My system froze again, but
again I was still able to access it via ssh (but not via the attached keybo=
ard
and display, even CTRL-ALT-F2, did not work):

Dec 30 13:15:23 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:07:48 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:59:14 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 16:59:52 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 17:10:14 nyx kernel: nf_conntrack: default automatic helper assignme=
nt
has been turned off for security reasons and CT-based  firewall rule not fo=
und.
Use the iptables CT target to attach helpers instead.
Dec 30 18:17:37 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:19:37 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:20:06 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 18:54:51 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 19:58:54 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 19:59:13 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 21:18:02 nyx kernel: perf: interrupt took too long (2505 &gt; 2500),
lowering kernel.perf_event_max_sample_rate to 79000
Dec 30 22:08:39 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 22:12:54 nyx kernel: nouveau 0000:23:00.0: disp: 0x000061ec[0]:
INIT_GENERIC_CONDITON: unknown 0x07
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: TRAP ch 14 [00ff115000
Xwayland[5346]]
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC0/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC1/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC0/TPC2/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: gr: GPC1/TPC2/TEX: 800000=
41
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: read fault at
000685a000 engine 00 [GR] client 18 [GPC1/PE_5] reason 02 [PTE] on channel =
14
[00ff115000 Xwayland[5346]]
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: channel 14: killed
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: runlist 0: scheduled
for recovery
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: fifo: engine 0: scheduled=
 for
recovery
Dec 30 23:22:32 nyx kernel: nouveau 0000:23:00.0: Xwayland[5346]: channel 14
killed!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15146737411.F6ECe.30858--

--===============1479636429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1479636429==--

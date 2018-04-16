From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106080] New: Time-out in
 `nvkm_fifo_chan_child_fini()`
Date: Mon, 16 Apr 2018 16:02:31 +0000
Message-ID: <bug-106080-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0739614320=="
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


--===============0739614320==
Content-Type: multipart/alternative; boundary="15238945510.E06D29F.31779"
Content-Transfer-Encoding: 7bit


--15238945510.E06D29F.31779
Date: Mon, 16 Apr 2018 16:02:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106080

            Bug ID: 106080
           Summary: Time-out in `nvkm_fifo_chan_child_fini()`
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

Created attachment 138869
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138869&action=3Dedit
Linux 4.14.30 messages

With Linux 4.14.30, X.Org X Server 1.19.3, libdrm 2.4.89 and Nouveau 1.0.15,
the X session of a user was just black coming back to the workplace on Mond=
ay.


```
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: gr: TRAP
DISPATCH_QUERY
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: gr: no s=
tuck
command?
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: fb: trap=
ped
write at 0020215000 on channel 9 [1f53d000 timetunnel[22607]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 02 [QUERY] reason 00000002
[PAGE_NOT_PRESENT]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: timeout
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: ------------[ cut here
]------------
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: WARNING: CPU: 7 PID: 22608 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c:111
g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Modules linked in: fuse nfsv4 =
nfs
nouveau 8021q wmi ttm drm_kms_helper garp mrp cfbfillrect syscopyarea cfbim=
gblt
sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb stp llc font fbdev drm
x86_pkg_temp_thermal kvm_intel kvm irqbypass crc32c_intel video nfsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc sch_fq_codel ip_tables =
unix
ipv6 autofs4
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CPU: 7 PID: 22608 Comm:
disk_cache:0 Not tainted 4.14.30.mx64.211 #1
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Hardware name: Dell Inc. OptiP=
lex
7010/0KRC95, BIOS A13 03/25/2013
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: task: ffff8802092511c0 task.st=
ack:
ffffc9000356c000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RIP:
0010:g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RSP: 0018:ffffc9000356fa20 EFL=
AGS:
00010282
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RAX: 000000000000001d RBX:
ffff880213e77460 RCX: 0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RDX: ffff88021dddbd70 RSI:
ffff88021ddd53d8 RDI: ffff88021ddd53d8
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RBP: ffff880212c29c00 R08:
000000000000738b R09: 0000000000000001
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R10: ffffffff8255ba20 R11:
0000000000000001 R12: ffff880131f6a808
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R13: 0000000000000020 R14:
ffff8801efc57000 R15: 0002a643d555de80
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: FS:  00007f8807e5c700(0000)
GS:ffff88021ddc0000(0000) knlGS:0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CS:  0010 DS: 0000 ES: 0000 CR=
0:
0000000080050033
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CR2: 00007faa51935a68 CR3:
000000000240a006 CR4: 00000000001606e0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Call Trace:
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_oproxy_fini+0x2b/0x80
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0xb8/0x210
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0x73/0x210
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_ioctl_del+0x7e/0xa0
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_ioctl+0x10a/0x240 [nouve=
au]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvif_object_fini+0x49/0x60
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_channel_del+0x6e/0x110
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
nouveau_abi16_chan_fini.isra.0+0xa1/0xe0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_abi16_fini+0x2d/0x70
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_drm_postclose+0x4b/0x=
d0
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  drm_release+0x264/0x380 [drm]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  __fput+0xa6/0x1e0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  task_work_run+0x7e/0xa0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_exit+0x2bc/0xb20
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_group_exit+0x33/0xa0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  get_signal+0x1e4/0x570
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_signal+0x23/0x5c0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  ? wake_up_q+0x54/0x80
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  ? SyS_futex+0x11d/0x150
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  exit_to_usermode_loop+0x79/0x=
90
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_syscall_64+0xf0/0x110
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
entry_SYSCALL_64_after_hwframe+0x3d/0xa2
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RIP: 0033:0x7f8811ebc542
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RSP: 002b:00007f8807e5bd40 EFL=
AGS:
00000246 ORIG_RAX: 00000000000000ca
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RAX: fffffffffffffe00 RBX:
000000000074e878 RCX: 00007f8811ebc542
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RDX: 0000000000000000 RSI:
0000000000000080 RDI: 000000000074e8a0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RBP: 000000000074e8a0 R08:
0000000000000000 R09: 000000000000000c
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R13: 00007f8807e5bd80 R14:
0000000000000000 R15: 000000000074e850
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Code: 7d a0 e1 48 8b 7d 10 48 =
8b
5f 50 48 85 db 0f 84 5d 02 00 00 e8 67 aa 0d e1 48 89 da 48 89 c6 48 c7 c7 =
b8
1a 50 a0 e8 f0 7c ca e0 <0f> 0b 48 8b 75 78 8b 7c 24 08 48 81 c6 20 25 00 0=
0 e8
4f f7 ff=20
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: ---[ end trace 4c650f0757036e91
]---
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: fifo:
channel 9 [timetunnel[22607]] unload timeout
Apr 14 02:19:23 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0:
lament[22606]: failed to idle channel 8 [lament[22606]]
Apr 14 02:19:38 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0:
lament[22606]: failed to idle channel 8 [lament[22606]]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: timeout
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: ------------[ cut here
]------------
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: WARNING: CPU: 5 PID: 22606 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c:111
g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Modules linked in: fuse nfsv4 =
nfs
nouveau 8021q wmi ttm drm_kms_helper garp mrp cfbfillrect syscopyarea cfbim=
gblt
sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb stp llc font fbdev drm
x86_pkg_temp_thermal kvm_intel kvm irqbypass crc32c_intel video nfsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc sch_fq_codel ip_tables =
unix
ipv6 autofs4
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CPU: 5 PID: 22606 Comm: lament
Tainted: G        W       4.14.30.mx64.211 #1
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Hardware name: Dell Inc. OptiP=
lex
7010/0KRC95, BIOS A13 03/25/2013
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: task: ffff88016f0e62c0 task.st=
ack:
ffffc900033c4000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RIP:
0010:g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RSP: 0018:ffffc900033c7a20 EFL=
AGS:
00010282
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RAX: 000000000000001d RBX:
ffff880213e77460 RCX: 0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RDX: ffff88021dd5bd70 RSI:
ffff88021dd553d8 RDI: ffff88021dd553d8
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RBP: ffff880212c29c00 R08:
00000000000073c0 R09: 0000000000000001
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R10: ffffffff8255ba20 R11:
0000000000000001 R12: ffff8801ff136008
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R13: 0000000000000020 R14:
ffff8801efc57000 R15: 0002a64b491e50e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: FS:  00007f2ca92a5c40(0000)
GS:ffff88021dd40000(0000) knlGS:0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CS:  0010 DS: 0000 ES: 0000 CR=
0:
0000000080050033
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CR2: 00007f77ade57a10 CR3:
000000000240a004 CR4: 00000000001606e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Call Trace:
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_oproxy_fini+0x2b/0x80
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0xb8/0x210
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0x73/0x210
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_ioctl_del+0x7e/0xa0
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_ioctl+0x10a/0x240 [nouve=
au]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvif_object_fini+0x49/0x60
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_channel_del+0x6e/0x110
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
nouveau_abi16_chan_fini.isra.0+0xa1/0xe0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_abi16_fini+0x2d/0x70
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_drm_postclose+0x4b/0x=
d0
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  drm_release+0x264/0x380 [drm]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  __fput+0xa6/0x1e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  task_work_run+0x7e/0xa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_exit+0x2bc/0xb20
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_group_exit+0x33/0xa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  get_signal+0x1e4/0x570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_signal+0x23/0x5c0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? update_curr+0x11e/0x170
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? update_curr+0xb9/0x170
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? pick_next_entity+0x70/0x110
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? sched_clock_cpu+0x11/0xb0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? __schedule+0xe9/0x790
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  exit_to_usermode_loop+0x79/0x=
90
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_syscall_64+0xf0/0x110
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
entry_SYSCALL_64_after_hwframe+0x3d/0xa2
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RIP: 0033:0x7f2ca63a1727
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RSP: 002b:00007ffe232fa378 EFL=
AGS:
00000246 ORIG_RAX: 0000000000000018
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RAX: 0000000000000000 RBX:
00000000000689c8 RCX: 00007f2ca63a1727
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: 0000000000913570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RBP: 0000000000c0a9d0 R08:
000000000091aaa0 R09: 000000000091aaa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R10: 00000000009134c0 R11:
0000000000000246 R12: 0000000000913570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R13: 0000000000000001 R14:
0000000000000000 R15: 0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Code: 7d a0 e1 48 8b 7d 10 48 =
8b
5f 50 48 85 db 0f 84 5d 02 00 00 e8 67 aa 0d e1 48 89 da 48 89 c6 48 c7 c7 =
b8
1a 50 a0 e8 f0 7c ca e0 <0f> 0b 48 8b 75 78 8b 7c 24 08 48 81 c6 20 25 00 0=
0 e8
4f f7 ff=20
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: ---[ end trace 4c650f0757036e92
]---

Please find the Linux and X server messages attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15238945510.E06D29F.31779
Date: Mon, 16 Apr 2018 16:02:31 +0000
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
   title=3D"NEW - Time-out in `nvkm_fifo_chan_child_fini()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106080">106080</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Time-out in `nvkm_fifo_chan_child_fini()`
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138869=
" name=3D"attach_138869" title=3D"Linux 4.14.30 messages">attachment 138869=
</a> <a href=3D"attachment.cgi?id=3D138869&amp;action=3Dedit" title=3D"Linu=
x 4.14.30 messages">[details]</a></span>
Linux 4.14.30 messages

With Linux 4.14.30, X.Org X Server 1.19.3, libdrm 2.4.89 and Nouveau 1.0.15,
the X session of a user was just black coming back to the workplace on Mond=
ay.


```
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: gr: TRAP
DISPATCH_QUERY
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: gr: no s=
tuck
command?
Apr 14 02:19:06 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: fb: trap=
ped
write at 0020215000 on channel 9 [1f53d000 timetunnel[22607]] engine 00
[PGRAPH] client 03 [DISPATCH] subclient 02 [QUERY] reason 00000002
[PAGE_NOT_PRESENT]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: timeout
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: ------------[ cut here
]------------
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: WARNING: CPU: 7 PID: 22608 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c:111
g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Modules linked in: fuse nfsv4 =
nfs
nouveau 8021q wmi ttm drm_kms_helper garp mrp cfbfillrect syscopyarea cfbim=
gblt
sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb stp llc font fbdev drm
x86_pkg_temp_thermal kvm_intel kvm irqbypass crc32c_intel video nfsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc sch_fq_codel ip_tables =
unix
ipv6 autofs4
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CPU: 7 PID: 22608 Comm:
disk_cache:0 Not tainted 4.14.30.mx64.211 #1
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Hardware name: Dell Inc. OptiP=
lex
7010/0KRC95, BIOS A13 03/25/2013
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: task: ffff8802092511c0 task.st=
ack:
ffffc9000356c000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RIP:
0010:g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RSP: 0018:ffffc9000356fa20 EFL=
AGS:
00010282
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RAX: 000000000000001d RBX:
ffff880213e77460 RCX: 0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RDX: ffff88021dddbd70 RSI:
ffff88021ddd53d8 RDI: ffff88021ddd53d8
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RBP: ffff880212c29c00 R08:
000000000000738b R09: 0000000000000001
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R10: ffffffff8255ba20 R11:
0000000000000001 R12: ffff880131f6a808
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R13: 0000000000000020 R14:
ffff8801efc57000 R15: 0002a643d555de80
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: FS:  00007f8807e5c700(0000)
GS:ffff88021ddc0000(0000) knlGS:0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CS:  0010 DS: 0000 ES: 0000 CR=
0:
0000000080050033
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: CR2: 00007faa51935a68 CR3:
000000000240a006 CR4: 00000000001606e0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Call Trace:
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_oproxy_fini+0x2b/0x80
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0xb8/0x210
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0x73/0x210
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_ioctl_del+0x7e/0xa0
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvkm_ioctl+0x10a/0x240 [nouve=
au]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nvif_object_fini+0x49/0x60
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_channel_del+0x6e/0x110
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
nouveau_abi16_chan_fini.isra.0+0xa1/0xe0 [nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_abi16_fini+0x2d/0x70
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  nouveau_drm_postclose+0x4b/0x=
d0
[nouveau]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  drm_release+0x264/0x380 [drm]
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  __fput+0xa6/0x1e0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  task_work_run+0x7e/0xa0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_exit+0x2bc/0xb20
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_group_exit+0x33/0xa0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  get_signal+0x1e4/0x570
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_signal+0x23/0x5c0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  ? wake_up_q+0x54/0x80
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  ? SyS_futex+0x11d/0x150
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  exit_to_usermode_loop+0x79/0x=
90
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:  do_syscall_64+0xf0/0x110
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel:=20
entry_SYSCALL_64_after_hwframe+0x3d/0xa2
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RIP: 0033:0x7f8811ebc542
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RSP: 002b:00007f8807e5bd40 EFL=
AGS:
00000246 ORIG_RAX: 00000000000000ca
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RAX: fffffffffffffe00 RBX:
000000000074e878 RCX: 00007f8811ebc542
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RDX: 0000000000000000 RSI:
0000000000000080 RDI: 000000000074e8a0
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: RBP: 000000000074e8a0 R08:
0000000000000000 R09: 000000000000000c
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R10: 0000000000000000 R11:
0000000000000246 R12: 0000000000000000
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: R13: 00007f8807e5bd80 R14:
0000000000000000 R15: 000000000074e850
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: Code: 7d a0 e1 48 8b 7d 10 48 =
8b
5f 50 48 85 db 0f 84 5d 02 00 00 e8 67 aa 0d e1 48 89 da 48 89 c6 48 c7 c7 =
b8
1a 50 a0 e8 f0 7c ca e0 &lt;0f&gt; 0b 48 8b 75 78 8b 7c 24 08 48 81 c6 20 2=
5 00 00 e8
4f f7 ff=20
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: ---[ end trace 4c650f0757036e91
]---
Apr 14 02:19:08 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: fifo:
channel 9 [timetunnel[22607]] unload timeout
Apr 14 02:19:23 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0:
lament[22606]: failed to idle channel 8 [lament[22606]]
Apr 14 02:19:38 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0:
lament[22606]: failed to idle channel 8 [lament[22606]]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: nouveau 0000:01:00.0: timeout
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: ------------[ cut here
]------------
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: WARNING: CPU: 5 PID: 22606 at
drivers/gpu/drm/nouveau/nvkm/engine/fifo/chang84.c:111
g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Modules linked in: fuse nfsv4 =
nfs
nouveau 8021q wmi ttm drm_kms_helper garp mrp cfbfillrect syscopyarea cfbim=
gblt
sysfillrect sysimgblt fb_sys_fops cfbcopyarea fb stp llc font fbdev drm
x86_pkg_temp_thermal kvm_intel kvm irqbypass crc32c_intel video nfsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc sch_fq_codel ip_tables =
unix
ipv6 autofs4
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CPU: 5 PID: 22606 Comm: lament
Tainted: G        W       4.14.30.mx64.211 #1
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Hardware name: Dell Inc. OptiP=
lex
7010/0KRC95, BIOS A13 03/25/2013
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: task: ffff88016f0e62c0 task.st=
ack:
ffffc900033c4000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RIP:
0010:g84_fifo_chan_engine_fini+0x7b/0x2d0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RSP: 0018:ffffc900033c7a20 EFL=
AGS:
00010282
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RAX: 000000000000001d RBX:
ffff880213e77460 RCX: 0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RDX: ffff88021dd5bd70 RSI:
ffff88021dd553d8 RDI: ffff88021dd553d8
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RBP: ffff880212c29c00 R08:
00000000000073c0 R09: 0000000000000001
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R10: ffffffff8255ba20 R11:
0000000000000001 R12: ffff8801ff136008
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R13: 0000000000000020 R14:
ffff8801efc57000 R15: 0002a64b491e50e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: FS:  00007f2ca92a5c40(0000)
GS:ffff88021dd40000(0000) knlGS:0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CS:  0010 DS: 0000 ES: 0000 CR=
0:
0000000080050033
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: CR2: 00007f77ade57a10 CR3:
000000000240a004 CR4: 00000000001606e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Call Trace:
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
nvkm_fifo_chan_child_fini+0x63/0xf0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_oproxy_fini+0x2b/0x80
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0xb8/0x210
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_object_fini+0x73/0x210
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_ioctl_del+0x7e/0xa0
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvkm_ioctl+0x10a/0x240 [nouve=
au]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nvif_object_fini+0x49/0x60
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_channel_del+0x6e/0x110
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
nouveau_abi16_chan_fini.isra.0+0xa1/0xe0 [nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_abi16_fini+0x2d/0x70
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  nouveau_drm_postclose+0x4b/0x=
d0
[nouveau]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  drm_release+0x264/0x380 [drm]
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  __fput+0xa6/0x1e0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  task_work_run+0x7e/0xa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_exit+0x2bc/0xb20
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_group_exit+0x33/0xa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  get_signal+0x1e4/0x570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_signal+0x23/0x5c0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? update_curr+0x11e/0x170
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? update_curr+0xb9/0x170
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? pick_next_entity+0x70/0x110
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? sched_clock_cpu+0x11/0xb0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  ? __schedule+0xe9/0x790
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  exit_to_usermode_loop+0x79/0x=
90
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:  do_syscall_64+0xf0/0x110
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel:=20
entry_SYSCALL_64_after_hwframe+0x3d/0xa2
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RIP: 0033:0x7f2ca63a1727
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RSP: 002b:00007ffe232fa378 EFL=
AGS:
00000246 ORIG_RAX: 0000000000000018
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RAX: 0000000000000000 RBX:
00000000000689c8 RCX: 00007f2ca63a1727
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RDX: 0000000000000000 RSI:
0000000000000000 RDI: 0000000000913570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: RBP: 0000000000c0a9d0 R08:
000000000091aaa0 R09: 000000000091aaa0
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R10: 00000000009134c0 R11:
0000000000000246 R12: 0000000000913570
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: R13: 0000000000000001 R14:
0000000000000000 R15: 0000000000000000
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: Code: 7d a0 e1 48 8b 7d 10 48 =
8b
5f 50 48 85 db 0f 84 5d 02 00 00 e8 67 aa 0d e1 48 89 da 48 89 c6 48 c7 c7 =
b8
1a 50 a0 e8 f0 7c ca e0 &lt;0f&gt; 0b 48 8b 75 78 8b 7c 24 08 48 81 c6 20 2=
5 00 00 e8
4f f7 ff=20
Apr 14 02:19:40 bicoid.molgen.mpg.de kernel: ---[ end trace 4c650f0757036e92
]---

Please find the Linux and X server messages attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15238945510.E06D29F.31779--

--===============0739614320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0739614320==--

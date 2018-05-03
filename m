From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103689] kernel panic via the chromium browser
Date: Thu, 03 May 2018 09:29:05 +0000
Message-ID: <bug-103689-8800-lGjuok8W5B@http.bugs.freedesktop.org/>
References: <bug-103689-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0225321064=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103689-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0225321064==
Content-Type: multipart/alternative; boundary="15253397441.64B0d9ddd.12595"
Content-Transfer-Encoding: 7bit


--15253397441.64B0d9ddd.12595
Date: Thu, 3 May 2018 09:29:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103689

Markos Chandras <mchandras-l3A5Bk7waGM@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mchandras-l3A5Bk7waGM@public.gmane.org

--- Comment #7 from Markos Chandras <mchandras-l3A5Bk7waGM@public.gmane.org> ---
I also have this problem on openSUSE tumbleweed using the following compone=
nts

kernel 4.16.5
nouveau 1.0.15
gnome 3.28

May 03 08:13:52 aegean kernel: WARNING: CPU: 7 PID: 24573 at
../drivers/gpu/drm/nouveau/nouveau_bo.c:1291 nouveau_bo_move_ntfy+0xc9/0xd0
[nouveau]
May 03 08:13:52 aegean kernel: Modules linked in: fuse nfsv3 nfs_acl nfs lo=
ckd
grace fscache af_packet xt_CHECKSUM tun devlink ipt_MASQUERADE
nf_nat_masquerade_ipv4 nf_conntrack_netlink xfrm_user xfrm_algo xt_addrtype
ip6t_rpfilter ip6t_R
May 03 08:13:52 aegean kernel:  snd_hda_codec_generic hid_generic usbhid
intel_rapl sb_edac x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel=
 kvm
snd_hda_intel snd_hda_codec irqbypass crct10dif_pclmul crc32_pclmul
crc32c_intel snd_
May 03 08:13:52 aegean kernel:  vboxnetadp(O) vboxdrv(O)
May 03 08:13:52 aegean kernel: CPU: 7 PID: 24573 Comm: kworker/u16:20 Taint=
ed:
G           O     4.16.4-1-default #1 openSUSE Tumbleweed (unreleased)
May 03 08:13:52 aegean kernel: Hardware name: Dell Inc. Precision Tower
5810/0HHV7N, BIOS A25 02/02/2018
May 03 08:13:52 aegean kernel: Workqueue: events_unbound async_run_entry_fn
May 03 08:13:52 aegean kernel: RIP: 0010:nouveau_bo_move_ntfy+0xc9/0xd0
[nouveau]
May 03 08:13:52 aegean kernel: RSP: 0018:ffffafdd41fd7b50 EFLAGS: 00010286
May 03 08:13:52 aegean kernel: RAX: 00000000fffffff0 RBX: ffff9da45e156d00 =
RCX:
0000000000000000
May 03 08:13:52 aegean kernel: RDX: ffff9da17788a3a8 RSI: 0000000000000296 =
RDI:
0000000000000296
May 03 08:13:52 aegean kernel: RBP: ffff9da424ba1000 R08: 00004f6784b8e400 =
R09:
0000000000000000
May 03 08:13:52 aegean kernel: R10: 0000000000000000 R11: 00000000003d0900 =
R12:
ffff9da424ba12f0
May 03 08:13:52 aegean kernel: R13: ffff9da14eb2de80 R14: ffffafdd41fd7d28 =
R15:
ffffafdd41fd7c40
May 03 08:13:52 aegean kernel: FS:  0000000000000000(0000)
GS:ffff9da46fdc0000(0000) knlGS:0000000000000000
May 03 08:13:52 aegean kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 03 08:13:52 aegean kernel: CR2: 000055a9ca2c2328 CR3: 000000010600a006 =
CR4:
00000000001606e0
May 03 08:13:52 aegean kernel: Call Trace:
May 03 08:13:52 aegean kernel:  ttm_bo_handle_move_mem+0x248/0x5b0 [ttm]
May 03 08:13:52 aegean kernel:  ttm_bo_evict+0x115/0x2f0 [ttm]
May 03 08:13:52 aegean kernel:  ? nv50_disp_atomic_commit_tail+0x94c/0x1150
[nouveau]
May 03 08:13:52 aegean kernel:  ? kmem_cache_alloc_node_trace+0x19c/0x580
May 03 08:13:52 aegean kernel:  ttm_mem_evict_first+0x190/0x200 [ttm]
May 03 08:13:52 aegean kernel:  ttm_bo_force_list_clean+0x7e/0x140 [ttm]
May 03 08:13:52 aegean kernel:  ? pci_pm_thaw+0x80/0x80
May 03 08:13:52 aegean kernel:  nouveau_do_suspend+0x7b/0x2a0 [nouveau]
May 03 08:13:52 aegean kernel:  pci_pm_freeze+0x55/0xc0
May 03 08:13:52 aegean kernel:  dpm_run_callback+0x4d/0x170
May 03 08:13:52 aegean kernel:  __device_suspend+0x12a/0x4a0
May 03 08:13:52 aegean kernel:  ? dpm_show_time+0xd0/0xd0
May 03 08:13:52 aegean kernel:  async_suspend+0x1a/0x90
May 03 08:13:52 aegean kernel:  async_run_entry_fn+0x37/0x140
May 03 08:13:52 aegean kernel:  process_one_work+0x1d4/0x3f0
May 03 08:13:52 aegean kernel:  worker_thread+0x2b/0x3d0
May 03 08:13:52 aegean kernel:  ? process_one_work+0x3f0/0x3f0
May 03 08:13:52 aegean kernel:  kthread+0x113/0x130
May 03 08:13:52 aegean kernel:  ? kthread_create_worker_on_cpu+0x50/0x50
May 03 08:13:52 aegean kernel:  ret_from_fork+0x3a/0x50
May 03 08:13:52 aegean kernel: Code: f0 49 39 c4 75 db e9 7a ff ff ff 48 3d=
 90
2a 69 c0 0f 85 6e ff ff ff 48 8b 87 f0 02 00 00 4c 8d a7 f0 02 00 00 48 8d =
58
f0 eb d6 <0f> 0b eb c2 0f 1f 00 0f 1f 44 00 00 41 57 41 56 49 89 ce 41 55=20
May 03 08:13:52 aegean kernel: ---[ end trace 0f74df35408381b1 ]---

and the logs are then filled with

May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are on the CC list for the bug.=

--15253397441.64B0d9ddd.12595
Date: Thu, 3 May 2018 09:29:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mchandras=
&#64;suse.de" title=3D"Markos Chandras &lt;mchandras&#64;suse.de&gt;"> <spa=
n class=3D"fn">Markos Chandras</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel panic via the chromium browser"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689">bug 10368=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>mchandras&#64;suse.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel panic via the chromium browser"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel panic via the chromium browser"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689">bug 10368=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mchandras&#64;suse.de" title=3D"Markos Chandras &lt;mchandras&#64;suse.de&g=
t;"> <span class=3D"fn">Markos Chandras</span></a>
</span></b>
        <pre>I also have this problem on openSUSE tumbleweed using the foll=
owing components

kernel 4.16.5
nouveau 1.0.15
gnome 3.28

May 03 08:13:52 aegean kernel: WARNING: CPU: 7 PID: 24573 at
../drivers/gpu/drm/nouveau/nouveau_bo.c:1291 nouveau_bo_move_ntfy+0xc9/0xd0
[nouveau]
May 03 08:13:52 aegean kernel: Modules linked in: fuse nfsv3 nfs_acl nfs lo=
ckd
grace fscache af_packet xt_CHECKSUM tun devlink ipt_MASQUERADE
nf_nat_masquerade_ipv4 nf_conntrack_netlink xfrm_user xfrm_algo xt_addrtype
ip6t_rpfilter ip6t_R
May 03 08:13:52 aegean kernel:  snd_hda_codec_generic hid_generic usbhid
intel_rapl sb_edac x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel=
 kvm
snd_hda_intel snd_hda_codec irqbypass crct10dif_pclmul crc32_pclmul
crc32c_intel snd_
May 03 08:13:52 aegean kernel:  vboxnetadp(O) vboxdrv(O)
May 03 08:13:52 aegean kernel: CPU: 7 PID: 24573 Comm: kworker/u16:20 Taint=
ed:
G           O     4.16.4-1-default #1 openSUSE Tumbleweed (unreleased)
May 03 08:13:52 aegean kernel: Hardware name: Dell Inc. Precision Tower
5810/0HHV7N, BIOS A25 02/02/2018
May 03 08:13:52 aegean kernel: Workqueue: events_unbound async_run_entry_fn
May 03 08:13:52 aegean kernel: RIP: 0010:nouveau_bo_move_ntfy+0xc9/0xd0
[nouveau]
May 03 08:13:52 aegean kernel: RSP: 0018:ffffafdd41fd7b50 EFLAGS: 00010286
May 03 08:13:52 aegean kernel: RAX: 00000000fffffff0 RBX: ffff9da45e156d00 =
RCX:
0000000000000000
May 03 08:13:52 aegean kernel: RDX: ffff9da17788a3a8 RSI: 0000000000000296 =
RDI:
0000000000000296
May 03 08:13:52 aegean kernel: RBP: ffff9da424ba1000 R08: 00004f6784b8e400 =
R09:
0000000000000000
May 03 08:13:52 aegean kernel: R10: 0000000000000000 R11: 00000000003d0900 =
R12:
ffff9da424ba12f0
May 03 08:13:52 aegean kernel: R13: ffff9da14eb2de80 R14: ffffafdd41fd7d28 =
R15:
ffffafdd41fd7c40
May 03 08:13:52 aegean kernel: FS:  0000000000000000(0000)
GS:ffff9da46fdc0000(0000) knlGS:0000000000000000
May 03 08:13:52 aegean kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 03 08:13:52 aegean kernel: CR2: 000055a9ca2c2328 CR3: 000000010600a006 =
CR4:
00000000001606e0
May 03 08:13:52 aegean kernel: Call Trace:
May 03 08:13:52 aegean kernel:  ttm_bo_handle_move_mem+0x248/0x5b0 [ttm]
May 03 08:13:52 aegean kernel:  ttm_bo_evict+0x115/0x2f0 [ttm]
May 03 08:13:52 aegean kernel:  ? nv50_disp_atomic_commit_tail+0x94c/0x1150
[nouveau]
May 03 08:13:52 aegean kernel:  ? kmem_cache_alloc_node_trace+0x19c/0x580
May 03 08:13:52 aegean kernel:  ttm_mem_evict_first+0x190/0x200 [ttm]
May 03 08:13:52 aegean kernel:  ttm_bo_force_list_clean+0x7e/0x140 [ttm]
May 03 08:13:52 aegean kernel:  ? pci_pm_thaw+0x80/0x80
May 03 08:13:52 aegean kernel:  nouveau_do_suspend+0x7b/0x2a0 [nouveau]
May 03 08:13:52 aegean kernel:  pci_pm_freeze+0x55/0xc0
May 03 08:13:52 aegean kernel:  dpm_run_callback+0x4d/0x170
May 03 08:13:52 aegean kernel:  __device_suspend+0x12a/0x4a0
May 03 08:13:52 aegean kernel:  ? dpm_show_time+0xd0/0xd0
May 03 08:13:52 aegean kernel:  async_suspend+0x1a/0x90
May 03 08:13:52 aegean kernel:  async_run_entry_fn+0x37/0x140
May 03 08:13:52 aegean kernel:  process_one_work+0x1d4/0x3f0
May 03 08:13:52 aegean kernel:  worker_thread+0x2b/0x3d0
May 03 08:13:52 aegean kernel:  ? process_one_work+0x3f0/0x3f0
May 03 08:13:52 aegean kernel:  kthread+0x113/0x130
May 03 08:13:52 aegean kernel:  ? kthread_create_worker_on_cpu+0x50/0x50
May 03 08:13:52 aegean kernel:  ret_from_fork+0x3a/0x50
May 03 08:13:52 aegean kernel: Code: f0 49 39 c4 75 db e9 7a ff ff ff 48 3d=
 90
2a 69 c0 0f 85 6e ff ff ff 48 8b 87 f0 02 00 00 4c 8d a7 f0 02 00 00 48 8d =
58
f0 eb d6 &lt;0f&gt; 0b eb c2 0f 1f 00 0f 1f 44 00 00 41 57 41 56 49 89 ce 4=
1 55=20
May 03 08:13:52 aegean kernel: ---[ end trace 0f74df35408381b1 ]---

and the logs are then filled with

May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a2040a0e, s=
ph:
0x040a0e, stage: 0x22
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: TRAP ch 15 [007e92=
2000
gnome-shell[5215]]
May 03 08:13:52 aegean kernel: nouveau 0000:03:00.0: gr: SHADER a204020e, s=
ph:
0x04020e, stage: 0x22</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are on the CC list for the bug.</li>
      </ul>
    </body>
</html>=

--15253397441.64B0d9ddd.12595--

--===============0225321064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0225321064==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] [NV137/GP107] xorg-server-1.19.3 crashes
 when trying to enable HDMI output
Date: Sat, 23 Feb 2019 16:50:30 +0000
Message-ID: <bug-101220-8800-Rj5BA8qtNR@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117573053=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0117573053==
Content-Type: multipart/alternative; boundary="15509406301.88Aa.16863"
Content-Transfer-Encoding: 7bit


--15509406301.88Aa.16863
Date: Sat, 23 Feb 2019 16:50:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #19 from Pacho Ramos <pachoramos1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Any news on this? I still need to run with noaccel with kernel 4.19.25,
otherwise system ends up getting hung after showing this errors:
feb 23 17:21:08 dell-2017 kernel: ------------[ cut here ]------------
feb 23 17:21:08 dell-2017 kernel: nouveau 0000:01:00.0: timeout
feb 23 17:21:08 dell-2017 kernel: WARNING: CPU: 4 PID: 64 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:207
gf100_vmm_flush_+0x149/0x190 [nouveau]
feb 23 17:21:08 dell-2017 kernel: Modules linked in: cmac ctr ccm bnep uvcv=
ideo
videobuf2_vmalloc btusb videobuf2_memops videobuf2_v4l2 btrtl videodev btbcm
btintel videobuf2_common bluetooth ecdh_generic hid_m>
feb 23 17:21:08 dell-2017 kernel:  acpi_pad int340x_thermal_zone
int3400_thermal acpi_thermal_rel vboxpci(O) vboxnetadp(O) vboxnetflt(O)
vboxdrv(O)
feb 23 17:21:08 dell-2017 kernel: CPU: 4 PID: 64 Comm: kworker/4:1 Tainted:=
 G=20=20
     W  O      4.19.25-gentoo #1
feb 23 17:21:08 dell-2017 kernel: Hardware name: Dell Inc. Inspiron 15 7000
Gaming/065C71, BIOS 1.6.0 03/27/2018
feb 23 17:21:08 dell-2017 kernel: Workqueue: pm pm_runtime_work
feb 23 17:21:08 dell-2017 kernel: RIP: 0010:gf100_vmm_flush_+0x149/0x190
[nouveau]
feb 23 17:21:08 dell-2017 kernel: Code: 5f e9 3b ae 56 e1 48 8b 7d 10 48 8b=
 5f
50 48 85 db 74 46 e8 09 7b 32 e1 48 89 da 48 89 c6 48 c7 c7 a4 a8 3a a0 e8 =
07
63 df e0 <0f> 0b eb c2 48 8b 7d 10 48 8b 5f 50 48 85 >
feb 23 17:21:08 dell-2017 kernel: RSP: 0018:ffffc90001b53718 EFLAGS: 000102=
96
feb 23 17:21:08 dell-2017 kernel: RAX: 000000000000001d RBX: ffff88846cdae2=
d0
RCX: 0000000000000006
feb 23 17:21:08 dell-2017 kernel: RDX: 0000000000000007 RSI: 00000000000000=
86
RDI: ffff88846f7153f0
feb 23 17:21:08 dell-2017 kernel: RBP: ffff88846bc37800 R08: 00000000000000=
01
R09: 00000000000004b3
feb 23 17:21:08 dell-2017 kernel: R10: 0000000000000001 R11: 00000000000000=
00
R12: ffff88846277e660
feb 23 17:21:08 dell-2017 kernel: R13: 0000000c6f79dd60 R14: ffff88846aa340=
20
R15: ffff88846aad3600
feb 23 17:21:08 dell-2017 kernel: FS:  0000000000000000(0000)
GS:ffff88846f700000(0000) knlGS:0000000000000000
feb 23 17:21:08 dell-2017 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
feb 23 17:21:08 dell-2017 kernel: CR2: 00007fab22c8d4a0 CR3: 000000000200a0=
02
CR4: 00000000003606e0
feb 23 17:21:08 dell-2017 kernel: Call Trace:
feb 23 17:21:08 dell-2017 kernel:  nvkm_vmm_iter.constprop.15+0x2cf/0x7e0
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? nvkm_vmm_map+0xb8/0x3e0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_vmm_map+0x1a5/0x3e0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? gp100_vmm_pgt_sgl+0x180/0x180 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_vram_map+0x43/0x50 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_uvmm_mthd+0x71e/0x850 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? lock_timer_base+0x62/0x80
feb 23 17:21:08 dell-2017 kernel:  nvkm_ioctl+0x105/0x240 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvif_object_mthd+0xd3/0xf0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? dma_fence_wait_timeout+0x30/0x30
feb 23 17:21:08 dell-2017 kernel:  nvif_vmm_map+0xef/0x110 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_mem_map+0x73/0xd0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_vma_map+0x2f/0x40 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_bo_move_ntfy+0x6b/0xd0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_handle_move_mem+0x3b1/0x590 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? drm_vma_offset_add+0x3c/0x60
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_evict+0x145/0x320 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? gf119_disp_chan_uevent_fini+0x3d/0x60
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? nouveau_bo_invalidate_caches+0x10/0x10
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? drm_vma_offset_add+0x3c/0x60
feb 23 17:21:08 dell-2017 kernel:  ? drm_mode_std+0x479/0x4a0
feb 23 17:21:08 dell-2017 kernel:  ttm_mem_evict_first+0x18b/0x210 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_force_list_clean+0x8a/0x150 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  nouveau_do_suspend+0x76/0x2a0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_pmops_runtime_suspend+0x3d/0xa0
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  pci_pm_runtime_suspend+0x56/0x150
feb 23 17:21:08 dell-2017 kernel:  ? next_online_pgdat+0x1d/0x40
feb 23 17:21:08 dell-2017 kernel:  __rpm_callback+0xb3/0x1b0
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  rpm_callback+0x1a/0x70
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  rpm_suspend+0x110/0x520
feb 23 17:21:08 dell-2017 kernel:  ? __update_idle_core+0x1b/0xb0
feb 23 17:21:08 dell-2017 kernel:  pm_runtime_work+0x5f/0xa0
feb 23 17:21:08 dell-2017 kernel:  process_one_work+0x1c3/0x340
feb 23 17:21:08 dell-2017 kernel:  worker_thread+0x28/0x3c0
feb 23 17:21:08 dell-2017 kernel:  ? set_worker_desc+0x90/0x90
feb 23 17:21:08 dell-2017 kernel:  kthread+0x109/0x120
feb 23 17:21:08 dell-2017 kernel:  ? kthread_create_worker_on_cpu+0x40/0x40
feb 23 17:21:08 dell-2017 kernel:  ret_from_fork+0x1f/0x40
feb 23 17:21:08 dell-2017 kernel: ---[ end trace 3e9fb3a70dfda7a7 ]---
feb 23 17:21:08 dell-2017 kernel: [TTM] Buffer eviction failed

Thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15509406301.88Aa.16863
Date: Sat, 23 Feb 2019 16:50:30 +0000
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
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137/GP107] xorg-server-1.19.3 crashes when trying to e=
nable HDMI output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pachoramos1&#64;gmail.com" title=3D"Pacho Ramos &lt;pachoramos1&#64;gmail.c=
om&gt;"> <span class=3D"fn">Pacho Ramos</span></a>
</span></b>
        <pre>Any news on this? I still need to run with noaccel with kernel=
 4.19.25,
otherwise system ends up getting hung after showing this errors:
feb 23 17:21:08 dell-2017 kernel: ------------[ cut here ]------------
feb 23 17:21:08 dell-2017 kernel: nouveau 0000:01:00.0: timeout
feb 23 17:21:08 dell-2017 kernel: WARNING: CPU: 4 PID: 64 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:207
gf100_vmm_flush_+0x149/0x190 [nouveau]
feb 23 17:21:08 dell-2017 kernel: Modules linked in: cmac ctr ccm bnep uvcv=
ideo
videobuf2_vmalloc btusb videobuf2_memops videobuf2_v4l2 btrtl videodev btbcm
btintel videobuf2_common bluetooth ecdh_generic hid_m&gt;
feb 23 17:21:08 dell-2017 kernel:  acpi_pad int340x_thermal_zone
int3400_thermal acpi_thermal_rel vboxpci(O) vboxnetadp(O) vboxnetflt(O)
vboxdrv(O)
feb 23 17:21:08 dell-2017 kernel: CPU: 4 PID: 64 Comm: kworker/4:1 Tainted:=
 G=20=20
     W  O      4.19.25-gentoo #1
feb 23 17:21:08 dell-2017 kernel: Hardware name: Dell Inc. Inspiron 15 7000
Gaming/065C71, BIOS 1.6.0 03/27/2018
feb 23 17:21:08 dell-2017 kernel: Workqueue: pm pm_runtime_work
feb 23 17:21:08 dell-2017 kernel: RIP: 0010:gf100_vmm_flush_+0x149/0x190
[nouveau]
feb 23 17:21:08 dell-2017 kernel: Code: 5f e9 3b ae 56 e1 48 8b 7d 10 48 8b=
 5f
50 48 85 db 74 46 e8 09 7b 32 e1 48 89 da 48 89 c6 48 c7 c7 a4 a8 3a a0 e8 =
07
63 df e0 &lt;0f&gt; 0b eb c2 48 8b 7d 10 48 8b 5f 50 48 85 &gt;
feb 23 17:21:08 dell-2017 kernel: RSP: 0018:ffffc90001b53718 EFLAGS: 000102=
96
feb 23 17:21:08 dell-2017 kernel: RAX: 000000000000001d RBX: ffff88846cdae2=
d0
RCX: 0000000000000006
feb 23 17:21:08 dell-2017 kernel: RDX: 0000000000000007 RSI: 00000000000000=
86
RDI: ffff88846f7153f0
feb 23 17:21:08 dell-2017 kernel: RBP: ffff88846bc37800 R08: 00000000000000=
01
R09: 00000000000004b3
feb 23 17:21:08 dell-2017 kernel: R10: 0000000000000001 R11: 00000000000000=
00
R12: ffff88846277e660
feb 23 17:21:08 dell-2017 kernel: R13: 0000000c6f79dd60 R14: ffff88846aa340=
20
R15: ffff88846aad3600
feb 23 17:21:08 dell-2017 kernel: FS:  0000000000000000(0000)
GS:ffff88846f700000(0000) knlGS:0000000000000000
feb 23 17:21:08 dell-2017 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
feb 23 17:21:08 dell-2017 kernel: CR2: 00007fab22c8d4a0 CR3: 000000000200a0=
02
CR4: 00000000003606e0
feb 23 17:21:08 dell-2017 kernel: Call Trace:
feb 23 17:21:08 dell-2017 kernel:  nvkm_vmm_iter.constprop.15+0x2cf/0x7e0
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? nvkm_vmm_map+0xb8/0x3e0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_vmm_map+0x1a5/0x3e0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? gp100_vmm_pgt_sgl+0x180/0x180 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_vram_map+0x43/0x50 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvkm_uvmm_mthd+0x71e/0x850 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? lock_timer_base+0x62/0x80
feb 23 17:21:08 dell-2017 kernel:  nvkm_ioctl+0x105/0x240 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nvif_object_mthd+0xd3/0xf0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? dma_fence_wait_timeout+0x30/0x30
feb 23 17:21:08 dell-2017 kernel:  nvif_vmm_map+0xef/0x110 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_mem_map+0x73/0xd0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_vma_map+0x2f/0x40 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_bo_move_ntfy+0x6b/0xd0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_handle_move_mem+0x3b1/0x590 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? drm_vma_offset_add+0x3c/0x60
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_evict+0x145/0x320 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? gf119_disp_chan_uevent_fini+0x3d/0x60
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? nouveau_bo_invalidate_caches+0x10/0x10
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  ? drm_vma_offset_add+0x3c/0x60
feb 23 17:21:08 dell-2017 kernel:  ? drm_mode_std+0x479/0x4a0
feb 23 17:21:08 dell-2017 kernel:  ttm_mem_evict_first+0x18b/0x210 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ttm_bo_force_list_clean+0x8a/0x150 [ttm]
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  nouveau_do_suspend+0x76/0x2a0 [nouveau]
feb 23 17:21:08 dell-2017 kernel:  nouveau_pmops_runtime_suspend+0x3d/0xa0
[nouveau]
feb 23 17:21:08 dell-2017 kernel:  pci_pm_runtime_suspend+0x56/0x150
feb 23 17:21:08 dell-2017 kernel:  ? next_online_pgdat+0x1d/0x40
feb 23 17:21:08 dell-2017 kernel:  __rpm_callback+0xb3/0x1b0
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  rpm_callback+0x1a/0x70
feb 23 17:21:08 dell-2017 kernel:  ? pci_pm_runtime_resume+0xc0/0xc0
feb 23 17:21:08 dell-2017 kernel:  rpm_suspend+0x110/0x520
feb 23 17:21:08 dell-2017 kernel:  ? __update_idle_core+0x1b/0xb0
feb 23 17:21:08 dell-2017 kernel:  pm_runtime_work+0x5f/0xa0
feb 23 17:21:08 dell-2017 kernel:  process_one_work+0x1c3/0x340
feb 23 17:21:08 dell-2017 kernel:  worker_thread+0x28/0x3c0
feb 23 17:21:08 dell-2017 kernel:  ? set_worker_desc+0x90/0x90
feb 23 17:21:08 dell-2017 kernel:  kthread+0x109/0x120
feb 23 17:21:08 dell-2017 kernel:  ? kthread_create_worker_on_cpu+0x40/0x40
feb 23 17:21:08 dell-2017 kernel:  ret_from_fork+0x1f/0x40
feb 23 17:21:08 dell-2017 kernel: ---[ end trace 3e9fb3a70dfda7a7 ]---
feb 23 17:21:08 dell-2017 kernel: [TTM] Buffer eviction failed

Thanks</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15509406301.88Aa.16863--

--===============0117573053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0117573053==--

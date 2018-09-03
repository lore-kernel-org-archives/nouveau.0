From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107818] New: linux-4.18.5 every boot some drivers
 errors
Date: Mon, 03 Sep 2018 17:38:23 +0000
Message-ID: <bug-107818-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1157936420=="
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


--===============1157936420==
Content-Type: multipart/alternative; boundary="15359963031.D6aD42A7.1260"
Content-Transfer-Encoding: 7bit


--15359963031.D6aD42A7.1260
Date: Mon, 3 Sep 2018 17:38:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107818

            Bug ID: 107818
           Summary: linux-4.18.5 every boot some drivers errors
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: no111u3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 141430
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141430&action=3Dedit
Xorg load log

On new hardware I have some bugs with nouveau:

1) Driver errors in dmesg:
[    7.143770] ------------[ cut here ]------------
[    7.143771] nouveau 0000:01:00.0: timeout
[    7.143805] WARNING: CPU: 7 PID: 3391 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1524
gf100_gr_init_ctxctl+0x86a/0xa10 [nouveau]
[    7.143806] Modules linked in: bnep ipmi_msghandler ext2 hid_multitouch
spi_pxa2xx_platform intel_rapl intel_pmc_core x86_pkg_temp_thermal uvcvideo
intel_powerclamp videobuf2_vmalloc asus_nb_wmi videobuf2_memops kvm_intel
videobuf2_v4l2 asus_wmi wmi_bmof mxm_wmi coretemp videodev kvm irqbypass
videobuf2_common nouveau mousedev btusb ttm btrtl btbcm sdhci_pci btintel
pcspkr idma64 bluetooth cqhci nvidiafb ecdh_generic r8822be(C) vgastate sdh=
ci
fb_ddc mmc_core processor_thermal_device intel_lpss_pci intel_lpss
intel_soc_dts_iosf intel_pch_thermal i2c_hid int3403_thermal
int340x_thermal_zone wmi pinctrl_sunrisepoint pinctrl_intel int3400_thermal
acpi_thermal_rel asus_wireless efivarfs
[    7.143825] CPU: 7 PID: 3391 Comm: X Tainted: P         C O=20=20=20=20=
=20
4.18.5-gentoo #8
[    7.143826] Hardware name: ASUSTeK COMPUTER INC. VivoBook 15 ASUS Laptop
X570UD/X570UD, BIOS X570UD.307 04/10/2018
[    7.143837] RIP: 0010:gf100_gr_init_ctxctl+0x86a/0xa10 [nouveau]
[    7.143837] Code: ff ff 48 8b 7b 10 48 8b 5f 50 48 85 db 75 04 48 8b 5f =
10
e8 a8 7a 62 c4 48 89 da 48 c7 c7 17 68 6b c0 48 89 c6 e8 0b 9a 0b c4 <0f> 0=
b b8
f0 ff ff ff e9 b3 fa ff ff 48 8b 7b 10 48 8b 5f 50 48 85=20
[    7.143852] RSP: 0018:ffffb5ee81137ac8 EFLAGS: 00010282
[    7.143853] RAX: 0000000000000000 RBX: ffff9df6a4ac0840 RCX:
0000000000000006
[    7.143854] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff9df6aedd54f0
[    7.143854] RBP: ffff9df69ce38000 R08: 0000000000000030 R09:
0000000000000001
[    7.143855] R10: 0000000000000000 R11: 0000000000000001 R12:
000000007738ad20
[    7.143855] R13: ffff9df6a4461180 R14: 0000000132948f80 R15:
0000000000000005
[    7.143856] FS:  00007fc5c29f78c0(0000) GS:ffff9df6aedc0000(0000)
knlGS:0000000000000000
[    7.143857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.143857] CR2: 00007fc5bf3280e0 CR3: 0000000257fe2006 CR4:
00000000003606e0
[    7.143858] Call Trace:
[    7.143867]  nvkm_engine_init+0xa5/0x1d0 [nouveau]
[    7.143875]  nvkm_subdev_init+0xad/0x1f0 [nouveau]
[    7.143882]  nvkm_engine_ref.part.0+0x3e/0x60 [nouveau]
[    7.143889]  nvkm_ioctl_new+0x120/0x200 [nouveau]
[    7.143901]  ? nvkm_fifo_chan_dtor+0xe0/0xe0 [nouveau]
[    7.143911]  ? gf100_fermi_mthd+0xf0/0xf0 [nouveau]
[    7.143919]  nvkm_ioctl+0xd3/0x170 [nouveau]
[    7.143925]  nvif_object_init+0xba/0x110 [nouveau]
[    7.143935]  nouveau_abi16_ioctl_grobj_alloc+0x14c/0x2f0 [nouveau]
[    7.143945]  ? nouveau_abi16_ioctl_channel_free+0x80/0x80 [nouveau]
[    7.143947]  drm_ioctl_kernel+0x9c/0xe0
[    7.143949]  drm_ioctl+0x1d4/0x370
[    7.143958]  ? nouveau_abi16_ioctl_channel_free+0x80/0x80 [nouveau]
[    7.143960]  ? filemap_map_pages+0x286/0x2b0
[    7.143969]  nouveau_drm_ioctl+0x60/0xb0 [nouveau]
[    7.143972]  do_vfs_ioctl+0x9f/0x5f0
[    7.143974]  ksys_ioctl+0x5b/0x90
[    7.143975]  __x64_sys_ioctl+0x11/0x20
[    7.143976]  do_syscall_64+0x4a/0xf0
[    7.143978]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    7.143979] RIP: 0033:0x7fc5c0c785d7
[    7.143979] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
db 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 81 78 2c 00 f7 d8 64 89 01 48=20
[    7.143994] RSP: 002b:00007ffeed85c558 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[    7.143995] RAX: ffffffffffffffda RBX: 0000557d579a5f10 RCX:
00007fc5c0c785d7
[    7.143996] RDX: 00007ffeed85c5ac RSI: 00000000400c6444 RDI:
0000000000000012
[    7.143996] RBP: 00007ffeed85c5ac R08: 0000000000000008 R09:
0000557d579a5f10
[    7.143997] R10: 0000000000000000 R11: 0000000000003246 R12:
00000000400c6444
[    7.143997] R13: 0000000000000012 R14: 000000000000902d R15:
000000000000902d
[    7.143998] ---[ end trace 39a7fcb5eb66313e ]---
[    7.144003] nouveau 0000:01:00.0: gr: init failed, -16
and:
[    9.145276] ------------[ cut here ]------------
[    9.145277] nouveau 0000:01:00.0: timeout
[    9.145322] WARNING: CPU: 3 PID: 3391 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:207
gf100_vmm_flush_+0x149/0x190 [nouveau]
[    9.145322] Modules linked in: bnep ipmi_msghandler ext2 hid_multitouch
spi_pxa2xx_platform intel_rapl intel_pmc_core x86_pkg_temp_thermal uvcvideo
intel_powerclamp videobuf2_vmalloc asus_nb_wmi videobuf2_memops kvm_intel
videobuf2_v4l2 asus_wmi wmi_bmof mxm_wmi coretemp videodev kvm irqbypass
videobuf2_common nouveau mousedev btusb ttm btrtl btbcm sdhci_pci btintel
pcspkr idma64 bluetooth cqhci nvidiafb ecdh_generic r8822be(C) vgastate sdh=
ci
fb_ddc mmc_core processor_thermal_device intel_lpss_pci intel_lpss
intel_soc_dts_iosf intel_pch_thermal i2c_hid int3403_thermal
int340x_thermal_zone wmi pinctrl_sunrisepoint pinctrl_intel int3400_thermal
acpi_thermal_rel asus_wireless efivarfs
[    9.145340] CPU: 3 PID: 3391 Comm: X Tainted: P        WC O=20=20=20=20=
=20
4.18.5-gentoo #8
[    9.145341] Hardware name: ASUSTeK COMPUTER INC. VivoBook 15 ASUS Laptop
X570UD/X570UD, BIOS X570UD.307 04/10/2018
[    9.145353] RIP: 0010:gf100_vmm_flush_+0x149/0x190 [nouveau]
[    9.145353] Code: 5f e9 bb 4b b0 c4 48 8b 7d 10 48 8b 5f 50 48 85 db 74 =
4c
e8 69 72 66 c4 48 89 da 48 c7 c7 e2 0b 6b c0 48 89 c6 e8 cc 91 0f c4 <0f> 0=
b eb
c2 48 8b 7d 10 48 8b 5f 50 48 85 db 74 1e e8 41 72 66 c4=20
[    9.145368] RSP: 0018:ffffb5ee811377a0 EFLAGS: 00010286
[    9.145369] RAX: 0000000000000000 RBX: ffff9df6a4ac0840 RCX:
0000000000000006
[    9.145369] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff9df6aecd54f0
[    9.145370] RBP: ffff9df6a3980000 R08: 0000000000000030 R09:
0000000000000001
[    9.145370] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9df6a4461180
[    9.145371] R13: 00000001a9dfe020 R14: ffff9df69f214c20 R15:
ffff9df69f1ec800
[    9.145371] FS:  00007fc5c29f78c0(0000) GS:ffff9df6aecc0000(0000)
knlGS:0000000000000000
[    9.145372] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.145372] CR2: 000055bea020a000 CR3: 0000000257fe2005 CR4:
00000000003606e0
[    9.145373] Call Trace:
[    9.145386]  nvkm_vmm_iter.constprop.14+0x357/0x830 [nouveau]
[    9.145399]  ? nvkm_vmm_map_choose+0xb0/0xb0 [nouveau]
[    9.145411]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[    9.145422]  nvkm_vmm_map+0x203/0x3f0 [nouveau]
[    9.145435]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[    9.145436]  ? wake_up_klogd+0x2b/0x30
[    9.145447]  nvkm_vram_map+0x51/0x70 [nouveau]
[    9.145460]  nvkm_uvmm_mthd+0x5ff/0x8d0 [nouveau]
[    9.145468]  nvkm_ioctl+0xd3/0x170 [nouveau]
[    9.145476]  nvif_object_mthd+0x103/0x130 [nouveau]
[    9.145483]  ? nvif_object_mthd+0x113/0x130 [nouveau]
[    9.145491]  nvif_vmm_map+0x115/0x130 [nouveau]
[    9.145493]  ? selinux_inode_alloc_security+0x2d/0x70
[    9.145503]  nouveau_mem_map+0x7c/0xf0 [nouveau]
[    9.145513]  nouveau_vma_new+0x1b6/0x1e0 [nouveau]
[    9.145523]  nouveau_gem_object_open+0x11b/0x150 [nouveau]
[    9.145525]  drm_gem_handle_create_tail+0xbf/0x140
[    9.145534]  ? nouveau_gem_new+0x120/0x120 [nouveau]
[    9.145543]  nouveau_gem_ioctl_new+0x86/0xe0 [nouveau]
[    9.145545]  drm_ioctl_kernel+0x9c/0xe0
[    9.145546]  drm_ioctl+0x1d4/0x370
[    9.145556]  ? nouveau_gem_new+0x120/0x120 [nouveau]
[    9.145557]  ? ext4_file_write_iter+0x15e/0x3c0
[    9.145567]  nouveau_drm_ioctl+0x60/0xb0 [nouveau]
[    9.145569]  do_vfs_ioctl+0x9f/0x5f0
[    9.145571]  ksys_ioctl+0x5b/0x90
[    9.145572]  ? ksys_write+0x97/0xb0
[    9.145573]  __x64_sys_ioctl+0x11/0x20
[    9.145574]  do_syscall_64+0x4a/0xf0
[    9.145576]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    9.145577] RIP: 0033:0x7fc5c0c785d7
[    9.145577] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
db 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 81 78 2c 00 f7 d8 64 89 01 48=20
[    9.145592] RSP: 002b:00007ffeed85c5d8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[    9.145593] RAX: ffffffffffffffda RBX: 0000557d579a5f40 RCX:
00007fc5c0c785d7
[    9.145593] RDX: 00007ffeed85c630 RSI: 00000000c0306480 RDI:
0000000000000012
[    9.145594] RBP: 00007ffeed85c630 R08: 0000000000000000 R09:
0000557d579af720
[    9.145594] R10: 0000557d57975010 R11: 0000000000003246 R12:
00000000c0306480
[    9.145595] R13: 0000000000000012 R14: 0000557d579af720 R15:
0000557d579afae0
[    9.145595] ---[ end trace 39a7fcb5eb66313f ]---

Than in Xorg log I have some errros too: I attached it to bug.

This disable hardware acceleration for my graphics card and disable discrete
graphics card use.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15359963031.D6aD42A7.1260
Date: Mon, 3 Sep 2018 17:38:23 +0000
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
   title=3D"NEW - linux-4.18.5 every boot some drivers errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107818">107818</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>linux-4.18.5 every boot some drivers errors
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
          <td>no111u3&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141430=
" name=3D"attach_141430" title=3D"Xorg load log">attachment 141430</a> <a h=
ref=3D"attachment.cgi?id=3D141430&amp;action=3Dedit" title=3D"Xorg load log=
">[details]</a></span>
Xorg load log

On new hardware I have some bugs with nouveau:

1) Driver errors in dmesg:
[    7.143770] ------------[ cut here ]------------
[    7.143771] nouveau 0000:01:00.0: timeout
[    7.143805] WARNING: CPU: 7 PID: 3391 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1524
gf100_gr_init_ctxctl+0x86a/0xa10 [nouveau]
[    7.143806] Modules linked in: bnep ipmi_msghandler ext2 hid_multitouch
spi_pxa2xx_platform intel_rapl intel_pmc_core x86_pkg_temp_thermal uvcvideo
intel_powerclamp videobuf2_vmalloc asus_nb_wmi videobuf2_memops kvm_intel
videobuf2_v4l2 asus_wmi wmi_bmof mxm_wmi coretemp videodev kvm irqbypass
videobuf2_common nouveau mousedev btusb ttm btrtl btbcm sdhci_pci btintel
pcspkr idma64 bluetooth cqhci nvidiafb ecdh_generic r8822be(C) vgastate sdh=
ci
fb_ddc mmc_core processor_thermal_device intel_lpss_pci intel_lpss
intel_soc_dts_iosf intel_pch_thermal i2c_hid int3403_thermal
int340x_thermal_zone wmi pinctrl_sunrisepoint pinctrl_intel int3400_thermal
acpi_thermal_rel asus_wireless efivarfs
[    7.143825] CPU: 7 PID: 3391 Comm: X Tainted: P         C O=20=20=20=20=
=20
4.18.5-gentoo #8
[    7.143826] Hardware name: ASUSTeK COMPUTER INC. VivoBook 15 ASUS Laptop
X570UD/X570UD, BIOS X570UD.307 04/10/2018
[    7.143837] RIP: 0010:gf100_gr_init_ctxctl+0x86a/0xa10 [nouveau]
[    7.143837] Code: ff ff 48 8b 7b 10 48 8b 5f 50 48 85 db 75 04 48 8b 5f =
10
e8 a8 7a 62 c4 48 89 da 48 c7 c7 17 68 6b c0 48 89 c6 e8 0b 9a 0b c4 &lt;0f=
&gt; 0b b8
f0 ff ff ff e9 b3 fa ff ff 48 8b 7b 10 48 8b 5f 50 48 85=20
[    7.143852] RSP: 0018:ffffb5ee81137ac8 EFLAGS: 00010282
[    7.143853] RAX: 0000000000000000 RBX: ffff9df6a4ac0840 RCX:
0000000000000006
[    7.143854] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff9df6aedd54f0
[    7.143854] RBP: ffff9df69ce38000 R08: 0000000000000030 R09:
0000000000000001
[    7.143855] R10: 0000000000000000 R11: 0000000000000001 R12:
000000007738ad20
[    7.143855] R13: ffff9df6a4461180 R14: 0000000132948f80 R15:
0000000000000005
[    7.143856] FS:  00007fc5c29f78c0(0000) GS:ffff9df6aedc0000(0000)
knlGS:0000000000000000
[    7.143857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    7.143857] CR2: 00007fc5bf3280e0 CR3: 0000000257fe2006 CR4:
00000000003606e0
[    7.143858] Call Trace:
[    7.143867]  nvkm_engine_init+0xa5/0x1d0 [nouveau]
[    7.143875]  nvkm_subdev_init+0xad/0x1f0 [nouveau]
[    7.143882]  nvkm_engine_ref.part.0+0x3e/0x60 [nouveau]
[    7.143889]  nvkm_ioctl_new+0x120/0x200 [nouveau]
[    7.143901]  ? nvkm_fifo_chan_dtor+0xe0/0xe0 [nouveau]
[    7.143911]  ? gf100_fermi_mthd+0xf0/0xf0 [nouveau]
[    7.143919]  nvkm_ioctl+0xd3/0x170 [nouveau]
[    7.143925]  nvif_object_init+0xba/0x110 [nouveau]
[    7.143935]  nouveau_abi16_ioctl_grobj_alloc+0x14c/0x2f0 [nouveau]
[    7.143945]  ? nouveau_abi16_ioctl_channel_free+0x80/0x80 [nouveau]
[    7.143947]  drm_ioctl_kernel+0x9c/0xe0
[    7.143949]  drm_ioctl+0x1d4/0x370
[    7.143958]  ? nouveau_abi16_ioctl_channel_free+0x80/0x80 [nouveau]
[    7.143960]  ? filemap_map_pages+0x286/0x2b0
[    7.143969]  nouveau_drm_ioctl+0x60/0xb0 [nouveau]
[    7.143972]  do_vfs_ioctl+0x9f/0x5f0
[    7.143974]  ksys_ioctl+0x5b/0x90
[    7.143975]  __x64_sys_ioctl+0x11/0x20
[    7.143976]  do_syscall_64+0x4a/0xf0
[    7.143978]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    7.143979] RIP: 0033:0x7fc5c0c785d7
[    7.143979] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
db 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 81 78 2c 00 f7 d8 64 89 01 48=20
[    7.143994] RSP: 002b:00007ffeed85c558 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[    7.143995] RAX: ffffffffffffffda RBX: 0000557d579a5f10 RCX:
00007fc5c0c785d7
[    7.143996] RDX: 00007ffeed85c5ac RSI: 00000000400c6444 RDI:
0000000000000012
[    7.143996] RBP: 00007ffeed85c5ac R08: 0000000000000008 R09:
0000557d579a5f10
[    7.143997] R10: 0000000000000000 R11: 0000000000003246 R12:
00000000400c6444
[    7.143997] R13: 0000000000000012 R14: 000000000000902d R15:
000000000000902d
[    7.143998] ---[ end trace 39a7fcb5eb66313e ]---
[    7.144003] nouveau 0000:01:00.0: gr: init failed, -16
and:
[    9.145276] ------------[ cut here ]------------
[    9.145277] nouveau 0000:01:00.0: timeout
[    9.145322] WARNING: CPU: 3 PID: 3391 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:207
gf100_vmm_flush_+0x149/0x190 [nouveau]
[    9.145322] Modules linked in: bnep ipmi_msghandler ext2 hid_multitouch
spi_pxa2xx_platform intel_rapl intel_pmc_core x86_pkg_temp_thermal uvcvideo
intel_powerclamp videobuf2_vmalloc asus_nb_wmi videobuf2_memops kvm_intel
videobuf2_v4l2 asus_wmi wmi_bmof mxm_wmi coretemp videodev kvm irqbypass
videobuf2_common nouveau mousedev btusb ttm btrtl btbcm sdhci_pci btintel
pcspkr idma64 bluetooth cqhci nvidiafb ecdh_generic r8822be(C) vgastate sdh=
ci
fb_ddc mmc_core processor_thermal_device intel_lpss_pci intel_lpss
intel_soc_dts_iosf intel_pch_thermal i2c_hid int3403_thermal
int340x_thermal_zone wmi pinctrl_sunrisepoint pinctrl_intel int3400_thermal
acpi_thermal_rel asus_wireless efivarfs
[    9.145340] CPU: 3 PID: 3391 Comm: X Tainted: P        WC O=20=20=20=20=
=20
4.18.5-gentoo #8
[    9.145341] Hardware name: ASUSTeK COMPUTER INC. VivoBook 15 ASUS Laptop
X570UD/X570UD, BIOS X570UD.307 04/10/2018
[    9.145353] RIP: 0010:gf100_vmm_flush_+0x149/0x190 [nouveau]
[    9.145353] Code: 5f e9 bb 4b b0 c4 48 8b 7d 10 48 8b 5f 50 48 85 db 74 =
4c
e8 69 72 66 c4 48 89 da 48 c7 c7 e2 0b 6b c0 48 89 c6 e8 cc 91 0f c4 &lt;0f=
&gt; 0b eb
c2 48 8b 7d 10 48 8b 5f 50 48 85 db 74 1e e8 41 72 66 c4=20
[    9.145368] RSP: 0018:ffffb5ee811377a0 EFLAGS: 00010286
[    9.145369] RAX: 0000000000000000 RBX: ffff9df6a4ac0840 RCX:
0000000000000006
[    9.145369] RDX: 0000000000000007 RSI: 0000000000000082 RDI:
ffff9df6aecd54f0
[    9.145370] RBP: ffff9df6a3980000 R08: 0000000000000030 R09:
0000000000000001
[    9.145370] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9df6a4461180
[    9.145371] R13: 00000001a9dfe020 R14: ffff9df69f214c20 R15:
ffff9df69f1ec800
[    9.145371] FS:  00007fc5c29f78c0(0000) GS:ffff9df6aecc0000(0000)
knlGS:0000000000000000
[    9.145372] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    9.145372] CR2: 000055bea020a000 CR3: 0000000257fe2005 CR4:
00000000003606e0
[    9.145373] Call Trace:
[    9.145386]  nvkm_vmm_iter.constprop.14+0x357/0x830 [nouveau]
[    9.145399]  ? nvkm_vmm_map_choose+0xb0/0xb0 [nouveau]
[    9.145411]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[    9.145422]  nvkm_vmm_map+0x203/0x3f0 [nouveau]
[    9.145435]  ? gp100_vmm_pgt_dma+0x200/0x200 [nouveau]
[    9.145436]  ? wake_up_klogd+0x2b/0x30
[    9.145447]  nvkm_vram_map+0x51/0x70 [nouveau]
[    9.145460]  nvkm_uvmm_mthd+0x5ff/0x8d0 [nouveau]
[    9.145468]  nvkm_ioctl+0xd3/0x170 [nouveau]
[    9.145476]  nvif_object_mthd+0x103/0x130 [nouveau]
[    9.145483]  ? nvif_object_mthd+0x113/0x130 [nouveau]
[    9.145491]  nvif_vmm_map+0x115/0x130 [nouveau]
[    9.145493]  ? selinux_inode_alloc_security+0x2d/0x70
[    9.145503]  nouveau_mem_map+0x7c/0xf0 [nouveau]
[    9.145513]  nouveau_vma_new+0x1b6/0x1e0 [nouveau]
[    9.145523]  nouveau_gem_object_open+0x11b/0x150 [nouveau]
[    9.145525]  drm_gem_handle_create_tail+0xbf/0x140
[    9.145534]  ? nouveau_gem_new+0x120/0x120 [nouveau]
[    9.145543]  nouveau_gem_ioctl_new+0x86/0xe0 [nouveau]
[    9.145545]  drm_ioctl_kernel+0x9c/0xe0
[    9.145546]  drm_ioctl+0x1d4/0x370
[    9.145556]  ? nouveau_gem_new+0x120/0x120 [nouveau]
[    9.145557]  ? ext4_file_write_iter+0x15e/0x3c0
[    9.145567]  nouveau_drm_ioctl+0x60/0xb0 [nouveau]
[    9.145569]  do_vfs_ioctl+0x9f/0x5f0
[    9.145571]  ksys_ioctl+0x5b/0x90
[    9.145572]  ? ksys_write+0x97/0xb0
[    9.145573]  __x64_sys_ioctl+0x11/0x20
[    9.145574]  do_syscall_64+0x4a/0xf0
[    9.145576]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    9.145577] RIP: 0033:0x7fc5c0c785d7
[    9.145577] Code: 00 00 00 75 0c 48 c7 c0 ff ff ff ff 48 83 c4 18 c3 e8 =
8d
db 01 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 00 b8 10 00 00 00 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 81 78 2c 00 f7 d8 64 89 01 48=20
[    9.145592] RSP: 002b:00007ffeed85c5d8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[    9.145593] RAX: ffffffffffffffda RBX: 0000557d579a5f40 RCX:
00007fc5c0c785d7
[    9.145593] RDX: 00007ffeed85c630 RSI: 00000000c0306480 RDI:
0000000000000012
[    9.145594] RBP: 00007ffeed85c630 R08: 0000000000000000 R09:
0000557d579af720
[    9.145594] R10: 0000557d57975010 R11: 0000000000003246 R12:
00000000c0306480
[    9.145595] R13: 0000000000000012 R14: 0000557d579af720 R15:
0000557d579afae0
[    9.145595] ---[ end trace 39a7fcb5eb66313f ]---

Than in Xorg log I have some errros too: I attached it to bug.

This disable hardware acceleration for my graphics card and disable discrete
graphics card use.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15359963031.D6aD42A7.1260--

--===============1157936420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1157936420==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102192] New: Dell XPS 15 9560: PU: 1 PID: 58 at
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190
 gf100_vm_flush+0x1b3/0x1c0 [nouveau]
Date: Sun, 13 Aug 2017 07:36:35 +0000
Message-ID: <bug-102192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0378348237=="
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


--===============0378348237==
Content-Type: multipart/alternative; boundary="15026097950.551dd.12048";
 charset="UTF-8"


--15026097950.551dd.12048
Date: Sun, 13 Aug 2017 07:36:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102192

            Bug ID: 102192
           Summary: Dell XPS 15 9560: PU: 1 PID: 58 at
                    drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190
                    gf100_vm_flush+0x1b3/0x1c0 [nouveau]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: anton.kochkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 133468
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D133468&action=3Dedit
full dmesg of linux kernel 4.13_rc4

Laptop: Dell XPS 15 9560

Linux kernel version - 4.13_rc4
libdrm-2.4.82
linux-firmware-20170622
xf86-video-nouveau-1.0.15
mesa-17.2.0_rc4

[ 1730.734113] nouveau 0000:01:00.0: timeout
[ 1730.734121] ------------[ cut here ]------------
[ 1730.734157] WARNING: CPU: 1 PID: 58 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x=
1c0
[nouveau]
[ 1730.734157] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci
nouveau ath10k_core i915 ath x86_pkg_temp_thermal mac80211 ttm coretemp
snd_hda_intel btusb iosf_mbi dell_wmi btrtl dell_laptop sparse_keymap
dell_smbios btbcm iTCO_wdt snd_hda_codec kvm_intel drm_kms_helper btintel
iTCO_vendor_support dcdbas wmi_bmof mxm_wmi dell_smm_hwmon uvcvideo
snd_hda_core kvm bluetooth videobuf2_vmalloc irqbypass snd_hwdep efi_pstore
cfg80211 videobuf2_memops videobuf2_v4l2 crc32c_intel videobuf2_core drm
ecdh_generic snd_pcm rfkill syscopyarea ghash_clmulni_intel snd_timer
sysfillrect cryptd snd videodev sysimgblt fb_sys_fops soundcore efivars
serio_raw pcspkr i2c_i801 wmi dell_smo8800 video efivarfs xts cbc libiscsi
scsi_transport_iscsi
[ 1730.734180]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage aic94xx libsas lpfc qla2xxx megaraid_sas megaraid_mbox
megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xxxx 3w_sas mptsas
scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih mptbase imm parp=
ort
sym53c8xx initio arcmsr aic7xxx aic79xx scsi_transport_spi sr_mod cdrom sg
sd_mod pdc_adma sata_inic162x sata_mv ata_piix ahci libahci
[ 1730.734208]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1730.734219] CPU: 1 PID: 58 Comm: kworker/1:1 Tainted: G        W=20=20=
=20=20=20=20
4.13.0-rc4 #1
[ 1730.734219] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1730.734222] Workqueue: pm pm_runtime_work
[ 1730.734223] task: ffff88046caa9040 task.stack: ffffc90000258000
[ 1730.734239] RIP: 0010:gf100_vm_flush+0x1b3/0x1c0 [nouveau]
[ 1730.734239] RSP: 0018:ffffc9000025b898 EFLAGS: 00010292
[ 1730.734240] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1730.734240] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1730.734241] RBP: ffffc9000025b8d8 R08: 0000000000000001 R09:
000000000000088d
[ 1730.734241] R10: 0000000000000000 R11: 000000000000088d R12:
ffff880467640400
[ 1730.734242] R13: ffff880468d34080 R14: ffff880468e0ff60 R15:
0000019280775300
[ 1730.734242] FS:  0000000000000000(0000) GS:ffff88047f440000(0000)
knlGS:0000000000000000
[ 1730.734243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1730.734243] CR2: 0000000001823988 CR3: 0000000002209000 CR4:
00000000003406e0
[ 1730.734244] Call Trace:
[ 1730.734259]  nvkm_vm_unmap_at+0xb9/0x100 [nouveau]
[ 1730.734272]  nvkm_vm_unmap+0x1b/0x20 [nouveau]
[ 1730.734288]  nouveau_vram_manager_del+0x60/0x80 [nouveau]
[ 1730.734291]  ttm_bo_mem_put+0x2a/0x30 [ttm]
[ 1730.734293]  ttm_bo_move_accel_cleanup+0x10c/0x200 [ttm]
[ 1730.734308]  ? nouveau_fence_new+0x58/0x90 [nouveau]
[ 1730.734324]  nouveau_bo_move_m2mf.constprop.14+0x170/0x1a0 [nouveau]
[ 1730.734340]  nouveau_bo_move+0xac/0x430 [nouveau]
[ 1730.734342]  ttm_bo_handle_move_mem+0x280/0x5b0 [ttm]
[ 1730.734344]  ttm_bo_evict+0x116/0x2b0 [ttm]
[ 1730.734346]  ? find_busiest_group+0x122/0x980
[ 1730.734354]  ? drm_rect_debug_print+0x31/0xc0 [drm]
[ 1730.734356]  ttm_mem_evict_first+0x157/0x1b0 [ttm]
[ 1730.734358]  ttm_bo_force_list_clean+0x6b/0x110 [ttm]
[ 1730.734360]  ttm_bo_evict_mm+0x26/0x50 [ttm]
[ 1730.734375]  nouveau_do_suspend+0xa9/0x1d0 [nouveau]
[ 1730.734389]  nouveau_pmops_runtime_suspend+0x59/0xc0 [nouveau]
[ 1730.734391]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734392]  pci_pm_runtime_suspend+0x55/0x170
[ 1730.734393]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734394]  __rpm_callback+0xc1/0x1f0
[ 1730.734395]  ? set_next_entity+0x162/0x610
[ 1730.734396]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734397]  rpm_callback+0x24/0x80
[ 1730.734398]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734399]  rpm_suspend+0x121/0x640
[ 1730.734401]  ? finish_task_switch+0x74/0x1f0
[ 1730.734402]  pm_runtime_work+0x67/0x90
[ 1730.734403]  process_one_work+0x1e3/0x3e0
[ 1730.734404]  worker_thread+0x48/0x3f0
[ 1730.734405]  kthread+0x109/0x140
[ 1730.734406]  ? process_one_work+0x3e0/0x3e0
[ 1730.734407]  ? kthread_create_on_node+0x40/0x40
[ 1730.734407]  ret_from_fork+0x27/0x40
[ 1730.734408] Code: ff ff 49 8b 7c 24 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 3f d0 ee df 48 89 da 48 89 c6 48 c7 c7 e2 12 62 a1 e8 3e 70 b7 df <0f=
> ff
e9 7b ff ff ff 66 0f 1f 44 00 00 e8 6b be 18 e0 55 49 c1=20
[ 1730.734423] ---[ end trace cea4b3e271e42381 ]---
[ 1732.735343] nouveau 0000:01:00.0: timeout
[ 1732.735370] ------------[ cut here ]------------
[ 1732.735391] WARNING: CPU: 1 PID: 58 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x=
1c0
[nouveau]
[ 1732.735392] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci
nouveau ath10k_core i915 ath x86_pkg_temp_thermal mac80211 ttm coretemp
snd_hda_intel btusb iosf_mbi dell_wmi btrtl dell_laptop sparse_keymap
dell_smbios btbcm iTCO_wdt snd_hda_codec kvm_intel drm_kms_helper btintel
iTCO_vendor_support dcdbas wmi_bmof mxm_wmi dell_smm_hwmon uvcvideo
snd_hda_core kvm bluetooth videobuf2_vmalloc irqbypass snd_hwdep efi_pstore
cfg80211 videobuf2_memops videobuf2_v4l2 crc32c_intel videobuf2_core drm
ecdh_generic snd_pcm rfkill syscopyarea ghash_clmulni_intel snd_timer
sysfillrect cryptd snd videodev sysimgblt fb_sys_fops soundcore efivars
serio_raw pcspkr i2c_i801 wmi dell_smo8800 video efivarfs xts cbc libiscsi
scsi_transport_iscsi
[ 1732.735416]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage aic94xx libsas lpfc qla2xxx megaraid_sas megaraid_mbox
megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xxxx 3w_sas mptsas
scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih mptbase imm parp=
ort
sym53c8xx initio arcmsr aic7xxx aic79xx scsi_transport_spi sr_mod cdrom sg
sd_mod pdc_adma sata_inic162x sata_mv ata_piix ahci libahci
[ 1732.735446]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1732.735458] CPU: 1 PID: 58 Comm: kworker/1:1 Tainted: G        W=20=20=
=20=20=20=20
4.13.0-rc4 #1
[ 1732.735458] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1732.735461] Workqueue: pm pm_runtime_work
[ 1732.735462] task: ffff88046caa9040 task.stack: ffffc90000258000
[ 1732.735478] RIP: 0010:gf100_vm_flush+0x1b3/0x1c0 [nouveau]
[ 1732.735479] RSP: 0018:ffffc9000025b898 EFLAGS: 00010292
[ 1732.735480] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1732.735480] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1732.735481] RBP: ffffc9000025b8d8 R08: 0000000000000001 R09:
00000000000008c6
[ 1732.735481] R10: 0000000000000000 R11: 00000000000008c6 R12:
ffff880467640400
[ 1732.735481] R13: ffff880468d34080 R14: ffff880468ce1240 R15:
00000192f7c0ece0
[ 1732.735482] FS:  0000000000000000(0000) GS:ffff88047f440000(0000)
knlGS:0000000000000000
[ 1732.735483] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1732.735483] CR2: 0000000001823988 CR3: 0000000002209000 CR4:
00000000003406e0
[ 1732.735483] Call Trace:
[ 1732.735500]  nvkm_vm_unmap_at+0xb9/0x100 [nouveau]
[ 1732.735515]  nvkm_vm_unmap+0x1b/0x20 [nouveau]
[ 1732.735532]  nouveau_vram_manager_del+0x60/0x80 [nouveau]
[ 1732.735534]  ttm_bo_mem_put+0x2a/0x30 [ttm]
[ 1732.735537]  ttm_bo_move_accel_cleanup+0x10c/0x200 [ttm]
[ 1732.735553]  ? nouveau_fence_new+0x58/0x90 [nouveau]
[ 1732.735570]  nouveau_bo_move_m2mf.constprop.14+0x170/0x1a0 [nouveau]
[ 1732.735587]  nouveau_bo_move+0xac/0x430 [nouveau]
[ 1732.735589]  ttm_bo_handle_move_mem+0x280/0x5b0 [ttm]
[ 1732.735591]  ttm_bo_evict+0x116/0x2b0 [ttm]
[ 1732.735593]  ? find_busiest_group+0x122/0x980
[ 1732.735601]  ? drm_rect_debug_print+0x31/0xc0 [drm]
[ 1732.735604]  ttm_mem_evict_first+0x157/0x1b0 [ttm]
[ 1732.735606]  ttm_bo_force_list_clean+0x6b/0x110 [ttm]
[ 1732.735608]  ttm_bo_evict_mm+0x26/0x50 [ttm]
[ 1732.735624]  nouveau_do_suspend+0xa9/0x1d0 [nouveau]
[ 1732.735640]  nouveau_pmops_runtime_suspend+0x59/0xc0 [nouveau]
[ 1732.735641]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735643]  pci_pm_runtime_suspend+0x55/0x170
[ 1732.735644]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735645]  __rpm_callback+0xc1/0x1f0
[ 1732.735646]  ? set_next_entity+0x162/0x610
[ 1732.735647]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735648]  rpm_callback+0x24/0x80
[ 1732.735649]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735650]  rpm_suspend+0x121/0x640
[ 1732.735652]  ? finish_task_switch+0x74/0x1f0
[ 1732.735653]  pm_runtime_work+0x67/0x90
[ 1732.735654]  process_one_work+0x1e3/0x3e0
[ 1732.735655]  worker_thread+0x48/0x3f0
[ 1732.735656]  kthread+0x109/0x140
[ 1732.735657]  ? process_one_work+0x3e0/0x3e0
[ 1732.735658]  ? kthread_create_on_node+0x40/0x40
[ 1732.735659]  ret_from_fork+0x27/0x40
[ 1732.735660] Code: ff ff 49 8b 7c 24 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 3f d0 ee df 48 89 da 48 89 c6 48 c7 c7 e2 12 62 a1 e8 3e 70 b7 df <0f=
> ff
e9 7b ff ff ff 66 0f 1f 44 00 00 e8 6b be 18 e0 55 49 c1=20
[ 1732.735675] ---[ end trace cea4b3e271e42382 ]---
[ 1732.735742] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[ 1746.912049] asynchronous wait on fence i915:X[6056]/0:117 timed out
[ 1747.735011] nouveau 0000:01:00.0: DRM: failed to idle channel 1 [DRM]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15026097950.551dd.12048
Date: Sun, 13 Aug 2017 07:36:35 +0000
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
   title=3D"NEW - Dell XPS 15 9560: PU: 1 PID: 58 at drivers/gpu/drm/nouvea=
u/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x1c0 [nouveau]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102192">102192</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dell XPS 15 9560: PU: 1 PID: 58 at drivers/gpu/drm/nouveau/nv=
km/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x1c0 [nouveau]
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
          <td>anton.kochkov&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D133468=
" name=3D"attach_133468" title=3D"full dmesg of linux kernel 4.13_rc4">atta=
chment 133468</a> <a href=3D"attachment.cgi?id=3D133468&amp;action=3Dedit" =
title=3D"full dmesg of linux kernel 4.13_rc4">[details]</a></span>
full dmesg of linux kernel 4.13_rc4

Laptop: Dell XPS 15 9560

Linux kernel version - 4.13_rc4
libdrm-2.4.82
linux-firmware-20170622
xf86-video-nouveau-1.0.15
mesa-17.2.0_rc4

[ 1730.734113] nouveau 0000:01:00.0: timeout
[ 1730.734121] ------------[ cut here ]------------
[ 1730.734157] WARNING: CPU: 1 PID: 58 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x=
1c0
[nouveau]
[ 1730.734157] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci
nouveau ath10k_core i915 ath x86_pkg_temp_thermal mac80211 ttm coretemp
snd_hda_intel btusb iosf_mbi dell_wmi btrtl dell_laptop sparse_keymap
dell_smbios btbcm iTCO_wdt snd_hda_codec kvm_intel drm_kms_helper btintel
iTCO_vendor_support dcdbas wmi_bmof mxm_wmi dell_smm_hwmon uvcvideo
snd_hda_core kvm bluetooth videobuf2_vmalloc irqbypass snd_hwdep efi_pstore
cfg80211 videobuf2_memops videobuf2_v4l2 crc32c_intel videobuf2_core drm
ecdh_generic snd_pcm rfkill syscopyarea ghash_clmulni_intel snd_timer
sysfillrect cryptd snd videodev sysimgblt fb_sys_fops soundcore efivars
serio_raw pcspkr i2c_i801 wmi dell_smo8800 video efivarfs xts cbc libiscsi
scsi_transport_iscsi
[ 1730.734180]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage aic94xx libsas lpfc qla2xxx megaraid_sas megaraid_mbox
megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xxxx 3w_sas mptsas
scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih mptbase imm parp=
ort
sym53c8xx initio arcmsr aic7xxx aic79xx scsi_transport_spi sr_mod cdrom sg
sd_mod pdc_adma sata_inic162x sata_mv ata_piix ahci libahci
[ 1730.734208]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1730.734219] CPU: 1 PID: 58 Comm: kworker/1:1 Tainted: G        W=20=20=
=20=20=20=20
4.13.0-rc4 #1
[ 1730.734219] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1730.734222] Workqueue: pm pm_runtime_work
[ 1730.734223] task: ffff88046caa9040 task.stack: ffffc90000258000
[ 1730.734239] RIP: 0010:gf100_vm_flush+0x1b3/0x1c0 [nouveau]
[ 1730.734239] RSP: 0018:ffffc9000025b898 EFLAGS: 00010292
[ 1730.734240] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1730.734240] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1730.734241] RBP: ffffc9000025b8d8 R08: 0000000000000001 R09:
000000000000088d
[ 1730.734241] R10: 0000000000000000 R11: 000000000000088d R12:
ffff880467640400
[ 1730.734242] R13: ffff880468d34080 R14: ffff880468e0ff60 R15:
0000019280775300
[ 1730.734242] FS:  0000000000000000(0000) GS:ffff88047f440000(0000)
knlGS:0000000000000000
[ 1730.734243] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1730.734243] CR2: 0000000001823988 CR3: 0000000002209000 CR4:
00000000003406e0
[ 1730.734244] Call Trace:
[ 1730.734259]  nvkm_vm_unmap_at+0xb9/0x100 [nouveau]
[ 1730.734272]  nvkm_vm_unmap+0x1b/0x20 [nouveau]
[ 1730.734288]  nouveau_vram_manager_del+0x60/0x80 [nouveau]
[ 1730.734291]  ttm_bo_mem_put+0x2a/0x30 [ttm]
[ 1730.734293]  ttm_bo_move_accel_cleanup+0x10c/0x200 [ttm]
[ 1730.734308]  ? nouveau_fence_new+0x58/0x90 [nouveau]
[ 1730.734324]  nouveau_bo_move_m2mf.constprop.14+0x170/0x1a0 [nouveau]
[ 1730.734340]  nouveau_bo_move+0xac/0x430 [nouveau]
[ 1730.734342]  ttm_bo_handle_move_mem+0x280/0x5b0 [ttm]
[ 1730.734344]  ttm_bo_evict+0x116/0x2b0 [ttm]
[ 1730.734346]  ? find_busiest_group+0x122/0x980
[ 1730.734354]  ? drm_rect_debug_print+0x31/0xc0 [drm]
[ 1730.734356]  ttm_mem_evict_first+0x157/0x1b0 [ttm]
[ 1730.734358]  ttm_bo_force_list_clean+0x6b/0x110 [ttm]
[ 1730.734360]  ttm_bo_evict_mm+0x26/0x50 [ttm]
[ 1730.734375]  nouveau_do_suspend+0xa9/0x1d0 [nouveau]
[ 1730.734389]  nouveau_pmops_runtime_suspend+0x59/0xc0 [nouveau]
[ 1730.734391]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734392]  pci_pm_runtime_suspend+0x55/0x170
[ 1730.734393]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734394]  __rpm_callback+0xc1/0x1f0
[ 1730.734395]  ? set_next_entity+0x162/0x610
[ 1730.734396]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734397]  rpm_callback+0x24/0x80
[ 1730.734398]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1730.734399]  rpm_suspend+0x121/0x640
[ 1730.734401]  ? finish_task_switch+0x74/0x1f0
[ 1730.734402]  pm_runtime_work+0x67/0x90
[ 1730.734403]  process_one_work+0x1e3/0x3e0
[ 1730.734404]  worker_thread+0x48/0x3f0
[ 1730.734405]  kthread+0x109/0x140
[ 1730.734406]  ? process_one_work+0x3e0/0x3e0
[ 1730.734407]  ? kthread_create_on_node+0x40/0x40
[ 1730.734407]  ret_from_fork+0x27/0x40
[ 1730.734408] Code: ff ff 49 8b 7c 24 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 3f d0 ee df 48 89 da 48 89 c6 48 c7 c7 e2 12 62 a1 e8 3e 70 b7 df &lt=
;0f&gt; ff
e9 7b ff ff ff 66 0f 1f 44 00 00 e8 6b be 18 e0 55 49 c1=20
[ 1730.734423] ---[ end trace cea4b3e271e42381 ]---
[ 1732.735343] nouveau 0000:01:00.0: timeout
[ 1732.735370] ------------[ cut here ]------------
[ 1732.735391] WARNING: CPU: 1 PID: 58 at
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c:190 gf100_vm_flush+0x1b3/0x=
1c0
[nouveau]
[ 1732.735392] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ath10k_pci
nouveau ath10k_core i915 ath x86_pkg_temp_thermal mac80211 ttm coretemp
snd_hda_intel btusb iosf_mbi dell_wmi btrtl dell_laptop sparse_keymap
dell_smbios btbcm iTCO_wdt snd_hda_codec kvm_intel drm_kms_helper btintel
iTCO_vendor_support dcdbas wmi_bmof mxm_wmi dell_smm_hwmon uvcvideo
snd_hda_core kvm bluetooth videobuf2_vmalloc irqbypass snd_hwdep efi_pstore
cfg80211 videobuf2_memops videobuf2_v4l2 crc32c_intel videobuf2_core drm
ecdh_generic snd_pcm rfkill syscopyarea ghash_clmulni_intel snd_timer
sysfillrect cryptd snd videodev sysimgblt fb_sys_fops soundcore efivars
serio_raw pcspkr i2c_i801 wmi dell_smo8800 video efivarfs xts cbc libiscsi
scsi_transport_iscsi
[ 1732.735416]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage aic94xx libsas lpfc qla2xxx megaraid_sas megaraid_mbox
megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xxxx 3w_sas mptsas
scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih mptbase imm parp=
ort
sym53c8xx initio arcmsr aic7xxx aic79xx scsi_transport_spi sr_mod cdrom sg
sd_mod pdc_adma sata_inic162x sata_mv ata_piix ahci libahci
[ 1732.735446]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1732.735458] CPU: 1 PID: 58 Comm: kworker/1:1 Tainted: G        W=20=20=
=20=20=20=20
4.13.0-rc4 #1
[ 1732.735458] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1732.735461] Workqueue: pm pm_runtime_work
[ 1732.735462] task: ffff88046caa9040 task.stack: ffffc90000258000
[ 1732.735478] RIP: 0010:gf100_vm_flush+0x1b3/0x1c0 [nouveau]
[ 1732.735479] RSP: 0018:ffffc9000025b898 EFLAGS: 00010292
[ 1732.735480] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1732.735480] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1732.735481] RBP: ffffc9000025b8d8 R08: 0000000000000001 R09:
00000000000008c6
[ 1732.735481] R10: 0000000000000000 R11: 00000000000008c6 R12:
ffff880467640400
[ 1732.735481] R13: ffff880468d34080 R14: ffff880468ce1240 R15:
00000192f7c0ece0
[ 1732.735482] FS:  0000000000000000(0000) GS:ffff88047f440000(0000)
knlGS:0000000000000000
[ 1732.735483] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1732.735483] CR2: 0000000001823988 CR3: 0000000002209000 CR4:
00000000003406e0
[ 1732.735483] Call Trace:
[ 1732.735500]  nvkm_vm_unmap_at+0xb9/0x100 [nouveau]
[ 1732.735515]  nvkm_vm_unmap+0x1b/0x20 [nouveau]
[ 1732.735532]  nouveau_vram_manager_del+0x60/0x80 [nouveau]
[ 1732.735534]  ttm_bo_mem_put+0x2a/0x30 [ttm]
[ 1732.735537]  ttm_bo_move_accel_cleanup+0x10c/0x200 [ttm]
[ 1732.735553]  ? nouveau_fence_new+0x58/0x90 [nouveau]
[ 1732.735570]  nouveau_bo_move_m2mf.constprop.14+0x170/0x1a0 [nouveau]
[ 1732.735587]  nouveau_bo_move+0xac/0x430 [nouveau]
[ 1732.735589]  ttm_bo_handle_move_mem+0x280/0x5b0 [ttm]
[ 1732.735591]  ttm_bo_evict+0x116/0x2b0 [ttm]
[ 1732.735593]  ? find_busiest_group+0x122/0x980
[ 1732.735601]  ? drm_rect_debug_print+0x31/0xc0 [drm]
[ 1732.735604]  ttm_mem_evict_first+0x157/0x1b0 [ttm]
[ 1732.735606]  ttm_bo_force_list_clean+0x6b/0x110 [ttm]
[ 1732.735608]  ttm_bo_evict_mm+0x26/0x50 [ttm]
[ 1732.735624]  nouveau_do_suspend+0xa9/0x1d0 [nouveau]
[ 1732.735640]  nouveau_pmops_runtime_suspend+0x59/0xc0 [nouveau]
[ 1732.735641]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735643]  pci_pm_runtime_suspend+0x55/0x170
[ 1732.735644]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735645]  __rpm_callback+0xc1/0x1f0
[ 1732.735646]  ? set_next_entity+0x162/0x610
[ 1732.735647]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735648]  rpm_callback+0x24/0x80
[ 1732.735649]  ? pci_pm_runtime_resume+0xa0/0xa0
[ 1732.735650]  rpm_suspend+0x121/0x640
[ 1732.735652]  ? finish_task_switch+0x74/0x1f0
[ 1732.735653]  pm_runtime_work+0x67/0x90
[ 1732.735654]  process_one_work+0x1e3/0x3e0
[ 1732.735655]  worker_thread+0x48/0x3f0
[ 1732.735656]  kthread+0x109/0x140
[ 1732.735657]  ? process_one_work+0x3e0/0x3e0
[ 1732.735658]  ? kthread_create_on_node+0x40/0x40
[ 1732.735659]  ret_from_fork+0x27/0x40
[ 1732.735660] Code: ff ff 49 8b 7c 24 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 3f d0 ee df 48 89 da 48 89 c6 48 c7 c7 e2 12 62 a1 e8 3e 70 b7 df &lt=
;0f&gt; ff
e9 7b ff ff ff 66 0f 1f 44 00 00 e8 6b be 18 e0 55 49 c1=20
[ 1732.735675] ---[ end trace cea4b3e271e42382 ]---
[ 1732.735742] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go
idle...
[ 1746.912049] asynchronous wait on fence i915:X[6056]/0:117 timed out
[ 1747.735011] nouveau 0000:01:00.0: DRM: failed to idle channel 1 [DRM]</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15026097950.551dd.12048--

--===============0378348237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0378348237==--

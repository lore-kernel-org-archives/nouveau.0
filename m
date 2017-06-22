From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101553] [GP107] failed to create kernel channel, -22
Date: Thu, 22 Jun 2017 14:19:44 +0000
Message-ID: <bug-101553-8800-4MAUb9YzPo@http.bugs.freedesktop.org/>
References: <bug-101553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1128278122=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1128278122==
Content-Type: multipart/alternative; boundary="14981411840.dDAdb2Fd.1495";
 charset="UTF-8"


--14981411840.dDAdb2Fd.1495
Date: Thu, 22 Jun 2017 14:19:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101553

--- Comment #2 from Anton Kochkov <anton.kochkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 132139
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D132139&action=3Dedit
full dmesg of linux kernel 4.12_rc0

Here is the full stack trace, as promised (for linux kernel 4.12_rc6).
Basically I booted, then run "startx" (It also prevents from finishing powe=
roff
command - it goes into this loop again):

[  218.489759] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550481] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550485] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550486] nouveau 0000:01:00.0: DRM: resuming object tree...
[  244.355333] NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [X:291=
2]
[  244.355370] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
ath10k_pci iTCO_wdt x86_pkg_temp_thermal dell_laptop nouveau
iTCO_vendor_support i915 ath10k_core snd_hda_codec coretemp dell_smm_hwmon
snd_hda_core ttm ath uvcvideo iosf_mbi efi_pstore btusb kvm_intel snd_hwdep
drm_kms_helper mac80211 btrtl videobuf2_vmalloc kvm btbcm btintel
videobuf2_memops irqbypass videobuf2_v4l2 bluetooth videobuf2_core crc32c_i=
ntel
videodev drm ecdh_generic cfg80211 snd_pcm ghash_clmulni_intel cryptd snd_t=
imer
dell_wmi syscopyarea serio_raw efivars sparse_keymap sysfillrect snd rfkill
pcspkr sysimgblt soundcore dell_smbios i2c_i801 fb_sys_fops dcdbas mxm_wmi
video wmi dell_smo8800 efivarfs xts cbc libiscsi scsi_transport_iscsi ixgb
ixgbe
[  244.355409]  tulip cxgb3 cxgb mdio cxgb4 vxge bonding vxlan ip6_udp_tunn=
el
udp_tunnel macvlan vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcn=
et32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage mpt3sas raid_class aic94xx libsas lpfc qla2xxx
megaraid_sas megaraid_mbox megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xx=
xx
3w_sas mptsas scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih
mptbase imm parport sym53c8xx initio arcmsr aic7xxx
[  244.355441]  aic79xx scsi_transport_spi sr_mod cdrom sg sd_mod pdc_adma
sata_inic162x sata_mv ata_piix ahci libahci sata_qstor sata_vsc sata_uli
sata_sis sata_sx4 sata_nv sata_via sata_svw sata_sil24 sata_sil sata_promise
pata_via pata_jmicron pata_marvell pata_sis pata_netcell pata_pdc202xx_old
pata_atiixp pata_amd pata_ali pata_it8213 pata_pcmcia pata_serverworks
pata_oldpiix pata_artop pata_it821x pata_hpt3x2n pata_hpt3x3 pata_hpt37x
pata_hpt366 pata_cmd64x pata_sil680 pata_pdc2027x
[  244.355455] CPU: 5 PID: 2912 Comm: X Not tainted 4.12.0-rc6 #1
[  244.355455] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[  244.355456] task: ffff880460489740 task.stack: ffffc900014ac000
[  244.355458] RIP: 0010:ioread32+0x30/0x40
[  244.355459] RSP: 0018:ffffc900014af7b0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[  244.355460] RAX: 00000000ffffffff RBX: ffff88046ade4400 RCX:
0000000000000018
[  244.355460] RDX: 0000035261a613f8 RSI: ffffc9000410a014 RDI:
ffffc90004009410
[  244.355461] RBP: ffffc900014af7d0 R08: 0000000000000002 R09:
ffffc900014af7ac
[  244.355461] R10: 0000000000000000 R11: 00000000000003bd R12:
00000000ffffffff
[  244.355462] R13: 00000000ffffffff R14: ffffffffffffffff R15:
ffff8804669c20c0
[  244.355462] FS:  00007fd8c47b18c0(0000) GS:ffff88047f540000(0000)
knlGS:0000000000000000
[  244.355463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  244.355463] CR2: 00007ffc6e3e8f4c CR3: 0000000468ff6000 CR4:
00000000003406e0
[  244.355464] Call Trace:
[  244.355486]  ? nv04_timer_read+0x48/0x60 [nouveau]
[  244.355502]  nvkm_timer_read+0xf/0x20 [nouveau]
[  244.355517]  nvkm_pmu_reset+0x71/0x170 [nouveau]
[  244.355531]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[  244.355540]  nvkm_subdev_preinit+0x34/0x110 [nouveau]
[  244.355556]  nvkm_device_init+0x62/0x280 [nouveau]
[  244.355571]  nvkm_udevice_init+0x48/0x60 [nouveau]
[  244.355580]  nvkm_object_init+0x40/0x190 [nouveau]
[  244.355589]  nvkm_object_init+0xb4/0x190 [nouveau]
[  244.355605]  nvkm_client_resume+0xe/0x10 [nouveau]
[  244.355613]  nvif_client_resume+0x17/0x20 [nouveau]
[  244.355628]  nouveau_do_resume+0x40/0xe0 [nouveau]
[  244.355643]  nouveau_pmops_runtime_resume+0x91/0x170 [nouveau]
[  244.355645]  pci_pm_runtime_resume+0x7b/0xa0
[  244.355646]  ? pci_restore_standard_config+0x40/0x40
[  244.355647]  __rpm_callback+0xc1/0x1f0
[  244.355647]  rpm_callback+0x24/0x80
[  244.355648]  ? pci_restore_standard_config+0x40/0x40
[  244.355649]  rpm_resume+0x4ac/0x6c0
[  244.355650]  __pm_runtime_resume+0x4e/0x80
[  244.355664]  nouveau_drm_open+0x3d/0x1c0 [nouveau]
[  244.355665]  ? selinux_capable+0x20/0x30
[  244.355667]  ? security_capable+0x48/0x60
[  244.355672]  drm_open+0x213/0x420 [drm]
[  244.355677]  drm_stub_open+0xbb/0xf0 [drm]
[  244.355678]  chrdev_open+0xa1/0x170
[  244.355679]  do_dentry_open+0x205/0x300
[  244.355680]  ? cdev_put+0x30/0x30
[  244.355680]  vfs_open+0x4e/0x80
[  244.355682]  do_last+0x436/0x10a0
[  244.355683]  ? security_inode_permission+0x41/0x60
[  244.355684]  ? __inode_permission+0x3f/0xb0
[  244.355685]  ? path_init+0x1bf/0x300
[  244.355686]  path_openat+0x91/0x2e0
[  244.355687]  do_filp_open+0x8a/0xf0
[  244.355689]  ? _cond_resched+0x5/0x40
[  244.355690]  ? _cond_resched+0x5/0x40
[  244.355691]  ? getname_flags+0x4f/0x1f0
[  244.355691]  ? __alloc_fd+0x3f/0x170
[  244.355692]  do_sys_open+0x12f/0x200
[  244.355693]  ? do_filp_open+0x5/0xf0
[  244.355694]  ? do_sys_open+0x12f/0x200
[  244.355695]  SyS_open+0x1e/0x20
[  244.355696]  entry_SYSCALL_64_fastpath+0x1c/0xac
[  244.355696] RIP: 0033:0x7fd8c2945740
[  244.355697] RSP: 002b:00007ffc6e3eda08 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[  244.355698] RAX: ffffffffffffffda RBX: 0000000001104f80 RCX:
00007fd8c2945740
[  244.355698] RDX: 0000000000080000 RSI: 0000000000000002 RDI:
0000000001105050
[  244.355698] RBP: 00007fd8c292c420 R08: 0000000000000031 R09:
0000000000000031
[  244.355699] R10: 00000000010f79c0 R11: 0000000000000246 R12:
0000000000000000
[  244.355699] R13: 0000000001104a90 R14: 00007ffc6e3e95e2 R15:
00007ffc6e3e91e0
[  244.355700] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 28 85 a2 81 48 89 e5 e8 29 ff ff ff b8 ff ff ff ff 5d c3 8b 07 <c3=
> 0f
1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[  254.205333] INFO: rcu_sched self-detected stall on CPU
[  254.205335]  5-...: (20999 ticks this GP) idle=3D766/140000000000001/0
softirq=3D2096/2096 fqs=3D5239=20
[  254.205335]   (t=3D21000 jiffies g=3D1139 c=3D1138 q=3D2)
[  254.205337] NMI backtrace for cpu 5
[  254.205338] CPU: 5 PID: 2912 Comm: X Tainted: G             L  4.12.0-rc=
6 #1
[  254.205338] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[  254.205338] Call Trace:
[  254.205339]  <IRQ>
[  254.205341]  dump_stack+0x68/0x92
[  254.205342]  nmi_cpu_backtrace+0x94/0xa0
[  254.205343]  ? irq_force_complete_move+0x140/0x140
[  254.205364]  nmi_trigger_cpumask_backtrace+0xd9/0x110
[  254.205365]  arch_trigger_cpumask_backtrace+0x19/0x20
[  254.205367]  rcu_dump_cpu_stacks+0xa5/0xdf
[  254.205368]  rcu_check_callbacks+0x755/0x8b0
[  254.205370]  ? tick_sched_handle.isra.7+0x50/0x50
[  254.205371]  update_process_times+0x2f/0x60
[  254.205372]  tick_sched_handle.isra.7+0x21/0x50
[  254.205373]  tick_sched_timer+0x42/0x70
[  254.205374]  __hrtimer_run_queues+0xd1/0x1f0
[  254.205375]  hrtimer_interrupt+0xa3/0x1d0
[  254.205377]  local_apic_timer_interrupt+0x38/0x60
[  254.205378]  smp_apic_timer_interrupt+0x38/0x50
[  254.205379]  apic_timer_interrupt+0x90/0xa0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981411840.dDAdb2Fd.1495
Date: Thu, 22 Jun 2017 14:19:44 +0000
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
   title=3D"NEW - [GP107] failed to create kernel channel, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP107] failed to create kernel channel, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553">bug 10155=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
anton.kochkov&#64;gmail.com" title=3D"Anton Kochkov &lt;anton.kochkov&#64;g=
mail.com&gt;"> <span class=3D"fn">Anton Kochkov</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D132139=
" name=3D"attach_132139" title=3D"full dmesg of linux kernel 4.12_rc0">atta=
chment 132139</a> <a href=3D"attachment.cgi?id=3D132139&amp;action=3Dedit" =
title=3D"full dmesg of linux kernel 4.12_rc0">[details]</a></span>
full dmesg of linux kernel 4.12_rc0

Here is the full stack trace, as promised (for linux kernel 4.12_rc6).
Basically I booted, then run &quot;startx&quot; (It also prevents from fini=
shing poweroff
command - it goes into this loop again):

[  218.489759] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550481] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550485] nouveau 0000:01:00.0: Refused to change power state, current=
ly
in D3
[  218.550486] nouveau 0000:01:00.0: DRM: resuming object tree...
[  244.355333] NMI watchdog: BUG: soft lockup - CPU#5 stuck for 22s! [X:291=
2]
[  244.355370] Modules linked in: ctr ccm 8021q garp stp llc arc4
snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic snd_hda_intel
ath10k_pci iTCO_wdt x86_pkg_temp_thermal dell_laptop nouveau
iTCO_vendor_support i915 ath10k_core snd_hda_codec coretemp dell_smm_hwmon
snd_hda_core ttm ath uvcvideo iosf_mbi efi_pstore btusb kvm_intel snd_hwdep
drm_kms_helper mac80211 btrtl videobuf2_vmalloc kvm btbcm btintel
videobuf2_memops irqbypass videobuf2_v4l2 bluetooth videobuf2_core crc32c_i=
ntel
videodev drm ecdh_generic cfg80211 snd_pcm ghash_clmulni_intel cryptd snd_t=
imer
dell_wmi syscopyarea serio_raw efivars sparse_keymap sysfillrect snd rfkill
pcspkr sysimgblt soundcore dell_smbios i2c_i801 fb_sys_fops dcdbas mxm_wmi
video wmi dell_smo8800 efivarfs xts cbc libiscsi scsi_transport_iscsi ixgb
ixgbe
[  244.355409]  tulip cxgb3 cxgb mdio cxgb4 vxge bonding vxlan ip6_udp_tunn=
el
udp_tunnel macvlan vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcn=
et32
mii igb ptp pps_core i2c_algo_bit i2c_core e1000 bnx2 atl1c fuse xfs nfs lo=
ckd
grace sunrpc fscache jfs reiserfs btrfs ext4 jbd2 ext2 mbcache linear raid10
raid1 raid0 dm_raid raid456 async_raid6_recov async_memcpy async_pq async_x=
or
async_tx xor raid6_pq libcrc32c dm_snapshot dm_bufio dm_crypt dm_mirror
dm_region_hash dm_log dm_mod dax firewire_core crc_itu_t sl811_hcd xhci_pci
xhci_hcd usb_storage mpt3sas raid_class aic94xx libsas lpfc qla2xxx
megaraid_sas megaraid_mbox megaraid_mm aacraid sx8 hpsa cciss 3w_9xxx 3w_xx=
xx
3w_sas mptsas scsi_transport_sas mptfc scsi_transport_fc mptspi mptscsih
mptbase imm parport sym53c8xx initio arcmsr aic7xxx
[  244.355441]  aic79xx scsi_transport_spi sr_mod cdrom sg sd_mod pdc_adma
sata_inic162x sata_mv ata_piix ahci libahci sata_qstor sata_vsc sata_uli
sata_sis sata_sx4 sata_nv sata_via sata_svw sata_sil24 sata_sil sata_promise
pata_via pata_jmicron pata_marvell pata_sis pata_netcell pata_pdc202xx_old
pata_atiixp pata_amd pata_ali pata_it8213 pata_pcmcia pata_serverworks
pata_oldpiix pata_artop pata_it821x pata_hpt3x2n pata_hpt3x3 pata_hpt37x
pata_hpt366 pata_cmd64x pata_sil680 pata_pdc2027x
[  244.355455] CPU: 5 PID: 2912 Comm: X Not tainted 4.12.0-rc6 #1
[  244.355455] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[  244.355456] task: ffff880460489740 task.stack: ffffc900014ac000
[  244.355458] RIP: 0010:ioread32+0x30/0x40
[  244.355459] RSP: 0018:ffffc900014af7b0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[  244.355460] RAX: 00000000ffffffff RBX: ffff88046ade4400 RCX:
0000000000000018
[  244.355460] RDX: 0000035261a613f8 RSI: ffffc9000410a014 RDI:
ffffc90004009410
[  244.355461] RBP: ffffc900014af7d0 R08: 0000000000000002 R09:
ffffc900014af7ac
[  244.355461] R10: 0000000000000000 R11: 00000000000003bd R12:
00000000ffffffff
[  244.355462] R13: 00000000ffffffff R14: ffffffffffffffff R15:
ffff8804669c20c0
[  244.355462] FS:  00007fd8c47b18c0(0000) GS:ffff88047f540000(0000)
knlGS:0000000000000000
[  244.355463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  244.355463] CR2: 00007ffc6e3e8f4c CR3: 0000000468ff6000 CR4:
00000000003406e0
[  244.355464] Call Trace:
[  244.355486]  ? nv04_timer_read+0x48/0x60 [nouveau]
[  244.355502]  nvkm_timer_read+0xf/0x20 [nouveau]
[  244.355517]  nvkm_pmu_reset+0x71/0x170 [nouveau]
[  244.355531]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[  244.355540]  nvkm_subdev_preinit+0x34/0x110 [nouveau]
[  244.355556]  nvkm_device_init+0x62/0x280 [nouveau]
[  244.355571]  nvkm_udevice_init+0x48/0x60 [nouveau]
[  244.355580]  nvkm_object_init+0x40/0x190 [nouveau]
[  244.355589]  nvkm_object_init+0xb4/0x190 [nouveau]
[  244.355605]  nvkm_client_resume+0xe/0x10 [nouveau]
[  244.355613]  nvif_client_resume+0x17/0x20 [nouveau]
[  244.355628]  nouveau_do_resume+0x40/0xe0 [nouveau]
[  244.355643]  nouveau_pmops_runtime_resume+0x91/0x170 [nouveau]
[  244.355645]  pci_pm_runtime_resume+0x7b/0xa0
[  244.355646]  ? pci_restore_standard_config+0x40/0x40
[  244.355647]  __rpm_callback+0xc1/0x1f0
[  244.355647]  rpm_callback+0x24/0x80
[  244.355648]  ? pci_restore_standard_config+0x40/0x40
[  244.355649]  rpm_resume+0x4ac/0x6c0
[  244.355650]  __pm_runtime_resume+0x4e/0x80
[  244.355664]  nouveau_drm_open+0x3d/0x1c0 [nouveau]
[  244.355665]  ? selinux_capable+0x20/0x30
[  244.355667]  ? security_capable+0x48/0x60
[  244.355672]  drm_open+0x213/0x420 [drm]
[  244.355677]  drm_stub_open+0xbb/0xf0 [drm]
[  244.355678]  chrdev_open+0xa1/0x170
[  244.355679]  do_dentry_open+0x205/0x300
[  244.355680]  ? cdev_put+0x30/0x30
[  244.355680]  vfs_open+0x4e/0x80
[  244.355682]  do_last+0x436/0x10a0
[  244.355683]  ? security_inode_permission+0x41/0x60
[  244.355684]  ? __inode_permission+0x3f/0xb0
[  244.355685]  ? path_init+0x1bf/0x300
[  244.355686]  path_openat+0x91/0x2e0
[  244.355687]  do_filp_open+0x8a/0xf0
[  244.355689]  ? _cond_resched+0x5/0x40
[  244.355690]  ? _cond_resched+0x5/0x40
[  244.355691]  ? getname_flags+0x4f/0x1f0
[  244.355691]  ? __alloc_fd+0x3f/0x170
[  244.355692]  do_sys_open+0x12f/0x200
[  244.355693]  ? do_filp_open+0x5/0xf0
[  244.355694]  ? do_sys_open+0x12f/0x200
[  244.355695]  SyS_open+0x1e/0x20
[  244.355696]  entry_SYSCALL_64_fastpath+0x1c/0xac
[  244.355696] RIP: 0033:0x7fd8c2945740
[  244.355697] RSP: 002b:00007ffc6e3eda08 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[  244.355698] RAX: ffffffffffffffda RBX: 0000000001104f80 RCX:
00007fd8c2945740
[  244.355698] RDX: 0000000000080000 RSI: 0000000000000002 RDI:
0000000001105050
[  244.355698] RBP: 00007fd8c292c420 R08: 0000000000000031 R09:
0000000000000031
[  244.355699] R10: 00000000010f79c0 R11: 0000000000000246 R12:
0000000000000000
[  244.355699] R13: 0000000001104a90 R14: 00007ffc6e3e95e2 R15:
00007ffc6e3e91e0
[  244.355700] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 28 85 a2 81 48 89 e5 e8 29 ff ff ff b8 ff ff ff ff 5d c3 8b 07 &lt=
;c3&gt; 0f
1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[  254.205333] INFO: rcu_sched self-detected stall on CPU
[  254.205335]  5-...: (20999 ticks this GP) idle=3D766/140000000000001/0
softirq=3D2096/2096 fqs=3D5239=20
[  254.205335]   (t=3D21000 jiffies g=3D1139 c=3D1138 q=3D2)
[  254.205337] NMI backtrace for cpu 5
[  254.205338] CPU: 5 PID: 2912 Comm: X Tainted: G             L  4.12.0-rc=
6 #1
[  254.205338] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[  254.205338] Call Trace:
[  254.205339]  &lt;IRQ&gt;
[  254.205341]  dump_stack+0x68/0x92
[  254.205342]  nmi_cpu_backtrace+0x94/0xa0
[  254.205343]  ? irq_force_complete_move+0x140/0x140
[  254.205364]  nmi_trigger_cpumask_backtrace+0xd9/0x110
[  254.205365]  arch_trigger_cpumask_backtrace+0x19/0x20
[  254.205367]  rcu_dump_cpu_stacks+0xa5/0xdf
[  254.205368]  rcu_check_callbacks+0x755/0x8b0
[  254.205370]  ? tick_sched_handle.isra.7+0x50/0x50
[  254.205371]  update_process_times+0x2f/0x60
[  254.205372]  tick_sched_handle.isra.7+0x21/0x50
[  254.205373]  tick_sched_timer+0x42/0x70
[  254.205374]  __hrtimer_run_queues+0xd1/0x1f0
[  254.205375]  hrtimer_interrupt+0xa3/0x1d0
[  254.205377]  local_apic_timer_interrupt+0x38/0x60
[  254.205378]  smp_apic_timer_interrupt+0x38/0x50
[  254.205379]  apic_timer_interrupt+0x90/0xa0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14981411840.dDAdb2Fd.1495--

--===============1128278122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1128278122==--

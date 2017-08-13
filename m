From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Sun, 13 Aug 2017 07:43:16 +0000
Message-ID: <bug-100228-8800-IlC0M11cHk@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1112578632=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1112578632==
Content-Type: multipart/alternative; boundary="15026101966.ca9f.12334";
 charset="UTF-8"


--15026101966.ca9f.12334
Date: Sun, 13 Aug 2017 07:43:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #12 from Anton Kochkov <anton.kochkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
On the latest kernel - 4.13_rc4 the error is still presented, but error mes=
sage
a bit different it seems:

[ 1677.216453] nouveau 0000:01:00.0: DRM: resuming object tree...
[ 1677.324861] nouveau 0000:01:00.0: DRM: resuming fence...
[ 1677.624298] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 40=
9800
[ TIMEOUT ]
[ 1679.623842] nouveau 0000:01:00.0: timeout
[ 1679.623851] ------------[ cut here ]------------
[ 1679.623873] WARNING: CPU: 3 PID: 6056 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1501
gf100_gr_init_ctxctl_ext+0x6a8/0x790 [nouveau]
[ 1679.623874] Modules linked in: ctr ccm 8021q garp stp llc arc4
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
[ 1679.623899]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
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
[ 1679.623930]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1679.623942] CPU: 3 PID: 6056 Comm: X Not tainted 4.13.0-rc4 #1
[ 1679.623943] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1679.623943] task: ffff880469764e80 task.stack: ffffc90000ffc000
[ 1679.623960] RIP: 0010:gf100_gr_init_ctxctl_ext+0x6a8/0x790 [nouveau]
[ 1679.623961] RSP: 0018:ffffc90000fff930 EFLAGS: 00010286
[ 1679.623962] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1679.623962] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1679.623962] RBP: ffffc90000fff960 R08: 0000000000000001 R09:
00000000000003a6
[ 1679.623963] R10: ffffc90000fff7e0 R11: 00000000000003a6 R12:
0000000077366a80
[ 1679.623963] R13: ffff88046923c000 R14: ffff880468d34080 R15:
000001869a2a33c0
[ 1679.623964] FS:  00007f2f55b798c0(0000) GS:ffff88047f4c0000(0000)
knlGS:0000000000000000
[ 1679.623965] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1679.623965] CR2: 000000000179d038 CR3: 0000000467d92000 CR4:
00000000003406e0
[ 1679.623965] Call Trace:
[ 1679.623982]  gf100_gr_init_ctxctl+0x1f5/0x290 [nouveau]
[ 1679.623998]  gp100_gr_init+0x757/0x790 [nouveau]
[ 1679.624013]  gf100_gr_init_+0x55/0x60 [nouveau]
[ 1679.624049]  nvkm_gr_init+0x17/0x20 [nouveau]
[ 1679.624059]  nvkm_engine_init+0x131/0x1e0 [nouveau]
[ 1679.624081]  nvkm_subdev_init+0x95/0x200 [nouveau]
[ 1679.624090]  nvkm_engine_ref+0x4f/0x70 [nouveau]
[ 1679.624099]  nvkm_ioctl_new+0xff/0x280 [nouveau]
[ 1679.624114]  ? nvkm_fifo_chan_child_del+0x90/0x90 [nouveau]
[ 1679.624129]  ? gf100_gr_dtor+0xd0/0xd0 [nouveau]
[ 1679.624138]  nvkm_ioctl+0x11b/0x260 [nouveau]
[ 1679.624153]  nvkm_client_ioctl+0x12/0x20 [nouveau]
[ 1679.624162]  nvif_object_ioctl+0x41/0x50 [nouveau]
[ 1679.624170]  nvif_object_init+0xc2/0x120 [nouveau]
[ 1679.624185]  nouveau_abi16_ioctl_grobj_alloc+0x149/0x2c0 [nouveau]
[ 1679.624200]  ? nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[ 1679.624206]  drm_ioctl_kernel+0x69/0xb0 [drm]
[ 1679.624210]  drm_ioctl+0x319/0x3f0 [drm]
[ 1679.624224]  ? nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[ 1679.624240]  nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[ 1679.624242]  do_vfs_ioctl+0x94/0x5b0
[ 1679.624243]  ? handle_mm_fault+0xf3/0x210
[ 1679.624245]  ? security_file_ioctl+0x43/0x60
[ 1679.624246]  SyS_ioctl+0x79/0x90
[ 1679.624247]  entry_SYSCALL_64_fastpath+0x1c/0xac
[ 1679.624248] RIP: 0033:0x7f2f53a2bba7
[ 1679.624249] RSP: 002b:00007ffd3e2e6be8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1679.624249] RAX: ffffffffffffffda RBX: 00000000013c6d30 RCX:
00007f2f53a2bba7
[ 1679.624250] RDX: 00007ffd3e2e6c3c RSI: 00000000400c6444 RDI:
000000000000000f
[ 1679.624250] RBP: 00000000013be280 R08: 0000000000000010 R09:
00000000013bd1a0
[ 1679.624251] R10: 0000000000000058 R11: 0000000000003246 R12:
00000000013c6d30
[ 1679.624251] R13: 0000000000479590 R14: 0000000000000006 R15:
00007ffd3e2e7068
[ 1679.624252] Code: fc ff ff 48 8b 7b 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 aa 30 eb df 48 89 da 48 89 c6 48 c7 c7 88 66 62 a1 e8 a9 d0 b3 df <0f=
> ff
b8 f0 ff ff ff e9 6f fc ff ff 41 8b 8d a8 00 00 00 49 8b=20
[ 1679.624267] ---[ end trace cea4b3e271e4236a ]---
[ 1679.624269] nouveau 0000:01:00.0: gr: init failed, -16
[ 1681.625476] nouveau 0000:01:00.0: timeout
[ 1681.625480] ------------[ cut here ]------------

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15026101966.ca9f.12334
Date: Sun, 13 Aug 2017 07:43:16 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
anton.kochkov&#64;gmail.com" title=3D"Anton Kochkov &lt;anton.kochkov&#64;g=
mail.com&gt;"> <span class=3D"fn">Anton Kochkov</span></a>
</span></b>
        <pre>On the latest kernel - 4.13_rc4 the error is still presented, =
but error message
a bit different it seems:

[ 1677.216453] nouveau 0000:01:00.0: DRM: resuming object tree...
[ 1677.324861] nouveau 0000:01:00.0: DRM: resuming fence...
[ 1677.624298] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 40=
9800
[ TIMEOUT ]
[ 1679.623842] nouveau 0000:01:00.0: timeout
[ 1679.623851] ------------[ cut here ]------------
[ 1679.623873] WARNING: CPU: 3 PID: 6056 at
drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:1501
gf100_gr_init_ctxctl_ext+0x6a8/0x790 [nouveau]
[ 1679.623874] Modules linked in: ctr ccm 8021q garp stp llc arc4
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
[ 1679.623899]  vmxnet3 virtio_net virtio_ring virtio tg3 sky2 r8169 pcnet32
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
[ 1679.623930]  sata_qstor sata_vsc sata_uli sata_sis sata_sx4 sata_nv sata=
_via
sata_svw sata_sil24 sata_sil sata_promise pata_via pata_jmicron pata_marvell
pata_sis pata_netcell pata_pdc202xx_old pata_atiixp pata_amd pata_ali
pata_it8213 pata_pcmcia pata_serverworks pata_oldpiix pata_artop pata_it821x
pata_hpt3x2n pata_hpt3x3 pata_hpt37x pata_hpt366 pata_cmd64x pata_sil680
pata_pdc2027x
[ 1679.623942] CPU: 3 PID: 6056 Comm: X Not tainted 4.13.0-rc4 #1
[ 1679.623943] Hardware name: Dell Inc. XPS 15 9560/05FFDN, BIOS 1.3.3
05/08/2017
[ 1679.623943] task: ffff880469764e80 task.stack: ffffc90000ffc000
[ 1679.623960] RIP: 0010:gf100_gr_init_ctxctl_ext+0x6a8/0x790 [nouveau]
[ 1679.623961] RSP: 0018:ffffc90000fff930 EFLAGS: 00010286
[ 1679.623962] RAX: 000000000000001d RBX: ffff88046c48c840 RCX:
ffffffff81c4af48
[ 1679.623962] RDX: 0000000000000001 RSI: 0000000000000046 RDI:
ffffffff81f792cc
[ 1679.623962] RBP: ffffc90000fff960 R08: 0000000000000001 R09:
00000000000003a6
[ 1679.623963] R10: ffffc90000fff7e0 R11: 00000000000003a6 R12:
0000000077366a80
[ 1679.623963] R13: ffff88046923c000 R14: ffff880468d34080 R15:
000001869a2a33c0
[ 1679.623964] FS:  00007f2f55b798c0(0000) GS:ffff88047f4c0000(0000)
knlGS:0000000000000000
[ 1679.623965] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1679.623965] CR2: 000000000179d038 CR3: 0000000467d92000 CR4:
00000000003406e0
[ 1679.623965] Call Trace:
[ 1679.623982]  gf100_gr_init_ctxctl+0x1f5/0x290 [nouveau]
[ 1679.623998]  gp100_gr_init+0x757/0x790 [nouveau]
[ 1679.624013]  gf100_gr_init_+0x55/0x60 [nouveau]
[ 1679.624049]  nvkm_gr_init+0x17/0x20 [nouveau]
[ 1679.624059]  nvkm_engine_init+0x131/0x1e0 [nouveau]
[ 1679.624081]  nvkm_subdev_init+0x95/0x200 [nouveau]
[ 1679.624090]  nvkm_engine_ref+0x4f/0x70 [nouveau]
[ 1679.624099]  nvkm_ioctl_new+0xff/0x280 [nouveau]
[ 1679.624114]  ? nvkm_fifo_chan_child_del+0x90/0x90 [nouveau]
[ 1679.624129]  ? gf100_gr_dtor+0xd0/0xd0 [nouveau]
[ 1679.624138]  nvkm_ioctl+0x11b/0x260 [nouveau]
[ 1679.624153]  nvkm_client_ioctl+0x12/0x20 [nouveau]
[ 1679.624162]  nvif_object_ioctl+0x41/0x50 [nouveau]
[ 1679.624170]  nvif_object_init+0xc2/0x120 [nouveau]
[ 1679.624185]  nouveau_abi16_ioctl_grobj_alloc+0x149/0x2c0 [nouveau]
[ 1679.624200]  ? nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[ 1679.624206]  drm_ioctl_kernel+0x69/0xb0 [drm]
[ 1679.624210]  drm_ioctl+0x319/0x3f0 [drm]
[ 1679.624224]  ? nouveau_abi16_ioctl_channel_free+0x90/0x90 [nouveau]
[ 1679.624240]  nouveau_drm_ioctl+0x74/0xc0 [nouveau]
[ 1679.624242]  do_vfs_ioctl+0x94/0x5b0
[ 1679.624243]  ? handle_mm_fault+0xf3/0x210
[ 1679.624245]  ? security_file_ioctl+0x43/0x60
[ 1679.624246]  SyS_ioctl+0x79/0x90
[ 1679.624247]  entry_SYSCALL_64_fastpath+0x1c/0xac
[ 1679.624248] RIP: 0033:0x7f2f53a2bba7
[ 1679.624249] RSP: 002b:00007ffd3e2e6be8 EFLAGS: 00003246 ORIG_RAX:
0000000000000010
[ 1679.624249] RAX: ffffffffffffffda RBX: 00000000013c6d30 RCX:
00007f2f53a2bba7
[ 1679.624250] RDX: 00007ffd3e2e6c3c RSI: 00000000400c6444 RDI:
000000000000000f
[ 1679.624250] RBP: 00000000013be280 R08: 0000000000000010 R09:
00000000013bd1a0
[ 1679.624251] R10: 0000000000000058 R11: 0000000000003246 R12:
00000000013c6d30
[ 1679.624251] R13: 0000000000479590 R14: 0000000000000006 R15:
00007ffd3e2e7068
[ 1679.624252] Code: fc ff ff 48 8b 7b 10 48 8b 5f 50 48 85 db 75 04 48 8b =
5f
10 e8 aa 30 eb df 48 89 da 48 89 c6 48 c7 c7 88 66 62 a1 e8 a9 d0 b3 df &lt=
;0f&gt; ff
b8 f0 ff ff ff e9 6f fc ff ff 41 8b 8d a8 00 00 00 49 8b=20
[ 1679.624267] ---[ end trace cea4b3e271e4236a ]---
[ 1679.624269] nouveau 0000:01:00.0: gr: init failed, -16
[ 1681.625476] nouveau 0000:01:00.0: timeout
[ 1681.625480] ------------[ cut here ]------------</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15026101966.ca9f.12334--

--===============1112578632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1112578632==--

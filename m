From: Mike Galbraith <efault-Mmb7MZpHnFY@public.gmane.org>
Subject: nouveau: WARNING: CPU: 0 PID: 20957 at
 drivers/gpu/drm/nouveau/nvif/vmm.c:71
Date: Fri, 20 Nov 2020 08:15:15 +0100
Message-ID: <eee10eb4ea028d4ac74939d5100ae9c4383b82da.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

[15561.391527] ------------[ cut here ]------------
[15561.391560] WARNING: CPU: 0 PID: 20957 at drivers/gpu/drm/nouveau/nvif/vmm.c:71 nvif_vmm_put+0x4a/0x50 [nouveau]
[15561.391562] Modules linked in: nls_utf8(E) isofs(E) fuse(E) msr(E) xt_comment(E) br_netfilter(E) xt_physdev(E) nfnetlink_cthelper(E) nfnetlink(E) ebtable_filter(E) ebtables(E) af_packet(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysfs(E) rfkill(E) xt_pkttype(E) xt_tcpudp(E) ip6t_REJECT(E) nf_reject_ipv6(E) ipt_REJECT(E) nf_reject_ipv4(E) iptable_filter(E) bpfilter(E) ip6table_mangle(E) ip_tables(E) xt_conntrack(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) libcrc32c(E) ip6table_filter(E) ip6_tables(E) x_tables(E) hid_logitech_hidpp(E) sr_mod(E) usblp(E) cdrom(E) hid_logitech_dj(E) joydev(E) intel_rapl_msr(E) intel_rapl_common(E) at24(E) mei_hdcp(E) iTCO_wdt(E) regmap_i2c(E) intel_pmc_bxt(E) iTCO_vendor_support(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) ledtri
 g_audio(E) snd_hda_codec_hdmi(E) x86_pkg_temp_thermal(E) intel_powerclamp(E) snd_hda_intel(E) coretemp(E) snd_intel_dspcfg(E) kvm_intel(E) snd_hda_codec(E) snd_hwdep(E) snd_hda_core(E) kvm(E)
[15561.391586]  nls_iso8859_1(E) nls_cp437(E) snd_pcm(E) irqbypass(E) crct10dif_pclmul(E) snd_timer(E) crc32_pclmul(E) r8169(E) ghash_clmulni_intel(E) snd(E) aesni_intel(E) realtek(E) crypto_simd(E) i2c_i801(E) mei_me(E) mdio_devres(E) cryptd(E) pcspkr(E) soundcore(E) i2c_smbus(E) lpc_ich(E) glue_helper(E) mfd_core(E) libphy(E) mei(E) fan(E) thermal(E) intel_smartconnect(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E) grace(E) sch_fq_codel(E) sunrpc(E) nfs_ssc(E) uas(E) usb_storage(E) hid_generic(E) usbhid(E) nouveau(E) wmi(E) i2c_algo_bit(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) sysimgblt(E) fb_sys_fops(E) xhci_pci(E) cec(E) ahci(E) rc_core(E) ehci_pci(E) xhci_hcd(E) ttm(E) libahci(E) ehci_hcd(E) libata(E) drm(E) usbcore(E) video(E) button(E) sd_mod(E) t10_pi(E) vfat(E) fat(E) vir
 tio_blk(E) virtio_mmio(E) virtio_ring(E) virtio(E) ext4(E) crc32c_intel(E) crc16(E) mbcache(E) jbd2(E) loop(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod
 (E)
[15561.391626]  efivarfs(E) autofs4(E)
[15561.391637] CPU: 0 PID: 20957 Comm: kworker/0:4 Kdump: loaded Tainted: G S          E     5.10.0.g9c87c9f-master #3
[15561.391640] Hardware name: MEDION MS-7848/MS-7848, BIOS M7848W08.20C 09/23/2013
[15561.391667] Workqueue: events nouveau_cli_work [nouveau]
[15561.391682] RIP: 0010:nvif_vmm_put+0x4a/0x50 [nouveau]
[15561.391684] Code: 00 00 00 48 89 e2 48 c7 04 24 00 00 00 00 48 89 44 24 08 e8 48 e7 ff ff 85 c0 75 0e 48 c7 43 08 00 00 00 00 48 83 c4 10 5b c3 <0f> 0b eb ee 66 90 0f 1f 44 00 00 53 48 83 ec 18 83 fe 01 48 8b 5c
[15561.391686] RSP: 0000:ffff8881feca7e08 EFLAGS: 00010282
[15561.391688] RAX: 00000000fffffffe RBX: ffff8881feca7e28 RCX: 0000000000000000
[15561.391690] RDX: 0000000000000010 RSI: ffff8881feca7d80 RDI: ffff8881feca7e18
[15561.391692] RBP: ffff8881feca7e50 R08: 0000000001dc5000 R09: 0000000000000000
[15561.391693] R10: ffffffff82003de8 R11: fefefefefefefeff R12: dead000000000122
[15561.391695] R13: dead000000000100 R14: ffff888102fa9328 R15: ffff888102fa9308
[15561.391697] FS:  0000000000000000(0000) GS:ffff88841ec00000(0000) knlGS:0000000000000000
[15561.391698] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[15561.391700] CR2: 00007fd692058000 CR3: 0000000003c10002 CR4: 00000000001706f0
[15561.391701] Call Trace:
[15561.391729]  nouveau_vma_del+0x58/0xa0 [nouveau]
[15561.391755]  nouveau_gem_object_delete_work+0x26/0x40 [nouveau]
[15561.391782]  nouveau_cli_work+0x76/0x120 [nouveau]
[15561.391786]  ? __schedule+0x35c/0x770
[15561.391790]  process_one_work+0x1f5/0x3c0
[15561.391792]  ? process_one_work+0x3c0/0x3c0
[15561.391794]  worker_thread+0x2d/0x3d0
[15561.391796]  ? process_one_work+0x3c0/0x3c0
[15561.391798]  kthread+0x117/0x130
[15561.391800]  ? kthread_park+0x90/0x90
[15561.391803]  ret_from_fork+0x1f/0x30
[15561.391806] ---[ end trace 1f8ba448e97e64e0 ]---

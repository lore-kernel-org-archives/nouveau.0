From: Mike Galbraith <efault@gmx.de>
Subject: [drm/nouveau] GeForce 8600 GT boot/suspend grumbling
Date: Sat, 15 Jul 2017 07:40:00 +0200
Message-ID: <1500097200.6712.17.camel@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Greetings,

box: bog standard [tc]rusty old Nvidia equipped Q6600 Medion (Aldi) deskside
kernel: master.today (v4.12-11690-gccd5d1b91f22)

lspci -nn -d 10de:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G84 [GeForce 8600 GT] [10de:0402] (rev a1)

abreviated dmesg:
...
[    3.720990] fb: switching to nouveaufb from VESA VGA
[    3.744489] Console: switching to colour dummy device 80x25
[    3.744966] nouveau 0000:01:00.0: NVIDIA G84 (084200a2)
...
[    3.846963] usbcore: registered new interface driver uas
[    3.849938] nouveau 0000:01:00.0: bios: version 60.84.6e.00.12
[    3.870769] hid-generic 0003:04CA:002B.0002: input,hidraw1: USB HID v1.11 Keyboard [Liteon Wireless keyboard and mouse] on usb-0000:00:1d.0-1/input0
[    3.870773] nouveau 0000:01:00.0: bios: M0203T not found
[    3.870774] nouveau 0000:01:00.0: bios: M0203E not matched!
[    3.870777] nouveau 0000:01:00.0: fb: 256 MiB DDR2
[    3.871168] input: Liteon Wireless keyboard and mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1:1.1/0003:04CA:002B.0003/input/input7
[    3.896090] usb 3-2: new low-speed USB device number 3 using uhci_hcd
[    3.919101] [TTM] Zone  kernel: Available graphics memory: 3881208 kiB
[    3.919106] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    3.919110] [TTM] Initializing pool allocator
[    3.919120] [TTM] Initializing DMA pool allocator
[    3.919141] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    3.919146] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.919152] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    3.919157] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.919162] nouveau 0000:01:00.0: DRM: DCB outp 00: 04000310 00000028
[    3.919167] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011300 00000028
[    3.919171] nouveau 0000:01:00.0: DRM: DCB outp 02: 01011302 00000030
[    3.919176] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022322 00020010
[    3.919180] nouveau 0000:01:00.0: DRM: DCB outp 04: 010333f1 00c0c083
[    3.919185] nouveau 0000:01:00.0: DRM: DCB conn 00: 0000
[    3.919189] nouveau 0000:01:00.0: DRM: DCB conn 01: 1130
[    3.919194] nouveau 0000:01:00.0: DRM: DCB conn 02: 2261
[    3.919198] nouveau 0000:01:00.0: DRM: DCB conn 03: 0310
[    3.919202] nouveau 0000:01:00.0: DRM: DCB conn 04: 0311
[    3.919206] nouveau 0000:01:00.0: DRM: DCB conn 05: 0313
[    3.919258] ------------[ cut here ]------------
[    3.919316] WARNING: CPU: 3 PID: 224 at drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c:83 nvkm_outp_xlat.isra.0+0x26/0x80 [nouveau]
[    3.919322] Modules linked in: uas(E) usb_storage(E) hid_generic(E+) usbhid(E) nouveau(E+) wmi(E) video(E) i2c_algo_bit(E) ahci(E+) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) libahci(E) sysimgblt(E) fb_sys_fops(E) firewire_ohci(E) libata(E) firewire_core(E) crc_itu_t(E) ehci_pci(E+) serio_raw(E) ttm(E) button(E) drm(E) uhci_hcd(E) ehci_hcd(E) usbcore(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) autofs4(E)
[    3.919360] CPU: 3 PID: 224 Comm: systemd-udevd Tainted: G            E   4.12.0.gccd5d1b-master #186
[    3.919366] Hardware name: MEDIONPC MS-7502/MS-7502, BIOS 6.00 PG 12/26/2007
[    3.919370] task: ffff880211cd3d40 task.stack: ffffc90000714000
[    3.919412] RIP: 0010:nvkm_outp_xlat.isra.0+0x26/0x80 [nouveau]
[    3.919417] RSP: 0018:ffffc900007177b0 EFLAGS: 00010202
[    3.919421] RAX: ffff88021128fc08 RBX: ffff880211c0aa80 RCX: ffffc90000717870
[    3.919425] RDX: ffffc900007177fc RSI: 0000000000000000 RDI: 0000000000000001
[    3.919429] RBP: ffff88021128fc10 R08: ffff880211c0aa80 R09: ffff880211c0aa80
[    3.919433] R10: 0000000000000000 R11: ffffea00084cf980 R12: ffff8802130f5500
[    3.919437] R13: ffff880211c0a9d0 R14: 0000000000000003 R15: 0000000000000004
[    3.919442] FS:  00007fe2035b68c0(0000) GS:ffff88022fd80000(0000) knlGS:0000000000000000
[    3.919448] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.919452] CR2: 00007fe203586000 CR3: 00000002133e3000 CR4: 00000000000006e0
[    3.919456] Call Trace:
[    3.919500]  nvkm_outp_ctor+0x105/0x130 [nouveau]
[    3.919508]  ? kmem_cache_alloc_trace+0x135/0x140
[    3.919550]  nvkm_disp_oneinit+0x132/0x510 [nouveau]
[    3.919583]  nvkm_engine_init+0x74/0x1d0 [nouveau]
[    3.919617]  nvkm_subdev_init+0xaf/0x200 [nouveau]
[    3.919648]  nvkm_engine_ref+0x4a/0x70 [nouveau]
[    3.919681]  nvkm_ioctl_new+0x118/0x280 [nouveau]
[    3.919705]  ? drm_property_create+0x100/0x150 [drm]
[    3.919746]  ? nvkm_udevice_map+0x40/0x40 [nouveau]
[    3.919779]  nvkm_ioctl+0x13c/0x230 [nouveau]
[    3.919785]  ? try_to_grab_pending+0xa7/0x130
[    3.919816]  nvif_object_init+0xc0/0x130 [nouveau]
[    3.919859]  nouveau_display_create+0x13e/0x630 [nouveau]
[    3.919903]  nouveau_drm_load+0x1e2/0x8d0 [nouveau]
[    3.919910]  ? sysfs_do_create_link_sd.isra.2+0x6b/0xb0
[    3.919924]  drm_dev_register+0x139/0x1d0 [drm]
[    3.919930]  ? pci_read_config_word.part.9+0x47/0x60
[    3.919944]  drm_get_pci_dev+0x94/0x170 [drm]
[    3.919987]  nouveau_drm_probe+0x1dc/0x240 [nouveau]
[    3.919992]  pci_device_probe+0xc4/0x140
[    3.919998]  driver_probe_device+0x298/0x450
[    3.920003]  __driver_attach+0xd6/0xe0
[    3.920007]  ? driver_probe_device+0x450/0x450
[    3.920011]  bus_for_each_dev+0x58/0x90
[    3.920015]  bus_add_driver+0x41/0x270
[    3.920020]  driver_register+0x5b/0xd0
[    3.920024]  ? 0xffffffffa0495000
[    3.920028]  do_one_initcall+0x3d/0x170
[    3.920033]  ? kmem_cache_alloc_trace+0x31/0x140
[    3.920039]  do_init_module+0x5a/0x1fc
[    3.920048]  load_module+0x215e/0x2980
[    3.920052]  ? m_show+0x190/0x190
[    3.920057]  ? kernel_read+0x3b/0x50
[    3.920062]  SYSC_finit_module+0x80/0xb0
[    3.920068]  entry_SYSCALL_64_fastpath+0x1a/0xa5
[    3.920072] RIP: 0033:0x7fe202436659
[    3.920076] RSP: 002b:00007fff0a3bed58 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[    3.920083] RAX: ffffffffffffffda RBX: 000000a6f4922750 RCX: 00007fe202436659
[    3.920087] RDX: 0000000000000000 RSI: 00007fe202921561 RDI: 0000000000000017
[    3.920091] RBP: 00007fe202921561 R08: 0000000000000000 R09: 000000a6f4922e40
[    3.920095] R10: 0000000000000017 R11: 0000000000000246 R12: 000000a6f4920280
[    3.920099] R13: 0000000000000000 R14: 0000000000020000 R15: 0000000000000000
[    3.920106] Code: 00 00 00 00 00 66 66 66 66 90 40 84 f6 74 24 40 80 fe 01 75 16 83 ff 02 74 05 83 ff 06 75 0c c7 02 02 00 00 00 b8 01 00 00 00 c3 <0f> ff b8 04 00 00 00 c3 83 ff 02 74 28 7e 19 83 ff 03 74 2d 83 
[    3.920140] ---[ end trace 6b7e5ebfa79000db ]---
[    3.924806] nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
[    3.924812] nouveau 0000:01:00.0: DRM: TV-1 has no encoders, removing
[    3.941591] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.941599] [drm] Driver supports precise vblank timestamp query.
...
[    4.202451] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
[    4.244341] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x50000, bo ffff88022fc6f000
[    4.245156] fbcon: nouveaufb (fb0) is primary device
...
[    4.342819] Console: switching to colour frame buffer device 160x64
[    4.410317] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    4.425591] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
...
[  321.422970] PM: Preparing system for sleep (mem)
[  321.423164] Freezing user space processes ... (elapsed 0.001 seconds) done.
[  321.424841] OOM killer disabled.
[  321.424843] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  321.425916] PM: Suspending system (mem)
[  321.425947] Suspending console(s) (use no_console_suspend to debug)
[  321.426334] sd 4:0:0:0: [sdf] Synchronizing SCSI cache
[  321.426398] sd 2:0:0:0: [sde] Synchronizing SCSI cache
[  321.426448] sd 4:0:0:0: [sdf] Stopping disk
[  321.426671] sd 0:0:0:0: [sda] Synchronizing SCSI cache
[  321.426765] sd 0:0:0:0: [sda] Stopping disk
[  321.450030] serial 00:03: disabled
[  321.450165] serial 00:02: disabled
[  321.450262] nouveau 0000:01:00.0: DRM: suspending console...
[  321.450265] nouveau 0000:01:00.0: DRM: suspending display...
[  321.450462] e1000e: EEE TX LPI TIMER: 00000000
[  321.450501] br0: port 1(eth0) entered disabled state
[  321.473838] ------------[ cut here ]------------
[  321.473863] WARNING: CPU: 1 PID: 4786 at drivers/gpu/drm/drm_vblank.c:608 drm_calc_vbltimestamp_from_scanoutpos+0x14f/0x330 [drm]
[  321.473864] Modules linked in: ebtable_filter(E) ebtables(E) fuse(E) rpcsec_gss_krb5(E) nfsv4(E) dns_resolver(E) nfs(E) fscache(E) af_packet(E) bridge(E) stp(E) llc(E) iscsi_ibft(E) iscsi_boot_sysfs(E) ip6t_REJECT(E) xt_tcpudp(E) nf_conntrack_ipv6(E) nf_defrag_ipv6(E) ip6table_raw(E) ipt_REJECT(E) iptable_raw(E) iptable_filter(E) ip6table_mangle(E) nf_conntrack_netbios_ns(E) nf_conntrack_broadcast(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) ip_tables(E) xt_conntrack(E) nf_conntrack(E) ip6table_filter(E) ip6_tables(E) x_tables(E) saa7134_alsa(E) tda1004x(E) saa7134_dvb(E) videobuf2_dvb(E) dvb_core(E) arc4(E) rt2800usb(E) rt2x00usb(E) rt2800lib(E) crc_ccitt(E) rt2x00lib(E) mac80211(E) cfg80211(E) rc_medion_x10_or2x(E) rfkill(E) ati_remote(E) tda827x(E) tda8290(E) tuner(E) snd_hda_codec_real
 tek(E) saa7134(E)
[  321.473905]  snd_hda_codec_generic(E) snd_hda_intel(E) snd_hda_codec(E) snd_hwdep(E) tveeprom(E) coretemp(E) videobuf2_dma_sg(E) videobuf2_memops(E) snd_hda_core(E) videobuf2_v4l2(E) kvm_intel(E) snd_pcm(E) kvm(E) videobuf2_core(E) snd_timer(E) rc_core(E) v4l2_common(E) snd(E) videodev(E) iTCO_wdt(E) media(E) e1000e(E) iTCO_vendor_support(E) ptp(E) pps_core(E) shpchp(E) soundcore(E) i2c_i801(E) lpc_ich(E) mfd_core(E) irqbypass(E) pcspkr(E) thermal(E) acpi_cpufreq(E) fan(E) nfsd(E) auth_rpcgss(E) nfs_acl(E) lockd(E) grace(E) sunrpc(E) ext4(E) crc16(E) mbcache(E) jbd2(E) fscrypto(E) sr_mod(E) cdrom(E) sd_mod(E) uas(E) usb_storage(E) hid_generic(E) usbhid(E) nouveau(E) wmi(E) video(E) i2c_algo_bit(E) ahci(E) drm_kms_helper(E) syscopyarea(E) sysfillrect(E) libahci(E) sysimgblt(E) fb_sys_fop
 s(E) firewire_ohci(E)
[  321.473950]  libata(E) firewire_core(E) crc_itu_t(E) ehci_pci(E) serio_raw(E) ttm(E) button(E) drm(E) uhci_hcd(E) ehci_hcd(E) usbcore(E) sg(E) dm_multipath(E) dm_mod(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) scsi_mod(E) autofs4(E)
[  321.473966] CPU: 1 PID: 4786 Comm: kworker/u8:17 Tainted: G        W   E   4.12.0.gccd5d1b-master #186
[  321.473968] Hardware name: MEDIONPC MS-7502/MS-7502, BIOS 6.00 PG 12/26/2007
[  321.473972] Workqueue: events_unbound async_run_entry_fn
[  321.473974] task: ffff8801daf93d40 task.stack: ffffc90003edc000
[  321.473990] RIP: 0010:drm_calc_vbltimestamp_from_scanoutpos+0x14f/0x330 [drm]
[  321.473992] RSP: 0018:ffffc90003edfb00 EFLAGS: 00010082
[  321.473994] RAX: ffffffffa03e6100 RBX: ffff880211140000 RCX: 0000000000000001
[  321.473995] RDX: ffffffffa01dd8c8 RSI: 0000000000000001 RDI: ffffffffa01c8023
[  321.473996] RBP: ffffc90003edfb80 R08: 0000000000000000 R09: ffffffffa01b0920
[  321.473998] R10: ffffffffa0376e60 R11: ffff8802131399f8 R12: 0000000000000001
[  321.473999] R13: ffff880213139800 R14: ffffc90003edfb94 R15: ffffc90003edfbd0
[  321.474001] FS:  0000000000000000(0000) GS:ffff88022fc80000(0000) knlGS:0000000000000000
[  321.474003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  321.474004] CR2: 00007fdd82e8f810 CR3: 0000000214683000 CR4: 00000000000006e0
[  321.474005] Call Trace:
[  321.474068]  ? nv50_head_vblank_put+0x22/0x50 [nouveau]
[  321.474085]  drm_get_last_vbltimestamp+0x41/0x70 [drm]
[  321.474102]  drm_update_vblank_count+0x61/0x230 [drm]
[  321.474118]  drm_vblank_disable_and_save+0x59/0xc0 [drm]
[  321.474134]  drm_crtc_vblank_off+0x1d5/0x210 [drm]
[  321.474152]  ? drm_modeset_drop_locks+0x4e/0x60 [drm]
[  321.474203]  nouveau_display_fini+0x56/0xd0 [nouveau]
[  321.474254]  nouveau_display_suspend+0x4f/0x110 [nouveau]
[  321.474304]  nouveau_do_suspend+0x7c/0x1e0 [nouveau]
[  321.474355]  nouveau_pmops_suspend+0x2d/0x70 [nouveau]
[  321.474358]  pci_pm_suspend+0x70/0x130
[  321.474360]  ? pci_pm_resume+0x90/0x90
[  321.474364]  dpm_run_callback+0x4d/0x150
[  321.474366]  __device_suspend+0x121/0x3b0
[  321.474369]  ? pm_dev_dbg+0x70/0x70
[  321.474370]  async_suspend+0x1a/0x90
[  321.474373]  async_run_entry_fn+0x33/0x160
[  321.474376]  process_one_work+0x141/0x340
[  321.474378]  worker_thread+0x47/0x3b0
[  321.474381]  kthread+0xfc/0x130
[  321.474384]  ? rescuer_thread+0x360/0x360
[  321.474386]  ? kthread_park+0x60/0x60
[  321.474389]  ret_from_fork+0x25/0x30
[  321.474391] Code: e1 48 c7 c2 c8 d8 1d a0 be 01 00 00 00 48 c7 c7 23 80 1c a0 e8 83 7f fe ff 48 8b 83 70 03 00 00 48 83 78 20 00 0f 84 de fe ff ff <0f> ff 31 c0 e9 d7 fe ff ff 44 89 d0 be d3 4d 62 10 48 c7 c7 23 
[  321.474425] ---[ end trace 6b7e5ebfa79000dc ]---
[  321.474436] nouveau 0000:01:00.0: DRM: evicting buffers...
[  321.607070] sd 2:0:0:0: [sde] Stopping disk
[  321.669140] nouveau 0000:01:00.0: DRM: waiting for kernel channels to go idle...
[  321.669147] nouveau 0000:01:00.0: DRM: suspending fence...
[  321.669275] nouveau 0000:01:00.0: DRM: suspending object tree...
[  325.124778] PM: suspend of devices complete after 3698.373 msecs
[  325.125130] PM: late suspend of devices complete after 0.349 msecs
[  325.146080] PM: noirq suspend of devices complete after 20.945 msecs
[  325.146589] ACPI: Preparing to enter system sleep state S3
[  325.147040] PM: Saving platform NVS memory
[  325.147331] Disabling non-boot CPUs ...
[  325.158486] smpboot: CPU 1 is now offline
[  325.186875] smpboot: CPU 2 is now offline
[  325.207412] smpboot: CPU 3 is now offline
[  325.209031] ACPI: Low-level resume complete
[  325.209078] PM: Restoring platform NVS memory
[  325.209463] Suspended for 5.000 seconds
[  325.215104] Enabling non-boot CPUs ...
[  325.215144] x86: Booting SMP configuration:
[  325.215145] smpboot: Booting Node 0 Processor 1 APIC 0x1
[  325.221217]  cache: parent cpu1 should not be sleeping
[  325.221306] microcode: sig=0x6fb, pf=0x10, revision=0xbc
[  325.221507] CPU1 is up
[  325.221533] smpboot: Booting Node 0 Processor 2 APIC 0x3
[  325.227693]  cache: parent cpu2 should not be sleeping
[  325.228069] CPU2 is up
[  325.228085] smpboot: Booting Node 0 Processor 3 APIC 0x2
[  325.234420]  cache: parent cpu3 should not be sleeping
[  325.234804] CPU3 is up
[  325.238138] ACPI: Waking up from system sleep state S3
[  325.262589] PM: noirq resume of devices complete after 23.907 msecs
[  325.263102] PM: early resume of devices complete after 0.495 msecs
[  325.263173] usb usb1: root hub lost power or was reset
[  325.263214] usb usb2: root hub lost power or was reset
[  325.263268] usb usb3: root hub lost power or was reset
[  325.263300] usb usb4: root hub lost power or was reset
[  325.263329] usb usb5: root hub lost power or was reset
[  325.263343] usb usb6: root hub lost power or was reset
[  325.263363] nouveau 0000:01:00.0: DRM: resuming object tree...
[  325.263368] saa7134: saa7133[0]: board init: gpio is 0
[  325.263998] serial 00:02: activated
[  325.264517] serial 00:03: activated
[  325.288519] sd 0:0:0:0: [sda] Starting disk
[  325.293481] sd 2:0:0:0: [sde] Starting disk
[  325.293491] sd 4:0:0:0: [sdf] Starting disk
[  325.467742] nouveau 0000:01:00.0: DRM: resuming fence...
[  325.467750] nouveau 0000:01:00.0: DRM: resuming display...
[  325.488166] nouveau 0000:01:00.0: DRM: resuming console...
[  325.668771] ata4: SATA link down (SStatus 0 SControl 300)
[  325.668799] ata6: SATA link down (SStatus 0 SControl 300)
[  325.750427] usb 4-1: reset low-speed USB device number 3 using uhci_hcd
[  325.778447] usb 2-2: reset low-speed USB device number 3 using uhci_hcd
[  325.782416] usb 3-2: reset low-speed USB device number 4 using uhci_hcd
[  325.830432] ata2: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[  325.837017] ata2.00: configured for UDMA/100
[  325.850425] firewire_core 0000:02:02.0: rediscovered device fw0
[  326.026464] usb 4-1: device descriptor read/64, error -71
[  326.815715] e1000e: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: Rx/Tx
[  326.815718] e1000e 0000:00:19.0 eth0: 10/100 speed: disabling TSO
[  326.815750] br0: port 1(eth0) entered blocking state
[  326.815752] br0: port 1(eth0) entered forwarding state
[  330.690748] ata3: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  330.864349] ata3.00: ATA Identify Device Log not supported
[  330.864351] ata3.00: Security Log not supported
[  330.870943] ata3.00: ATA Identify Device Log not supported
[  330.870945] ata3.00: Security Log not supported
[  330.870949] ata3.00: configured for UDMA/133
[  331.290835] ata5: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[  331.453464] ata5.00: ATA Identify Device Log not supported
[  331.453466] ata5.00: Security Log not supported
[  331.520126] ata5.00: ATA Identify Device Log not supported
[  331.520128] ata5.00: Security Log not supported
[  331.520132] ata5.00: configured for UDMA/133
[  331.826874] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[  331.848230] ata1.00: ATA Identify Device Log not supported
[  331.848231] ata1.00: Security Log not supported
[  331.849334] ata1.00: ATA Identify Device Log not supported
[  331.849335] ata1.00: Security Log not supported
[  331.849339] ata1.00: configured for UDMA/133
[  331.853134] PM: resume of devices complete after 6589.643 msecs
[  331.853396] usb 3-2:1.0: rebind failed: -517
[  331.864922] PM: Finishing wakeup.
[  331.864925] OOM killer enabled.
[  331.864927] Restarting tasks ... done.
[  332.293462] Registered IR keymap rc-medion-x10-or2x
[  332.293530] rc rc0: X10 WTI RF receiver as /devices/pci0000:00/0000:00:1a.2/usb3/3-2/3-2:1.0/rc/rc0
[  332.293600] input: X10 WTI RF receiver as /devices/pci0000:00/0000:00:1a.2/usb3/3-2/3-2:1.0/rc/rc0/input25
[  332.294274] input: X10 WTI RF receiver mouse as /devices/pci0000:00/0000:00:1a.2/usb3/3-2/3-2:1.0/input/input26

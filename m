From: Dietmar Kling <dietmar.kling-S0/GAf8tV78@public.gmane.org>
Subject: FYI: Nouveau bug exposed in the latest fedora kernel
Date: Sun, 17 Aug 2014 12:15:28 +0200
Message-ID: <53F080C0.3090501@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

(1/3)
Linux version 3.15.10-200.fc20.x86_64
(mockbuild-IQyTzKUysSHZzcyNN8hdY8NrQ1sYaAMk1rGf20DD4Tc@public.gmane.org) (gcc version 4.8.3 20140624
(Red Hat 4.8.3-1) (GCC) ) #1 SMP Thu Aug 14 15:39:24 UTC 2014

(2/3)
[    1.078495] nouveau  [  DEVICE][0000:00:05.0] BOOT0  : 0x04e000a2
[    1.078501] nouveau  [  DEVICE][0000:00:05.0] Chipset: C51 (NV4E)
[    1.078504] nouveau  [  DEVICE][0000:00:05.0] Family : NV40
[    1.078551] nouveau  [   VBIOS][0000:00:05.0] checking PRAMIN for
image...
[    1.113944] nouveau  [   VBIOS][0000:00:05.0] ... appears to be valid
[    1.113947] nouveau  [   VBIOS][0000:00:05.0] using image from PRAMIN
[    1.114168] nouveau  [   VBIOS][0000:00:05.0] BIT signature found
[    1.114172] nouveau  [   VBIOS][0000:00:05.0] version 05.51.22.33.07
[    1.114532] nouveau 0000:00:05.0: irq 42 for MSI/MSI-X
[    1.114545] nouveau  [     PMC][0000:00:05.0] MSI interrupts enabled
[    1.114571] nouveau  [     PFB][0000:00:05.0] RAM type: stolen system
memory
[    1.114574] nouveau  [     PFB][0000:00:05.0] RAM size: 256 MiB
[    1.114576] nouveau  [     PFB][0000:00:05.0]    ZCOMP: 0 tags
[    1.767029] nouveau  [  PTHERM][0000:00:05.0] FAN control: none /
external
[    1.767045] nouveau  [  PTHERM][0000:00:05.0] internal sensor: no
[    1.787058] nouveau  [     CLK][0000:00:05.0] 20: core 475 MHz shader
475 MHz
[    1.787065] nouveau  [     CLK][0000:00:05.0] --:
[    1.787205] nouveau  [     DRM] VRAM: 253 MiB
[    1.787207] nouveau  [     DRM] GART: 512 MiB
[    1.787212] nouveau  [     DRM] TMDS table version 1.1
[    1.787215] nouveau  [     DRM] DCB version 3.0
[    1.787218] nouveau  [     DRM] DCB outp 00: 02000300 00000023
[    1.787221] nouveau  [     DRM] DCB outp 01: 03011312 00000000
[    1.787224] nouveau  [     DRM] DCB outp 02: 020023f1 0040c080
[    1.787226] nouveau  [     DRM] DCB conn 00: 0000
[    1.787229] nouveau  [     DRM] DCB conn 01: 0131
[    1.787232] nouveau  [     DRM] DCB conn 02: 0210
[    1.787234] nouveau  [     DRM] DCB conn 03: 0211
[    1.787237] nouveau  [     DRM] DCB conn 04: 0213
[    1.787496] nouveau  [     DRM] Saving VGA fonts
[    1.825149] nouveau  [     DRM] 0xD186: Parsing digital output script
table
[    1.877254] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.877262] nouveau  [     DRM] Setting dpms mode 3 on TV encoder
(output 2)
[    1.905119] nouveau  [     DRM] allocated 1024x768 fb: 0x9000, bo
ffff8800b9a5ec00
[    1.905234] fbcon: nouveaufb (fb0) is primary device
[    1.930513] nouveau 0000:00:05.0: fb0: nouveaufb frame buffer device
[    1.930517] nouveau 0000:00:05.0: registered panic notifier
[    1.930527] [drm] Initialized nouveau 1.1.1 20120801 for 0000:00:05.0
on minor 0


(3/3)  Bug triggered

[  402.177778] CPU: 0 PID: 1725 Comm: gnome-shell Not tainted
3.15.10-200.fc20.x86_64 #1
[  402.177780] Hardware name: System manufacturer System Product
Name/M2NPV-VM, BIOS ASUS M2NPV-VM ACPI BIOS Revision 1301 02/05/2008
[  402.177783] task: ffff88009a6089e0 ti: ffff88009a4ac000 task.ti:
ffff88009a4ac000
[  402.177785] RIP: 0010:[<ffffffff81362a52>]  [<ffffffff81362a52>]
ioread32+0x42/0x50
[  402.177794] RSP: 0018:ffff88009a4af930  EFLAGS: 00000296
[  402.177796] RAX: 0000000000000000 RBX: ffff880000000141 RCX:
0000000000080000
[  402.177798] RDX: ffffffffa01d0880 RSI: ffffc90012101868 RDI:
ffffc90012101868
[  402.177799] RBP: ffff88009a4af938 R08: 0000000000000001 R09:
ffff880085d5e830
[  402.177801] R10: 0000000000000000 R11: 0000000000001860 R12:
0000000000000001
[  402.177803] R13: ffff88009a6089e0 R14: ffff88009a6089e0 R15:
ffff88009a4af970
[  402.177805] FS:  00007f783adfcac0(0000) GS:ffff88012fc00000(0000)
knlGS:0000000000000000
[  402.177807] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  402.177809] CR2: 00007f782802b000 CR3: 0000000123a82000 CR4:
00000000000007f0
[  402.177811] Stack:
[  402.177812]  ffffffffa01276c8 ffff88009a4af948 ffffffffa01273b4
ffff88009a4af958
[  402.177815]  ffffffffa00ebf89 ffff88009a4af9c0 ffffffffa0130551
0000000000001860
[  402.177818]  4000000600000001 00000000370a4000 ffff880000001860
0000000000001868
[  402.177821] Call Trace:
[  402.177879]  [<ffffffffa01276c8>] ? nv40_instmem_rd32+0x18/0x20 [nouveau]
[  402.177908]  [<ffffffffa01273b4>] nv04_instobj_rd32+0x24/0x30 [nouveau]
[  402.177930]  [<ffffffffa00ebf89>] _nouveau_gpuobj_rd32+0x29/0x30
[nouveau]
[  402.177960]  [<ffffffffa0130551>] nv44_vm_fill+0x91/0x230 [nouveau]
[  402.177990]  [<ffffffffa013089e>] nv44_vm_map_sg+0x1ae/0x1d0 [nouveau]
[  402.178020]  [<ffffffffa012f507>] nouveau_vm_map+0x287/0x3d0 [nouveau]
[  402.178026]  [<ffffffff811ca7f7>] ? __kmalloc+0x1f7/0x240
[  402.178039]  [<ffffffffa005f3a2>] ? ttm_dma_tt_init+0xe2/0x110 [ttm]
[  402.178077]  [<ffffffffa0173c0e>] nv04_sgdma_bind+0x4e/0x80 [nouveau]
[  402.178087]  [<ffffffffa005ecaf>] ttm_tt_bind+0x4f/0x70 [ttm]
[  402.178096]  [<ffffffffa006100f>] ttm_bo_handle_move_mem+0x54f/0x5b0
[ttm]
[  402.178104]  [<ffffffffa00616b9>] ? ttm_bo_mem_space+0x169/0x340 [ttm]
[  402.178113]  [<ffffffffa0061d47>] ttm_bo_validate+0x237/0x250 [ttm]
[  402.178123]  [<ffffffffa0061fc5>] ttm_bo_init+0x265/0x420 [ttm]
[  402.178157]  [<ffffffffa017538d>] nouveau_bo_new+0x1fd/0x310 [nouveau]
[  402.178193]  [<ffffffffa0173dd0>] ? nv10_bo_put_tile_region+0x50/0x50
[nouveau]
[  402.178229]  [<ffffffffa0177a79>] nouveau_gem_new+0x69/0x140 [nouveau]
[  402.178234]  [<ffffffff811a3d8e>] ? vma_gap_callbacks_rotate+0x1e/0x30
[  402.178269]  [<ffffffffa0177c00>] nouveau_gem_ioctl_new+0xb0/0x1f0
[nouveau]
[  402.178293]  [<ffffffffa0019a3c>] drm_ioctl+0x1ec/0x660 [drm]
[  402.178300]  [<ffffffff816fa5ec>] ? __do_page_fault+0x20c/0x530
[  402.178335]  [<ffffffffa016f376>] nouveau_drm_ioctl+0x66/0xa0 [nouveau]
[  402.178338]  [<ffffffff811f9ac0>] do_vfs_ioctl+0x2e0/0x4a0
[  402.178341]  [<ffffffff811f9d01>] SyS_ioctl+0x81/0xa0
[  402.178346]  [<ffffffff816ffae9>] system_call_fastpath+0x16/0x1b
[  402.178347] Code: 66 0f 1f 84 00 00 00 00 00 55 48 c7 c6 2a 0b a5 81
48 89 e5 e8 f0 fe ff ff b8 ff ff ff ff 5d c3 66 0f 1f 84 00 00 00 00 00
8b 07 <c3> 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff 03 00
[  406.548852] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  410.926503] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  415.281709] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  419.627002] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  424.066039] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  428.364209] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  432.692656] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  437.540625] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  441.917573] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  446.288240] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  450.702236] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  455.018648] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  459.403458] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  463.711676] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  468.591388] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  472.895114] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  477.275392] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  481.576888] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  486.640296] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  490.994410] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  495.374076] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  499.759778] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  504.107972] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  508.491519] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  513.074478] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  517.373748] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  521.706696] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  526.007362] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  530.374369] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  534.674147] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  539.372024] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  543.740552] BUG: soft lockup - CPU#1 stuck for 21s! [imapd:2728]
[  543.740558] Modules linked in: nf_conntrack_netbios_ns
nf_conntrack_broadcast bnep bluetooth cfg80211 rfkill ip6t_rpfilter
ip6t_REJECT xt_conntrack ebtable_nat ebtable_broute bridge stp llc
ebtable_filter ebtables ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6
nf_nat_ipv6 ip6table_mangle ip6table_security ip6table_raw
ip6table_filter ip6_tables iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4
nf_nat_ipv4 nf_nat nf_conntrack iptable_mangle iptable_security
iptable_raw cx22702 isl6421 ir_lirc_codec lirc_dev cx24116 cx88_dvb
cx88_vp3054_i2c videobuf_dvb dvb_core ir_mce_kbd_decoder ir_sony_decoder
ir_sanyo_decoder ir_rc6_decoder wm8775 ir_sharp_decoder ir_nec_decoder
ir_rc5_decoder ir_jvc_decoder rc_hauppauge tuner_simple tuner_types
tda9887 nfsd tda8290 snd_hda_codec_analog snd_hda_codec_generic tuner
auth_rpcgss
[  543.740599]  nfs_acl powernow_k8 cx88_alsa lockd snd_hda_intel
snd_hda_controller snd_hda_codec cx8802 cx8800 cx88xx btcx_risc tveeprom
videobuf_dma_sg videobuf_core rc_core snd_hwdep kvm_amd v4l2_common
videodev kvm snd_seq sunrpc snd_pcm media forcedeth snd_timer ppdev
nv_tco k8temp edac_core edac_mce_amd ns558 gameport snd_mpu401_uart
snd_rawmidi snd_seq_device snd serio_raw parport_pc tulip i2c_nforce2
soundcore asus_atk0110 parport shpchp ata_generic pata_acpi nouveau
video firewire_ohci mxm_wmi wmi firewire_core crc_itu_t i2c_algo_bit
drm_kms_helper sata_nv ttm pata_amd drm i2c_core
[  543.740639] CPU: 1 PID: 2728 Comm: imapd Not tainted
3.15.10-200.fc20.x86_64 #1
[  543.740642] Hardware name: System manufacturer System Product
Name/M2NPV-VM, BIOS ASUS M2NPV-VM ACPI BIOS Revision 1301 02/05/2008
[  543.740645] task: ffff88009131a780 ti: ffff88009f74c000 task.ti:
ffff88009f74c000
[  543.740647] RIP: 0010:[<ffffffff8108e740>]  [<ffffffff8108e740>]
__do_softirq+0x90/0x2a0
[  543.740655] RSP: 0000:ffff88012fd03f28  EFLAGS: 00000206
[  543.740657] RAX: ffff88009f74ffd8 RBX: ffff88012fd03eb8 RCX:
0000000000000020
[  543.740659] RDX: 000000010003a759 RSI: 00000000000013c0 RDI:
ffff88009131a780
[  543.740660] RBP: ffff88012fd03f80 R08: ffffffff8180efa0 R09:
0000000000000000
[  543.740662] R10: 0000000000000000 R11: 0000000000000005 R12:
ffff88012fd03e98
[  543.740664] R13: ffffffff8170075d R14: ffff88012fd03f80 R15:
0000000000000000
[  543.740666] FS:  00007f34b2fc8840(0000) GS:ffff88012fd00000(0000)
knlGS:0000000000000000
[  543.740668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  543.740670] CR2: 00007f34b4be5008 CR3: 000000009f62c000 CR4:
00000000000007e0
[  543.740672] Stack:
[  543.740673]  004060002fd0e598 ffff88009f74ffd8 000000010003a75b
138b2dbd3e4f108e
[  543.740676]  000000010000000a ffff880100000202 0000000000000000
00007fff90ec2ae0
[  543.740679]  0000000000000000 00007fff90ec2ad4 00007fff90ec2af0
ffff88012fd03f90
[  543.740682] Call Trace:
[  543.740684]  <IRQ>

[  543.740689]  [<ffffffff8108ebbd>] irq_exit+0xbd/0xd0
[  543.740693]  [<ffffffff81701df5>] smp_apic_timer_interrupt+0x45/0x60
[  543.740698]  [<ffffffff8170075d>] apic_timer_interrupt+0x6d/0x80
[  543.740699]  <EOI>
[  543.740701] Code:
[  543.740703] b0 00 00 c7 45 c8 0a 00 00 00 89 45 cc 65 48 8b 04 25 c8
c7 00 00 48 89 45 b0 90 65 c7 04 25 c0 1a 01 00 00 00 00 00 fb 66 66 90
<66> 66 90 b8 ff ff ff ff 49 c7 c4 80 a0 c0 81 0f bc 45 d0 83 c0
[  543.740787] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  548.071377] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  548.071459] nouveau E[PCIEGART][0000:00:05.0] timeout: 0x00000020
[  552.440269] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  556.855136] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  561.222208] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  565.721999] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  570.305257] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  574.636596] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  578.939265] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  579.085311] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  587.755109] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  592.170818] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  596.620922] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  596.867394] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  601.265974] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  609.887244] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  609.949202] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  618.638361] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3
[  622.968685] nouveau W[   PFIFO][0000:00:05.0] unknown intr
0x00200000, ch 3

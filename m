From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91413] New: INFO: task Xorg:2419 blocked for more
 than 120 seconds.
Date: Tue, 21 Jul 2015 14:52:15 +0000
Message-ID: <bug-91413-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051194571=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1051194571==
Content-Type: multipart/alternative; boundary="1437490336.FCE01.14000"; charset="UTF-8"


--1437490336.FCE01.14000
Date: Tue, 21 Jul 2015 14:52:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91413

            Bug ID: 91413
           Summary: INFO: task Xorg:2419 blocked for more than 120
                    seconds.
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

I was compiling a the kernel with "make mrproper && cp -vi
/boot/config-3.19.0-22-generic .config && ionice -c 3 nice -n 20 make -j 8
deb-pkg LOCALVERSION=-custom" while watching a Flash video on youtube and doing
other things and this crash happened.

This is the same machine as used in
https://bugs.freedesktop.org/show_bug.cgi?id=91373 if that's relevant.

Here is what was in kern.log post-reboot:

Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090321] ------------[ cut here
]------------
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090328] WARNING: CPU: 5 PID: 0 at
kernel/watchdog.c:304 watchdog_overflow_callback+0x9a/0xc0()
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090329] Watchdog detected hard LOCKUP
on cpu 5
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090330] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090377] CPU: 5 PID: 0 Comm: swapper/5
Tainted: G            E   4.1.0-custom #1
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090378] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090379]  ffffffff81aa9359
ffff88021ed45ac0 ffffffff817c830e 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090381]  ffff88021ed45b10
ffff88021ed45b00 ffffffff81079a5a 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090382]  ffff880214de8000
0000000000000000 ffff88021ed45c40 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090384] Call Trace:
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090385]  <NMI>  [<ffffffff817c830e>]
dump_stack+0x45/0x57
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090392]  [<ffffffff81079a5a>]
warn_slowpath_common+0x8a/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090393]  [<ffffffff81079ad6>]
warn_slowpath_fmt+0x46/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090395]  [<ffffffff81130f2a>]
watchdog_overflow_callback+0x9a/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090397]  [<ffffffff811772fc>]
__perf_event_overflow+0x8c/0x230
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090400]  [<ffffffff8102ca09>] ?
x86_perf_event_set_period+0xd9/0x160
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090401]  [<ffffffff81177e64>]
perf_event_overflow+0x14/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090403]  [<ffffffff81034d2a>]
intel_pmu_handle_irq+0x1da/0x450
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090406]  [<ffffffff8102b60b>]
perf_event_nmi_handler+0x2b/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090408]  [<ffffffff810191d8>]
nmi_handle+0x88/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090410]  [<ffffffff8101974a>]
default_do_nmi+0x4a/0x140
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090411]  [<ffffffff810198c8>]
do_nmi+0x88/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090413]  [<ffffffff817d22af>]
end_repeat_nmi+0x1e/0x2e
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090415]  [<ffffffff817cfa08>] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090417]  [<ffffffff817cfa08>] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090418]  [<ffffffff817cfa08>] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090419]  <<EOE>>  <IRQ> 
[<ffffffffc085da8f>] nvkm_fantog_update+0x4f/0x120 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090452]  [<ffffffffc085dbb5>]
nvkm_fantog_set+0x35/0x40 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090464]  [<ffffffffc085d09f>]
nvkm_fan_update+0xef/0x1d0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090475]  [<ffffffffc085d1d9>]
nvkm_therm_fan_set+0x19/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090486]  [<ffffffffc085c8ed>]
nvkm_therm_update+0xad/0x300 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090496]  [<ffffffffc085cb5a>]
nvkm_therm_alarm+0x1a/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090507]  [<ffffffffc0860266>]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090517]  [<ffffffffc086032b>]
nv04_timer_alarm+0x7b/0xe0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090527]  [<ffffffffc085e25a>]
alarm_timer_callback+0xca/0xd0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090537]  [<ffffffffc0860266>]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090547]  [<ffffffffc086032b>]
nv04_timer_alarm+0x7b/0xe0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090556]  [<ffffffffc085db5e>]
nvkm_fantog_update+0x11e/0x120 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090565]  [<ffffffffc085db7a>]
nvkm_fantog_alarm+0x1a/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090575]  [<ffffffffc0860266>]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090584]  [<ffffffffc08603fb>]
nv04_timer_intr+0x6b/0x90 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090594]  [<ffffffffc0856df5>]
nvkm_mc_intr+0x105/0x160 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090597]  [<ffffffff810d3bee>]
handle_irq_event_percpu+0x3e/0x1a0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090599]  [<ffffffff810d3d91>]
handle_irq_event+0x41/0x70
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090600]  [<ffffffff810d6e8f>]
handle_edge_irq+0x7f/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090602]  [<ffffffff81017602>]
handle_irq+0x22/0x40
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090604]  [<ffffffff817d2c91>]
do_IRQ+0x51/0xf0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090605]  [<ffffffff817d0b2e>]
common_interrupt+0x6e/0x6e
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090606]  <EOI>  [<ffffffff81664249>] ?
cpuidle_enter_state+0xa9/0x1f0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090609]  [<ffffffff81664218>] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090610]  [<ffffffff816643c7>]
cpuidle_enter+0x17/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090612]  [<ffffffff810bcbec>]
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090615]  [<ffffffff8104d5c2>]
start_secondary+0x182/0x1b0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090616] ---[ end trace b80f0859f585fb0d
]---
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316162] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316165] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316200] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   E   4.1.0-custom #1
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316201] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316202] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316203] RIP: 0010:[<ffffffff810fa588>] 
[<ffffffff810fa588>] smp_call_function_single+0xc8/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316207] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316208] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316208] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316209] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316209] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316210] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316211] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316212] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316212] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316213] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316214] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316214] Stack:
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316215]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316216]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316217]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316218] Call Trace:
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316221]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316222]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316223]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316224]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316226]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316227]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316228]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316231]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316231] Code: 30 5b 41 5c 5d c3 0f 1f
44 00 00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01
74 d9 0f 1f 80 00 00 00 00 <f3> 90 8b 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b
05 7a e7 de 
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306038] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306040] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306075] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306076] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306077] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306078] RIP: 0010:[<ffffffff810fa58d>] 
[<ffffffff810fa58d>] smp_call_function_single+0xcd/0x120
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306082] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306082] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306083] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306083] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306084] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306084] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306085] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306086] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306087] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306088] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306088] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306089] Stack:
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306089]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306091]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306092]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306093] Call Trace:
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306095]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306097]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306098]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306099]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306101]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306102]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306103]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306105]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306106] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 <83> e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983984] INFO: rcu_sched detected stalls
on CPUs/tasks: { 5} (detected by 3, t=15002 jiffies, g=102000, c=101999, q=0)
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983987] Task dump for CPU 5:
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983988] swapper/5       R  running task
       0     0      1 0x00000008
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983990]  ffff880215267e48
0000000000000018 ffffffff81664218 00000013a1719018
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983991]  000001f930babff8
ffffffff81ca9c60 0000000000000000 ffff880215267e88
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983992]  ffffffff81d2b080
ffff88021ed5f000 ffffffff81ca9c60 ffff880215264000
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983994] Call Trace:
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983997]  [<ffffffff81664218>] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983998]  [<ffffffff816643c7>] ?
cpuidle_enter+0x17/0x20
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984000]  [<ffffffff810bcbec>] ?
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984003]  [<ffffffff8104d5c2>] ?
start_secondary+0x182/0x1b0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984004] rcu_sched kthread starved for
15001 jiffies!
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294467] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294469] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294517] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294518] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294519] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294519] RIP: 0010:[<ffffffff810fa58a>] 
[<ffffffff810fa58a>] smp_call_function_single+0xca/0x120
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294522] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294523] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294523] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294524] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294524] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294525] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294526] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294527] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294527] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294528] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529] Stack:
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294531]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294532]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294533] Call Trace:
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294534]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294536]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294537]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294538]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294539]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294540]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294541]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294543]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294544] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 <8b> 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284343] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284344] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284389] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284390] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284391] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284392] RIP: 0010:[<ffffffff810fa58a>] 
[<ffffffff810fa58a>] smp_call_function_single+0xca/0x120
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284394] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284395] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284395] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284396] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284396] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284397] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284398] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284399] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284399] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284400] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284400] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284401] Stack:
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284401]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284403]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284404]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284405] Call Trace:
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284406]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284407]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284408]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284409]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284411]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284412]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284413]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284415]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284415] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 <8b> 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962289] INFO: rcu_sched self-detected
stall on CPU { 3}  (t=15000 jiffies g=102001 c=102000 q=0)
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962301] Task dump for CPU 3:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962302] sh              R  running task
       0  4811  32753 0x00000008
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962304]  ffffffff81c52ac0
ffff88021ecc3d78 ffffffff810a611f 0000000000000003
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962305]  ffffffff81c52ac0
ffff88021ecc3d98 ffffffff810a9a1d 0000000000000087
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962306]  0000000000000004
ffff88021ecc3dc8 ffffffff810dbd00 ffff88021ecd8340
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962307] Call Trace:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962308]  <IRQ>  [<ffffffff810a611f>]
sched_show_task+0xaf/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962311]  [<ffffffff810a9a1d>]
dump_cpu_task+0x3d/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962314]  [<ffffffff810dbd00>]
rcu_dump_cpu_stacks+0x90/0xd0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962315]  [<ffffffff810e00a3>]
rcu_check_callbacks+0x4a3/0x780
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962317]  [<ffffffff810aaa50>] ?
account_process_tick+0x60/0x180
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962318]  [<ffffffff810e53d9>]
update_process_times+0x39/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962319]  [<ffffffff810f4f95>]
tick_sched_handle.isra.16+0x25/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962320]  [<ffffffff810f5014>]
tick_sched_timer+0x44/0x80
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962321]  [<ffffffff810e60b7>]
__run_hrtimer+0x77/0x1d0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962322]  [<ffffffff810f4fd0>] ?
tick_sched_handle.isra.16+0x60/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962324]  [<ffffffff810e6483>]
hrtimer_interrupt+0xf3/0x220
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962325]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962325]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962327]  [<ffffffff8104f3f9>]
local_apic_timer_interrupt+0x39/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962330]  [<ffffffff817d2d75>]
smp_apic_timer_interrupt+0x45/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962330]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962332]  [<ffffffff817d0e3e>]
apic_timer_interrupt+0x6e/0x80
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962332]  <EOI>  [<ffffffff810fa58d>] ?
smp_call_function_single+0xcd/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962334]  [<ffffffff810fa579>] ?
smp_call_function_single+0xb9/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962335]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962336]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962337]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962338]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962339]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962340]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962341]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962342]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962343] Task dump for CPU 5:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962343] swapper/5       R  running task
       0     0      1 0x00000008
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962345]  ffff880215267e48
0000000000000018 ffffffff81664218 00000013a1719018
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962346]  000001f930babff8
ffffffff81ca9c60 0000000000000000 ffff880215267e88
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962347]  ffffffff81d2b080
ffff88021ed5f000 ffffffff81ca9c60 ffff880215264000
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962348] Call Trace:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962349]  [<ffffffff81664218>] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962350]  [<ffffffff816643c7>] ?
cpuidle_enter+0x17/0x20
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962352]  [<ffffffff810bcbec>] ?
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962353]  [<ffffffff8104d5c2>] ?
start_secondary+0x182/0x1b0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272772] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 23s! [sh:4811]
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272773] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272818] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272819] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272820] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272820] RIP: 0010:[<ffffffff810fa58a>] 
[<ffffffff810fa58a>] smp_call_function_single+0xca/0x120
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272823] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272823] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272824] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272825] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272825] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272826] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272827] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272827] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272828] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272829] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272829] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272830] Stack:
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272830]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272832]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272833]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272834] Call Trace:
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272835]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272836]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272837]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272838]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272839]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272841]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272842]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272843]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272844] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 <8b> 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262648] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 23s! [sh:4811]
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262649] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262693] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262693] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262694] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262695] RIP: 0010:[<ffffffff810fa58d>] 
[<ffffffff810fa58d>] smp_call_function_single+0xcd/0x120
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262697] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262698] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262698] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262699] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262699] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262700] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262701] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262701] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262702] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262703] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262703] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262704] Stack:
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262704]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262705]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262707]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262708] Call Trace:
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262709]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262710]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262711]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262712]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262713]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262714]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262715]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262717]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262718] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 <83> e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252523] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252525] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252573] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252573] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252574] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252575] RIP: 0010:[<ffffffff810fa58a>] 
[<ffffffff810fa58a>] smp_call_function_single+0xca/0x120
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252578] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252579] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252579] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252580] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252580] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252581] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252582] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252582] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252583] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252584] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252584] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252585] Stack:
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252585]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252586]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252588]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252589] Call Trace:
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252590]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252591]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252592]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252593]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252595]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252596]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252597]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252599]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252600] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 <8b> 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242399] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242400] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242446] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242447] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242447] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242448] RIP: 0010:[<ffffffff810fa58a>] 
[<ffffffff810fa58a>] smp_call_function_single+0xca/0x120
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242450] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242451] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242451] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242452] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242453] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242453] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242454] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242455] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242455] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242456] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242457] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242457] Stack:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242458]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242459]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242460]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242461] Call Trace:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242462]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242463]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242465]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242465]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242467]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242468]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242469]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242471]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242472] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 <8b> 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302430] INFO: task Xorg:2419 blocked
for more than 120 seconds.
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302432]       Tainted: G        W   EL 
4.1.0-custom #1
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302433] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302434] Xorg            D
ffff880213883cd8     0  2419   2418 0x00400004
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302445]  ffff880213883cd8
ffff880215250000 ffff880213815a90 ffff880213883d50
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302446]  ffff880213884000
7fffffffffffffff ffff880213883e28 ffff880213815a90
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302447]  ffff880215c37300
ffff880213883cf8 ffffffff817cc037 ffff880200000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302448] Call Trace:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302453]  [<ffffffff817cc037>]
schedule+0x37/0x90
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302454]  [<ffffffff817cee2c>]
schedule_timeout+0x20c/0x280
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302457]  [<ffffffff811af62b>] ?
do_wp_page+0x1cb/0x4c0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302459]  [<ffffffff817cca64>]
wait_for_completion+0xa4/0x170
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302461]  [<ffffffff810a6a80>] ?
wake_up_state+0x20/0x20
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302464]  [<ffffffff810de000>] ?
__call_rcu+0x350/0x350
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302465]  [<ffffffff810dafbd>]
wait_rcu_gp+0x4d/0x60
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302466]  [<ffffffff810daf50>] ?
ftrace_raw_output_rcu_utilization+0x70/0x70
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302468]  [<ffffffff810ddad5>]
synchronize_sched+0x45/0x60
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302470]  [<ffffffff81619898>]
evdev_release+0x78/0x110
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302472]  [<ffffffff811f9cb4>]
__fput+0xe4/0x220
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302473]  [<ffffffff811f9e3e>]
____fput+0xe/0x10
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302476]  [<ffffffff81097447>]
task_work_run+0xb7/0xf0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302479]  [<ffffffff81014f8d>]
do_notify_resume+0x8d/0xa0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302481]  [<ffffffff817d0184>]
int_signal+0x12/0x17
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232275] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232276] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232322] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232323] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232324] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232324] RIP: 0010:[<ffffffff810fa58d>] 
[<ffffffff810fa58d>] smp_call_function_single+0xcd/0x120
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232327] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232327] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232328] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232328] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232329] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232330] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232331] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232331] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232332] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232332] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232333] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232333] Stack:
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232334]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232335]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232336]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232337] Call Trace:
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232339]  [<ffffffff8106da80>] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232340]  [<ffffffff810fa98d>]
smp_call_function_many+0x23d/0x280
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232341]  [<ffffffff8106dc2e>]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232342]  [<ffffffff8106dd54>]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232343]  [<ffffffff81078642>]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232345]  [<ffffffff81078ed5>]
do_fork+0xd5/0x340
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232346]  [<ffffffff810791c6>]
SyS_clone+0x16/0x20
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232347]  [<ffffffff817cffb2>]
system_call_fastpath+0x16/0x75
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232348] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 <83> e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:16:42 dioo-XPS kernel: [    0.000000] Initializing cgroup subsys
cpuset

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437490336.FCE01.14000
Date: Tue, 21 Jul 2015 14:52:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INFO: task Xorg:2419 blocked for more than 120 seconds."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91413">91413</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>INFO: task Xorg:2419 blocked for more than 120 seconds.
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
          <td>vhann3000+freedesktop&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I was compiling a the kernel with &quot;make mrproper &amp;&amp; cp -vi
/boot/config-3.19.0-22-generic .config &amp;&amp; ionice -c 3 nice -n 20 make -j 8
deb-pkg LOCALVERSION=-custom&quot; while watching a Flash video on youtube and doing
other things and this crash happened.

This is the same machine as used in
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="show_bug.cgi?id=91373">https://bugs.freedesktop.org/show_bug.cgi?id=91373</a> if that's relevant.

Here is what was in kern.log post-reboot:

Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090321] ------------[ cut here
]------------
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090328] WARNING: CPU: 5 PID: 0 at
kernel/watchdog.c:304 watchdog_overflow_callback+0x9a/0xc0()
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090329] Watchdog detected hard LOCKUP
on cpu 5
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090330] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090377] CPU: 5 PID: 0 Comm: swapper/5
Tainted: G            E   4.1.0-custom #1
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090378] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090379]  ffffffff81aa9359
ffff88021ed45ac0 ffffffff817c830e 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090381]  ffff88021ed45b10
ffff88021ed45b00 ffffffff81079a5a 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090382]  ffff880214de8000
0000000000000000 ffff88021ed45c40 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090384] Call Trace:
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090385]  &lt;NMI&gt;  [&lt;ffffffff817c830e&gt;]
dump_stack+0x45/0x57
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090392]  [&lt;ffffffff81079a5a&gt;]
warn_slowpath_common+0x8a/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090393]  [&lt;ffffffff81079ad6&gt;]
warn_slowpath_fmt+0x46/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090395]  [&lt;ffffffff81130f2a&gt;]
watchdog_overflow_callback+0x9a/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090397]  [&lt;ffffffff811772fc&gt;]
__perf_event_overflow+0x8c/0x230
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090400]  [&lt;ffffffff8102ca09&gt;] ?
x86_perf_event_set_period+0xd9/0x160
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090401]  [&lt;ffffffff81177e64&gt;]
perf_event_overflow+0x14/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090403]  [&lt;ffffffff81034d2a&gt;]
intel_pmu_handle_irq+0x1da/0x450
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090406]  [&lt;ffffffff8102b60b&gt;]
perf_event_nmi_handler+0x2b/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090408]  [&lt;ffffffff810191d8&gt;]
nmi_handle+0x88/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090410]  [&lt;ffffffff8101974a&gt;]
default_do_nmi+0x4a/0x140
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090411]  [&lt;ffffffff810198c8&gt;]
do_nmi+0x88/0xc0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090413]  [&lt;ffffffff817d22af&gt;]
end_repeat_nmi+0x1e/0x2e
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090415]  [&lt;ffffffff817cfa08&gt;] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090417]  [&lt;ffffffff817cfa08&gt;] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090418]  [&lt;ffffffff817cfa08&gt;] ?
_raw_spin_lock_irqsave+0x48/0x80
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090419]  &lt;&lt;EOE&gt;&gt;  &lt;IRQ&gt; 
[&lt;ffffffffc085da8f&gt;] nvkm_fantog_update+0x4f/0x120 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090452]  [&lt;ffffffffc085dbb5&gt;]
nvkm_fantog_set+0x35/0x40 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090464]  [&lt;ffffffffc085d09f&gt;]
nvkm_fan_update+0xef/0x1d0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090475]  [&lt;ffffffffc085d1d9&gt;]
nvkm_therm_fan_set+0x19/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090486]  [&lt;ffffffffc085c8ed&gt;]
nvkm_therm_update+0xad/0x300 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090496]  [&lt;ffffffffc085cb5a&gt;]
nvkm_therm_alarm+0x1a/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090507]  [&lt;ffffffffc0860266&gt;]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090517]  [&lt;ffffffffc086032b&gt;]
nv04_timer_alarm+0x7b/0xe0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090527]  [&lt;ffffffffc085e25a&gt;]
alarm_timer_callback+0xca/0xd0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090537]  [&lt;ffffffffc0860266&gt;]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090547]  [&lt;ffffffffc086032b&gt;]
nv04_timer_alarm+0x7b/0xe0 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090556]  [&lt;ffffffffc085db5e&gt;]
nvkm_fantog_update+0x11e/0x120 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090565]  [&lt;ffffffffc085db7a&gt;]
nvkm_fantog_alarm+0x1a/0x20 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090575]  [&lt;ffffffffc0860266&gt;]
nv04_timer_alarm_trigger+0x126/0x170 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090584]  [&lt;ffffffffc08603fb&gt;]
nv04_timer_intr+0x6b/0x90 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090594]  [&lt;ffffffffc0856df5&gt;]
nvkm_mc_intr+0x105/0x160 [nouveau]
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090597]  [&lt;ffffffff810d3bee&gt;]
handle_irq_event_percpu+0x3e/0x1a0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090599]  [&lt;ffffffff810d3d91&gt;]
handle_irq_event+0x41/0x70
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090600]  [&lt;ffffffff810d6e8f&gt;]
handle_edge_irq+0x7f/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090602]  [&lt;ffffffff81017602&gt;]
handle_irq+0x22/0x40
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090604]  [&lt;ffffffff817d2c91&gt;]
do_IRQ+0x51/0xf0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090605]  [&lt;ffffffff817d0b2e&gt;]
common_interrupt+0x6e/0x6e
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090606]  &lt;EOI&gt;  [&lt;ffffffff81664249&gt;] ?
cpuidle_enter_state+0xa9/0x1f0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090609]  [&lt;ffffffff81664218&gt;] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090610]  [&lt;ffffffff816643c7&gt;]
cpuidle_enter+0x17/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090612]  [&lt;ffffffff810bcbec&gt;]
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090615]  [&lt;ffffffff8104d5c2&gt;]
start_secondary+0x182/0x1b0
Jul 21 10:11:42 dioo-XPS kernel: [ 2185.090616] ---[ end trace b80f0859f585fb0d
]---
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316162] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316165] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316200] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   E   4.1.0-custom #1
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316201] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316202] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316203] RIP: 0010:[&lt;ffffffff810fa588&gt;] 
[&lt;ffffffff810fa588&gt;] smp_call_function_single+0xc8/0x120
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316207] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316208] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316208] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316209] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316209] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316210] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316211] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316212] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316212] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316213] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316214] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316214] Stack:
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316215]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316216]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316217]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316218] Call Trace:
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316221]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316222]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316223]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316224]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316226]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316227]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316228]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316231]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:11:42 dioo-XPS kernel: [ 2195.316231] Code: 30 5b 41 5c 5d c3 0f 1f
44 00 00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01
74 d9 0f 1f 80 00 00 00 00 &lt;f3&gt; 90 8b 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b
05 7a e7 de 
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306038] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306040] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306075] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306076] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306077] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306078] RIP: 0010:[&lt;ffffffff810fa58d&gt;] 
[&lt;ffffffff810fa58d&gt;] smp_call_function_single+0xcd/0x120
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306082] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306082] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306083] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306083] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306084] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306084] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306085] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306086] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306087] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306088] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306088] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306089] Stack:
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306089]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306091]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306092]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306093] Call Trace:
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306095]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306097]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306098]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306099]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306101]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306102]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306103]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306105]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:12:10 dioo-XPS kernel: [ 2223.306106] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 &lt;83&gt; e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983984] INFO: rcu_sched detected stalls
on CPUs/tasks: { 5} (detected by 3, t=15002 jiffies, g=102000, c=101999, q=0)
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983987] Task dump for CPU 5:
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983988] swapper/5       R  running task
       0     0      1 0x00000008
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983990]  ffff880215267e48
0000000000000018 ffffffff81664218 00000013a1719018
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983991]  000001f930babff8
ffffffff81ca9c60 0000000000000000 ffff880215267e88
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983992]  ffffffff81d2b080
ffff88021ed5f000 ffffffff81ca9c60 ffff880215264000
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983994] Call Trace:
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983997]  [&lt;ffffffff81664218&gt;] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.983998]  [&lt;ffffffff816643c7&gt;] ?
cpuidle_enter+0x17/0x20
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984000]  [&lt;ffffffff810bcbec&gt;] ?
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984003]  [&lt;ffffffff8104d5c2&gt;] ?
start_secondary+0x182/0x1b0
Jul 21 10:12:16 dioo-XPS kernel: [ 2228.984004] rcu_sched kthread starved for
15001 jiffies!
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294467] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294469] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294517] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294518] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294519] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294519] RIP: 0010:[&lt;ffffffff810fa58a&gt;] 
[&lt;ffffffff810fa58a&gt;] smp_call_function_single+0xca/0x120
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294522] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294523] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294523] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294524] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294524] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294525] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294526] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294527] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294527] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294528] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529] Stack:
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294529]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294531]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294532]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294533] Call Trace:
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294534]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294536]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294537]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294538]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294539]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294540]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294541]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294543]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:12:42 dioo-XPS kernel: [ 2255.294544] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 &lt;8b&gt; 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284343] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284344] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284389] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284390] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284391] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284392] RIP: 0010:[&lt;ffffffff810fa58a&gt;] 
[&lt;ffffffff810fa58a&gt;] smp_call_function_single+0xca/0x120
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284394] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284395] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284395] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284396] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284396] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284397] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284398] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284399] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284399] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284400] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284400] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284401] Stack:
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284401]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284403]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284404]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284405] Call Trace:
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284406]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284407]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284408]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284409]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284411]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284412]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284413]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284415]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:13:10 dioo-XPS kernel: [ 2283.284415] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 &lt;8b&gt; 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962289] INFO: rcu_sched self-detected
stall on CPU { 3}  (t=15000 jiffies g=102001 c=102000 q=0)
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962301] Task dump for CPU 3:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962302] sh              R  running task
       0  4811  32753 0x00000008
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962304]  ffffffff81c52ac0
ffff88021ecc3d78 ffffffff810a611f 0000000000000003
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962305]  ffffffff81c52ac0
ffff88021ecc3d98 ffffffff810a9a1d 0000000000000087
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962306]  0000000000000004
ffff88021ecc3dc8 ffffffff810dbd00 ffff88021ecd8340
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962307] Call Trace:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962308]  &lt;IRQ&gt;  [&lt;ffffffff810a611f&gt;]
sched_show_task+0xaf/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962311]  [&lt;ffffffff810a9a1d&gt;]
dump_cpu_task+0x3d/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962314]  [&lt;ffffffff810dbd00&gt;]
rcu_dump_cpu_stacks+0x90/0xd0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962315]  [&lt;ffffffff810e00a3&gt;]
rcu_check_callbacks+0x4a3/0x780
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962317]  [&lt;ffffffff810aaa50&gt;] ?
account_process_tick+0x60/0x180
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962318]  [&lt;ffffffff810e53d9&gt;]
update_process_times+0x39/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962319]  [&lt;ffffffff810f4f95&gt;]
tick_sched_handle.isra.16+0x25/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962320]  [&lt;ffffffff810f5014&gt;]
tick_sched_timer+0x44/0x80
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962321]  [&lt;ffffffff810e60b7&gt;]
__run_hrtimer+0x77/0x1d0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962322]  [&lt;ffffffff810f4fd0&gt;] ?
tick_sched_handle.isra.16+0x60/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962324]  [&lt;ffffffff810e6483&gt;]
hrtimer_interrupt+0xf3/0x220
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962325]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962325]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962327]  [&lt;ffffffff8104f3f9&gt;]
local_apic_timer_interrupt+0x39/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962330]  [&lt;ffffffff817d2d75&gt;]
smp_apic_timer_interrupt+0x45/0x60
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962330]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962332]  [&lt;ffffffff817d0e3e&gt;]
apic_timer_interrupt+0x6e/0x80
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962332]  &lt;EOI&gt;  [&lt;ffffffff810fa58d&gt;] ?
smp_call_function_single+0xcd/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962334]  [&lt;ffffffff810fa579&gt;] ?
smp_call_function_single+0xb9/0x120
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962335]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962336]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962337]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962338]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962339]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962340]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962341]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962342]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962343] Task dump for CPU 5:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962343] swapper/5       R  running task
       0     0      1 0x00000008
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962345]  ffff880215267e48
0000000000000018 ffffffff81664218 00000013a1719018
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962346]  000001f930babff8
ffffffff81ca9c60 0000000000000000 ffff880215267e88
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962347]  ffffffff81d2b080
ffff88021ed5f000 ffffffff81ca9c60 ffff880215264000
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962348] Call Trace:
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962349]  [&lt;ffffffff81664218&gt;] ?
cpuidle_enter_state+0x78/0x1f0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962350]  [&lt;ffffffff816643c7&gt;] ?
cpuidle_enter+0x17/0x20
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962352]  [&lt;ffffffff810bcbec&gt;] ?
cpu_startup_entry+0x34c/0x3e0
Jul 21 10:13:16 dioo-XPS kernel: [ 2288.962353]  [&lt;ffffffff8104d5c2&gt;] ?
start_secondary+0x182/0x1b0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272772] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 23s! [sh:4811]
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272773] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272818] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272819] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272820] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272820] RIP: 0010:[&lt;ffffffff810fa58a&gt;] 
[&lt;ffffffff810fa58a&gt;] smp_call_function_single+0xca/0x120
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272823] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272823] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272824] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272825] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272825] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272826] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272827] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272827] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272828] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272829] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272829] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272830] Stack:
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272830]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272832]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272833]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272834] Call Trace:
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272835]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272836]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272837]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272838]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272839]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272841]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272842]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272843]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:13:42 dioo-XPS kernel: [ 2315.272844] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 &lt;8b&gt; 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262648] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 23s! [sh:4811]
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262649] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262693] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262693] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262694] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262695] RIP: 0010:[&lt;ffffffff810fa58d&gt;] 
[&lt;ffffffff810fa58d&gt;] smp_call_function_single+0xcd/0x120
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262697] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262698] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262698] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262699] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262699] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262700] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262701] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262701] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262702] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262703] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262703] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262704] Stack:
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262704]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262705]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262707]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262708] Call Trace:
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262709]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262710]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262711]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262712]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262713]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262714]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262715]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262717]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:14:10 dioo-XPS kernel: [ 2343.262718] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 &lt;83&gt; e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252523] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252525] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252573] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252573] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252574] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252575] RIP: 0010:[&lt;ffffffff810fa58a&gt;] 
[&lt;ffffffff810fa58a&gt;] smp_call_function_single+0xca/0x120
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252578] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252579] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252579] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252580] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252580] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252581] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252582] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252582] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252583] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252584] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252584] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252585] Stack:
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252585]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252586]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252588]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252589] Call Trace:
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252590]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252591]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252592]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252593]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252595]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252596]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252597]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252599]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:14:38 dioo-XPS kernel: [ 2371.252600] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 &lt;8b&gt; 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242399] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242400] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242446] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242447] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242447] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242448] RIP: 0010:[&lt;ffffffff810fa58a&gt;] 
[&lt;ffffffff810fa58a&gt;] smp_call_function_single+0xca/0x120
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242450] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242451] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242451] RDX: 0000000000000001 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242452] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242453] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242453] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242454] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242455] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242455] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242456] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242457] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242457] Stack:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242458]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242459]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242460]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242461] Call Trace:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242462]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242463]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242465]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242465]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242467]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242468]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242469]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242471]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.242472] Code: 41 5c 5d c3 0f 1f 44 00
00 48 8d 75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9
0f 1f 80 00 00 00 00 f3 90 &lt;8b&gt; 55 e8 83 e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a
e7 de 00 85 
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302430] INFO: task Xorg:2419 blocked
for more than 120 seconds.
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302432]       Tainted: G        W   EL 
4.1.0-custom #1
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302433] &quot;echo 0 &gt;
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302434] Xorg            D
ffff880213883cd8     0  2419   2418 0x00400004
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302445]  ffff880213883cd8
ffff880215250000 ffff880213815a90 ffff880213883d50
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302446]  ffff880213884000
7fffffffffffffff ffff880213883e28 ffff880213815a90
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302447]  ffff880215c37300
ffff880213883cf8 ffffffff817cc037 ffff880200000000
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302448] Call Trace:
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302453]  [&lt;ffffffff817cc037&gt;]
schedule+0x37/0x90
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302454]  [&lt;ffffffff817cee2c&gt;]
schedule_timeout+0x20c/0x280
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302457]  [&lt;ffffffff811af62b&gt;] ?
do_wp_page+0x1cb/0x4c0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302459]  [&lt;ffffffff817cca64&gt;]
wait_for_completion+0xa4/0x170
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302461]  [&lt;ffffffff810a6a80&gt;] ?
wake_up_state+0x20/0x20
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302464]  [&lt;ffffffff810de000&gt;] ?
__call_rcu+0x350/0x350
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302465]  [&lt;ffffffff810dafbd&gt;]
wait_rcu_gp+0x4d/0x60
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302466]  [&lt;ffffffff810daf50&gt;] ?
ftrace_raw_output_rcu_utilization+0x70/0x70
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302468]  [&lt;ffffffff810ddad5&gt;]
synchronize_sched+0x45/0x60
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302470]  [&lt;ffffffff81619898&gt;]
evdev_release+0x78/0x110
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302472]  [&lt;ffffffff811f9cb4&gt;]
__fput+0xe4/0x220
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302473]  [&lt;ffffffff811f9e3e&gt;]
____fput+0xe/0x10
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302476]  [&lt;ffffffff81097447&gt;]
task_work_run+0xb7/0xf0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302479]  [&lt;ffffffff81014f8d&gt;]
do_notify_resume+0x8d/0xa0
Jul 21 10:15:06 dioo-XPS kernel: [ 2399.302481]  [&lt;ffffffff817d0184&gt;]
int_signal+0x12/0x17
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232275] NMI watchdog: BUG: soft lockup
- CPU#3 stuck for 22s! [sh:4811]
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232276] Modules linked in:
ipt_MASQUERADE(E) nf_nat_masquerade_ipv4(E) iptable_nat(E) nf_nat_ipv4(E)
nf_nat(E) nf_conntrack_ipv4(E) nf_defrag_ipv4(E) xt_conntrack(E)
nf_conntrack(E) ipt_REJECT(E) nf_reject_ipv4(E) xt_CHECKSUM(E)
iptable_mangle(E) xt_tcpudp(E) bridge(E) stp(E) llc(E) ip6table_filter(E)
ip6_tables(E) iptable_filter(E) ip_tables(E) ebtable_nat(E) ebtables(E)
x_tables(E) arc4(E) md4(E) nls_utf8(E) cifs(E) fscache(E) bnep(E) rfcomm(E)
binfmt_misc(E) snd_hda_codec_hdmi(E) dcdbas(E) intel_rapl(E) iosf_mbi(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) dm_multipath(E) coretemp(E)
scsi_dh(E) kvm_intel(E) snd_hda_codec_realtek(E) nouveau(E)
snd_hda_codec_generic(E) btusb(E) kvm(E) btbcm(E) btintel(E) bluetooth(E)
pl2303(E) crct10dif_pclmul(E) crc32_pclmul(E) usbserial(E)
ghash_clmulni_intel(E) snd_hda_intel(E) joydev(E) mxm_wmi(E) aesni_intel(E)
snd_hda_controller(E) wmi(E) aes_x86_64(E) lrw(E) snd_hda_codec(E)
snd_seq_midi(E) gf128mul(E) snd_hda_core(E) glue_helper(E) ablk_helper(E)
ttm(E) snd_hwdep(E) cryptd(E) drm_kms_helper(E) snd_seq_midi_event(E) drm(E)
snd_rawmidi(E) serio_raw(E) i2c_algo_bit(E) snd_seq(E) bcma(E) snd_pcm(E)
snd_seq_device(E) snd_timer(E) lpc_ich(E) snd(E) mei_me(E) soundcore(E) mei(E)
shpchp(E) mac_hid(E) video(E) parport_pc(E) ppdev(E) lp(E) parport(E)
hid_generic(E) psmouse(E) ahci(E) uas(E) r8169(E) libahci(E) mii(E)
usb_storage(E) usbhid(E) hid(E)
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232322] CPU: 3 PID: 4811 Comm: sh
Tainted: G        W   EL  4.1.0-custom #1
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232323] Hardware name: Dell Inc. XPS
8700/0KWVT8, BIOS A09 11/22/2014
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232324] task: ffff8800c785a840 ti:
ffff8800d85fc000 task.ti: ffff8800d85fc000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232324] RIP: 0010:[&lt;ffffffff810fa58d&gt;] 
[&lt;ffffffff810fa58d&gt;] smp_call_function_single+0xcd/0x120
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232327] RSP: 0018:ffff8800d85ffce8 
EFLAGS: 00000202
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232327] RAX: 0000000000000000 RBX:
0000000000000005 RCX: 0000000000000006
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232328] RDX: 0000000000000003 RSI:
0000000000000100 RDI: 0000000000000296
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232328] RBP: ffff8800d85ffd28 R08:
0000000000000003 R09: 0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232329] R10: 0000000000000004 R11:
0000000000000000 R12: 0000000000000003
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232330] R13: 0000010000000003 R14:
000000000000e280 R15: 000000fbd85ffc88
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232331] FS:  00002b3208196b80(0000)
GS:ffff88021ecc0000(0000) knlGS:0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232331] CS:  0010 DS: 0000 ES: 0000
CR0: 0000000080050033
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232332] CR2: 000055934bd6d6c8 CR3:
00000000b6d5a000 CR4: 00000000001407e0
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232332] DR0: 0000000000000000 DR1:
0000000000000000 DR2: 0000000000000000
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232333] DR3: 0000000000000000 DR6:
00000000fffe0ff0 DR7: 0000000000000400
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232333] Stack:
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232334]  00007ffe243a6fff
ffff8802124e6d50 0000000000000000 ffffffff8106da80
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232335]  ffff8800d85ffd90
0000000000000003 0000000000000003 ffff8802126b4a10
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232336]  ffff8800d85ffd78
ffffffff810fa98d 0000000000000003 01007ffe00000001
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232337] Call Trace:
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232339]  [&lt;ffffffff8106da80&gt;] ?
do_flush_tlb_all+0x50/0x50
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232340]  [&lt;ffffffff810fa98d&gt;]
smp_call_function_many+0x23d/0x280
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232341]  [&lt;ffffffff8106dc2e&gt;]
native_flush_tlb_others+0x2e/0x30
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232342]  [&lt;ffffffff8106dd54&gt;]
flush_tlb_mm_range+0x64/0x170
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232343]  [&lt;ffffffff81078642&gt;]
copy_process.part.25+0x13c2/0x1aa0
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232345]  [&lt;ffffffff81078ed5&gt;]
do_fork+0xd5/0x340
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232346]  [&lt;ffffffff810791c6&gt;]
SyS_clone+0x16/0x20
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232347]  [&lt;ffffffff817cffb2&gt;]
system_call_fastpath+0x16/0x75
Jul 21 10:15:34 dioo-XPS kernel: [ 2427.232348] Code: c3 0f 1f 44 00 00 48 8d
75 d0 48 89 d1 89 df 4c 89 e2 e8 67 fe ff ff 8b 55 e8 83 e2 01 74 d9 0f 1f 80
00 00 00 00 f3 90 8b 55 e8 &lt;83&gt; e2 01 75 f6 eb c6 0f 1f 40 00 8b 05 7a e7 de 00
85 c0 75 80 
Jul 21 10:16:42 dioo-XPS kernel: [    0.000000] Initializing cgroup subsys
cpuset</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437490336.FCE01.14000--

--===============1051194571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1051194571==--

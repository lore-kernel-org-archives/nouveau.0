From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47306] segfault in nouveau_fence_update
Date: Wed, 14 Mar 2012 19:15:28 +0000
Message-ID: <bug-47306-8800-k5hK1jvqwn@http.bugs.freedesktop.org/>
References: <bug-47306-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47306-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

https://bugs.freedesktop.org/show_bug.cgi?id=47306

--- Comment #3 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> 2012-03-14 12:15:28 PDT ---
FYI: I'm getting a similar kernel oops under openSUSE 12.1 with kernel 3.1.9,
but not with kernel 3.3.0-rc6:

[ 3563.874043] BUG: unable to handle kernel NULL pointer dereference at
00000001
[ 3563.874073] IP: [<f80f38b9>] nouveau_fence_update+0x9/0xd0 [nouveau]
[ 3563.874112] *pdpt = 000000002e22c001 *pde = 0000000000000000 
[ 3563.874122] Oops: 0000 [#1] PREEMPT SMP 
[ 3563.874133] Modules linked in: nls_utf8 loop ip6t_LOG xt_tcpudp xt_pkttype
ipt_LOG xt_limit af_packet ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6
ip6table_raw xt_NOTRACK ipt_REJECT iptable_raw iptable_filter ip6table_mangle
nf_conntrack_netbios_ns nf_conntrack_broadcast nf_conntrack_ipv4 nf_defrag_ipv4
ip_tables xt_conntrack nf_conntrack ip6table_filter ip6_tables x_tables
cpufreq_conservative cpufreq_userspace cpufreq_powersave powernow_k8 mperf fuse
arc4 tuner_simple tuner_types tda9887 snd_hda_codec_analog tda8290 tuner usblp
rtl8187 mac80211 ir_lirc_codec lirc_dev snd_usb_audio snd_usbmidi_lib
ir_mce_kbd_decoder ir_sony_decoder hdj_mod msp3400 snd_rawmidi snd_seq_device
ir_jvc_decoder gspca_sn9c20x gspca_main ir_rc6_decoder cfg80211 bttv
snd_hda_intel snd_hda_codec ir_rc5_decoder ir_nec_decoder snd_hwdep rfkill
snd_pcm eeprom_93cx6 videobuf_dma_sg videobuf_core btcx_risc rc_core tveeprom
snd_timer snd i2c_nforce2 v4l2_common sg sr_mod cdrom firewire_ohci
firewire_core force
deth videodev soundcore ppdev floppy crc_itu_t pcspkr snd_page_alloc k8temp
parport_pc parport asus_atk0110 autofs4 nouveau ttm drm_kms_helper drm
i2c_algo_bit mxm_wmi wmi video fan button thermal processor thermal_sys
ata_generic pata_amd pata_jmicron sata_nv

[ 3563.874386] Pid: 2357, comm: kwin Not tainted 3.1.9-1.4-desktop #1 System
manufacturer System Product Name/M2N-VM DH
[ 3563.874403] EIP: 0060:[<f80f38b9>] EFLAGS: 00210282 CPU: 0
[ 3563.874419] EIP is at nouveau_fence_update+0x9/0xd0 [nouveau]
[ 3563.874427] EAX: 00000001 EBX: d8b4acc0 ECX: f2e02ac0 EDX: 00000001
[ 3563.874434] ESI: 000f4240 EDI: 00000001 EBP: 00000001 ESP: ee277d64
[ 3563.874441]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
[ 3563.874448] Process kwin (pid: 2357, ti=ee276000 task=f6f74cf0
task.ti=ee276000)
[ 3563.874456] Stack:
[ 3563.874460]  00000000 00000000 d8b4acc0 000f4240 f6f74cf0 00000001 f80f3c9f
00000000
[ 3563.874479]  f80f3cf4 d8b4acc0 00000000 0031d92a f6f74cf0 000f4240 00000000
d8b4acc0
[ 3563.874498]  d9a8abe0 ee38b400 00000002 f80f3e0e 00000000 f051b400 dc8d8e00
ebcdb680
[ 3563.874517] Call Trace:
[ 3563.874552]  [<f80f3c9f>] __nouveau_fence_signalled+0x1f/0x30 [nouveau]
[ 3563.874584]  [<f80f3cf4>] __nouveau_fence_wait+0x44/0xd0 [nouveau]
[ 3563.874616]  [<f80f3e0e>] nouveau_fence_sync+0x8e/0xf0 [nouveau]
[ 3563.874648]  [<f80f4416>] validate_list+0xd6/0x310 [nouveau]
[ 3563.874680]  [<f80f4ba3>] nouveau_gem_pushbuf_validate+0xf3/0x220 [nouveau]
[ 3563.874714]  [<f80f55b5>] nouveau_gem_ioctl_pushbuf+0x195/0x870 [nouveau]
[ 3563.874753]  [<f7fe1d5c>] drm_ioctl+0x2dc/0x380 [drm]
[ 3563.874770]  [<c033a3ee>] do_vfs_ioctl+0x7e/0x2a0
[ 3563.874781]  [<c033a68e>] sys_ioctl+0x7e/0x90
[ 3563.874790]  [<c070a66d>] syscall_call+0x7/0xb
[ 3563.874801]  [<b756c114>] 0xb756c113
[ 3563.874806] Code: 04 89 bb f4 01 00 00 8b 1c 24 8b 7c 24 08 83 c4 0c e9 3c
ec ff ff 8d b6 00 00 00 00 8d bf 00 00 00 00 55 57 89 c7 56 53 83 ec 08 <8b> 18
8d 40 40 89 44 24 04 e8 f9 68 61 c8 8d 47 44 3b 47 44 89 
[ 3563.875011] EIP: [<f80f38b9>] nouveau_fence_update+0x9/0xd0 [nouveau] SS:ESP
0068:ee277d64
[ 3563.875011] CR2: 0000000000000001
[ 3563.885383] ---[ end trace 0be1ac3389c89176 ]--- 

Hardware is GeForce 6150SE nForce 430, Xorg version is 7.6, Mesa version is
7.11.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.

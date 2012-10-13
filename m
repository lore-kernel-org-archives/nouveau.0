From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: hang after switcheroo'd...
Date: Sat, 13 Oct 2012 15:12:54 +0800
Message-ID: <CAMVG2svv51J8Dho+kuzf1Sjg6vG3znKCdJg7MrMju-c_4BxeFg@mail.gmail.com>
References: <CAMVG2stgkpME2Trga3YoSQbFkxjMLXvFdncQae827OXeXEeEfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMVG2stgkpME2Trga3YoSQbFkxjMLXvFdncQae827OXeXEeEfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On my Macbook Retina, when switching to the integrated GPU, we see a
ioread32 issued to the discrete GPU, which hangs as it is in D3 [1]
(drm.debug is set to 14 here).

Full kernel 3.6.2 boot logs with drm.debug=5 are at:
http://quora.org/2012/mbp-i915-panel.txt

What additional information will help debug this?

Thanks,
  Daniel

--- [1]

cat /sys/kernel/debug/vgaswitcheroo/switch
0:DIS:+:Pwr:0000:01:00.0
1:IGD: :Pwr:0000:00:02.0
2:DIS-Audio: :Pwr:0000:01:00.1

echo IGD >/sys/kernel/debug/vgaswitcheroo/switch
echo OFF >/sys/kernel/debug/vgaswitcheroo/switch

hda-intel: Disabling 0000:01:00.1 via VGA-switcheroo
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:11] [FB:43] #connectors=1 (x y) (0 0)
[drm:drm_crtc_helper_set_config], [CONNECTOR:15:eDP-1] to [CRTC:11]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
fbcon: Remapping primary device, fb1, to tty 1-63
VGA switcheroo: switched nouveau off
[drm] nouveau 0000:01:00.0: Disabling display...
[drm] nouveau 0000:01:00.0: Disabling fbcon...
[drm] nouveau 0000:01:00.0: Unpinning framebuffer(s)...
[drm] nouveau 0000:01:00.0: Evicting buffers...
[drm] nouveau 0000:01:00.0: Idling channels...
[drm] nouveau 0000:01:00.0: Suspending GPU objects...
[drm] nouveau 0000:01:00.0: And we're gone!
[drm:i915_driver_open],
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
[drm:i915_driver_open],
[drm:i915_getparam], Unknown parameter 21
[drm:drm_mode_getresources], CRTC[3] CONNECTORS[1] ENCODERS[1]
[drm:drm_mode_getresources], CRTC[3] CONNECTORS[1] ENCODERS[1]
[drm:drm_mode_getconnector], [CONNECTOR:9:?]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1]
[drm:intel_ironlake_crt_detect_hotplug], ironlake hotplug
adpa=0xf40000, result 0
[drm:intel_crt_detect], CRT not detected via hotplug
[drm:drm_do_probe_ddc_edid], drm: skipping non-existent adapter i915 gmbus vga
[drm:intel_crt_detect_ddc], CRT not detected via DDC:0x50 [no valid EDID found]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1] disconnected
[drm:drm_mode_getconnector], [CONNECTOR:9:?]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1]
[drm:intel_ironlake_crt_detect_hotplug], ironlake hotplug
adpa=0xf40000, result 0
[drm:intel_crt_detect], CRT not detected via hotplug
[drm:drm_do_probe_ddc_edid], drm: skipping non-existent adapter i915 gmbus vga
[drm:intel_crt_detect_ddc], CRT not detected via DDC:0x50 [no valid EDID found]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1] disconnected
[drm:drm_mode_getconnector], [CONNECTOR:9:?]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1]
[drm:intel_ironlake_crt_detect_hotplug], ironlake hotplug
adpa=0xf40000, result 0
[drm:intel_crt_detect], CRT not detected via hotplug
[drm:drm_do_probe_ddc_edid], drm: skipping non-existent adapter i915 gmbus vga
[drm:intel_crt_detect_ddc], CRT not detected via DDC:0x50 [no valid EDID found]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1] disconnected
[drm:drm_mode_getconnector], [CONNECTOR:9:?]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1]
[drm:intel_ironlake_crt_detect_hotplug], ironlake hotplug
adpa=0xf40000, result 0
[drm:intel_crt_detect], CRT not detected via hotplug
[drm:drm_do_probe_ddc_edid], drm: skipping non-existent adapter i915 gmbus vga
[drm:intel_crt_detect_ddc], CRT not detected via DDC:0x50 [no valid EDID found]
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:VGA-1] disconnected
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
init: lightdm main process (3166) terminated with status 1
[drm:i915_driver_open],
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:5] [NOFB]
[drm:drm_crtc_helper_set_config],
[drm:drm_crtc_helper_set_config], [CRTC:7] [NOFB]
[drm:intel_ironlake_crt_detect_hotplug], ironlake hotplug
adpa=0xf40000, result 0
[drm:intel_crt_detect], CRT not detected via hotplug
[drm:drm_do_probe_ddc_edid], drm: skipping non-existent adapter i915 gmbus vga
[drm:intel_crt_detect_ddc], CRT not detected via DDC:0x50 [no valid EDID found]
[drm:output_poll_execute], [CONNECTOR:9:VGA-1] status updated from 2 to 2
BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:3194]
Modules linked in: dm_crypt snd_hda_codec_hdmi btusb hid_generic
joydev rfcomm bnep bluetooth parport_pc ppdev arc4 b43 mac80211
cfg80211 ssb snd_hda_codec_cirrus coretemp hid_apple kvm_intel kvm
applesmc input_polldev nfsd nfs_acl auth_rpcgss uvcvideo
videobuf2_core nfs microcode videodev fscache videobuf2_vmalloc lockd
usbhid videobuf2_memops hid binfmt_misc bcm5974 sunrpc snd_hda_intel
snd_seq_midi snd_rawmidi snd_hda_codec snd_seq_midi_event snd_hwdep
snd_seq snd_seq_device snd_pcm lpc_ich bcma nls_iso8859_1 snd_timer
snd apple_gmux soundcore snd_page_alloc apple_bl mac_hid lp parport
btrfs zlib_deflate libcrc32c ghash_clmulni_intel aesni_intel
ablk_helper cryptd aes_x86_64 i915 nouveau ttm drm_kms_helper tg3 drm
i2c_algo_bit mxm_wmi wmi video
CPU 0
Pid: 3194, comm: Xorg Not tainted 3.6.2-030602-generic #201210121823
Apple Inc. MacBookPro10,1/Mac-C3EC7CD22292981F
RIP: 0010:[<ffffffff8133f55a>] [<ffffffff8133f55a>] ioread32+0x3a/0x40
RSP: 0018:ffff8802633cfb48 EFLAGS: 00000296
RAX: 00000000ffffffff RBX: 0000001000000000 RCX: 0000000080000000
RDX: 000000000061d004 RSI: 0000000077359400 RDI: ffffc9000cf09410
RBP: ffff8802633cfb48 R08: 0000000000000000 R09: ffff880260a17d18
R10: 0000000000000000 R11: 0000000000000246 R12: ffff8802610d16d0
R13: ffff8802633cffd8 R14: ffff8802633cfb90 R15: 0000000000000000
FS: 00007f480c6f5880(0000) GS:ffff88026f200000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f480f2aed00 CR3: 000000026171c000 CR4: 00000000001407f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process Xorg (pid: 3194, threadinfo ffff8802633ce000, task ffff8802610d16d0)
Stack:
 ffff8802633cfb78 ffffffffa00f560f ffffffffa00c3f3a ffff880260a7d000
 0000000077359400 000000000061d004 ffff8802633cfbc8 ffffffffa00c3f2a
 ffffffffffffffff 0000000060a00700 00007f480b800000 ffff88026027f400
Call Trace:
 [<ffffffffa00f560f>] nv04_timer_read+0x2f/0x80 [nouveau]
 [<ffffffffa00c3f3a>] ? nouveau_wait_eq+0x5a/0xa0 [nouveau]
 [<ffffffffa00c3f2a>] nouveau_wait_eq+0x4a/0xa0 [nouveau]
 [<ffffffffa015bdde>] nvd0_sor_dpms+0xae/0x180 [nouveau]
 [<ffffffff8137fd29>] ? fb_set_var+0xe9/0x3a0
 [<ffffffffa015bd30>] ? nvd0_sor_dp_link_set+0x230/0x230 [nouveau]
 [<ffffffffa00aca8c>] drm_helper_connector_dpms+0xbc/0x100 [drm_kms_helper]
 [<ffffffffa00ab571>] drm_fb_helper_dpms.isra.11+0xa1/0xf0 [drm_kms_helper]
 [<ffffffffa00ab609>] drm_fb_helper_blank+0x49/0x80 [drm_kms_helper]
 [<ffffffff8137f966>] fb_blank+0x56/0xc0
 [<ffffffff8138130b>] do_fb_ioctl+0x59b/0x5f0
 [<ffffffff81158e38>] ? vma_link+0x88/0xe0
 [<ffffffff81381645>] fb_ioctl+0x45/0x50
 [<ffffffff8119861a>] do_vfs_ioctl+0x8a/0x340
 [<ffffffff81198961>] sys_ioctl+0x91/0xa0
 [<ffffffff816a78a9>] system_call_fastpath+0x16/0x1b
Code: ff 00 00 01 00 76 0a 0f b7 d7 ed 5d c3 0f 1f 40 00 48 c7 c6 69
0a a5 81 e8 24 fe ff ff b8 ff ff ff ff 5d c3 0f 1f 44 00 00 8b 07 <5d>
c3 0f 1f 40 00 55 48 81 ff ff ff 03 00 48 89 e5 77 2b 48 81
-- 
Daniel J Blueman

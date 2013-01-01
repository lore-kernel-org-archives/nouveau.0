From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: nouveau v3.8-rc1: evo_wait crash
Date: Tue, 1 Jan 2013 23:40:11 +0800
Message-ID: <CAMVG2svKM3kWMbQPB4SPbOgsdGrFNLwMFe7bb+7YSY8BdjZ2cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

When formalising a reproducer for another noveau bug, simply switching
between integrated and discrete GPUs a few times reproduces an oops in
3.8-rc1 [1,2].

Let me know if it helps to log it into bugs.freedesktop.org.

Thanks and Happy New Year!
  Daniel

--- [1]

while :; do bash -c "echo IGD
>/sys/kernel/debug/vgaswitcheroo/switch"; bash -c "echo DIS
>/sys/kernel/debug/vgaswitcheroo/switch"; done

--- [2]

...
VGA switcheroo: switched nouveau off
nouveau [   DRM] suspending fbcon...
nouveau [   DRM] suspending display...
nouveau [   DRM] unpinning framebuffer(s)...
nouveau [   DRM] evicting buffers...
nouveau [   DRM] suspending client object trees...
nouveau E[  PDISP][0000:01:00.0][0xc000917e][ffff8802647d8300] fini: 0xc0080088
nouveau E[  PDISP][0000:01:00.0][0xc000917e][ffff8802647d8300] failed
suspend, -16
nouveau E[   DRM] 0xd1500000:0xd15c7e00 suspend failed with -16
nouveau E[   DRM] 0xdddddddd:0xd1500000 suspend failed with -16
nouveau E[   DRM] 0xffffffff:0xdddddddd suspend failed with -16
nouveau E[   DRM] 0xffffffff:0xffffffff suspend failed with -16
nouveau [   DRM] resuming display...
VGA switcheroo: switched nouveau on
nouveau [   DRM] re-enabling device...
nouveau [   DRM] resuming client object trees...
nouveau [   DRM] resuming display...
BUG: unable to handle kernel paging request at ffff880364785ffc
IP: [<ffffffffa01012b6>] evo_wait+0x46/0xa0 [nouveau]
PGD 180d063 PUD 0
Oops: 0002 [#1] SMP
Modules linked in: snd_hda_codec_hdmi joydev hid_apple bcm5974
coretemp kvm_intel kvm rfcomm ghash_clmulni_intel bnep b43 ssb
uvcvideo smsc75xx usbnet snd_hda_codec_cirrus mii videobuf2_core i915
videobuf2_vmalloc videobuf2_memops applesmc input_polldev
snd_hda_intel snd_hda_codec microcode bcma snd_hwdep lpc_ich mfd_core
snd_pcm nouveau apple_gmux snd_timer ttm drm_kms_helper snd hwmon
mxm_wmi snd_page_alloc apple_bl video nls_iso8859_1
CPU 5
Pid: 1627, comm: bash Not tainted 3.8.0-rc1-expert+ #55 Apple Inc.
MacBookPro10,1/Mac-C3EC7CD22292981F
RIP: 0010:[<ffffffffa01012b6>] [<ffffffffa01012b6>] evo_wait+0x46/0xa0 [nouveau]
RSP: 0018:ffff88025eec1d38 EFLAGS: 00010246
RAX: 000000003fffffff RBX: ffff880264700708 RCX: ffff880263c03d20
RDX: ffff880264786000 RSI: 0000000000000000 RDI: ffffc9000c840000
RBP: ffff88025eec1d48 R08: 0000000000008000 R09: 0000000000000000
R10: 0000000000008000 R11: ffffc9000f5ffff8 R12: 000000004000001f
R13: ffff880264986800 R14: ffff880263c1f000 R15: 0000000000000000
FS: 00007f1b7fea5700(0000) GS:ffff88026f340000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff880364785ffc CR3: 000000025fa77000 CR4: 00000000001407e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
Process bash (pid: 1627, threadinfo ffff88025eec0000, task ffff88025f834680)
Stack:
 ffff880264986800 ffff880264986c38 ffff88025eec1d68 ffffffffa0101bab
 ffff88025eec1d88 ffff88025ec5f900 ffff88025eec1d98 ffffffffa00eb003
 ffff880264986c30 ffff880264986c38 ffff880264986800 ffff880263c1f000
Call Trace:
 [<ffffffffa0101bab>] nv50_display_init+0x2b/0x90 [nouveau]
 [<ffffffffa00eb003>] nouveau_display_init+0x43/0x110 [nouveau]
 [<ffffffffa00eba36>] nouveau_display_resume+0xe6/0x180 [nouveau]
 [<ffffffffa00db856>] nouveau_do_resume+0x106/0x120 [nouveau]
 [<ffffffffa00db8f8>] nouveau_pmops_resume+0x68/0x80 [nouveau]
 [<ffffffffa00dd298>] nouveau_switcheroo_set_state+0x98/0xc0 [nouveau]
 [<ffffffff812c0684>] vga_switchon+0x34/0x50
 [<ffffffff812c0b18>] vga_switchto_stage1+0x38/0x40
 [<ffffffff812c0ebb>] vga_switcheroo_debugfs_write+0x22b/0x380
 [<ffffffff8110bcb2>] ? __alloc_fd+0x42/0x110
 [<ffffffff810ef511>] ? filp_close+0x61/0x90
 [<ffffffff810f14f3>] vfs_write+0xa3/0x160
 [<ffffffff810f17fd>] sys_write+0x4d/0xa0
 [<ffffffff81028689>] ? do_page_fault+0x9/0x10
 [<ffffffff814c9a96>] system_call_fastpath+0x1a/0x1f
Code: 30 c1 e8 02 48 8d 14 85 00 00 00 00 41 01 c4 41 81 fc f7 03 00
00 77 0d 48 8b 43 18 48 01 d0 5b 41 5c 5d c3 90 48 8b 53 18 31 f6 <c7>
04 82 00 00 00 20 31 d2 48 8b 3b 48 8b 07 48 8b 40 08 ff 50
RIP [<ffffffffa01012b6>] evo_wait+0x46/0xa0 [nouveau]
 RSP <ffff88025eec1d38>
CR2: ffff880364785ffc
-- 
Daniel J Blueman

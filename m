From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: [PATCH] drm/nouveau: fix null pointer deref on init
Date: Tue, 05 Mar 2013 12:59:19 +0100
Message-ID: <5135DE17.3000507@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: nouveau@lists.freedesktop.org
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

My nv96 claims to have a DCB_OUTPUT_TV, which is currently not implemented for nv50, this triggers the following oops:

[   30.110017] nouveau W[     DRM] failed to create encoder 0/1/0: -19
[   30.110020] nouveau W[     DRM] TV-1 has no encoders, removing
[   30.134089] BUG: unable to handle kernel NULL pointer dereference at           (null)
[   30.134096] IP: [<ffffffffa0366f69>] nv50_crtc_destroy+0x29/0x110 [nouveau]
[   30.134127] PGD 0
[   30.134129] Oops: 0000 [#1] PREEMPT SMP
[   30.134131] Modules linked in: snd_hda_codec_realtek snd_hda_intel snd_hda_codec snd_hwdep snd_pcm snd_page_alloc snd_seq_midi snd_seq_midi_event nouveau(+) snd_rawmidi snd_seq kvm_intel kvm snd_seq_device snd_timer usb_storage video fan thermal drm_kms_helper snd ttm drm acpi_cpufreq mperf soundcore processor agpgart thermal_sys mei parport_pc ppdev parport nfsd
[   30.134151] CPU 0
[   30.134154] Pid: 557, comm: modprobe Not tainted 3.9.0-rc1-patser+ #1116 Acer Aspire M3985/Aspire M3985
[   30.134157] RIP: 0010:[<ffffffffa0366f69>]  [<ffffffffa0366f69>] nv50_crtc_destroy+0x29/0x110 [nouveau]
[   30.134179] RSP: 0018:ffff880261e65928  EFLAGS: 00010286
[   30.134182] RAX: ffff88025c2a9e40 RBX: ffff8802832ac000 RCX: ffff880000000000
[   30.134184] RDX: 000000000000002a RSI: ffff8802832aca60 RDI: ffff8802832ac000
[   30.134186] RBP: ffff880261e65948 R08: 000000029cd39000 R09: 0000000000000001
[   30.134188] R10: 0000000000000002 R11: 0000000000000000 R12: 0000000000000000
[   30.134190] R13: ffff88028314e468 R14: ffffffffa03be590 R15: ffff88025c2a9e40
[   30.134193] FS:  00007fba2ff1b740(0000) GS:ffff88029c600000(0000) knlGS:0000000000000000
[   30.134196] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   30.134198] CR2: 0000000000000000 CR3: 0000000261a1a000 CR4: 00000000001407f0
[   30.134200] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   30.134203] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
[   30.134205] Process modprobe (pid: 557, threadinfo ffff880261e64000, task ffff880261e621c0)
[   30.134208] Stack:
[   30.134209]  ffff88028314e000 ffff88028314e478 ffff880282d08000 ffff88028314e000
[   30.134213]  ffff880261e65978 ffffffffa0121190 ffff880261e65968 ffff88028314e000
[   30.134216]  00000000ffffffed 000000005fc41aa0 ffff880261e659d8 ffffffffa0337bf5
[   30.134220] Call Trace:
[   30.134230]  [<ffffffffa0121190>] drm_mode_config_cleanup+0x1a0/0x1f0 [drm]
[   30.134252]  [<ffffffffa0337bf5>] nouveau_display_create+0x445/0x820 [nouveau]
[   30.134272]  [<ffffffffa032102a>] nouveau_drm_load+0x3aa/0x980 [nouveau]
[   30.134277]  [<ffffffff813f2d89>] ? device_register+0x19/0x20
[   30.134284]  [<ffffffffa011d931>] ? drm_sysfs_device_add+0x81/0xb0 [drm]
[   30.134292]  [<ffffffffa011c129>] drm_get_pci_dev+0x179/0x290 [drm]
[   30.134295]  [<ffffffff8135c856>] ? __pci_set_master+0x26/0x80
[   30.134315]  [<ffffffffa032002a>] nouveau_drm_probe+0x25a/0x290 [nouveau]
[   30.134318]  [<ffffffff81360946>] local_pci_probe+0x46/0x80
[   30.134321]  [<ffffffff81362179>] pci_device_probe+0xf9/0x120
[   30.134324]  [<ffffffff813f5336>] driver_probe_device+0x76/0x220
[   30.134327]  [<ffffffff813f557b>] __driver_attach+0x9b/0xa0
[   30.134330]  [<ffffffff813f54e0>] ? driver_probe_device+0x220/0x220
[   30.134333]  [<ffffffff813f3876>] bus_for_each_dev+0x56/0x90
[   30.134335]  [<ffffffff813f4e89>] driver_attach+0x19/0x20
[   30.134338]  [<ffffffff813f49be>] bus_add_driver+0xee/0x250
[   30.134341]  [<ffffffff813f5a75>] driver_register+0x75/0x150
[   30.134344]  [<ffffffff81361186>] __pci_register_driver+0x46/0x50
[   30.134350]  [<ffffffffa011c35a>] drm_pci_init+0x11a/0x130 [drm]
[   30.134353]  [<ffffffffa01b3000>] ? 0xffffffffa01b2fff
[   30.134356]  [<ffffffffa01b3000>] ? 0xffffffffa01b2fff
[   30.134371]  [<ffffffffa01b304d>] nouveau_drm_init+0x4d/0x1000 [nouveau]
[   30.134375]  [<ffffffff8100021a>] do_one_initcall+0x3a/0x160
[   30.134379]  [<ffffffff8109bf96>] load_module+0x1be6/0x2320
[   30.134382]  [<ffffffff810992e0>] ? show_initstate+0x50/0x50
[   30.134386]  [<ffffffff8109c774>] sys_init_module+0xa4/0xd0
[   30.134389]  [<ffffffff816cae52>] system_call_fastpath+0x16/0x1b
[   30.134391] Code: 1f 00 55 48 8d b7 60 0a 00 00 48 89 e5 41 54 53 48 89 fb 48 83 ec 10 48 8b 07 48 8b 80 20 03 00 00 48 8b 80 68 0b 00 00 4c 8b 20 <49> 8b 3c 24 e8 9e fd ff ff 49 8b 3c 24 48 8d b3 a8 0a 00 00 e8
[   30.134414] RIP  [<ffffffffa0366f69>] nv50_crtc_destroy+0x29/0x110 [nouveau]
[   30.134434]  RSP <ffff880261e65928>
[   30.134436] CR2: 0000000000000000
[   30.134692] ---[ end trace 4678de513b8e8da0 ]---

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>

---
diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index a4d2d3a..b044c4a 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1271,10 +1271,14 @@ nv50_crtc_destroy(struct drm_crtc *crtc)
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv50_disp *disp = nv50_disp(crtc->dev);
 	struct nv50_head *head = nv50_head(crtc);
-	nv50_dmac_destroy(disp->core, &head->ovly.base);
-	nv50_pioc_destroy(disp->core, &head->oimm.base);
-	nv50_dmac_destroy(disp->core, &head->sync.base);
-	nv50_pioc_destroy(disp->core, &head->curs.base);
+
+	if (disp) {
+		nv50_dmac_destroy(disp->core, &head->ovly.base);
+		nv50_pioc_destroy(disp->core, &head->oimm.base);
+		nv50_dmac_destroy(disp->core, &head->sync.base);
+		nv50_pioc_destroy(disp->core, &head->curs.base);
+	}
+
 	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
 	if (nv_crtc->cursor.nvbo)
 		nouveau_bo_unpin(nv_crtc->cursor.nvbo);

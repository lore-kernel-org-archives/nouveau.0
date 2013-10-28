From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70927] [NVE7] kernel panic in nv50_instobj_wr32
 after switcheroo puts card to D3cold
Date: Mon, 28 Oct 2013 14:54:29 +0000
Message-ID: <bug-70927-8800-8o1Nqgcjw0@http.bugs.freedesktop.org/>
References: <bug-70927-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0963997838=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70927-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0963997838==
Content-Type: multipart/alternative; boundary="1382972069.cCA5D1.9901"; charset="us-ascii"


--1382972069.cCA5D1.9901
Date: Mon, 28 Oct 2013 14:54:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70927

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|nv50_instobj_wr32 kernel    |[NVE7] kernel panic in
                   |panic                       |nv50_instobj_wr32 after
                   |                            |switcheroo puts card to
                   |                            |D3cold

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This can't be good. Happens after switcheroo turns the card off and it goes to
D3cold. I suspect the crash is related to this.

------------[ cut here ]------------
WARNING: CPU: 6 PID: 401 at kernel/watchdog.c:245
watchdog_overflow_callback+0x9c/0xd0()
Watchdog detected hard LOCKUP on cpu 6
Modules linked in:
 joydev uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_core videodev
media nls_cp437 vfat fat snd_hda_codec_hdmi snd_hda_codec_ca0132
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm crc32_pclmul
crc32c_intel snd_hda_intel ghash_clmulni_intel aesni_intel aes_x86_64
snd_hda_codec lrw gf128mul glue_helper arc4 dell_wmi snd_hwdep snd_pcm
sparse_keymap snd_page_alloc ath9k ath9k_common ath9k_hw ath mac80211 nouveau
cfg80211 mxm_wmi iTCO_wdt rfkill ttm psmouse iTCO_vendor_support snd_timer
atl1c serio_raw rtsx_pci_ms memstick ablk_helper cryptd snd fan microcode
thermal wmi mperf ac evdev shpchp processor pcspkr soundcore battery lpc_ich
i2c_i801 mei_me mei ext4 crc16 mbcache jbd2 hid_generic usbhid hid sr_mod
sd_mod cdrom rtsx_pci_sdmmc ahci libahci libata sdhci_pci sdhci
 ehci_pci xhci_hcd ehci_hcd scsi_mod mmc_core rtsx_pci usbcore usb_common i915
video button i2c_algo_bit intel_agp intel_gtt drm_kms_helper drm i2c_core
CPU: 6 PID: 401 Comm: Xorg Not tainted 3.11.6-1-ARCH #1
Hardware name: Alienware M14xR2/M14xR2, BIOS A10 06/29/2012
 0000000000000009 ffff88025f386c10 ffffffff814dba02 ffff88025f386c58
 ffff88025f386c48 ffffffff8106193d ffff880253688000 0000000000000000
 ffff88025f386d78 0000000000000000 ffff88025f386ef8 ffff88025f386ca8
Call Trace:
 <NMI>  [<ffffffff814dba02>] dump_stack+0x54/0x8d
 [<ffffffff8106193d>] warn_slowpath_common+0x7d/0xa0
 [<ffffffff810619ac>] warn_slowpath_fmt+0x4c/0x50
 [<ffffffff8101c665>] ? native_sched_clock+0x15/0x80
 [<ffffffff8101c6d9>] ? sched_clock+0x9/0x10
 [<ffffffff810e9950>] ? watchdog_enable_all_cpus.part.2+0x40/0x40
 [<ffffffff810e99ec>] watchdog_overflow_callback+0x9c/0xd0
 [<ffffffff8112962e>] __perf_event_overflow+0x8e/0x2b0
 [<ffffffff811284b7>] ? perf_event_update_userpage+0xe7/0x160
 [<ffffffff8112a1e4>] perf_event_overflow+0x14/0x20
 [<ffffffff8103072d>] intel_pmu_handle_irq+0x1bd/0x3c0
 [<ffffffff814e489b>] perf_event_nmi_handler+0x2b/0x50
 [<ffffffff814e3ea1>] nmi_handle.isra.3+0xa1/0x1d0
 [<ffffffff814e4139>] do_nmi+0x169/0x340
 [<ffffffff814e34f1>] end_repeat_nmi+0x1e/0x2e
 [<ffffffff81298a12>] ? ioread32+0x42/0x50
 [<ffffffff81298a12>] ? ioread32+0x42/0x50
 [<ffffffff81298a12>] ? ioread32+0x42/0x50
 <<EOE>>  [<ffffffffa078d7cb>] ? nv04_timer_read+0x3b/0x70 [nouveau]
 [<ffffffffa078d574>] nouveau_timer_wait_eq+0x74/0xd0 [nouveau]
 [<ffffffffa076f362>] nv84_bar_flush+0x52/0x90 [nouveau]
 [<ffffffffa0790892>] nvc0_vm_flush+0x42/0x1a0 [nouveau]
 [<ffffffffa079061c>] ? nvc0_vm_map+0xfc/0x110 [nouveau]
 [<ffffffffa078e1c5>] nouveau_vm_map_at+0x165/0x1d0 [nouveau]
 [<ffffffffa078e243>] nouveau_vm_map+0x13/0x20 [nouveau]
 [<ffffffffa07cb09c>] nouveau_bo_move_ntfy+0xbc/0xd0 [nouveau]
 [<ffffffffa06b0f1e>] ttm_bo_handle_move_mem+0x20e/0x5c0 [ttm]
 [<ffffffffa06b19b9>] ? ttm_bo_mem_space+0x179/0x360 [ttm]
 [<ffffffffa06b1f97>] ttm_bo_move_buffer+0x117/0x130 [ttm]
 [<ffffffff8120364d>] ? proc_alloc_inode+0x1d/0xb0
 [<ffffffffa06b203a>] ttm_bo_validate+0x8a/0x100 [ttm]
 [<ffffffffa07cc5cc>] nouveau_bo_validate+0x1c/0x20 [nouveau]
 [<ffffffffa07ce159>] validate_list+0x69/0x310 [nouveau]
 [<ffffffffa07cf4ca>] nouveau_gem_ioctl_pushbuf+0x9aa/0x1560 [nouveau]
 [<ffffffff814df7ce>] ? mutex_unlock+0xe/0x10
 [<ffffffffa00111a2>] drm_ioctl+0x532/0x660 [drm]
 [<ffffffff81072aa7>] ? kill_pid_info+0x47/0x60
 [<ffffffff811b1c05>] do_vfs_ioctl+0x2e5/0x4d0
 [<ffffffff810711a2>] ? __set_task_blocked+0x32/0x70
 [<ffffffff811a15ee>] ? ____fput+0xe/0x10
 [<ffffffff811b1e71>] SyS_ioctl+0x81/0xa0
 [<ffffffff814e665e>] ? do_page_fault+0xe/0x10
 [<ffffffff814ea5dd>] system_call_fastpath+0x1a/0x1f
---[ end trace 7fcf10949e51422c ]---


Then, when turning the card back on,

nouveau E[      VM][0000:01:00.0] vm timeout 1: 0xbadf1200 1

Which probably leaves the vm uninitialized (?), and the BUG which happens due
to node->mem being NULL:

BUG: unable to handle kernel NULL pointer dereference at 00000000000000e0
IP: [<ffffffffa07887ab>] nv50_instobj_wr32+0x2b/0xc0 [nouveau]
PGD 24b816067 PUD 2524ef067 PMD 0 
Oops: 0000 [#1] PREEMPT SMP 
Modules linked in: joydev uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_core videodev media nls_cp437 vfat fat snd_hda_codec_hdmi
snd_hda_codec_ca0132 x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm
crc32_pclmul crc32c_intel snd_hda_intel ghash_clmulni_intel aesni_intel
aes_x86_64 snd_hda_codec lrw gf128mul glue_helper arc4 dell_wmi snd_hwdep
snd_pcm sparse_keymap snd_page_alloc ath9k ath9k_common ath9k_hw ath mac80211
nouveau cfg80211 mxm_wmi iTCO_wdt rfkill ttm psmouse iTCO_vendor_support
snd_timer atl1c serio_raw rtsx_pci_ms memstick ablk_helper cryptd snd fan
microcode thermal wmi mperf ac evdev shpchp processor pcspkr soundcore battery
lpc_ich i2c_i801 mei_me mei ext4 crc16 mbcache jbd2 hid_generic usbhid hid
sr_mod sd_mod cdrom rtsx_pci_sdmmc ahci libahci libata sdhci_pci
 sdhci ehci_pci xhci_hcd ehci_hcd scsi_mod mmc_core rtsx_pci usbcore usb_common
i915 video button i2c_algo_bit intel_agp intel_gtt drm_kms_helper drm i2c_core
[last unloaded: coretemp]
CPU: 3 PID: 375 Comm: bumblebeed Tainted: G        W    3.11.6-1-ARCH #1
Hardware name: Alienware M14xR2/M14xR2, BIOS A10 06/29/2012
task: ffff88024f82a1c0 ti: ffff88025251a000 task.ti: ffff88025251a000
RIP: 0010:[<ffffffffa07887ab>]  [<ffffffffa07887ab>]
nv50_instobj_wr32+0x2b/0xc0 [nouveau]
RSP: 0018:ffff88025251bc60  EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff880252d8d900 RCX: ffffffffa0814ac0
RDX: 00000000ffeefeff RSI: 0000000000000000 RDI: ffff88024ee58060
RBP: ffff88025251bc90 R08: 0000000000000000 R09: ffffffff8116b8ca
R10: ffff88025251bfd8 R11: 0000000000000001 R12: ffff88024ee58060
R13: 00000ffffff00000 R14: 00000000ffeefeff R15: 0000000000000000
FS:  00007fc9e4f01700(0000) GS:ffff88025f2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000000e0 CR3: 000000025230f000 CR4: 00000000001407e0
Stack:
 0000000000008000 0000000000000004 ffff88024ee58060 ffff880252d8d970
 ffff880252d8d920 0000000000000000 ffff88025251bcc0 ffffffffa0787f84
 ffff880252d8d900 0000000000000000 ffff88025354b000 0000000000000000
Call Trace:
 [<ffffffffa0787f84>] nouveau_instmem_init+0x84/0xc0 [nouveau]
 [<ffffffffa07880be>] _nouveau_instmem_init+0xe/0x10 [nouveau]
 [<ffffffffa076dffd>] nouveau_object_inc+0xbd/0x1b0 [nouveau]
 [<ffffffffa07937c5>] nouveau_device_init+0x25/0xa0 [nouveau]
 [<ffffffffa076dffd>] nouveau_object_inc+0xbd/0x1b0 [nouveau]
 [<ffffffffa076dfd7>] nouveau_object_inc+0x97/0x1b0 [nouveau]
 [<ffffffffa076c79b>] nouveau_handle_init+0x7b/0x230 [nouveau]
 [<ffffffffa076c831>] nouveau_handle_init+0x111/0x230 [nouveau]
 [<ffffffffa076b162>] nouveau_client_init+0x32/0x60 [nouveau]
 [<ffffffffa07c6744>] nouveau_do_resume+0x64/0x130 [nouveau]
 [<ffffffffa07c6870>] nouveau_pmops_resume+0x60/0x70 [nouveau]
 [<ffffffffa07c96c0>] nouveau_switcheroo_set_state+0x90/0xb0 [nouveau]
 [<ffffffff81371a95>] vga_switchon+0x35/0x50
 [<ffffffff81372328>] vga_switcheroo_debugfs_write+0x368/0x3b0
 [<ffffffff8119fafd>] vfs_write+0xbd/0x1e0
 [<ffffffff811a0559>] SyS_write+0x49/0xa0
 [<ffffffff814ea5dd>] system_call_fastpath+0x1a/0x1f
Code: 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 89 d6 41 55 49 bd 00 00 f0 ff
ff 0f 00 00 41 54 53 48 83 ec 08 48 8b 47 48 48 8b 5f 10 <48> 03 b0 e0 00 00 00
4c 8d a3 90 00 00 00 4c 89 e7 49 21 f5 81 
RIP  [<ffffffffa07887ab>] nv50_instobj_wr32+0x2b/0xc0 [nouveau]
 RSP <ffff88025251bc60>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382972069.cCA5D1.9901
Date: Mon, 28 Oct 2013 14:54:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] kernel panic in nv50_instobj_wr32 after switcheroo puts card to D3cold"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70927">bug 70927</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>nv50_instobj_wr32 kernel panic
           </td>
           <td>[NVE7] kernel panic in nv50_instobj_wr32 after switcheroo puts card to D3cold
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] kernel panic in nv50_instobj_wr32 after switcheroo puts card to D3cold"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70927#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] kernel panic in nv50_instobj_wr32 after switcheroo puts card to D3cold"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70927">bug 70927</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This can't be good. Happens after switcheroo turns the card off and it goes to
D3cold. I suspect the crash is related to this.

------------[ cut here ]------------
WARNING: CPU: 6 PID: 401 at kernel/watchdog.c:245
watchdog_overflow_callback+0x9c/0xd0()
Watchdog detected hard LOCKUP on cpu 6
Modules linked in:
 joydev uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_core videodev
media nls_cp437 vfat fat snd_hda_codec_hdmi snd_hda_codec_ca0132
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm crc32_pclmul
crc32c_intel snd_hda_intel ghash_clmulni_intel aesni_intel aes_x86_64
snd_hda_codec lrw gf128mul glue_helper arc4 dell_wmi snd_hwdep snd_pcm
sparse_keymap snd_page_alloc ath9k ath9k_common ath9k_hw ath mac80211 nouveau
cfg80211 mxm_wmi iTCO_wdt rfkill ttm psmouse iTCO_vendor_support snd_timer
atl1c serio_raw rtsx_pci_ms memstick ablk_helper cryptd snd fan microcode
thermal wmi mperf ac evdev shpchp processor pcspkr soundcore battery lpc_ich
i2c_i801 mei_me mei ext4 crc16 mbcache jbd2 hid_generic usbhid hid sr_mod
sd_mod cdrom rtsx_pci_sdmmc ahci libahci libata sdhci_pci sdhci
 ehci_pci xhci_hcd ehci_hcd scsi_mod mmc_core rtsx_pci usbcore usb_common i915
video button i2c_algo_bit intel_agp intel_gtt drm_kms_helper drm i2c_core
CPU: 6 PID: 401 Comm: Xorg Not tainted 3.11.6-1-ARCH #1
Hardware name: Alienware M14xR2/M14xR2, BIOS A10 06/29/2012
 0000000000000009 ffff88025f386c10 ffffffff814dba02 ffff88025f386c58
 ffff88025f386c48 ffffffff8106193d ffff880253688000 0000000000000000
 ffff88025f386d78 0000000000000000 ffff88025f386ef8 ffff88025f386ca8
Call Trace:
 &lt;NMI&gt;  [&lt;ffffffff814dba02&gt;] dump_stack+0x54/0x8d
 [&lt;ffffffff8106193d&gt;] warn_slowpath_common+0x7d/0xa0
 [&lt;ffffffff810619ac&gt;] warn_slowpath_fmt+0x4c/0x50
 [&lt;ffffffff8101c665&gt;] ? native_sched_clock+0x15/0x80
 [&lt;ffffffff8101c6d9&gt;] ? sched_clock+0x9/0x10
 [&lt;ffffffff810e9950&gt;] ? watchdog_enable_all_cpus.part.2+0x40/0x40
 [&lt;ffffffff810e99ec&gt;] watchdog_overflow_callback+0x9c/0xd0
 [&lt;ffffffff8112962e&gt;] __perf_event_overflow+0x8e/0x2b0
 [&lt;ffffffff811284b7&gt;] ? perf_event_update_userpage+0xe7/0x160
 [&lt;ffffffff8112a1e4&gt;] perf_event_overflow+0x14/0x20
 [&lt;ffffffff8103072d&gt;] intel_pmu_handle_irq+0x1bd/0x3c0
 [&lt;ffffffff814e489b&gt;] perf_event_nmi_handler+0x2b/0x50
 [&lt;ffffffff814e3ea1&gt;] nmi_handle.isra.3+0xa1/0x1d0
 [&lt;ffffffff814e4139&gt;] do_nmi+0x169/0x340
 [&lt;ffffffff814e34f1&gt;] end_repeat_nmi+0x1e/0x2e
 [&lt;ffffffff81298a12&gt;] ? ioread32+0x42/0x50
 [&lt;ffffffff81298a12&gt;] ? ioread32+0x42/0x50
 [&lt;ffffffff81298a12&gt;] ? ioread32+0x42/0x50
 &lt;&lt;EOE&gt;&gt;  [&lt;ffffffffa078d7cb&gt;] ? nv04_timer_read+0x3b/0x70 [nouveau]
 [&lt;ffffffffa078d574&gt;] nouveau_timer_wait_eq+0x74/0xd0 [nouveau]
 [&lt;ffffffffa076f362&gt;] nv84_bar_flush+0x52/0x90 [nouveau]
 [&lt;ffffffffa0790892&gt;] nvc0_vm_flush+0x42/0x1a0 [nouveau]
 [&lt;ffffffffa079061c&gt;] ? nvc0_vm_map+0xfc/0x110 [nouveau]
 [&lt;ffffffffa078e1c5&gt;] nouveau_vm_map_at+0x165/0x1d0 [nouveau]
 [&lt;ffffffffa078e243&gt;] nouveau_vm_map+0x13/0x20 [nouveau]
 [&lt;ffffffffa07cb09c&gt;] nouveau_bo_move_ntfy+0xbc/0xd0 [nouveau]
 [&lt;ffffffffa06b0f1e&gt;] ttm_bo_handle_move_mem+0x20e/0x5c0 [ttm]
 [&lt;ffffffffa06b19b9&gt;] ? ttm_bo_mem_space+0x179/0x360 [ttm]
 [&lt;ffffffffa06b1f97&gt;] ttm_bo_move_buffer+0x117/0x130 [ttm]
 [&lt;ffffffff8120364d&gt;] ? proc_alloc_inode+0x1d/0xb0
 [&lt;ffffffffa06b203a&gt;] ttm_bo_validate+0x8a/0x100 [ttm]
 [&lt;ffffffffa07cc5cc&gt;] nouveau_bo_validate+0x1c/0x20 [nouveau]
 [&lt;ffffffffa07ce159&gt;] validate_list+0x69/0x310 [nouveau]
 [&lt;ffffffffa07cf4ca&gt;] nouveau_gem_ioctl_pushbuf+0x9aa/0x1560 [nouveau]
 [&lt;ffffffff814df7ce&gt;] ? mutex_unlock+0xe/0x10
 [&lt;ffffffffa00111a2&gt;] drm_ioctl+0x532/0x660 [drm]
 [&lt;ffffffff81072aa7&gt;] ? kill_pid_info+0x47/0x60
 [&lt;ffffffff811b1c05&gt;] do_vfs_ioctl+0x2e5/0x4d0
 [&lt;ffffffff810711a2&gt;] ? __set_task_blocked+0x32/0x70
 [&lt;ffffffff811a15ee&gt;] ? ____fput+0xe/0x10
 [&lt;ffffffff811b1e71&gt;] SyS_ioctl+0x81/0xa0
 [&lt;ffffffff814e665e&gt;] ? do_page_fault+0xe/0x10
 [&lt;ffffffff814ea5dd&gt;] system_call_fastpath+0x1a/0x1f
---[ end trace 7fcf10949e51422c ]---


Then, when turning the card back on,

nouveau E[      VM][0000:01:00.0] vm timeout 1: 0xbadf1200 1

Which probably leaves the vm uninitialized (?), and the BUG which happens due
to node-&gt;mem being NULL:

BUG: unable to handle kernel NULL pointer dereference at 00000000000000e0
IP: [&lt;ffffffffa07887ab&gt;] nv50_instobj_wr32+0x2b/0xc0 [nouveau]
PGD 24b816067 PUD 2524ef067 PMD 0 
Oops: 0000 [#1] PREEMPT SMP 
Modules linked in: joydev uvcvideo videobuf2_vmalloc videobuf2_memops
videobuf2_core videodev media nls_cp437 vfat fat snd_hda_codec_hdmi
snd_hda_codec_ca0132 x86_pkg_temp_thermal intel_powerclamp kvm_intel kvm
crc32_pclmul crc32c_intel snd_hda_intel ghash_clmulni_intel aesni_intel
aes_x86_64 snd_hda_codec lrw gf128mul glue_helper arc4 dell_wmi snd_hwdep
snd_pcm sparse_keymap snd_page_alloc ath9k ath9k_common ath9k_hw ath mac80211
nouveau cfg80211 mxm_wmi iTCO_wdt rfkill ttm psmouse iTCO_vendor_support
snd_timer atl1c serio_raw rtsx_pci_ms memstick ablk_helper cryptd snd fan
microcode thermal wmi mperf ac evdev shpchp processor pcspkr soundcore battery
lpc_ich i2c_i801 mei_me mei ext4 crc16 mbcache jbd2 hid_generic usbhid hid
sr_mod sd_mod cdrom rtsx_pci_sdmmc ahci libahci libata sdhci_pci
 sdhci ehci_pci xhci_hcd ehci_hcd scsi_mod mmc_core rtsx_pci usbcore usb_common
i915 video button i2c_algo_bit intel_agp intel_gtt drm_kms_helper drm i2c_core
[last unloaded: coretemp]
CPU: 3 PID: 375 Comm: bumblebeed Tainted: G        W    3.11.6-1-ARCH #1
Hardware name: Alienware M14xR2/M14xR2, BIOS A10 06/29/2012
task: ffff88024f82a1c0 ti: ffff88025251a000 task.ti: ffff88025251a000
RIP: 0010:[&lt;ffffffffa07887ab&gt;]  [&lt;ffffffffa07887ab&gt;]
nv50_instobj_wr32+0x2b/0xc0 [nouveau]
RSP: 0018:ffff88025251bc60  EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff880252d8d900 RCX: ffffffffa0814ac0
RDX: 00000000ffeefeff RSI: 0000000000000000 RDI: ffff88024ee58060
RBP: ffff88025251bc90 R08: 0000000000000000 R09: ffffffff8116b8ca
R10: ffff88025251bfd8 R11: 0000000000000001 R12: ffff88024ee58060
R13: 00000ffffff00000 R14: 00000000ffeefeff R15: 0000000000000000
FS:  00007fc9e4f01700(0000) GS:ffff88025f2c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000000000e0 CR3: 000000025230f000 CR4: 00000000001407e0
Stack:
 0000000000008000 0000000000000004 ffff88024ee58060 ffff880252d8d970
 ffff880252d8d920 0000000000000000 ffff88025251bcc0 ffffffffa0787f84
 ffff880252d8d900 0000000000000000 ffff88025354b000 0000000000000000
Call Trace:
 [&lt;ffffffffa0787f84&gt;] nouveau_instmem_init+0x84/0xc0 [nouveau]
 [&lt;ffffffffa07880be&gt;] _nouveau_instmem_init+0xe/0x10 [nouveau]
 [&lt;ffffffffa076dffd&gt;] nouveau_object_inc+0xbd/0x1b0 [nouveau]
 [&lt;ffffffffa07937c5&gt;] nouveau_device_init+0x25/0xa0 [nouveau]
 [&lt;ffffffffa076dffd&gt;] nouveau_object_inc+0xbd/0x1b0 [nouveau]
 [&lt;ffffffffa076dfd7&gt;] nouveau_object_inc+0x97/0x1b0 [nouveau]
 [&lt;ffffffffa076c79b&gt;] nouveau_handle_init+0x7b/0x230 [nouveau]
 [&lt;ffffffffa076c831&gt;] nouveau_handle_init+0x111/0x230 [nouveau]
 [&lt;ffffffffa076b162&gt;] nouveau_client_init+0x32/0x60 [nouveau]
 [&lt;ffffffffa07c6744&gt;] nouveau_do_resume+0x64/0x130 [nouveau]
 [&lt;ffffffffa07c6870&gt;] nouveau_pmops_resume+0x60/0x70 [nouveau]
 [&lt;ffffffffa07c96c0&gt;] nouveau_switcheroo_set_state+0x90/0xb0 [nouveau]
 [&lt;ffffffff81371a95&gt;] vga_switchon+0x35/0x50
 [&lt;ffffffff81372328&gt;] vga_switcheroo_debugfs_write+0x368/0x3b0
 [&lt;ffffffff8119fafd&gt;] vfs_write+0xbd/0x1e0
 [&lt;ffffffff811a0559&gt;] SyS_write+0x49/0xa0
 [&lt;ffffffff814ea5dd&gt;] system_call_fastpath+0x1a/0x1f
Code: 0f 1f 44 00 00 55 48 89 e5 41 57 41 56 41 89 d6 41 55 49 bd 00 00 f0 ff
ff 0f 00 00 41 54 53 48 83 ec 08 48 8b 47 48 48 8b 5f 10 &lt;48&gt; 03 b0 e0 00 00 00
4c 8d a3 90 00 00 00 4c 89 e7 49 21 f5 81 
RIP  [&lt;ffffffffa07887ab&gt;] nv50_instobj_wr32+0x2b/0xc0 [nouveau]
 RSP &lt;ffff88025251bc60&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382972069.cCA5D1.9901--

--===============0963997838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0963997838==--

From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Fri, 15 Apr 2016 10:35:44 +0000
Message-ID: <bug-82714-8800-ePGo5WxT4k@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0026271342=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0026271342==
Content-Type: multipart/alternative; boundary="14607165442.e7BE0.6509";
 charset="UTF-8"


--14607165442.e7BE0.6509
Date: Fri, 15 Apr 2016 10:35:44 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #24 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
With the GM206 driving the display, no special Nouveau options, I get this upon
starting X:

[  545.904188] vgaarb: device changed decodes:
PCI:0000:04:00.0,olddecodes=io+mem,decodes=none:owns=none
[  548.670462] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  550.670606] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  552.670884] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  554.671015] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  556.671164] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  557.490345] hrtimer: interrupt took 144523656 ns
[  558.262053] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/subdev/bar/g84.c:38/g84_bar_flush()!
[  558.262085] nouveau 0000:04:00.0: fifo: intr 00200000
[  559.852876] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/subdev/bar/g84.c:38/g84_bar_flush()!
[  559.852907] nouveau 0000:04:00.0: fifo: intr 04800000
[  563.418621] INFO: NMI handler (ghes_notify_nmi) took too long to run: 48.172
msecs
[  563.563141] INFO: NMI handler (perf_event_nmi_handler) took too long to run:
48.172 msecs
[  563.659490] perf: interrupt took too long (376349 > 2500), lowering
kernel.perf_event_max_sample_rate to 300
[  578.942906] NMI watchdog: Watchdog detected hard LOCKUP on cpu 0
[  578.942909] Modules linked in: netconsole snd_hda_codec_hdmi ipmi_ssif
snd_hda_codec_realtek snd_hda_codec_generic i915 intel_gtt intel_rapl
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel aes_x86_64 lrw
gf128mul glue_helper ablk_helper cryptd nls_iso8859_1 nls_cp437 vfat fat
i2c_i801 snd_hda_intel e1000e nouveau(O) igb snd_hda_codec ast ptp mxm_wmi
pps_core snd_hda_core snd_hwdep ttm i2c_algo_bit dca snd_pcm drm_kms_helper
snd_timer evdev syscopyarea joydev mousedev sysfillrect input_leds snd
sysimgblt led_class fb_sys_fops soundcore mac_hid drm mei_me hci_uart mei
ipmi_si btbcm shpchp wmi fan battery btqca thermal pinctrl_sunrisepoint
ipmi_msghandler btintel video pinctrl_intel bluetooth intel_lpss_acpi
intel_lpss crc16 i2c_hid tpm_tis acpi_pad button tpm processor fjes
sch_fq_codel ip_tables x_tables btrfs xor hid_generic usbhid hid raid6_pq
sd_mod crc32c_intel ahci libahci libata xhci_pci xhci_hcd scsi_mod usbcore
usb_common
[  578.942996] CPU: 0 PID: 498 Comm: Xorg Tainted: G           O   
4.6.0-rc2-NOUVEAU-189048-gf9fd2ad #5
[  578.942997] Hardware name: Supermicro Super Server/X11SAT-F, BIOS 1.0
02/05/2016
[  578.942999]  0000000000000086 00000000517a463a ffff8802c5805b50
ffffffff812da391
[  578.943002]  0000000000000000 0000000000000001 ffff8802c5805b68
ffffffff81116c3d
[  578.943005]  ffff8802bd015000 ffff8802c5805ba0 ffffffff8115f2ac
0000000000000001
[  578.943008] Call Trace:
[  578.943009]  <NMI>  [<ffffffff812da391>] dump_stack+0x63/0x82
[  578.943014]  [<ffffffff81116c3d>] watchdog_overflow_callback+0xbd/0xd0
[  578.943017]  [<ffffffff8115f2ac>] __perf_event_overflow+0x8c/0x1d0
[  578.943018]  [<ffffffff8115fe94>] perf_event_overflow+0x14/0x20
[  578.943020]  [<ffffffff8100c761>] intel_pmu_handle_irq+0x1e1/0x4a0
[  578.943023]  [<ffffffff811af4fd>] ? vunmap_page_range+0x20d/0x330
[  578.943025]  [<ffffffff811af631>] ? unmap_kernel_range_noflush+0x11/0x20
[  578.943027]  [<ffffffff8139006b>] ? ghes_copy_tofrom_phys+0x11b/0x2a0
[  578.943029]  [<ffffffff81050bff>] ? native_apic_wait_icr_idle+0x1f/0x30
[  578.943031]  [<ffffffff8100594d>] perf_event_nmi_handler+0x2d/0x50
[  578.943033]  [<ffffffff8103206e>] nmi_handle+0x5e/0x130
[  578.943035]  [<ffffffff81032680>] default_do_nmi+0xd0/0x120
[  578.943036]  [<ffffffff810327b2>] do_nmi+0xe2/0x130
[  578.943108]  [<ffffffff815adc71>] end_repeat_nmi+0x1a/0x1e
[  578.943111]  [<ffffffff812f30b0>] ? ioread32+0x30/0x40
[  578.943112]  [<ffffffff812f30b0>] ? ioread32+0x30/0x40
[  578.943113]  [<ffffffff812f30b0>] ? ioread32+0x30/0x40
[  578.943114]  <<EOE>>  [<ffffffffa0641f65>] ? nv04_timer_read+0x25/0x70
[nouveau]
[  578.943136]  [<ffffffffa0641adf>] nvkm_timer_read+0xf/0x20 [nouveau]
[  578.943143]  [<ffffffffa05ee6e2>] g84_bar_flush+0x62/0xe0 [nouveau]
[  578.943149]  [<ffffffffa05ede5c>] nvkm_bar_flush+0x1c/0x20 [nouveau]
[  578.943159]  [<ffffffffa06311bd>] nvkm_instobj_release+0x1d/0x20 [nouveau]
[  578.943169]  [<ffffffffa0637250>] nv50_vm_map_sg+0x100/0x110 [nouveau]
[  578.943178]  [<ffffffffa06355eb>] nvkm_vm_map+0x2fb/0x3b0 [nouveau]
[  578.943186]  [<ffffffffa0635d76>] ? nvkm_vm_get+0x1d6/0x260 [nouveau]
[  578.943195]  [<ffffffffa0692eee>] nouveau_bo_vma_add+0x5e/0x90 [nouveau]
[  578.943203]  [<ffffffffa069345a>] nouveau_gem_object_open+0x15a/0x190
[nouveau]
[  578.943207]  [<ffffffffa04000b9>] drm_gem_handle_create_tail+0xe9/0x1b0
[drm]
[  578.943210]  [<ffffffffa04001b5>] drm_gem_handle_create+0x35/0x40 [drm]
[  578.943218]  [<ffffffffa0693882>] nouveau_gem_ioctl_new+0xc2/0x1d0 [nouveau]
[  578.943221]  [<ffffffffa0400ae2>] drm_ioctl+0x152/0x540 [drm]
[  578.943229]  [<ffffffffa06937c0>] ? nouveau_gem_new+0x150/0x150 [nouveau]
[  578.943232]  [<ffffffff8117b826>] ?
lru_cache_add_active_or_unevictable+0x36/0xb0
[  578.943240]  [<ffffffffa068c2c8>] nouveau_drm_ioctl+0x68/0xc0 [nouveau]
[  578.943242]  [<ffffffff812034f1>] do_vfs_ioctl+0xa1/0x5b0
[  578.943244]  [<ffffffff810637d4>] ? __do_page_fault+0x1f4/0x510
[  578.943245]  [<ffffffff81203a79>] SyS_ioctl+0x79/0x90
[  578.943247]  [<ffffffff815aba32>] entry_SYSCALL_64_fastpath+0x1a/0xa4

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14607165442.e7BE0.6509
Date: Fri, 15 Apr 2016 10:35:44 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>With the GM206 driving the display, no special Nouveau options, I get this upon
starting X:

[  545.904188] vgaarb: device changed decodes:
PCI:0000:04:00.0,olddecodes=io+mem,decodes=none:owns=none
[  548.670462] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  550.670606] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  552.670884] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  554.671015] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  556.671164] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/engine/gr/g84.c:169/g84_gr_tlb_flush()!
[  557.490345] hrtimer: interrupt took 144523656 ns
[  558.262053] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/subdev/bar/g84.c:38/g84_bar_flush()!
[  558.262085] nouveau 0000:04:00.0: fifo: intr 00200000
[  559.852876] nouveau 0000:04:00.0: timeout at
/home/pmoreau/projects/nouveau/nouveau/drm/nouveau/nvkm/subdev/bar/g84.c:38/g84_bar_flush()!
[  559.852907] nouveau 0000:04:00.0: fifo: intr 04800000
[  563.418621] INFO: NMI handler (ghes_notify_nmi) took too long to run: 48.172
msecs
[  563.563141] INFO: NMI handler (perf_event_nmi_handler) took too long to run:
48.172 msecs
[  563.659490] perf: interrupt took too long (376349 &gt; 2500), lowering
kernel.perf_event_max_sample_rate to 300
[  578.942906] NMI watchdog: Watchdog detected hard LOCKUP on cpu 0
[  578.942909] Modules linked in: netconsole snd_hda_codec_hdmi ipmi_ssif
snd_hda_codec_realtek snd_hda_codec_generic i915 intel_gtt intel_rapl
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel aes_x86_64 lrw
gf128mul glue_helper ablk_helper cryptd nls_iso8859_1 nls_cp437 vfat fat
i2c_i801 snd_hda_intel e1000e nouveau(O) igb snd_hda_codec ast ptp mxm_wmi
pps_core snd_hda_core snd_hwdep ttm i2c_algo_bit dca snd_pcm drm_kms_helper
snd_timer evdev syscopyarea joydev mousedev sysfillrect input_leds snd
sysimgblt led_class fb_sys_fops soundcore mac_hid drm mei_me hci_uart mei
ipmi_si btbcm shpchp wmi fan battery btqca thermal pinctrl_sunrisepoint
ipmi_msghandler btintel video pinctrl_intel bluetooth intel_lpss_acpi
intel_lpss crc16 i2c_hid tpm_tis acpi_pad button tpm processor fjes
sch_fq_codel ip_tables x_tables btrfs xor hid_generic usbhid hid raid6_pq
sd_mod crc32c_intel ahci libahci libata xhci_pci xhci_hcd scsi_mod usbcore
usb_common
[  578.942996] CPU: 0 PID: 498 Comm: Xorg Tainted: G           O   
4.6.0-rc2-NOUVEAU-189048-gf9fd2ad #5
[  578.942997] Hardware name: Supermicro Super Server/X11SAT-F, BIOS 1.0
02/05/2016
[  578.942999]  0000000000000086 00000000517a463a ffff8802c5805b50
ffffffff812da391
[  578.943002]  0000000000000000 0000000000000001 ffff8802c5805b68
ffffffff81116c3d
[  578.943005]  ffff8802bd015000 ffff8802c5805ba0 ffffffff8115f2ac
0000000000000001
[  578.943008] Call Trace:
[  578.943009]  &lt;NMI&gt;  [&lt;ffffffff812da391&gt;] dump_stack+0x63/0x82
[  578.943014]  [&lt;ffffffff81116c3d&gt;] watchdog_overflow_callback+0xbd/0xd0
[  578.943017]  [&lt;ffffffff8115f2ac&gt;] __perf_event_overflow+0x8c/0x1d0
[  578.943018]  [&lt;ffffffff8115fe94&gt;] perf_event_overflow+0x14/0x20
[  578.943020]  [&lt;ffffffff8100c761&gt;] intel_pmu_handle_irq+0x1e1/0x4a0
[  578.943023]  [&lt;ffffffff811af4fd&gt;] ? vunmap_page_range+0x20d/0x330
[  578.943025]  [&lt;ffffffff811af631&gt;] ? unmap_kernel_range_noflush+0x11/0x20
[  578.943027]  [&lt;ffffffff8139006b&gt;] ? ghes_copy_tofrom_phys+0x11b/0x2a0
[  578.943029]  [&lt;ffffffff81050bff&gt;] ? native_apic_wait_icr_idle+0x1f/0x30
[  578.943031]  [&lt;ffffffff8100594d&gt;] perf_event_nmi_handler+0x2d/0x50
[  578.943033]  [&lt;ffffffff8103206e&gt;] nmi_handle+0x5e/0x130
[  578.943035]  [&lt;ffffffff81032680&gt;] default_do_nmi+0xd0/0x120
[  578.943036]  [&lt;ffffffff810327b2&gt;] do_nmi+0xe2/0x130
[  578.943108]  [&lt;ffffffff815adc71&gt;] end_repeat_nmi+0x1a/0x1e
[  578.943111]  [&lt;ffffffff812f30b0&gt;] ? ioread32+0x30/0x40
[  578.943112]  [&lt;ffffffff812f30b0&gt;] ? ioread32+0x30/0x40
[  578.943113]  [&lt;ffffffff812f30b0&gt;] ? ioread32+0x30/0x40
[  578.943114]  &lt;&lt;EOE&gt;&gt;  [&lt;ffffffffa0641f65&gt;] ? nv04_timer_read+0x25/0x70
[nouveau]
[  578.943136]  [&lt;ffffffffa0641adf&gt;] nvkm_timer_read+0xf/0x20 [nouveau]
[  578.943143]  [&lt;ffffffffa05ee6e2&gt;] g84_bar_flush+0x62/0xe0 [nouveau]
[  578.943149]  [&lt;ffffffffa05ede5c&gt;] nvkm_bar_flush+0x1c/0x20 [nouveau]
[  578.943159]  [&lt;ffffffffa06311bd&gt;] nvkm_instobj_release+0x1d/0x20 [nouveau]
[  578.943169]  [&lt;ffffffffa0637250&gt;] nv50_vm_map_sg+0x100/0x110 [nouveau]
[  578.943178]  [&lt;ffffffffa06355eb&gt;] nvkm_vm_map+0x2fb/0x3b0 [nouveau]
[  578.943186]  [&lt;ffffffffa0635d76&gt;] ? nvkm_vm_get+0x1d6/0x260 [nouveau]
[  578.943195]  [&lt;ffffffffa0692eee&gt;] nouveau_bo_vma_add+0x5e/0x90 [nouveau]
[  578.943203]  [&lt;ffffffffa069345a&gt;] nouveau_gem_object_open+0x15a/0x190
[nouveau]
[  578.943207]  [&lt;ffffffffa04000b9&gt;] drm_gem_handle_create_tail+0xe9/0x1b0
[drm]
[  578.943210]  [&lt;ffffffffa04001b5&gt;] drm_gem_handle_create+0x35/0x40 [drm]
[  578.943218]  [&lt;ffffffffa0693882&gt;] nouveau_gem_ioctl_new+0xc2/0x1d0 [nouveau]
[  578.943221]  [&lt;ffffffffa0400ae2&gt;] drm_ioctl+0x152/0x540 [drm]
[  578.943229]  [&lt;ffffffffa06937c0&gt;] ? nouveau_gem_new+0x150/0x150 [nouveau]
[  578.943232]  [&lt;ffffffff8117b826&gt;] ?
lru_cache_add_active_or_unevictable+0x36/0xb0
[  578.943240]  [&lt;ffffffffa068c2c8&gt;] nouveau_drm_ioctl+0x68/0xc0 [nouveau]
[  578.943242]  [&lt;ffffffff812034f1&gt;] do_vfs_ioctl+0xa1/0x5b0
[  578.943244]  [&lt;ffffffff810637d4&gt;] ? __do_page_fault+0x1f4/0x510
[  578.943245]  [&lt;ffffffff81203a79&gt;] SyS_ioctl+0x79/0x90
[  578.943247]  [&lt;ffffffff815aba32&gt;] entry_SYSCALL_64_fastpath+0x1a/0xa4</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14607165442.e7BE0.6509--

--===============0026271342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0026271342==--

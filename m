From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100035] New: nouveau runtime pm causes soft lockups
 and hangs during boot
Date: Thu, 02 Mar 2017 14:17:59 +0000
Message-ID: <bug-100035-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1091860751=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1091860751==
Content-Type: multipart/alternative; boundary="14884642790.7CC4.17962";
 charset="UTF-8"


--14884642790.7CC4.17962
Date: Thu, 2 Mar 2017 14:17:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100035

            Bug ID: 100035
           Summary: nouveau runtime pm causes soft lockups and hangs
                    during boot
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jprvita-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 130033
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D130033&action=3Dedit
Kernel log

An Asus GL552VXK with the following NVIDIA gfx card:

01:00.0 3D controller [0302]: NVIDIA Corporation Device [10de:139a] (rev a2)
        Subsystem: ASUSTeK Computer Inc. Device [1043:17b0]
        Flags: bus master, fast devsel, latency 0, IRQ 129
        Memory at ee000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at ef000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau

hangs during the boot process, which never finishes. The problem can be avo=
ided
with nouveau.runpm=3D0 on the kernel command line. The following soft locku=
p is
present on the kernel command line:

[   56.593134] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[plymouthd:227]
[   56.593136] Modules linked in: ath9k(+) ath9k_common ath9k_hw kvm_intel(=
+)
ath kvm mac80211 irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
uvcvideo asus_nb_wmi(+) snd_hda_intel(+) aesni_intel asus_wmi aes_x86_64
snd_hda_codec r8169(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
rtsx_pci_ms videobuf2_core sparse_keymap hci_uart videodev ath3k btusb
crypto_simd i2c_designware_platform(+) cryptd i2c_designware_core cfg80211
glue_helper btrtl snd_hwdep input_leds memstick media mii btbcm snd_hda_core
btqca btintel int3403_thermal bluetooth processor_thermal_device snd_pcm
intel_soc_dts_iosf mei_me acpi_als snd_timer acpi_pad tpm_crb idma64 virt_d=
ma
intel_lpss_pci kfifo_buf industrialio int3400_thermal snd intel_lpss_acpi
intel_lpss int340x_thermal_zone mei fjes mac_hid acpi_thermal_rel
[   56.593182]  asus_wireless shpchp soundcore nouveau i915 ttm i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm rtsx_pci_s=
dmmc
mxm_wmi rtsx_pci serio_raw ahci i2c_hid libahci hid video wmi
[   56.593191] CPU: 6 PID: 227 Comm: plymouthd Not tainted 4.10.0 #7
[   56.593191] Hardware name: ASUSTeK COMPUTER INC. GL552VXK/GL552VXK, BIOS
GL552VXK.200 11/14/2016
[   56.593192] task: ffff92cd4d0dba00 task.stack: ffffa42d82198000
[   56.593195] RIP: 0010:ioread32+0x30/0x40
[   56.593196] RSP: 0018:ffffa42d8219b818 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   56.593196] RAX: 00000000ffffffff RBX: 0000000000000000 RCX:
0000000000000018
[   56.593197] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d8310a04c
[   56.593197] RBP: ffffa42d8219b848 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   56.593198] R10: 0000000000000000 R11: 000000000000036c R12:
ffff92cd4cad3000
[   56.593198] R13: ffff92cd4cff0480 R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   56.593199] FS:  00007fc8a9987740(0000) GS:ffff92cd6ed80000(0000)
knlGS:0000000000000000
[   56.593199] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.593200] CR2: 00007efcd12de370 CR3: 000000044c8bb000 CR4:
00000000003406e0
[   56.593200] Call Trace:
[   56.593252]  ? nvkm_pmu_reset+0x94/0x160 [nouveau]
[   56.593268]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   56.593276]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   56.593291]  nvkm_device_init+0x60/0x270 [nouveau]
[   56.593305]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   56.593313]  nvkm_object_init+0x40/0x190 [nouveau]
[   56.593320]  nvkm_object_init+0x80/0x190 [nouveau]
[   56.593328]  nvkm_client_init+0xe/0x10 [nouveau]
[   56.593343]  nvkm_client_resume+0xe/0x10 [nouveau]
[   56.593350]  nvif_client_resume+0x14/0x20 [nouveau]
[   56.593365]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   56.593379]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   56.593381]  pci_pm_runtime_resume+0x7b/0xa0
[   56.593382]  __rpm_callback+0xc6/0x210
[   56.593383]  ? pci_restore_standard_config+0x40/0x40
[   56.593384]  rpm_callback+0x24/0x80
[   56.593385]  ? pci_restore_standard_config+0x40/0x40
[   56.593385]  rpm_resume+0x47d/0x680
[   56.593400]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   56.593401]  __pm_runtime_resume+0x4f/0x80
[   56.593415]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   56.593417]  ? security_capable+0x48/0x60
[   56.593423]  drm_open+0x205/0x3f0 [drm]
[   56.593428]  drm_stub_open+0xb6/0x110 [drm]
[   56.593429]  chrdev_open+0xbf/0x1b0
[   56.593431]  do_dentry_open+0x1e4/0x310
[   56.593432]  ? cdev_put+0x30/0x30
[   56.593433]  vfs_open+0x4f/0x70
[   56.593434]  ? may_open+0x9b/0x100
[   56.593434]  path_openat+0x2b2/0x1570
[   56.593436]  ? move_addr_to_user+0xba/0xd0
[   56.593437]  do_filp_open+0x91/0x100
[   56.593439]  ? __alloc_fd+0x46/0x170
[   56.593439]  do_sys_open+0x125/0x210
[   56.593440]  SyS_open+0x1e/0x20
[   56.593442]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   56.593442] RIP: 0033:0x7fc8a9085620
[   56.593443] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   56.593443] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   56.593444] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   56.593444] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   56.593444] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   56.593445] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   56.593445] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 43 53 0a bd 48 89 e5 e8 19 ff ff ff b8 ff ff ff ff 5d c3 8b 07 <c3=
> 66
66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[   84.593134] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[plymouthd:227]
[   84.593137] Modules linked in: ath9k(+) ath9k_common ath9k_hw kvm_intel(=
+)
ath kvm mac80211 irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
uvcvideo asus_nb_wmi(+) snd_hda_intel(+) aesni_intel asus_wmi aes_x86_64
snd_hda_codec r8169(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
rtsx_pci_ms videobuf2_core sparse_keymap hci_uart videodev ath3k btusb
crypto_simd i2c_designware_platform(+) cryptd i2c_designware_core cfg80211
glue_helper btrtl snd_hwdep input_leds memstick media mii btbcm snd_hda_core
btqca btintel int3403_thermal bluetooth processor_thermal_device snd_pcm
intel_soc_dts_iosf mei_me acpi_als snd_timer acpi_pad tpm_crb idma64 virt_d=
ma
intel_lpss_pci kfifo_buf industrialio int3400_thermal snd intel_lpss_acpi
intel_lpss int340x_thermal_zone mei fjes mac_hid acpi_thermal_rel
[   84.593179]  asus_wireless shpchp soundcore nouveau i915 ttm i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm rtsx_pci_s=
dmmc
mxm_wmi rtsx_pci serio_raw ahci i2c_hid libahci hid video wmi
[   84.593186] CPU: 6 PID: 227 Comm: plymouthd Tainted: G             L  4.=
10.0
#7
[   84.593187] Hardware name: ASUSTeK COMPUTER INC. GL552VXK/GL552VXK, BIOS
GL552VXK.200 11/14/2016
[   84.593188] task: ffff92cd4d0dba00 task.stack: ffffa42d82198000
[   84.593190] RIP: 0010:ioread32+0x30/0x40
[   84.593191] RSP: 0018:ffffa42d8219b7e0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   84.593192] RAX: 00000000ffffffff RBX: ffff92cd4cad3000 RCX:
0000000000000018
[   84.593192] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d83009410
[   84.593193] RBP: ffffa42d8219b800 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   84.593193] R10: 0000000000000000 R11: 000000000000036c R12:
ffff92cd4cad3000
[   84.593194] R13: ffff92cd4cff0480 R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   84.593194] FS:  00007fc8a9987740(0000) GS:ffff92cd6ed80000(0000)
knlGS:0000000000000000
[   84.593195] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.593195] CR2: 00007efcd12de370 CR3: 000000044c8bb000 CR4:
00000000003406e0
[   84.593196] Call Trace:
[   84.593231]  ? nv04_timer_read+0x22/0x70 [nouveau]
[   84.593259]  nvkm_timer_read+0xf/0x20 [nouveau]
[   84.593273]  nvkm_pmu_reset+0x71/0x160 [nouveau]
[   84.593285]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   84.593293]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   84.593308]  nvkm_device_init+0x60/0x270 [nouveau]
[   84.593321]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   84.593329]  nvkm_object_init+0x40/0x190 [nouveau]
[   84.593336]  nvkm_object_init+0x80/0x190 [nouveau]
[   84.593344]  nvkm_client_init+0xe/0x10 [nouveau]
[   84.593359]  nvkm_client_resume+0xe/0x10 [nouveau]
[   84.593366]  nvif_client_resume+0x14/0x20 [nouveau]
[   84.593380]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   84.593394]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   84.593396]  pci_pm_runtime_resume+0x7b/0xa0
[   84.593397]  __rpm_callback+0xc6/0x210
[   84.593398]  ? pci_restore_standard_config+0x40/0x40
[   84.593399]  rpm_callback+0x24/0x80
[   84.593400]  ? pci_restore_standard_config+0x40/0x40
[   84.593400]  rpm_resume+0x47d/0x680
[   84.593415]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   84.593415]  __pm_runtime_resume+0x4f/0x80
[   84.593430]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   84.593436]  ? security_capable+0x48/0x60
[   84.593448]  drm_open+0x205/0x3f0 [drm]
[   84.593453]  drm_stub_open+0xb6/0x110 [drm]
[   84.593454]  chrdev_open+0xbf/0x1b0
[   84.593456]  do_dentry_open+0x1e4/0x310
[   84.593457]  ? cdev_put+0x30/0x30
[   84.593458]  vfs_open+0x4f/0x70
[   84.593458]  ? may_open+0x9b/0x100
[   84.593459]  path_openat+0x2b2/0x1570
[   84.593461]  ? move_addr_to_user+0xba/0xd0
[   84.593462]  do_filp_open+0x91/0x100
[   84.593464]  ? __alloc_fd+0x46/0x170
[   84.593464]  do_sys_open+0x125/0x210
[   84.593465]  SyS_open+0x1e/0x20
[   84.593466]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   84.593467] RIP: 0033:0x7fc8a9085620
[   84.593467] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   84.593468] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   84.593469] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   84.593469] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   84.593469] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   84.593470] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   84.593470] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 43 53 0a bd 48 89 e5 e8 19 ff ff ff b8 ff ff ff ff 5d c3 8b 07 <c3=
> 66
66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[   91.721133] INFO: rcu_sched self-detected stall on CPU
[   91.721137]         6-...: (15000 ticks this GP) idle=3Dc15/140000000000=
001/0
softirq=3D603/603 fqs=3D7479=20
[   91.721138]          (t=3D15001 jiffies g=3D343 c=3D342 q=3D90238)
[   91.721139] Task dump for CPU 6:
[   91.721139] plymouthd       R  running task        0   227      1 0x0000=
0008
[   91.721140] Call Trace:
[   91.721141]  <IRQ>
[   91.721143]  sched_show_task+0xd5/0x140
[   91.721144]  dump_cpu_task+0x39/0x40
[   91.721169]  rcu_dump_cpu_stacks+0x80/0xbb
[   91.721171]  rcu_check_callbacks+0x71e/0x880
[   91.721172]  ? acct_account_cputime+0x1c/0x20
[   91.721173]  ? account_system_time+0x73/0x100
[   91.721175]  ? tick_sched_do_timer+0x40/0x40
[   91.721176]  update_process_times+0x2f/0x60
[   91.721177]  tick_sched_handle.isra.15+0x25/0x60
[   91.721178]  tick_sched_timer+0x3d/0x70
[   91.721179]  __hrtimer_run_queues+0xe5/0x250
[   91.721180]  hrtimer_interrupt+0xa8/0x1a0
[   91.721182]  local_apic_timer_interrupt+0x38/0x60
[   91.721184]  smp_apic_timer_interrupt+0x38/0x50
[   91.721185]  apic_timer_interrupt+0x89/0x90
[   91.721187] RIP: 0010:ioread32+0x30/0x40
[   91.721187] RSP: 0018:ffffa42d8219b7e0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   91.721188] RAX: 00000000ffffffff RBX: ffff92cd4cad3000 RCX:
0000000000000018
[   91.721189] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d83009410
[   91.721189] RBP: ffffa42d8219b800 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   91.721189] R10: 0000000000000000 R11: 000000000000036c R12:
00000000ffffffff
[   91.721190] R13: 00000000ffffffff R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   91.721190]  </IRQ>
[   91.721222]  ? nv04_timer_read+0x48/0x70 [nouveau]
[   91.721237]  nvkm_timer_read+0xf/0x20 [nouveau]
[   91.721252]  nvkm_pmu_reset+0x71/0x160 [nouveau]
[   91.721265]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   91.721274]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   91.721290]  nvkm_device_init+0x60/0x270 [nouveau]
[   91.721304]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   91.721313]  nvkm_object_init+0x40/0x190 [nouveau]
[   91.721321]  nvkm_object_init+0x80/0x190 [nouveau]
[   91.721329]  nvkm_client_init+0xe/0x10 [nouveau]
[   91.721345]  nvkm_client_resume+0xe/0x10 [nouveau]
[   91.721353]  nvif_client_resume+0x14/0x20 [nouveau]
[   91.721369]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   91.721384]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   91.721386]  pci_pm_runtime_resume+0x7b/0xa0
[   91.721387]  __rpm_callback+0xc6/0x210
[   91.721388]  ? pci_restore_standard_config+0x40/0x40
[   91.721388]  rpm_callback+0x24/0x80
[   91.721389]  ? pci_restore_standard_config+0x40/0x40
[   91.721390]  rpm_resume+0x47d/0x680
[   91.721403]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   91.721404]  __pm_runtime_resume+0x4f/0x80
[   91.721419]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   91.721420]  ? security_capable+0x48/0x60
[   91.721426]  drm_open+0x205/0x3f0 [drm]
[   91.721431]  drm_stub_open+0xb6/0x110 [drm]
[   91.721432]  chrdev_open+0xbf/0x1b0
[   91.721433]  do_dentry_open+0x1e4/0x310
[   91.721434]  ? cdev_put+0x30/0x30
[   91.721435]  vfs_open+0x4f/0x70
[   91.721436]  ? may_open+0x9b/0x100
[   91.721437]  path_openat+0x2b2/0x1570
[   91.721438]  ? move_addr_to_user+0xba/0xd0
[   91.721439]  do_filp_open+0x91/0x100
[   91.721441]  ? __alloc_fd+0x46/0x170
[   91.721441]  do_sys_open+0x125/0x210
[   91.721442]  SyS_open+0x1e/0x20
[   91.721443]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   91.721444] RIP: 0033:0x7fc8a9085620
[   91.721444] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   91.721445] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   91.721445] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   91.721446] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   91.721446] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   91.721447] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   92.677178] INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 6=
-...
} 15200 jiffies s: 613 root: 0x40/.
[   92.677181] blocking rcu_node structures:
[   92.677182] Task dump for CPU 6:
[   92.677183] plymouthd       R  running task        0   227      1 0x0000=
0008
[   92.677184] Call Trace:
[   92.677186]  ? irq_work_queue+0xf/0x80
[   92.677189]  ? wake_up_klogd+0x34/0x40
[   92.677190]  ? console_unlock+0x45b/0x480
[   92.677223]  ? nv04_timer_read+0x35/0x70 [nouveau]
[   92.677250]  ? nvkm_timer_read+0xf/0x20 [nouveau]
[   92.677265]  ? nvkm_pmu_reset+0x94/0x160 [nouveau]
[   92.677278]  ? nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   92.677287]  ? nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   92.677302]  ? nvkm_device_init+0x60/0x270 [nouveau]
[   92.677316]  ? nvkm_udevice_init+0x48/0x60 [nouveau]
[   92.677324]  ? nvkm_object_init+0x40/0x190 [nouveau]
[   92.677332]  ? nvkm_object_init+0x80/0x190 [nouveau]
[   92.677340]  ? nvkm_client_init+0xe/0x10 [nouveau]
[   92.677356]  ? nvkm_client_resume+0xe/0x10 [nouveau]
[   92.677364]  ? nvif_client_resume+0x14/0x20 [nouveau]
[   92.677379]  ? nouveau_do_resume+0x4d/0x130 [nouveau]
[   92.677393]  ? nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   92.677395]  ? pci_pm_runtime_resume+0x7b/0xa0
[   92.677396]  ? __rpm_callback+0xc6/0x210
[   92.677397]  ? pci_restore_standard_config+0x40/0x40
[   92.677397]  ? rpm_callback+0x24/0x80
[   92.677398]  ? pci_restore_standard_config+0x40/0x40
[   92.677399]  ? rpm_resume+0x47d/0x680
[   92.677411]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   92.677412]  ? __pm_runtime_resume+0x4f/0x80
[   92.677427]  ? nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   92.677428]  ? security_capable+0x48/0x60
[   92.677433]  ? drm_open+0x205/0x3f0 [drm]
[   92.677438]  ? drm_stub_open+0xb6/0x110 [drm]
[   92.677439]  ? chrdev_open+0xbf/0x1b0
[   92.677441]  ? do_dentry_open+0x1e4/0x310
[   92.677442]  ? cdev_put+0x30/0x30
[   92.677442]  ? vfs_open+0x4f/0x70
[   92.677443]  ? may_open+0x9b/0x100
[   92.677444]  ? path_openat+0x2b2/0x1570
[   92.677445]  ? move_addr_to_user+0xba/0xd0
[   92.677446]  ? do_filp_open+0x91/0x100
[   92.677448]  ? __alloc_fd+0x46/0x170
[   92.677448]  ? do_sys_open+0x125/0x210
[   92.677449]  ? SyS_open+0x1e/0x20
[   92.677450]  ? entry_SYSCALL_64_fastpath+0x1e/0xad

It does NOT seem to be a duplicate of bug 99385 since this machine's DSDT d=
oes
not have a call to LKDS, and the symptom here is a complete hang during boo=
tup.
I'm attaching the full kernel log on Linux v4.10 and the DSDT.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14884642790.7CC4.17962
Date: Thu, 2 Mar 2017 14:17:59 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau runtime pm causes soft lockups and hangs during b=
oot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100035">100035</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau runtime pm causes soft lockups and hangs during boot
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
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
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
          <td>jprvita&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D130033=
" name=3D"attach_130033" title=3D"Kernel log">attachment 130033</a> <a href=
=3D"attachment.cgi?id=3D130033&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

An Asus GL552VXK with the following NVIDIA gfx card:

01:00.0 3D controller [0302]: NVIDIA Corporation Device [10de:139a] (rev a2)
        Subsystem: ASUSTeK Computer Inc. Device [1043:17b0]
        Flags: bus master, fast devsel, latency 0, IRQ 129
        Memory at ee000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at e0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at ef000000 [disabled] [size=3D512K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [250] Latency Tolerance Reporting
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau

hangs during the boot process, which never finishes. The problem can be avo=
ided
with nouveau.runpm=3D0 on the kernel command line. The following soft locku=
p is
present on the kernel command line:

[   56.593134] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[plymouthd:227]
[   56.593136] Modules linked in: ath9k(+) ath9k_common ath9k_hw kvm_intel(=
+)
ath kvm mac80211 irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
uvcvideo asus_nb_wmi(+) snd_hda_intel(+) aesni_intel asus_wmi aes_x86_64
snd_hda_codec r8169(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
rtsx_pci_ms videobuf2_core sparse_keymap hci_uart videodev ath3k btusb
crypto_simd i2c_designware_platform(+) cryptd i2c_designware_core cfg80211
glue_helper btrtl snd_hwdep input_leds memstick media mii btbcm snd_hda_core
btqca btintel int3403_thermal bluetooth processor_thermal_device snd_pcm
intel_soc_dts_iosf mei_me acpi_als snd_timer acpi_pad tpm_crb idma64 virt_d=
ma
intel_lpss_pci kfifo_buf industrialio int3400_thermal snd intel_lpss_acpi
intel_lpss int340x_thermal_zone mei fjes mac_hid acpi_thermal_rel
[   56.593182]  asus_wireless shpchp soundcore nouveau i915 ttm i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm rtsx_pci_s=
dmmc
mxm_wmi rtsx_pci serio_raw ahci i2c_hid libahci hid video wmi
[   56.593191] CPU: 6 PID: 227 Comm: plymouthd Not tainted 4.10.0 #7
[   56.593191] Hardware name: ASUSTeK COMPUTER INC. GL552VXK/GL552VXK, BIOS
GL552VXK.200 11/14/2016
[   56.593192] task: ffff92cd4d0dba00 task.stack: ffffa42d82198000
[   56.593195] RIP: 0010:ioread32+0x30/0x40
[   56.593196] RSP: 0018:ffffa42d8219b818 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   56.593196] RAX: 00000000ffffffff RBX: 0000000000000000 RCX:
0000000000000018
[   56.593197] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d8310a04c
[   56.593197] RBP: ffffa42d8219b848 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   56.593198] R10: 0000000000000000 R11: 000000000000036c R12:
ffff92cd4cad3000
[   56.593198] R13: ffff92cd4cff0480 R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   56.593199] FS:  00007fc8a9987740(0000) GS:ffff92cd6ed80000(0000)
knlGS:0000000000000000
[   56.593199] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   56.593200] CR2: 00007efcd12de370 CR3: 000000044c8bb000 CR4:
00000000003406e0
[   56.593200] Call Trace:
[   56.593252]  ? nvkm_pmu_reset+0x94/0x160 [nouveau]
[   56.593268]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   56.593276]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   56.593291]  nvkm_device_init+0x60/0x270 [nouveau]
[   56.593305]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   56.593313]  nvkm_object_init+0x40/0x190 [nouveau]
[   56.593320]  nvkm_object_init+0x80/0x190 [nouveau]
[   56.593328]  nvkm_client_init+0xe/0x10 [nouveau]
[   56.593343]  nvkm_client_resume+0xe/0x10 [nouveau]
[   56.593350]  nvif_client_resume+0x14/0x20 [nouveau]
[   56.593365]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   56.593379]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   56.593381]  pci_pm_runtime_resume+0x7b/0xa0
[   56.593382]  __rpm_callback+0xc6/0x210
[   56.593383]  ? pci_restore_standard_config+0x40/0x40
[   56.593384]  rpm_callback+0x24/0x80
[   56.593385]  ? pci_restore_standard_config+0x40/0x40
[   56.593385]  rpm_resume+0x47d/0x680
[   56.593400]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   56.593401]  __pm_runtime_resume+0x4f/0x80
[   56.593415]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   56.593417]  ? security_capable+0x48/0x60
[   56.593423]  drm_open+0x205/0x3f0 [drm]
[   56.593428]  drm_stub_open+0xb6/0x110 [drm]
[   56.593429]  chrdev_open+0xbf/0x1b0
[   56.593431]  do_dentry_open+0x1e4/0x310
[   56.593432]  ? cdev_put+0x30/0x30
[   56.593433]  vfs_open+0x4f/0x70
[   56.593434]  ? may_open+0x9b/0x100
[   56.593434]  path_openat+0x2b2/0x1570
[   56.593436]  ? move_addr_to_user+0xba/0xd0
[   56.593437]  do_filp_open+0x91/0x100
[   56.593439]  ? __alloc_fd+0x46/0x170
[   56.593439]  do_sys_open+0x125/0x210
[   56.593440]  SyS_open+0x1e/0x20
[   56.593442]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   56.593442] RIP: 0033:0x7fc8a9085620
[   56.593443] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   56.593443] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   56.593444] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   56.593444] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   56.593444] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   56.593445] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   56.593445] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 43 53 0a bd 48 89 e5 e8 19 ff ff ff b8 ff ff ff ff 5d c3 8b 07 &lt=
;c3&gt; 66
66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[   84.593134] NMI watchdog: BUG: soft lockup - CPU#6 stuck for 23s!
[plymouthd:227]
[   84.593137] Modules linked in: ath9k(+) ath9k_common ath9k_hw kvm_intel(=
+)
ath kvm mac80211 irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
uvcvideo asus_nb_wmi(+) snd_hda_intel(+) aesni_intel asus_wmi aes_x86_64
snd_hda_codec r8169(+) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2
rtsx_pci_ms videobuf2_core sparse_keymap hci_uart videodev ath3k btusb
crypto_simd i2c_designware_platform(+) cryptd i2c_designware_core cfg80211
glue_helper btrtl snd_hwdep input_leds memstick media mii btbcm snd_hda_core
btqca btintel int3403_thermal bluetooth processor_thermal_device snd_pcm
intel_soc_dts_iosf mei_me acpi_als snd_timer acpi_pad tpm_crb idma64 virt_d=
ma
intel_lpss_pci kfifo_buf industrialio int3400_thermal snd intel_lpss_acpi
intel_lpss int340x_thermal_zone mei fjes mac_hid acpi_thermal_rel
[   84.593179]  asus_wireless shpchp soundcore nouveau i915 ttm i2c_algo_bit
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm rtsx_pci_s=
dmmc
mxm_wmi rtsx_pci serio_raw ahci i2c_hid libahci hid video wmi
[   84.593186] CPU: 6 PID: 227 Comm: plymouthd Tainted: G             L  4.=
10.0
#7
[   84.593187] Hardware name: ASUSTeK COMPUTER INC. GL552VXK/GL552VXK, BIOS
GL552VXK.200 11/14/2016
[   84.593188] task: ffff92cd4d0dba00 task.stack: ffffa42d82198000
[   84.593190] RIP: 0010:ioread32+0x30/0x40
[   84.593191] RSP: 0018:ffffa42d8219b7e0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   84.593192] RAX: 00000000ffffffff RBX: ffff92cd4cad3000 RCX:
0000000000000018
[   84.593192] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d83009410
[   84.593193] RBP: ffffa42d8219b800 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   84.593193] R10: 0000000000000000 R11: 000000000000036c R12:
ffff92cd4cad3000
[   84.593194] R13: ffff92cd4cff0480 R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   84.593194] FS:  00007fc8a9987740(0000) GS:ffff92cd6ed80000(0000)
knlGS:0000000000000000
[   84.593195] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   84.593195] CR2: 00007efcd12de370 CR3: 000000044c8bb000 CR4:
00000000003406e0
[   84.593196] Call Trace:
[   84.593231]  ? nv04_timer_read+0x22/0x70 [nouveau]
[   84.593259]  nvkm_timer_read+0xf/0x20 [nouveau]
[   84.593273]  nvkm_pmu_reset+0x71/0x160 [nouveau]
[   84.593285]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   84.593293]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   84.593308]  nvkm_device_init+0x60/0x270 [nouveau]
[   84.593321]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   84.593329]  nvkm_object_init+0x40/0x190 [nouveau]
[   84.593336]  nvkm_object_init+0x80/0x190 [nouveau]
[   84.593344]  nvkm_client_init+0xe/0x10 [nouveau]
[   84.593359]  nvkm_client_resume+0xe/0x10 [nouveau]
[   84.593366]  nvif_client_resume+0x14/0x20 [nouveau]
[   84.593380]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   84.593394]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   84.593396]  pci_pm_runtime_resume+0x7b/0xa0
[   84.593397]  __rpm_callback+0xc6/0x210
[   84.593398]  ? pci_restore_standard_config+0x40/0x40
[   84.593399]  rpm_callback+0x24/0x80
[   84.593400]  ? pci_restore_standard_config+0x40/0x40
[   84.593400]  rpm_resume+0x47d/0x680
[   84.593415]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   84.593415]  __pm_runtime_resume+0x4f/0x80
[   84.593430]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   84.593436]  ? security_capable+0x48/0x60
[   84.593448]  drm_open+0x205/0x3f0 [drm]
[   84.593453]  drm_stub_open+0xb6/0x110 [drm]
[   84.593454]  chrdev_open+0xbf/0x1b0
[   84.593456]  do_dentry_open+0x1e4/0x310
[   84.593457]  ? cdev_put+0x30/0x30
[   84.593458]  vfs_open+0x4f/0x70
[   84.593458]  ? may_open+0x9b/0x100
[   84.593459]  path_openat+0x2b2/0x1570
[   84.593461]  ? move_addr_to_user+0xba/0xd0
[   84.593462]  do_filp_open+0x91/0x100
[   84.593464]  ? __alloc_fd+0x46/0x170
[   84.593464]  do_sys_open+0x125/0x210
[   84.593465]  SyS_open+0x1e/0x20
[   84.593466]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   84.593467] RIP: 0033:0x7fc8a9085620
[   84.593467] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   84.593468] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   84.593469] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   84.593469] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   84.593469] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   84.593470] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   84.593470] Code: 03 00 77 25 48 81 ff 00 00 01 00 76 05 0f b7 d7 ed c3 =
55
48 c7 c6 43 53 0a bd 48 89 e5 e8 19 ff ff ff b8 ff ff ff ff 5d c3 8b 07 &lt=
;c3&gt; 66
66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 48 81 fe ff ff=20
[   91.721133] INFO: rcu_sched self-detected stall on CPU
[   91.721137]         6-...: (15000 ticks this GP) idle=3Dc15/140000000000=
001/0
softirq=3D603/603 fqs=3D7479=20
[   91.721138]          (t=3D15001 jiffies g=3D343 c=3D342 q=3D90238)
[   91.721139] Task dump for CPU 6:
[   91.721139] plymouthd       R  running task        0   227      1 0x0000=
0008
[   91.721140] Call Trace:
[   91.721141]  &lt;IRQ&gt;
[   91.721143]  sched_show_task+0xd5/0x140
[   91.721144]  dump_cpu_task+0x39/0x40
[   91.721169]  rcu_dump_cpu_stacks+0x80/0xbb
[   91.721171]  rcu_check_callbacks+0x71e/0x880
[   91.721172]  ? acct_account_cputime+0x1c/0x20
[   91.721173]  ? account_system_time+0x73/0x100
[   91.721175]  ? tick_sched_do_timer+0x40/0x40
[   91.721176]  update_process_times+0x2f/0x60
[   91.721177]  tick_sched_handle.isra.15+0x25/0x60
[   91.721178]  tick_sched_timer+0x3d/0x70
[   91.721179]  __hrtimer_run_queues+0xe5/0x250
[   91.721180]  hrtimer_interrupt+0xa8/0x1a0
[   91.721182]  local_apic_timer_interrupt+0x38/0x60
[   91.721184]  smp_apic_timer_interrupt+0x38/0x50
[   91.721185]  apic_timer_interrupt+0x89/0x90
[   91.721187] RIP: 0010:ioread32+0x30/0x40
[   91.721187] RSP: 0018:ffffa42d8219b7e0 EFLAGS: 00000296 ORIG_RAX:
ffffffffffffff10
[   91.721188] RAX: 00000000ffffffff RBX: ffff92cd4cad3000 RCX:
0000000000000018
[   91.721189] RDX: ffffffff00000000 RSI: ffffa42d8310a014 RDI:
ffffa42d83009410
[   91.721189] RBP: ffffa42d8219b800 R08: 0000000000000110 R09:
ffffa42d8219b7ec
[   91.721189] R10: 0000000000000000 R11: 000000000000036c R12:
00000000ffffffff
[   91.721190] R13: 00000000ffffffff R14: ffffffffffffffff R15:
ffff92cd4cedf780
[   91.721190]  &lt;/IRQ&gt;
[   91.721222]  ? nv04_timer_read+0x48/0x70 [nouveau]
[   91.721237]  nvkm_timer_read+0xf/0x20 [nouveau]
[   91.721252]  nvkm_pmu_reset+0x71/0x160 [nouveau]
[   91.721265]  nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   91.721274]  nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   91.721290]  nvkm_device_init+0x60/0x270 [nouveau]
[   91.721304]  nvkm_udevice_init+0x48/0x60 [nouveau]
[   91.721313]  nvkm_object_init+0x40/0x190 [nouveau]
[   91.721321]  nvkm_object_init+0x80/0x190 [nouveau]
[   91.721329]  nvkm_client_init+0xe/0x10 [nouveau]
[   91.721345]  nvkm_client_resume+0xe/0x10 [nouveau]
[   91.721353]  nvif_client_resume+0x14/0x20 [nouveau]
[   91.721369]  nouveau_do_resume+0x4d/0x130 [nouveau]
[   91.721384]  nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   91.721386]  pci_pm_runtime_resume+0x7b/0xa0
[   91.721387]  __rpm_callback+0xc6/0x210
[   91.721388]  ? pci_restore_standard_config+0x40/0x40
[   91.721388]  rpm_callback+0x24/0x80
[   91.721389]  ? pci_restore_standard_config+0x40/0x40
[   91.721390]  rpm_resume+0x47d/0x680
[   91.721403]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   91.721404]  __pm_runtime_resume+0x4f/0x80
[   91.721419]  nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   91.721420]  ? security_capable+0x48/0x60
[   91.721426]  drm_open+0x205/0x3f0 [drm]
[   91.721431]  drm_stub_open+0xb6/0x110 [drm]
[   91.721432]  chrdev_open+0xbf/0x1b0
[   91.721433]  do_dentry_open+0x1e4/0x310
[   91.721434]  ? cdev_put+0x30/0x30
[   91.721435]  vfs_open+0x4f/0x70
[   91.721436]  ? may_open+0x9b/0x100
[   91.721437]  path_openat+0x2b2/0x1570
[   91.721438]  ? move_addr_to_user+0xba/0xd0
[   91.721439]  do_filp_open+0x91/0x100
[   91.721441]  ? __alloc_fd+0x46/0x170
[   91.721441]  do_sys_open+0x125/0x210
[   91.721442]  SyS_open+0x1e/0x20
[   91.721443]  entry_SYSCALL_64_fastpath+0x1e/0xad
[   91.721444] RIP: 0033:0x7fc8a9085620
[   91.721444] RSP: 002b:00007ffc0d30b908 EFLAGS: 00000246 ORIG_RAX:
0000000000000002
[   91.721445] RAX: ffffffffffffffda RBX: 0000000001090f40 RCX:
00007fc8a9085620
[   91.721445] RDX: 00007fc8a84582c0 RSI: 0000000000000002 RDI:
0000000001090f00
[   91.721446] RBP: 000000000000000b R08: 000000000108f4c0 R09:
0000000000000002
[   91.721446] R10: 00007fc8a93577b8 R11: 0000000000000246 R12:
000000000000e280
[   91.721447] R13: 00007fc8a9370910 R14: 000000000000000d R15:
000000000108b420
[   92.677178] INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 6=
-...
} 15200 jiffies s: 613 root: 0x40/.
[   92.677181] blocking rcu_node structures:
[   92.677182] Task dump for CPU 6:
[   92.677183] plymouthd       R  running task        0   227      1 0x0000=
0008
[   92.677184] Call Trace:
[   92.677186]  ? irq_work_queue+0xf/0x80
[   92.677189]  ? wake_up_klogd+0x34/0x40
[   92.677190]  ? console_unlock+0x45b/0x480
[   92.677223]  ? nv04_timer_read+0x35/0x70 [nouveau]
[   92.677250]  ? nvkm_timer_read+0xf/0x20 [nouveau]
[   92.677265]  ? nvkm_pmu_reset+0x94/0x160 [nouveau]
[   92.677278]  ? nvkm_pmu_preinit+0x12/0x20 [nouveau]
[   92.677287]  ? nvkm_subdev_preinit+0x34/0x120 [nouveau]
[   92.677302]  ? nvkm_device_init+0x60/0x270 [nouveau]
[   92.677316]  ? nvkm_udevice_init+0x48/0x60 [nouveau]
[   92.677324]  ? nvkm_object_init+0x40/0x190 [nouveau]
[   92.677332]  ? nvkm_object_init+0x80/0x190 [nouveau]
[   92.677340]  ? nvkm_client_init+0xe/0x10 [nouveau]
[   92.677356]  ? nvkm_client_resume+0xe/0x10 [nouveau]
[   92.677364]  ? nvif_client_resume+0x14/0x20 [nouveau]
[   92.677379]  ? nouveau_do_resume+0x4d/0x130 [nouveau]
[   92.677393]  ? nouveau_pmops_runtime_resume+0x72/0x150 [nouveau]
[   92.677395]  ? pci_pm_runtime_resume+0x7b/0xa0
[   92.677396]  ? __rpm_callback+0xc6/0x210
[   92.677397]  ? pci_restore_standard_config+0x40/0x40
[   92.677397]  ? rpm_callback+0x24/0x80
[   92.677398]  ? pci_restore_standard_config+0x40/0x40
[   92.677399]  ? rpm_resume+0x47d/0x680
[   92.677411]  ? i915_gem_timeline_init+0xe/0x10 [i915]
[   92.677412]  ? __pm_runtime_resume+0x4f/0x80
[   92.677427]  ? nouveau_drm_open+0x3b/0x1b0 [nouveau]
[   92.677428]  ? security_capable+0x48/0x60
[   92.677433]  ? drm_open+0x205/0x3f0 [drm]
[   92.677438]  ? drm_stub_open+0xb6/0x110 [drm]
[   92.677439]  ? chrdev_open+0xbf/0x1b0
[   92.677441]  ? do_dentry_open+0x1e4/0x310
[   92.677442]  ? cdev_put+0x30/0x30
[   92.677442]  ? vfs_open+0x4f/0x70
[   92.677443]  ? may_open+0x9b/0x100
[   92.677444]  ? path_openat+0x2b2/0x1570
[   92.677445]  ? move_addr_to_user+0xba/0xd0
[   92.677446]  ? do_filp_open+0x91/0x100
[   92.677448]  ? __alloc_fd+0x46/0x170
[   92.677448]  ? do_sys_open+0x125/0x210
[   92.677449]  ? SyS_open+0x1e/0x20
[   92.677450]  ? entry_SYSCALL_64_fastpath+0x1e/0xad

It does NOT seem to be a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau produces soft lockups"
   href=3D"show_bug.cgi?id=3D99385">bug 99385</a> since this machine's DSDT=
 does
not have a call to LKDS, and the symptom here is a complete hang during boo=
tup.
I'm attaching the full kernel log on Linux v4.10 and the DSDT.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14884642790.7CC4.17962--

--===============1091860751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1091860751==--

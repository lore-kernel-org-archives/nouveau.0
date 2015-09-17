From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92032] New: WARNING: CPU: 0 PID: 290 at
 lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
Date: Thu, 17 Sep 2015 18:34:24 +0000
Message-ID: <bug-92032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2030847614=="
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


--===============2030847614==
Content-Type: multipart/alternative; boundary="1442514864.3dAd33621.25425"; charset="UTF-8"


--1442514864.3dAd33621.25425
Date: Thu, 17 Sep 2015 18:34:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92032

            Bug ID: 92032
           Summary: WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205
                    check_sync+0x169/0x6e0()
           Product: xorg
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Chipset: NV34 (NV34)
Family : NV30


- 4.2.0-301.fc23.i686+debug:

[   37.496517] ------------[ cut here ]------------
[   37.496556] WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205
check_sync+0x169/0x6e0()
[   37.496576] nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x00000000c0bf59a8] [size=4096
bytes]
[   37.496601] Modules linked in: nouveau(+) mxm_wmi wmi ... video i2c_algo_bit
... ttm ... drm_kms_helper ... drm ...
[   37.496722] CPU: 0 PID: 290 Comm: systemd-udevd Not tainted
4.2.0-301.fc23.i686+debug #1
...
[   37.496841] Call Trace:
[   37.496856]  [<c0b91ed7>] dump_stack+0x48/0x60
[   37.496872]  [<c0463d77>] warn_slowpath_common+0x87/0xc0
[   37.496887]  [<c07b93a9>] ? check_sync+0x169/0x6e0
[   37.496901]  [<c07b93a9>] ? check_sync+0x169/0x6e0
[   37.496914]  [<c0463dee>] warn_slowpath_fmt+0x3e/0x60
[   37.496928]  [<c07b93a9>] check_sync+0x169/0x6e0
[   37.496945]  [<c049a949>] ? sched_clock_local+0x49/0x180
[   37.496961]  [<c07b9a2d>] debug_dma_sync_single_for_device+0x7d/0x90
[   37.496989]  [<f7e22298>] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
[   37.497006]  [<c040b650>] ? text_poke_bp+0xd0/0xd0
[   37.497144]  [<f85ba340>] nouveau_bo_sync_for_device+0x80/0xc0 [nouveau]
[   37.497228]  [<f85ba474>] nouveau_bo_validate+0x34/0x40 [nouveau]
[   37.497310]  [<f85ba608>] nouveau_bo_pin+0x188/0x290 [nouveau]
[   37.497391]  [<f85b8b60>] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
[   37.497413]  [<f85cd830>] nouveau_channel_prep+0x140/0x330 [nouveau]
[   37.497413]  [<f85cda92>] nouveau_channel_new+0x72/0x770 [nouveau]
[   37.497413]  [<f85baa27>] ? nouveau_bo_wr32+0x37/0x60 [nouveau]
[   37.497413]  [<f85b56e7>] nouveau_accel_init+0x157/0x4e0 [nouveau]
[   37.497413]  [<c05dda14>] ? kmem_cache_alloc_trace+0x364/0x3e0
[   37.497413]  [<f85b7431>] ? nouveau_hwmon_init+0x41/0x1d0 [nouveau]
[   37.497413]  [<f85b6140>] nouveau_drm_load+0x3f0/0x5e0 [nouveau]
[   37.497413]  [<f7e45066>] drm_dev_register+0x96/0xe0 [drm]
[   37.497413]  [<f7e47b89>] drm_get_pci_dev+0x79/0x1c0 [drm]
[   37.497413]  [<c07d9c1e>] ? pcibios_set_master+0x4e/0xa0
[   37.497413]  [<f85b654e>] nouveau_drm_probe+0x21e/0x260 [nouveau]
[   37.497413]  [<c07dc24f>] pci_device_probe+0x6f/0xd0
[   37.497413]  [<c0674b35>] ? sysfs_create_link+0x25/0x50
[   37.497413]  [<c08c288d>] driver_probe_device+0x1cd/0x460
[   37.497413]  [<c08c2b6c>] ? __driver_attach+0x4c/0x90
[   37.497413]  [<c07dc182>] ? pci_match_device+0xd2/0x100
[   37.497413]  [<c08c2ba1>] __driver_attach+0x81/0x90
[   37.497413]  [<c08c2b20>] ? driver_probe_device+0x460/0x460
[   37.497413]  [<c08c06b7>] bus_for_each_dev+0x57/0xa0
[   37.497413]  [<c08c20ce>] driver_attach+0x1e/0x20
[   37.497413]  [<c08c2b20>] ? driver_probe_device+0x460/0x460
[   37.497413]  [<c08c1c6f>] bus_add_driver+0x1ef/0x290
[   37.497413]  [<c08c39cd>] driver_register+0x5d/0xf0
[   37.497413]  [<c07dabfa>] __pci_register_driver+0x4a/0x50
[   37.497413]  [<f7e47dad>] drm_pci_init+0xdd/0x100 [drm]
[   37.497413]  [<f7ee01f9>] nouveau_drm_init+0x1f9/0x1000 [nouveau]
[   37.497413]  [<f7ee0000>] ? 0xf7ee0000
[   37.497413]  [<c040047a>] do_one_initcall+0xaa/0x200
[   37.497413]  [<f7ee0000>] ? 0xf7ee0000
[   37.497413]  [<c0b94aeb>] ? preempt_schedule_common+0x1b/0x40
[   37.497413]  [<c05dda14>] ? kmem_cache_alloc_trace+0x364/0x3e0
[   37.497413]  [<c0b91445>] ? do_init_module+0x21/0x1b7
[   37.497413]  [<c0b91445>] ? do_init_module+0x21/0x1b7
[   37.497413]  [<c0b91474>] do_init_module+0x50/0x1b7
[   37.497413]  [<c050909c>] load_module+0x1ebc/0x2550
[   37.497413]  [<c049ad43>] ? local_clock+0x13/0x20
[   37.497413]  [<c0509877>] SyS_init_module+0x147/0x1a0
[   37.497413]  [<c04be63c>] ? trace_hardirqs_on_caller+0x12c/0x1d0
[   37.497413]  [<c052711c>] ? __audit_syscall_entry+0x8c/0xe0
[   37.497413]  [<c0b9ad2f>] sysenter_do_call+0x12/0x12
[   37.497413] ---[ end trace 5b24249d32c8d739 ]---


- 4.3.0-0.rc1.git2.1.fc24.i686:

[   38.655947] ------------[ cut here ]------------
[   38.655986] WARNING: CPU: 0 PID: 284 at lib/dma-debug.c:1205
check_sync+0x169/0x6e0()
[   38.656006] nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x00000000c0bf34a8] [size=4096
bytes]
[   38.656031] Modules linked in: nouveau(+) mxm_wmi ...wmi ... video ...
i2c_algo_bit ttm drm_kms_helper ... drm ...
[   38.656036] CPU: 0 PID: 284 Comm: systemd-udevd Not tainted
4.3.0-0.rc1.git2.1.fc24.i686 #1
...
[   38.656036] Call Trace:
[   38.656036]  [<c0787c8f>] dump_stack+0x48/0x69
[   38.656036]  [<c0461f47>] warn_slowpath_common+0x87/0xc0
[   38.656036]  [<c07b6909>] ? check_sync+0x169/0x6e0
[   38.656036]  [<c07b6909>] ? check_sync+0x169/0x6e0
[   38.656036]  [<c0461fbe>] warn_slowpath_fmt+0x3e/0x60
[   38.656036]  [<c07b6909>] check_sync+0x169/0x6e0
[   38.656036]  [<c0497909>] ? sched_clock_local+0x49/0x180
[   38.656036]  [<c07b6f8d>] debug_dma_sync_single_for_device+0x7d/0x90
[   38.656036]  [<f7ec0298>] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
[   38.656036]  [<c040bfa0>] ? text_poke_bp+0xd0/0xd0
[   38.656036]  [<f85d666b>] nouveau_bo_sync_for_device+0x8b/0xa0 [nouveau]
[   38.656036]  [<f85d6754>] nouveau_bo_validate+0x34/0x40 [nouveau]
[   38.656036]  [<f85d68e8>] nouveau_bo_pin+0x188/0x290 [nouveau]
[   38.656036]  [<f85d4f70>] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
[   38.656036]  [<f85e96ad>] nouveau_channel_prep+0xfd/0x2c0 [nouveau]
[   38.656036]  [<f85e98c7>] nouveau_channel_new+0x57/0x7a0 [nouveau]
[   38.656036]  [<c05da0fc>] ? kfree+0xdc/0x280
[   38.656036]  [<f853d082>] ? nvif_object_sclass_put+0x12/0x20 [nouveau]
[   38.656036]  [<f85d25f6>] nouveau_drm_load+0x596/0x8d0 [nouveau]
[   38.656036]  [<c04bbfac>] ? trace_hardirqs_on_caller+0x12c/0x1d0
[   38.656036]  [<f7e7df79>] ? drm_minor_register+0x89/0x120 [drm]
[   38.656036]  [<f7e7e0a6>] drm_dev_register+0x96/0xa0 [drm]
[   38.656036]  [<f7e80c79>] drm_get_pci_dev+0x79/0x1c0 [drm]
[   38.656036]  [<c07d70be>] ? pcibios_set_master+0x4e/0xa0
[   38.656036]  [<f85d2b1e>] nouveau_drm_probe+0x1ee/0x220 [nouveau]
[   38.656036]  [<c07d98bb>] pci_device_probe+0x7b/0xf0
[   38.656036]  [<c08bcbc6>] ? devices_kset_move_last+0x56/0xa0
[   38.656036]  [<c08c0644>] driver_probe_device+0x204/0x490
[   38.656036]  [<c08c091c>] ? __driver_attach+0x4c/0x90
[   38.656036]  [<c07d9582>] ? pci_match_device+0xd2/0x100
[   38.656036]  [<c08c0951>] __driver_attach+0x81/0x90
[   38.656036]  [<c08c08d0>] ? driver_probe_device+0x490/0x490
[   38.656036]  [<c08be3f7>] bus_for_each_dev+0x57/0xa0
[   38.656036]  [<c08bfe2e>] driver_attach+0x1e/0x20
[   38.656036]  [<c08c08d0>] ? driver_probe_device+0x490/0x490
[   38.656036]  [<c08bf9af>] bus_add_driver+0x1ef/0x290
[   38.656036]  [<c08c143d>] driver_register+0x5d/0xf0
[   38.656036]  [<c07d809a>] __pci_register_driver+0x4a/0x50
[   38.656036]  [<f7e80e9d>] drm_pci_init+0xdd/0x100 [drm]
[   38.656036]  [<f7ef01f9>] nouveau_drm_init+0x1f9/0x1000 [nouveau]
[   38.656036]  [<f7ef0000>] ? 0xf7ef0000
[   38.656036]  [<c040047a>] do_one_initcall+0xaa/0x200
[   38.656036]  [<f7ef0000>] ? 0xf7ef0000
[   38.656036]  [<c04dadc2>] ? rcu_read_lock_sched_held+0x42/0x80
[   38.656036]  [<c05daa8d>] ? kmem_cache_alloc_trace+0x23d/0x310
[   38.656036]  [<c0582bc1>] ? do_init_module+0x21/0x1b7
[   38.656036]  [<c0582bc1>] ? do_init_module+0x21/0x1b7
[   38.656036]  [<c0582bf0>] do_init_module+0x50/0x1b7
[   38.656036]  [<c050370c>] load_module+0x1ebc/0x2550
[   38.656036]  [<c0497d03>] ? local_clock+0x13/0x20
[   38.656036]  [<c0503ee7>] SyS_init_module+0x147/0x1a0
[   38.656036]  [<c04012c4>] ? do_audit_syscall_entry.isra.9+0x44/0x50
[   38.656036]  [<c0401627>] ? syscall_trace_enter_phase1+0x107/0x130
[   38.656036]  [<c0b96cc5>] syscall_call+0x7/0x7
[   38.656036] ---[ end trace d37eab05b9013f5b ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1442514864.3dAd33621.25425
Date: Thu, 17 Sep 2015 18:34:24 +0000
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
   title="NEW - WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92032">92032</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>pomidorabelisima&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Chipset: NV34 (NV34)
Family : NV30


- 4.2.0-301.fc23.i686+debug:

[   37.496517] ------------[ cut here ]------------
[   37.496556] WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205
check_sync+0x169/0x6e0()
[   37.496576] nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x00000000c0bf59a8] [size=4096
bytes]
[   37.496601] Modules linked in: nouveau(+) mxm_wmi wmi ... video i2c_algo_bit
... ttm ... drm_kms_helper ... drm ...
[   37.496722] CPU: 0 PID: 290 Comm: systemd-udevd Not tainted
4.2.0-301.fc23.i686+debug #1
...
[   37.496841] Call Trace:
[   37.496856]  [&lt;c0b91ed7&gt;] dump_stack+0x48/0x60
[   37.496872]  [&lt;c0463d77&gt;] warn_slowpath_common+0x87/0xc0
[   37.496887]  [&lt;c07b93a9&gt;] ? check_sync+0x169/0x6e0
[   37.496901]  [&lt;c07b93a9&gt;] ? check_sync+0x169/0x6e0
[   37.496914]  [&lt;c0463dee&gt;] warn_slowpath_fmt+0x3e/0x60
[   37.496928]  [&lt;c07b93a9&gt;] check_sync+0x169/0x6e0
[   37.496945]  [&lt;c049a949&gt;] ? sched_clock_local+0x49/0x180
[   37.496961]  [&lt;c07b9a2d&gt;] debug_dma_sync_single_for_device+0x7d/0x90
[   37.496989]  [&lt;f7e22298&gt;] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
[   37.497006]  [&lt;c040b650&gt;] ? text_poke_bp+0xd0/0xd0
[   37.497144]  [&lt;f85ba340&gt;] nouveau_bo_sync_for_device+0x80/0xc0 [nouveau]
[   37.497228]  [&lt;f85ba474&gt;] nouveau_bo_validate+0x34/0x40 [nouveau]
[   37.497310]  [&lt;f85ba608&gt;] nouveau_bo_pin+0x188/0x290 [nouveau]
[   37.497391]  [&lt;f85b8b60&gt;] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
[   37.497413]  [&lt;f85cd830&gt;] nouveau_channel_prep+0x140/0x330 [nouveau]
[   37.497413]  [&lt;f85cda92&gt;] nouveau_channel_new+0x72/0x770 [nouveau]
[   37.497413]  [&lt;f85baa27&gt;] ? nouveau_bo_wr32+0x37/0x60 [nouveau]
[   37.497413]  [&lt;f85b56e7&gt;] nouveau_accel_init+0x157/0x4e0 [nouveau]
[   37.497413]  [&lt;c05dda14&gt;] ? kmem_cache_alloc_trace+0x364/0x3e0
[   37.497413]  [&lt;f85b7431&gt;] ? nouveau_hwmon_init+0x41/0x1d0 [nouveau]
[   37.497413]  [&lt;f85b6140&gt;] nouveau_drm_load+0x3f0/0x5e0 [nouveau]
[   37.497413]  [&lt;f7e45066&gt;] drm_dev_register+0x96/0xe0 [drm]
[   37.497413]  [&lt;f7e47b89&gt;] drm_get_pci_dev+0x79/0x1c0 [drm]
[   37.497413]  [&lt;c07d9c1e&gt;] ? pcibios_set_master+0x4e/0xa0
[   37.497413]  [&lt;f85b654e&gt;] nouveau_drm_probe+0x21e/0x260 [nouveau]
[   37.497413]  [&lt;c07dc24f&gt;] pci_device_probe+0x6f/0xd0
[   37.497413]  [&lt;c0674b35&gt;] ? sysfs_create_link+0x25/0x50
[   37.497413]  [&lt;c08c288d&gt;] driver_probe_device+0x1cd/0x460
[   37.497413]  [&lt;c08c2b6c&gt;] ? __driver_attach+0x4c/0x90
[   37.497413]  [&lt;c07dc182&gt;] ? pci_match_device+0xd2/0x100
[   37.497413]  [&lt;c08c2ba1&gt;] __driver_attach+0x81/0x90
[   37.497413]  [&lt;c08c2b20&gt;] ? driver_probe_device+0x460/0x460
[   37.497413]  [&lt;c08c06b7&gt;] bus_for_each_dev+0x57/0xa0
[   37.497413]  [&lt;c08c20ce&gt;] driver_attach+0x1e/0x20
[   37.497413]  [&lt;c08c2b20&gt;] ? driver_probe_device+0x460/0x460
[   37.497413]  [&lt;c08c1c6f&gt;] bus_add_driver+0x1ef/0x290
[   37.497413]  [&lt;c08c39cd&gt;] driver_register+0x5d/0xf0
[   37.497413]  [&lt;c07dabfa&gt;] __pci_register_driver+0x4a/0x50
[   37.497413]  [&lt;f7e47dad&gt;] drm_pci_init+0xdd/0x100 [drm]
[   37.497413]  [&lt;f7ee01f9&gt;] nouveau_drm_init+0x1f9/0x1000 [nouveau]
[   37.497413]  [&lt;f7ee0000&gt;] ? 0xf7ee0000
[   37.497413]  [&lt;c040047a&gt;] do_one_initcall+0xaa/0x200
[   37.497413]  [&lt;f7ee0000&gt;] ? 0xf7ee0000
[   37.497413]  [&lt;c0b94aeb&gt;] ? preempt_schedule_common+0x1b/0x40
[   37.497413]  [&lt;c05dda14&gt;] ? kmem_cache_alloc_trace+0x364/0x3e0
[   37.497413]  [&lt;c0b91445&gt;] ? do_init_module+0x21/0x1b7
[   37.497413]  [&lt;c0b91445&gt;] ? do_init_module+0x21/0x1b7
[   37.497413]  [&lt;c0b91474&gt;] do_init_module+0x50/0x1b7
[   37.497413]  [&lt;c050909c&gt;] load_module+0x1ebc/0x2550
[   37.497413]  [&lt;c049ad43&gt;] ? local_clock+0x13/0x20
[   37.497413]  [&lt;c0509877&gt;] SyS_init_module+0x147/0x1a0
[   37.497413]  [&lt;c04be63c&gt;] ? trace_hardirqs_on_caller+0x12c/0x1d0
[   37.497413]  [&lt;c052711c&gt;] ? __audit_syscall_entry+0x8c/0xe0
[   37.497413]  [&lt;c0b9ad2f&gt;] sysenter_do_call+0x12/0x12
[   37.497413] ---[ end trace 5b24249d32c8d739 ]---


- 4.3.0-0.rc1.git2.1.fc24.i686:

[   38.655947] ------------[ cut here ]------------
[   38.655986] WARNING: CPU: 0 PID: 284 at lib/dma-debug.c:1205
check_sync+0x169/0x6e0()
[   38.656006] nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA
memory it has not allocated [device address=0x00000000c0bf34a8] [size=4096
bytes]
[   38.656031] Modules linked in: nouveau(+) mxm_wmi ...wmi ... video ...
i2c_algo_bit ttm drm_kms_helper ... drm ...
[   38.656036] CPU: 0 PID: 284 Comm: systemd-udevd Not tainted
4.3.0-0.rc1.git2.1.fc24.i686 #1
...
[   38.656036] Call Trace:
[   38.656036]  [&lt;c0787c8f&gt;] dump_stack+0x48/0x69
[   38.656036]  [&lt;c0461f47&gt;] warn_slowpath_common+0x87/0xc0
[   38.656036]  [&lt;c07b6909&gt;] ? check_sync+0x169/0x6e0
[   38.656036]  [&lt;c07b6909&gt;] ? check_sync+0x169/0x6e0
[   38.656036]  [&lt;c0461fbe&gt;] warn_slowpath_fmt+0x3e/0x60
[   38.656036]  [&lt;c07b6909&gt;] check_sync+0x169/0x6e0
[   38.656036]  [&lt;c0497909&gt;] ? sched_clock_local+0x49/0x180
[   38.656036]  [&lt;c07b6f8d&gt;] debug_dma_sync_single_for_device+0x7d/0x90
[   38.656036]  [&lt;f7ec0298&gt;] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
[   38.656036]  [&lt;c040bfa0&gt;] ? text_poke_bp+0xd0/0xd0
[   38.656036]  [&lt;f85d666b&gt;] nouveau_bo_sync_for_device+0x8b/0xa0 [nouveau]
[   38.656036]  [&lt;f85d6754&gt;] nouveau_bo_validate+0x34/0x40 [nouveau]
[   38.656036]  [&lt;f85d68e8&gt;] nouveau_bo_pin+0x188/0x290 [nouveau]
[   38.656036]  [&lt;f85d4f70&gt;] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
[   38.656036]  [&lt;f85e96ad&gt;] nouveau_channel_prep+0xfd/0x2c0 [nouveau]
[   38.656036]  [&lt;f85e98c7&gt;] nouveau_channel_new+0x57/0x7a0 [nouveau]
[   38.656036]  [&lt;c05da0fc&gt;] ? kfree+0xdc/0x280
[   38.656036]  [&lt;f853d082&gt;] ? nvif_object_sclass_put+0x12/0x20 [nouveau]
[   38.656036]  [&lt;f85d25f6&gt;] nouveau_drm_load+0x596/0x8d0 [nouveau]
[   38.656036]  [&lt;c04bbfac&gt;] ? trace_hardirqs_on_caller+0x12c/0x1d0
[   38.656036]  [&lt;f7e7df79&gt;] ? drm_minor_register+0x89/0x120 [drm]
[   38.656036]  [&lt;f7e7e0a6&gt;] drm_dev_register+0x96/0xa0 [drm]
[   38.656036]  [&lt;f7e80c79&gt;] drm_get_pci_dev+0x79/0x1c0 [drm]
[   38.656036]  [&lt;c07d70be&gt;] ? pcibios_set_master+0x4e/0xa0
[   38.656036]  [&lt;f85d2b1e&gt;] nouveau_drm_probe+0x1ee/0x220 [nouveau]
[   38.656036]  [&lt;c07d98bb&gt;] pci_device_probe+0x7b/0xf0
[   38.656036]  [&lt;c08bcbc6&gt;] ? devices_kset_move_last+0x56/0xa0
[   38.656036]  [&lt;c08c0644&gt;] driver_probe_device+0x204/0x490
[   38.656036]  [&lt;c08c091c&gt;] ? __driver_attach+0x4c/0x90
[   38.656036]  [&lt;c07d9582&gt;] ? pci_match_device+0xd2/0x100
[   38.656036]  [&lt;c08c0951&gt;] __driver_attach+0x81/0x90
[   38.656036]  [&lt;c08c08d0&gt;] ? driver_probe_device+0x490/0x490
[   38.656036]  [&lt;c08be3f7&gt;] bus_for_each_dev+0x57/0xa0
[   38.656036]  [&lt;c08bfe2e&gt;] driver_attach+0x1e/0x20
[   38.656036]  [&lt;c08c08d0&gt;] ? driver_probe_device+0x490/0x490
[   38.656036]  [&lt;c08bf9af&gt;] bus_add_driver+0x1ef/0x290
[   38.656036]  [&lt;c08c143d&gt;] driver_register+0x5d/0xf0
[   38.656036]  [&lt;c07d809a&gt;] __pci_register_driver+0x4a/0x50
[   38.656036]  [&lt;f7e80e9d&gt;] drm_pci_init+0xdd/0x100 [drm]
[   38.656036]  [&lt;f7ef01f9&gt;] nouveau_drm_init+0x1f9/0x1000 [nouveau]
[   38.656036]  [&lt;f7ef0000&gt;] ? 0xf7ef0000
[   38.656036]  [&lt;c040047a&gt;] do_one_initcall+0xaa/0x200
[   38.656036]  [&lt;f7ef0000&gt;] ? 0xf7ef0000
[   38.656036]  [&lt;c04dadc2&gt;] ? rcu_read_lock_sched_held+0x42/0x80
[   38.656036]  [&lt;c05daa8d&gt;] ? kmem_cache_alloc_trace+0x23d/0x310
[   38.656036]  [&lt;c0582bc1&gt;] ? do_init_module+0x21/0x1b7
[   38.656036]  [&lt;c0582bc1&gt;] ? do_init_module+0x21/0x1b7
[   38.656036]  [&lt;c0582bf0&gt;] do_init_module+0x50/0x1b7
[   38.656036]  [&lt;c050370c&gt;] load_module+0x1ebc/0x2550
[   38.656036]  [&lt;c0497d03&gt;] ? local_clock+0x13/0x20
[   38.656036]  [&lt;c0503ee7&gt;] SyS_init_module+0x147/0x1a0
[   38.656036]  [&lt;c04012c4&gt;] ? do_audit_syscall_entry.isra.9+0x44/0x50
[   38.656036]  [&lt;c0401627&gt;] ? syscall_trace_enter_phase1+0x107/0x130
[   38.656036]  [&lt;c0b96cc5&gt;] syscall_call+0x7/0x7
[   38.656036] ---[ end trace d37eab05b9013f5b ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1442514864.3dAd33621.25425--

--===============2030847614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2030847614==--

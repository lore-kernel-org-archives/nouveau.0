From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92032] NV30: WARNING: CPU: 0 PID: 290 at
 lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
Date: Thu, 12 Nov 2015 19:12:02 +0000
Message-ID: <bug-92032-8800-ORmN7U8eBG@http.bugs.freedesktop.org/>
References: <bug-92032-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1018339297=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92032-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1018339297==
Content-Type: multipart/alternative; boundary="1447355522.7eBaca1.29406"; charset="UTF-8"


--1447355522.7eBaca1.29406
Date: Thu, 12 Nov 2015 19:12:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92032

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

------------[ cut here ]------------
WARNING: CPU: 0 PID: 313 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA memory it has
not allocated [device address=0x00000000c0bf6468] [size=4096 bytes]
Modules linked in: nouveau(+) ...
CPU: 0 PID: 313 Comm: systemd-udevd Not tainted 4.3.0-3.fc22.i686+debug #1
...
Call Trace:
 [<c078a28f>] dump_stack+0x48/0x69
 [<c0461fc7>] warn_slowpath_common+0x87/0xc0
 [<c07b9029>] ? check_sync+0x169/0x6e0
 [<c07b9029>] ? check_sync+0x169/0x6e0
 [<c046203e>] warn_slowpath_fmt+0x3e/0x60
 [<c07b9029>] check_sync+0x169/0x6e0
 [<c07b96ad>] debug_dma_sync_single_for_device+0x7d/0x90
 [<f7ece298>] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
 [<c040bef0>] ? text_poke_bp+0xd0/0xd0
 [<f85d96db>] nouveau_bo_sync_for_device+0x8b/0xa0 [nouveau]
 [<f85d97c4>] nouveau_bo_validate+0x34/0x40 [nouveau]
 [<f85d9958>] nouveau_bo_pin+0x188/0x290 [nouveau]
 [<f85d7fe0>] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
 [<f85ec7fd>] nouveau_channel_prep+0xfd/0x2c0 [nouveau]
 [<f85eca17>] nouveau_channel_new+0x57/0x7a0 [nouveau]
 [<c05da57c>] ? kfree+0xdc/0x280
 [<f8540082>] ? nvif_object_sclass_put+0x12/0x20 [nouveau]
 [<f85d5666>] nouveau_drm_load+0x596/0x8d0 [nouveau]
 [<c04bc14c>] ? trace_hardirqs_on_caller+0x12c/0x1d0
 [<f7e8bfe9>] ? drm_minor_register+0x89/0x120 [drm]
 [<f7e8c116>] drm_dev_register+0x96/0xa0 [drm]
 [<f7e8ece9>] drm_get_pci_dev+0x79/0x1c0 [drm]
 [<c07d973e>] ? pcibios_set_master+0x4e/0xa0
 [<f85d5b8e>] nouveau_drm_probe+0x1ee/0x220 [nouveau]
 [<c07dbf3b>] pci_device_probe+0x7b/0xf0
 [<c08bf366>] ? devices_kset_move_last+0x56/0xa0
 [<c08c2de4>] driver_probe_device+0x204/0x490
 [<c08c30bc>] ? __driver_attach+0x4c/0x90
 [<c07dbc02>] ? pci_match_device+0xd2/0x100
 [<c08c30f1>] __driver_attach+0x81/0x90
 [<c08c3070>] ? driver_probe_device+0x490/0x490
 [<c08c0b97>] bus_for_each_dev+0x57/0xa0
 [<c08c25ce>] driver_attach+0x1e/0x20
 [<c08c3070>] ? driver_probe_device+0x490/0x490
 [<c08c214f>] bus_add_driver+0x1ef/0x290
 [<c08c3bdd>] driver_register+0x5d/0xf0
 [<c07da71a>] __pci_register_driver+0x4a/0x50
 [<f7e8ef0d>] drm_pci_init+0xdd/0x100 [drm]
 [<f7f211f9>] nouveau_drm_init+0x1f9/0x1000 [nouveau]
 [<f7f21000>] ? 0xf7f21000
 [<c040047a>] do_one_initcall+0xaa/0x200
 [<f7f21000>] ? 0xf7f21000
 [<c04dae42>] ? rcu_read_lock_sched_held+0x42/0x80
 [<c05daf0d>] ? kmem_cache_alloc_trace+0x23d/0x310
 [<c0582dd1>] ? do_init_module+0x21/0x1b7
 [<c0582dd1>] ? do_init_module+0x21/0x1b7
 [<c0582e00>] do_init_module+0x50/0x1b7
 [<c05036ec>] load_module+0x1ebc/0x2550
 [<c0b993d7>] ? _raw_spin_unlock_irq+0x27/0x40
 [<c048e6aa>] ? finish_task_switch+0x8a/0x1d0
 [<c0503ec7>] SyS_init_module+0x147/0x1a0
 [<c04012c4>] ? do_audit_syscall_entry.isra.9+0x44/0x50
 [<c0401627>] ? syscall_trace_enter_phase1+0x107/0x130
 [<c0b99f05>] syscall_call+0x7/0x7
---[ end trace d3c14159641a1388 ]---

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447355522.7eBaca1.29406
Date: Thu, 12 Nov 2015 19:12:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92032#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - NV30: WARNING: CPU: 0 PID: 290 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92032">bug 92032</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
------------[ cut here ]------------
WARNING: CPU: 0 PID: 313 at lib/dma-debug.c:1205 check_sync+0x169/0x6e0()
nouveau 0000:01:00.0: DMA-API: device driver tries to sync DMA memory it has
not allocated [device address=0x00000000c0bf6468] [size=4096 bytes]
Modules linked in: nouveau(+) ...
CPU: 0 PID: 313 Comm: systemd-udevd Not tainted 4.3.0-3.fc22.i686+debug #1
...
Call Trace:
 [&lt;c078a28f&gt;] dump_stack+0x48/0x69
 [&lt;c0461fc7&gt;] warn_slowpath_common+0x87/0xc0
 [&lt;c07b9029&gt;] ? check_sync+0x169/0x6e0
 [&lt;c07b9029&gt;] ? check_sync+0x169/0x6e0
 [&lt;c046203e&gt;] warn_slowpath_fmt+0x3e/0x60
 [&lt;c07b9029&gt;] check_sync+0x169/0x6e0
 [&lt;c07b96ad&gt;] debug_dma_sync_single_for_device+0x7d/0x90
 [&lt;f7ece298&gt;] ? ttm_bo_del_sub_from_lru+0x18/0x50 [ttm]
 [&lt;c040bef0&gt;] ? text_poke_bp+0xd0/0xd0
 [&lt;f85d96db&gt;] nouveau_bo_sync_for_device+0x8b/0xa0 [nouveau]
 [&lt;f85d97c4&gt;] nouveau_bo_validate+0x34/0x40 [nouveau]
 [&lt;f85d9958&gt;] nouveau_bo_pin+0x188/0x290 [nouveau]
 [&lt;f85d7fe0&gt;] ? nv10_bo_put_tile_region+0x80/0x80 [nouveau]
 [&lt;f85ec7fd&gt;] nouveau_channel_prep+0xfd/0x2c0 [nouveau]
 [&lt;f85eca17&gt;] nouveau_channel_new+0x57/0x7a0 [nouveau]
 [&lt;c05da57c&gt;] ? kfree+0xdc/0x280
 [&lt;f8540082&gt;] ? nvif_object_sclass_put+0x12/0x20 [nouveau]
 [&lt;f85d5666&gt;] nouveau_drm_load+0x596/0x8d0 [nouveau]
 [&lt;c04bc14c&gt;] ? trace_hardirqs_on_caller+0x12c/0x1d0
 [&lt;f7e8bfe9&gt;] ? drm_minor_register+0x89/0x120 [drm]
 [&lt;f7e8c116&gt;] drm_dev_register+0x96/0xa0 [drm]
 [&lt;f7e8ece9&gt;] drm_get_pci_dev+0x79/0x1c0 [drm]
 [&lt;c07d973e&gt;] ? pcibios_set_master+0x4e/0xa0
 [&lt;f85d5b8e&gt;] nouveau_drm_probe+0x1ee/0x220 [nouveau]
 [&lt;c07dbf3b&gt;] pci_device_probe+0x7b/0xf0
 [&lt;c08bf366&gt;] ? devices_kset_move_last+0x56/0xa0
 [&lt;c08c2de4&gt;] driver_probe_device+0x204/0x490
 [&lt;c08c30bc&gt;] ? __driver_attach+0x4c/0x90
 [&lt;c07dbc02&gt;] ? pci_match_device+0xd2/0x100
 [&lt;c08c30f1&gt;] __driver_attach+0x81/0x90
 [&lt;c08c3070&gt;] ? driver_probe_device+0x490/0x490
 [&lt;c08c0b97&gt;] bus_for_each_dev+0x57/0xa0
 [&lt;c08c25ce&gt;] driver_attach+0x1e/0x20
 [&lt;c08c3070&gt;] ? driver_probe_device+0x490/0x490
 [&lt;c08c214f&gt;] bus_add_driver+0x1ef/0x290
 [&lt;c08c3bdd&gt;] driver_register+0x5d/0xf0
 [&lt;c07da71a&gt;] __pci_register_driver+0x4a/0x50
 [&lt;f7e8ef0d&gt;] drm_pci_init+0xdd/0x100 [drm]
 [&lt;f7f211f9&gt;] nouveau_drm_init+0x1f9/0x1000 [nouveau]
 [&lt;f7f21000&gt;] ? 0xf7f21000
 [&lt;c040047a&gt;] do_one_initcall+0xaa/0x200
 [&lt;f7f21000&gt;] ? 0xf7f21000
 [&lt;c04dae42&gt;] ? rcu_read_lock_sched_held+0x42/0x80
 [&lt;c05daf0d&gt;] ? kmem_cache_alloc_trace+0x23d/0x310
 [&lt;c0582dd1&gt;] ? do_init_module+0x21/0x1b7
 [&lt;c0582dd1&gt;] ? do_init_module+0x21/0x1b7
 [&lt;c0582e00&gt;] do_init_module+0x50/0x1b7
 [&lt;c05036ec&gt;] load_module+0x1ebc/0x2550
 [&lt;c0b993d7&gt;] ? _raw_spin_unlock_irq+0x27/0x40
 [&lt;c048e6aa&gt;] ? finish_task_switch+0x8a/0x1d0
 [&lt;c0503ec7&gt;] SyS_init_module+0x147/0x1a0
 [&lt;c04012c4&gt;] ? do_audit_syscall_entry.isra.9+0x44/0x50
 [&lt;c0401627&gt;] ? syscall_trace_enter_phase1+0x107/0x130
 [&lt;c0b99f05&gt;] syscall_call+0x7/0x7
---[ end trace d3c14159641a1388 ]---</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447355522.7eBaca1.29406--

--===============1018339297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1018339297==--

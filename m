From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau: HARDIRQ-safe -> HARDIRQ-unsafe lock order
	detected
Date: Sun, 16 Jan 2011 00:23:26 +0100
Message-ID: <20110115232326.GB2980@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

On 2.6.37 kernel during X reloading:

[  718.868720] [drm] nouveau 0000:02:00.0: nouveau_channel_free: freeing fifo 2
[  718.883387] 
[  718.883388] ======================================================
[  718.883392] [ INFO: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected ]
[  718.883396] 2.6.37+ #521
[  718.883398] ------------------------------------------------------
[  718.883402] X/2431 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
[  718.883405]  (&(&dev_priv->ramin_lock)->rlock){+.+...}, at: [<ffffffffa00a261c>] nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.883425] 
[  718.883425] and this task is already holding:
[  718.883428]  (&(&dev_priv->context_switch_lock)->rlock){-.....}, at: [<ffffffffa009fa12>] nouveau_channel_free+0x10f/0x249 [nouveau]
[  718.883443] which would create a new lock dependency:
[  718.883446]  (&(&dev_priv->context_switch_lock)->rlock){-.....} -> (&(&dev_priv->ramin_lock)->rlock){+.+...}
[  718.883455] 
[  718.883455] but this new dependency connects a HARDIRQ-irq-safe lock:
[  718.883458]  (&(&dev_priv->context_switch_lock)->rlock){-.....}
[  718.883462] ... which became HARDIRQ-irq-safe at:
[  718.883465]   [<ffffffff810a1cf8>] __lock_acquire+0x62d/0x1602
[  718.883471]   [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.883476]   [<ffffffff814477c5>] _raw_spin_lock_irqsave+0x41/0x53
[  718.883483]   [<ffffffffa00a5b4e>] nouveau_irq_handler+0x60/0xcc9 [nouveau]
[  718.883495]   [<ffffffff810bc45d>] handle_IRQ_event+0xf1/0x262
[  718.883502]   [<ffffffff810be66a>] handle_fasteoi_irq+0xaa/0xed
[  718.883507]   [<ffffffff810378c3>] handle_irq+0x83/0x8c
[  718.883513]   [<ffffffff81036e89>] do_IRQ+0x5e/0xc4
[  718.883517]   [<ffffffff814481d3>] ret_from_intr+0x0/0xf
[  718.883523]   [<ffffffff81033f82>] cpu_idle+0x7b/0x18e
[  718.883529]   [<ffffffff8143f41b>] start_secondary+0x1ba/0x1bf
[  718.883536] 
[  718.883536] to a HARDIRQ-irq-unsafe lock:
[  718.883539]  (&(&dev_priv->ramin_lock)->rlock){+.+...}
[  718.883545] ...  [<ffffffff810a1d71>] __lock_acquire+0x6a6/0x1602
[  718.883551]   [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.883556]   [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.883561]   [<ffffffffa00a290e>] nouveau_gpuobj_new+0x219/0x4de [nouveau]
[  718.883574]   [<ffffffffa00e0fb2>] nv50_instmem_init+0x2f3/0x92d [nouveau]
[  718.883592]   [<ffffffffa009ed4b>] nouveau_card_init+0x104d/0x135f [nouveau]
[  718.883603]   [<ffffffffa009f755>] nouveau_load+0x6f8/0x77d [nouveau]
[  718.883614]   [<ffffffff812cd82d>] drm_get_pci_dev+0x239/0x35a
[  718.883619]   [<ffffffffa00f92d8>] nouveau_pci_probe+0x10/0x17 [nouveau]
[  718.883636]   [<ffffffff812531c3>] local_pci_probe+0x12/0x16
[  718.883642]   [<ffffffff812539c2>] pci_device_probe+0x60/0x8f
[  718.883647]   [<ffffffff812dee12>] driver_probe_device+0xa7/0x136
[  718.883652]   [<ffffffff812deefd>] __driver_attach+0x5c/0x80
[  718.883658]   [<ffffffff812de538>] bus_for_each_dev+0x54/0x89
[  718.883663]   [<ffffffff812dec5d>] driver_attach+0x19/0x1b
[  718.883668]   [<ffffffff812dde51>] bus_add_driver+0x194/0x2fd
[  718.883673]   [<ffffffff812df1c8>] driver_register+0x99/0x10a
[  718.883678]   [<ffffffff81253c32>] __pci_register_driver+0x63/0xd3
[  718.883683]   [<ffffffff812cd97d>] drm_pci_init+0x2f/0x95
[  718.883688]   [<ffffffff812c5fbe>] drm_init+0x5d/0x61
[  718.883693]   [<ffffffffa011b048>] 0xffffffffa011b048
[  718.883698]   [<ffffffff81000210>] do_one_initcall+0x7a/0x12e
[  718.883704]   [<ffffffff810ae170>] sys_init_module+0x9c/0x1dc
[  718.883710]   [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.883716] 
[  718.883716] other info that might help us debug this:
[  718.883717] 
[  718.883721] 2 locks held by X/2431:
[  718.883723]  #0:  (drm_global_mutex){+.+.+.}, at: [<ffffffff812c5d29>] drm_ioctl+0x28a/0x343
[  718.883748] 
[  718.883764] -> (&(&dev_priv->context_switch_lock)->rlock){-.....} ops: 10 {
[  718.883772]    IN-HARDIRQ-W at:
[  718.883776]                                        [<ffffffff810a1cf8>] __lock_acquire+0x62d/0x1602
[  718.883782]                                        [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.883787]                                        [<ffffffff814477c5>] _raw_spin_lock_irqsave+0x41/0x53
[  718.883793]                                        [<ffffffffa00a5b4e>] nouveau_irq_handler+0x60/0xcc9 [nouveau]
[  718.883807]                                        [<ffffffff810bc45d>] handle_IRQ_event+0xf1/0x262
[  718.883813]                                        [<ffffffff810be66a>] handle_fasteoi_irq+0xaa/0xed
[  718.883819]                                        [<ffffffff810378c3>] handle_irq+0x83/0x8c
[  718.883825]                                        [<ffffffff81036e89>] do_IRQ+0x5e/0xc4
[  718.883830]                                        [<ffffffff814481d3>] ret_from_intr+0x0/0xf
[  718.883836]                                        [<ffffffff81033f82>] cpu_idle+0x7b/0x18e
[  718.883842]                                        [<ffffffff8143f41b>] start_secondary+0x1ba/0x1bf
[  718.883849]    INITIAL USE at:
[  718.883852]                                       [<ffffffff810a1dec>] __lock_acquire+0x721/0x1602
[  718.883858]                                       [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.883864]                                       [<ffffffff814477c5>] _raw_spin_lock_irqsave+0x41/0x53
[  718.883870]                                       [<ffffffffa00c9d13>] nv50_fifo_create_context+0x12c/0x2c9 [nouveau]
[  718.883889]                                       [<ffffffffa00a0285>] nouveau_channel_alloc+0x538/0x5fa [nouveau]
[  718.883901]                                       [<ffffffffa009ee7b>] nouveau_card_init+0x117d/0x135f [nouveau]
[  718.883913]                                       [<ffffffffa009f755>] nouveau_load+0x6f8/0x77d [nouveau]
[  718.883924]                                       [<ffffffff812cd82d>] drm_get_pci_dev+0x239/0x35a
[  718.883930]                                       [<ffffffffa00f92d8>] nouveau_pci_probe+0x10/0x17 [nouveau]
[  718.883948]                                       [<ffffffff812531c3>] local_pci_probe+0x12/0x16
[  718.883953]                                       [<ffffffff812539c2>] pci_device_probe+0x60/0x8f
[  718.883959]                                       [<ffffffff812dee12>] driver_probe_device+0xa7/0x136
[  718.883965]                                       [<ffffffff812deefd>] __driver_attach+0x5c/0x80
[  718.883971]                                       [<ffffffff812de538>] bus_for_each_dev+0x54/0x89
[  718.883977]                                       [<ffffffff812dec5d>] driver_attach+0x19/0x1b
[  718.883983]                                       [<ffffffff812dde51>] bus_add_driver+0x194/0x2fd
[  718.883989]                                       [<ffffffff812df1c8>] driver_register+0x99/0x10a
[  718.883995]                                       [<ffffffff81253c32>] __pci_register_driver+0x63/0xd3
[  718.884001]                                       [<ffffffff812cd97d>] drm_pci_init+0x2f/0x95
[  718.884006]                                       [<ffffffff812c5fbe>] drm_init+0x5d/0x61
[  718.884012]                                       [<ffffffffa011b048>] 0xffffffffa011b048
[  718.884017]                                       [<ffffffff81000210>] do_one_initcall+0x7a/0x12e
[  718.884024]                                       [<ffffffff810ae170>] sys_init_module+0x9c/0x1dc
[  718.884030]                                       [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884036]  }
[  718.884052]  ... acquired at:
[  718.884073]    [<ffffffffa00a261c>] nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884085]    [<ffffffff8123eee6>] kref_put+0x43/0x4d
[  718.884092]    [<ffffffffa00a2471>] nouveau_gpuobj_ref+0x34/0x3d [nouveau]
[  718.884104]    [<ffffffffa00d0f62>] nv50_graph_destroy_context+0xb7/0xc3 [nouveau]
[  718.884122]    [<ffffffffa009fa48>] nouveau_channel_free+0x145/0x249 [nouveau]
[  718.884133]    [<ffffffffa009fbbb>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[  718.884144]    [<ffffffff812c5d38>] drm_ioctl+0x299/0x343
[  718.884149]    [<ffffffff81126a41>] do_vfs_ioctl+0x499/0x4e8
[  718.884155]    [<ffffffff81126ad2>] sys_ioctl+0x42/0x65
[  718.884159]    [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884165] 
[  718.884167] 
[  718.884168] the dependencies between the lock to be acquired and HARDIRQ-irq-unsafe lock:
[  718.884183] -> (&(&dev_priv->ramin_lock)->rlock){+.+...} ops: 20683 {
[  718.884190]    HARDIRQ-ON-W at:
[  718.884194]                                        [<ffffffff810a1d71>] __lock_acquire+0x6a6/0x1602
[  718.884200]                                        [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.884205]                                        [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.884211]                                        [<ffffffffa00a290e>] nouveau_gpuobj_new+0x219/0x4de [nouveau]
[  718.884224]                                        [<ffffffffa00e0fb2>] nv50_instmem_init+0x2f3/0x92d [nouveau]
[  718.884243]                                        [<ffffffffa009ed4b>] nouveau_card_init+0x104d/0x135f [nouveau]
[  718.884255]                                        [<ffffffffa009f755>] nouveau_load+0x6f8/0x77d [nouveau]
[  718.884266]                                        [<ffffffff812cd82d>] drm_get_pci_dev+0x239/0x35a
[  718.884272]                                        [<ffffffffa00f92d8>] nouveau_pci_probe+0x10/0x17 [nouveau]
[  718.884290]                                        [<ffffffff812531c3>] local_pci_probe+0x12/0x16
[  718.884295]                                        [<ffffffff812539c2>] pci_device_probe+0x60/0x8f
[  718.884301]                                        [<ffffffff812dee12>] driver_probe_device+0xa7/0x136
[  718.884307]                                        [<ffffffff812deefd>] __driver_attach+0x5c/0x80
[  718.884313]                                        [<ffffffff812de538>] bus_for_each_dev+0x54/0x89
[  718.884319]                                        [<ffffffff812dec5d>] driver_attach+0x19/0x1b
[  718.884325]                                        [<ffffffff812dde51>] bus_add_driver+0x194/0x2fd
[  718.884331]                                        [<ffffffff812df1c8>] driver_register+0x99/0x10a
[  718.884337]                                        [<ffffffff81253c32>] __pci_register_driver+0x63/0xd3
[  718.884343]                                        [<ffffffff812cd97d>] drm_pci_init+0x2f/0x95
[  718.884348]                                        [<ffffffff812c5fbe>] drm_init+0x5d/0x61
[  718.884354]                                        [<ffffffffa011b048>] 0xffffffffa011b048
[  718.884359]                                        [<ffffffff81000210>] do_one_initcall+0x7a/0x12e
[  718.884365]                                        [<ffffffff810ae170>] sys_init_module+0x9c/0x1dc
[  718.884372]                                        [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884378]    SOFTIRQ-ON-W at:
[  718.884382]                                        [<ffffffff810a1d94>] __lock_acquire+0x6c9/0x1602
[  718.884387]                                        [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.884393]                                        [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.884399]                                        [<ffffffffa00a290e>] nouveau_gpuobj_new+0x219/0x4de [nouveau]
[  718.884430]                                        [<ffffffffa009ed4b>] nouveau_card_init+0x104d/0x135f [nouveau]
[  718.884442]                                        [<ffffffffa009f755>] nouveau_load+0x6f8/0x77d [nouveau]
[  718.884454]                                        [<ffffffff812cd82d>] drm_get_pci_dev+0x239/0x35a
[  718.884460]                                        [<ffffffffa00f92d8>] nouveau_pci_probe+0x10/0x17 [nouveau]
[  718.884477]                                        [<ffffffff812531c3>] local_pci_probe+0x12/0x16
[  718.884483]                                        [<ffffffff812539c2>] pci_device_probe+0x60/0x8f
[  718.884489]                                        [<ffffffff812dee12>] driver_probe_device+0xa7/0x136
[  718.884495]                                        [<ffffffff812deefd>] __driver_attach+0x5c/0x80
[  718.884501]                                        [<ffffffff812de538>] bus_for_each_dev+0x54/0x89
[  718.884507]                                        [<ffffffff812dec5d>] driver_attach+0x19/0x1b
[  718.884513]                                        [<ffffffff812dde51>] bus_add_driver+0x194/0x2fd
[  718.884518]                                        [<ffffffff812df1c8>] driver_register+0x99/0x10a
[  718.884524]                                        [<ffffffff81253c32>] __pci_register_driver+0x63/0xd3
[  718.884530]                                        [<ffffffff812cd97d>] drm_pci_init+0x2f/0x95
[  718.884536]                                        [<ffffffff812c5fbe>] drm_init+0x5d/0x61
[  718.884541]                                        [<ffffffffa011b048>] 0xffffffffa011b048
[  718.884546]                                        [<ffffffff81000210>] do_one_initcall+0x7a/0x12e
[  718.884553]                                        [<ffffffff810ae170>] sys_init_module+0x9c/0x1dc
[  718.884559]                                        [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884565]    INITIAL USE at:
[  718.884569]                                       [<ffffffff810a1dec>] __lock_acquire+0x721/0x1602
[  718.884575]                                       [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.884580]                                       [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.884586]                                       [<ffffffffa00a290e>] nouveau_gpuobj_new+0x219/0x4de [nouveau]
[  718.884599]                                       [<ffffffffa00e0fb2>] nv50_instmem_init+0x2f3/0x92d [nouveau]
[  718.884617]                                       [<ffffffffa009ed4b>] nouveau_card_init+0x104d/0x135f [nouveau]
[  718.884629]                                       [<ffffffffa009f755>] nouveau_load+0x6f8/0x77d [nouveau]
[  718.884641]                                       [<ffffffff812cd82d>] drm_get_pci_dev+0x239/0x35a
[  718.884647]                                       [<ffffffffa00f92d8>] nouveau_pci_probe+0x10/0x17 [nouveau]
[  718.884664]                                       [<ffffffff812531c3>] local_pci_probe+0x12/0x16
[  718.884670]                                       [<ffffffff812539c2>] pci_device_probe+0x60/0x8f
[  718.884676]                                       [<ffffffff812dee12>] driver_probe_device+0xa7/0x136
[  718.884682]                                       [<ffffffff812deefd>] __driver_attach+0x5c/0x80
[  718.884688]                                       [<ffffffff812de538>] bus_for_each_dev+0x54/0x89
[  718.884694]                                       [<ffffffff812dec5d>] driver_attach+0x19/0x1b
[  718.884700]                                       [<ffffffff812dde51>] bus_add_driver+0x194/0x2fd
[  718.884706]                                       [<ffffffff812df1c8>] driver_register+0x99/0x10a
[  718.884712]                                       [<ffffffff81253c32>] __pci_register_driver+0x63/0xd3
[  718.884734]                                       [<ffffffff81000210>] do_one_initcall+0x7a/0x12e
[  718.884740]                                       [<ffffffff810ae170>] sys_init_module+0x9c/0x1dc
[  718.884746]                                       [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884752]  }
[  718.884754]  ... key      at: [<ffffffffa010c008>] __key.41343+0x0/0xfffffffffffed2d7 [nouveau]
[  718.884767]  ... acquired at:
[  718.884770]    [<ffffffff810a100f>] check_irq_usage+0x5d/0xbe
[  718.884775]    [<ffffffff810a2673>] __lock_acquire+0xfa8/0x1602
[  718.884779]    [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.884784]    [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.884789]    [<ffffffffa00a261c>] nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884801]    [<ffffffff8123eee6>] kref_put+0x43/0x4d
[  718.884807]    [<ffffffffa00a2471>] nouveau_gpuobj_ref+0x34/0x3d [nouveau]
[  718.884819]    [<ffffffffa00d0f62>] nv50_graph_destroy_context+0xb7/0xc3 [nouveau]
[  718.884836]    [<ffffffffa009fa48>] nouveau_channel_free+0x145/0x249 [nouveau]
[  718.884848]    [<ffffffffa009fbbb>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[  718.884858]    [<ffffffff812c5d38>] drm_ioctl+0x299/0x343
[  718.884864]    [<ffffffff81126a41>] do_vfs_ioctl+0x499/0x4e8
[  718.884868]    [<ffffffff81126ad2>] sys_ioctl+0x42/0x65
[  718.884873]    [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b
[  718.884879] 
[  718.884880] 
[  718.884881] stack backtrace:
[  718.884885] Pid: 2431, comm: X Not tainted 2.6.37+ #521
[  718.884888] Call Trace:
[  718.884893]  [<ffffffff810a0f9e>] check_usage+0x45c/0x470
[  718.884900]  [<ffffffff810a100f>] check_irq_usage+0x5d/0xbe
[  718.884905]  [<ffffffff810a2673>] __lock_acquire+0xfa8/0x1602
[  718.884918]  [<ffffffffa00a261c>] ? nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884923]  [<ffffffff810a2e11>] lock_acquire+0x144/0x189
[  718.884934]  [<ffffffffa00a261c>] ? nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884940]  [<ffffffff814476d1>] _raw_spin_lock+0x36/0x45
[  718.884952]  [<ffffffffa00a261c>] ? nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884970]  [<ffffffffa00e0415>] ? nv84_instmem_flush+0x42/0x72 [nouveau]
[  718.884982]  [<ffffffffa00a261c>] nouveau_gpuobj_del+0xc0/0x112 [nouveau]
[  718.884994]  [<ffffffffa00a255c>] ? nouveau_gpuobj_del+0x0/0x112 [nouveau]
[  718.885000]  [<ffffffff8123eee6>] kref_put+0x43/0x4d
[  718.885011]  [<ffffffffa00a2471>] nouveau_gpuobj_ref+0x34/0x3d [nouveau]
[  718.885029]  [<ffffffffa00d0f62>] nv50_graph_destroy_context+0xb7/0xc3 [nouveau]
[  718.885040]  [<ffffffffa009fa48>] nouveau_channel_free+0x145/0x249 [nouveau]
[  718.885052]  [<ffffffffa009fbbb>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[  718.885057]  [<ffffffff812c5d38>] drm_ioctl+0x299/0x343
[  718.885068]  [<ffffffffa009fb4c>] ? nouveau_ioctl_fifo_free+0x0/0x73 [nouveau]
[  718.885074]  [<ffffffff810a01fc>] ? mark_held_locks+0x52/0x70
[  718.885080]  [<ffffffff81113756>] ? kmem_cache_free+0xb4/0x194
[  718.885085]  [<ffffffff810a0461>] ? trace_hardirqs_on_caller+0x118/0x13c
[  718.885090]  [<ffffffff81126a41>] do_vfs_ioctl+0x499/0x4e8
[  718.885095]  [<ffffffff8111872b>] ? fget_light+0x138/0x311
[  718.885100]  [<ffffffff81126ad2>] sys_ioctl+0x42/0x65
[  718.885106]  [<ffffffff81034cfb>] system_call_fastpath+0x16/0x1b

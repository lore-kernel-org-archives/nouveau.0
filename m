From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: deadlock possiblity introduced by "drm/nouveau: use drm_mm in
	preference to custom code doing the same thing"
Date: Sun, 11 Jul 2010 01:24:32 +0200
Message-ID: <20100710232432.GA4137@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

Hi

Patch "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
in nouveau tree introduced new deadlock possibility, for which lockdep complains loudly:

[ 1541.070202] [drm] nouveau 0000:02:00.0: Allocating FIFO number 3
[ 1541.084772] [drm] nouveau 0000:02:00.0: nouveau_channel_alloc: initialised FIFO 3
[ 2417.733440] [drm] nouveau 0000:02:00.0: nouveau_channel_free: freeing fifo 3
[ 2417.746638] 
[ 2417.746639] ======================================================
[ 2417.746642] [ INFO: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected ]
[ 2417.746644] 2.6.35-rc4-nv+ #379
[ 2417.746645] ------------------------------------------------------
[ 2417.746648] warsow/2850 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
[ 2417.746650]  (&(&mm->unused_lock)->rlock){+.+...}, at: [<ffffffff8129f0c0>] drm_mm_put_block+0x17a/0x1c0
[ 2417.746657] 
[ 2417.746658] and this task is already holding:
[ 2417.746659]  (&(&dev_priv->context_switch_lock)->rlock){-.....}, at: [<ffffffffa00ac502>] nouveau_channel_free+0x10f/0x233 [nouveau]
[ 2417.746669] which would create a new lock dependency:
[ 2417.746671]  (&(&dev_priv->context_switch_lock)->rlock){-.....} -> (&(&mm->unused_lock)->rlock){+.+...}
[ 2417.746676] 
[ 2417.746676] but this new dependency connects a HARDIRQ-irq-safe lock:
[ 2417.746678]  (&(&dev_priv->context_switch_lock)->rlock){-.....}
[ 2417.746680] ... which became HARDIRQ-irq-safe at:
[ 2417.746682]   [<ffffffff8109739e>] __lock_acquire+0x671/0x8f4
[ 2417.746685]   [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.746688]   [<ffffffff8143b2cd>] _raw_spin_lock_irqsave+0x41/0x53
[ 2417.746692]   [<ffffffffa00b3072>] nouveau_irq_handler+0x56/0xa48 [nouveau]
[ 2417.746698]   [<ffffffff810a7b3b>] handle_IRQ_event+0xec/0x25d
[ 2417.746702]   [<ffffffff810a98e1>] handle_fasteoi_irq+0x92/0xd2
[ 2417.746705]   [<ffffffff81032953>] handle_irq+0x83/0x8c
[ 2417.746707]   [<ffffffff81031f19>] do_IRQ+0x57/0xbe
[ 2417.746711]   [<ffffffff8143bf13>] ret_from_intr+0x0/0xf
[ 2417.746714]   [<ffffffff8102f085>] cpu_idle+0x5c/0xb3
[ 2417.746717]   [<ffffffff81434180>] start_secondary+0x1c7/0x1cb
[ 2417.746720] 
[ 2417.746720] to a HARDIRQ-irq-unsafe lock:
[ 2417.746722]  (&(&mm->unused_lock)->rlock){+.+...}
[ 2417.746724] ... which became HARDIRQ-irq-unsafe at:
[ 2417.746725] ...  [<ffffffff81097418>] __lock_acquire+0x6eb/0x8f4
[ 2417.746729]   [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.746732]   [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.746735]   [<ffffffff8129f641>] drm_mm_pre_get+0x20/0x1a7
[ 2417.746738]   [<ffffffffa00963f2>] ttm_bo_init+0x234/0x385 [ttm]
[ 2417.746743]   [<ffffffffa00b67e4>] nouveau_bo_new+0x366/0x3eb [nouveau]
[ 2417.746750]   [<ffffffffa00ad341>] nouveau_mem_init+0x262/0x44a [nouveau]
[ 2417.746756]   [<ffffffffa00ab8b6>] nouveau_card_init+0xa73/0xd7e [nouveau]
[ 2417.746761]   [<ffffffffa00ac27b>] nouveau_load+0x6ba/0x70a [nouveau]
[ 2417.746766]   [<ffffffff8129b613>] drm_get_dev+0x470/0x5a1
[ 2417.746769]   [<ffffffffa0108b24>] nouveau_pci_probe+0x10/0x12 [nouveau]
[ 2417.746778]   [<ffffffff8121f2c7>] local_pci_probe+0x12/0x16
[ 2417.746781]   [<ffffffff8121faaf>] pci_device_probe+0x60/0x8f
[ 2417.746784]   [<ffffffff812aced7>] driver_probe_device+0xa7/0x136
[ 2417.746788]   [<ffffffff812acfc2>] __driver_attach+0x5c/0x80
[ 2417.746790]   [<ffffffff812ac632>] bus_for_each_dev+0x54/0x89
[ 2417.746793]   [<ffffffff812acd46>] driver_attach+0x19/0x1b
[ 2417.746796]   [<ffffffff812abf48>] bus_add_driver+0x183/0x2ef
[ 2417.746799]   [<ffffffff812ad28f>] driver_register+0x98/0x109
[ 2417.746801]   [<ffffffff8121fd1f>] __pci_register_driver+0x63/0xd3
[ 2417.746805]   [<ffffffff81295f78>] drm_init+0x6b/0xd1
[ 2417.746807]   [<ffffffffa0128048>] 0xffffffffa0128048
[ 2417.746810]   [<ffffffff810001ef>] do_one_initcall+0x59/0x14e
[ 2417.746814]   [<ffffffff810a2b0f>] sys_init_module+0x9c/0x1dd
[ 2417.746817]   [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.746820] 
[ 2417.746820] other info that might help us debug this:
[ 2417.746821] 
[ 2417.746823] 1 lock held by warsow/2850:
[ 2417.746824]  #0:  (&(&dev_priv->context_switch_lock)->rlock){-.....}, at: [<ffffffffa00ac502>] nouveau_channel_free+0x10f/0x233 [nouveau]
[ 2417.746833] 
[ 2417.746833] the dependencies between HARDIRQ-irq-safe lock and the holding lock:
[ 2417.746841] -> (&(&dev_priv->context_switch_lock)->rlock){-.....} ops: 18 {
[ 2417.746845]    IN-HARDIRQ-W at:
[ 2417.746847]                                        [<ffffffff8109739e>] __lock_acquire+0x671/0x8f4
[ 2417.746851]                                        [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.746854]                                        [<ffffffff8143b2cd>] _raw_spin_lock_irqsave+0x41/0x53
[ 2417.746858]                                        [<ffffffffa00b3072>] nouveau_irq_handler+0x56/0xa48 [nouveau]
[ 2417.746865]                                        [<ffffffff810a7b3b>] handle_IRQ_event+0xec/0x25d
[ 2417.746868]                                        [<ffffffff810a98e1>] handle_fasteoi_irq+0x92/0xd2
[ 2417.746871]                                        [<ffffffff81032953>] handle_irq+0x83/0x8c
[ 2417.746874]                                        [<ffffffff81031f19>] do_IRQ+0x57/0xbe
[ 2417.746878]                                        [<ffffffff8143bf13>] ret_from_intr+0x0/0xf
[ 2417.746881]                                        [<ffffffff8102f085>] cpu_idle+0x5c/0xb3
[ 2417.746885]                                        [<ffffffff81434180>] start_secondary+0x1c7/0x1cb
[ 2417.746888]    INITIAL USE at:
[ 2417.746890]                                       [<ffffffff81097494>] __lock_acquire+0x767/0x8f4
[ 2417.746893]                                       [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.746897]                                       [<ffffffff8143b2cd>] _raw_spin_lock_irqsave+0x41/0x53
[ 2417.746900]                                       [<ffffffffa00d3fd7>] nv50_fifo_create_context+0x17d/0x485 [nouveau]
[ 2417.746910]                                       [<ffffffffa00accea>] nouveau_channel_alloc+0x5c7/0x693 [nouveau]
[ 2417.746915]                                       [<ffffffffa00ab9b5>] nouveau_card_init+0xb72/0xd7e [nouveau]
[ 2417.746921]                                       [<ffffffffa00ac27b>] nouveau_load+0x6ba/0x70a [nouveau]
[ 2417.746927]                                       [<ffffffff8129b613>] drm_get_dev+0x470/0x5a1
[ 2417.746930]                                       [<ffffffffa0108b24>] nouveau_pci_probe+0x10/0x12 [nouveau]
[ 2417.746939]                                       [<ffffffff8121f2c7>] local_pci_probe+0x12/0x16
[ 2417.746942]                                       [<ffffffff8121faaf>] pci_device_probe+0x60/0x8f
[ 2417.746946]                                       [<ffffffff812aced7>] driver_probe_device+0xa7/0x136
[ 2417.746949]                                       [<ffffffff812acfc2>] __driver_attach+0x5c/0x80
[ 2417.746952]                                       [<ffffffff812ac632>] bus_for_each_dev+0x54/0x89
[ 2417.746955]                                       [<ffffffff812acd46>] driver_attach+0x19/0x1b
[ 2417.746958]                                       [<ffffffff812abf48>] bus_add_driver+0x183/0x2ef
[ 2417.746962]                                       [<ffffffff812ad28f>] driver_register+0x98/0x109
[ 2417.746965]                                       [<ffffffff8121fd1f>] __pci_register_driver+0x63/0xd3
[ 2417.746969]                                       [<ffffffff81295f78>] drm_init+0x6b/0xd1
[ 2417.746972]                                       [<ffffffffa0128048>] 0xffffffffa0128048
[ 2417.746975]                                       [<ffffffff810001ef>] do_one_initcall+0x59/0x14e
[ 2417.746978]                                       [<ffffffff810a2b0f>] sys_init_module+0x9c/0x1dd
[ 2417.746981]                                       [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.746985]  }
[ 2417.746986]  ... key      at: [<ffffffffa011a990>] __key.39000+0x0/0xfffffffffffee196 [nouveau]
[ 2417.746992]  ... acquired at:
[ 2417.746994]    [<ffffffff81095dea>] check_irq_usage+0x5d/0xbe
[ 2417.746997]    [<ffffffff81096754>] validate_chain+0x74a/0xd23
[ 2417.746999]    [<ffffffff810975b0>] __lock_acquire+0x883/0x8f4
[ 2417.747002]    [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747005]    [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747008]    [<ffffffff8129f0c0>] drm_mm_put_block+0x17a/0x1c0
[ 2417.747011]    [<ffffffffa00aed3e>] nouveau_gpuobj_del+0x167/0x1b5 [nouveau]
[ 2417.747017]    [<ffffffffa00af553>] nouveau_gpuobj_ref_del+0x2f3/0x31a [nouveau]
[ 2417.747023]    [<ffffffffa00dc365>] nv50_graph_destroy_context+0xf1/0xfd [nouveau]
[ 2417.747032]    [<ffffffffa00ac534>] nouveau_channel_free+0x141/0x233 [nouveau]
[ 2417.747037]    [<ffffffffa00ac695>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[ 2417.747043]    [<ffffffff81295cc2>] drm_ioctl+0x27b/0x347
[ 2417.747045]    [<ffffffff8110c51d>] vfs_ioctl+0x2d/0xa1
[ 2417.747049]    [<ffffffff8110ca69>] do_vfs_ioctl+0x454/0x48d
[ 2417.747052]    [<ffffffff8110cae4>] sys_ioctl+0x42/0x65
[ 2417.747055]    [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.747058] 
[ 2417.747059] 
[ 2417.747060] the dependencies between the lock to be acquired and HARDIRQ-irq-unsafe lock:
[ 2417.747067] -> (&(&mm->unused_lock)->rlock){+.+...} ops: 328035 {
[ 2417.747072]    HARDIRQ-ON-W at:
[ 2417.747074]                                        [<ffffffff81097418>] __lock_acquire+0x6eb/0x8f4
[ 2417.747077]                                        [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747081]                                        [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747084]                                        [<ffffffff8129f641>] drm_mm_pre_get+0x20/0x1a7
[ 2417.747088]                                        [<ffffffffa00963f2>] ttm_bo_init+0x234/0x385 [ttm]
[ 2417.747093]                                        [<ffffffffa00b67e4>] nouveau_bo_new+0x366/0x3eb [nouveau]
[ 2417.747100]                                        [<ffffffffa00ad341>] nouveau_mem_init+0x262/0x44a [nouveau]
[ 2417.747106]                                        [<ffffffffa00ab8b6>] nouveau_card_init+0xa73/0xd7e [nouveau]
[ 2417.747112]                                        [<ffffffffa00ac27b>] nouveau_load+0x6ba/0x70a [nouveau]
[ 2417.747117]                                        [<ffffffff8129b613>] drm_get_dev+0x470/0x5a1
[ 2417.747121]                                        [<ffffffffa0108b24>] nouveau_pci_probe+0x10/0x12 [nouveau]
[ 2417.747129]                                        [<ffffffff8121f2c7>] local_pci_probe+0x12/0x16
[ 2417.747133]                                        [<ffffffff8121faaf>] pci_device_probe+0x60/0x8f
[ 2417.747136]                                        [<ffffffff812aced7>] driver_probe_device+0xa7/0x136
[ 2417.747140]                                        [<ffffffff812acfc2>] __driver_attach+0x5c/0x80
[ 2417.747143]                                        [<ffffffff812ac632>] bus_for_each_dev+0x54/0x89
[ 2417.747146]                                        [<ffffffff812acd46>] driver_attach+0x19/0x1b
[ 2417.747149]                                        [<ffffffff812abf48>] bus_add_driver+0x183/0x2ef
[ 2417.747152]                                        [<ffffffff812ad28f>] driver_register+0x98/0x109
[ 2417.747156]                                        [<ffffffff8121fd1f>] __pci_register_driver+0x63/0xd3
[ 2417.747159]                                        [<ffffffff81295f78>] drm_init+0x6b/0xd1
[ 2417.747162]                                        [<ffffffffa0128048>] 0xffffffffa0128048
[ 2417.747165]                                        [<ffffffff810001ef>] do_one_initcall+0x59/0x14e
[ 2417.747169]                                        [<ffffffff810a2b0f>] sys_init_module+0x9c/0x1dd
[ 2417.747172]                                        [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.747176]    SOFTIRQ-ON-W at:
[ 2417.747178]                                        [<ffffffff8109743b>] __lock_acquire+0x70e/0x8f4
[ 2417.747181]                                        [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747184]                                        [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747188]                                        [<ffffffff8129f641>] drm_mm_pre_get+0x20/0x1a7
[ 2417.747191]                                        [<ffffffffa00963f2>] ttm_bo_init+0x234/0x385 [ttm]
[ 2417.747196]                                        [<ffffffffa00b67e4>] nouveau_bo_new+0x366/0x3eb [nouveau]
[ 2417.747203]                                        [<ffffffffa00ad341>] nouveau_mem_init+0x262/0x44a [nouveau]
[ 2417.747209]                                        [<ffffffffa00ab8b6>] nouveau_card_init+0xa73/0xd7e [nouveau]
[ 2417.747215]                                        [<ffffffffa00ac27b>] nouveau_load+0x6ba/0x70a [nouveau]
[ 2417.747221]                                        [<ffffffff8129b613>] drm_get_dev+0x470/0x5a1
[ 2417.747224]                                        [<ffffffffa0108b24>] nouveau_pci_probe+0x10/0x12 [nouveau]
[ 2417.747233]                                        [<ffffffff8121f2c7>] local_pci_probe+0x12/0x16
[ 2417.747236]                                        [<ffffffff8121faaf>] pci_device_probe+0x60/0x8f
[ 2417.747239]                                        [<ffffffff812aced7>] driver_probe_device+0xa7/0x136
[ 2417.747243]                                        [<ffffffff812acfc2>] __driver_attach+0x5c/0x80
[ 2417.747246]                                        [<ffffffff812ac632>] bus_for_each_dev+0x54/0x89
[ 2417.747249]                                        [<ffffffff812acd46>] driver_attach+0x19/0x1b
[ 2417.747252]                                        [<ffffffff812abf48>] bus_add_driver+0x183/0x2ef
[ 2417.747255]                                        [<ffffffff812ad28f>] driver_register+0x98/0x109
[ 2417.747259]                                        [<ffffffff8121fd1f>] __pci_register_driver+0x63/0xd3
[ 2417.747262]                                        [<ffffffff81295f78>] drm_init+0x6b/0xd1
[ 2417.747265]                                        [<ffffffffa0128048>] 0xffffffffa0128048
[ 2417.747268]                                        [<ffffffff810001ef>] do_one_initcall+0x59/0x14e
[ 2417.747272]                                        [<ffffffff810a2b0f>] sys_init_module+0x9c/0x1dd
[ 2417.747275]                                        [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.747278]    INITIAL USE at:
[ 2417.747280]                                       [<ffffffff81097494>] __lock_acquire+0x767/0x8f4
[ 2417.747284]                                       [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747287]                                       [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747291]                                       [<ffffffff8129f641>] drm_mm_pre_get+0x20/0x1a7
[ 2417.747294]                                       [<ffffffffa00963f2>] ttm_bo_init+0x234/0x385 [ttm]
[ 2417.747299]                                       [<ffffffffa00b67e4>] nouveau_bo_new+0x366/0x3eb [nouveau]
[ 2417.747306]                                       [<ffffffffa00ad341>] nouveau_mem_init+0x262/0x44a [nouveau]
[ 2417.747312]                                       [<ffffffffa00ab8b6>] nouveau_card_init+0xa73/0xd7e [nouveau]
[ 2417.747318]                                       [<ffffffffa00ac27b>] nouveau_load+0x6ba/0x70a [nouveau]
[ 2417.747323]                                       [<ffffffff8129b613>] drm_get_dev+0x470/0x5a1
[ 2417.747327]                                       [<ffffffffa0108b24>] nouveau_pci_probe+0x10/0x12 [nouveau]
[ 2417.747335]                                       [<ffffffff8121f2c7>] local_pci_probe+0x12/0x16
[ 2417.747339]                                       [<ffffffff8121faaf>] pci_device_probe+0x60/0x8f
[ 2417.747342]                                       [<ffffffff812aced7>] driver_probe_device+0xa7/0x136
[ 2417.747345]                                       [<ffffffff812acfc2>] __driver_attach+0x5c/0x80
[ 2417.747349]                                       [<ffffffff812ac632>] bus_for_each_dev+0x54/0x89
[ 2417.747352]                                       [<ffffffff812acd46>] driver_attach+0x19/0x1b
[ 2417.747355]                                       [<ffffffff812abf48>] bus_add_driver+0x183/0x2ef
[ 2417.747358]                                       [<ffffffff812ad28f>] driver_register+0x98/0x109
[ 2417.747361]                                       [<ffffffff8121fd1f>] __pci_register_driver+0x63/0xd3
[ 2417.747365]                                       [<ffffffff81295f78>] drm_init+0x6b/0xd1
[ 2417.747368]                                       [<ffffffffa0128048>] 0xffffffffa0128048
[ 2417.747371]                                       [<ffffffff810001ef>] do_one_initcall+0x59/0x14e
[ 2417.747374]                                       [<ffffffff810a2b0f>] sys_init_module+0x9c/0x1dd
[ 2417.747377]                                       [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.747381]  }
[ 2417.747382]  ... key      at: [<ffffffff8240a6c0>] __key.36424+0x0/0x8
[ 2417.747386]  ... acquired at:
[ 2417.747387]    [<ffffffff81095dea>] check_irq_usage+0x5d/0xbe
[ 2417.747390]    [<ffffffff81096754>] validate_chain+0x74a/0xd23
[ 2417.747393]    [<ffffffff810975b0>] __lock_acquire+0x883/0x8f4
[ 2417.747396]    [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747399]    [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747401]    [<ffffffff8129f0c0>] drm_mm_put_block+0x17a/0x1c0
[ 2417.747405]    [<ffffffffa00aed3e>] nouveau_gpuobj_del+0x167/0x1b5 [nouveau]
[ 2417.747410]    [<ffffffffa00af553>] nouveau_gpuobj_ref_del+0x2f3/0x31a [nouveau]
[ 2417.747416]    [<ffffffffa00dc365>] nv50_graph_destroy_context+0xf1/0xfd [nouveau]
[ 2417.747425]    [<ffffffffa00ac534>] nouveau_channel_free+0x141/0x233 [nouveau]
[ 2417.747430]    [<ffffffffa00ac695>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[ 2417.747436]    [<ffffffff81295cc2>] drm_ioctl+0x27b/0x347
[ 2417.747438]    [<ffffffff8110c51d>] vfs_ioctl+0x2d/0xa1
[ 2417.747441]    [<ffffffff8110ca69>] do_vfs_ioctl+0x454/0x48d
[ 2417.747444]    [<ffffffff8110cae4>] sys_ioctl+0x42/0x65
[ 2417.747447]    [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b
[ 2417.747450] 
[ 2417.747451] 
[ 2417.747451] stack backtrace:
[ 2417.747454] Pid: 2850, comm: warsow Not tainted 2.6.35-rc4-nv+ #379
[ 2417.747455] Call Trace:
[ 2417.747458]  [<ffffffff81095d79>] check_usage+0x45c/0x470
[ 2417.747462]  [<ffffffff81095dea>] check_irq_usage+0x5d/0xbe
[ 2417.747465]  [<ffffffff81096754>] validate_chain+0x74a/0xd23
[ 2417.747468]  [<ffffffff810975b0>] __lock_acquire+0x883/0x8f4
[ 2417.747472]  [<ffffffff8129f0c0>] ? drm_mm_put_block+0x17a/0x1c0
[ 2417.747475]  [<ffffffff81097769>] lock_acquire+0x148/0x18d
[ 2417.747477]  [<ffffffff8129f0c0>] ? drm_mm_put_block+0x17a/0x1c0
[ 2417.747480]  [<ffffffff81094fd7>] ? mark_held_locks+0x52/0x70
[ 2417.747483]  [<ffffffff8143b1d9>] _raw_spin_lock+0x36/0x45
[ 2417.747486]  [<ffffffff8129f0c0>] ? drm_mm_put_block+0x17a/0x1c0
[ 2417.747490]  [<ffffffff8129f0c0>] drm_mm_put_block+0x17a/0x1c0
[ 2417.747496]  [<ffffffffa00aed3e>] nouveau_gpuobj_del+0x167/0x1b5 [nouveau]
[ 2417.747501]  [<ffffffffa00af553>] nouveau_gpuobj_ref_del+0x2f3/0x31a [nouveau]
[ 2417.747510]  [<ffffffffa00dc365>] nv50_graph_destroy_context+0xf1/0xfd [nouveau]
[ 2417.747516]  [<ffffffffa00ac534>] nouveau_channel_free+0x141/0x233 [nouveau]
[ 2417.747519]  [<ffffffff8105dcca>] ? add_preempt_count+0x34/0x36
[ 2417.747525]  [<ffffffffa00ac695>] nouveau_ioctl_fifo_free+0x6f/0x73 [nouveau]
[ 2417.747527]  [<ffffffff81295cc2>] drm_ioctl+0x27b/0x347
[ 2417.747533]  [<ffffffffa00ac626>] ? nouveau_ioctl_fifo_free+0x0/0x73 [nouveau]
[ 2417.747536]  [<ffffffff81095382>] ? debug_check_no_locks_freed+0x113/0x129
[ 2417.747539]  [<ffffffff81094fd7>] ? mark_held_locks+0x52/0x70
[ 2417.747542]  [<ffffffff810faaaa>] ? kmem_cache_free+0xb6/0x195
[ 2417.747545]  [<ffffffff8110c51d>] vfs_ioctl+0x2d/0xa1
[ 2417.747548]  [<ffffffff8110ca69>] do_vfs_ioctl+0x454/0x48d
[ 2417.747551]  [<ffffffff810ff4db>] ? fget_light+0xd6/0x289
[ 2417.747554]  [<ffffffff8110cae4>] sys_ioctl+0x42/0x65
[ 2417.747557]  [<ffffffff8102fdab>] system_call_fastpath+0x16/0x1b

Deadlock scenario looks like this:
CPU1                                        CPU2
nouveau code calls some drm_mm.c
function which takes mm->unused_lock

                                            nouveau_channel_free disables irqs and takes dev_priv->context_switch_lock
                                                            calls nv50_graph_destroy_context which
                                                            (... backtrace above)
                                                            calls drm_mm_put_block which tries to take mm->unused_lock (spins)
nouveau interrupt raises

nouveau_irq_handler tries to take
dev_priv->context_switch_lock (spins)

deadlock

Possible solutions:
- reverting "drm/nouveau: use drm_mm in preference to custom code doing the same thing"
- disabling interrupts before calling drm_mm functions - unmaintainable and still
  deadlockable in multicard setups (nouveau and eg radeon)
- making mm->unused_lock HARDIRQ-safe (patch below) - simple but with slight overhead

---
From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] drm: make drm_mm->unused_lock HARDIRQ-safe

nouveau started to use drm_mm functions (in "drm/nouveau: use drm_mm
in preference to custom code doing the same thing") but it has to call
them under HARDIRQ-safe lock. To prevent deadlocks we have to make
drm_mm->unused_lock HARDIRQ-safe too.

Deadlock scenario:
CPU1                                        CPU2
nouveau code calls some drm_mm.c
function which takes mm->unused_lock

                                            nouveau_channel_free disables irqs and takes dev_priv->context_switch_lock
                                                            calls nv50_graph_destroy_context which
                                                            (... backtrace above)
                                                            calls drm_mm_put_block which tries to take mm->unused_lock (spins)
nouveau interrupt raises

nouveau_irq_handler tries to take
dev_priv->context_switch_lock (spins)

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/drm_mm.c |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index 2ac074c..bb95831 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -81,6 +81,7 @@ int drm_mm_remove_space_from_tail(struct drm_mm *mm, unsigned long size)
 static struct drm_mm_node *drm_mm_kmalloc(struct drm_mm *mm, int atomic)
 {
 	struct drm_mm_node *child;
+	unsigned long flags;
 
 	if (atomic)
 		child = kmalloc(sizeof(*child), GFP_ATOMIC);
@@ -88,7 +89,7 @@ static struct drm_mm_node *drm_mm_kmalloc(struct drm_mm *mm, int atomic)
 		child = kmalloc(sizeof(*child), GFP_KERNEL);
 
 	if (unlikely(child == NULL)) {
-		spin_lock(&mm->unused_lock);
+		spin_lock_irqsave(&mm->unused_lock, flags);
 		if (list_empty(&mm->unused_nodes))
 			child = NULL;
 		else {
@@ -98,7 +99,7 @@ static struct drm_mm_node *drm_mm_kmalloc(struct drm_mm *mm, int atomic)
 			list_del(&child->fl_entry);
 			--mm->num_unused;
 		}
-		spin_unlock(&mm->unused_lock);
+		spin_unlock_irqrestore(&mm->unused_lock, flags);
 	}
 	return child;
 }
@@ -111,22 +112,23 @@ static struct drm_mm_node *drm_mm_kmalloc(struct drm_mm *mm, int atomic)
 int drm_mm_pre_get(struct drm_mm *mm)
 {
 	struct drm_mm_node *node;
+	unsigned long flags;
 
-	spin_lock(&mm->unused_lock);
+	spin_lock_irqsave(&mm->unused_lock, flags);
 	while (mm->num_unused < MM_UNUSED_TARGET) {
-		spin_unlock(&mm->unused_lock);
+		spin_unlock_irqrestore(&mm->unused_lock, flags);
 		node = kmalloc(sizeof(*node), GFP_KERNEL);
-		spin_lock(&mm->unused_lock);
+		spin_lock_irqsave(&mm->unused_lock, flags);
 
 		if (unlikely(node == NULL)) {
 			int ret = (mm->num_unused < 2) ? -ENOMEM : 0;
-			spin_unlock(&mm->unused_lock);
+			spin_unlock_irqrestore(&mm->unused_lock, flags);
 			return ret;
 		}
 		++mm->num_unused;
 		list_add_tail(&node->fl_entry, &mm->unused_nodes);
 	}
-	spin_unlock(&mm->unused_lock);
+	spin_unlock_irqrestore(&mm->unused_lock, flags);
 	return 0;
 }
 EXPORT_SYMBOL(drm_mm_pre_get);
@@ -277,6 +279,7 @@ void drm_mm_put_block(struct drm_mm_node *cur)
 	struct list_head *root_head = &mm->ml_entry;
 	struct drm_mm_node *prev_node = NULL;
 	struct drm_mm_node *next_node;
+	unsigned long flags;
 
 	int merged = 0;
 
@@ -296,14 +299,14 @@ void drm_mm_put_block(struct drm_mm_node *cur)
 				prev_node->size += next_node->size;
 				list_del(&next_node->ml_entry);
 				list_del(&next_node->fl_entry);
-				spin_lock(&mm->unused_lock);
+				spin_lock_irqsave(&mm->unused_lock, flags);
 				if (mm->num_unused < MM_UNUSED_TARGET) {
 					list_add(&next_node->fl_entry,
 						 &mm->unused_nodes);
 					++mm->num_unused;
 				} else
 					kfree(next_node);
-				spin_unlock(&mm->unused_lock);
+				spin_unlock_irqrestore(&mm->unused_lock, flags);
 			} else {
 				next_node->size += cur->size;
 				next_node->start = cur->start;
@@ -316,13 +319,13 @@ void drm_mm_put_block(struct drm_mm_node *cur)
 		list_add(&cur->fl_entry, &mm->fl_entry);
 	} else {
 		list_del(&cur->ml_entry);
-		spin_lock(&mm->unused_lock);
+		spin_lock_irqsave(&mm->unused_lock, flags);
 		if (mm->num_unused < MM_UNUSED_TARGET) {
 			list_add(&cur->fl_entry, &mm->unused_nodes);
 			++mm->num_unused;
 		} else
 			kfree(cur);
-		spin_unlock(&mm->unused_lock);
+		spin_unlock_irqrestore(&mm->unused_lock, flags);
 	}
 }
 
@@ -445,6 +448,7 @@ void drm_mm_takedown(struct drm_mm * mm)
 	struct list_head *bnode = mm->fl_entry.next;
 	struct drm_mm_node *entry;
 	struct drm_mm_node *next;
+	unsigned long flags;
 
 	entry = list_entry(bnode, struct drm_mm_node, fl_entry);
 
@@ -458,13 +462,13 @@ void drm_mm_takedown(struct drm_mm * mm)
 	list_del(&entry->ml_entry);
 	kfree(entry);
 
-	spin_lock(&mm->unused_lock);
+	spin_lock_irqsave(&mm->unused_lock, flags);
 	list_for_each_entry_safe(entry, next, &mm->unused_nodes, fl_entry) {
 		list_del(&entry->fl_entry);
 		kfree(entry);
 		--mm->num_unused;
 	}
-	spin_unlock(&mm->unused_lock);
+	spin_unlock_irqrestore(&mm->unused_lock, flags);
 
 	BUG_ON(mm->num_unused != 0);
 }
-- 
1.7.1

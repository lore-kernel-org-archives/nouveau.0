From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: nouveau lockdep splat on init
Date: Tue, 15 Jan 2013 16:08:09 +0100
Message-ID: <50F570D9.3060406@canonical.com>
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
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Testing airlied's current drm-fixes branch gives me this, with lockdep enabled:

[   40.864179] =============================================
[   40.864179] [ INFO: possible recursive locking detected ]
[   40.864179] 3.8.0-rc3-patser+ #915 Tainted: G        W   
[   40.864179] ---------------------------------------------
[   40.864179] modprobe/524 is trying to acquire lock:
[   40.864179]  (&subdev->mutex){+.+.+.}, at: [<ffffffffa0333ba3>] nouveau_instobj_create_+0x43/0x90 [nouveau]
[   40.864179] 
[   40.864179] but task is already holding lock:
[   40.864179]  (&subdev->mutex){+.+.+.}, at: [<ffffffffa03467f4>] nv50_disp_data_ctor+0x94/0x160 [nouveau]
[   40.864179] 
[   40.864179] other info that might help us debug this:
[   40.864179]  Possible unsafe locking scenario:
[   40.864179] 
[   40.864179]        CPU0
[   40.864179]        ----
[   40.864179]   lock(&subdev->mutex);
[   40.864179]   lock(&subdev->mutex);
[   40.864179] 
[   40.864179]  *** DEADLOCK ***
[   40.864179] 
[   40.864179]  May be due to missing lock nesting notation
[   40.864179] 
[   40.864179] 4 locks held by modprobe/524:
[   40.864179]  #0:  (&__lockdep_no_validate__){......}, at: [<ffffffff81410ea3>] __driver_attach+0x53/0xb0
[   40.864179]  #1:  (&__lockdep_no_validate__){......}, at: [<ffffffff81410eb1>] __driver_attach+0x61/0xb0
[   40.864179]  #2:  (drm_global_mutex){+.+.+.}, at: [<ffffffffa0094437>] drm_get_pci_dev+0xb7/0x2a0 [drm]
[   40.864179]  #3:  (&subdev->mutex){+.+.+.}, at: [<ffffffffa03467f4>] nv50_disp_data_ctor+0x94/0x160 [nouveau]
[   40.864179] 
[   40.864179] stack backtrace:
[   40.864179] Pid: 524, comm: modprobe Tainted: G        W    3.8.0-rc3-patser+ #915
[   40.864179] Call Trace:
[   40.864179]  [<ffffffff8109cd63>] __lock_acquire+0x783/0x1d90
[   40.864179]  [<ffffffff8109c9cf>] ? __lock_acquire+0x3ef/0x1d90
[   40.864179]  [<ffffffff8109b4d2>] ? mark_held_locks+0x82/0x130
[   40.864179]  [<ffffffff8135160e>] ? trace_hardirqs_on_thunk+0x3a/0x3f
[   40.864179]  [<ffffffff8109e8e6>] lock_acquire+0x96/0xc0
[   40.864179]  [<ffffffffa0333ba3>] ? nouveau_instobj_create_+0x43/0x90 [nouveau]
[   40.864179]  [<ffffffffa02fc3fc>] ? nouveau_object_create_+0x9c/0xf0 [nouveau]
[   40.864179]  [<ffffffffa0333ba3>] ? nouveau_instobj_create_+0x43/0x90 [nouveau]
[   40.864179]  [<ffffffff816f5abe>] mutex_lock_nested+0x5e/0x390
[   40.864179]  [<ffffffffa0333ba3>] ? nouveau_instobj_create_+0x43/0x90 [nouveau]
[   40.864179]  [<ffffffff816fa790>] ? _raw_spin_unlock+0x30/0x60
[   40.864179]  [<ffffffffa02fc42e>] ? nouveau_object_create_+0xce/0xf0 [nouveau]
[   40.864179]  [<ffffffff816fa6ab>] ? _raw_spin_unlock_irq+0x2b/0x60
[   40.864179]  [<ffffffffa0333ba3>] nouveau_instobj_create_+0x43/0x90 [nouveau]
[   40.864179]  [<ffffffffa0334e91>] nv50_instobj_ctor+0xa1/0x1b0 [nouveau]
[   40.864179]  [<ffffffff8107126a>] ? finish_task_switch+0x3a/0x110
[   40.864179]  [<ffffffffa02fc103>] nouveau_object_ctor+0x33/0xe0 [nouveau]
[   40.864179]  [<ffffffffa0334cbf>] nv50_instmem_alloc+0x2f/0x40 [nouveau]
[   40.864179]  [<ffffffffa02fa34d>] nouveau_gpuobj_create_+0x38d/0x4c0 [nouveau]
[   40.864179]  [<ffffffffa02f74ac>] nouveau_engctx_create_+0x17c/0x3d0 [nouveau]
[   40.864179]  [<ffffffffa0346891>] nv50_disp_data_ctor+0x131/0x160 [nouveau]
[   40.864179]  [<ffffffffa02fe3f2>] ? nouveau_subdev_reset+0x72/0xb0 [nouveau]
[   40.864179]  [<ffffffffa02fc103>] nouveau_object_ctor+0x33/0xe0 [nouveau]
[   40.864179]  [<ffffffffa02fce6a>] nouveau_object_new+0x14a/0x2b0 [nouveau]
[   40.864179]  [<ffffffffa043171a>] nv50_display_create+0x1ea/0x9a0 [nouveau]
[   40.864179]  [<ffffffff81060582>] ? __cancel_work_timer+0x72/0xc0
[   40.864179]  [<ffffffffa03fe7b4>] nouveau_display_create+0x4c4/0x900 [nouveau]
[   40.864179]  [<ffffffffa03e6da2>] nouveau_drm_load+0x3b2/0x960 [nouveau]
[   40.864179]  [<ffffffff8140e599>] ? device_register+0x19/0x20
[   40.864179]  [<ffffffffa0095d11>] ? drm_sysfs_device_add+0x81/0xb0 [drm]
[   40.864179]  [<ffffffffa00944f9>] drm_get_pci_dev+0x179/0x2a0 [drm]
[   40.864179]  [<ffffffff8137042d>] ? __pci_set_master+0x4d/0x80
[   40.864179]  [<ffffffffa03e646a>] nouveau_drm_probe+0x25a/0x290 [nouveau]
[   40.864179]  [<ffffffff816fa71d>] ? _raw_spin_unlock_irqrestore+0x3d/0x80
[   40.864179]  [<ffffffff81374566>] local_pci_probe+0x46/0x80
[   40.864179]  [<ffffffff81375db9>] pci_device_probe+0xf9/0x120
[   40.864179]  [<ffffffff81410c86>] driver_probe_device+0x76/0x240
[   40.864179]  [<ffffffff81410ef3>] __driver_attach+0xa3/0xb0
[   40.864179]  [<ffffffff81410e50>] ? driver_probe_device+0x240/0x240
[   40.864179]  [<ffffffff8140f0e6>] bus_for_each_dev+0x56/0x90
[   40.864179]  [<ffffffff814107e9>] driver_attach+0x19/0x20
[   40.864179]  [<ffffffff81410388>] bus_add_driver+0x188/0x270
[   40.864179]  [<ffffffff81411425>] driver_register+0x75/0x150
[   40.864179]  [<ffffffff81374dcf>] __pci_register_driver+0x5f/0x70
[   40.864179]  [<ffffffffa009473a>] drm_pci_init+0x11a/0x130 [drm]
[   40.864179]  [<ffffffff8140b2c0>] ? vga_switcheroo_register_handler+0x40/0x90
[   40.864179]  [<ffffffffa04a3000>] ? 0xffffffffa04a2fff
[   40.864179]  [<ffffffffa04a304d>] nouveau_drm_init+0x4d/0x1000 [nouveau]
[   40.864179]  [<ffffffff810001fa>] do_one_initcall+0x3a/0x170
[   40.864179]  [<ffffffff810a9f72>] load_module+0x1a52/0x2020
[   40.864179]  [<ffffffff810a7150>] ? get_modinfo.isra.30+0xc0/0xc0
[   40.864179]  [<ffffffff8135160e>] ? trace_hardirqs_on_thunk+0x3a/0x3f
[   40.864179]  [<ffffffff810aa611>] sys_init_module+0xd1/0x100
[   40.864179]  [<ffffffff81700752>] system_call_fastpath+0x16/0x1b

I don't understand the need for the mutex_lock in that code though, wouldn't it be better for the caller to ensure that this code is only called once?

~Maarten

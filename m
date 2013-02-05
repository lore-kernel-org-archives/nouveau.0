From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] drm/nouveau: fix lockdep splat in display
Date: Tue, 05 Feb 2013 11:29:59 +0100
Message-ID: <5110DF27.2020200@canonical.com>
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
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Add a flag NVOBJ_FLAG_CREAT_EXCL, which will make sure that only 1 engctx will be created.
This removes the need of having multiple 

Fixes the following lockdep splat:

=============================================
[ INFO: possible recursive locking detected ]
3.8.0-rc6-ninja+ #1 Not tainted
---------------------------------------------
modprobe/585 is trying to acquire lock:
 (&subdev->mutex){+.+.+.}, at: [<ffffffffa016c323>]
nouveau_instobj_create_+0x43/0x90 [nouveau]

but task is already holding lock:
 (&subdev->mutex){+.+.+.}, at: [<ffffffffa017672d>]
nv50_disp_data_ctor+0x5d/0xd0 [nouveau]

other info that might help us debug this:
 Possible unsafe locking scenario:

    CPU0
    ----
 lock(&subdev->mutex);
 lock(&subdev->mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

4 locks held by modprobe/585:
 #0: (&__lockdep_no_validate__){......}, at: [<ffffffff813075f3>]
__driver_attach+0x53/0xb0
 #1: (&__lockdep_no_validate__){......}, at: [<ffffffff81307601>]
__driver_attach+0x61/0xb0
 #2: (drm_global_mutex){+.+.+.}, at: [<ffffffff812ee59c>]
drm_get_pci_dev+0xbc/0x2b0
 #3: (&subdev->mutex){+.+.+.}, at: [<ffffffffa017672d>]
nv50_disp_data_ctor+0x5d/0xd0 [nouveau]

stack backtrace:
Pid: 585, comm: modprobe Not tainted 3.8.0-rc6-expert+ #1
Call Trace:
 [<ffffffff8108fde2>] validate_chain.isra.33+0xd72/0x10d0
 [<ffffffff8105fa08>] ? __kernel_text_address+0x58/0x80
 [<ffffffff8100575d>] ? print_context_stack+0x5d/0xd0
 [<ffffffff81090bc1>] __lock_acquire+0x3a1/0xb60
 [<ffffffff8108d504>] ? __lock_is_held+0x54/0x80
 [<ffffffff8109184a>] lock_acquire+0x5a/0x70
 [<ffffffffa016c323>] ? nouveau_instobj_create_+0x43/0x90 [nouveau]
 [<ffffffff81558739>] mutex_lock_nested+0x69/0x340
 [<ffffffffa016c323>] ? nouveau_instobj_create_+0x43/0x90 [nouveau]
 [<ffffffffa0152370>] ? nouveau_object_create_+0x60/0xa0 [nouveau]
 [<ffffffffa016c323>] nouveau_instobj_create_+0x43/0x90 [nouveau]
 [<ffffffffa016cf8c>] nv50_instobj_ctor+0x4c/0xf0 [nouveau]
 [<ffffffffa0152163>] nouveau_object_ctor+0x33/0xc0 [nouveau]
 [<ffffffffa016cd51>] nv50_instmem_alloc+0x21/0x30 [nouveau]
 [<ffffffffa0150917>] nouveau_gpuobj_create_+0x247/0x2f0 [nouveau]
 [<ffffffff8155b35a>] ? _raw_spin_unlock_irqrestore+0x3a/0x70
 [<ffffffff810921fd>] ? trace_hardirqs_on_caller+0x10d/0x1a0
 [<ffffffffa014f4bc>] nouveau_engctx_create_+0x25c/0x2a0 [nouveau]
 [<ffffffffa0176791>] nv50_disp_data_ctor+0xc1/0xd0 [nouveau]
 [<ffffffffa0153722>] ? nouveau_subdev_reset+0x52/0x60 [nouveau]
 [<ffffffffa0152163>] nouveau_object_ctor+0x33/0xc0 [nouveau]
 [<ffffffffa0152a42>] nouveau_object_new+0x112/0x240 [nouveau]
 [<ffffffffa01f4b1d>] nv50_display_create+0x18d/0x860 [nouveau]
 [<ffffffff8105cb5d>] ? __cancel_work_timer+0x6d/0xc0
 [<ffffffffa01db8eb>] nouveau_display_create+0x3cb/0x670 [nouveau]
 [<ffffffffa01cb1bf>] nouveau_drm_load+0x26f/0x590 [nouveau]
 [<ffffffff81304c99>] ? device_register+0x19/0x20
 [<ffffffff812efe91>] ? drm_sysfs_device_add+0x81/0xb0
 [<ffffffff812ee65e>] drm_get_pci_dev+0x17e/0x2b0
 [<ffffffff81245e56>] ? __pci_set_master+0x26/0x80
 [<ffffffffa01cab2a>] nouveau_drm_probe+0x25a/0x2a0 [nouveau]
 [<ffffffff8124a386>] local_pci_probe+0x46/0x80
 [<ffffffff8124ac11>] pci_device_probe+0x101/0x110
 [<ffffffff813073d6>] driver_probe_device+0x76/0x240
 [<ffffffff81307643>] __driver_attach+0xa3/0xb0
 [<ffffffff813075a0>] ? driver_probe_device+0x240/0x240
 [<ffffffff8130564d>] bus_for_each_dev+0x4d/0x90
 [<ffffffff81306f39>] driver_attach+0x19/0x20
 [<ffffffff81306af0>] bus_add_driver+0x1a0/0x270
 [<ffffffffa023d000>] ? 0xffffffffa023cfff
 [<ffffffff81307cd2>] driver_register+0x72/0x170
 [<ffffffffa023d000>] ? 0xffffffffa023cfff
 [<ffffffff8124ad0f>] __pci_register_driver+0x5f/0x70
 [<ffffffff812ee8a5>] drm_pci_init+0x115/0x130
 [<ffffffffa023d000>] ? 0xffffffffa023cfff
 [<ffffffffa023d000>] ? 0xffffffffa023cfff
 [<ffffffffa023d04d>] nouveau_drm_init+0x4d/0x1000 [nouveau]
 [<ffffffff810002da>] do_one_initcall+0x11a/0x170
 [<ffffffff8109d044>] load_module+0xe84/0x1470
 [<ffffffff81098c30>] ? in_lock_functions+0x20/0x20
 [<ffffffff8122c22e>] ? trace_hardirqs_on_thunk+0x3a/0x3f
 [<ffffffff8109d6e7>] sys_init_module+0xb7/0xe0
 [<ffffffff8155c156>] system_call_fastpath+0x1a/0x1f

Reported-by: Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Reported-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Reported-by: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
XXX: Add Cc: stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org if it applies to 3.7 ?

diff --git a/drivers/gpu/drm/nouveau/core/core/engctx.c b/drivers/gpu/drm/nouveau/core/core/engctx.c
index 84c71fa..4a0ab2b 100644
--- a/drivers/gpu/drm/nouveau/core/core/engctx.c
+++ b/drivers/gpu/drm/nouveau/core/core/engctx.c
@@ -31,12 +31,15 @@
 #include <subdev/vm.h>
 
 static inline int
-nouveau_engctx_exists(struct nouveau_object *parent,
+nouveau_engctx_exists(struct nouveau_object *parent, u32 flags,
 		      struct nouveau_engine *engine, void **pobject)
 {
 	struct nouveau_engctx *engctx;
 	struct nouveau_object *parctx;
 
+	if ((flags & NVOBJ_FLAG_CREAT_EXCL) && !list_empty(&engine->contexts))
+		return -EBUSY;
+
 	list_for_each_entry(engctx, &engine->contexts, head) {
 		parctx = nv_pclass(nv_object(engctx), NV_PARENT_CLASS);
 		if (parctx == parent) {
@@ -67,7 +70,7 @@ nouveau_engctx_create_(struct nouveau_object *parent,
 	 * and reference it instead of creating a new one
 	 */
 	spin_lock_irqsave(&engine->lock, save);
-	ret = nouveau_engctx_exists(parent, engine, pobject);
+	ret = nouveau_engctx_exists(parent, flags, engine, pobject);
 	spin_unlock_irqrestore(&engine->lock, save);
 	if (ret)
 		return ret;
@@ -94,7 +97,7 @@ nouveau_engctx_create_(struct nouveau_object *parent,
 	 * it's not possible to allocate the object with it held.
 	 */
 	spin_lock_irqsave(&engine->lock, save);
-	ret = nouveau_engctx_exists(parent, engine, pobject);
+	ret = nouveau_engctx_exists(parent, flags, engine, pobject);
 	if (ret) {
 		spin_unlock_irqrestore(&engine->lock, save);
 		nouveau_object_ref(NULL, &engctx);
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index ca1a7d7..1d3dcd0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -695,9 +695,8 @@ nv50_disp_data_ctor(struct nouveau_object *parent,
 		    struct nouveau_oclass *oclass, void *data, u32 size,
 		    struct nouveau_object **pobject)
 {
-	struct nv50_disp_priv *priv = (void *)engine;
 	struct nouveau_engctx *ectx;
-	int ret = -EBUSY;
+	int ret;
 
 	/* no context needed for channel objects... */
 	if (nv_mclass(parent) != NV_DEVICE_CLASS) {
@@ -707,14 +706,10 @@ nv50_disp_data_ctor(struct nouveau_object *parent,
 	}
 
 	/* allocate display hardware to client */
-	mutex_lock(&nv_subdev(priv)->mutex);
-	if (list_empty(&nv_engine(priv)->contexts)) {
-		ret = nouveau_engctx_create(parent, engine, oclass, NULL,
-					    0x10000, 0x10000,
-					    NVOBJ_FLAG_HEAP, &ectx);
-		*pobject = nv_object(ectx);
-	}
-	mutex_unlock(&nv_subdev(priv)->mutex);
+	ret = nouveau_engctx_create(parent, engine, oclass, NULL, 0x10000, 0x10000,
+				    NVOBJ_FLAG_HEAP | NVOBJ_FLAG_CREAT_EXCL, &ectx);
+
+	*pobject = nv_object(ectx);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h b/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
index b3b9ce4..9d47d51 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/gpuobj.h
@@ -12,6 +12,7 @@ struct nouveau_vm;
 #define NVOBJ_FLAG_ZERO_ALLOC 0x00000001
 #define NVOBJ_FLAG_ZERO_FREE  0x00000002
 #define NVOBJ_FLAG_HEAP       0x00000004
+#define NVOBJ_FLAG_CREAT_EXCL 0x00000008
 
 struct nouveau_gpuobj {
 	struct nouveau_object base;

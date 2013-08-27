From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 6/9] drm/nouveau: Convert event handler list to RCU
Date: Tue, 27 Aug 2013 16:12:59 -0400
Message-ID: <1377634382-13872-7-git-send-email-peter@hurleysoftware.com>
References: <1377634382-13872-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1377634382-13872-1-git-send-email-peter@hurleysoftware.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dave Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, Peter Hurley <peter@hurleysoftware.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Lockdep report [1] correctly identifies a potential deadlock between
nouveau_drm_vblank_enable() and nouveau_drm_vblank_handler() due
to inverted lock order of event->lock with drm core's
dev->vblank_time_lock.

Fix vblank event deadlock by converting event handler list to RCU.
List updates remain serialized by event->lock.
List traversal & handler execution is lockless which prevents
inverted lock order problems with the drm core.
Safe deletion of the event handler is accomplished with
synchronize_rcu() for those handlers stored in nouveau_object-based
containers (nouveau_drm & nv50_/nvc0_software_context); otherwise,
with kfree_rcu (for nouveau_connector & uevent temporary handlers).

[1]
======================================================
[ INFO: possible circular locking dependency detected ]
3.10.0-0+tip-xeon+lockdep #0+tip Not tainted
-------------------------------------------------------
swapper/7/0 is trying to acquire lock:
 (&(&dev->vblank_time_lock)->rlock){-.....}, at: [<ffffffffa0086269>] drm_handle_vblank+0x69/0x400 [drm]

but task is already holding lock:
 (&(&event->lock)->rlock){-.....}, at: [<ffffffffa0101dbd>] nouveau_event_trigger+0x4d/0xd0 [nouveau]

which lock already depends on the new lock.

the existing dependency chain (in reverse order) is:

-> #1 (&(&event->lock)->rlock){-.....}:
       [<ffffffff810b6d62>] lock_acquire+0x92/0x1f0
       [<ffffffff8175e926>] _raw_spin_lock_irqsave+0x46/0x60
       [<ffffffffa0101cf7>] nouveau_event_get+0x27/0xa0 [nouveau]
       [<ffffffffa01807bd>] nouveau_drm_vblank_enable+0x8d/0xf0 [nouveau]
       [<ffffffffa00856d8>] drm_vblank_get+0xf8/0x2c0 [drm]
       [<ffffffffa00867f4>] drm_wait_vblank+0x84/0x6f0 [drm]
       [<ffffffffa0081719>] drm_ioctl+0x559/0x690 [drm]
       [<ffffffff811bed77>] do_vfs_ioctl+0x97/0x590
       [<ffffffff811bf301>] SyS_ioctl+0x91/0xb0
       [<ffffffff817677c2>] system_call_fastpath+0x16/0x1b

-> #0 (&(&dev->vblank_time_lock)->rlock){-.....}:
       [<ffffffff810b65c3>] __lock_acquire+0x1c43/0x1d30
       [<ffffffff810b6d62>] lock_acquire+0x92/0x1f0
       [<ffffffff8175e926>] _raw_spin_lock_irqsave+0x46/0x60
       [<ffffffffa0086269>] drm_handle_vblank+0x69/0x400 [drm]
       [<ffffffffa0180847>] nouveau_drm_vblank_handler+0x27/0x30 [nouveau]
       [<ffffffffa0101e00>] nouveau_event_trigger+0x90/0xd0 [nouveau]
       [<ffffffffa012dafd>] nv50_disp_intr+0xdd/0x230 [nouveau]
       [<ffffffffa0120451>] nouveau_mc_intr+0xa1/0x100 [nouveau]
       [<ffffffff810f3c7c>] handle_irq_event_percpu+0x6c/0x3d0
       [<ffffffff810f4028>] handle_irq_event+0x48/0x70
       [<ffffffff810f71ca>] handle_fasteoi_irq+0x5a/0x100
       [<ffffffff81004512>] handle_irq+0x22/0x40
       [<ffffffff817691fa>] do_IRQ+0x5a/0xd0
       [<ffffffff8175f76f>] ret_from_intr+0x0/0x13
       [<ffffffff8100b876>] arch_cpu_idle+0x26/0x30
       [<ffffffff810a5b4e>] cpu_startup_entry+0xce/0x410
       [<ffffffff81743d4e>] start_secondary+0x255/0x25c

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&(&event->lock)->rlock);
                               lock(&(&dev->vblank_time_lock)->rlock);
                               lock(&(&event->lock)->rlock);
  lock(&(&dev->vblank_time_lock)->rlock);

 *** DEADLOCK ***

1 lock held by swapper/7/0:
 #0:  (&(&event->lock)->rlock){-.....}, at: [<ffffffffa0101dbd>] nouveau_event_trigger+0x4d/0xd0 [nouveau]

stack backtrace:
CPU: 7 PID: 0 Comm: swapper/7 Not tainted 3.10.0-0+tip-xeon+lockdep #0+tip
Hardware name: Dell Inc. Precision WorkStation T5400  /0RW203, BIOS A11 04/30/2012
 ffffffff821ccf60 ffff8802bfdc3b08 ffffffff81755f39 ffff8802bfdc3b58
 ffffffff8174f526 0000000000000002 ffff8802bfdc3be8 ffff8802b330a7f8
 ffff8802b330a820 ffff8802b330a7f8 0000000000000000 0000000000000001
Call Trace:
 <IRQ>  [<ffffffff81755f39>] dump_stack+0x19/0x1b
 [<ffffffff8174f526>] print_circular_bug+0x1fb/0x20c
 [<ffffffff810b65c3>] __lock_acquire+0x1c43/0x1d30
 [<ffffffff810b1f8d>] ? trace_hardirqs_off+0xd/0x10
 [<ffffffff8102b1a8>] ? flat_send_IPI_mask+0x88/0xa0
 [<ffffffff810b6d62>] lock_acquire+0x92/0x1f0
 [<ffffffffa0086269>] ? drm_handle_vblank+0x69/0x400 [drm]
 [<ffffffff8175e926>] _raw_spin_lock_irqsave+0x46/0x60
 [<ffffffffa0086269>] ? drm_handle_vblank+0x69/0x400 [drm]
 [<ffffffffa0086269>] drm_handle_vblank+0x69/0x400 [drm]
 [<ffffffffa0180847>] nouveau_drm_vblank_handler+0x27/0x30 [nouveau]
 [<ffffffffa0101e00>] nouveau_event_trigger+0x90/0xd0 [nouveau]
 [<ffffffffa012dafd>] nv50_disp_intr+0xdd/0x230 [nouveau]
 [<ffffffff8175f182>] ? _raw_spin_unlock_irqrestore+0x42/0x80
 [<ffffffff8107800c>] ? __hrtimer_start_range_ns+0x16c/0x530
 [<ffffffffa0120451>] nouveau_mc_intr+0xa1/0x100 [nouveau]
 [<ffffffff810f3c7c>] handle_irq_event_percpu+0x6c/0x3d0
 [<ffffffff810f4028>] handle_irq_event+0x48/0x70
 [<ffffffff810f718e>] ? handle_fasteoi_irq+0x1e/0x100
 [<ffffffff810f71ca>] handle_fasteoi_irq+0x5a/0x100
 [<ffffffff81004512>] handle_irq+0x22/0x40
 [<ffffffff817691fa>] do_IRQ+0x5a/0xd0
 [<ffffffff8175f76f>] common_interrupt+0x6f/0x6f
 <EOI>  [<ffffffff8100ad3d>] ? default_idle+0x1d/0x290
 [<ffffffff8100ad3b>] ? default_idle+0x1b/0x290
 [<ffffffff8100b876>] arch_cpu_idle+0x26/0x30
 [<ffffffff810a5b4e>] cpu_startup_entry+0xce/0x410
 [<ffffffff810ae0dc>] ? clockevents_register_device+0xdc/0x140
 [<ffffffff81743d4e>] start_secondary+0x255/0x25c

Reported-by: Dave Jones <davej@redhat.com>
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c          | 22 +++++++++++-----------
 .../gpu/drm/nouveau/core/engine/software/nv50.c    |  1 +
 .../gpu/drm/nouveau/core/engine/software/nvc0.c    |  1 +
 drivers/gpu/drm/nouveau/core/include/core/event.h  |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 +
 6 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index 4cd1ebe..ce0a0ef 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -22,6 +22,7 @@
 
 #include <core/os.h>
 #include <core/event.h>
+#include <linux/rculist.h>
 
 void
 nouveau_event_handler_install(struct nouveau_event *event, int index,
@@ -37,7 +38,7 @@ nouveau_event_handler_install(struct nouveau_event *event, int index,
 	handler->priv = priv;
 
 	spin_lock_irqsave(&event->lock, flags);
-	list_add(&handler->head, &event->index[index].list);
+	list_add_rcu(&handler->head, &event->index[index].list);
 	spin_unlock_irqrestore(&event->lock, flags);
 }
 
@@ -51,7 +52,7 @@ nouveau_event_handler_remove(struct nouveau_event *event, int index,
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
-	list_del(&handler->head);
+	list_del_rcu(&handler->head);
 	spin_unlock_irqrestore(&event->lock, flags);
 }
 
@@ -71,7 +72,7 @@ nouveau_event_handler_create(struct nouveau_event *event, int index,
 	__set_bit(NVKM_EVENT_ENABLE, &handler->flags);
 
 	spin_lock_irqsave(&event->lock, flags);
-	list_add(&handler->head, &event->index[index].list);
+	list_add_rcu(&handler->head, &event->index[index].list);
 	if (!event->index[index].refs++) {
 		if (event->enable)
 			event->enable(event, index);
@@ -94,9 +95,9 @@ nouveau_event_handler_destroy(struct nouveau_event *event, int index,
 		if (event->disable)
 			event->disable(event, index);
 	}
-	list_del(&handler->head);
+	list_del_rcu(&handler->head);
 	spin_unlock_irqrestore(&event->lock, flags);
-	kfree(handler);
+	kfree_rcu(handler, rcu);
 }
 
 static void
@@ -147,20 +148,19 @@ nouveau_event_get(struct nouveau_event *event, int index,
 void
 nouveau_event_trigger(struct nouveau_event *event, int index)
 {
-	struct nouveau_eventh *handler, *temp;
-	unsigned long flags;
+	struct nouveau_eventh *handler;
 
 	if (index >= event->index_nr)
 		return;
 
-	spin_lock_irqsave(&event->lock, flags);
-	list_for_each_entry_safe(handler, temp, &event->index[index].list, head) {
+	rcu_read_lock();
+	list_for_each_entry_rcu(handler, &event->index[index].list, head) {
 		if (test_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
 			if (handler->func(handler, index) == NVKM_EVENT_DROP)
-				nouveau_event_put_locked(event, index, handler);
+				nouveau_event_put(event, index, handler);
 		}
 	}
-	spin_unlock_irqrestore(&event->lock, flags);
+	rcu_read_unlock();
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
index dfce1f5..87aeee1 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
@@ -191,6 +191,7 @@ nv50_software_context_dtor(struct nouveau_object *object)
 		nouveau_event_handler_remove(disp->vblank, i,
 					     &chan->base.vblank.event[i]);
 	}
+	synchronize_rcu();
 	_nouveau_software_context_dtor(object);
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
index d1f52c0..e87ba42 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
@@ -197,6 +197,7 @@ nvc0_software_context_dtor(struct nouveau_object *object)
 		nouveau_event_handler_remove(disp->vblank, i,
 					     &chan->base.vblank.event[i]);
 	}
+	synchronize_rcu();
 	_nouveau_software_context_dtor(object);
 }
 
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index 45e8a0f..f01b173 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -13,6 +13,7 @@ struct nouveau_eventh {
 	unsigned long flags;
 	void *priv;
 	int (*func)(struct nouveau_eventh *, int index);
+	struct rcu_head rcu;
 };
 
 struct nouveau_event {
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 13b38ed..14fce8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -106,7 +106,7 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	kfree(nv_connector->edid);
 	drm_sysfs_connector_remove(connector);
 	drm_connector_cleanup(connector);
-	kfree(connector);
+	kfree_rcu(nv_connector, hpd_func.rcu);
 }
 
 static struct nouveau_i2c_port *
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4187cad..544ca19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -432,6 +432,7 @@ nouveau_drm_unload(struct drm_device *dev)
 	for (i = 0; i < ARRAY_SIZE(drm->vblank); i++)
 		nouveau_event_handler_remove(disp->vblank, i,
 					     &drm->vblank[i]);
+	synchronize_rcu();
 
 	nouveau_cli_destroy(&drm->client);
 	return 0;
-- 
1.8.1.2

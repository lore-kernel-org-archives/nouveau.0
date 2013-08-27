From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 8/9] drm/nouveau: Simplify event interface
Date: Tue, 27 Aug 2013 16:13:01 -0400
Message-ID: <1377634382-13872-9-git-send-email-peter@hurleysoftware.com>
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

Store event back-pointer and index within struct event_handler;
remove superfluous parameters when event_handler is supplied.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c          | 36 +++++++++++++---------
 .../gpu/drm/nouveau/core/engine/software/nv50.c    | 11 ++-----
 .../gpu/drm/nouveau/core/engine/software/nvc0.c    | 11 ++-----
 drivers/gpu/drm/nouveau/core/include/core/event.h  | 15 +++++----
 drivers/gpu/drm/nouveau/nouveau_connector.c        |  5 +--
 drivers/gpu/drm/nouveau/nouveau_display.c          | 16 +++-------
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 10 ++----
 drivers/gpu/drm/nouveau/nouveau_fence.c            |  2 +-
 8 files changed, 44 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index 45bcb37..b7d8ae1 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -34,6 +34,9 @@ nouveau_event_handler_install(struct nouveau_event *event, int index,
 	if (index >= event->index_nr)
 		return;
 
+	handler->event = event;
+	handler->index = index;
+
 	handler->func = func;
 	handler->priv = priv;
 
@@ -43,12 +46,12 @@ nouveau_event_handler_install(struct nouveau_event *event, int index,
 }
 
 void
-nouveau_event_handler_remove(struct nouveau_event *event, int index,
-			     struct nouveau_eventh *handler)
+nouveau_event_handler_remove(struct nouveau_eventh *handler)
 {
+	struct nouveau_event *event = handler->event;
 	unsigned long flags;
 
-	if (index >= event->index_nr)
+	if (!event)
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
@@ -67,6 +70,10 @@ nouveau_event_handler_create(struct nouveau_event *event, int index,
 	handler = *phandler = kzalloc(sizeof(*handler), GFP_KERNEL);
 	if (!handler)
 		return -ENOMEM;
+
+	handler->event = event;
+	handler->index = index;
+
 	handler->func = func;
 	handler->priv = priv;
 	__set_bit(NVKM_EVENT_ENABLE, &handler->flags);
@@ -82,13 +89,12 @@ nouveau_event_handler_create(struct nouveau_event *event, int index,
 }
 
 void
-nouveau_event_handler_destroy(struct nouveau_event *event, int index,
-			      struct nouveau_eventh *handler)
+nouveau_event_handler_destroy(struct nouveau_eventh *handler)
 {
+	struct nouveau_event *event = handler->event;
+	int index = handler->index;
 	unsigned long flags;
 
-	if (index >= event->index_nr)
-		return;
 
 	spin_lock_irqsave(&event->lock, flags);
 	if (!--event->index[index].refs) {
@@ -101,12 +107,13 @@ nouveau_event_handler_destroy(struct nouveau_event *event, int index,
 }
 
 void
-nouveau_event_put(struct nouveau_event *event, int index,
-		  struct nouveau_eventh *handler)
+nouveau_event_put(struct nouveau_eventh *handler)
 {
+	struct nouveau_event *event = handler->event;
+	int index = handler->index;
 	unsigned long flags;
 
-	if (index >= event->index_nr)
+	if (!event)
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
@@ -120,12 +127,13 @@ nouveau_event_put(struct nouveau_event *event, int index,
 }
 
 void
-nouveau_event_get(struct nouveau_event *event, int index,
-		  struct nouveau_eventh *handler)
+nouveau_event_get(struct nouveau_eventh *handler)
 {
+	struct nouveau_event *event = handler->event;
+	int index = handler->index;
 	unsigned long flags;
 
-	if (index >= event->index_nr)
+	if (!event)
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
@@ -150,7 +158,7 @@ nouveau_event_trigger(struct nouveau_event *event, int index)
 	list_for_each_entry_rcu(handler, &event->index[index].list, head) {
 		if (test_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
 			if (handler->func(handler, index) == NVKM_EVENT_DROP)
-				nouveau_event_put(event, index, handler);
+				nouveau_event_put(handler);
 		}
 	}
 	rcu_read_unlock();
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
index 87aeee1..e969f0c 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
@@ -92,12 +92,11 @@ nv50_software_mthd_vblsem_release(struct nouveau_object *object, u32 mthd,
 				  void *args, u32 size)
 {
 	struct nv50_software_chan *chan = (void *)nv_engctx(object->parent);
-	struct nouveau_disp *disp = nouveau_disp(object);
 	u32 crtc = *(u32 *)args;
 	if (crtc > 1)
 		return -EINVAL;
 
-	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event[crtc]);
+	nouveau_event_get(&chan->base.vblank.event[crtc]);
 	return 0;
 }
 
@@ -183,14 +182,10 @@ void
 nv50_software_context_dtor(struct nouveau_object *object)
 {
 	struct nv50_software_chan *chan = (void *)object;
-	struct nv50_software_priv *priv = (void *)nv_object(chan)->engine;
-	struct nouveau_disp *disp = nouveau_disp(priv);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
-		nouveau_event_handler_remove(disp->vblank, i,
-					     &chan->base.vblank.event[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++)
+		nouveau_event_handler_remove(&chan->base.vblank.event[i]);
 	synchronize_rcu();
 	_nouveau_software_context_dtor(object);
 }
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
index e87ba42..d06658a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
@@ -74,13 +74,12 @@ nvc0_software_mthd_vblsem_release(struct nouveau_object *object, u32 mthd,
 				  void *args, u32 size)
 {
 	struct nvc0_software_chan *chan = (void *)nv_engctx(object->parent);
-	struct nouveau_disp *disp = nouveau_disp(object);
 	u32 crtc = *(u32 *)args;
 
 	if ((nv_device(object)->card_type < NV_E0 && crtc > 1) || crtc > 3)
 		return -EINVAL;
 
-	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event[crtc]);
+	nouveau_event_get(&chan->base.vblank.event[crtc]);
 	return 0;
 }
 
@@ -189,14 +188,10 @@ void
 nvc0_software_context_dtor(struct nouveau_object *object)
 {
 	struct nvc0_software_chan *chan = (void *)object;
-	struct nvc0_software_priv *priv = (void *)nv_object(chan)->engine;
-	struct nouveau_disp *disp = nouveau_disp(priv);
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
-		nouveau_event_handler_remove(disp->vblank, i,
-					     &chan->base.vblank.event[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++)
+		nouveau_event_handler_remove(&chan->base.vblank.event[i]);
 	synchronize_rcu();
 	_nouveau_software_context_dtor(object);
 }
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index f01b173..e839d70 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -9,11 +9,14 @@
 #define NVKM_EVENT_ENABLE 0
 
 struct nouveau_eventh {
+	struct nouveau_event *event;
+
 	struct list_head head;
 	unsigned long flags;
 	void *priv;
 	int (*func)(struct nouveau_eventh *, int index);
 	struct rcu_head rcu;
+	int index;
 };
 
 struct nouveau_event {
@@ -34,21 +37,17 @@ int  nouveau_event_create(int index_nr, struct nouveau_event **);
 void nouveau_event_destroy(struct nouveau_event **);
 void nouveau_event_trigger(struct nouveau_event *, int index);
 
-void nouveau_event_get(struct nouveau_event *, int index,
-		       struct nouveau_eventh *);
-void nouveau_event_put(struct nouveau_event *, int index,
-		       struct nouveau_eventh *);
+void nouveau_event_get(struct nouveau_eventh *);
+void nouveau_event_put(struct nouveau_eventh *);
 
 int nouveau_event_handler_create(struct nouveau_event *, int index,
 				 int (*func)(struct nouveau_eventh*, int),
 				 void *priv, struct nouveau_eventh **);
-void nouveau_event_handler_destroy(struct nouveau_event *, int index,
-				   struct nouveau_eventh *);
+void nouveau_event_handler_destroy(struct nouveau_eventh *);
 
 void nouveau_event_handler_install(struct nouveau_event *, int index,
 				   int (*func)(struct nouveau_eventh*, int),
 				   void *priv, struct nouveau_eventh *);
-void nouveau_event_handler_remove(struct nouveau_event *, int index,
-				  struct nouveau_eventh *);
+void nouveau_event_handler_remove(struct nouveau_eventh *);
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 14fce8a..85494d2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -98,11 +98,8 @@ static void
 nouveau_connector_destroy(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
-	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nouveau_gpio *gpio = nouveau_gpio(drm->device);
 
-	nouveau_event_handler_remove(gpio->events, nv_connector->hpd.line,
-				     &nv_connector->hpd_func);
+	nouveau_event_handler_remove(&nv_connector->hpd_func);
 	kfree(nv_connector->edid);
 	drm_sysfs_connector_remove(connector);
 	drm_connector_cleanup(connector);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 78637af..e9b1132 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -222,9 +222,7 @@ static struct nouveau_drm_prop_enum_list dither_depth[] = {
 int
 nouveau_display_init(struct drm_device *dev)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
-	struct nouveau_gpio *gpio = nouveau_gpio(drm->device);
 	struct drm_connector *connector;
 	int ret;
 
@@ -238,10 +236,8 @@ nouveau_display_init(struct drm_device *dev)
 	/* enable hotplug interrupts */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		struct nouveau_connector *conn = nouveau_connector(connector);
-		if (gpio && conn->hpd.func != DCB_GPIO_UNUSED) {
-			nouveau_event_get(gpio->events, conn->hpd.line,
-					 &conn->hpd_func);
-		}
+		if (conn->hpd.func != DCB_GPIO_UNUSED)
+			nouveau_event_get(&conn->hpd_func);
 	}
 
 	return ret;
@@ -250,18 +246,14 @@ nouveau_display_init(struct drm_device *dev)
 void
 nouveau_display_fini(struct drm_device *dev)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
-	struct nouveau_gpio *gpio = nouveau_gpio(drm->device);
 	struct drm_connector *connector;
 
 	/* disable hotplug interrupts */
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		struct nouveau_connector *conn = nouveau_connector(connector);
-		if (gpio && conn->hpd.func != DCB_GPIO_UNUSED) {
-			nouveau_event_put(gpio->events, conn->hpd.line,
-					 &conn->hpd_func);
-		}
+		if (conn->hpd.func != DCB_GPIO_UNUSED)
+			nouveau_event_put(&conn->hpd_func);
 	}
 
 	drm_kms_helper_poll_disable(dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 544ca19..845dd57 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -84,11 +84,10 @@ static int
 nouveau_drm_vblank_enable(struct drm_device *dev, int head)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
 
 	if (WARN_ON_ONCE(head > ARRAY_SIZE(drm->vblank)))
 		return -EIO;
-	nouveau_event_get(pdisp->vblank, head, &drm->vblank[head]);
+	nouveau_event_get(&drm->vblank[head]);
 	return 0;
 }
 
@@ -96,9 +95,8 @@ static void
 nouveau_drm_vblank_disable(struct drm_device *dev, int head)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
 
-	nouveau_event_put(pdisp->vblank, head, &drm->vblank[head]);
+	nouveau_event_put(&drm->vblank[head]);
 }
 
 static u64
@@ -411,7 +409,6 @@ static int
 nouveau_drm_unload(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nouveau_disp *disp = nouveau_disp(drm->device);
 	int i;
 
 	nouveau_fbcon_fini(dev);
@@ -430,8 +427,7 @@ nouveau_drm_unload(struct drm_device *dev)
 	nouveau_vga_fini(drm);
 
 	for (i = 0; i < ARRAY_SIZE(drm->vblank); i++)
-		nouveau_event_handler_remove(disp->vblank, i,
-					     &drm->vblank[i]);
+		nouveau_event_handler_remove(&drm->vblank[i]);
 	synchronize_rcu();
 
 	nouveau_cli_destroy(&drm->client);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 6dde483..0ae280a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -219,7 +219,7 @@ nouveau_fence_wait_uevent(struct nouveau_fence *fence, bool intr)
 		}
 	}
 
-	nouveau_event_handler_destroy(pfifo->uevent, 0, handler);
+	nouveau_event_handler_destroy(handler);
 	if (unlikely(ret < 0))
 		return ret;
 
-- 
1.8.1.2

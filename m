From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 5/9] drm/nouveau: Add install/remove semantics for event
	handlers
Date: Tue, 27 Aug 2013 16:12:58 -0400
Message-ID: <1377634382-13872-6-git-send-email-peter@hurleysoftware.com>
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

Complete migration of nouveau_event_get/_put from add/remove
semantics to enable/disable semantics.

Introduce nouveau_event_handler_install/_remove interface to
add/remove non-local-scope event handlers (ie., those stored in
parent containers). This change in semantics makes explicit the
handler lifetime, and distinguishes "one-of" event handlers
(such as gpio) from "many temporary" event handlers (such as uevent).

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c          | 63 +++++++++++++++++++---
 .../gpu/drm/nouveau/core/engine/software/nv50.c    | 31 +++++++++--
 .../gpu/drm/nouveau/core/engine/software/nvc0.c    | 31 +++++++++--
 drivers/gpu/drm/nouveau/core/include/core/event.h  |  6 +++
 .../gpu/drm/nouveau/core/include/engine/software.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c        | 10 +++-
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 17 +++++-
 7 files changed, 140 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index 0a65ede..4cd1ebe 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -23,19 +23,60 @@
 #include <core/os.h>
 #include <core/event.h>
 
+void
+nouveau_event_handler_install(struct nouveau_event *event, int index,
+			      int (*func)(struct nouveau_eventh*, int),
+			      void *priv, struct nouveau_eventh *handler)
+{
+	unsigned long flags;
+
+	if (index >= event->index_nr)
+		return;
+
+	handler->func = func;
+	handler->priv = priv;
+
+	spin_lock_irqsave(&event->lock, flags);
+	list_add(&handler->head, &event->index[index].list);
+	spin_unlock_irqrestore(&event->lock, flags);
+}
+
+void
+nouveau_event_handler_remove(struct nouveau_event *event, int index,
+			     struct nouveau_eventh *handler)
+{
+	unsigned long flags;
+
+	if (index >= event->index_nr)
+		return;
+
+	spin_lock_irqsave(&event->lock, flags);
+	list_del(&handler->head);
+	spin_unlock_irqrestore(&event->lock, flags);
+}
+
 int
 nouveau_event_handler_create(struct nouveau_event *event, int index,
 			     int (*func)(struct nouveau_eventh*, int),
 			     void *priv, struct nouveau_eventh **phandler)
 {
 	struct nouveau_eventh *handler;
+	unsigned long flags;
 
 	handler = *phandler = kzalloc(sizeof(*handler), GFP_KERNEL);
 	if (!handler)
 		return -ENOMEM;
 	handler->func = func;
 	handler->priv = priv;
-	nouveau_event_get(event, index, handler);
+	__set_bit(NVKM_EVENT_ENABLE, &handler->flags);
+
+	spin_lock_irqsave(&event->lock, flags);
+	list_add(&handler->head, &event->index[index].list);
+	if (!event->index[index].refs++) {
+		if (event->enable)
+			event->enable(event, index);
+	}
+	spin_unlock_irqrestore(&event->lock, flags);
 	return 0;
 }
 
@@ -43,7 +84,18 @@ void
 nouveau_event_handler_destroy(struct nouveau_event *event, int index,
 			      struct nouveau_eventh *handler)
 {
-	nouveau_event_put(event, index, handler);
+	unsigned long flags;
+
+	if (index >= event->index_nr)
+		return;
+
+	spin_lock_irqsave(&event->lock, flags);
+	if (!--event->index[index].refs) {
+		if (event->disable)
+			event->disable(event, index);
+	}
+	list_del(&handler->head);
+	spin_unlock_irqrestore(&event->lock, flags);
 	kfree(handler);
 }
 
@@ -56,7 +108,6 @@ nouveau_event_put_locked(struct nouveau_event *event, int index,
 			if (event->disable)
 				event->disable(event, index);
 		}
-		list_del(&handler->head);
 	}
 }
 
@@ -85,7 +136,6 @@ nouveau_event_get(struct nouveau_event *event, int index,
 
 	spin_lock_irqsave(&event->lock, flags);
 	if (!__test_and_set_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
-		list_add(&handler->head, &event->index[index].list);
 		if (!event->index[index].refs++) {
 			if (event->enable)
 				event->enable(event, index);
@@ -105,8 +155,9 @@ nouveau_event_trigger(struct nouveau_event *event, int index)
 
 	spin_lock_irqsave(&event->lock, flags);
 	list_for_each_entry_safe(handler, temp, &event->index[index].list, head) {
-		if (handler->func(handler, index) == NVKM_EVENT_DROP) {
-			nouveau_event_put_locked(event, index, handler);
+		if (test_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
+			if (handler->func(handler, index) == NVKM_EVENT_DROP)
+				nouveau_event_put_locked(event, index, handler);
 		}
 	}
 	spin_unlock_irqrestore(&event->lock, flags);
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
index c48e749..dfce1f5 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
@@ -97,7 +97,7 @@ nv50_software_mthd_vblsem_release(struct nouveau_object *object, u32 mthd,
 	if (crtc > 1)
 		return -EINVAL;
 
-	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event);
+	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event[crtc]);
 	return 0;
 }
 
@@ -135,7 +135,7 @@ static int
 nv50_software_vblsem_release(struct nouveau_eventh *event, int head)
 {
 	struct nouveau_software_chan *chan =
-		container_of(event, struct nouveau_software_chan, vblank.event);
+		container_of(event, struct nouveau_software_chan, vblank.event[head]);
 	struct nv50_software_priv *priv = (void *)nv_object(chan)->engine;
 	struct nouveau_bar *bar = nouveau_bar(priv);
 
@@ -161,7 +161,8 @@ nv50_software_context_ctor(struct nouveau_object *parent,
 			   struct nouveau_object **pobject)
 {
 	struct nv50_software_chan *chan;
-	int ret;
+	struct nouveau_disp *disp = nouveau_disp(engine);
+	int ret, i;
 
 	ret = nouveau_software_context_create(parent, engine, oclass, &chan);
 	*pobject = nv_object(chan);
@@ -169,16 +170,36 @@ nv50_software_context_ctor(struct nouveau_object *parent,
 		return ret;
 
 	chan->base.vblank.channel = nv_gpuobj(parent->parent)->addr >> 12;
-	chan->base.vblank.event.func = nv50_software_vblsem_release;
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
+		nouveau_event_handler_install(disp->vblank, i,
+					      nv50_software_vblsem_release,
+					      NULL,
+					      &chan->base.vblank.event[i]);
+	}
 	return 0;
 }
 
+void
+nv50_software_context_dtor(struct nouveau_object *object)
+{
+	struct nv50_software_chan *chan = (void *)object;
+	struct nv50_software_priv *priv = (void *)nv_object(chan)->engine;
+	struct nouveau_disp *disp = nouveau_disp(priv);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
+		nouveau_event_handler_remove(disp->vblank, i,
+					     &chan->base.vblank.event[i]);
+	}
+	_nouveau_software_context_dtor(object);
+}
+
 static struct nouveau_oclass
 nv50_software_cclass = {
 	.handle = NV_ENGCTX(SW, 0x50),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nv50_software_context_ctor,
-		.dtor = _nouveau_software_context_dtor,
+		.dtor = nv50_software_context_dtor,
 		.init = _nouveau_software_context_init,
 		.fini = _nouveau_software_context_fini,
 	},
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
index d698e71..d1f52c0 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
@@ -80,7 +80,7 @@ nvc0_software_mthd_vblsem_release(struct nouveau_object *object, u32 mthd,
 	if ((nv_device(object)->card_type < NV_E0 && crtc > 1) || crtc > 3)
 		return -EINVAL;
 
-	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event);
+	nouveau_event_get(disp->vblank, crtc, &chan->base.vblank.event[crtc]);
 	return 0;
 }
 
@@ -147,7 +147,7 @@ static int
 nvc0_software_vblsem_release(struct nouveau_eventh *event, int head)
 {
 	struct nouveau_software_chan *chan =
-		container_of(event, struct nouveau_software_chan, vblank.event);
+		container_of(event, struct nouveau_software_chan, vblank.event[head]);
 	struct nvc0_software_priv *priv = (void *)nv_object(chan)->engine;
 	struct nouveau_bar *bar = nouveau_bar(priv);
 
@@ -167,7 +167,8 @@ nvc0_software_context_ctor(struct nouveau_object *parent,
 			   struct nouveau_object **pobject)
 {
 	struct nvc0_software_chan *chan;
-	int ret;
+	struct nouveau_disp *disp = nouveau_disp(engine);
+	int ret, i;
 
 	ret = nouveau_software_context_create(parent, engine, oclass, &chan);
 	*pobject = nv_object(chan);
@@ -175,16 +176,36 @@ nvc0_software_context_ctor(struct nouveau_object *parent,
 		return ret;
 
 	chan->base.vblank.channel = nv_gpuobj(parent->parent)->addr >> 12;
-	chan->base.vblank.event.func = nvc0_software_vblsem_release;
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
+		nouveau_event_handler_install(disp->vblank, i,
+					      nvc0_software_vblsem_release,
+					      NULL,
+					      &chan->base.vblank.event[i]);
+	}
 	return 0;
 }
 
+void
+nvc0_software_context_dtor(struct nouveau_object *object)
+{
+	struct nvc0_software_chan *chan = (void *)object;
+	struct nvc0_software_priv *priv = (void *)nv_object(chan)->engine;
+	struct nouveau_disp *disp = nouveau_disp(priv);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
+		nouveau_event_handler_remove(disp->vblank, i,
+					     &chan->base.vblank.event[i]);
+	}
+	_nouveau_software_context_dtor(object);
+}
+
 static struct nouveau_oclass
 nvc0_software_cclass = {
 	.handle = NV_ENGCTX(SW, 0xc0),
 	.ofuncs = &(struct nouveau_ofuncs) {
 		.ctor = nvc0_software_context_ctor,
-		.dtor = _nouveau_software_context_dtor,
+		.dtor = nvc0_software_context_dtor,
 		.init = _nouveau_software_context_init,
 		.fini = _nouveau_software_context_fini,
 	},
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index 3e704d5..45e8a0f 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -44,4 +44,10 @@ int nouveau_event_handler_create(struct nouveau_event *, int index,
 void nouveau_event_handler_destroy(struct nouveau_event *, int index,
 				   struct nouveau_eventh *);
 
+void nouveau_event_handler_install(struct nouveau_event *, int index,
+				   int (*func)(struct nouveau_eventh*, int),
+				   void *priv, struct nouveau_eventh *);
+void nouveau_event_handler_remove(struct nouveau_event *, int index,
+				  struct nouveau_eventh *);
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/core/include/engine/software.h b/drivers/gpu/drm/nouveau/core/include/engine/software.h
index 4579948..bc26ea8 100644
--- a/drivers/gpu/drm/nouveau/core/include/engine/software.h
+++ b/drivers/gpu/drm/nouveau/core/include/engine/software.h
@@ -9,7 +9,7 @@ struct nouveau_software_chan {
 	struct nouveau_engctx base;
 
 	struct {
-		struct nouveau_eventh event;
+		struct nouveau_eventh event[4];
 		u32 channel;
 		u32 ctxdma;
 		u64 offset;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 4da776f..13b38ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -98,6 +98,11 @@ static void
 nouveau_connector_destroy(struct drm_connector *connector)
 {
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
+	struct nouveau_drm *drm = nouveau_drm(connector->dev);
+	struct nouveau_gpio *gpio = nouveau_gpio(drm->device);
+
+	nouveau_event_handler_remove(gpio->events, nv_connector->hpd.line,
+				     &nv_connector->hpd_func);
 	kfree(nv_connector->edid);
 	drm_sysfs_connector_remove(connector);
 	drm_connector_cleanup(connector);
@@ -990,7 +995,10 @@ nouveau_connector_create(struct drm_device *dev, int index)
 
 		ret = gpio->find(gpio, 0, hpd[ffs((entry & 0x07033000) >> 12)],
 				 DCB_GPIO_UNUSED, &nv_connector->hpd);
-		nv_connector->hpd_func.func = nouveau_connector_hotplug;
+		nouveau_event_handler_install(gpio->events,
+					      nv_connector->hpd.line,
+					      nouveau_connector_hotplug, NULL,
+					      &nv_connector->hpd_func);
 		if (ret)
 			nv_connector->hpd.func = DCB_GPIO_UNUSED;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ccea2c4..4187cad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -88,7 +88,6 @@ nouveau_drm_vblank_enable(struct drm_device *dev, int head)
 
 	if (WARN_ON_ONCE(head > ARRAY_SIZE(drm->vblank)))
 		return -EIO;
-	drm->vblank[head].func = nouveau_drm_vblank_handler;
 	nouveau_event_get(pdisp->vblank, head, &drm->vblank[head]);
 	return 0;
 }
@@ -298,7 +297,8 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	struct pci_dev *pdev = dev->pdev;
 	struct nouveau_device *device;
 	struct nouveau_drm *drm;
-	int ret;
+	struct nouveau_disp *disp;
+	int ret, i;
 
 	ret = nouveau_cli_create(pdev, "DRM", sizeof(*drm), (void**)&drm);
 	if (ret)
@@ -352,6 +352,13 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	if (nv_device(drm->device)->chipset == 0xc1)
 		nv_mask(device, 0x00088080, 0x00000800, 0x00000000);
 
+	disp = nouveau_disp(device);
+	for (i = 0; i < ARRAY_SIZE(drm->vblank); i++) {
+		nouveau_event_handler_install(disp->vblank, i,
+					      nouveau_drm_vblank_handler,
+					      NULL, &drm->vblank[i]);
+	}
+
 	nouveau_vga_init(drm);
 	nouveau_agp_init(drm);
 
@@ -404,6 +411,8 @@ static int
 nouveau_drm_unload(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_disp *disp = nouveau_disp(drm->device);
+	int i;
 
 	nouveau_fbcon_fini(dev);
 	nouveau_accel_fini(drm);
@@ -420,6 +429,10 @@ nouveau_drm_unload(struct drm_device *dev)
 	nouveau_agp_fini(drm);
 	nouveau_vga_fini(drm);
 
+	for (i = 0; i < ARRAY_SIZE(drm->vblank); i++)
+		nouveau_event_handler_remove(disp->vblank, i,
+					     &drm->vblank[i]);
+
 	nouveau_cli_destroy(&drm->client);
 	return 0;
 }
-- 
1.8.1.2

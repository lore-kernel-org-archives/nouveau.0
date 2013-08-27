From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 9/9] drm/nouveau: Simplify event handler interface
Date: Tue, 27 Aug 2013 16:13:02 -0400
Message-ID: <1377634382-13872-10-git-send-email-peter@hurleysoftware.com>
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

Remove index parameter; access index via handler->index instead.
Dissociate handler from related container; use handler->priv to
access container.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c           | 6 +++---
 drivers/gpu/drm/nouveau/core/engine/software/nv50.c | 7 +++----
 drivers/gpu/drm/nouveau/core/engine/software/nvc0.c | 7 +++----
 drivers/gpu/drm/nouveau/core/include/core/event.h   | 6 +++---
 drivers/gpu/drm/nouveau/nouveau_connector.c         | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_drm.c               | 9 +++++----
 drivers/gpu/drm/nouveau/nouveau_fence.c             | 2 +-
 7 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index b7d8ae1..1240fef 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -26,7 +26,7 @@
 
 void
 nouveau_event_handler_install(struct nouveau_event *event, int index,
-			      int (*func)(struct nouveau_eventh*, int),
+			      int (*func)(struct nouveau_eventh*),
 			      void *priv, struct nouveau_eventh *handler)
 {
 	unsigned long flags;
@@ -61,7 +61,7 @@ nouveau_event_handler_remove(struct nouveau_eventh *handler)
 
 int
 nouveau_event_handler_create(struct nouveau_event *event, int index,
-			     int (*func)(struct nouveau_eventh*, int),
+			     int (*func)(struct nouveau_eventh*),
 			     void *priv, struct nouveau_eventh **phandler)
 {
 	struct nouveau_eventh *handler;
@@ -157,7 +157,7 @@ nouveau_event_trigger(struct nouveau_event *event, int index)
 	rcu_read_lock();
 	list_for_each_entry_rcu(handler, &event->index[index].list, head) {
 		if (test_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
-			if (handler->func(handler, index) == NVKM_EVENT_DROP)
+			if (handler->func(handler) == NVKM_EVENT_DROP)
 				nouveau_event_put(handler);
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
index e969f0c..bf6f23b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nv50.c
@@ -131,10 +131,9 @@ nv50_software_sclass[] = {
  ******************************************************************************/
 
 static int
-nv50_software_vblsem_release(struct nouveau_eventh *event, int head)
+nv50_software_vblsem_release(struct nouveau_eventh *handler)
 {
-	struct nouveau_software_chan *chan =
-		container_of(event, struct nouveau_software_chan, vblank.event[head]);
+	struct nouveau_software_chan *chan = handler->priv;
 	struct nv50_software_priv *priv = (void *)nv_object(chan)->engine;
 	struct nouveau_bar *bar = nouveau_bar(priv);
 
@@ -172,7 +171,7 @@ nv50_software_context_ctor(struct nouveau_object *parent,
 	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
 		nouveau_event_handler_install(disp->vblank, i,
 					      nv50_software_vblsem_release,
-					      NULL,
+					      chan,
 					      &chan->base.vblank.event[i]);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
index d06658a..1a2a7a8 100644
--- a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c
@@ -143,10 +143,9 @@ nvc0_software_sclass[] = {
  ******************************************************************************/
 
 static int
-nvc0_software_vblsem_release(struct nouveau_eventh *event, int head)
+nvc0_software_vblsem_release(struct nouveau_eventh *handler)
 {
-	struct nouveau_software_chan *chan =
-		container_of(event, struct nouveau_software_chan, vblank.event[head]);
+	struct nouveau_software_chan *chan = handler->priv;
 	struct nvc0_software_priv *priv = (void *)nv_object(chan)->engine;
 	struct nouveau_bar *bar = nouveau_bar(priv);
 
@@ -178,7 +177,7 @@ nvc0_software_context_ctor(struct nouveau_object *parent,
 	for (i = 0; i < ARRAY_SIZE(chan->base.vblank.event); i++) {
 		nouveau_event_handler_install(disp->vblank, i,
 					      nvc0_software_vblsem_release,
-					      NULL,
+					      chan,
 					      &chan->base.vblank.event[i]);
 	}
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index e839d70..d062176 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -14,7 +14,7 @@ struct nouveau_eventh {
 	struct list_head head;
 	unsigned long flags;
 	void *priv;
-	int (*func)(struct nouveau_eventh *, int index);
+	int (*func)(struct nouveau_eventh *);
 	struct rcu_head rcu;
 	int index;
 };
@@ -41,12 +41,12 @@ void nouveau_event_get(struct nouveau_eventh *);
 void nouveau_event_put(struct nouveau_eventh *);
 
 int nouveau_event_handler_create(struct nouveau_event *, int index,
-				 int (*func)(struct nouveau_eventh*, int),
+				 int (*func)(struct nouveau_eventh*),
 				 void *priv, struct nouveau_eventh **);
 void nouveau_event_handler_destroy(struct nouveau_eventh *);
 
 void nouveau_event_handler_install(struct nouveau_event *, int index,
-				   int (*func)(struct nouveau_eventh*, int),
+				   int (*func)(struct nouveau_eventh*),
 				   void *priv, struct nouveau_eventh *);
 void nouveau_event_handler_remove(struct nouveau_eventh *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 85494d2..bfe28a0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -917,10 +917,10 @@ nouveau_connector_hotplug_work(struct work_struct *work)
 }
 
 static int
-nouveau_connector_hotplug(struct nouveau_eventh *event, int index)
+nouveau_connector_hotplug(struct nouveau_eventh *handler)
 {
-	struct nouveau_connector *nv_connector =
-		container_of(event, struct nouveau_connector, hpd_func);
+	struct nouveau_connector *nv_connector = handler->priv;
+
 	schedule_work(&nv_connector->hpd_work);
 	return NVKM_EVENT_KEEP;
 }
@@ -994,7 +994,8 @@ nouveau_connector_create(struct drm_device *dev, int index)
 				 DCB_GPIO_UNUSED, &nv_connector->hpd);
 		nouveau_event_handler_install(gpio->events,
 					      nv_connector->hpd.line,
-					      nouveau_connector_hotplug, NULL,
+					      nouveau_connector_hotplug,
+					      nv_connector,
 					      &nv_connector->hpd_func);
 		if (ret)
 			nv_connector->hpd.func = DCB_GPIO_UNUSED;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 845dd57..2e6a226 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -72,10 +72,11 @@ module_param_named(modeset, nouveau_modeset, int, 0400);
 static struct drm_driver driver;
 
 static int
-nouveau_drm_vblank_handler(struct nouveau_eventh *event, int head)
+nouveau_drm_vblank_handler(struct nouveau_eventh *handler)
 {
-	struct nouveau_drm *drm =
-		container_of(event, struct nouveau_drm, vblank[head]);
+	struct nouveau_drm *drm = handler->priv;
+	int head = handler->index;
+
 	drm_handle_vblank(drm->dev, head);
 	return NVKM_EVENT_KEEP;
 }
@@ -354,7 +355,7 @@ nouveau_drm_load(struct drm_device *dev, unsigned long flags)
 	for (i = 0; i < ARRAY_SIZE(drm->vblank); i++) {
 		nouveau_event_handler_install(disp->vblank, i,
 					      nouveau_drm_vblank_handler,
-					      NULL, &drm->vblank[i]);
+					      drm, &drm->vblank[i]);
 	}
 
 	nouveau_vga_init(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 0ae280a..f9bff26 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -166,7 +166,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 }
 
 static int
-nouveau_fence_wait_uevent_handler(struct nouveau_eventh *handler, int index)
+nouveau_fence_wait_uevent_handler(struct nouveau_eventh *handler)
 {
 	struct nouveau_fence_priv *priv = handler->priv;
 	wake_up_all(&priv->waiting);
-- 
1.8.1.2

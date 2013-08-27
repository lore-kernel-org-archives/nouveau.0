From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 4/9] drm/nouveau: Allow asymmetric nouveau_event_get/_put
Date: Tue, 27 Aug 2013 16:12:57 -0400
Message-ID: <1377634382-13872-5-git-send-email-peter@hurleysoftware.com>
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

Most nouveau event handlers have storage in 'static' containers
(structures with lifetimes nearly equivalent to the drm_device),
but are dangerously reused via nouveau_event_get/_put. For
example, if nouveau_event_get is called more than once for a
given handler, the event handler list will be corrupted.

Migrate nouveau_event_get/_put from add/remove semantics to
enable/disable semantics.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c         | 20 ++++++++++++--------
 drivers/gpu/drm/nouveau/core/include/core/event.h |  4 ++++
 drivers/gpu/drm/nouveau/nouveau_drm.c             |  8 ++------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index 1a8d685..0a65ede 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -51,11 +51,13 @@ static void
 nouveau_event_put_locked(struct nouveau_event *event, int index,
 			 struct nouveau_eventh *handler)
 {
-	if (!--event->index[index].refs) {
-		if (event->disable)
-			event->disable(event, index);
+	if (__test_and_clear_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
+		if (!--event->index[index].refs) {
+			if (event->disable)
+				event->disable(event, index);
+		}
+		list_del(&handler->head);
 	}
-	list_del(&handler->head);
 }
 
 void
@@ -82,10 +84,12 @@ nouveau_event_get(struct nouveau_event *event, int index,
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
-	list_add(&handler->head, &event->index[index].list);
-	if (!event->index[index].refs++) {
-		if (event->enable)
-			event->enable(event, index);
+	if (!__test_and_set_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
+		list_add(&handler->head, &event->index[index].list);
+		if (!event->index[index].refs++) {
+			if (event->enable)
+				event->enable(event, index);
+		}
 	}
 	spin_unlock_irqrestore(&event->lock, flags);
 }
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index bdf1a0a..3e704d5 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -5,8 +5,12 @@
 #define NVKM_EVENT_DROP 0
 #define NVKM_EVENT_KEEP 1
 
+/* nouveau_eventh.flags bit #s */
+#define NVKM_EVENT_ENABLE 0
+
 struct nouveau_eventh {
 	struct list_head head;
+	unsigned long flags;
 	void *priv;
 	int (*func)(struct nouveau_eventh *, int index);
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b29d04b..ccea2c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -88,7 +88,6 @@ nouveau_drm_vblank_enable(struct drm_device *dev, int head)
 
 	if (WARN_ON_ONCE(head > ARRAY_SIZE(drm->vblank)))
 		return -EIO;
-	WARN_ON_ONCE(drm->vblank[head].func);
 	drm->vblank[head].func = nouveau_drm_vblank_handler;
 	nouveau_event_get(pdisp->vblank, head, &drm->vblank[head]);
 	return 0;
@@ -99,11 +98,8 @@ nouveau_drm_vblank_disable(struct drm_device *dev, int head)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_disp *pdisp = nouveau_disp(drm->device);
-	if (drm->vblank[head].func)
-		nouveau_event_put(pdisp->vblank, head, &drm->vblank[head]);
-	else
-		WARN_ON_ONCE(1);
-	drm->vblank[head].func = NULL;
+
+	nouveau_event_put(pdisp->vblank, head, &drm->vblank[head]);
 }
 
 static u64
-- 
1.8.1.2

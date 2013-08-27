From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 3/9] drm/nouveau: Allocate local event handlers
Date: Tue, 27 Aug 2013 16:12:56 -0400
Message-ID: <1377634382-13872-4-git-send-email-peter@hurleysoftware.com>
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

Prepare for transition to RCU-based event handler list;
since RCU list traversal may have stale pointers, local
storage may go out of scope before handler completes.

Introduce nouveau_event_handler_create/_destroy which provides
suitable semantics for multiple, temporary event handlers.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c         | 24 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/core/include/core/event.h |  6 ++++++
 drivers/gpu/drm/nouveau/nouveau_fence.c           | 15 +++++++-------
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index e69c463..1a8d685 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -23,6 +23,30 @@
 #include <core/os.h>
 #include <core/event.h>
 
+int
+nouveau_event_handler_create(struct nouveau_event *event, int index,
+			     int (*func)(struct nouveau_eventh*, int),
+			     void *priv, struct nouveau_eventh **phandler)
+{
+	struct nouveau_eventh *handler;
+
+	handler = *phandler = kzalloc(sizeof(*handler), GFP_KERNEL);
+	if (!handler)
+		return -ENOMEM;
+	handler->func = func;
+	handler->priv = priv;
+	nouveau_event_get(event, index, handler);
+	return 0;
+}
+
+void
+nouveau_event_handler_destroy(struct nouveau_event *event, int index,
+			      struct nouveau_eventh *handler)
+{
+	nouveau_event_put(event, index, handler);
+	kfree(handler);
+}
+
 static void
 nouveau_event_put_locked(struct nouveau_event *event, int index,
 			 struct nouveau_eventh *handler)
diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index ad4d8c2..bdf1a0a 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -34,4 +34,10 @@ void nouveau_event_get(struct nouveau_event *, int index,
 void nouveau_event_put(struct nouveau_event *, int index,
 		       struct nouveau_eventh *);
 
+int nouveau_event_handler_create(struct nouveau_event *, int index,
+				 int (*func)(struct nouveau_eventh*, int),
+				 void *priv, struct nouveau_eventh **);
+void nouveau_event_handler_destroy(struct nouveau_event *, int index,
+				   struct nouveau_eventh *);
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index c2e3167..6dde483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -180,13 +180,14 @@ nouveau_fence_wait_uevent(struct nouveau_fence *fence, bool intr)
 	struct nouveau_channel *chan = fence->channel;
 	struct nouveau_fifo *pfifo = nouveau_fifo(chan->drm->device);
 	struct nouveau_fence_priv *priv = chan->drm->fence;
-	struct nouveau_eventh handler = {
-		.func = nouveau_fence_wait_uevent_handler,
-		.priv = priv,
-	};
-	int ret = 0;
+	struct nouveau_eventh *handler;
+	int ret;
 
-	nouveau_event_get(pfifo->uevent, 0, &handler);
+	ret = nouveau_event_handler_create(pfifo->uevent, 0,
+					   nouveau_fence_wait_uevent_handler,
+					   priv, &handler);
+	if (ret)
+		return ret;
 
 	if (fence->timeout) {
 		unsigned long timeout = fence->timeout - jiffies;
@@ -218,7 +219,7 @@ nouveau_fence_wait_uevent(struct nouveau_fence *fence, bool intr)
 		}
 	}
 
-	nouveau_event_put(pfifo->uevent, 0, &handler);
+	nouveau_event_handler_destroy(pfifo->uevent, 0, handler);
 	if (unlikely(ret < 0))
 		return ret;
 
-- 
1.8.1.2

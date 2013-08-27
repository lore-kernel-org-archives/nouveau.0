From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 1/9] drm/nouveau: Add priv field for event handlers
Date: Tue, 27 Aug 2013 16:12:54 -0400
Message-ID: <1377634382-13872-2-git-send-email-peter@hurleysoftware.com>
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

Provide private field for event handlers exclusive use.
Convert nouveau_fence_wait_uevent() and
nouveau_fence_wait_uevent_handler(); drop struct nouveau_fence_uevent.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/include/core/event.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_fence.c           | 20 +++++++-------------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/gpu/drm/nouveau/core/include/core/event.h
index 9e09440..ad4d8c2 100644
--- a/drivers/gpu/drm/nouveau/core/include/core/event.h
+++ b/drivers/gpu/drm/nouveau/core/include/core/event.h
@@ -7,6 +7,7 @@
 
 struct nouveau_eventh {
 	struct list_head head;
+	void *priv;
 	int (*func)(struct nouveau_eventh *, int index);
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index be31499..c2e3167 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -165,17 +165,11 @@ nouveau_fence_done(struct nouveau_fence *fence)
 	return !fence->channel;
 }
 
-struct nouveau_fence_uevent {
-	struct nouveau_eventh handler;
-	struct nouveau_fence_priv *priv;
-};
-
 static int
-nouveau_fence_wait_uevent_handler(struct nouveau_eventh *event, int index)
+nouveau_fence_wait_uevent_handler(struct nouveau_eventh *handler, int index)
 {
-	struct nouveau_fence_uevent *uevent =
-		container_of(event, struct nouveau_fence_uevent, handler);
-	wake_up_all(&uevent->priv->waiting);
+	struct nouveau_fence_priv *priv = handler->priv;
+	wake_up_all(&priv->waiting);
 	return NVKM_EVENT_KEEP;
 }
 
@@ -186,13 +180,13 @@ nouveau_fence_wait_uevent(struct nouveau_fence *fence, bool intr)
 	struct nouveau_channel *chan = fence->channel;
 	struct nouveau_fifo *pfifo = nouveau_fifo(chan->drm->device);
 	struct nouveau_fence_priv *priv = chan->drm->fence;
-	struct nouveau_fence_uevent uevent = {
-		.handler.func = nouveau_fence_wait_uevent_handler,
+	struct nouveau_eventh handler = {
+		.func = nouveau_fence_wait_uevent_handler,
 		.priv = priv,
 	};
 	int ret = 0;
 
-	nouveau_event_get(pfifo->uevent, 0, &uevent.handler);
+	nouveau_event_get(pfifo->uevent, 0, &handler);
 
 	if (fence->timeout) {
 		unsigned long timeout = fence->timeout - jiffies;
@@ -224,7 +218,7 @@ nouveau_fence_wait_uevent(struct nouveau_fence *fence, bool intr)
 		}
 	}
 
-	nouveau_event_put(pfifo->uevent, 0, &uevent.handler);
+	nouveau_event_put(pfifo->uevent, 0, &handler);
 	if (unlikely(ret < 0))
 		return ret;
 
-- 
1.8.1.2

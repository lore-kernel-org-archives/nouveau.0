From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 7/9] drm/nouveau: Fold nouveau_event_put_locked into caller
Date: Tue, 27 Aug 2013 16:13:00 -0400
Message-ID: <1377634382-13872-8-git-send-email-peter@hurleysoftware.com>
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

nouveau_event_put_locked() only has 1 call site; fold into caller.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index ce0a0ef..45bcb37 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -100,18 +100,6 @@ nouveau_event_handler_destroy(struct nouveau_event *event, int index,
 	kfree_rcu(handler, rcu);
 }
 
-static void
-nouveau_event_put_locked(struct nouveau_event *event, int index,
-			 struct nouveau_eventh *handler)
-{
-	if (__test_and_clear_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
-		if (!--event->index[index].refs) {
-			if (event->disable)
-				event->disable(event, index);
-		}
-	}
-}
-
 void
 nouveau_event_put(struct nouveau_event *event, int index,
 		  struct nouveau_eventh *handler)
@@ -122,7 +110,12 @@ nouveau_event_put(struct nouveau_event *event, int index,
 		return;
 
 	spin_lock_irqsave(&event->lock, flags);
-	nouveau_event_put_locked(event, index, handler);
+	if (__test_and_clear_bit(NVKM_EVENT_ENABLE, &handler->flags)) {
+		if (!--event->index[index].refs) {
+			if (event->disable)
+				event->disable(event, index);
+		}
+	}
 	spin_unlock_irqrestore(&event->lock, flags);
 }
 
-- 
1.8.1.2

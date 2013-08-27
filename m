From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH 2/9] drm/nouveau: Move event index check from critical section
Date: Tue, 27 Aug 2013 16:12:55 -0400
Message-ID: <1377634382-13872-3-git-send-email-peter@hurleysoftware.com>
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

The index_nr field is constant for the lifetime of the event, so
serialized access is unnecessary.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/gpu/drm/nouveau/core/core/event.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/nouveau/core/core/event.c
index 7eb81c1..e69c463 100644
--- a/drivers/gpu/drm/nouveau/core/core/event.c
+++ b/drivers/gpu/drm/nouveau/core/core/event.c
@@ -40,9 +40,11 @@ nouveau_event_put(struct nouveau_event *event, int index,
 {
 	unsigned long flags;
 
+	if (index >= event->index_nr)
+		return;
+
 	spin_lock_irqsave(&event->lock, flags);
-	if (index < event->index_nr)
-		nouveau_event_put_locked(event, index, handler);
+	nouveau_event_put_locked(event, index, handler);
 	spin_unlock_irqrestore(&event->lock, flags);
 }
 
@@ -52,13 +54,14 @@ nouveau_event_get(struct nouveau_event *event, int index,
 {
 	unsigned long flags;
 
+	if (index >= event->index_nr)
+		return;
+
 	spin_lock_irqsave(&event->lock, flags);
-	if (index < event->index_nr) {
-		list_add(&handler->head, &event->index[index].list);
-		if (!event->index[index].refs++) {
-			if (event->enable)
-				event->enable(event, index);
-		}
+	list_add(&handler->head, &event->index[index].list);
+	if (!event->index[index].refs++) {
+		if (event->enable)
+			event->enable(event, index);
 	}
 	spin_unlock_irqrestore(&event->lock, flags);
 }
-- 
1.8.1.2

From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete (v3, final)
Date: Wed, 20 Jan 2010 20:01:30 +0100
Message-ID: <1264014090-18814-1-git-send-email-luca@luca-barbieri.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: airlied-cv59FeDIM0c@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Resending this with Thomas Hellstrom's signoff for merging into 2.6.33

ttm_bo_delayed_delete has a race condition, because after we do:
kref_put(&nentry->list_kref, ttm_bo_release_list);

we are not holding the list lock and not holding any reference to
objects, and thus every bo in the list can be removed and freed at
this point.

However, we then use the next pointer we stored, which is not guaranteed
to be valid.

This was apparently the cause of some Nouveau oopses I experienced.

This patch rewrites the function so that it keeps the reference to nentry
until nentry itself is freed and we already got a reference to nentry->next.

v2 updated by me according to Thomas Hellstrom's feedback.
v3 proposed by Thomas Hellstrom. Commit comment updated by me.

Both updates fixed minor efficiency/style issues only and all three versions
should be correct.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Signed-off-by: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c |   58 ++++++++++++++++++------------------------
 1 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index c7733c3..1a3e909 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -524,52 +524,44 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo, bool remove_all)
 static int ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
 {
 	struct ttm_bo_global *glob = bdev->glob;
-	struct ttm_buffer_object *entry, *nentry;
-	struct list_head *list, *next;
-	int ret;
+	struct ttm_buffer_object *entry = NULL;
+	int ret = 0;
 
 	spin_lock(&glob->lru_lock);
-	list_for_each_safe(list, next, &bdev->ddestroy) {
-		entry = list_entry(list, struct ttm_buffer_object, ddestroy);
-		nentry = NULL;
+	if (list_empty(&bdev->ddestroy))
+		goto out_unlock;
 
-		/*
-		 * Protect the next list entry from destruction while we
-		 * unlock the lru_lock.
-		 */
+	entry = list_first_entry(&bdev->ddestroy,
+		struct ttm_buffer_object, ddestroy);
+	kref_get(&entry->list_kref);
+
+	for (;;) {
+		struct ttm_buffer_object *nentry = NULL;
 
-		if (next != &bdev->ddestroy) {
-			nentry = list_entry(next, struct ttm_buffer_object,
-					    ddestroy);
+		if (entry->ddestroy.next != &bdev->ddestroy) {
+			nentry = list_first_entry(&entry->ddestroy,
+				struct ttm_buffer_object, ddestroy);
 			kref_get(&nentry->list_kref);
 		}
-		kref_get(&entry->list_kref);
 
 		spin_unlock(&glob->lru_lock);
 		ret = ttm_bo_cleanup_refs(entry, remove_all);
 		kref_put(&entry->list_kref, ttm_bo_release_list);
+		entry = nentry;
+
+		if (ret || !entry)
+			goto out;
 
 		spin_lock(&glob->lru_lock);
-		if (nentry) {
-			bool next_onlist = !list_empty(next);
-			spin_unlock(&glob->lru_lock);
-			kref_put(&nentry->list_kref, ttm_bo_release_list);
-			spin_lock(&glob->lru_lock);
-			/*
-			 * Someone might have raced us and removed the
-			 * next entry from the list. We don't bother restarting
-			 * list traversal.
-			 */
-
-			if (!next_onlist)
-				break;
-		}
-		if (ret)
+		if (list_empty(&entry->ddestroy))
 			break;
 	}
-	ret = !list_empty(&bdev->ddestroy);
-	spin_unlock(&glob->lru_lock);
 
+out_unlock:
+	spin_unlock(&glob->lru_lock);
+out:
+	if (entry)
+		kref_put(&entry->list_kref, ttm_bo_release_list);
 	return ret;
 }
 
-- 
1.6.2.5

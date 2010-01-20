From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] drm/ttm: Fix race condition in
	ttm_bo_delayed_delete
Date: Wed, 20 Jan 2010 13:11:52 +0100
Message-ID: <4B56F308.5090603@shipmail.org>
References: <1263840434-9113-1-git-send-email-luca@luca-barbieri.com>	<4B54B949.9010906@vmware.com>	<ff13bc9a1001181433v1694e681l9f7ce9d880132dc3@mail.gmail.com>
	<4B56E8EE.8090706@shipmail.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050703030309070006060502"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B56E8EE.8090706-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, "dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------050703030309070006060502
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Hellstrom wrote:
>
> Yes, it looks correct. Although it seems a little unintuitive to enter 
> the loop with the spinlock held, and exit it with the spinlock not held. 
> I've attached yet another patch to have that fixed. Could you take a 
> look at whether it seems OK with you and, in that case, repost it for Dave?
>
>   
... And the patch.

/Thomas


--------------050703030309070006060502
Content-Type: text/x-patch;
 name="0001-drm-ttm-Fix-race-condition-in-ttm_bo_delayed_delete-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-drm-ttm-Fix-race-condition-in-ttm_bo_delayed_delete-.pa";
 filename*1="tch"

From 68972c220abe3ce19eb046d72fa218646168adc7 Mon Sep 17 00:00:00 2001
From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Date: Mon, 18 Jan 2010 19:34:53 +0100
Subject: [PATCH] drm/ttm: Fix race condition in ttm_bo_delayed_delete (v2)

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

It should now be correct and free of races, but please double check this.

Updated according to Thomas Hellstrom's feedback.

Signed-off-by: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c |   58 ++++++++++++++++++-----------------------
 1 files changed, 26 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 2920f9a..5dfa41f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -523,52 +523,46 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo, bool remove_all)
 static int ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
 {
 	struct ttm_bo_global *glob = bdev->glob;
-	struct ttm_buffer_object *entry, *nentry;
-	struct list_head *list, *next;
-	int ret;
+	struct ttm_buffer_object *entry;
+	int ret = 0;
 
 	spin_lock(&glob->lru_lock);
-	list_for_each_safe(list, next, &bdev->ddestroy) {
-		entry = list_entry(list, struct ttm_buffer_object, ddestroy);
-		nentry = NULL;
+	if (list_empty(&bdev->ddestroy)) {
+		spin_unlock(&glob->lru_lock);
+		return 0;
+	}
 
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
+			break;
 
 		spin_lock(&glob->lru_lock);
-		if (nentry) {
-			bool next_onlist = !list_empty(next);
+		
+		if (list_empty(&entry->ddestroy)) {
 			spin_unlock(&glob->lru_lock);
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
 			break;
+		}
 	}
-	ret = !list_empty(&bdev->ddestroy);
-	spin_unlock(&glob->lru_lock);
 
+	if (entry)
+		kref_put(&entry->list_kref, ttm_bo_release_list);
 	return ret;
 }
 
-- 
1.6.3.3


--------------050703030309070006060502
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050703030309070006060502--

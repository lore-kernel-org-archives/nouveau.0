From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 3/3] drm: revert Nouveau's changes to generic DRM
	code
Date: Thu, 17 Sep 2009 22:08:50 +0300
Message-ID: <1253214530-4502-3-git-send-email-pq@iki.fi>
References: <1253214530-4502-1-git-send-email-pq@iki.fi>
	<1253214530-4502-2-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1253214530-4502-2-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Revert changes to drm_bufs.c and drmP.h to bring the Nouveau kernel tree
in sync with drm-next.

The old changes are not necessary for Nouveau because:
- nothing calls drm_find_matching_map()
- nothing calls drm_addmap() or drm_rmmap()
- nothing calls the drm ADD_MAP ioctl

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/drm_bufs.c |   28 +++++++++++++++++++++-------
 include/drm/drmP.h         |    2 --
 2 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 436e2fe..6246e3f 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -51,24 +51,38 @@ resource_size_t drm_get_resource_len(struct drm_device *dev, unsigned int resour
 
 EXPORT_SYMBOL(drm_get_resource_len);
 
-struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
-					   struct drm_local_map *map)
+static struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
+						  struct drm_local_map *map)
 {
 	struct drm_map_list *entry;
 	list_for_each_entry(entry, &dev->maplist, head) {
+		/*
+		 * Because the kernel-userspace ABI is fixed at a 32-bit offset
+		 * while PCI resources may live above that, we ignore the map
+		 * offset for maps of type _DRM_FRAMEBUFFER or _DRM_REGISTERS.
+		 * It is assumed that each driver will have only one resource of
+		 * each type.
+		 */
 		if (!entry->map ||
 		    map->type != entry->map->type ||
 		    entry->master != dev->primary->master)
 			continue;
-
-		if (entry->map->offset == map->offset ||
-		    (map->type == _DRM_SHM && map->flags & _DRM_CONTAINS_LOCK))
+		switch (map->type) {
+		case _DRM_SHM:
+			if (map->flags != _DRM_CONTAINS_LOCK)
+				break;
+		case _DRM_REGISTERS:
+		case _DRM_FRAME_BUFFER:
+			return entry;
+		default: /* Make gcc happy */
+			;
+		}
+		if (entry->map->offset == map->offset)
 			return entry;
 	}
 
 	return NULL;
 }
-EXPORT_SYMBOL(drm_find_matching_map);
 
 static int drm_map_handle(struct drm_device *dev, struct drm_hash_item *hash,
 			  unsigned long user_token, int hashed_handle, int shm)
@@ -343,7 +357,7 @@ static int drm_addmap_core(struct drm_device * dev, resource_size_t offset,
 	/* We do it here so that dev->struct_mutex protects the increment */
 	user_token = (map->type == _DRM_SHM) ? (unsigned long)map->handle :
 		map->offset;
-	ret = drm_map_handle(dev, &list->hash, user_token, 1,
+	ret = drm_map_handle(dev, &list->hash, user_token, 0,
 			     (map->type == _DRM_SHM));
 	if (ret) {
 		if (map->type == _DRM_REGISTERS)
diff --git a/include/drm/drmP.h b/include/drm/drmP.h
index 1345c39..eeefb63 100644
--- a/include/drm/drmP.h
+++ b/include/drm/drmP.h
@@ -1240,8 +1240,6 @@ extern void drm_idlelock_release(struct drm_lock_data *lock_data);
 extern int drm_i_have_hw_lock(struct drm_device *dev, struct drm_file *file_priv);
 
 				/* Buffer management support (drm_bufs.h) */
-extern struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
-						  drm_local_map_t *map);
 extern int drm_addbufs_agp(struct drm_device *dev, struct drm_buf_desc * request);
 extern int drm_addbufs_pci(struct drm_device *dev, struct drm_buf_desc * request);
 extern int drm_addmap(struct drm_device *dev, resource_size_t offset,
-- 
1.6.3.3

From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 33/37] drm/nouveau: try to protect nbo->pin_refcount
Date: Wed, 12 Dec 2012 14:07:13 +0100
Message-ID: <1355317637-16742-34-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

... by moving the bo_pin/bo_unpin manipulation of the pin_refcount
under the protection of the ttm reservation lock. pin/unpin seems
to get called from all over the place, so atm this is completely racy.

After this patch there are only a few places in cleanup functions
left which access ->pin_refcount without locking. But I'm hoping that
those are safe and some other code invariant guarantees that this
won't blow up.

In any case, I only need to fix up pin/unpin to make ->pageflip work
safely, so let's keep it at that.

Add a comment to the header to explain the new locking rule.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |   22 +++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_bo.h |    2 ++
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4c950b4..2aa4745 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -300,17 +300,18 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t memtype)
 	struct ttm_buffer_object *bo = &nvbo->bo;
 	int ret;
 
+	ret = ttm_bo_reserve(bo, false, false, false, 0);
+	if (ret)
+		goto out;
+
 	if (nvbo->pin_refcnt && !(memtype & (1 << bo->mem.mem_type))) {
 		NV_ERROR(drm, "bo %p pinned elsewhere: 0x%08x vs 0x%08x\n", bo,
 			 1 << bo->mem.mem_type, memtype);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (nvbo->pin_refcnt++)
-		return 0;
-
-	ret = ttm_bo_reserve(bo, false, false, false, 0);
-	if (ret)
 		goto out;
 
 	nouveau_bo_placement_set(nvbo, memtype, 0);
@@ -328,10 +329,8 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t memtype)
 			break;
 		}
 	}
-	ttm_bo_unreserve(bo);
 out:
-	if (unlikely(ret))
-		nvbo->pin_refcnt--;
+	ttm_bo_unreserve(bo);
 	return ret;
 }
 
@@ -342,13 +341,13 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 	struct ttm_buffer_object *bo = &nvbo->bo;
 	int ret;
 
-	if (--nvbo->pin_refcnt)
-		return 0;
-
 	ret = ttm_bo_reserve(bo, false, false, false, 0);
 	if (ret)
 		return ret;
 
+	if (--nvbo->pin_refcnt)
+		goto out;
+
 	nouveau_bo_placement_set(nvbo, bo->mem.placement, 0);
 
 	ret = nouveau_bo_validate(nvbo, false, false, false);
@@ -365,6 +364,7 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 		}
 	}
 
+out:
 	ttm_bo_unreserve(bo);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index dec51b1..cd5631b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -28,6 +28,8 @@ struct nouveau_bo {
 	struct nouveau_drm_tile *tile;
 
 	struct drm_gem_object *gem;
+
+	/* protect by the ttm reservation lock */
 	int pin_refcnt;
 
 	struct ttm_bo_kmap_obj dma_buf_vmap;
-- 
1.7.10.4

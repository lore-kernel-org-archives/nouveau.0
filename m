From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH 6/6] drm/nouveau: remove redundant check in
	nouveau_bo_del_ttm()
Date: Tue,  4 Aug 2009 21:22:46 +0300
Message-ID: <1249410166-4566-6-git-send-email-pq@iki.fi>
References: <1249410166-4566-1-git-send-email-pq@iki.fi>
	<1249410166-4566-2-git-send-email-pq@iki.fi>
	<1249410166-4566-3-git-send-email-pq@iki.fi>
	<1249410166-4566-4-git-send-email-pq@iki.fi>
	<1249410166-4566-5-git-send-email-pq@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1249410166-4566-5-git-send-email-pq-X3B1VOXEql0@public.gmane.org>
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

ttm_bo_kunmap() already checks if the bo is not mapped.

Signed-off-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 442bab7..dc6c3a6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -39,8 +39,7 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
 
-	if (unlikely(nvbo->kmap.virtual))
-		ttm_bo_kunmap(&nvbo->kmap);
+	ttm_bo_kunmap(&nvbo->kmap);
 
 	if (unlikely(nvbo->gem))
 		DRM_ERROR("bo %p still attached to GEM object\n", bo);
-- 
1.6.3.3

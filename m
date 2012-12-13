From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/ttm: fix fence locking in
	ttm_buffer_object_transfer
Date: Thu, 13 Dec 2012 12:26:45 +0100
Message-ID: <1355398005-25775-1-git-send-email-daniel.vetter@ffwll.ch>
References: <1355317637-16742-35-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-35-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
List-Id: nouveau.vger.kernel.org

Noticed while reviewing the fence locking in the radeon pageflip
handler.

v2: Instead of grabbing the bdev->fence_lock in object_transfer just
move the single callsite of that function a few lines, so that it is
protected by the fence_lock. Suggested by Jerome Glisse.

v3: Fix typo in commit message.

Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b9c4e51..c5d83a5 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -654,11 +654,13 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 		 */
 
 		set_bit(TTM_BO_PRIV_FLAG_MOVING, &bo->priv_flags);
+
+		/* ttm_buffer_object_transfer accesses bo->sync_obj */
+		ret = ttm_buffer_object_transfer(bo, &ghost_obj);
 		spin_unlock(&bdev->fence_lock);
 		if (tmp_obj)
 			driver->sync_obj_unref(&tmp_obj);
 
-		ret = ttm_buffer_object_transfer(bo, &ghost_obj);
 		if (ret)
 			return ret;
 
-- 
1.7.10.4

From: maarten.lankhorst@canonical.com
Subject: [PATCH 1/7] drm/nouveau: fix m2mf copy to tiled gart
Date: Tue, 12 Nov 2013 13:34:08 +0100
Message-ID: <1384259656-29483-1-git-send-email-maarten.lankhorst@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: bskeggs@redhat.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

From: Maarten Lankhorst <maarten.lankhorst@canonical.com>

Commit de7b7d59d54852c introduced tiled GART, but a linear copy is
still performed. This may result in errors on eviction, fix it by
checking tiling from memtype.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: stable@vger.kernel.org #3.10+
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f5b0201..639d7cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -803,25 +803,25 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_mem_reg *old_mem, struct ttm_mem_reg *new_mem)
 {
 	struct nouveau_mem *node = old_mem->mm_node;
-	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	u64 length = (new_mem->num_pages << PAGE_SHIFT);
 	u64 src_offset = node->vma[0].offset;
 	u64 dst_offset = node->vma[1].offset;
+	int src_tiled = !!node->memtype;
+	int dst_tiled = !!((struct nouveau_mem *)new_mem->mm_node)->memtype;
 	int ret;
 
 	while (length) {
 		u32 amount, stride, height;
 
+		ret = RING_SPACE(chan, 18 + 6 * (src_tiled + dst_tiled));
+		if (ret)
+			return ret;
+
 		amount  = min(length, (u64)(4 * 1024 * 1024));
 		stride  = 16 * 4;
 		height  = amount / stride;
 
-		if (old_mem->mem_type == TTM_PL_VRAM &&
-		    nouveau_bo_tile_layout(nvbo)) {
-			ret = RING_SPACE(chan, 8);
-			if (ret)
-				return ret;
-
+		if (src_tiled) {
 			BEGIN_NV04(chan, NvSubCopy, 0x0200, 7);
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
@@ -831,19 +831,10 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
 		} else {
-			ret = RING_SPACE(chan, 2);
-			if (ret)
-				return ret;
-
 			BEGIN_NV04(chan, NvSubCopy, 0x0200, 1);
 			OUT_RING  (chan, 1);
 		}
-		if (new_mem->mem_type == TTM_PL_VRAM &&
-		    nouveau_bo_tile_layout(nvbo)) {
-			ret = RING_SPACE(chan, 8);
-			if (ret)
-				return ret;
-
+		if (dst_tiled) {
 			BEGIN_NV04(chan, NvSubCopy, 0x021c, 7);
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
@@ -853,18 +844,10 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 			OUT_RING  (chan, 0);
 			OUT_RING  (chan, 0);
 		} else {
-			ret = RING_SPACE(chan, 2);
-			if (ret)
-				return ret;
-
 			BEGIN_NV04(chan, NvSubCopy, 0x021c, 1);
 			OUT_RING  (chan, 1);
 		}
 
-		ret = RING_SPACE(chan, 14);
-		if (ret)
-			return ret;
-
 		BEGIN_NV04(chan, NvSubCopy, 0x0238, 2);
 		OUT_RING  (chan, upper_32_bits(src_offset));
 		OUT_RING  (chan, upper_32_bits(dst_offset));
-- 
1.8.4

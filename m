From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH] nouveau: apply storage type to gart objects
Date: Fri, 27 Jul 2012 14:13:17 +0200
Message-ID: <501285DD.7000606@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

If you want to access gart as linear, don't specify a non-zero
storage type.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 5b498ea..4642ea7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -1223,7 +1223,9 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 			 struct ttm_mem_reg *mem)
 {
 	struct drm_nouveau_private *dev_priv = nouveau_bdev(bo->bdev);
+	struct nouveau_bo *nvbo = nouveau_bo(bo);
 	struct nouveau_mem *node;
+	uint32_t memtype = nvbo->tile_flags >> 8;
 
 	if (unlikely((mem->num_pages << PAGE_SHIFT) >=
 		     dev_priv->gart_info.aper_size))
@@ -1234,6 +1236,13 @@ nouveau_gart_manager_new(struct ttm_mem_type_manager *man,
 		return -ENOMEM;
 	node->page_shift = 12;
 
+	if (dev_priv->card_type == NV_50) {
+		uint32_t comp = (memtype & 0x300) >> 8;
+		uint32_t type = (memtype & 0x07f);
+		node->memtype = (comp << 7) | type;
+	} else if (dev_priv->card_type >= NV_C0) {
+		node->memtype = memtype & 0xff;
+	}
 	mem->mm_node = node;
 	mem->start   = 0;
 	return 0;

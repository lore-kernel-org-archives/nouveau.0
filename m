From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [kernel PATCH] drm/nouveau: add NOUVEAU_GEM_RELOC_HILO
Date: Wed, 12 Jan 2011 21:43:49 +0100
Message-ID: <1294865031-22457-1-git-send-email-marcin.slusarz@gmail.com>
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

add new relocation flag which allows to halving number of relocation
entries on >= nv50 cards

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_gem.c |   22 +++++++++++++++-------
 include/drm/nouveau_drm.h             |    1 +
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9a1fdcf..2e21412 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -507,6 +507,7 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *dev,
 		struct drm_nouveau_gem_pushbuf_bo *b;
 		struct nouveau_bo *nvbo;
 		uint32_t data;
+		uint32_t data2;
 
 		if (unlikely(r->bo_index > req->nr_buffers)) {
 			NV_ERROR(dev, "reloc bo index invalid\n");
@@ -544,17 +545,22 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *dev,
 
 		if (r->flags & NOUVEAU_GEM_RELOC_LOW)
 			data = b->presumed.offset + r->data;
-		else
-		if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
+		else if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
 			data = (b->presumed.offset + r->data) >> 32;
-		else
+		else if (r->flags & NOUVEAU_GEM_RELOC_HILO) {
+			data = (b->presumed.offset + r->data) >> 32;
+			data2 = b->presumed.offset + r->data;
+		} else
 			data = r->data;
 
 		if (r->flags & NOUVEAU_GEM_RELOC_OR) {
-			if (b->presumed.domain == NOUVEAU_GEM_DOMAIN_GART)
-				data |= r->tor;
-			else
-				data |= r->vor;
+			if (b->presumed.domain == NOUVEAU_GEM_DOMAIN_GART) {
+				data  |= r->tor;
+				data2 |= r->tor;
+			} else {
+				data  |= r->vor;
+				data2 |= r->vor;
+			}
 		}
 
 		spin_lock(&nvbo->bo.lock);
@@ -566,6 +572,8 @@ nouveau_gem_pushbuf_reloc_apply(struct drm_device *dev,
 		}
 
 		nouveau_bo_wr32(nvbo, r->reloc_bo_offset >> 2, data);
+		if (r->flags & NOUVEAU_GEM_RELOC_HILO)
+			nouveau_bo_wr32(nvbo, (r->reloc_bo_offset >> 2) + 1, data2);
 	}
 
 	kfree(reloc);
diff --git a/include/drm/nouveau_drm.h b/include/drm/nouveau_drm.h
index bc5590b..126ea8a 100644
--- a/include/drm/nouveau_drm.h
+++ b/include/drm/nouveau_drm.h
@@ -137,6 +137,7 @@ struct drm_nouveau_gem_pushbuf_bo {
 #define NOUVEAU_GEM_RELOC_LOW  (1 << 0)
 #define NOUVEAU_GEM_RELOC_HIGH (1 << 1)
 #define NOUVEAU_GEM_RELOC_OR   (1 << 2)
+#define NOUVEAU_GEM_RELOC_HILO (1 << 3)
 #define NOUVEAU_GEM_MAX_RELOCS 1024
 struct drm_nouveau_gem_pushbuf_reloc {
 	uint32_t reloc_bo_index;
-- 
1.7.3.3

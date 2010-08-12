From: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Subject: [PATCH] nouveau: expose BO domain in the public API
Date: Thu, 12 Aug 2010 20:57:56 +0200
Message-ID: <1281639476-21290-1-git-send-email-luca@luca-barbieri.com>
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
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This can allow drivers to make better choices.

Since it is just a field appended to a struct, compatibility is preserved.
---
 nouveau/nouveau_bo.c      |    4 ++--
 nouveau/nouveau_bo.h      |    3 +++
 nouveau/nouveau_private.h |    1 -
 nouveau/nouveau_pushbuf.c |    2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 32b23b6..28cf5b3 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -47,7 +47,7 @@ static int
 nouveau_bo_info(struct nouveau_bo_priv *nvbo, struct drm_nouveau_gem_info *arg)
 {
 	nvbo->handle = nvbo->base.handle = arg->handle;
-	nvbo->domain = arg->domain;
+	nvbo->base.domain = arg->domain;
 	nvbo->size = arg->size;
 	nvbo->offset = arg->offset;
 	nvbo->map_handle = arg->map_handle;
@@ -534,7 +534,7 @@ nouveau_bo_emit_buffer(struct nouveau_channel *chan, struct nouveau_bo *bo)
 	pbbo->valid_domains = NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART;
 	pbbo->read_domains = 0;
 	pbbo->write_domains = 0;
-	pbbo->presumed.domain = nvbo->domain;
+	pbbo->presumed.domain = nvbo->base.domain;
 	pbbo->presumed.offset = nvbo->offset;
 	pbbo->presumed.valid = 1;
 	return pbbo;
diff --git a/nouveau/nouveau_bo.h b/nouveau/nouveau_bo.h
index 1e77ab0..932f189 100644
--- a/nouveau/nouveau_bo.h
+++ b/nouveau/nouveau_bo.h
@@ -48,6 +48,9 @@ struct nouveau_bo {
 
 	uint32_t tile_mode;
 	uint32_t tile_flags;
+
+	/* last known information from kernel */
+	uint32_t domain;
 };
 
 int
diff --git a/nouveau/nouveau_private.h b/nouveau/nouveau_private.h
index 53928d2..312fe70 100644
--- a/nouveau/nouveau_private.h
+++ b/nouveau/nouveau_private.h
@@ -122,7 +122,6 @@ struct nouveau_bo_priv {
 
 	/* Last known information from kernel on buffer status */
 	uint64_t offset;
-	uint32_t domain;
 };
 #define nouveau_bo(n) ((struct nouveau_bo_priv *)(n))
 
diff --git a/nouveau/nouveau_pushbuf.c b/nouveau/nouveau_pushbuf.c
index 53da8cf..27f0df2 100644
--- a/nouveau/nouveau_pushbuf.c
+++ b/nouveau/nouveau_pushbuf.c
@@ -211,7 +211,7 @@ nouveau_pushbuf_bo_unref(struct nouveau_pushbuf_priv *nvpb, int index)
 		return;
 
 	if (pbbo->presumed.valid == 0) {
-		nvbo->domain = pbbo->presumed.domain;
+		bo->domain = pbbo->presumed.domain;
 		nvbo->offset = pbbo->presumed.offset;
 	}
 
-- 
1.7.0.4

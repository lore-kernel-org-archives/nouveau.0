From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] nouveau: when nouveau_bo_map fails you expect it
	to not be mapped
Date: Thu, 24 Dec 2009 19:33:46 +0100
Message-ID: <1261679626-24552-1-git-send-email-madman2003@gmail.com>
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

- This includes unmapping on failure to sync for cpu access.
- Double mapping will also be punished, so that people fix their code.
---
 nouveau/nouveau_bo.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/nouveau/nouveau_bo.c b/nouveau/nouveau_bo.c
index 10cc8a6..9a7c368 100644
--- a/nouveau/nouveau_bo.c
+++ b/nouveau/nouveau_bo.c
@@ -415,22 +415,28 @@ nouveau_bo_map_range(struct nouveau_bo *bo, uint32_t delta, uint32_t size,
 		     uint32_t flags)
 {
 	struct nouveau_bo_priv *nvbo = nouveau_bo(bo);
-	int ret;
+	int ret = 0;
 
-	if (!nvbo || bo->map)
+	if (!nvbo)
 		return -EINVAL;
 
+	/* People should not double map, let's make sure they will notice. */
+	if (bo->map) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	if (!nouveau_bo_allocated(nvbo)) {
 		if (nvbo->flags & (NOUVEAU_BO_VRAM | NOUVEAU_BO_GART)) {
 			ret = nouveau_bo_kalloc(nvbo, NULL);
 			if (ret)
-				return ret;
+				goto out;
 		}
 
 		if (!nouveau_bo_allocated(nvbo)) {
 			ret = nouveau_bo_ualloc(nvbo);
 			if (ret)
-				return ret;
+				goto out;
 		}
 	}
 
@@ -439,19 +445,22 @@ nouveau_bo_map_range(struct nouveau_bo *bo, uint32_t delta, uint32_t size,
 	} else {
 		ret = nouveau_bo_kmap(nvbo);
 		if (ret)
-			return ret;
+			goto out;
 
 		if (!(flags & NOUVEAU_BO_NOSYNC)) {
 			ret = nouveau_bo_wait(bo, (flags & NOUVEAU_BO_WR),
 					      (flags & NOUVEAU_BO_NOWAIT), 0);
 			if (ret)
-				return ret;
+				goto out;
 		}
 
 		bo->map = (char *)nvbo->map + delta;
 	}
 
-	return 0;
+out:
+	if (ret)
+		nouveau_bo_unmap(bo);
+	return ret;
 }
 
 void
-- 
1.6.6.rc4
